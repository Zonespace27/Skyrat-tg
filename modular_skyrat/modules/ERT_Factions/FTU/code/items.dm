/obj/item/melee/energy/ignis
	name = "\improper FTU 'Ignis' plasma sword"
	desc = "An expensive FTU design, the Ignis is one of many prototypes at making an energy sword out of plasma, rather than hardlight. This one has the FTU flag imprinted on its high-quality wooden hilt, and unlike earlier models, can sustain several hits without exhausting its battery. "
	icon = 'modular_skyrat/modules/ERT_Factions/FTU/icons/weapons/serviceguns.dmi'
	icon_state = "ignis"
	lefthand_file = 'modular_skyrat/modules/ERT_Factions/FTU/icons/weapons/lefthand.dmi'
	righthand_file = 'modular_skyrat/modules/ERT_Factions/FTU/icons/weapons/righthand.dmi'
	force = 3
	active_force = 48
	block_chance = 65
	sharpness = SHARP_EDGED
	throwforce = 5
	active_throwforce = 40
	wound_bonus = 50
	hitsound = 'modular_skyrat/modules/ERT_Factions/FTU/sound/ignis_hit.ogg'
	throw_speed = 4
	throw_range = 10
	w_class = WEIGHT_CLASS_SMALL
	active_w_class = WEIGHT_CLASS_HUGE
	armour_penetration = 90
	attack_verb_continuous = list("rips", "evaporates", "penetrates", "tears", "lacerates", "impales", "masterfully brutalizes")
	attack_verb_simple = list("rip", "evaporate", "penetrate", "tear", "lacerate", "impale", "masterfully brutalize")
	resistance_flags = FIRE_PROOF
	damtype = BURN
	enable_sound = 'modular_skyrat/modules/ERT_Factions/FTU/sound/ignis_toggle.ogg'
	disable_sound = 'modular_skyrat/modules/ERT_Factions/FTU/sound/ignis_toggle.ogg'

/obj/item/melee/energy/ignis/make_transformable()
	AddComponent(/datum/component/transforming, \
		force_on = active_force, \
		throwforce_on = active_throwforce, \
		throw_speed_on = throw_speed, \
		sharpness_on = sharpness, \
		w_class_on = active_w_class)
	RegisterSignal(src, COMSIG_TRANSFORMING_ON_TRANSFORM, .proc/on_transform)

// 40x32 R37 PULSE RIFLE
/obj/item/gun/ballistic/automatic/pitbull/pulse/r37
	name = "\improper Xan-Jing R37 'Killer Hornet' pulse rifle"
	desc = "A Xan-Jing Armories pulse rifle, nicknamed 'Killer Hornet' by FTU Mercenaries and Expeditioners. This one has an integrated computer that displays an objective compass, ammo counter and comes with a HUD link for easy targetting."
	icon = 'modular_skyrat/modules/ERT_Factions/FTU/icons/weapons/serviceguns.dmi'
	righthand_file = 'modular_skyrat/modules/ERT_Factions/FTU/icons/weapons/lefthand.dmi'
	lefthand_file = 'modular_skyrat/modules/ERT_Factions/FTU/icons/weapons/lefthand.dmi'
	inhand_icon_state = "killerhornet_lefthand"
	icon_state = "killerhornet"
	worn_icon = 'modular_skyrat/modules/ERT_Factions/FTU/icons/weapons/serviceguns.dmi'
	worn_icon_state = "killerhornet_worn"
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK | ITEM_SLOT_OCLOTHING
	mag_type = /obj/item/ammo_box/magazine/pulse/r37
	fire_delay = 4
	can_suppress = FALSE
	burst_size = 5
	spread = 3
	mag_display = TRUE
	mag_display_ammo = TRUE
	realistic = TRUE
	fire_sound = 'modular_skyrat/modules/ERT_Factions/FTU/sound/r37.ogg'
	emp_damageable = FALSE
	can_bayonet = FALSE
	mag_type = /obj/item/ammo_box/magazine/pulse/r37
	company_flag = null

/obj/item/ammo_box/magazine/pulse/r37
	name = "6.5mm XJP box magazine"
	icon = 'modular_skyrat/modules/ERT_Factions/FTU/icons/weapons/mags.dmi'
	icon_state = "hornet"
	ammo_type = /obj/item/ammo_casing/pulse/mm65
	caliber = "6.5mm"
	max_ammo = 36


