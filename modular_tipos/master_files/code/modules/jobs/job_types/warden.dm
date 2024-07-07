/datum/job/warden
	title = JOB_WARDEN
	description = "Watch over the Prison, release prisoners / slave when \
		their time is up, issue equipment to security, be a security officer when \
		they all eventually die."
	auto_deadmin_role_flags = DEADMIN_POSITION_SECURITY
	department_head = list(JOB_HEAD_OF_SECURITY)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = SUPERVISOR_HOS
	minimal_player_age = 7
	exp_requirements = 300
	exp_required_type = EXP_TYPE_CREW
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "WARDEN"

	outfit = /datum/outfit/job/warden

	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_SEC

	liver_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM, TRAIT_PRETENDER_ROYAL_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_WARDEN
	bounty_types = CIV_JOB_SEC
	departments_list = list(
		/datum/job_department/security,
		)

	family_heirlooms = list()

	mail_goodies = list(
		/obj/item/storage/fancy/cigarettes = 15,
		/obj/item/storage/box/handcuffs = 10,
		/obj/item/storage/box/teargas = 10,
		/obj/item/storage/box/flashbangs = 10,
		/obj/item/storage/box/rubbershot = 10
	)
	rpg_title = "Jailor"
	job_flags = STATION_JOB_FLAGS | JOB_BOLD_SELECT_TEXT

/datum/outfit/job/warden
	name = "Warden"
	jobtype = /datum/job/warden

	id_trim = null
	id = null
	uniform = /obj/item/clothing/under/dress/skirt/primitive_catgirl_body_wraps
	suit = null //NOVA EDIT CHANGE - Original: /obj/item/clothing/suit/armor/vest/warden/alt
	suit_store = null
	backpack_contents = list()
	belt = null
	ears = null
	glasses = null
	gloves = null //NOVA EDIT CHANGE - Original: /obj/item/clothing/gloves/color/black
	head = null //NOVA EDIT CHANGE - Original: /obj/item/clothing/head/hats/warden/red
	shoes = null
	l_pocket = /obj/item/coin/gold
	r_pocket = /obj/item/coin/gold

	backpack = null
	satchel = null
	duffelbag = null
	messenger = null
	back = null

	box = null
	implants = list(/obj/item/implant/mindshield)
