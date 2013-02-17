PewterSnoozeSpeechHouse_MapScriptHeader: ; 0x1a3057
	; trigger count
	db 0

	; callback count
	db 0
; 0x1a3059

UnknownScript_0x1a3059: ; 0x1a3059
	jumptextfaceplayer UnknownText_0x1a305f
; 0x1a305c

MapPewterSnoozeSpeechHouseSignpost1Script: ; 0x1a305c
	jumpstd $0002
; 0x1a305f

UnknownText_0x1a305f: ; 0x1a305f
	db $0, "I like snoozing", $4f
	db "with the radio on…", $55
	db "…Zzzz…", $57
; 0x1a308a

PewterSnoozeSpeechHouse_MapEventHeader: ; 0x1a308a
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 5, GROUP_PEWTER_CITY, MAP_PEWTER_CITY
	warp_def $7, $3, 5, GROUP_PEWTER_CITY, MAP_PEWTER_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, MapPewterSnoozeSpeechHouseSignpost1Script
	signpost 1, 1, $0, MapPewterSnoozeSpeechHouseSignpost1Script

	; people-events
	db 1
	person_event $2f, 7, 9, $8, $0, 255, 255, $90, 0, UnknownScript_0x1a3059, $ffff
; 0x1a30b1



