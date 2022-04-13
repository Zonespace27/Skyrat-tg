#define ARMAMENT_CATEGORY_SCARBOROUGH "Scarborough Arms"

/datum/armament_entry/cargo_gun/scarborough
	category = ARMAMENT_CATEGORY_SCARBOROUGH
	company_bitflag = COMPANY_SCARBOROUGH

/datum/armament_entry/cargo_gun/scarborough/pistol
	subcategory = ARMAMENT_SUBCATEGORY_PISTOL

/datum/armament_entry/cargo_gun/scarborough/pistol/makarov
	item_type = /obj/item/gun/ballistic/automatic/pistol
	lower_cost = CARGO_CRATE_VALUE * 10
	upper_cost = CARGO_CRATE_VALUE * 15

/datum/armament_entry/cargo_gun/scarborough/pistol/aps
	item_type = /obj/item/gun/ballistic/automatic/pistol/aps
	lower_cost = CARGO_CRATE_VALUE * 14
	upper_cost = CARGO_CRATE_VALUE * 18

/datum/armament_entry/cargo_gun/scarborough/shotgun
	subcategory = ARMAMENT_SUBCATEGORY_SHOTGUN

/datum/armament_entry/cargo_gun/scarborough/shotgun/bulldog
	item_type = /obj/item/gun/ballistic/shotgun/bulldog/unrestricted
	lower_cost = CARGO_CRATE_VALUE * 18
	upper_cost = CARGO_CRATE_VALUE * 20

/datum/armament_entry/cargo_gun/scarborough/smg
	subcategory = ARMAMENT_SUBCATEGORY_SUBMACHINEGUN

/datum/armament_entry/cargo_gun/scarborough/smg/c20r
	item_type = /obj/item/gun/ballistic/automatic/c20r/unrestricted
	lower_cost = CARGO_CRATE_VALUE * 20
	upper_cost = CARGO_CRATE_VALUE * 25

/datum/armament_entry/cargo_gun/scarborough/rifle
	subcategory = ARMAMENT_SUBCATEGORY_ASSAULTRIFLE

/datum/armament_entry/cargo_gun/scarborough/rifle/m90gl // Fucking expensive as hell.
	item_type = /obj/item/gun/ballistic/automatic/m90/unrestricted
	lower_cost = CARGO_CRATE_VALUE * 30
	upper_cost = CARGO_CRATE_VALUE * 35

/datum/armament_entry/cargo_gun/scarborough/part
	subcategory = ARMAMENT_SUBCATEGORY_GUNPART

/datum/armament_entry/cargo_gun/scarborough/part/suppressor
	item_type = /obj/item/suppressor
	lower_cost = CARGO_CRATE_VALUE * 10
	upper_cost = CARGO_CRATE_VALUE * 15

/datum/armament_entry/cargo_gun/scarborough/ammo
	subcategory = ARMAMENT_SUBCATEGORY_AMMO

/datum/armament_entry/cargo_gun/scarborough/ammo/grenade
	item_type = /obj/item/ammo_casing/a40mm
	lower_cost = CARGO_CRATE_VALUE * 4
	upper_cost = CARGO_CRATE_VALUE * 6
