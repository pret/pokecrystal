WhirlIslandB1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ItemFragment_0x18c410:
	db FULL_RESTORE, 1

ItemFragment_0x18c412:
	db CARBOS, 1

ItemFragment_0x18c414:
	db CALCIUM, 1

ItemFragment_0x18c416:
	db NUGGET, 1

ItemFragment_0x18c418:
	db ESCAPE_ROPE, 1

WhirlIslandB1FBoulder:
	jumpstd strengthboulder

MapWhirlIslandB1FSignpostItem0:
	dwb EVENT_WHIRL_ISLAND_B1F_HIDDEN_RARE_CANDY, RARE_CANDY
	

MapWhirlIslandB1FSignpostItem1:
	dwb EVENT_WHIRL_ISLAND_B1F_HIDDEN_ULTRA_BALL, ULTRA_BALL
	

MapWhirlIslandB1FSignpostItem2:
	dwb EVENT_WHIRL_ISLAND_B1F_HIDDEN_FULL_RESTORE, FULL_RESTORE
	

WhirlIslandB1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 9
	warp_def $5, $5, 2, GROUP_WHIRL_ISLAND_NW, MAP_WHIRL_ISLAND_NW
	warp_def $3, $23, 2, GROUP_WHIRL_ISLAND_NE, MAP_WHIRL_ISLAND_NE
	warp_def $9, $1d, 3, GROUP_WHIRL_ISLAND_NE, MAP_WHIRL_ISLAND_NE
	warp_def $1f, $9, 3, GROUP_WHIRL_ISLAND_SW, MAP_WHIRL_ISLAND_SW
	warp_def $1f, $17, 2, GROUP_WHIRL_ISLAND_SW, MAP_WHIRL_ISLAND_SW
	warp_def $1d, $1f, 2, GROUP_WHIRL_ISLAND_SE, MAP_WHIRL_ISLAND_SE
	warp_def $15, $19, 1, GROUP_WHIRL_ISLAND_B2F, MAP_WHIRL_ISLAND_B2F
	warp_def $1b, $d, 2, GROUP_WHIRL_ISLAND_B2F, MAP_WHIRL_ISLAND_B2F
	warp_def $15, $11, 1, GROUP_WHIRL_ISLAND_CAVE, MAP_WHIRL_ISLAND_CAVE

.XYTriggers:
	db 0

.Signposts:
	db 3
	signpost 4, 30, SIGNPOST_ITEM, MapWhirlIslandB1FSignpostItem0
	signpost 18, 36, SIGNPOST_ITEM, MapWhirlIslandB1FSignpostItem1
	signpost 23, 2, SIGNPOST_ITEM, MapWhirlIslandB1FSignpostItem2

.PersonEvents:
	db 6
	person_event SPRITE_POKE_BALL, 17, 11, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x18c410, EVENT_WHIRL_ISLAND_B1F_FULL_RESTORE
	person_event SPRITE_POKE_BALL, 22, 6, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x18c412, EVENT_WHIRL_ISLAND_B1F_CARBOS
	person_event SPRITE_POKE_BALL, 27, 37, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x18c414, EVENT_WHIRL_ISLAND_B1F_CALCIUM
	person_event SPRITE_POKE_BALL, 12, 21, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x18c416, EVENT_WHIRL_ISLAND_B1F_NUGGET
	person_event SPRITE_POKE_BALL, 30, 23, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x18c418, EVENT_WHIRL_ISLAND_B1F_ESCAPE_ROPE
	person_event SPRITE_BOULDER, 30, 27, OW_LEFT | $11, $0, -1, -1, $0, 0, WhirlIslandB1FBoulder, -1
