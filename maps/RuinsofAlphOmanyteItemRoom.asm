RuinsofAlphOmanyteItemRoom_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

ItemFragment_0x59a2c:
	db MYSTERYBERRY, 1

ItemFragment_0x59a2e:
	db MYSTIC_WATER, 1

ItemFragment_0x59a30:
	db STARDUST, 1

ItemFragment_0x59a32:
	db STAR_PIECE, 1

MapRuinsofAlphOmanyteItemRoomSignpost1Script:
	jumptext UnknownText_0x59a37

UnknownText_0x59a37:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done

RuinsofAlphOmanyteItemRoom_MapEventHeader:
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
	person_event SPRITE_POKE_BALL, 10, 6, $1, $0, 255, 255, $1, 0, ItemFragment_0x59a2c, $079c
	person_event SPRITE_POKE_BALL, 10, 9, $1, $0, 255, 255, $1, 0, ItemFragment_0x59a2e, $079d
	person_event SPRITE_POKE_BALL, 8, 6, $1, $0, 255, 255, $1, 0, ItemFragment_0x59a30, $079e
	person_event SPRITE_POKE_BALL, 8, 9, $1, $0, 255, 255, $1, 0, ItemFragment_0x59a32, $079f
