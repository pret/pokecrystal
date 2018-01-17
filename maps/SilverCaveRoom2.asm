const_value set 2
	const SILVERCAVEROOM2_POKE_BALL1
	const SILVERCAVEROOM2_POKE_BALL2
	const SILVERCAVEROOM2_POKE_BALL3

SilverCaveRoom2_MapScripts:
.SceneScripts:
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
	hiddenitem EVENT_SILVER_CAVE_ROOM_2_HIDDEN_MAX_POTION, MAX_POTION

SilverCaveRoom2_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def 17, 31, 2, SILVER_CAVE_ROOM_1
	warp_def 11, 5, 1, SILVER_CAVE_ROOM_3
	warp_def 13, 21, 1, SILVER_CAVE_ITEM_ROOMS
	warp_def 23, 3, 2, SILVER_CAVE_ITEM_ROOMS

.CoordEvents:
	db 0

.BGEvents:
	db 1
	bg_event 14, 31, BGEVENT_ITEM, SilverCaveRoom2HiddenMaxPotion

.ObjectEvents:
	db 3
	object_event 24, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom2Calcium, EVENT_SILVER_CAVE_ROOM_2_CALCIUM
	object_event 22, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom2UltraBall, EVENT_SILVER_CAVE_ROOM_2_ULTRA_BALL
	object_event 4, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom2PPUp, EVENT_SILVER_CAVE_ROOM_2_PP_UP
