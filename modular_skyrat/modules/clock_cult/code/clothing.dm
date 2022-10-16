/obj/item/clothing/suit/clockwork
	name = "bronze armor"
	desc = "A strong, bronze suit worn by the soldiers of the Ratvarian armies."
	icon = 'modular_skyrat/modules/clock_cult/icons/clockwork_garb.dmi'
	worn_icon = 'modular_skyrat/modules/clock_cult/icons/clockwork_garb_worn.dmi'
	icon_state = "clockwork_cuirass"
	armor = list(MELEE = 50, BULLET = 60, LASER = 30, ENERGY = 80, BOMB = 80, BIO = 100, FIRE = 100, ACID = 100)
	slowdown = 0.6
	resistance_flags = FIRE_PROOF | ACID_PROOF
	w_class = WEIGHT_CLASS_BULKY
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	allowed = list(/obj/item/clockwork, /obj/item/stack/tile/bronze, /obj/item/gun/ballistic/bow/clockwork, /obj/item/gun/ballistic/rifle/lionhunter/clockwork)

/obj/item/clothing/suit/clockwork/equipped(mob/living/user, slot)
	. = ..()
	if(FACTION_CLOCK in user.faction)
		return
	user.dropItemToGround(src, TRUE)
	user.electrocute_act(25, src, 1, SHOCK_NOGLOVES)

/obj/item/clothing/suit/clockwork/speed
	name = "robes of divinity"
	desc = "A shiny suit, glowing with a vibrant energy. The wearer will be able to move quickly across battlefields, but will be able to withstand less damage before falling."
	icon_state = "clockwork_cuirass_speed"
	slowdown = -0.3
	supports_variations_flags = NONE //undo once halc gets me it
	resistance_flags = FIRE_PROOF | ACID_PROOF
	armor = list(MELEE = 40, BULLET = 40, LASER = 10, ENERGY = -20, BOMB = 60, BIO = 100, FIRE = 100, ACID = 100)

/obj/item/clothing/suit/clockwork/cloak
	name = "shrouding cloak"
	desc = "A faltering cloak that bends light around it, distorting the user's appearance, making it hard to see them with the naked eye. However, it provides very little protection."
	icon_state = "clockwork_cloak"
	armor = list(MELEE = 10, BULLET = 60, LASER = 40, ENERGY = 20, BOMB = 40, BIO = 100, FIRE = 100, ACID = 100)
	actions_types = list(/datum/action/item_action/toggle/clock)
	slowdown = 0.4
	resistance_flags = FIRE_PROOF | ACID_PROOF
	supports_variations_flags = NONE
	/// Is the shroud itself active or not
	var/shroud_active = FALSE
	/// Previous alpha value of the user when removing/disabling the jacket
	var/previous_alpha
	/// Who is wearing this
	var/mob/living/wearer

/obj/item/clothing/suit/clockwork/cloak/Destroy()
	wearer = null
	return ..()

/obj/item/clothing/suit/clockwork/cloak/attack_self(mob/user, modifiers)
	. = ..()
	if(shroud_active)
		disable()
	else
		enable()

/obj/item/clothing/suit/clockwork/cloak/equipped(mob/user, slot)
	. = ..()
	if(slot != ITEM_SLOT_OCLOTHING || !(FACTION_CLOCK in user.faction))
		return
	wearer = user
	if(shroud_active)
		enable()

/obj/item/clothing/suit/clockwork/cloak/dropped(mob/user)
	..()
	if(!shroud_active)
		disable()
	wearer = null

/obj/item/clothing/suit/clockwork/cloak/proc/enable()
	shroud_active = TRUE
	previous_alpha = wearer.alpha
	animate(wearer, alpha = 140, time = 3 SECONDS)
	apply_wibbly_filters(wearer)
	ADD_TRAIT(wearer, TRAIT_UNKNOWN, CLOTHING_TRAIT)

/obj/item/clothing/suit/clockwork/cloak/proc/disable()
	shroud_active = FALSE
	do_sparks(3, FALSE, wearer)
	remove_wibbly_filters(wearer)
	animate(wearer, alpha = previous_alpha, time = 3 SECONDS)
	REMOVE_TRAIT(wearer, TRAIT_UNKNOWN, CLOTHING_TRAIT)

