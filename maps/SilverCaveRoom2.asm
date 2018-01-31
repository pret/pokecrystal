const_value set 2 ; person constants
	const SILVERCAVEROOM2_POKE_BALL1
	const SILVERCAVEROOM2_POKE_BALL2
	const SILVERCAVEROOM2_POKE_BALL3

SilverCaveRoom2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SilverCaveRoom2Calcium:
	itemball CALCIUM

SilverCaveRoom2UltraBall:
	itemball ULTRA_BALL

SilverCaveRoom2PPUp:
	itemball PP_UP

SilverCaveRoom2HiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_SILVER_CAVE_ROOM_2_HIDDEN_MAX_POTION

SilverCaveRoom2_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 17, 31, 2, SILVER_CAVE_ROOM_1
	warp_event 11, 5, 1, SILVER_CAVE_ROOM_3
	warp_event 13, 21, 1, SILVER_CAVE_ITEM_ROOMS
	warp_event 23, 3, 2, SILVER_CAVE_ITEM_ROOMS

	db 0 ; coord events

	db 1 ; bg events
	bg_event 14, 31, BGEVENT_ITEM, SilverCaveRoom2HiddenMaxPotion

	db 3 ; object events
	object_event 24, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom2Calcium, EVENT_SILVER_CAVE_ROOM_2_CALCIUM
	object_event 22, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom2UltraBall, EVENT_SILVER_CAVE_ROOM_2_ULTRA_BALL
	object_event 4, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom2PPUp, EVENT_SILVER_CAVE_ROOM_2_PP_UP
