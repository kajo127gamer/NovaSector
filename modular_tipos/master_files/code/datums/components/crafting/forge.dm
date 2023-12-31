/// The baseline time to take for doing actions with the forge, like heating glass, setting ceramics, etc.
#define BASELINE_ACTION_TIME (4 SECONDS)

/// The basline for how long an item such as molten glass will be kept workable after heating
#define BASELINE_HEATING_DURATION (25 SECONDS)

/// The amount the forge's temperature will change per process
#define FORGE_DEFAULT_TEMPERATURE_CHANGE 5
/// The maximum temperature the forge can reach
#define MAX_FORGE_TEMP 100
/// The minimum temperature for using the forge
#define MIN_FORGE_TEMP 50
/// The duration that objects heated in the forge are heated for
#define FORGE_HEATING_DURATION (1 MINUTES)

/// Defines for different levels of the forge, ranging from no level (you play like a noob) to legendary
#define FORGE_LEVEL_YOU_PLAY_LIKE_A_NOOB 1
#define FORGE_LEVEL_NOVICE 2
#define FORGE_LEVEL_APPRENTICE 3
#define FORGE_LEVEL_JOURNEYMAN 4
#define FORGE_LEVEL_EXPERT 5
#define FORGE_LEVEL_MASTER 6
#define FORGE_LEVEL_LEGENDARY 7

/// The maximum amount of temperature loss decrease that upgrades can give the forge
#define MAX_TEMPERATURE_LOSS_DECREASE 5

/// The chance per piece of wood added that charcoal will form later
#define CHARCOAL_CHANCE 45

/// The minimum units of a reagent rerquired to imbue it into a weapon
#define MINIMUM_IMBUING_REAGENT_AMOUNT 100

/// Defines for the different levels of smoke coming out of the forge, (good, neutral, bad) are all used for baking, (not cooking) is used for when there is no tray in the forge
#define SMOKE_STATE_NONE 0
#define SMOKE_STATE_GOOD 1
#define SMOKE_STATE_NEUTRAL 2
#define SMOKE_STATE_BAD 3
#define SMOKE_STATE_NOT_COOKING 4

/obj/structure/reagent_forge/tipos
	name = "forge"
	desc = "A structure built out of bricks, for heating up metal, or glass, or ceramic, or food, or anything really."
	icon = 'modular_nova/modules/reagent_forging/icons/obj/forge_structures.dmi'
	icon_state = "forge_inactive"

	anchored = TRUE
	density = TRUE

/obj/structure/reagent_forge/tipos/examine(mob/user)
	. = ..()

	if(used_tray)
		. += span_notice("It has [used_tray] in it, which can be removed with an <b>empty hand</b>.")
	else
		. += span_notice("You can place an <b>oven tray</b> in this to <b>bake</b> any items on it.")

	if(forge_level < FORGE_LEVEL_LEGENDARY)
		. += span_notice("Using an <b>empty hand</b> on [src] will upgrade it, if your forging skill level is above the current upgrade's level.")

	switch(forge_level)
		if(FORGE_LEVEL_YOU_PLAY_LIKE_A_NOOB)
			. += span_notice("This forge has not been upgraded yet.")

		if(FORGE_LEVEL_NOVICE)
			. += span_notice("This forge has been upgraded by a novice smith.")

		if(FORGE_LEVEL_APPRENTICE)
			. += span_notice("This forge has been upgraded by an apprentice smith.")

		if(FORGE_LEVEL_JOURNEYMAN)
			. += span_notice("This forge has been upgraded by a journeyman smith.")

		if(FORGE_LEVEL_EXPERT)
			. += span_notice("This forge has been upgraded by an expert smith.")

		if(FORGE_LEVEL_MASTER)
			. += span_notice("This forge has been upgraded by a master smith.")

		if(FORGE_LEVEL_LEGENDARY)
			. += span_hierophant("This forge has been upgraded by a legendary smith.") // Legendary skills give you the greatest gift of all, cool text

	switch(temperature_loss_reduction)
		if(0)
			. += span_notice("[src] will lose heat at a normal rate.")
		if(1)
			. += span_notice("[src] will lose heat slightly slower than usual.")
		if(2)
			. += span_notice("[src] will lose heat a bit slower than usual.")
		if(3)
			. += span_notice("[src] will lose heat much slower than usual.")
		if(4)
			. += span_notice("[src] will lose heat signficantly slower than usual.")
		if(5)
			. += span_notice("[src] will lose heat at a practically negligible rate.")

	. += span_notice("<br>[src] is currently [forge_temperature] degrees hot, going towards [target_temperature] degrees.<br>")

	if(reagent_forging && (is_species(user, /datum/species/lizard/ashwalker) || is_species(user, /datum/species/dwarf) || is_species(user, /datum/species/human/felinid/primitive)))
		. += span_warning("[src] has a fine gold trim, it is ready to imbue chemicals into reagent objects.")

	return .

