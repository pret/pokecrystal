Route15FuchsiaGate_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

OfficerScript_0x19679e:
	jumptextfaceplayer UnknownText_0x1967a1

UnknownText_0x1967a1:
	text "You're working on"
	line "a #DEX? That's"

	para "really something."
	line "Don't give up!"
	done

Route15FuchsiaGate_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $4, $0, 8, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY
	warp_def $5, $0, 9, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY
	warp_def $4, $9, 1, GROUP_ROUTE_15, MAP_ROUTE_15
	warp_def $5, $9, 2, GROUP_ROUTE_15, MAP_ROUTE_15

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_OFFICER, 6, 9, UP << 2 | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, OfficerScript_0x19679e, -1
