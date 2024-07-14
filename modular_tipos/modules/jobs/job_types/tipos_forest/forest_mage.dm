
/datum/job/tipos_forest/mage
	title = JOB_F_MAGE
	description = ""
	department_head = list(JOB_F_LORD)
	faction = FACTION_FOREST
	total_positions = 1
	spawn_positions = 1
	supervisors = SUPERVISOR_LORD
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "MAGE"

	outfit = /datum/outfit/job/tipos_forest/mage
	job_flags = FOREST_JOB_FLAGS
	display_order = JOB_DISPLAY_ORDER_MAGE
	departments_list = list(
		/datum/job_department/tipos_forest,
		)

/datum/outfit/job/tipos_forest/mage
	name = "Mage"
	jobtype = /datum/job/tipos_forest/mage

	id_trim = null
	id = null
	head = null
	ears = null
	mask = /obj/item/clothing/mask/tipos_forest/hood
	neck = null
	suit = null
	uniform = /obj/item/clothing/under/costume/tipos_forest/robe_blue
	gloves = /obj/item/clothing/gloves/ring/silver
	belt = null
	shoes = /obj/item/clothing/shoes/workboots/mining
	l_pocket = /obj/item/storage/tipos_forest/pouch/town
	r_pocket = /obj/item/forging/reagent_weapon/dagger
	r_hand = /obj/item/flashlight/flare/torch
	box = null
	backpack_contents = list(
		/obj/item/book/granter/action/spell/forcewall = 1,
		)

/datum/outfit/job/tipos_forest/mage/post_equip(mob/living/carbon/human/equipped, visualsOnly = FALSE)
	. = ..()
