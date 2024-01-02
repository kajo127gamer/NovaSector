/// How many planks of wood are required to complete a weapon?
#define WEAPON_COMPLETION_WOOD_AMOUNT 2

/// The number of hits you are set back when a bad hit is made
#define BAD_HIT_PENALTY 3

/obj/structure/reagent_crafting_bench
	name = "forging workbench"
	desc = "A crafting bench fitted with tools, securing mechanisms, and a steady surface for blacksmithing."
	icon = 'modular_nova/modules/reagent_forging/icons/obj/forge_structures.dmi'
	icon_state = "crafting_bench_empty"

	anchored = TRUE
	density = TRUE

	/// What recipes are we allowed to choose from?
	allowed_choices = list(
		/datum/crafting_bench_recipe/plate_helmet,
		/datum/crafting_bench_recipe/plate_vest,
		/datum/crafting_bench_recipe/plate_gloves,
		/datum/crafting_bench_recipe/plate_boots,
		/datum/crafting_bench_recipe/horse_shoes,
		/datum/crafting_bench_recipe/ring,
		/datum/crafting_bench_recipe/collar,
		/datum/crafting_bench_recipe/handcuffs,
		/datum/crafting_bench_recipe/borer_cage,
		/datum/crafting_bench_recipe/pavise,
		/datum/crafting_bench_recipe/buckler,
		/datum/crafting_bench_recipe/coil,
		/datum/crafting_bench_recipe/seed_mesh,
		/datum/crafting_bench_recipe/centrifuge,
		/datum/crafting_bench_recipe/bokken,
		/datum/crafting_bench_recipe/bow,
		/datum/crafting_bench_recipe/heavy_plate_helmet,
        /datum/crafting_bench_recipe/heavy_plate_vest,
        /datum/crafting_bench_recipe/heavy_plate_gloves,
        /datum/crafting_bench_recipe/heavy_plate_boots,
	)

/obj/structure/reagent_crafting_bench/Initialize(mapload)
	. = ..()
	populate_radial_choice_list()

/obj/structure/reagent_crafting_bench/examine(mob/user)
	. = ..()

	if(length(contents))
		if(istype(contents[1], /obj/item/forging/complete))
			var/obj/item/forging/complete/contained_forge_item = contents[1]

			. += span_notice("[src] has a <b>[initial(contained_forge_item.name)]</b> sitting on it, awaiting completion. <br>")
			var/obj/item/completion_item = contained_forge_item.spawning_item
			. += span_notice("With <b>[WEAPON_COMPLETION_WOOD_AMOUNT]</b> sheets of <b>wood</b> nearby, and some <b>hammering</b>, it could be completed into a <b>[initial(completion_item.name)]</b>.")
			return // We don't want to show any selected recipes if there's weapon head on the bench

	if(!selected_recipe)
		return

	var/obj/resulting_item = selected_recipe.resulting_item
	. += span_notice("The selected recipe's resulting item is: <b>[initial(resulting_item.name)]</b> <br>")
	. += span_notice("Gather the required materials, listed below, <b>near the bench</b>, then start <b>hammering</b> to complete it! <br>")

	if(!length(selected_recipe.recipe_requirements))
		. += span_boldwarning("Somehow, this recipe has no requirements, report this as this shouldn't happen.")
		return

	for(var/obj/requirement_item as anything in selected_recipe.recipe_requirements)
		if(!selected_recipe.recipe_requirements[requirement_item])
			. += span_boldwarning("[requirement_item] does not have an amount required set, this should not happen, report it.")
			continue

		. += span_notice("<b>[selected_recipe.recipe_requirements[requirement_item]]</b> - [initial(requirement_item.name)]")

	return .

/obj/structure/reagent_crafting_bench/update_appearance(updates)
	. = ..()
	cut_overlays()

	if(!length(contents))
		return

	var/image/overlayed_item = image(icon = contents[1].icon, icon_state = contents[1].icon_state)
	add_overlay(overlayed_item)

/obj/structure/reagent_crafting_bench/attack_hand(mob/living/user, list/modifiers)
	. = ..()
	update_appearance()

	if(length(contents))
		var/obj/item/contained_item = contents[1]
		user.put_in_hands(contained_item)
		balloon_alert(user, "[contained_item] retrieved")
		update_appearance()
		return

	if(selected_recipe)
		clear_recipe()
		balloon_alert_to_viewers("recipe cleared")
		update_appearance()
		return

	var/chosen_recipe = show_radial_menu(user, src, radial_choice_list, radius = 38, require_near = TRUE, tooltips = TRUE)

	if(!chosen_recipe)
		balloon_alert(user, "no recipe choice")
		return

	var/datum/crafting_bench_recipe/recipe_to_use = recipe_names_to_path[chosen_recipe]
	selected_recipe = new recipe_to_use

	balloon_alert(user, "recipe chosen")
	update_appearance()
