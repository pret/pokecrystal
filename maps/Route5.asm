Route5_MapScriptHeader: ; 0x1adb17
	; trigger count
	db 0

	; callback count
	db 0
; 0x1adb19

UnknownScript_0x1adb19: ; 0x1adb19
	jumptextfaceplayer UnknownText_0x1adb22
; 0x1adb1c

MapRoute5Signpost0Script: ; 0x1adb1c
	jumptext UnknownText_0x1adb66
; 0x1adb1f

MapRoute5Signpost1Script: ; 0x1adb1f
	jumptext UnknownText_0x1adb97
; 0x1adb22

UnknownText_0x1adb22: ; 0x1adb22
	db $0, "The road is closed", $4f
	db "until the problem", $51
	db "at the POWER PLANT", $4f
	db "is solved.", $57
; 0x1adb66

UnknownText_0x1adb66: ; 0x1adb66
	db $0, "UNDERGROUND PATH", $51
	db "CERULEAN CITY -", $4f
	db "VERMILION CITY", $57
; 0x1adb97

UnknownText_0x1adb97: ; 0x1adb97
	db $0, "What's this?", $51
	db "House for Sale…", $4f
	db "Nobody lives here.", $57
; 0x1adbc7

Route5_MapEventHeader: ; 0x1adbc7
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $f, $11, 1, GROUP_ROUTE_5_UNDERGROUND_ENTRANCE, MAP_ROUTE_5_UNDERGROUND_ENTRANCE
	warp_def $11, $8, 1, GROUP_ROUTE_5_SAFFRON_CITY_GATE, MAP_ROUTE_5_SAFFRON_CITY_GATE
	warp_def $11, $9, 2, GROUP_ROUTE_5_SAFFRON_CITY_GATE, MAP_ROUTE_5_SAFFRON_CITY_GATE
	warp_def $b, $a, 1, GROUP_ROUTE_5_CLEANSE_TAG_SPEECH_HOUSE, MAP_ROUTE_5_CLEANSE_TAG_SPEECH_HOUSE

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 17, 17, $0, MapRoute5Signpost0Script
	signpost 11, 10, $0, MapRoute5Signpost1Script

	; people-events
	db 1
	person_event $2d, 20, 21, $6, $0, 255, 255, $80, 0, UnknownScript_0x1adb19, $0771
; 0x1adbf8