/obj/item/clothing/glasses/clockwork
	name = "base clock glasses"
	icon = 'modular_skyrat/modules/clock_cult/icons/clockwork_garb.dmi'
	worn_icon = 'modular_skyrat/modules/clock_cult/icons/clockwork_garb_worn.dmi'
	icon_state = "clockwork_cuirass"
	/// What additional desc to show if the person examining is a clock cultist
	var/clock_desc = ""

/obj/item/clothing/glasses/clockwork/examine(mob/user)
	. = ..()
	if(clock_desc)
		. += span_brass(clock_desc)

/obj/item/clothing/glasses/clockwork/equipped(mob/user, slot)
	. = ..()
	if(FACTION_CLOCK in user.faction)
		return
	user.dropItemToGround(src, TRUE)
	if(isliving(user))
		var/mob/living/living_user = user
		living_user.electrocute_act(25, src, 1, SHOCK_NOGLOVES)

// Thermal goggles, no protection from eye stuff
/obj/item/clothing/glasses/clockwork/wraith_spectacles
	name = "wraith spectacles"
	desc = "Mystical glasses that glow with a bright energy. Some say they can see things that shouldn't be seen."
	icon_state = "wraith_specs"
	invis_view = SEE_INVISIBLE_OBSERVER
	invis_override = null
	flash_protect = FLASH_PROTECTION_SENSITIVE
	vision_flags = SEE_MOBS
	lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_VISIBLE
	glass_colour_type = /datum/client_colour/glass_colour/yellow
	actions_types = list(/datum/action/item_action/toggle/clock)
	clock_desc = "Applies passive eye damage that regenerates after unequipping, grants thermal vision, and lets you see all forms of invisibility."
	/// Who is currently wearing the goggles
	var/mob/living/wearer
	/// How much eye damage has been applied
	var/applied_eye_damage
	/// Are the glasses enabled (flipped down)
	var/enabled = TRUE

/obj/item/clothing/glasses/clockwork/wraith_spectacles/Initialize(mapload)
	. = ..()
	update_icon_state()

/obj/item/clothing/glasses/clockwork/wraith_spectacles/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/clothing/glasses/clockwork/wraith_spectacles/update_icon_state()
	. = ..()
	icon_state = "[initial(icon_state)]_[!enabled]"
	worn_icon_state = "[initial(icon_state)]_[!enabled]"

/obj/item/clothing/glasses/clockwork/wraith_spectacles/attack_self(mob/user, modifiers)
	. = ..()
	if(enabled)
		disable()
	else
		enable()
	if(iscarbon(user))
		var/mob/living/carbon/carbon_user = user
		carbon_user.head_update(src, forced = TRUE)

/obj/item/clothing/glasses/clockwork/wraith_spectacles/proc/enable()
	enabled = TRUE
	lighting_alpha = initial(lighting_alpha)
	visor_toggling()
	if(wearer)
		on_toggle_eyes()
	update_icon_state()

/obj/item/clothing/glasses/clockwork/wraith_spectacles/proc/disable()
	enabled = FALSE
	lighting_alpha = 0
	visor_toggling() //this doesn't remove everything, check later
	if(wearer)
		de_toggle_eyes()
	update_icon_state()

/obj/item/clothing/glasses/clockwork/wraith_spectacles/proc/on_toggle_eyes()
	wearer.update_sight()
	applied_eye_damage = 0
	START_PROCESSING(SSobj, src)
	to_chat(wearer, span_nezbere("You suddenly see so much more, but your eyes begin to falter..."))

/obj/item/clothing/glasses/clockwork/wraith_spectacles/proc/de_toggle_eyes()
	wearer.update_sight()
	to_chat(wearer, span_nezbere("You feel your eyes slowly recovering."))
	addtimer(CALLBACK(wearer, /mob/living.proc/adjustOrganLoss, ORGAN_SLOT_EYES, -applied_eye_damage), 60 SECONDS)
	applied_eye_damage = 0
	STOP_PROCESSING(SSobj, src)

/obj/item/clothing/glasses/clockwork/wraith_spectacles/equipped(mob/living/user, slot)
	. = ..()
	if(!isliving(user))
		return
	if((slot == ITEM_SLOT_EYES) && enabled)
		wearer = user
		on_toggle_eyes()

