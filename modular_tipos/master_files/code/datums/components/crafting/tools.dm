
/datum/crafting_recipe/sharpener
	name = "Rustic Sharpener"
	reqs = list(
		/obj/item/stack/sheet/mineral/stone = 5,
		/obj/item/stack/sheet/iron = 5,
		/obj/item/stack/sheet/mineral/wood = 4,
	)
	result = /obj/item/sharpener/rustic
	category = CAT_TOOLS

/datum/crafting_recipe/common_sharpener
	name = "Common Sharpener"
	reqs = list(
		/obj/item/stack/sheet/mineral/titanium = 10,
		/obj/item/stack/sheet/iron = 10,
		/obj/item/stack/sheet/mineral/wood = 6,
	)
	result = /obj/item/sharpener/common
	category = CAT_TOOLS

/datum/crafting_recipe/heavy_sharpener
	name = "Heavy Sharpener"
	reqs = list(
		/obj/item/stack/sheet/mineral/silver = 15,
		/obj/item/stack/sheet/mineral/uranium = 15,
		/obj/item/stack/sheet/mineral/wood = 8,
	)
	result = /obj/item/sharpener/heavy
	category = CAT_TOOLS

/datum/crafting_recipe/dwarf_sharpener
	name = "Dwarf Sharpener"
	reqs = list(
		/obj/item/stack/sheet/mineral/plasma = 20,
		/obj/item/stack/sheet/mineral/gold = 20,
		/obj/item/stack/sheet/mineral/wood = 10,
	)
	result = /obj/item/sharpener/dwarf
	category = CAT_TOOLS

/datum/crafting_recipe/perfect_sharpener
	name = "Perfect Sharpener"
	reqs = list(
		/obj/item/stack/sheet/mineral/diamond = 25,
		/obj/item/stack/sheet/bluespace_crystal = 25,
		/obj/item/stack/sheet/mineral/wood = 12,
	)
	result = /obj/item/sharpener/perfect
	category = CAT_TOOLS
