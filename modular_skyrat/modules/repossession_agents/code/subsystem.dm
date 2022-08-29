SUBSYSTEM_DEF(repossession_agent)
	name = "Repossession Agent"
	flags = SS_KEEP_TIMING
	wait = 10 SECONDS
	runlevels = RUNLEVEL_GAME | RUNLEVEL_POSTGAME
	/// List of all claim category datums, generated on initialize
	var/list/claim_types = list()
	/// List of current claim datums up for grabs
	var/static/list/current_claims = list()
	/// List of machine bounties and their bounty tier
	var/static/list/machine_bounties = list( //To prevent people being lame, perhaps only let it count for already-built objects
		/obj/machinery/ore_silo = BOUNTY_TIER_HARD,
		/obj/machinery/nuclearbomb/selfdestruct = BOUNTY_TIER_VERYHARD, // maybe?
		/obj/machinery/computer/upload/ai = BOUNTY_TIER_HARD,
		/obj/machinery/computer/upload/borg = BOUNTY_TIER_HARD,
		/obj/machinery/dish_drive/bullet = BOUNTY_TIER_HARD,
		/obj/machinery/rnd/production/techfab/department/service = BOUNTY_TIER_EASY,
		/obj/machinery/rnd/production/techfab/department/engineering = BOUNTY_TIER_MEDIUM,
		/obj/machinery/rnd/production/techfab/department/cargo = BOUNTY_TIER_EASY,
		/obj/machinery/rnd/production/techfab/department/science = BOUNTY_TIER_MEDIUM,
		/obj/machinery/rnd/production/techfab/department/medical = BOUNTY_TIER_MEDIUM,
		/obj/machinery/rnd/production/techfab/department/security = BOUNTY_TIER_HARD,
		/obj/machinery/rnd/production/circuit_imprinter = BOUNTY_TIER_MEDIUM,
		/obj/machinery/computer/upload/ai = BOUNTY_TIER_HARD,
		/obj/machinery/computer/upload/borg = BOUNTY_TIER_HARD,
		/obj/machinery/power/emitter = BOUNTY_TIER_EASY,
		/obj/machinery/field/generator = BOUNTY_TIER_EASY,
		/obj/machinery/shieldgen = BOUNTY_TIER_EASY,
		/obj/machinery/power/smes = BOUNTY_TIER_EASY,
		/obj/machinery/power/energy_accumulator/tesla_coil = BOUNTY_TIER_HARD,
		/obj/machinery/power/energy_accumulator/grounding_rod = BOUNTY_TIER_HARD,
		/obj/machinery/portable_atmospherics/canister/plasma = BOUNTY_TIER_MEDIUM,
		/obj/machinery/atmospherics/components/binary/crystallizer = BOUNTY_TIER_MEDIUM,
		/obj/machinery/processor/slime = BOUNTY_TIER_MEDIUM,
		/obj/machinery/monkey_recycler = BOUNTY_TIER_MEDIUM,
		/obj/machinery/doppler_array = BOUNTY_TIER_MEDIUM,
		/obj/machinery/research/anomaly_refinery = BOUNTY_TIER_MEDIUM,
		/obj/machinery/atmospherics/components/binary/tank_compressor = BOUNTY_TIER_MEDIUM,
		/obj/machinery/mecha_part_fabricator = BOUNTY_TIER_EASY,
		/obj/machinery/dna_scannernew = BOUNTY_TIER_EASY,
		/obj/machinery/computer/scan_consolenew = BOUNTY_TIER_EASY,
		/obj/machinery/computer/operating = BOUNTY_TIER_EASY,
		/obj/machinery/computer/rdconsole = BOUNTY_TIER_MEDIUM,
		/obj/machinery/rnd/destructive_analyzer = BOUNTY_TIER_MEDIUM,
		/obj/machinery/mech_bay_recharge_port = BOUNTY_TIER_EASY,
		/obj/machinery/computer/mech_bay_power_console = BOUNTY_TIER_EASY,
		/obj/machinery/mechpad = BOUNTY_TIER_EASY,
		/obj/machinery/computer/mechpad = BOUNTY_TIER_EASY,
		/obj/machinery/recharging_station = BOUNTY_TIER_EASY,
		/obj/machinery/chem_dispenser = BOUNTY_TIER_MEDIUM,
		/obj/machinery/chem_heater = BOUNTY_TIER_MEDIUM,
		/obj/machinery/chem_master = BOUNTY_TIER_MEDIUM,
		/obj/machinery/atmospherics/components/unary/cryo_cell = BOUNTY_TIER_MEDIUM,
		/obj/machinery/stasis = BOUNTY_TIER_MEDIUM,
		/obj/machinery/table/optable = BOUNTY_TIER_EASY,
		/obj/machinery/computer/pandemic = BOUNTY_TIER_EASY,
		/obj/machinery/computer/teleporter = BOUNTY_TIER_HARD,
		/obj/machinery/teleport/hub = BOUNTY_TIER_HARD,
		/obj/machinery/teleport/station = BOUNTY_TIER_HARD,
		/obj/machinery/computer/communications = BOUNTY_TIER_HARD,
		/obj/machinery/computer/security = BOUNTY_TIER_MEDIUM,
		/obj/machinery/computer/secure_data = BOUNTY_TIER_MEDIUM,
	)

	/// List of item bounties and their bounty tier
	var/static/list/item_bounties = list(
		/obj/item/blackbox = BOUNTY_TIER_HARD,
		/obj/item/gun/energy/laser/captain = BOUNTY_TIER_VERYHARD,
		/obj/item/gun/energy/e_gun/hos = BOUNTY_TIER_VERYHARD,
		/obj/item/card/id/departmental_budget/car = BOUNTY_TIER_HARD,
		/obj/item/nullrod = BOUNTY_TIER_MEDIUM,
		/obj/item/fireaxe = BOUNTY_TIER_MEDIUM,
		/obj/item/hand_tele = BOUNTY_TIER_HARD,
		/obj/item/tank/jetpack/oxygen/captain = BOUNTY_TIER_HARD,
		/obj/item/clothing/shoes/magboots/advance = BOUNTY_TIER_HARD,
		/obj/item/clothing/accessory/medal/gold/captain = BOUNTY_TIER_HARD,
		/obj/item/hypospray/mkii/cmo = BOUNTY_TIER_VERYHARD,
		/obj/item/clothing/suit/hooded/ablative = BOUNTY_TIER_HARD,
		/obj/item/clothing/suit/armor/reactive/teleport = BOUNTY_TIER_HARD,
		/obj/item/documents = BOUNTY_TIER_HARD,
		/obj/item/areaeditor/blueprints = BOUNTY_TIER_VERYHARD,
		/obj/item/pinpointer/nuke = BOUNTY_TIER_VERYHARD,
		/obj/item/radio/headset/headset_sec = BOUNTY_TIER_MEDIUM,
		/obj/item/radio/headset/heads/captain = BOUNTY_TIER_HARD,
		/obj/item/radio/headset/heads/hop = BOUNTY_TIER_HARD,
		/obj/item/radio/headset/heads/ce = BOUNTY_TIER_HARD,
		/obj/item/radio/headset/heads/rd = BOUNTY_TIER_HARD,
		/obj/item/radio/headset/heads/hos = BOUNTY_TIER_HARD,
		/obj/item/radio/headset/heads/qm = BOUNTY_TIER_HARD,
		/obj/item/radio/headset/heads/cmo = BOUNTY_TIER_HARD,
		/obj/item/cargo_teleporter = BOUNTY_TIER_MEDIUM,
		/obj/item/laser_pointer = BOUNTY_TIER_EASY,
		/obj/item/gun/syringe = BOUNTY_TIER_MEDIUM,
		/obj/item/gun/ballistic/shotgun/doublebarrel = BOUNTY_TIER_MEDIUM,
		/obj/item/clothing/gloves/cargo_gauntlet = BOUNTY_TIER_EASY,
		/obj/item/mod/control/pre_equipped/magnate = BOUNTY_TIER_VERYHARD,
		/obj/item/mod/control/pre_equipped/engineering = BOUNTY_TIER_MEDIUM,
		/obj/item/mod/control/pre_equipped/medical = BOUNTY_TIER_MEDIUM,
		/obj/item/mod/control/pre_equipped/security = BOUNTY_TIER_HARD,
		/obj/item/mod/control/pre_equipped/safeguard = BOUNTY_TIER_VERYHARD,
		/obj/item/clothing/glasses/sunglasses = BOUNTY_TIER_MEDIUM,
	)
	/// Current list of bounty objects. Only updates on fire(), unlike GLOB.repo_bounty_objects
	var/list/current_bounty_objects = list()

/datum/controller/subsystem/repossession_agent/Initialize(start_timeofday)
	. = ..()
	for(var/type in subtypesof(/datum/repo_claim_category))
		claim_types += new type

/datum/controller/subsystem/repossession_agent/fire(resumed)
	regenerate_claim_list()

/datum/controller/subsystem/repossession_agent/proc/regenerate_claim_list()
	current_claims.Cut()

	current_bounty_objects = GLOB.repo_bounty_objects.Copy()
	for(var/datum/repo_claim_category/claim_cat as anything in claim_types)
		claim_cat.generate_our_claims()


// Everything gets added to the list
// For a bounty, game chooses from a static list of types
// You must get that type, not subtypes (maybe)
// that object must have existed prior to the bounty existing

