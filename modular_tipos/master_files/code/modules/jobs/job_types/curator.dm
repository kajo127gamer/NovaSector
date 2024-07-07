/datum/job/curator
	title = JOB_CURATOR
	description = "Read and write books and hand them to people, stock \
		bookshelves, report on kingdom news."
	department_head = list(JOB_HEAD_OF_PERSONNEL)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = SUPERVISOR_HOP
	config_tag = "CURATOR"
	exp_granted_type = EXP_TYPE_CREW

	outfit = /datum/outfit/job/curator

	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_SRV

	mind_traits = list(TRAIT_TOWER_OF_BABEL)

	display_order = JOB_DISPLAY_ORDER_CURATOR
	departments_list = list(
		/datum/job_department/service,
		)

	mail_goodies = list(
		/obj/item/book/random = 44,
		/obj/item/book/manual/random = 5,
		/obj/item/book/granter/action/spell/blind/wgw = 1,
	)

	family_heirlooms = list(/obj/item/storage/dice)

	job_flags = STATION_JOB_FLAGS

	voice_of_god_silence_power = 3
	rpg_title = "Veteran Adventurer"

/datum/outfit/job/curator
	name = "Curator"
	jobtype = /datum/job/curator

	id_trim = null
	uniform = /obj/item/clothing/under/dress/skirt/primitive_catgirl_body_wraps
	neck = /obj/item/clothing/suit/ashwalkermantle/cape
	suit = /obj/item/clothing/suit/wizrobe
	backpack_contents = list( /obj/item/book = 1, )
	belt = null
	ears = null
	shoes = null
	l_pocket = null
	r_pocket = null
	l_hand = null
	accessory = null
	satchel = null
	duffelbag = null
	messenger = null
	backpack = null
	back = /obj/item/storage/backpack
	l_pocket = /obj/item/coin/silver
	r_pocket = /obj/item/coin/silver