/obj/structure/reagent_forge/tipos/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSobj, src)
	populate_radial_choice_list()
	update_appearance()
	upgrade_forge_tipos(forced = TRUE)

/// Creates both a fail message balloon alert, and sets in_use to false
/obj/structure/reagent_forge/tipos/proc/fail_message_tipos(mob/living/user, message)
	balloon_alert(user, message)
	in_use = FALSE

/// Adjust the temperature to head towards the target temperature, changing icon and creating light if the temperature is rising
/obj/structure/reagent_forge/tipos/proc/check_temp_tipos()
	if(forge_temperature > target_temperature) // Being above the target temperature will cause the forge to cool down
		forge_temperature -= (FORGE_DEFAULT_TEMPERATURE_CHANGE - temperature_loss_reduction)
		return

	else if((forge_temperature < target_temperature) && (forge_fuel_weak || forge_fuel_strong)) // Being below the target temp, and having fuel, will cause the temp to rise
		forge_temperature += FORGE_DEFAULT_TEMPERATURE_CHANGE
		return

/obj/structure/reagent_forge/tipos/proc/upgrade_forge_tipos(mob/living/user, forced = FALSE)
	var/level_to_upgrade_to

	if(forced || !user) // This is to make sure the ready subtype of forge still works
		level_to_upgrade_to = forge_level
	else
		level_to_upgrade_to = user.mind.get_skill_level(/datum/skill/smithing)

	if((forge_level == level_to_upgrade_to) && !forced)
		to_chat(user, span_notice("[src] was already upgraded by your level of expertise!"))
		return

	switch(level_to_upgrade_to) // Remember to carry things over from past levels in case someone skips levels in upgrading
		if(SKILL_LEVEL_NONE)
			if(!forced)
				to_chat(user, span_notice("You'll need some forging skills to really understand how to upgrade [src]."))
			return

		if(SKILL_LEVEL_NOVICE)
			if(!forced)
				to_chat(user, span_notice("With some experience, you've come to realize there are some easily fixable spots with poor insulation..."))
			temperature_loss_reduction = 1
			forge_level = FORGE_LEVEL_NOVICE

		if(SKILL_LEVEL_APPRENTICE)
			if(!forced)
				to_chat(user, span_notice("Further insulation and protection of the thinner areas means [src] will lose heat just that little bit slower."))
			temperature_loss_reduction = 2
			forge_level = FORGE_LEVEL_APPRENTICE

		if(SKILL_LEVEL_JOURNEYMAN)
			if(!forced)
				to_chat(user, span_notice("Some careful placement and stoking of the flame will allow you to keep at least the embers burning..."))
			minimum_target_temperature = 25 // Will allow quicker reheating from having no fuel
			temperature_loss_reduction = 3
			forge_level = FORGE_LEVEL_JOURNEYMAN

		if(SKILL_LEVEL_EXPERT)
			if(!forced)
				to_chat(user, span_notice("[src] has become nearly perfect, able to hold heat for long enough that even a piece of wood can outmatch the longevity of lesser forges."))
			temperature_loss_reduction = 4
			minimum_target_temperature = 25
			forge_level = FORGE_LEVEL_EXPERT

		if(SKILL_LEVEL_MASTER)
			if(!forced)
				to_chat(user, span_notice("The perfect forge for a perfect metalsmith, with your knowledge it should bleed heat so slowly, that not even you will live to see [src] cool."))
			temperature_loss_reduction = MAX_TEMPERATURE_LOSS_DECREASE
			minimum_target_temperature = 25
			forge_level = FORGE_LEVEL_MASTER

		if(SKILL_LEVEL_LEGENDARY)
			if(!forced)
				if(is_species(user, /datum/species/lizard/ashwalker) || is_species(user, /datum/species/dwarf) || is_species(user, /datum/species/human/felinid/primitive))
					to_chat(user, span_notice("With just the right heat treating technique, metal could be made to accept reagents..."))
					create_reagent_forge()
				if(forge_level == FORGE_LEVEL_MASTER)
					to_chat(user, span_warning("It is impossible to further improve the forge!"))
			temperature_loss_reduction = MAX_TEMPERATURE_LOSS_DECREASE
			minimum_target_temperature = 25 // This won't matter except in a few cases here, but we still need to cover those few cases
			forge_level = FORGE_LEVEL_LEGENDARY

	playsound(src, 'sound/weapons/parry.ogg', 50, TRUE) // Play a feedback sound to really let players know we just did an upgrade

