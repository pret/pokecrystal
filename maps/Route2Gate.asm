Route2Gate_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ScientistScript_0x9b952:
	jumptextfaceplayer UnknownText_0x9b955

UnknownText_0x9b955:
	text "Are you <PLAY_G>?"

	para "I work as PROF."
	line "OAK's AIDE."

	para "I had no idea that"
	line "you were out here."

	para "PROF.OAK's LAB is"
	line "nearby in PALLET"
	cont "TOWN."
	done

Route2Gate_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $0, $4, 3, GROUP_ROUTE_2, MAP_ROUTE_2
	warp_def $0, $5, 4, GROUP_ROUTE_2, MAP_ROUTE_2
	warp_def $7, $4, 2, GROUP_ROUTE_2, MAP_ROUTE_2
	warp_def $7, $5, 2, GROUP_ROUTE_2, MAP_ROUTE_2

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_SCIENTIST, 8, 10, OW_UP | $0, $20, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, ScientistScript_0x9b952, -1
