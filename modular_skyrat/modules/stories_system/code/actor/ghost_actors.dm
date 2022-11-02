/datum/story_actor/ghost
	ghost_actor = TRUE
	/// Delay between getting ghosts spawned in the setup box and going in
	var/delay_time = 5 MINUTES

/datum/story_actor/ghost/handle_spawning(mob/picked_spawner, datum/story_type/current_story)
	. = ..()
	if(!.)
		return FALSE
	to_chat(picked_spawner, span_info("You will be spawned in within [delay_time / 600] minutes with your currently selected character. Make sure all your preferences are set!"))
	to_chat(picked_spawner, span_info(span_bold("Until then, you will be teleported to an area to set up your character and coordinate with other story participants. This area is OOC, but do not grief.")))
	var/obj/landmark
	for(var/obj/effect/landmark/ghost_story_participant/actor_spawn in GLOB.landmarks_list)
		if(actor_spawn.actor_id != actor_spawn_id)
			continue
		landmark = actor_spawn
		break
	// Handling for reserving a new area
	if(!landmark)
		var/datum/map_template/actor_spawn/new_actor = new
		var/datum/turf_reservation/reservation_area = SSmapping.RequestBlockReservation(new_actor.width, new_actor.height, SSmapping.transit.z_value, /datum/turf_reservation/transit)
		if(!reservation_area)
			CRASH("failed to reserve an area for actor spawning")
		var/turf/bottom_left = TURF_FROM_COORDS_LIST(reservation_area.bottom_left_coords)
		new_actor.load(bottom_left, centered = FALSE)
		var/list/affected = new_actor.get_affected_turfs(bottom_left, centered=FALSE)
		for(var/turf/affected_turf as anything in affected)
			for(var/obj/effect/landmark/ghost_story_participant/actor_spawn in affected_turf)
				actor_spawn.actor_id = actor_spawn_id
		for(var/obj/effect/landmark/ghost_story_participant/actor_spawn in GLOB.landmarks_list)
			if(actor_spawn.actor_id != actor_spawn_id)
				continue
			landmark = actor_spawn
			break
		if(!landmark)
			CRASH("failed to find an actor spawn ID landmark after making a template that should've assigned one!")
	// Spawning the actor
	var/mob/living/carbon/human/temporary_human = new(get_turf(landmark))
	temporary_human.key = picked_spawner.key
	temporary_human.client?.prefs?.safe_transfer_prefs_to(temporary_human)
	current_story.mind_actor_list[temporary_human.mind] = src
	info_button = new(src)
	info_button.Grant(temporary_human)
	addtimer(CALLBACK(src, .proc/send_them_in, temporary_human), delay_time)

/// Ghost ones are delayed by a few minutes to ensure that the ghosts have time to choose a character and for crew actors to get settled a bit
/datum/story_actor/ghost/proc/send_them_in(mob/living/carbon/human/to_send_human)
	to_send_human.equipOutfit(pick(actor_outfits))



/datum/story_actor/ghost/centcom_inspector
	name = "Central Command Inspector"
	actor_outfits = list(/datum/outfit/centcom_inspector,)
	actor_info = "You are an inspector from Central Command on a surprise inspection of the station. Inspect things, pick out issues, and make a good report for CentCom."
	actor_goal = "Inspect the station, make a report, and send it to CentCom when done."

/datum/story_actor/ghost/centcom_inspector/send_them_in(mob/living/carbon/human/to_send_human)
	to_send_human.client?.prefs?.safe_transfer_prefs_to(to_send_human)
	. = ..()
	var/area/station/command/bridge/bridge_area = GLOB.areas_by_type[/area/station/command/bridge]
	var/list/bridge_tiles = list()
	for(var/turf/open/floor/floor_tile in bridge_area)
		bridge_tiles += floor_tile
	to_send_human.revive(full_heal = TRUE, admin_revive = TRUE)
	podspawn(list(
		"target" = pick(bridge_tiles),
		"style" = STYLE_CENTCOM,
		"spawn" = to_send_human,
	))

/datum/story_actor/ghost/centcom_inspector/syndicate
	name = "Syndicate Centcom Inspector"
	actor_outfits = list(
		/datum/outfit/syndicate_inspector/nuke_core,
		/datum/outfit/syndicate_inspector/sm_sliver,
		/datum/outfit/syndicate_inspector/rd_server,
	)
	actor_info = "You are a Syndicate agent who assumed the identity of a CentCom inspector. You have a goal to steal %ITEM%, and have been equipped with a radio implant, storage implant, and a box of equipment depending on what you need to steal. Keep things calm and try not to blow your cover while doing your objective."
	actor_goal = "Steal %ITEM% while maintaining your cover as a CentCom inspector."
	/// Outfit we're going to use, used for %ITEM% replacetext
	var/actor_picked_outfit

/datum/story_actor/ghost/centcom_inspector/syndicate/handle_spawning(mob/picked_spawner, datum/story_type/current_story)
	actor_picked_outfit = pick(actor_outfits)
	var/datum/outfit/syndicate_inspector/initial_datum = actor_picked_outfit
	actor_info = replacetext(actor_info, "%ITEM%", initial(initial_datum.steal_item))
	actor_goal = replacetext(actor_goal, "%ITEM%", initial(initial_datum.steal_item))
	return ..()

/datum/story_actor/ghost/centcom_inspector/syndicate/send_them_in(mob/living/carbon/human/to_send_human)
	to_send_human.client?.prefs?.safe_transfer_prefs_to(to_send_human)
	to_send_human.equipOutfit(actor_picked_outfit)
	var/area/station/command/bridge/bridge_area = GLOB.areas_by_type[/area/station/command/bridge]
	var/list/bridge_tiles = list()
	for(var/turf/open/floor/floor_tile in bridge_area)
		bridge_tiles += floor_tile
	to_send_human.revive(full_heal = TRUE, admin_revive = TRUE)
	podspawn(list(
		"target" = pick(bridge_tiles),
		"style" = STYLE_CENTCOM,
		"spawn" = to_send_human,
	))

/datum/story_actor/ghost/mafioso
	name = "Mafioso"
	actor_outfits = list(/datum/outfit/mafioso)
	actor_info = "Nyeh, see? Looks like some two-bit small-timer over on this 'ere station owes the boss some money, so shake %NAME% up for the twenty big ones they owe."
	actor_goal = "Extort %NAME% out of the 20k they owe."

/datum/story_actor/ghost/mafioso/handle_spawning(mob/picked_spawner, datum/story_type/current_story)
	var/datum/story_type/somewhat_impactful/mob_money/mob_story = involved_story
	actor_info = replacetext(actor_info, "%NAME%", mob_story?.poor_sod?.real_name)
	actor_goal = replacetext(actor_goal, "%NAME%", mob_story?.poor_sod?.real_name)
	return ..()

/datum/story_actor/ghost/mafioso/send_them_in(mob/living/carbon/human/to_send_human)
	to_send_human.client?.prefs?.safe_transfer_prefs_to(to_send_human)
	. = ..()
	var/list/possible_spawns = list()
	for(var/turf/turf_spawn as anything in GLOB.xeno_spawn)
		if(istype(turf_spawn.loc, /area/station/maintenance))
			possible_spawns += turf_spawn
	if(!length(possible_spawns))
		return
	to_send_human.forceMove(pick(possible_spawns))

