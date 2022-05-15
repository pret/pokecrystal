Route6UndergroundPathEntrance_MapScripts:
	def_scene_scripts

	def_callbacks

Route6UndergroundPathEntrance_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ROUTE_6, 1
	warp_event  4,  7, ROUTE_6, 1
	warp_event  4,  3, UNDERGROUND_PATH, 2

	def_coord_events

	def_bg_events

	def_object_events
