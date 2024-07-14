
/datum/job/tipos_forest/capitan
	title = JOB_F_CAPTAIN
	description = ""
	department_head = list(JOB_F_LORD)
	faction = FACTION_FOREST
	total_positions = 1
	spawn_positions = 1
	supervisors = SUPERVISOR_LORD
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "CAPTAIN"

	outfit = /datum/outfit/job/tipos_forest/capitan
	job_flags = FOREST_JOB_FLAGS
	display_order = JOB_DISPLAY_ORDER_CAPTAIN
	departments_list = list(
		/datum/job_department/tipos_forest,
		)

/datum/outfit/job/tipos_forest/capitan
	name = "Capitan"
	jobtype = /datum/job/tipos_forest/capitan

	id_trim = null
	id = /obj/item/card/cardboard
	head = null
	ears = null
	mask = null
	neck = null
	suit = null
	uniform = /obj/item/clothing/under/costume/gladiator/ash_walker/caesar_clothes
	gloves = null
	belt = /obj/item/storage/belt/crusader
	shoes = /obj/item/clothing/shoes/jackboots/ashwalker
	l_pocket = /obj/item/storage/tipos_forest/pouch/captain
	r_pocket = /obj/item/forging/reagent_weapon/dagger
	r_hand = /obj/item/flashlight/lantern
	box = null

/datum/outfit/job/tipos_forest/capitan/post_equip(mob/living/carbon/human/equipped, visualsOnly = FALSE)
	. = ..()
