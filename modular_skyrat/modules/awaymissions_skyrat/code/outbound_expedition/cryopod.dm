/obj/machinery/outbound_expedition/cryopod
	name = "cryogenic freezer"
	desc = "A cryogenic pod that slows down body functions, enabling long-term journeys with minimal impact to the user.."
	icon = 'modular_skyrat/modules/cryosleep/icons/cryogenics.dmi'
	icon_state = "cryopod-open"
	density = TRUE
	anchored = TRUE
	state_open = TRUE


/obj/machinery/outbound_expedition/cryopod/close_machine(atom/movable/target)
	OUTBOUND_CONTROLLER
	if((isnull(target) || isliving(target)) && state_open && !panel_open)
		..(target)
		var/mob/living/mob_occupant = occupant
		if(mob_occupant && mob_occupant.stat != DEAD)
			to_chat(occupant, span_notice("<b>You feel cool air surround you. You go numb as your senses turn inward.</b>"))

	SEND_SIGNAL(outbound_controller, COMSIG_AWAY_CRYOPOD_ENTERED, target)

	icon_state = "cryopod"

/obj/machinery/outbound_expedition/cryopod/open_machine()
	OUTBOUND_CONTROLLER
	for(var/mob/living/internal_mob in contents)
		SEND_SIGNAL(outbound_controller, COMSIG_AWAY_CRYOPOD_EXITED, internal_mob)
	..()
	icon_state = "cryopod-open"
	set_density(TRUE)
	name = initial(name)

/obj/machinery/outbound_expedition/cryopod/container_resist_act(mob/living/user)
	visible_message(span_notice("[occupant] emerges from [src]!"),
		span_notice("You climb out of [src]!"))
	open_machine()

/obj/machinery/outbound_expedition/cryopod/relaymove(mob/user)
	container_resist_act(user)

/obj/machinery/outbound_expedition/cryopod/MouseDrop_T(mob/living/target, mob/user)
	if(!istype(target) || !can_interact(user) || !target.Adjacent(user) || !ismob(target) || isanimal(target) || !istype(user.loc, /turf) || target.buckled)
		return

	if(occupant)
		to_chat(user, span_notice("[src] is already occupied!"))
		return

	if(target.stat == DEAD)
		to_chat(user, span_notice("Dead people can not be put into cryo."))
		return

	if(tgui_alert(user, "Would you like to place [target] into [src]?", "Place into Cryopod?", list("Yes", "No")) != "No")
		to_chat(user, span_danger("You put [target] into [src]. [target.p_theyre(capitalized = TRUE)] in the cryopod."))

		add_fingerprint(target)

		close_machine(target)
		name = "[name] ([target.name])"

	if(LAZYLEN(target.buckled_mobs) > 0)
		if(target == user)
			to_chat(user, span_danger("You can't fit into the cryopod while someone is buckled to you."))
		else
			to_chat(user, span_danger("You can't fit [target] into the cryopod while someone is buckled to them."))
		return

	if(!istype(target) || !can_interact(user) || !target.Adjacent(user) || !ismob(target) || isanimal(target) || !istype(user.loc, /turf) || target.buckled)
		return
		// rerun the checks in case of shenanigans

	if(occupant)
		to_chat(user, span_notice("[src] is already occupied!"))
		return

	if(target == user)
		visible_message(span_infoplain("[user] starts climbing into the cryo pod."))
	else
		visible_message(span_infoplain("[user] starts putting [target] into the cryo pod."))

	add_fingerprint(target)

	close_machine(target)
	name = "[name] ([target.name])"
