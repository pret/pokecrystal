RuinsofAlphKabutoItemRoom_MapScriptHeader:
	; trigger count
	db 0

	; callback count
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

	; warps
	db 4
	warp_def $9, $3, 5, GROUP_RUINS_OF_ALPH_KABUTO_CHAMBER, MAP_RUINS_OF_ALPH_KABUTO_CHAMBER
	warp_def $9, $4, 5, GROUP_RUINS_OF_ALPH_KABUTO_CHAMBER, MAP_RUINS_OF_ALPH_KABUTO_CHAMBER
	warp_def $1, $3, 1, GROUP_RUINS_OF_ALPH_KABUTO_WORD_ROOM, MAP_RUINS_OF_ALPH_KABUTO_WORD_ROOM
	warp_def $1, $4, 2, GROUP_RUINS_OF_ALPH_KABUTO_WORD_ROOM, MAP_RUINS_OF_ALPH_KABUTO_WORD_ROOM

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 2, $0, MapRuinsofAlphKabutoItemRoomSignpost1Script
	signpost 1, 5, $0, MapRuinsofAlphKabutoItemRoomSignpost1Script

	; people-events
	db 4
	person_event SPRITE_POKE_BALL, 10, 6, $1, $0, 255, 255, $1, 0, ItemFragment_0x599a2, $0798
	person_event SPRITE_POKE_BALL, 10, 9, $1, $0, 255, 255, $1, 0, ItemFragment_0x599a4, $0799
	person_event SPRITE_POKE_BALL, 8, 6, $1, $0, 255, 255, $1, 0, ItemFragment_0x599a6, $079a
	person_event SPRITE_POKE_BALL, 8, 9, $1, $0, 255, 255, $1, 0, ItemFragment_0x599a8, $079b
