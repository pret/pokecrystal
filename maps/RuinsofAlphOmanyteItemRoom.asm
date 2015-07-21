RuinsofAlphOmanyteItemRoom_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
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

.Warps:
	db 4
	warp_def $9, $3, 5, GROUP_RUINS_OF_ALPH_OMANYTE_CHAMBER, MAP_RUINS_OF_ALPH_OMANYTE_CHAMBER
	warp_def $9, $4, 5, GROUP_RUINS_OF_ALPH_OMANYTE_CHAMBER, MAP_RUINS_OF_ALPH_OMANYTE_CHAMBER
	warp_def $1, $3, 1, GROUP_RUINS_OF_ALPH_OMANYTE_WORD_ROOM, MAP_RUINS_OF_ALPH_OMANYTE_WORD_ROOM
	warp_def $1, $4, 2, GROUP_RUINS_OF_ALPH_OMANYTE_WORD_ROOM, MAP_RUINS_OF_ALPH_OMANYTE_WORD_ROOM

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 2, SIGNPOST_READ, MapRuinsofAlphOmanyteItemRoomSignpost1Script
	signpost 1, 5, SIGNPOST_READ, MapRuinsofAlphOmanyteItemRoomSignpost1Script

.PersonEvents:
	db 4
	person_event SPRITE_POKE_BALL, 10, 6, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x59a2c, EVENT_PICKED_UP_MYSTERYBERRY_FROM_OMANYTE_ITEM_ROOM
	person_event SPRITE_POKE_BALL, 10, 9, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x59a2e, EVENT_PICKED_UP_MYSTIC_WATER_FROM_OMANYTE_ITEM_ROOM
	person_event SPRITE_POKE_BALL, 8, 6, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x59a30, EVENT_PICKED_UP_STARDUST_FROM_OMANYTE_ITEM_ROOM
	person_event SPRITE_POKE_BALL, 8, 9, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x59a32, EVENT_PICKED_UP_STAR_PIECE_FROM_OMANYTE_ITEM_ROOM
