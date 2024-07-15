/mob/living/simple_animal/pet/boar
	name = "boar"
	desc = "Un pequeño boar salvaje, mejor mantenerlo alejado de los monos"
	icon = 'modular_tipos/master_files/icons/mob/simple/boarmobs.dmi'
	icon_state = "boar"
	icon_living = "boar"
	icon_dead = "boar_dead"
	speak = list("PREPARE THYSELF!!", "THY BOAR IS NOW!!!", "hmmmmm, delicious twinks..... i need them....", "CARGO, WE LAKIN' DIAMONDS!!!")
	speak_emote = list("roars", "grunts", "boars")
	speak_chance = 0
	gold_core_spawnable = FRIENDLY_SPAWN
	turns_per_move = 3
	butcher_results = list(
		/obj/item/food/meat/slab = 3
	)

/mob/living/simple_animal/pet/boar/god
	name = "boar"
	max_health = 2000
	health = 2000
	desc = "Un pequeño boar salvaje, mejor mantenerlo alejado de los monos"
	icon = 'modular_tipos/master_files/icons/mob/simple/boarmobs.dmi'
	icon_state = "boar"
	icon_living = "boar"
	icon_dead = "boar_dead"
	speak_emote = list("roars", "grunts", "boars")
	gold_core_spawnable = FRIENDLY_SPAWN
	butcher_results = list(
		/obj/item/food/meat/slab = 6
	)
