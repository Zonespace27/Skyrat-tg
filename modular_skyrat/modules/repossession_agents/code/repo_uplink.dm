// God forgive me for the sins I will commit in this file by subtyping a component
/datum/component/uplink/repo_agent

/datum/component/uplink/repo_agent/Initialize(
	owner,
	lockable = TRUE,
	enabled = FALSE,
	uplink_flag = UPLINK_TRAITORS,
	starting_tc = TELECRYSTALS_DEFAULT,
	has_progression = FALSE,
	datum/uplink_handler/uplink_handler_override,
)
	. = ..()
	if(!istype(parent, /obj/item/implant))
		parent.AddComponent(/datum/component/repo_claimer, 10 SECONDS, src)

/datum/component/uplink/repo_agent/load_tc(mob/user, obj/item/stack/telecrystal/telecrystals, silent)
	to_chat(user, span_warning("This uplink isn't configured to take telecrystals!"))
	return

/datum/component/uplink/repo_agent/ui_data(mob/user)
	if(!user.mind)
		return
	var/list/data = list()

	var/list/current_claims = list()
	for(var/datum/repo_claim/active_claim as anything in SSrepossession_agent.current_claims)
		current_claims += list(list(
			"name" = active_claim.name,
			"reward_name" = initial(active_claim.reward_path.name),
			"claim_location" = active_claim.claim_location,
			"claimed" = active_claim.claimed
		))
	return data
