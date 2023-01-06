	object_const_def

MyHouse1F_MapScripts:
	def_scene_scripts

	def_callbacks

MyHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SALTBREEZE_TOWN, 1
	warp_event  3,  7, SALTBREEZE_TOWN, 1
	warp_event  9,  0, PLAYERS_HOUSE_2F, 1

	def_coord_events

	def_bg_events

	def_object_events