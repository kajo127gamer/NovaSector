/datum/job/clown
	title = JOB_CLOWN
	description = "Entertain the kingdom and the king, make bad jokes, go on a holy quest to find bananium, HONK!"
	department_head = list(JOB_HEAD_OF_PERSONNEL)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = SUPERVISOR_HOP
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "CLOWN"

	outfit = /datum/outfit/job/clown

	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_SRV

	mind_traits = list(TRAIT_NAIVE)
	liver_traits = list(TRAIT_COMEDY_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_CLOWN
	departments_list = list(
		/datum/job_department/service,
		)

	mail_goodies = list(
		/obj/item/food/grown/banana = 100,
		/obj/item/food/pie/cream = 50,
		/obj/item/clothing/shoes/clown_shoes/combat = 10,
		/obj/item/reagent_containers/spray/waterflower/lube = 20, // lube
		/obj/item/reagent_containers/spray/waterflower/superlube = 1 // Superlube, good lord.
	)

	family_heirlooms = list(/obj/item/bikehorn/golden)
	rpg_title = "Jester"
	job_flags = STATION_JOB_FLAGS

	job_tone = "honk"

/datum/job/clown/after_spawn(mob/living/spawned, client/player_client)
	. = ..()
	if(!ishuman(spawned))
		return
	spawned.apply_pref_name(/datum/preference/name/clown, player_client)


/datum/outfit/job/clown
	name = "Clown"
	jobtype = /datum/job/clown

	id = null
	id_trim = null
	uniform = /obj/item/clothing/under/rank/civilian/clown
	backpack_contents = list()
	belt = null
	ears = null
	shoes = /obj/item/clothing/shoes/clown_shoes
	mask = /obj/item/clothing/mask/gas/clown_hat
	l_hand = /obj/item/bikehorn

	backpack = null
	back = null
	satchel = null
	duffelbag = null //strangely has a duffel
	messenger = null

	box = null
	chameleon_extras = null
	implants = list(/obj/item/implant/sad_trombone)

/datum/outfit/job/clown/pre_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_BANANIUM_SHIPMENTS))
		backpack_contents[/obj/item/stack/sheet/mineral/bananium/five] = 1

/datum/outfit/job/clown/get_types_to_preload()
	. = ..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_BANANIUM_SHIPMENTS))
		. += /obj/item/stack/sheet/mineral/bananium/five
