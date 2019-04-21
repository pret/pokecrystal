	object_const_def ; object_event constants
	const WHIRLISLANDSW_POKE_BALL

WhirlIslandSW_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WhirlIslandSWUltraBall:
	itemball ULTRA_BALL

WhirlIslandSW_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  5,  7, ROUTE_41, 3
	warp_event 17,  3, WHIRL_ISLAND_B1F, 5
	warp_event  3,  3, WHIRL_ISLAND_B1F, 4
	warp_event  3, 15, WHIRL_ISLAND_NW, 3
	warp_event 17, 15, WHIRL_ISLAND_B2F, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 15,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandSWUltraBall, EVENT_WHIRL_ISLAND_SW_ULTRA_BALL
