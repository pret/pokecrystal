Route5UndergroundEntrance_MapScriptHeader:
	; trigger count
	db 0

	; callback count
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

	; warps
	db 3
	warp_def $7, $3, 1, GROUP_ROUTE_5, MAP_ROUTE_5
	warp_def $7, $4, 1, GROUP_ROUTE_5, MAP_ROUTE_5
	warp_def $3, $4, 1, GROUP_UNDERGROUND, MAP_UNDERGROUND

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_TEACHER, 6, 6, $2, $11, 255, 255, $a0, 0, TeacherScript_0x18b555, EVENT_ALWAYS_THERE