/obj/item/clothing/glasses/clockwork/wraith_spectacles/process(delta_time)
	. = ..()
	if(!wearer)
		STOP_PROCESSING(SSobj, src)
		return
	//~1 damage every 2 seconds, maximum of 70 after 140 seconds
	wearer.adjustOrganLoss(ORGAN_SLOT_EYES, 0.5*delta_time, 70)
	applied_eye_damage = min(applied_eye_damage + 1, 70)

/obj/item/clothing/glasses/clockwork/wraith_spectacles/dropped(mob/user)
	..()
	if(wearer && (FACTION_CLOCK in user.faction) && enabled)
		de_toggle_eyes()
		wearer = null

// Flash protected and generally info-granting with huds
/obj/item/clothing/glasses/clockwork/judicial_visor
	name = "judicial visor"
	desc = "A purple visor gilt with Ratvarian runes, allowing a user to see, unfettered by others. The cogs on the sides look pretty tight..."
	icon_state = "judicial_visor"
	flash_protect = FLASH_PROTECTION_WELDER
	strip_delay = 10 SECONDS
	glass_colour_type = /datum/client_colour/glass_colour/purple
	actions_types = list(/datum/action/item_action/toggle/clock)
	clock_desc = "Binds itself to the wearer's face, but grants large sight and informational benefits while active."
	/// Is this enabled
	var/enabled = TRUE
	/// Wearer of the visor
	var/mob/living/wearer
	/// Should the user take damage from wearing this the first time? (Doesn't affect nodrop)
	var/damaging = TRUE

/obj/item/clothing/glasses/clockwork/judicial_visor/Initialize(mapload)
	. = ..()
	update_icon_state()

/obj/item/clothing/glasses/clockwork/judicial_visor/Destroy()
	wearer = null
	return ..()

/obj/item/clothing/glasses/clockwork/judicial_visor/update_icon_state()
	. = ..()
	icon_state = "[initial(icon_state)]_[enabled]"
	worn_icon_state = "[initial(icon_state)]_[enabled]"

/obj/item/clothing/glasses/clockwork/judicial_visor/attack_self(mob/user, modifiers)
	. = ..()
	if(enabled)
		disable()
	else
		enable()
	if(iscarbon(user))
		var/mob/living/carbon/carbon_user = user
		carbon_user.head_update(src, forced = TRUE)

/obj/item/clothing/glasses/clockwork/judicial_visor/proc/enable()
	enabled = TRUE
	if(wearer)
		apply_to_wearer()
	update_icon_state()

/obj/item/clothing/glasses/clockwork/judicial_visor/proc/disable()
	enabled = FALSE
	if(wearer)
		unapply_to_wearer()
	update_icon_state()

/obj/item/clothing/glasses/clockwork/judicial_visor/proc/apply_to_wearer()
	ADD_TRAIT(wearer, TRAIT_NOFLASH, CLOTHING_TRAIT)
	ADD_TRAIT(wearer, TRAIT_MEDICAL_HUD, CLOTHING_TRAIT)
	var/datum/atom_hud/med_hud = GLOB.huds[DATA_HUD_MEDICAL_ADVANCED]
	med_hud.show_to(wearer)
	ADD_TRAIT(wearer, TRAIT_SECURITY_HUD, CLOTHING_TRAIT)
	var/datum/atom_hud/sec_hud = GLOB.huds[DATA_HUD_SECURITY_ADVANCED]
	sec_hud.show_to(wearer)
	ADD_TRAIT(wearer, TRAIT_MADNESS_IMMUNE, CLOTHING_TRAIT)
	ADD_TRAIT(wearer, TRAIT_KNOW_ENGI_WIRES, CLOTHING_TRAIT)
	ADD_TRAIT(wearer, TRAIT_KNOW_CYBORG_WIRES, CLOTHING_TRAIT)

