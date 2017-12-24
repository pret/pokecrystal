const_value set 2
	const ROUTE5UNDERGROUNDENTRANCE_TEACHER

Route5UndergroundEntrance_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

Route5UndergroundEntranceTeacherScript:
	jumptextfaceplayer Route5UndergroundEntranceTeacherText

Route5UndergroundEntranceTeacherText:
	text "Many cities in"
	line "JOHTO have long"

	para "histories. I'd"
	line "love to visit!"
	done

Route5UndergroundEntrance_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $3, 1, ROUTE_5
	warp_def $7, $4, 1, ROUTE_5
	warp_def $3, $4, 1, UNDERGROUND

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 1
	object_event SPRITE_TEACHER, 2, 2, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route5UndergroundEntranceTeacherScript, -1
