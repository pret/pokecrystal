Route42EcruteakGate_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

OfficerScript_0x19a4b5:
	jumptextfaceplayer UnknownText_0x19a4b8

UnknownText_0x19a4b8:
	text "MT.MORTAR is like"
	line "a maze inside."

	para "Be careful. Don't"
	line "get lost in there."
	done

Route42EcruteakGate_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $4, $0, 1, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $5, $0, 2, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $4, $9, 1, GROUP_ROUTE_42, MAP_ROUTE_42
	warp_def $5, $9, 2, GROUP_ROUTE_42, MAP_ROUTE_42

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_OFFICER, 6, 9, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, OfficerScript_0x19a4b5, -1
