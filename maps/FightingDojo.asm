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
	text "Hello!"

	para "KARATE KING, the"
	line "FIGHTING DOJO's"

	para "master, is in a"
	line "cave in JOHTO for"
	cont "training."
	done
; 0x189bc0

UnknownText_0x189bc0: ; 0x189bc0
	text "What goes around"
	line "comes around!"
	done
; 0x189be0

UnknownText_0x189be0: ; 0x189be0
	text "Enemies on every"
	line "side!"
	done
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
