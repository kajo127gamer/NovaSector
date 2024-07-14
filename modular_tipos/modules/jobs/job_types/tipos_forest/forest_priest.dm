
/datum/job/tipos_forest/priest
	title = JOB_F_PRIEST
	description = ""
	department_head = list(JOB_F_LORD)
	faction = FACTION_FOREST
	total_positions = 1
	spawn_positions = 1
	supervisors = SUPERVISOR_LORD
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "PRIEST"

	outfit = /datum/outfit/job/tipos_forest/priest
	job_flags = FOREST_JOB_FLAGS
	display_order = JOB_DISPLAY_ORDER_PRIEST
	departments_list = list(
		/datum/job_department/tipos_forest,
		)

/datum/outfit/job/tipos_forest/priest
	name = "Priest"
	jobtype = /datum/job/tipos_forest/priest

	id_trim = null
	id = /obj/item/card/cardboard
	head = null
	ears = null
	mask = null
	neck = null
	suit = /obj/item/clothing/suit/chaplainsuit/habit
	uniform = /obj/item/clothing/under/costume/gladiator/ash_walker/caesar_clothes
	gloves = null
	belt = null
	shoes = /obj/item/clothing/shoes/sandal
	l_pocket = /obj/item/storage/tipos_forest/pouch/town
	r_pocket = /obj/item/flashlight/flare/torch
	box = null
	backpack_contents = list(
		/obj/item/nullrod  = 1,
		)

/datum/outfit/job/tipos_forest/priest/post_equip(mob/living/carbon/human/equipped, visualsOnly = FALSE)
	. = ..()
