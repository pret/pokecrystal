SilverCaveOutside_MapScriptHeader: ; 0x1b2042
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x1b2047
; 0x1b2047

UnknownScript_0x1b2047: ; 0x1b2047
	setflag $004c
	return
; 0x1b204b

MapSilverCaveOutsideSignpost0Script: ; 0x1b204b
	jumpstd $0010
; 0x1b204e

MapSilverCaveOutsideSignpost1Script: ; 0x1b204e
	jumptext UnknownText_0x1b2054
; 0x1b2051

MapSilverCaveOutsideSignpostItem2: ; 0x1b2051
	dw $00b8
	db FULL_RESTORE
	
; 0x1b2054

UnknownText_0x1b2054: ; 0x1b2054
	text "MT.SILVER"
	done
; 0x1b205f

SilverCaveOutside_MapEventHeader: ; 0x1b205f
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $13, $17, 1, GROUP_SILVER_CAVE_POKECENTER_1F, MAP_SILVER_CAVE_POKECENTER_1F
	warp_def $b, $12, 1, GROUP_SILVER_CAVE_ROOM_1, MAP_SILVER_CAVE_ROOM_1

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 19, 24, $0, MapSilverCaveOutsideSignpost0Script
	signpost 13, 17, $0, MapSilverCaveOutsideSignpost1Script
	signpost 25, 9, $7, MapSilverCaveOutsideSignpostItem2

	; people-events
	db 0
; 0x1b207e
