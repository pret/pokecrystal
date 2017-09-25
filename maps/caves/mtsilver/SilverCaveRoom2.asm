const_value set 2
	const SILVERCAVEROOM2_POKE_BALL1
	const SILVERCAVEROOM2_POKE_BALL2
	const SILVERCAVEROOM2_POKE_BALL3

SilverCaveRoom2_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

SilverCaveRoom2Calcium:
	itemball CALCIUM

SilverCaveRoom2UltraBall:
	itemball ULTRA_BALL

SilverCaveRoom2PPUp:
	itemball PP_UP

SilverCaveRoom2HiddenMaxPotion:
	dwb EVENT_SILVER_CAVE_ROOM_2_HIDDEN_MAX_POTION, MAX_POTION


SilverCaveRoom2_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $1f, $11, 2, SILVER_CAVE_ROOM_1
	warp_def $5, $b, 1, SILVER_CAVE_ROOM_3
	warp_def $15, $d, 1, SILVER_CAVE_ITEM_ROOMS
	warp_def $3, $17, 2, SILVER_CAVE_ITEM_ROOMS

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 31, 14, SIGNPOST_ITEM, SilverCaveRoom2HiddenMaxPotion

.PersonEvents:
	db 3
	person_event SPRITE_POKE_BALL, 10, 24, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SilverCaveRoom2Calcium, EVENT_SILVER_CAVE_ROOM_2_CALCIUM
	person_event SPRITE_POKE_BALL, 24, 22, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SilverCaveRoom2UltraBall, EVENT_SILVER_CAVE_ROOM_2_ULTRA_BALL
	person_event SPRITE_POKE_BALL, 20, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SilverCaveRoom2PPUp, EVENT_SILVER_CAVE_ROOM_2_PP_UP
