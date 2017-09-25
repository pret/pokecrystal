const_value set 2
	const ROUTE5UNDERGROUNDENTRANCE_TEACHER

Route5UndergroundEntrance_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TeacherScript_0x18b555:
	jumptextfaceplayer UnknownText_0x18b558

UnknownText_0x18b558:
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

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_TEACHER, 2, 2, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TeacherScript_0x18b555, -1
