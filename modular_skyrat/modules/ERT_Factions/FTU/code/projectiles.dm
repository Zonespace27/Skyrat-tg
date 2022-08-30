/obj/projectile/bullet/pulse/mm65
	name = "6.5mm XJ pulse flechette"
	icon = 'modular_skyrat/modules/ERT_Factions/FTU/icons/weapons/projectiles.dmi'
	icon_state = "pulsebullet"
	damage = 18 //Applied Twice, once BRUTE, once BURN
	speed = 0.7
	wound_bonus = 25
	embedding = list(embed_chance=30, fall_chance=3, jostle_chance=4, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.4, pain_mult=5, jostle_pain_mult=6, rip_time=10)
	armour_penetration = 40
	damage_type = BRUTE //Additionally Deals BURN in on_hit

/obj/projectile/bullet/pulse/mm65/on_hit(atom/target, blocked = FALSE, pierce_hit)
	. = ..()
	//We don't want the burn damage to go through if the bullet itself is stopped
	if (blocked == 100)
		return .

	//Strictly only to things that are living
	if(isliving(target))
		var/mob/living/victim = target
		victim.apply_damage(damage, BURN, def_zone, blocked, wound_bonus = wound_bonus, bare_wound_bonus = bare_wound_bonus, sharpness = sharpness)
		victim.apply_damage((damage*PROJECTILE_TISSUE_DAMAGE_STAMINA_MULTIPLIER), STAMINA, def_zone, blocked)


/obj/item/ammo_casing/pulse/mm65
	name = "6.5mm biodegradable flechette"
	desc = "A biodegradable 6.5mm pulse flechette, it seems to be encased in some sort of inert battery."
	icon = 'modular_skyrat/modules/sec_haul/icons/guns/ammo_cartridges.dmi'
	icon_state = "si-casing"
	caliber = "6.5mm"
	projectile_type = /obj/projectile/bullet/pulse/mm65


/obj/projectile/bullet/pulse/mm72
	name = "7.2mm XJ accelerated pulse flechette"
	icon = 'modular_skyrat/modules/ERT_Factions/FTU/icons/weapons/projectiles.dmi'
	icon_state = "pulsebullet_mg"
	damage = 11 //Applied Twice, once BRUTE, once BURN
	speed = 0.8
	wound_bonus = 60
	embedding = list(embed_chance=80, fall_chance=1, jostle_chance=20, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.4, pain_mult=5, jostle_pain_mult=0.8, rip_time=20)
	armour_penetration = 60
	damage_type = BRUTE //Additionally Deals BURN in on_hit

/obj/projectile/bullet/pulse/mm72/on_hit(atom/target, blocked = FALSE, pierce_hit)
	. = ..()
	//We don't want the burn damage to go through if the bullet itself is stopped
	if (blocked == 100)
		return .

	//Strictly only to things that are living
	if(isliving(target))
		var/mob/living/victim = target
		victim.apply_damage(damage, BURN, def_zone, blocked, wound_bonus = wound_bonus, bare_wound_bonus = bare_wound_bonus, sharpness = sharpness)
		victim.apply_damage((damage*PROJECTILE_TISSUE_DAMAGE_STAMINA_MULTIPLIER), STAMINA, def_zone, blocked)


/obj/item/ammo_casing/pulse/mm72
	name = "7.2mm biodegradable flechette"
	desc = "A biodegradable 7.2mm pulse flechette, it seems to be encased in some sort of inert battery with a heavy base."
	icon = 'modular_skyrat/modules/sec_haul/icons/guns/ammo_cartridges.dmi'
	icon_state = "si-casing"
	caliber = "7.2mm"
	projectile_type = /obj/projectile/bullet/pulse/mm72


/obj/projectile/bullet/pulse/mm12/saphe
	name = "12.7x35mm Saboted AP-HE bullet"
	icon = 'modular_skyrat/modules/ERT_Factions/FTU/icons/weapons/projectiles.dmi'
	icon_state = "pulsebullet"
	damage = 65
	speed = 1.25  //Heavy ass round
	wound_bonus = 90
	embedding = list(embed_chance=10, fall_chance=1, jostle_chance=6, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.4, pain_mult=5, jostle_pain_mult=5, rip_time=80)
	armour_penetration = 40
	damage_type = BRUTE

/obj/item/ammo_casing/pulse/mm12
	name = "12.7x35mm biodegradable sabot"
	desc = "A biodegradable .50 pulse sabot, it seems to be encased in some sort of inert battery."
	icon = 'modular_skyrat/modules/sec_haul/icons/guns/ammo_cartridges.dmi'
	icon_state = "si-casing"
	caliber = "12mm SAP-HE"
	projectile_type = /obj/projectile/bullet/pulse/mm12/saphe

