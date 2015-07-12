SilverCaveItemRooms_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

ItemFragment_0x18c65e:
	db MAX_REVIVE, 1

ItemFragment_0x18c660:
	db FULL_RESTORE, 1

SilverCaveItemRooms_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $3, $d, 3, GROUP_SILVER_CAVE_ROOM_2, MAP_SILVER_CAVE_ROOM_2
	warp_def $f, $7, 4, GROUP_SILVER_CAVE_ROOM_2, MAP_SILVER_CAVE_ROOM_2

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_POKE_BALL, 7, 10, $1, $0, 255, 255, $1, 0, ItemFragment_0x18c65e, EVENT_69C
	person_event SPRITE_POKE_BALL, 15, 19, $1, $0, 255, 255, $1, 0, ItemFragment_0x18c660, EVENT_69D
