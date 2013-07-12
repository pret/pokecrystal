FightingDojo_MapScriptHeader: ; 0x189b5f
	; trigger count
	db 0

	; callback count
	db 0
; 0x189b61

BlackBeltScript_0x189b61: ; 0x189b61
	jumptextfaceplayer UnknownText_0x189b6c
; 0x189b64

MapFightingDojoSignpost0Script: ; 0x189b64
	jumptext UnknownText_0x189bc0
; 0x189b67

MapFightingDojoSignpost1Script: ; 0x189b67
	jumptext UnknownText_0x189be0
; 0x189b6a

ItemFragment_0x189b6a: ; 0x189b6a
	db FOCUS_BAND, 1
; 0x189b6c

UnknownText_0x189b6c: ; 0x189b6c
	db $0, "Hello!", $51
	db "KARATE KING, the", $4f
	db "FIGHTING DOJO's", $51
	db "master, is in a", $4f
	db "cave in JOHTO for", $55
	db "training.", $57
; 0x189bc0

UnknownText_0x189bc0: ; 0x189bc0
	db $0, "What goes around", $4f
	db "comes around!", $57
; 0x189be0

UnknownText_0x189be0: ; 0x189be0
	db $0, "Enemies on every", $4f
	db "side!", $57
; 0x189bf8

FightingDojo_MapEventHeader: ; 0x189bf8
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $b, $4, 1, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $b, $5, 1, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 0, 4, $0, MapFightingDojoSignpost0Script
	signpost 0, 5, $0, MapFightingDojoSignpost1Script

	; people-events
	db 2
	person_event SPRITE_BLACK_BELT, 8, 8, $6, $0, 255, 255, $90, 0, BlackBeltScript_0x189b61, $ffff
	person_event SPRITE_POKE_BALL, 5, 7, $1, $0, 255, 255, $1, 0, ItemFragment_0x189b6a, $077d
; 0x189c2c