// 40x32 R40 MACHINE GUN
/obj/item/gun/ballistic/automatic/pitbull/pulse/r40
	name = "\improper Xan-Jing R40 'Enforcer' pulse MMG"
	desc = "A Xan-Jing Armories medium machine gun, nicknamed 'Enforcer' by FTU Mercenaries and Private Militaries. This one has a custom wood furnishing and its batteries power up the sights."
	icon = 'modular_skyrat/modules/ERT_Factions/FTU/icons/weapons/serviceguns.dmi'
	righthand_file = 'modular_skyrat/modules/ERT_Factions/FTU/icons/weapons/righthand.dmi'
	lefthand_file = 'modular_skyrat/modules/ERT_Factions/FTU/icons/weapons/righthand.dmi'
	inhand_icon_state = "enforcer_righthand"
	icon_state = "enforcer"
	worn_icon = 'modular_skyrat/modules/ERT_Factions/FTU/icons/weapons/serviceguns.dmi'
	worn_icon_state = "killerhornet_worn"
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/pulse/r40
	fire_delay = 1
	can_suppress = FALSE
	burst_size = 8
	spread = 5
	mag_display = TRUE
	mag_display_ammo = FALSE
	realistic = TRUE
	fire_sound = 'modular_skyrat/modules/ERT_Factions/FTU/sound/r40.ogg'
	emp_damageable = FALSE
	can_bayonet = FALSE
	mag_type = /obj/item/ammo_box/magazine/pulse/r40
	company_flag = null

/obj/item/ammo_box/magazine/pulse/r40
	name = "7.2mm XJP belted box"
	icon = 'modular_skyrat/modules/ERT_Factions/FTU/icons/weapons/mags.dmi'
	icon_state = "enforcer"
	ammo_type = /obj/item/ammo_casing/pulse/mm72
	caliber = "7.2mm"
	max_ammo = 140

// 12.7 SAPHE GOLDEN EAGLE
/obj/item/gun/ballistic/automatic/pistol/pdh/pulse/golden_eagle
	name = "\improper FTU PDH-6G 'Sea Serpent' magnum"
	desc = "A custom-made high-power combat pistol seen in the hands of high ranking FTU Mercenaries and important executives, with a custom 24-karat gold finish and green laser sight. It has a chinese dragon engraved along its slide."
	icon = 'modular_skyrat/modules/ERT_Factions/FTU/icons/weapons/serviceguns.dmi'
	icon_state = "eagle"
	can_suppress = FALSE
	mag_display = TRUE
	fire_sound = 'modular_skyrat/modules/ERT_Factions/FTU/sound/serpent_fire.ogg'
	fire_sound_volume = 100
	rack_sound = 'modular_skyrat/modules/ERT_Factions/FTU/sound/magnum_slide.ogg'
	lock_back_sound = 'sound/weapons/gun/pistol/slide_lock.ogg'
	bolt_drop_sound = 'sound/weapons/gun/pistol/slide_drop.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/pulse/mm12/saphe
	can_suppress = FALSE
	fire_delay = 25 //Mind your wrists.
	fire_sound_volume = 110
	rack_sound_volume = 110
	spread = 1
	realistic = TRUE
	emp_damageable = FALSE

/obj/item/gun/ballistic/automatic/pistol/pdh/pulse/golden_eagle/add_seclight_point()
	return

/obj/item/ammo_box/magazine/pulse/mm12/saphe
	name = "12.7x35mm SAP-HE magnum magazine"
	icon_state = "50ae"
	ammo_type = /obj/item/ammo_casing/pulse/mm12
	caliber = "12mm SAP-HE"
	max_ammo = 12

/obj/item/gun/ballistic/automatic/sniper_rifle/pulse
	name = "\improper FTU big gun"
	desc = "A long ranged weapon capable of loading specialist ammunition."
	icon_state = "sniper"
	w_class = WEIGHT_CLASS_BULKY
	inhand_icon_state = "sniper"
	worn_icon_state = null
	fire_sound = 'sound/weapons/gun/sniper/shot.ogg'
	fire_sound_volume = 90
	vary_fire_sound = FALSE
	load_sound = 'sound/weapons/gun/sniper/mag_insert.ogg'
	rack_sound = 'sound/weapons/gun/sniper/rack.ogg'
	suppressed_sound = 'sound/weapons/gun/general/heavy_shot_suppressed.ogg'
	recoil = 2
	weapon_weight = WEAPON_HEAVY
	mag_type = /obj/item/ammo_box/magazine/pulse_sniper
	fire_delay = 40
	burst_size = 1
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BACK
	fire_select_modes = list(SELECT_SEMI_AUTOMATIC)
	mag_display = TRUE
	suppressor_x_offset = 3
	suppressor_y_offset = 3

/obj/item/ammo_box/magazine/pulse_sniper
	name = "11.2mm \"Penetrator\" magazine"
	desc = "A strange caliber, this magazine's painted with a red stripe."
	icon_state = ".50mag"
	base_icon_state = ".50mag"
	ammo_type = /obj/projectile/bullet/pulse/mm112
	max_ammo = 10
	caliber = "11.2mm" //god i need to make thse into defines some time

/obj/item/ammo_box/magazine/pulse_sniper/fire
	name = "11.2mm \"Firestarter\" magazine"
	desc = "A strange caliber, this magazine's painted with an orange stripe."
	ammo_type = /obj/projectile/bullet/incendiary/mm112

/obj/item/ammo_box/magazine/pulse_sniper/knock
	name = "11.2mm \"Knockdown\" magazine"
	desc = "A strange caliber, this magazine's painted with a deep blue stripe."
	ammo_type = /obj/projectile/bullet/pulse/mm112/knock
