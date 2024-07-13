
// Forest Clothing - Blackstone Sprites

// Neck Clothing

/obj/item/clothing/neck/cloak/tipos_forest
	icon = 'modular_tipos/master_files/icons/obj/clothing/forest_neck.dmi'
	worn_icon = 'modular_tipos/master_files/icons/mob/clothing/forest_neck.dmi'

/obj/item/clothing/neck/cloak/tipos_forest/lord
	name = "lordly cloak"
	desc = "Ermine trimmed, handed down."
	icon_state = "lord_cloak"

/obj/item/clothing/neck/cloak/tipos_forest/cape
	name = "white cape"
	desc = "A beautiful, flowing cape. Too bad it tangles too much on the vegetation."
	icon_state = "cape"

// Under Clothing

/obj/item/clothing/under/costume/tipos_forest
	icon = 'modular_tipos/master_files/icons/obj/clothing/forest_under.dmi'
	worn_icon = 'modular_tipos/master_files/icons/mob/clothing/forest_under.dmi'

/obj/item/clothing/under/costume/tipos_forest/robe
	name = "white robe"
	desc = ""
	icon_state = "white_robe"
	inhand_icon_state = null
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE

// Face Clothing

/obj/item/clothing/mask/tipos_forest
	icon = 'modular_tipos/master_files/icons/obj/clothing/forest_mask.dmi'
	worn_icon = 'modular_tipos/master_files/icons/mob/clothing/forest_mask.dmi'

/obj/item/clothing/mask/tipos_forest/hood
	name = "hood"
	desc = ""
	actions_types = list(/datum/action/item_action/adjust)
	icon_state = "basichood"
	alternate_worn_layer = BACK_LAYER
	clothing_flags = BLOCK_GAS_SMOKE_EFFECT
	flags_inv = HIDEFACIALHAIR | HIDEFACE | HIDESNOUT | HIDEHAIR
	w_class = WEIGHT_CLASS_SMALL
	visor_flags = BLOCK_GAS_SMOKE_EFFECT
	visor_flags_inv = HIDEFACIALHAIR | HIDEFACE | HIDESNOUT | HIDEHAIR
	interaction_flags_click = NEED_DEXTERITY|ALLOW_RESTING

/obj/item/clothing/mask/tipos_forest/hood/attack_self(mob/user)
	adjust_visor(user)

/obj/item/clothing/mask/tipos_forest/hood/click_alt(mob/user)
	adjust_visor(user)
	return CLICK_ACTION_SUCCESS


/obj/item/clothing/mask/tipos_forest/hood/examine(mob/user)
	. = ..()
	. += span_notice("Alt-click [src] to adjust it.")

// Forest Pouch

/obj/item/storage/tipos_forest
	icon = 'modular_tipos/master_files/icons/obj/storage/forest_storage.dmi'

/obj/item/storage/tipos_forest/pouch
	name = "pouch"
	desc = "It can hold a FEW coins."
	icon_state = "pouch"
	w_class = WEIGHT_CLASS_SMALL
	resistance_flags = FLAMMABLE
	slot_flags = ITEM_SLOT_ID

/obj/item/storage/tipos_forest/pouch/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_SMALL
	atom_storage.max_slots = 14
	atom_storage.set_holdable(list(
		/obj/item/coin,
		/obj/item/dice),)