/obj/item/clothing/glasses/clockwork/judicial_visor/proc/unapply_to_wearer()
	REMOVE_TRAIT(wearer, TRAIT_NOFLASH, CLOTHING_TRAIT)
	REMOVE_TRAIT(wearer, TRAIT_MEDICAL_HUD, CLOTHING_TRAIT)
	var/datum/atom_hud/med_hud = GLOB.huds[DATA_HUD_MEDICAL_ADVANCED]
	med_hud.hide_from(wearer)
	REMOVE_TRAIT(wearer, TRAIT_SECURITY_HUD, CLOTHING_TRAIT)
	var/datum/atom_hud/sec_hud = GLOB.huds[DATA_HUD_SECURITY_ADVANCED]
	sec_hud.hide_from(wearer)
	REMOVE_TRAIT(wearer, TRAIT_MADNESS_IMMUNE, CLOTHING_TRAIT)
	REMOVE_TRAIT(wearer, TRAIT_KNOW_ENGI_WIRES, CLOTHING_TRAIT)
	REMOVE_TRAIT(wearer, TRAIT_KNOW_CYBORG_WIRES, CLOTHING_TRAIT)

/obj/item/clothing/glasses/clockwork/judicial_visor/equipped(mob/living/user, slot)
	. = ..()
	if(!isliving(user))
		return
	if(slot == ITEM_SLOT_EYES)
		wearer = user
		if(enabled)
			apply_to_wearer()
		ADD_TRAIT(src, TRAIT_NODROP, CLOTHING_TRAIT)
		to_chat(wearer, span_userdanger("You feel the cogs on the visor clamp to the sides of your head, drilling in!"))
		if(damaging)
			wearer.emote("scream")
			wearer.Sleeping(5 SECONDS)
			wearer.apply_damage(20, BRUTE, BODY_ZONE_HEAD)

/obj/item/clothing/glasses/clockwork/judicial_visor/dropped(mob/user)
	..()
	if(wearer)
		unapply_to_wearer()
		wearer = null
		REMOVE_TRAIT(src, TRAIT_NODROP, CLOTHING_TRAIT)

/obj/item/clothing/glasses/clockwork/judicial_visor/no_damage //ideally use this for loadouts n such
	damaging = FALSE

/obj/item/clothing/head/helmet/clockwork
	name = "brass helmet"
	desc = "A strong, brass helmet worn by the soldiers of the Ratvarian armies. Includes an integrated light-dimmer for flash protection, as well as occult-grade muffling for factory based environments."
	icon = 'modular_skyrat/modules/clock_cult/icons/clockwork_garb.dmi'
	worn_icon = 'modular_skyrat/modules/clock_cult/icons/clockwork_garb_worn.dmi'
	icon_state = "clockwork_helmet"
	armor = list(MELEE = 50, BULLET = 60, LASER = 30, ENERGY = 80, BOMB = 80, BIO = 100, FIRE = 100, ACID = 100)
	resistance_flags = FIRE_PROOF | ACID_PROOF
	w_class = WEIGHT_CLASS_BULKY
	flash_protect = FLASH_PROTECTION_FLASH

/obj/item/clothing/head/helmet/clockwork/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_HEAD))

/obj/item/clothing/head/helmet/clockwork/equipped(mob/user, slot)
	. = ..()
	if(FACTION_CLOCK in user.faction)
		return
	user.dropItemToGround(src, TRUE)
	if(isliving(user))
		var/mob/living/living_user = user
		living_user.electrocute_act(25, src, 1, SHOCK_NOGLOVES)

/obj/item/clothing/shoes/clockwork
	name = "brass treads"
	desc = "A strong pair of brass boots worn by the soldiers of the Ratvarian armies."
	icon = 'modular_skyrat/modules/clock_cult/icons/clockwork_garb.dmi'
	worn_icon = 'modular_skyrat/modules/clock_cult/icons/clockwork_garb_worn.dmi'
	icon_state = "clockwork_treads"

/obj/item/clothing/gloves/clockwork
	name = "brass gauntlets"
	desc = "A strong pair of brass gloves worn by the soldiers of the Ratvarian armies."
	icon = 'modular_skyrat/modules/clock_cult/icons/clockwork_garb.dmi'
	worn_icon = 'modular_skyrat/modules/clock_cult/icons/clockwork_garb_worn.dmi'
	icon_state = "clockwork_gauntlets"
	siemens_coefficient = 0
	strip_delay = 8 SECONDS
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = NONE
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 80, ACID = 50)
