Route15FuchsiaGate_MapScriptHeader: ; 0x19679c
	; trigger count
	db 0

	; callback count
	db 0
; 0x19679e

OfficerScript_0x19679e: ; 0x19679e
	jumptextfaceplayer UnknownText_0x1967a1
; 0x1967a1

UnknownText_0x1967a1: ; 0x1967a1
	text "You're working on"
	line "a #DEX? That's"

	para "really something."
	line "Don't give up!"
	done
; 0x1967e1

Route15FuchsiaGate_MapEventHeader: ; 0x1967e1
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
	person_event SPRITE_OFFICER, 6, 9, $6, $0, 255, 255, $90, 0, OfficerScript_0x19679e, $ffff
; 0x196808
