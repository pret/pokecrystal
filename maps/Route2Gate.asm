Route2Gate_MapScriptHeader: ; 0x9b950
	; trigger count
	db 0

	; callback count
	db 0
; 0x9b952

ScientistScript_0x9b952: ; 0x9b952
	jumptextfaceplayer UnknownText_0x9b955
; 0x9b955

UnknownText_0x9b955: ; 0x9b955
	text "Are you ", $14, "?"

	para "I work as PROF."
	line "OAK's AIDE."

	para "I had no idea that"
	line "you were out here."

	para "PROF.OAK's LAB is"
	line "nearby in PALLET"
	cont "TOWN."
	done
; 0x9b9ca

Route2Gate_MapEventHeader: ; 0x9b9ca
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $0, $4, 3, GROUP_ROUTE_2, MAP_ROUTE_2
	warp_def $0, $5, 4, GROUP_ROUTE_2, MAP_ROUTE_2
	warp_def $7, $4, 2, GROUP_ROUTE_2, MAP_ROUTE_2
	warp_def $7, $5, 2, GROUP_ROUTE_2, MAP_ROUTE_2

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_SCIENTIST, 8, 10, $4, $20, 255, 255, $90, 0, ScientistScript_0x9b952, $ffff
; 0x9b9f1
