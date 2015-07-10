Route2946Gate_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

OfficerScript_0x7b5bb:
	jumptextfaceplayer UnknownText_0x7b5c1

YoungsterScript_0x7b5be:
	jumptextfaceplayer UnknownText_0x7b60d

UnknownText_0x7b5c1:
	text "You can't climb"
	line "ledges."

	para "But you can jump"
	line "down from them to"
	cont "take a shortcut."
	done

UnknownText_0x7b60d:
	text "Different kinds of"
	line "#MON appear"
	cont "past here."

	para "If you want to"
	line "catch them all,"

	para "you have to look"
	line "everywhere."
	done

Route2946Gate_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $0, $4, 1, GROUP_ROUTE_46, MAP_ROUTE_46
	warp_def $0, $5, 2, GROUP_ROUTE_46, MAP_ROUTE_46
	warp_def $7, $4, 1, GROUP_ROUTE_29, MAP_ROUTE_29
	warp_def $7, $5, 1, GROUP_ROUTE_29, MAP_ROUTE_29

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_OFFICER, 8, 4, $9, $0, 255, 255, $80, 0, OfficerScript_0x7b5bb, $ffff
	person_event SPRITE_YOUNGSTER, 8, 10, $4, $10, 255, 255, $a0, 0, YoungsterScript_0x7b5be, $ffff
