// Exists as a faster but more obvious version of their uplink
/obj/item/device/repossession_beacon
	name = "repossession beacon"
	desc = "A handheld remote used by Syndicate Repossession Agents to quickly beacon out objects."
	icon = 'icons/obj/device.dmi'
	icon_state = "locator" //placeholder

/obj/item/device/repossession_beacon/Initialize(mapload, datum/component/uplink/repo_agent/repo_uplink)
	. = ..()
	AddComponent(/datum/component/repo_claimer, 5 SECONDS, repo_uplink) //half the time for a massive "IM A BAD MAN" tell

/obj/item/device/repossession_beacon/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "RepoUplink", name)
		ui.open()

/obj/item/device/repossession_beacon/ui_data(mob/user)
	. = ..()
	var/list/data = list()
	var/list/current_claims = list()
	for(var/datum/repo_claim/active_claim as anything in SSrepossession_agent.current_claims)
		current_claims += list(list(
			"name" = active_claim.name,
			"reward_name" = initial(active_claim.reward_path.name),
			"claim_location" = active_claim.claim_location,
			"claimed" = active_claim.claimed
		))
	data["current_claims"] = current_claims
	return data
