TinTower2F_MapScripts:
	def_scene_scripts

	def_callbacks

TinTower2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 14, TIN_TOWER_3F, 1
	warp_event 10,  2, TIN_TOWER_1F, 3

	def_coord_events

	def_bg_events

	def_object_events
