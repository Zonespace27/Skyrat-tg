GLOBAL_LIST_EMPTY(repo_bounty_objects)

// Machinery

/obj/machinery/mineral/ore_redemption/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/mineral/ore_redemption/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/rnd/production/techfab/department/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/rnd/production/techfab/department/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/rnd/production/circuit_imprinter/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/rnd/production/circuit_imprinter/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/computer/upload/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/computer/upload/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/dish_drive/bullet/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/dish_drive/bullet/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/ore_silo/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/ore_silo/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/nuclearbomb/selfdestruct/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/nuclearbomb/selfdestruct/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/power/emitter/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/power/emitter/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/field/generator/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/field/generator/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/shieldgen/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/shieldgen/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/power/smes/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/power/smes/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/power/energy_accumulator/tesla_coil/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/power/energy_accumulator/tesla_coil/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/power/energy_accumulator/grounding_rod/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/power/energy_accumulator/grounding_rod/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/portable_atmospherics/canister/plasma/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/portable_atmospherics/canister/plasma/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/atmospherics/components/binary/crystallizer/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/atmospherics/components/binary/crystallizer/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/processor/slime/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/processor/slime/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/monkey_recycler/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/monkey_recycler/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/doppler_array/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/doppler_array/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/research/anomaly_refinery/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/research/anomaly_refinery/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/atmospherics/components/binary/tank_compressor/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/atmospherics/components/binary/tank_compressor/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/mecha_part_fabricator/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/mecha_part_fabricator/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/dna_scannernew/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/dna_scannernew/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/computer/scan_consolenew/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/computer/scan_consolenew/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/computer/operating/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/computer/operating/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/computer/rdconsole/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/computer/rdconsole/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/rnd/destructive_analyzer/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/rnd/destructive_analyzer/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/mech_bay_recharge_port/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/mech_bay_recharge_port/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/computer/mech_bay_power_console/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/computer/mech_bay_power_console/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/mechpad/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/mechpad/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/computer/mechpad/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/computer/mechpad/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/recharging_station/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/recharging_station/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/chem_dispenser/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/chem_dispenser/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/chem_heater/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/chem_heater/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/chem_master/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/chem_master/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/atmospherics/components/unary/cryo_cell/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/atmospherics/components/unary/cryo_cell/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/stasis/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/stasis/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/table/optable/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/table/optable/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/computer/pandemic/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/computer/pandemic/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/computer/teleporter/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/computer/teleporter/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/teleport/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/teleport/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/computer/communications/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/computer/communications/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/computer/security/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/computer/security/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/machinery/computer/secure_data/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/machinery/computer/secure_data/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

// Items

/obj/item/blackbox/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/item/blackbox/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/item/gun/energy/laser/captain/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/item/gun/energy/laser/captain/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/item/gun/energy/e_gun/hos/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/item/gun/energy/e_gun/hos/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/item/card/id/departmental_budget/car/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/item/card/id/departmental_budget/car/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/item/nullrod/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/item/nullrod/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/item/fireaxe/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/item/fireaxe/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/item/hand_tele/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/item/hand_tele/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/item/tank/jetpack/oxygen/captain/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/item/tank/jetpack/oxygen/captain/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/item/clothing/shoes/magboots/advance/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/item/clothing/shoes/magboots/advance/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/item/clothing/accessory/medal/gold/captain/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/item/clothing/accessory/medal/gold/captain/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/item/hypospray/mkii/cmo/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/item/hypospray/mkii/cmo/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/item/clothing/suit/hooded/ablative/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/item/clothing/suit/hooded/ablative/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/item/clothing/suit/armor/reactive/teleport/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/item/clothing/suit/armor/reactive/teleport/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/item/documents/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/item/documents/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/item/areaeditor/blueprints/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/item/areaeditor/blueprints/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/item/pinpointer/nuke/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/item/pinpointer/nuke/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/item/radio/headset/headset_sec/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/item/radio/headset/headset_sec/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/item/radio/headset/heads/captain/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/item/radio/headset/heads/captain/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/item/radio/headset/heads/hop/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/item/radio/headset/heads/hop/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/item/radio/headset/heads/ce/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/item/radio/headset/heads/ce/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/item/radio/headset/heads/rd/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/item/radio/headset/heads/rd/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/item/radio/headset/heads/hos/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/item/radio/headset/heads/hos/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/item/radio/headset/heads/qm/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/item/radio/headset/heads/qm/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/item/radio/headset/heads/cmo/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/item/radio/headset/heads/cmo/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/item/cargo_teleporter/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/item/cargo_teleporter/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/item/laser_pointer/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/item/laser_pointer/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/item/gun/syringe/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/item/gun/syringe/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/item/gun/ballistic/shotgun/doublebarrel/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/item/gun/ballistic/shotgun/doublebarrel/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/item/clothing/gloves/cargo_gauntlet/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/item/clothing/gloves/cargo_gauntlet/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/item/mod/control/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/item/mod/control/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()

/obj/item/clothing/glasses/sunglasses/Initialize(mapload)
	. = ..()
	GLOB.repo_bounty_objects += src

/obj/item/clothing/glasses/sunglasses/Destroy()
	if(GLOB.repo_bounty_objects)
		GLOB.repo_bounty_objects -= src
	return ..()
