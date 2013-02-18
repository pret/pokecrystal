RuinsofAlphOmanyteItemRoom_MapScriptHeader: ; 0x59a2a
	; trigger count
	db 0

	; callback count
	db 0
; 0x59a2c

ItemFragment_0x59a2c: ; 0x59a2c
	db MYSTERYBERRY, 1
; 0x59a2e

ItemFragment_0x59a2e: ; 0x59a2e
	db MYSTIC_WATER, 1
; 0x59a30

ItemFragment_0x59a30: ; 0x59a30
	db STARDUST, 1
; 0x59a32

ItemFragment_0x59a32: ; 0x59a32
	db STAR_PIECE, 1
; 0x59a34

MapRuinsofAlphOmanyteItemRoomSignpost1Script: ; 0x59a34
	jumptext UnknownText_0x59a37
; 0x59a37

UnknownText_0x59a37: ; 0x59a37
	db $0, "It's a replica of", $4f
	db "an ancient #-", $55
	db "MON.", $57
; 0x59a5c

RuinsofAlphOmanyteItemRoom_MapEventHeader: ; 0x59a5c
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $9, $3, 5, GROUP_RUINS_OF_ALPH_OMANYTE_CHAMBER, MAP_RUINS_OF_ALPH_OMANYTE_CHAMBER
	warp_def $9, $4, 5, GROUP_RUINS_OF_ALPH_OMANYTE_CHAMBER, MAP_RUINS_OF_ALPH_OMANYTE_CHAMBER
	warp_def $1, $3, 1, GROUP_RUINS_OF_ALPH_OMANYTE_WORD_ROOM, MAP_RUINS_OF_ALPH_OMANYTE_WORD_ROOM
	warp_def $1, $4, 2, GROUP_RUINS_OF_ALPH_OMANYTE_WORD_ROOM, MAP_RUINS_OF_ALPH_OMANYTE_WORD_ROOM

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 2, $0, MapRuinsofAlphOmanyteItemRoomSignpost1Script
	signpost 1, 5, $0, MapRuinsofAlphOmanyteItemRoomSignpost1Script

	; people-events
	db 4
	person_event $54, 10, 6, $1, $0, 255, 255, $1, 0, ItemFragment_0x59a2c, $079c
	person_event $54, 10, 9, $1, $0, 255, 255, $1, 0, ItemFragment_0x59a2e, $079d
	person_event $54, 8, 6, $1, $0, 255, 255, $1, 0, ItemFragment_0x59a30, $079e
	person_event $54, 8, 9, $1, $0, 255, 255, $1, 0, ItemFragment_0x59a32, $079f
; 0x59ab4

