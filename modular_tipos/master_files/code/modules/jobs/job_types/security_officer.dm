/datum/job/security_officer
	title = JOB_SECURITY_OFFICER
	description = "Protect the kingdom assets, follow the Standard Operating \
		Procedure, purge pagans."
	auto_deadmin_role_flags = DEADMIN_POSITION_SECURITY
	department_head = list(JOB_HEAD_OF_SECURITY)
	faction = FACTION_STATION
	total_positions = 2 //Handled in /datum/controller/occupations/proc/setup_officer_positions() //NOVA EDIT: SET TO 8, WAS 5
	spawn_positions = 2 //Handled in /datum/controller/occupations/proc/setup_officer_positions() //NOVA EDIT: SEE ABOVE
	supervisors = "the Head of Security, and the head of your assigned department (if applicable)"
	minimal_player_age = 7
	exp_requirements = 300
	exp_required_type = EXP_TYPE_CREW
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "SECURITY_OFFICER"

	outfit = /datum/outfit/job/security

	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_SEC

	liver_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_SECURITY_OFFICER
	bounty_types = CIV_JOB_SEC
	departments_list = list(
		/datum/job_department/security,
		)

	family_heirlooms = list() //NOVA EDIT ADD - /peacekeeper

	mail_goodies = list(
		/obj/item/food/donut/caramel = 10,
		/obj/item/food/donut/matcha = 10,
		/obj/item/food/donut/blumpkin = 5,
		/obj/item/clothing/mask/whistle = 5,
		/obj/item/melee/baton/security/boomerang/loaded = 1
	)
	rpg_title = "Guard"
	job_flags = STATION_JOB_FLAGS

/**
 * The department distribution of the security officers.
 *
 * Keys are refs of the security officer mobs. This is to preserve the list's structure even if the
 * mob gets deleted. This is also safe, as mobs are guaranteed to have a unique ref, as per /mob/GenerateTag().
 */


/datum/job/security_officer/after_roundstart_spawn(mob/living/spawning, client/player_client)
	. = ..()
	//NOVA EDIT REMOVAL
	/*
	if(ishuman(spawning))
		setup_department(spawning, player_client)
	*/
	//NOVA EDIT END


/datum/job/security_officer/after_latejoin_spawn(mob/living/spawning)
	. = ..()
	//NOVA EDIT REMOVAL
	/*
	if(ishuman(spawning))
		var/department = setup_department(spawning, spawning.client)
		if(department)
			announce_latejoin(spawning, department, GLOB.security_officer_distribution)
	*/
	//NOVA EDIT END

/datum/outfit/job/security
	name = "Security Officer"
	jobtype = /datum/job/security_officer

	id_trim = null
	id = null
	uniform = /obj/item/clothing/under/dress/skirt/primitive_catgirl_body_wraps
	suit = /obj/item/clothing/suit/armor/riot/knight
	suit_store = null
	backpack_contents = list( /obj/item/reagent_containers/pill/patch/style/brute = 3, /obj/item/coin/silver = 2, )
	belt = /obj/item/storage/belt/crusader
	ears = null
	gloves = null //NOVA EDIT CHANGE - Original: /obj/item/clothing/gloves/color/black
	head = /obj/item/clothing/head/helmet/knight //NOVA EDIT CHANGE - Original: /obj/item/clothing/head/helmet/sec
	shoes = /obj/item/clothing/shoes/forging_plate_boots
	l_pocket = /obj/item/coin/gold
	r_pocket = null
	r_hand = /obj/item/claymore/weak
	l_hand = /obj/item/shield/roman

	backpack = /obj/item/storage/backpack/satchel/crusader
	satchel = /obj/item/storage/backpack/satchel/crusader
	duffelbag = /obj/item/storage/backpack/satchel/crusader
	messenger = /obj/item/storage/backpack/satchel/crusader
	back = /obj/item/storage/backpack/satchel/crusader

	box = null
	chameleon_extras = list()
		//The helmet is necessary because /obj/item/clothing/head/helmet/sec is overwritten in the chameleon list by the standard helmet, which has the same name and icon state
	implants = list(/obj/item/implant/mindshield)

/obj/item/radio/headset/headset_sec/alt/department/Initialize(mapload)
	. = ..()
	set_wires(new/datum/wires/radio(src))
	secure_radio_connections = list()
	recalculateChannels()

/obj/item/radio/headset/headset_sec/alt/department/engi
	keyslot = /obj/item/encryptionkey/headset_sec
	keyslot2 = /obj/item/encryptionkey/headset_eng

/obj/item/radio/headset/headset_sec/alt/department/supply
	keyslot = /obj/item/encryptionkey/headset_sec
	keyslot2 = /obj/item/encryptionkey/headset_cargo
/obj/item/radio/headset/headset_sec/alt/department/med
	keyslot = /obj/item/encryptionkey/headset_sec
	keyslot2 = /obj/item/encryptionkey/headset_med

/obj/item/radio/headset/headset_sec/alt/department/sci
	keyslot = /obj/item/encryptionkey/headset_sec
	keyslot2 = /obj/item/encryptionkey/headset_sci
