Route2Gate_MapScriptHeader: ; 0x9b950
	; trigger count
	db 0

	; callback count
	db 0
; 0x9b952

UnknownScript_0x9b952: ; 0x9b952
	jumptextfaceplayer UnknownText_0x9b955
; 0x9b955

UnknownText_0x9b955: ; 0x9b955
	db $0, "Are you ", $14, "?", $51
	db "I work as PROF.", $4f
	db "OAK's AIDE.", $51
	db "I had no idea that", $4f
	db "you were out here.", $51
	db "PROF.OAK's LAB is", $4f
	db "nearby in PALLET", $55
	db "TOWN.", $57
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
	person_event $3c, 8, 10, $4, $20, 255, 255, $90, 0, UnknownScript_0x9b952, $ffff
; 0x9b9f1

