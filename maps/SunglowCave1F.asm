	object_const_def
	const SUNGLOWCAVE1F_BOULDER

SunglowCave1F_MapScripts:
	def_scene_scripts

	def_callbacks

SunglowCave1FBoulder:
	jumpstd StrengthBoulderScript

SunglowCave1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  5, SUNGLOW_TRAIL, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 6, 2, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunglowCave1FBoulder, -1
