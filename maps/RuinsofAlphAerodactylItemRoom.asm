RuinsofAlphAerodactylItemRoom_MapScriptHeader: ; 0x59ab4
	; trigger count
	db 0

	; callback count
	db 0
; 0x59ab6

ItemFragment_0x59ab6: ; 0x59ab6
	db GOLD_BERRY, 1
; 0x59ab8

ItemFragment_0x59ab8: ; 0x59ab8
	db MOON_STONE, 1
; 0x59aba

ItemFragment_0x59aba: ; 0x59aba
	db HEAL_POWDER, 1
; 0x59abc

ItemFragment_0x59abc: ; 0x59abc
	db ENERGY_ROOT, 1
; 0x59abe

MapRuinsofAlphAerodactylItemRoomSignpost1Script: ; 0x59abe
	jumptext UnknownText_0x59ac1
; 0x59ac1

UnknownText_0x59ac1: ; 0x59ac1
	db $0, "It's a replica of", $4f
	db "an ancient #-", $55
	db "MON.", $57
; 0x59ae6

RuinsofAlphAerodactylItemRoom_MapEventHeader: ; 0x59ae6
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $9, $3, 5, GROUP_RUINS_OF_ALPH_AERODACTYL_CHAMBER, MAP_RUINS_OF_ALPH_AERODACTYL_CHAMBER
	warp_def $9, $4, 5, GROUP_RUINS_OF_ALPH_AERODACTYL_CHAMBER, MAP_RUINS_OF_ALPH_AERODACTYL_CHAMBER
	warp_def $1, $3, 1, GROUP_RUINS_OF_ALPH_AERODACTYL_WORD_ROOM, MAP_RUINS_OF_ALPH_AERODACTYL_WORD_ROOM
	warp_def $1, $4, 2, GROUP_RUINS_OF_ALPH_AERODACTYL_WORD_ROOM, MAP_RUINS_OF_ALPH_AERODACTYL_WORD_ROOM

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 2, $0, MapRuinsofAlphAerodactylItemRoomSignpost1Script
	signpost 1, 5, $0, MapRuinsofAlphAerodactylItemRoomSignpost1Script

	; people-events
	db 4
	person_event $54, 10, 6, $1, $0, 255, 255, $1, 0, ItemFragment_0x59ab6, $07a0
	person_event $54, 10, 9, $1, $0, 255, 255, $1, 0, ItemFragment_0x59ab8, $07a1
	person_event $54, 8, 6, $1, $0, 255, 255, $1, 0, ItemFragment_0x59aba, $07a2
	person_event $54, 8, 9, $1, $0, 255, 255, $1, 0, ItemFragment_0x59abc, $07a3
; 0x59b3e

