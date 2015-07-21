Route8SaffronGate_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

OfficerScript_0x7f416:
	jumptextfaceplayer UnknownText_0x7f419

UnknownText_0x7f419:
	text "Have you been to"
	line "LAVENDER TOWN?"

	para "There's a tall"
	line "RADIO TOWER there."
	done

Route8SaffronGate_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $4, $0, 14, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $5, $0, 15, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $4, $9, 1, GROUP_ROUTE_8, MAP_ROUTE_8
	warp_def $5, $9, 2, GROUP_ROUTE_8, MAP_ROUTE_8

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_OFFICER, 6, 9, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, OfficerScript_0x7f416, -1
