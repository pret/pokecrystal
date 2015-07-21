SilverCaveRoom1_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ItemFragment_0x18c554:
	db MAX_ELIXER, 1

ItemFragment_0x18c556:
	db PROTEIN, 1

ItemFragment_0x18c558:
	db ESCAPE_ROPE, 1

ItemFragment_0x18c55a:
	db ULTRA_BALL, 1

MapSilverCaveRoom1SignpostItem0:
	dwb EVENT_SILVER_CAVE_ROOM_1_HIDDEN_DIRE_HIT, DIRE_HIT
	

MapSilverCaveRoom1SignpostItem1:
	dwb EVENT_SILVER_CAVE_ROOM_1_HIDDEN_ULTRA_BALL, ULTRA_BALL
	

SilverCaveRoom1_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $21, $9, 2, GROUP_SILVER_CAVE_OUTSIDE, MAP_SILVER_CAVE_OUTSIDE
	warp_def $1, $f, 1, GROUP_SILVER_CAVE_ROOM_2, MAP_SILVER_CAVE_ROOM_2

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 23, 16, SIGNPOST_ITEM, MapSilverCaveRoom1SignpostItem0
	signpost 12, 17, SIGNPOST_ITEM, MapSilverCaveRoom1SignpostItem1

.PersonEvents:
	db 4
	person_event SPRITE_POKE_BALL, 13, 8, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x18c554, EVENT_SILVER_CAVE_ROOM_1_MAX_ELIXER
	person_event SPRITE_POKE_BALL, 33, 19, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x18c556, EVENT_SILVER_CAVE_ROOM_1_PROTEIN
	person_event SPRITE_POKE_BALL, 34, 9, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x18c558, EVENT_SILVER_CAVE_ROOM_1_ESCAPE_ROPE
	person_event SPRITE_POKE_BALL, 22, 11, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x18c55a, EVENT_SILVER_CAVE_ROOM_1_ULTRA_BALL
