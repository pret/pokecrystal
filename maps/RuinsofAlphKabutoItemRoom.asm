RuinsofAlphKabutoItemRoom_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ItemFragment_0x599a2:
	db BERRY, 1

ItemFragment_0x599a4:
	db PSNCUREBERRY, 1

ItemFragment_0x599a6:
	db HEAL_POWDER, 1

ItemFragment_0x599a8:
	db ENERGYPOWDER, 1

MapRuinsofAlphKabutoItemRoomSignpost1Script:
	jumptext UnknownText_0x599ad

UnknownText_0x599ad:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done

RuinsofAlphKabutoItemRoom_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $9, $3, 5, GROUP_RUINS_OF_ALPH_KABUTO_CHAMBER, MAP_RUINS_OF_ALPH_KABUTO_CHAMBER
	warp_def $9, $4, 5, GROUP_RUINS_OF_ALPH_KABUTO_CHAMBER, MAP_RUINS_OF_ALPH_KABUTO_CHAMBER
	warp_def $1, $3, 1, GROUP_RUINS_OF_ALPH_KABUTO_WORD_ROOM, MAP_RUINS_OF_ALPH_KABUTO_WORD_ROOM
	warp_def $1, $4, 2, GROUP_RUINS_OF_ALPH_KABUTO_WORD_ROOM, MAP_RUINS_OF_ALPH_KABUTO_WORD_ROOM

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 2, SIGNPOST_READ, MapRuinsofAlphKabutoItemRoomSignpost1Script
	signpost 1, 5, SIGNPOST_READ, MapRuinsofAlphKabutoItemRoomSignpost1Script

.PersonEvents:
	db 4
	person_event SPRITE_POKE_BALL, 10, 6, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x599a2, EVENT_PICKED_UP_BERRY_FROM_KABUTO_ITEM_ROOM
	person_event SPRITE_POKE_BALL, 10, 9, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x599a4, EVENT_PICKED_UP_PSNCUREBERRY_FROM_KABUTO_ITEM_ROOM
	person_event SPRITE_POKE_BALL, 8, 6, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x599a6, EVENT_PICKED_UP_HEAL_POWDER_FROM_KABUTO_ITEM_ROOM
	person_event SPRITE_POKE_BALL, 8, 9, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x599a8, EVENT_PICKED_UP_ENERGYPOWDER_FROM_KABUTO_ITEM_ROOM
