	object_const_def
	const ROUTE5UNDERGROUNDPATHENTRANCE_TEACHER

Route5UndergroundPathEntrance_MapScripts:
	def_scene_scripts

	def_callbacks

Route5UndergroundPathEntranceTeacherScript:
	jumptextfaceplayer Route5UndergroundPathEntranceTeacherText

Route5UndergroundPathEntranceTeacherText:
	text "Many cities in"
	line "JOHTO have long"

	para "histories. I'd"
	line "love to visit!"
	done

Route5UndergroundPathEntrance_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ROUTE_5, 1
	warp_event  4,  7, ROUTE_5, 1
	warp_event  4,  3, UNDERGROUND_PATH, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  2, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route5UndergroundPathEntranceTeacherScript, -1