/obj/item/ammo_casing/pulse/mm112
	name = "11.2x94mm biodegradable sabot"
	desc = "A biodegradable 11.2mm casing for some obscure rifle."
	icon = 'modular_skyrat/modules/sec_haul/icons/guns/ammo_cartridges.dmi'
	icon_state = "si-casing"
	caliber = "11.2mm"
	projectile_type = /obj/projectile/bullet/pulse/mm112

/obj/item/ammo_casing/pulse/mm112/knock
	name = "11.2x94mm biodegradable sabot"
	desc = "A biodegradable 11.2mm casing for some obscure rifle."
	icon_state = "si-casing"
	projectile_type = /obj/projectile/bullet/pulse/mm112/knock

/obj/item/ammo_casing/pulse/mm112/incend
	name = "11.2x94mm biodegradable sabot"
	desc = "A biodegradable 11.2mm casing for some obscure rifle."
	icon_state = "si-casing"
	projectile_type = /obj/projectile/bullet/incendiary/mm112

/obj/projectile/bullet/pulse/mm112
	name = "11.2x94mm \"Penetrator\" casing"
	icon = 'modular_skyrat/modules/ERT_Factions/FTU/icons/weapons/projectiles.dmi'
	icon_state = "pulsebullet"
	damage = 65
	speed = 1
	wound_bonus = 90
	embedding = list(embed_chance=5, fall_chance=1, jostle_chance=6, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.4, pain_mult=5, jostle_pain_mult=5, rip_time=80)
	armour_penetration = 50
	damage_type = BRUTE
	projectile_piercing = PASSMOB|PASSVEHICLE
	projectile_phasing = ~(PASSMOB|PASSVEHICLE)
	phasing_ignore_direct_target = TRUE

/obj/projectile/bullet/pulse/mm112/knock
	name = "11.2x94mm \"Knockdown\" casing"
	icon_state = "pulsebullet"
	damage = 20
	speed = 1.1
	wound_bonus = 10
	embedding = null
	armour_penetration = 10
	damage_type = BRUTE
	projectile_piercing = null
	projectile_phasing = null
	phasing_ignore_direct_target = FALSE
	knockdown = 2.5 SECONDS
	stun = 1 SECONDS

/obj/projectile/bullet/pulse/mm112/knock/on_hit(atom/target, blocked, pierce_hit)
	. = ..()
	if(ismob(target))
		var/mob/mob_target = target
		mob_target.throw_at(get_ranged_target_turf(target, get_dir(src, get_step_away(target, src)), 2), 200, 4)

/obj/projectile/bullet/incendiary/mm112
	name = "11.2x94mm \"Firestarter\" casing"
	icon_state = "pulsebullet"
	damage = 20
	speed = 1.1
	wound_bonus = 0
	embedding = null
	armour_penetration = 0
	damage_type = BURN
	leaves_fire_trail = FALSE
	fire_stacks = 4 //maybe change

/obj/item/ammo_casing/caseless/rocket/anti_armor
	name = "\improper PM-9AA"
	desc = "An 84mm Anti-Armor rocket. Fire at the biggest thing you can see, and hope."
	icon_state = "srm-8"
	projectile_type = /obj/projectile/bullet/a84mm/aa

/obj/projectile/bullet/a84mm/aa
	name ="\improper AA missile"
	desc = "Boom."
	icon_state = "missile"
	damage = 120
	anti_armour_damage = 350

/obj/projectile/bullet/a84mm/aa/do_boom(atom/target, blocked=0)
	explosion(target, heavy_impact_range = 1, flame_range = 1, flash_range = 2,  explosion_cause = src)

/obj/item/ammo_casing/caseless/rocket/white_phosphor
	name = "\improper PM-9IN"
	desc = "An 84mm incendiary rocket. User discretion advised."
	icon_state = "srm-8"
	projectile_type = /obj/projectile/bullet/a84mm/inc

/obj/projectile/bullet/a84mm/inc
	name ="\improper WP missile"
	desc = "Boom."
	icon_state = "missile"
	damage = 40 //probably'd still hurt
	anti_armour_damage = 10

/obj/projectile/bullet/a84mm/inc/do_boom(atom/target, blocked=0)
	playsound(src, 'sound/effects/smoke.ogg', 50, TRUE, -3)
	var/datum/effect_system/fluid_spread/smoke/bad/white_phosphorus/smoke = new
	smoke.set_up(4, holder = src, location = src)
	smoke.start()
	qdel(smoke) //And deleted again. Sad really.

/datum/effect_system/fluid_spread/smoke/bad/white_phosphorus
	effect_type = /obj/effect/particle_effect/fluid/smoke/bad/white_phosphorus

/obj/effect/particle_effect/fluid/smoke/bad/white_phosphorus //war crime time
	lifetime = 8 SECONDS

/obj/effect/particle_effect/fluid/smoke/bad/white_phosphorus/smoke_mob(mob/living/carbon/smoker)
	smoker.adjust_fire_stacks(2) //dunno
	smoker.ignite_mob()
