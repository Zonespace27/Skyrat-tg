/datum/component/repo_claimer
	/// Time to claim an object when you hit it
	var/claim_time = 10 SECONDS
	/// Relevant uplink
	var/datum/component/uplink/repo_agent/repo_uplink

/datum/component/repo_claimer/Initialize(
	claim_time,
	datum/component/uplink/repo_agent/repo_uplink
)
	if(!isitem(parent))
		return COMPONENT_INCOMPATIBLE
	src.claim_time = claim_time
	src.repo_uplink = repo_uplink
	RegisterSignal(parent, list(COMSIG_ITEM_ATTACK, COMSIG_ITEM_ATTACK_OBJ), .proc/try_claim)

/datum/component/repo_claimer/proc/try_claim(obj/item/source, atom/movable/target, mob/user)
	if(!(target in SSrepossession_agent.current_bounty_objects))
		return
	for(var/datum/repo_claim/active_claim as anything in SSrepossession_agent.current_claims)
		if(active_claim.claimed)
			continue // not a break in case there's multiple bounties with the same reward
		if(ishuman(target) && active_claim.organ_target)
			var/mob/living/carbon/human/human_target = target
			var/obj/item/organ/found_organ = locate() in human_target.internal_organs
			if(!found_organ)
				continue
			yoink_the_object(found_organ, active_claim, user)
			break
		if(!istype(target, active_claim.to_claim_path))
			continue
		if(active_claim && !istype(get_area(target), active_claim.claim_location))
			continue
		yoink_the_object(target, active_claim, user)
		break

/datum/component/repo_claimer/proc/yoink_the_object(obj/object_to_take, datum/repo_claim/relevant_claim, mob/user)
	playsound(get_turf(object_to_take), 'sound/machines/click.ogg', 50, TRUE)
	if(!do_after(user, 10 SECONDS, object_to_take))
		return
	playsound(get_turf(object_to_take), 'sound/weapons/emitter2.ogg', 25, TRUE)
	qdel(object_to_take)
	relevant_claim.claimed = TRUE
	user.put_in_hands(new relevant_claim.reward_path)
