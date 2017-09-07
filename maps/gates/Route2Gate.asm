const_value set 2
	const ROUTE2GATE_SCIENTIST

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
	warp_def $0, $4, 3, ROUTE_2
	warp_def $0, $5, 4, ROUTE_2
	warp_def $7, $4, 2, ROUTE_2
	warp_def $7, $5, 2, ROUTE_2

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_SCIENTIST, 4, 6, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ScientistScript_0x9b952, -1