/obj/structure/reagent_forge/tipos/attackby(obj/item/attacking_item, mob/living/user, params)
	if(!used_tray && istype(attacking_item, /obj/item/plate/oven_tray))
		add_tray_to_forge(user, attacking_item)
		return TRUE

	if(in_use) // If the forge is currently in use by someone (or there is a tray in it) then we cannot use it
		if(used_tray)
			balloon_alert(user, "remove [used_tray] first")
		balloon_alert(user, "forge busy")
		return TRUE

	if(istype(attacking_item, /obj/item/stack/sheet/mineral/wood)) // Wood is a weak fuel, and will only get the forge up to 50 temperature
		refuel(attacking_item, user)
		return TRUE

	if(istype(attacking_item, /obj/item/stack/sheet/mineral/coal)) // Coal is a strong fuel that doesn't need bellows to heat up properly
		refuel(attacking_item, user, TRUE)
		return TRUE

	if(istype(attacking_item, /obj/item/stack/ore))
		smelt_ore(attacking_item, user)
		return TRUE

	if(attacking_item.GetComponent(/datum/component/reagent_weapon))
		handle_weapon_imbue_tipos(attacking_item, user)
		return TRUE

	if(attacking_item.GetComponent(/datum/component/reagent_clothing))
		handle_clothing_imbue_tipos(attacking_item, user)
		return TRUE

	if(istype(attacking_item, /obj/item/ceramic))
		handle_ceramics(attacking_item, user)
		return TRUE

	if(istype(attacking_item, /obj/item/stack/sheet/glass))
		handle_glass_sheet_melting(attacking_item, user)
		return TRUE

	if(istype(attacking_item, /obj/item/glassblowing/metal_cup))
		handle_metal_cup_melting(attacking_item, user)
		return TRUE

	return ..()

