SilverCaveItemRooms_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ItemFragment_0x18c65e:
	db MAX_REVIVE, 1

ItemFragment_0x18c660:
	db FULL_RESTORE, 1

SilverCaveItemRooms_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $3, $d, 3, GROUP_SILVER_CAVE_ROOM_2, MAP_SILVER_CAVE_ROOM_2
	warp_def $f, $7, 4, GROUP_SILVER_CAVE_ROOM_2, MAP_SILVER_CAVE_ROOM_2

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_POKE_BALL, 7, 10, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x18c65e, EVENT_SILVER_CAVE_ITEM_ROOMS_MAX_REVIVE
	person_event SPRITE_POKE_BALL, 15, 19, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x18c660, EVENT_SILVER_CAVE_ITEM_ROOMS_FULL_RESTORE
