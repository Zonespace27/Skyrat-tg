/datum/repo_claim_category
	var/name = "Default Cat"
	/// How many of these per cylce
	var/amount = 3

/datum/repo_claim_category/proc/generate_our_claims()
	return

/datum/repo_claim_category/machinery
	name = "Machinery Category"

/datum/repo_claim_category/machinery/generate_our_claims()
	for(var/i in 1 to amount)
		var/does_path_exist = FALSE
		var/bounty_path
		do
			bounty_path = pick(SSrepossession_agent.machine_bounties)
			does_path_exist = locate(bounty_path) in SSrepossession_agent.current_bounty_objects
		while(!does_path_exist)
		SSrepossession_agent.current_claims += new /datum/repo_claim(bounty_path, SSrepossession_agent.machine_bounties)

/datum/repo_claim_category/items
	name = "Item Category"

/datum/repo_claim_category/items/generate_our_claims()
	for(var/i in 1 to amount)
		var/does_path_exist = FALSE
		var/bounty_path
		do
			bounty_path = pick(SSrepossession_agent.item_bounties)
			does_path_exist = locate(bounty_path) in SSrepossession_agent.current_bounty_objects
		while(!does_path_exist)
		SSrepossession_agent.current_claims += new /datum/repo_claim(bounty_path, SSrepossession_agent.item_bounties)

/datum/repo_claim_category/organs
	name = "Organ Category"

/datum/repo_claim_category/organs/generate_our_claims()
	var/list/target_list = get_target_list()
	for(var/i in 1 to amount)
		SSrepossession_agent.current_claims += new /datum/repo_claim(repo_target = pick(target_list), override_difficulty = BOUNTY_TIER_HARD)

/datum/repo_claim_category/organs/proc/get_target_list()
	var/list/possible_targets = list()
	for(var/datum/mind/possible_target in get_crewmember_minds())
		var/target_area = get_area(possible_target.current)
		if(!ishuman(possible_target.current))
			continue
		if(possible_target.current.stat == DEAD)
			continue
		if(!HAS_TRAIT(SSstation, STATION_TRAIT_LATE_ARRIVALS) && istype(target_area, /area/shuttle/arrival))
			continue
		if(SSticker.IsRoundInProgress() && istype(target_area, /area/centcom/interlink))
			continue
		if(is_type_in_typecache(target_area, typecacheof(list(/area/space, /area/ruin, /area/icemoon, /area/lavaland))))
			continue
		possible_targets += possible_target
	var/list/all_possible_targets = possible_targets.Copy()
	for(var/target in all_possible_targets)
		var/datum/mind/target_mind = target
		if(!target_mind.late_joiner)
			possible_targets -= target
	if(!possible_targets.len)
		possible_targets = all_possible_targets
	return possible_targets
