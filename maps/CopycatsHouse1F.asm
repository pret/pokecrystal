CopycatsHouse1F_MapScriptHeader: ; 0x18ad11
	; trigger count
	db 0

	; callback count
	db 0
; 0x18ad13

PokefanMScript_0x18ad13: ; 0x18ad13
	jumptextfaceplayer UnknownText_0x18ad34
; 0x18ad16

PokefanFScript_0x18ad16: ; 0x18ad16
	faceplayer
	loadfont
	checkbit1 EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x18ad24
	2writetext UnknownText_0x18ad95
	closetext
	loadmovesprites
	end
; 0x18ad24

UnknownScript_0x18ad24: ; 0x18ad24
	2writetext UnknownText_0x18add3
	closetext
	loadmovesprites
	end
; 0x18ad2a

ClefairyScript_0x18ad2a: ; 0x18ad2a
	loadfont
	2writetext UnknownText_0x18ae4b
	cry BLISSEY
	closetext
	loadmovesprites
	end
; 0x18ad34

UnknownText_0x18ad34: ; 0x18ad34
	db $0, "My daughter likes", $4f
	db "to mimic people.", $51
	db "Her mimicry has", $4f
	db "earned her the", $51
	db "nickname COPYCAT", $4f
	db "around here.", $57
; 0x18ad95

UnknownText_0x18ad95: ; 0x18ad95
	db $0, "My daughter is so", $4f
	db "self-centered…", $51
	db "She only has a few", $4f
	db "friends.", $57
; 0x18add3

UnknownText_0x18add3: ; 0x18add3
	db $0, "She recently lost", $4f
	db "the # DOLL that", $51
	db "a boy gave her", $4f
	db "three years ago.", $51
	db "Ever since then,", $4f
	db "she's gotten even", $55
	db "better at mimicry…", $57
; 0x18ae4b

UnknownText_0x18ae4b: ; 0x18ae4b
	db $0, "BLISSEY: Bliisii!", $57
; 0x18ae5e

CopycatsHouse1F_MapEventHeader: ; 0x18ae5e
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $2, 8, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $7, $3, 8, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $0, $2, 1, GROUP_COPYCATS_HOUSE_2F, MAP_COPYCATS_HOUSE_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_POKEFAN_M, 7, 6, $6, $0, 255, 255, $0, 0, PokefanMScript_0x18ad13, $ffff
	person_event SPRITE_POKEFAN_F, 8, 9, $8, $0, 255, 255, $a0, 0, PokefanFScript_0x18ad16, $ffff
	person_event SPRITE_CLEFAIRY, 10, 10, $16, $0, 255, 255, $0, 0, ClefairyScript_0x18ad2a, $ffff
; 0x18ae9a

