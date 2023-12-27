/*
Peasant
*/
/datum/job/peasant
	title = JOB_PEASANT
	description = "Get your medieval legs, kill monsters, ask the Blacksmith to give you a weapon and armor."
	faction = FACTION_STATION
	total_positions = 100
	spawn_positions = 100
	outfit = /datum/outfit/job/peasant
	supervisors = "absolutely everyone"
	plasmaman_outfit = /datum/outfit/plasmaman
	paycheck = PAYCHECK_LOWER // Get a job. Job reassignment changes your paycheck now. Get over it.
	exp_granted_type = EXP_TYPE_CREW

	paycheck_department = ACCOUNT_CIV
	display_order = JOB_DISPLAY_ORDER_PEASANT

	liver_traits = list(TRAIT_MAINTENANCE_METABOLISM)

	bounty_types = CIV_JOB_MINE
	departments_list = list(
		/datum/job_department/peasant,
		)

	family_heirlooms = list(null)

	mail_goodies = list(
		/obj/effect/spawner/random/food_or_drink/donkpockets = 10,
		/obj/item/clothing/mask/gas = 10,
		/obj/item/clothing/gloves/color/fyellow = 7,
		/obj/item/choice_beacon/music = 5,
		/obj/item/toy/sprayoncan = 3,
		/obj/item/crowbar/large = 1
	)

	job_flags = STATION_JOB_FLAGS
	rpg_title = "Adventurer"
	config_tag = "PEASANT"

	allow_bureaucratic_error = FALSE // SKYRAT EDIT ADDITION

/datum/outfit/job/peasant
	name = JOB_PEASANT
	jobtype = /datum/job/peasant
	id_trim = null
	uniform = null // SKYRAT EDIT ADD
	belt = null
	suit = null
	back = null
	ears = null
	shoes = null