/// Handles weapon reagent imbuing
/obj/structure/reagent_forge/tipos/proc/handle_weapon_imbue_tipos(obj/attacking_item, mob/living/user)
	//This code will refuse all non-ashwalkers & non-icecats from imbuing
	if(!ishuman(user))
		to_chat(user, span_danger("It is impossible for you to imbue!")) //maybe remove (ashwalkers & icecats only) after some time
		return

	var/mob/living/carbon/human/human_user = user
	if(!is_species(human_user, /datum/species/lizard/ashwalker) && !is_species(human_user, /datum/species/dwarf) && !is_species(human_user, /datum/species/human/felinid/primitive))
		to_chat(user, span_danger("It is impossible for you to imbue!")) //maybe remove (ashwalkers & icecats only) after some time
		return

	in_use = TRUE
	balloon_alert_to_viewers("imbuing...")

	var/obj/item/attacking_weapon = attacking_item

	var/datum/component/reagent_weapon/weapon_component = attacking_weapon.GetComponent(/datum/component/reagent_weapon)
	if(!weapon_component)
		fail_message(user, "cannot imbue")
		return

	if(length(weapon_component.imbued_reagent))
		fail_message(user, "already imbued")
		return

	if(!do_after(user, 10 SECONDS, target = src))
		fail_message(user, "stopped imbuing")
		return

	for(var/datum/reagent/weapon_reagent as anything in attacking_weapon.reagents.reagent_list)
		if(weapon_reagent.volume < MINIMUM_IMBUING_REAGENT_AMOUNT)
			attacking_weapon.reagents.remove_reagent(weapon_reagent.type)
			continue

		if(is_type_in_typecache(weapon_reagent, disallowed_reagents))
			balloon_alert(user, "cannot imbue with [weapon_reagent.name]")
			attacking_weapon.reagents.remove_reagent(weapon_reagent.type, include_subtypes = TRUE)
			continue

		weapon_component.imbued_reagent += weapon_reagent.type
		attacking_weapon.name = "[weapon_reagent.name] [attacking_weapon.name]"

	attacking_weapon.color = mix_color_from_reagents(attacking_weapon.reagents.reagent_list)
	balloon_alert_to_viewers("imbued [attacking_weapon]")
	user.mind.adjust_experience(/datum/skill/smithing, 60)
	playsound(src, 'sound/magic/demon_consume.ogg', 50, TRUE)
	in_use = FALSE
	return TRUE

/// Handles clothing imbuing, extremely similar to weapon imbuing but not in the same proc because of how uhh... goofy the way this has to be done is
/obj/structure/reagent_forge/tipos/proc/handle_clothing_imbue_tipos(obj/attacking_item, mob/living/user)
	//This code will refuse all non-ashwalkers & non-icecats from imbuing
	if(!ishuman(user))
		to_chat(user, span_danger("It is impossible for you to imbue!")) //maybe remove (ashwalkers & icecats only) after some time
		return

	var/mob/living/carbon/human/human_user = user
	if(!is_species(human_user, /datum/species/lizard/ashwalker) && !is_species(human_user, /datum/species/dwarf) && !is_species(human_user, /datum/species/human/felinid/primitive))
		to_chat(user, span_danger("It is impossible for you to imbue!")) //maybe remove (ashwalkers & icecats only) after some time
		return

	in_use = TRUE
	balloon_alert_to_viewers("imbuing...")

	var/obj/item/attacking_clothing = attacking_item

	var/datum/component/reagent_clothing/clothing_component = attacking_clothing.GetComponent(/datum/component/reagent_clothing)
	if(!clothing_component)
		fail_message(user, "cannot imbue")
		return

	if(length(clothing_component.imbued_reagent))
		fail_message(user, "already imbued")
		return

	if(!do_after(user, 10 SECONDS, target = src))
		fail_message(user, "stopped imbuing")
		return

	for(var/datum/reagent/clothing_reagent as anything in attacking_clothing.reagents.reagent_list)
		if(clothing_reagent.volume < MINIMUM_IMBUING_REAGENT_AMOUNT)
			attacking_clothing.reagents.remove_reagent(clothing_reagent.type, include_subtypes = TRUE)
			continue

		if(is_type_in_typecache(clothing_reagent, disallowed_reagents))
			balloon_alert(user, "cannot imbue with [clothing_reagent.name]")
			attacking_clothing.reagents.remove_reagent(clothing_reagent.type, include_subtypes = TRUE)
			continue

		clothing_component.imbued_reagent += clothing_reagent.type
		attacking_clothing.name = "[clothing_reagent.name] [attacking_clothing.name]"

	attacking_clothing.color = mix_color_from_reagents(attacking_clothing.reagents.reagent_list)
	balloon_alert_to_viewers("imbued [attacking_clothing]")
	user.mind.adjust_experience(/datum/skill/smithing, 60)
	playsound(src, 'sound/magic/demon_consume.ogg', 50, TRUE)
	in_use = FALSE
	return TRUE

