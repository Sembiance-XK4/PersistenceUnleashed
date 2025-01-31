/obj/effect/overmap/visitable/sector/exoplanet/shrouded
	name = "shrouded exoplanet"
	desc = "An exoplanet shrouded in a perpetual storm of bizzare, light absorbing particles."
	color = "#783ca4"
	planetary_area = /area/exoplanet/shrouded
	rock_colors = list(COLOR_INDIGO, COLOR_DARK_BLUE_GRAY, COLOR_NAVY_BLUE)
	plant_colors = list("#3c5434", "#2f6655", "#0e703f", "#495139", "#394c66", "#1a3b77", "#3e3166", "#52457c", "#402d56", "#580d6d")
	map_generators = list(/datum/random_map/noise/exoplanet/shrouded, /datum/random_map/noise/ore/poor)
	ruin_tags_blacklist = RUIN_HABITAT
	surface_color = "#3e3960"
	water_color = "#2b2840"
	flora_diversity = 3
	fauna_types = list(
		/mob/living/simple_animal/hostile/retaliate/royalcrab,
		/mob/living/simple_animal/hostile/retaliate/jelly/alt,
		/mob/living/simple_animal/hostile/retaliate/beast/shantak/alt,
		/mob/living/simple_animal/hostile/leech
	)
	spawn_weight = 50

// TODO check if ambient lighting handles negatives
/obj/effect/overmap/visitable/sector/exoplanet/meat/generate_map()
	var/datum/level_data/level_data = SSmapping.levels_by_z[map_z[1]]
	level_data.ambient_light_level = -0.15
	..()

/obj/effect/overmap/visitable/sector/exoplanet/shrouded/get_target_temperature()
	return T20C - rand(10, 20)

/obj/effect/overmap/visitable/sector/exoplanet/shrouded/get_atmosphere_color()
	return COLOR_BLACK

/datum/random_map/noise/exoplanet/shrouded
	descriptor = "shrouded exoplanet"
	smoothing_iterations = 2
	flora_prob = 5
	large_flora_prob = 20
	megafauna_spawn_prob = 2 //Remember to change this if more types are added.
	water_level_max = 3
	water_level_min = 2
	land_type = /turf/exterior/shrouded
	water_type = /turf/exterior/water/tar

/datum/random_map/noise/exoplanet/shrouded/get_additional_spawns(var/value, var/turf/T)
	..()
	if(prob(2))
		new/obj/structure/leech_spawner(T)

/area/exoplanet/shrouded
	forced_ambience = list("sound/ambience/spookyspace1.ogg", "sound/ambience/spookyspace2.ogg")
	base_turf = /turf/exterior/shrouded
