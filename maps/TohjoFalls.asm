TohjoFalls_MapScriptHeader: ; 0x18db00
	; trigger count
	db 0

	; callback count
	db 0
; 0x18db02

ItemFragment_0x18db02: ; 0x18db02
	db MOON_STONE, 1
; 0x18db04

TohjoFalls_MapEventHeader: ; 0x18db04
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $f, $d, 2, GROUP_ROUTE_27, MAP_ROUTE_27
	warp_def $f, $19, 3, GROUP_ROUTE_27, MAP_ROUTE_27

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event $54, 10, 6, $1, $0, 255, 255, $1, 0, ItemFragment_0x18db02, $06a9
; 0x18db21

