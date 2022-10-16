/datum/outfit/clock
	name = "Default Clock Cultist"

	uniform = /obj/item/clothing/under/occult //meh.
	suit = /obj/item/clothing/suit/clockwork/cloak
	shoes = /obj/item/clothing/shoes/clockwork
	gloves = /obj/item/clothing/gloves/clockwork
	back = /obj/item/storage/backpack/satchel/flat/empty
	backpack_contents = list(
		/obj/item/storage/box/survival = 1,
		/obj/item/stack/sheet/bronze = 10,
		/obj/item/storage/medkit/emergency = 1,
	)

/datum/outfit/clock/pre_equip(mob/living/carbon/human/equip_human, visualsOnly)
	equip_human.faction |= FACTION_CLOCK
	var/datum/action/innate/clock/comm/communicate = new
	communicate.Grant(equip_human)

/datum/outfit/clock/armor
	name = "Armored Clock Cultist"

	suit = /obj/item/clothing/suit/clockwork
	head = /obj/item/clothing/head/helmet/clockwork
	glasses = /obj/item/clothing/glasses/clockwork/judicial_visor/no_damage
	l_hand = /obj/item/clockwork/weapon/brass_battlehammer

/datum/outfit/clock/archer
	name = "Archer Clock Cultist"

	suit = /obj/item/clothing/suit/clockwork/speed
	head = /obj/item/clothing/head/helmet/clockwork
	glasses = /obj/item/clothing/glasses/clockwork/judicial_visor/no_damage
	l_hand = /obj/item/gun/ballistic/bow/clockwork

/datum/outfit/clock/gun
	name = "Seer Clock Cultist"

	glasses = /obj/item/clothing/glasses/clockwork/wraith_spectacles
	suit = /obj/item/clothing/suit/clockwork
	l_pocket = /obj/item/storage/bag/ammo/clock
	r_pocket = /obj/item/storage/bag/ammo/clock
	l_hand = /obj/item/gun/ballistic/rifle/lionhunter/clockwork

/datum/outfit/clock/support
	name = "Support Clock Cultist" //find better name

	suit = /obj/item/clothing/suit/clockwork
	head = /obj/item/clothing/head/helmet/clockwork
	glasses = /obj/item/clothing/glasses/clockwork/judicial_visor/no_damage
	belt = /obj/item/storage/belt/utility/clock
	l_hand = /obj/item/clockwork/weapon/brass_sword
	r_hand = /obj/item/clockwork/replica_fabricator
	backpack_contents = list(
		/obj/item/storage/box/survival = 1,
		/obj/item/stack/sheet/bronze = 50,
		/obj/item/storage/medkit/advanced = 1,
		/obj/item/storage/medkit/regular = 1,
	)
