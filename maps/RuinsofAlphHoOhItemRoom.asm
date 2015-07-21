RuinsofAlphHoOhItemRoom_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ItemFragment_0x59918:
	db GOLD_BERRY, 1

ItemFragment_0x5991a:
	db MYSTERYBERRY, 1

ItemFragment_0x5991c:
	db REVIVAL_HERB, 1

ItemFragment_0x5991e:
	db CHARCOAL, 1

MapRuinsofAlphHoOhItemRoomSignpost1Script:
	jumptext UnknownText_0x59923

UnknownText_0x59923:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done

RuinsofAlphHoOhItemRoom_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $9, $3, 5, GROUP_RUINS_OF_ALPH_HO_OH_CHAMBER, MAP_RUINS_OF_ALPH_HO_OH_CHAMBER
	warp_def $9, $4, 5, GROUP_RUINS_OF_ALPH_HO_OH_CHAMBER, MAP_RUINS_OF_ALPH_HO_OH_CHAMBER
	warp_def $1, $3, 1, GROUP_RUINS_OF_ALPH_HO_OH_WORD_ROOM, MAP_RUINS_OF_ALPH_HO_OH_WORD_ROOM
	warp_def $1, $4, 2, GROUP_RUINS_OF_ALPH_HO_OH_WORD_ROOM, MAP_RUINS_OF_ALPH_HO_OH_WORD_ROOM

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 2, SIGNPOST_READ, MapRuinsofAlphHoOhItemRoomSignpost1Script
	signpost 1, 5, SIGNPOST_READ, MapRuinsofAlphHoOhItemRoomSignpost1Script

.PersonEvents:
	db 4
	person_event SPRITE_POKE_BALL, 10, 6, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x59918, EVENT_PICKED_UP_GOLD_BERRY_FROM_HO_OH_ITEM_ROOM
	person_event SPRITE_POKE_BALL, 10, 9, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x5991a, EVENT_PICKED_UP_MYSTERYBERRY_FROM_HO_OH_ITEM_ROOM
	person_event SPRITE_POKE_BALL, 8, 6, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x5991c, EVENT_PICKED_UP_REVIVAL_HERB_FROM_HO_OH_ITEM_ROOM
	person_event SPRITE_POKE_BALL, 8, 9, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x5991e, EVENT_PICKED_UP_CHARCOAL_FROM_HO_OH_ITEM_ROOM
