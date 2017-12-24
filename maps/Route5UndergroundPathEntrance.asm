const_value set 2
	const ROUTE5UNDERGROUNDPATHENTRANCE_TEACHER

Route5UndergroundPathEntrance_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

Route5UndergroundPathEntranceTeacherScript:
	jumptextfaceplayer Route5UndergroundPathEntranceTeacherText

Route5UndergroundPathEntranceTeacherText:
	text "Many cities in"
	line "JOHTO have long"

	para "histories. I'd"
	line "love to visit!"
	done

Route5UndergroundPathEntrance_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $3, 1, ROUTE_5
	warp_def $7, $4, 1, ROUTE_5
	warp_def $3, $4, 1, UNDERGROUND_PATH

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 1
	object_event SPRITE_TEACHER, 2, 2, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route5UndergroundPathEntranceTeacherScript, -1
