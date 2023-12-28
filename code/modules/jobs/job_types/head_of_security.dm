/datum/job/head_of_security
	title = JOB_HEAD_OF_SECURITY
	description = "Coordinate the people, ensure they are not corrupt, \
		make sure every civilian is protected."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD|DEADMIN_POSITION_SECURITY
	department_head = list(JOB_CAPTAIN)
	head_announce = list(RADIO_CHANNEL_SECURITY)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = SUPERVISOR_CAPTAIN
	req_admin_notify = 1
	minimal_player_age = 14
	exp_requirements = 300
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_SECURITY
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "HEAD_OF_SECURITY"

	outfit = /datum/outfit/job/hos
	departments_list = list(
		/datum/job_department/security,
		/datum/job_department/command,
		)

	liver_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM, TRAIT_ROYAL_METABOLISM)

	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SEC

	display_order = JOB_DISPLAY_ORDER_HEAD_OF_SECURITY
	bounty_types = CIV_JOB_SEC

	family_heirlooms = list()
	rpg_title = "Guard Leader"
	job_flags = STATION_JOB_FLAGS | JOB_BOLD_SELECT_TEXT | JOB_CANNOT_OPEN_SLOTS

	voice_of_god_power = 1.4 //Command staff has authority


/datum/job/head_of_security/get_captaincy_announcement(mob/living/captain)
	return "Due to staffing shortages, newly promoted Acting Captain [captain.real_name] on deck!"


/datum/outfit/job/hos
	name = "Head of Security"
	jobtype = /datum/job/head_of_security

	id = null
	id_trim = null
	uniform = /obj/item/clothing/under/dress/skirt/primitive_catgirl_body_wraps
	suit = null
	suit_store = null
	backpack_contents = list()
	belt = null
	ears = null
	glasses = null
	gloves = null //NOVA EDIT CHANGE - Original: /obj/item/clothing/gloves/color/black
	head = null
	shoes = null
	l_pocket = null
	r_pocket = null

	back = null
	backpack = null
	satchel = null
	duffelbag = null
	messenger = null

	box = null
	chameleon_extras = list()
	implants = list(/obj/item/implant/mindshield)

/datum/outfit/job/hos/mod
	name = "Head of Security (MODsuit)"

	suit_store = /obj/item/tank/internals/oxygen
	back = /obj/item/mod/control/pre_equipped/safeguard
	suit = null
	head = null
	mask = /obj/item/clothing/mask/gas/sechailer
	internals_slot = ITEM_SLOT_SUITSTORE
