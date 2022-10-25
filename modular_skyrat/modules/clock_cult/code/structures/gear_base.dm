/obj/structure/destructible/clockwork/gear_base
	name = "gear base"
	desc = "A large cog lying on the floor at feet level."
	icon_state = "gear_base"
	clockwork_desc = "A large cog lying on the floor at feet level."
	anchored = FALSE
	break_message = span_warning("Oh, that broke. I guess you could report it to the coders, or just you know ignore this message and get on with killing those god damn heretics coming to break the Ark.")
	/// What's appeneded to the structure when unanchored
	var/unwrenched_suffix = "_unwrenched"
	/// Lazylist of nearby transmission signals
	var/list/transmission_sigils
	/// Makes sure the depowered proc is only called when its depowered and not while its depowered
	var/depowered = FALSE
	/// Minimum power to work
	var/minimum_power = 0


// UNCOMMENT TRANSMISSION SIGIL CODE WHEN IT IS ADDED

/obj/structure/destructible/clockwork/gear_base/Initialize(mapload)
	. = ..()
	update_icon_state()
	LAZYINITLIST(transmission_sigils)
//	for(var/obj/structure/destructible/clockwork/sigil/transmission/ST in range(src, SIGIL_TRANSMISSION_RANGE))
//		link_to_sigil(ST)

/obj/structure/destructible/clockwork/gear_base/Destroy()
//	for(var/obj/structure/destructible/clockwork/sigil/transmission/ST as anything in transmission_sigils)
//		ST.linked_structures -= src
	return ..()

/obj/structure/destructible/clockwork/gear_base/wrench_act(mob/living/user, obj/item/tool)
	if(!(FACTION_CLOCK in user.faction))
		return
	to_chat(user, span_notice("You begin to [anchored ? "unwrench" : "wrench"] [src]."))
	if(!tool.use_tool(src, user, 2 SECONDS, volume = 50))
		return
	to_chat(user, span_notice("You successfully [anchored ? "unwrench" : "wrench"] [src]."))
	anchored = !anchored
	update_icon_state()
	return TRUE

/obj/structure/destructible/clockwork/gear_base/update_icon_state()
	. = ..()
	icon_state = initial(icon_state)
	if(!anchored)
		icon_state += unwrenched_suffix
/*
/// Adds a sigil to the linked structure list
/obj/structure/destructible/clockwork/gear_base/proc/link_to_sigil(obj/structure/destructible/clockwork/sigil/transmission/sigil)
	LAZYOR(transmission_sigils, sigil)
	sigil.linked_structures |= src

/// Removes a sigil from the linked structure list
/obj/structure/destructible/clockwork/gear_base/proc/unlink_to_sigil(obj/structure/destructible/clockwork/sigil/transmission/sigil)
	if(!LAZYFIND(transmission_sigils, sigil))
		return
	LAZYREMOVE(transmission_sigils, sigil)
	sigil.linked_structures -= src
	if(!LAZYLEN(transmission_sigils))
		depowered()
		depowered = TRUE*/

//Power procs, for all your power needs, that is... if you have any

/// Checks if there's enough power to power it, calls repower() if changed from depowered to powered, vice versa
/obj/structure/destructible/clockwork/gear_base/proc/update_power()
	if(depowered)
		if(GLOB.clock_power > minimum_power && LAZYLEN(transmission_sigils))
			repowered()
			depowered = FALSE
			return TRUE
		return FALSE
	else
		if(GLOB.clock_power <= minimum_power || !LAZYLEN(transmission_sigils))
			depowered()
			depowered = TRUE
			return FALSE
		return TRUE

/// Checks if there's equal or greater power to the amount arg, TRUE if so, FALSE otherwise
/obj/structure/destructible/clockwork/gear_base/proc/check_power(amount)
	if(!LAZYLEN(transmission_sigils))
		return FALSE
	if(depowered)
		return FALSE
	if(GLOB.clock_power < amount)
		return FALSE
	return TRUE

/// Uses power if there's enough to do so
/obj/structure/destructible/clockwork/gear_base/proc/use_power(amount)
	update_power()
	if(!check_power(amount))
		return FALSE
	GLOB.clock_power -= amount
	update_power()
	return TRUE

/// Lost power
/obj/structure/destructible/clockwork/gear_base/proc/depowered()
	return

/// Gained power
/obj/structure/destructible/clockwork/gear_base/proc/repowered()
	return
