/datum/job/doctor
	title = JOB_MEDICAL_DOCTOR
	description = "Save lives, run around the kingdom looking for victims, \
		scan everyone in sight"
	department_head = list(JOB_CHIEF_MEDICAL_OFFICER)
	faction = FACTION_STATION
	total_positions = 5
	spawn_positions = 3
	supervisors = SUPERVISOR_CMO
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "MEDICAL_DOCTOR"

	outfit = /datum/outfit/job/doctor

	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_MED

	liver_traits = list(TRAIT_MEDICAL_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_MEDICAL_DOCTOR
	bounty_types = CIV_JOB_MED
	departments_list = list(
		/datum/job_department/medical,
		)

	family_heirlooms = list(/obj/item/statuebust/hippocratic)

	mail_goodies = list(
		/obj/item/healthanalyzer/advanced = 15,
		/obj/item/scalpel/advanced = 6,
		/obj/item/retractor/advanced = 6,
		/obj/item/cautery/advanced = 6,
		/obj/item/reagent_containers/cup/bottle/formaldehyde = 6,
		/obj/effect/spawner/random/medical/organs = 5,
		/obj/effect/spawner/random/medical/memeorgans = 1
	)
	rpg_title = "Cleric"
	job_flags = STATION_JOB_FLAGS


/datum/outfit/job/doctor
	name = "Medical Doctor"
	jobtype = /datum/job/doctor

	id_trim = null
	uniform = /obj/item/clothing/under/dress/skirt/primitive_catgirl_body_wraps
	suit = /obj/item/clothing/under/costume/gladiator/ash_walker/white
	suit_store = null
	belt = null
	ears = null
	back = null
	head = null
	shoes = null
	l_hand = null

	backpack = null
	satchel = null
	duffelbag = null
	messenger = null

	box = null
	chameleon_extras = null
	skillchips = list(/obj/item/skillchip/entrails_reader)
	l_pocket = /obj/item/coin/silver
	r_pocket = /obj/item/coin/silver
