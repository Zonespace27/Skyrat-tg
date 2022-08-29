#define EASY_BOUNTY_LOW 1
#define EASY_BOUNTY_HIGH 4

#define MEDIUM_BOUNTY_LOW 4
#define MEDIUM_BOUNTY_HIGH 8

#define HARD_BOUNTY_LOW 8
#define HARD_BOUNTY_HIGH 13

#define VERYHARD_BOUNTY_LOW 11
#define VERYHARD_BOUNTY_HIGH 99

#define HIGH_RISK_AREA_MULT 1.25
#define HIGH_RISK_JOB_MULT 1.25
#define VERY_HIGH_RISK_JOB_MULT 1.5

/datum/repo_claim
	var/name = ""
	var/obj/to_claim_path
	var/obj/reward_path
	var/area/claim_location
	var/mob/living/carbon/human/organ_target
	var/difficulty_tier
	var/low_tc_reward = 0
	var/high_tc_reward = 1
	var/claimed = FALSE
	/// Typecache of high-risk locations that give more rewards
	var/static/list/high_risk_areas = typecacheof(list(/area/station/security, /area/station/command))
	/// List of high-risk jobs that give more rewards when they're a target
	var/static/list/high_risk_jobs = list(
		/datum/job/security_officer,
		/datum/job/security_medic,
		/datum/job/research_director,
		/datum/job/chief_engineer,
		/datum/job/chief_medical_officer,
		/datum/job/head_of_personnel,
		/datum/job/quartermaster,
		)
	/// List of VERY high-risk jobs that give extreme rewards when they're a target
	var/static/list/very_high_risk_jobs = list(
		/datum/job/captain,
		/datum/job/nanotrasen_consultant,
		/datum/job/blueshield,
		/datum/job/head_of_security,
	)

/datum/repo_claim/New(bounty_path, category_list, has_location = FALSE, mob/repo_target, override_difficulty)
	. = ..()
	if(bounty_path)
		to_claim_path = bounty_path
		difficulty_tier = category_list[bounty_path]
		name = initial(to_claim_path.name)
	if(override_difficulty)
		difficulty_tier = override_difficulty
	if(has_location)
		claim_location = select_claim_area()
	if(repo_target)
		organ_target = repo_target
		var/list/organs_n_limbs = organ_target.internal_organs.Copy()// + organ_target.bodyparts.Copy() - list(/obj/item/bodypart/head, /obj/item/bodypart/chest) //Make sure this works
		to_claim_path = pick(organs_n_limbs)
		name = "[organ_target.real_name]'s [initial(to_claim_path.name)]"

	get_reward_cost()
	reward_path = select_claim_reward()

/datum/repo_claim/proc/select_claim_area()
	var/found = FALSE
	while(!found)
		var/area/dropoff_area = pick(GLOB.sortedAreas)
		if(dropoff_area && (dropoff_area.type in GLOB.the_station_areas) && !dropoff_area.outdoors)
			found = TRUE
			return dropoff_area

/datum/repo_claim/proc/select_claim_reward()
	var/list/uplink_items = list()
	for(var/datum/uplink_item/item_path as anything in SStraitor.uplink_items_by_type)
		var/datum/uplink_item/item = SStraitor.uplink_items_by_type[item_path]
		if(!(item.purchasable_from & UPLINK_TRAITORS))
			continue

		if((item.cost >= low_tc_reward) && item.cost <= high_tc_reward)
			uplink_items += item
	return pick(uplink_items)

/datum/repo_claim/proc/get_reward_cost()
	switch(difficulty_tier)
		if(BOUNTY_TIER_EASY)
			low_tc_reward = EASY_BOUNTY_LOW
			high_tc_reward = EASY_BOUNTY_HIGH
		if(BOUNTY_TIER_MEDIUM)
			low_tc_reward = MEDIUM_BOUNTY_LOW
			high_tc_reward = MEDIUM_BOUNTY_HIGH
		if(BOUNTY_TIER_HARD)
			low_tc_reward = HARD_BOUNTY_LOW
			high_tc_reward = HARD_BOUNTY_HIGH
		if(BOUNTY_TIER_VERYHARD)
			low_tc_reward = VERYHARD_BOUNTY_LOW
			high_tc_reward = VERYHARD_BOUNTY_HIGH
	var/multiplier = get_area_difficulty() + get_target_difficulty()
	low_tc_reward = round(low_tc_reward * multiplier)
	high_tc_reward = round(high_tc_reward * multiplier)

/datum/repo_claim/proc/get_area_difficulty()
	. = 1
	if(!claim_location)
		return .
	if(is_type_in_typecache(claim_location, high_risk_areas))
		. *= HIGH_RISK_AREA_MULT
	return .

/datum/repo_claim/proc/get_target_difficulty()
	. = 1
	if(!organ_target)
		return .
	if(is_type_in_list(organ_target?.mind?.assigned_role, very_high_risk_jobs))
		. *= VERY_HIGH_RISK_JOB_MULT
	else if(is_type_in_list(organ_target?.mind?.assigned_role, high_risk_jobs))
		. *= HIGH_RISK_JOB_MULT
	return .

#undef EASY_BOUNTY_LOW
#undef EASY_BOUNTY_HIGH

#undef MEDIUM_BOUNTY_LOW
#undef MEDIUM_BOUNTY_HIGH

#undef HARD_BOUNTY_LOW
#undef HARD_BOUNTY_HIGH

#undef VERYHARD_BOUNTY_LOW
#undef VERYHARD_BOUNTY_HIGH

#undef HIGH_RISK_AREA_MULT
#undef HIGH_RISK_JOB_MULT
#undef VERY_HIGH_RISK_JOB_MULT