/obj/structure/reagent_forge/tipos/blowrod_act(mob/living/user, obj/item/tool)
	var/obj/item/glassblowing/blowing_rod/blowing_item = tool
	var/glassblowing_speed = user.mind.get_skill_modifier(/datum/skill/production, SKILL_SPEED_MODIFIER) * BASELINE_ACTION_TIME
	var/glassblowing_amount = BASELINE_HEATING_DURATION / user.mind.get_skill_modifier(/datum/skill/production, SKILL_SPEED_MODIFIER)

	if(in_use)
		to_chat(user, span_warning("You cannot do multiple things at the same time!"))
		return ITEM_INTERACT_SUCCESS
	in_use = TRUE

	if(forge_temperature < MIN_FORGE_TEMP)
		fail_message(user, "The temperature is not hot enough to start heating [blowing_item].")
		return ITEM_INTERACT_SUCCESS

	var/obj/item/glassblowing/molten_glass/find_glass = locate() in blowing_item.contents
	if(!find_glass)
		fail_message(user, "[blowing_item] does not have any glass to heat up.")
		return ITEM_INTERACT_SUCCESS

	if(!COOLDOWN_FINISHED(find_glass, remaining_heat))
		fail_message(user, "[find_glass] is still has remaining heat.")
		return ITEM_INTERACT_SUCCESS

	to_chat(user, span_notice("You begin heating up [blowing_item]."))

	if(!do_after(user, glassblowing_speed, target = src))
		fail_message(user, "[blowing_item] is interrupted in its heating process.")
		return ITEM_INTERACT_SUCCESS

	COOLDOWN_START(find_glass, remaining_heat, glassblowing_amount)
	find_glass.total_time = glassblowing_amount
	to_chat(user, span_notice("You finish heating up [blowing_item]."))
	user.mind.adjust_experience(/datum/skill/smithing, 5)
	user.mind.adjust_experience(/datum/skill/production, 10)
	in_use = FALSE
	return ITEM_INTERACT_SUCCESS

/obj/structure/reagent_forge/tipos/wrench_act(mob/living/user, obj/item/tool)
	tool.play_tool_sound(src)
	deconstruct(TRUE)
	return TRUE

/obj/structure/reagent_forge/tipos/deconstruct(disassembled)
	new /obj/item/stack/sheet/iron/ten(get_turf(src))
	return ..()

/obj/structure/reagent_forge/tipos/tier2
	forge_level = FORGE_LEVEL_NOVICE

/obj/structure/reagent_forge/tipos/tier3
	forge_level = FORGE_LEVEL_APPRENTICE

/obj/structure/reagent_forge/tipos/tier4
	forge_level = FORGE_LEVEL_JOURNEYMAN

/obj/structure/reagent_forge/tipos/tier5
	forge_level = FORGE_LEVEL_EXPERT

/obj/structure/reagent_forge/tipos/tier6
	forge_level = FORGE_LEVEL_MASTER

/obj/structure/reagent_forge/tipos/tier7
	forge_level = FORGE_LEVEL_LEGENDARY

/obj/structure/reagent_forge/tipos/tier7/imbuing/Initialize(mapload)
	. = ..()
	create_reagent_forge()

/particles/smoke/mild
	spawning = 1
	velocity = list(0, 0.3, 0)
	friction = 0.25

#undef BASELINE_ACTION_TIME

#undef BASELINE_HEATING_DURATION

#undef FORGE_DEFAULT_TEMPERATURE_CHANGE
#undef MAX_FORGE_TEMP
#undef MIN_FORGE_TEMP
#undef FORGE_HEATING_DURATION

#undef FORGE_LEVEL_YOU_PLAY_LIKE_A_NOOB
#undef FORGE_LEVEL_NOVICE
#undef FORGE_LEVEL_APPRENTICE
#undef FORGE_LEVEL_JOURNEYMAN
#undef FORGE_LEVEL_EXPERT
#undef FORGE_LEVEL_MASTER
#undef FORGE_LEVEL_LEGENDARY

#undef MAX_TEMPERATURE_LOSS_DECREASE

#undef CHARCOAL_CHANCE

#undef MINIMUM_IMBUING_REAGENT_AMOUNT

#undef SMOKE_STATE_NONE
#undef SMOKE_STATE_GOOD
#undef SMOKE_STATE_NEUTRAL
#undef SMOKE_STATE_BAD
#undef SMOKE_STATE_NOT_COOKING
