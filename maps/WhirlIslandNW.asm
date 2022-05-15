WhirlIslandNW_MapScripts:
	def_scene_scripts

	def_callbacks

WhirlIslandNW_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, ROUTE_41, 1
	warp_event  5,  3, WHIRL_ISLAND_B1F, 1
	warp_event  3, 15, WHIRL_ISLAND_SW, 4
	warp_event  7, 15, WHIRL_ISLAND_CAVE, 2

	def_coord_events

	def_bg_events

	def_object_events
