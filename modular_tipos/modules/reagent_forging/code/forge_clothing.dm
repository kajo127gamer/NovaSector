// Vests
/obj/item/clothing/suit/armor/heavy_forging_plate_armor
	name = "heavy reagent plate vest"
	desc = "An heavy armor vest made of hammered, interlocking plates."
	icon = 'modular_nova/modules/reagent_forging/icons/obj/forge_clothing.dmi'
	worn_icon = 'modular_nova/modules/reagent_forging/icons/mob/clothing/forge_clothing.dmi'
	worn_icon_better_vox = 'modular_nova/modules/reagent_forging/icons/mob/clothing/forge_clothing_newvox.dmi'
	worn_icon_vox = 'modular_nova/modules/reagent_forging/icons/mob/clothing/forge_clothing_oldvox.dmi'
	worn_icon_teshari = 'modular_nova/modules/reagent_forging/icons/mob/clothing/forge_clothing_teshari.dmi'
	icon_state = "plate_vest"
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON
	resistance_flags = FIRE_PROOF
	w_class = WEIGHT_CLASS_BULKY
	skyrat_obj_flags = ANVIL_REPAIR
	armor_type = /datum/armor/armor_forging_plate_armor/heavy
	material_flags = MATERIAL_EFFECTS | MATERIAL_ADD_PREFIX | MATERIAL_GREYSCALE | MATERIAL_COLOR

/datum/armor/armor_forging_plate_armor/heavy
	melee = 60
	bullet = 50
	fire = 30
	wound = 60

/obj/item/clothing/suit/armor/heavy_forging_plate_armor/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/armor_plate, 3)
	AddComponent(/datum/component/reagent_clothing, ITEM_SLOT_OCLOTHING)

	allowed += /obj/item/forging/reagent_weapon

// Gloves
/obj/item/clothing/gloves/heavy_forging_plate_gloves
	name = "heavy reagent plate gloves"
	desc = "A set of leather gloves with heavy protective armor plates connected to the wrists."
	icon = 'modular_nova/modules/reagent_forging/icons/obj/forge_clothing.dmi'
	worn_icon = 'modular_nova/modules/reagent_forging/icons/mob/clothing/forge_clothing.dmi'
	worn_icon_better_vox = 'modular_nova/modules/reagent_forging/icons/mob/clothing/forge_clothing_newvox.dmi'
	worn_icon_vox = 'modular_nova/modules/reagent_forging/icons/mob/clothing/forge_clothing_oldvox.dmi'
	worn_icon_teshari = 'modular_nova/modules/reagent_forging/icons/mob/clothing/forge_clothing_teshari.dmi'
	icon_state = "plate_gloves"
	resistance_flags = FIRE_PROOF
	w_class = WEIGHT_CLASS_BULKY
	skyrat_obj_flags = ANVIL_REPAIR
	armor_type = /datum/armor/gloves_forging_plate_gloves/heavy
	material_flags = MATERIAL_EFFECTS | MATERIAL_ADD_PREFIX | MATERIAL_GREYSCALE | MATERIAL_COLOR

/datum/armor/gloves_forging_plate_gloves/heavy
	melee = 60
	bullet = 50
	fire = 30
	wound = 60

/obj/item/clothing/gloves/heavy_forging_plate_gloves/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/armor_plate, 3)
	AddComponent(/datum/component/reagent_clothing, ITEM_SLOT_GLOVES)

// Helmets
/obj/item/clothing/head/helmet/heavy_forging_plate_helmet
	name = "heavy reagent plate helmet"
	desc = "A helmet out of heavy hammered plates with a leather neck guard and chin strap."
	icon = 'modular_nova/modules/reagent_forging/icons/obj/forge_clothing.dmi'
	worn_icon = 'modular_nova/modules/reagent_forging/icons/mob/clothing/forge_clothing.dmi'
	worn_icon_better_vox = 'modular_nova/modules/reagent_forging/icons/mob/clothing/forge_clothing_newvox.dmi'
	worn_icon_vox = 'modular_nova/modules/reagent_forging/icons/mob/clothing/forge_clothing_oldvox.dmi'
	worn_icon_teshari = 'modular_nova/modules/reagent_forging/icons/mob/clothing/forge_clothing_teshari.dmi'
	icon_state = "plate_helmet"
	supports_variations_flags = CLOTHING_SNOUTED_VARIATION_NO_NEW_ICON
	resistance_flags = FIRE_PROOF
	w_class = WEIGHT_CLASS_BULKY
	flags_inv = null
	skyrat_obj_flags = ANVIL_REPAIR
	armor_type = /datum/armor/helmet_forging_plate_helmet/heavy
	material_flags = MATERIAL_EFFECTS | MATERIAL_ADD_PREFIX | MATERIAL_GREYSCALE | MATERIAL_COLOR

/datum/armor/helmet_forging_plate_helmet/heavy
	melee = 60
	bullet = 50
	fire = 30
	wound = 60

/obj/item/clothing/head/helmet/heavy_forging_plate_helmet/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/armor_plate, 3)
	AddComponent(/datum/component/reagent_clothing, ITEM_SLOT_HEAD)

// Boots
/obj/item/clothing/shoes/heavy_forging_plate_boots
	name = "heavy reagent plate boots"
	desc = "A pair of heavy leather boots with protective armor plates over the shins and toes."
	icon = 'modular_nova/modules/reagent_forging/icons/obj/forge_clothing.dmi'
	worn_icon = 'modular_nova/modules/reagent_forging/icons/mob/clothing/forge_clothing.dmi'
	worn_icon_digi = 'modular_nova/modules/reagent_forging/icons/mob/clothing/forge_clothing_digi.dmi'
	worn_icon_better_vox = 'modular_nova/modules/reagent_forging/icons/mob/clothing/forge_clothing_newvox.dmi'
	worn_icon_vox = 'modular_nova/modules/reagent_forging/icons/mob/clothing/forge_clothing_oldvox.dmi'
	worn_icon_teshari = 'modular_nova/modules/reagent_forging/icons/mob/clothing/forge_clothing_teshari.dmi'
	icon_state = "plate_boots"
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION
	armor_type = /datum/armor/shoes_forging_plate_boots/heavy
	material_flags = MATERIAL_EFFECTS | MATERIAL_ADD_PREFIX | MATERIAL_GREYSCALE | MATERIAL_COLOR
	resistance_flags = FIRE_PROOF
	w_class = WEIGHT_CLASS_BULKY
	skyrat_obj_flags = ANVIL_REPAIR
	can_be_tied = FALSE

/datum/armor/shoes_forging_plate_boots/heavy
	melee = 40
	bullet = 30
	wound = 30

/obj/item/clothing/shoes/heavy_forging_plate_boots/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/armor_plate, 1)
	AddComponent(/datum/component/reagent_clothing, ITEM_SLOT_FEET)
