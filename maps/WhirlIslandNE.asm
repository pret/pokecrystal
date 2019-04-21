	object_const_def ; object_event constants
	const WHIRLISLANDNE_POKE_BALL

WhirlIslandNE_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WhirlIslandNEUltraBall:
	itemball ULTRA_BALL

WhirlIslandNE_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3, 13, ROUTE_41, 2
	warp_event 17,  3, WHIRL_ISLAND_B1F, 2
	warp_event 13, 11, WHIRL_ISLAND_B1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 11, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandNEUltraBall, EVENT_WHIRL_ISLAND_NE_ULTRA_BALL
