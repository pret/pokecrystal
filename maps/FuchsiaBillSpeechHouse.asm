FuchsiaBillSpeechHouse_MapScriptHeader: ; 0x1963bb
	; trigger count
	db 0

	; callback count
	db 0
; 0x1963bd

UnknownScript_0x1963bd: ; 0x1963bd
	jumptextfaceplayer UnknownText_0x1963c3
; 0x1963c0

UnknownScript_0x1963c0: ; 0x1963c0
	jumptextfaceplayer UnknownText_0x1963f9
; 0x1963c3

UnknownText_0x1963c3: ; 0x1963c3
	db $0, "My grandpa is at ", $4f
	db "my brother BILL's", $55
	db "on CERULEAN CAPE.", $57
; 0x1963f9

UnknownText_0x1963f9: ; 0x1963f9
	db $0, "I saw these weird,", $4f
	db "slow #MON on", $55
	db "CYCLING ROAD.", $57
; 0x196428

FuchsiaBillSpeechHouse_MapEventHeader: ; 0x196428
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 4, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY
	warp_def $7, $3, 4, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event $2e, 7, 6, $9, $0, 255, 255, $80, 0, UnknownScript_0x1963bd, $ffff
	person_event $27, 8, 10, $4, $10, 255, 255, $0, 0, UnknownScript_0x1963c0, $ffff
; 0x196452

