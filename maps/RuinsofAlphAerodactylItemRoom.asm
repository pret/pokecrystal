RuinsofAlphAerodactylItemRoom_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ItemFragment_0x59ab6:
	db GOLD_BERRY, 1

ItemFragment_0x59ab8:
	db MOON_STONE, 1

ItemFragment_0x59aba:
	db HEAL_POWDER, 1

ItemFragment_0x59abc:
	db ENERGY_ROOT, 1

MapRuinsofAlphAerodactylItemRoomSignpost1Script:
	jumptext UnknownText_0x59ac1

UnknownText_0x59ac1:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done

RuinsofAlphAerodactylItemRoom_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $9, $3, 5, GROUP_RUINS_OF_ALPH_AERODACTYL_CHAMBER, MAP_RUINS_OF_ALPH_AERODACTYL_CHAMBER
	warp_def $9, $4, 5, GROUP_RUINS_OF_ALPH_AERODACTYL_CHAMBER, MAP_RUINS_OF_ALPH_AERODACTYL_CHAMBER
	warp_def $1, $3, 1, GROUP_RUINS_OF_ALPH_AERODACTYL_WORD_ROOM, MAP_RUINS_OF_ALPH_AERODACTYL_WORD_ROOM
	warp_def $1, $4, 2, GROUP_RUINS_OF_ALPH_AERODACTYL_WORD_ROOM, MAP_RUINS_OF_ALPH_AERODACTYL_WORD_ROOM

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 2, SIGNPOST_READ, MapRuinsofAlphAerodactylItemRoomSignpost1Script
	signpost 1, 5, SIGNPOST_READ, MapRuinsofAlphAerodactylItemRoomSignpost1Script

.PersonEvents:
	db 4
	person_event SPRITE_POKE_BALL, 10, 6, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x59ab6, EVENT_PICKED_UP_GOLD_BERRY_FROM_AERODACTYL_ITEM_ROOM
	person_event SPRITE_POKE_BALL, 10, 9, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x59ab8, EVENT_PICKED_UP_MOON_STONE_FROM_AERODACTYL_ITEM_ROOM
	person_event SPRITE_POKE_BALL, 8, 6, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x59aba, EVENT_PICKED_UP_HEAL_POWDER_FROM_AERODACTYL_ITEM_ROOM
	person_event SPRITE_POKE_BALL, 8, 9, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x59abc, EVENT_PICKED_UP_ENERGY_ROOT_FROM_AERODACTYL_ITEM_ROOM
