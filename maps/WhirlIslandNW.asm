WhirlIslandNW_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WhirlIslandNW_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  5,  7, ROUTE_41, 1
	warp_event  5,  3, WHIRL_ISLAND_B1F, 1
	warp_event  3, 15, WHIRL_ISLAND_SW, 4
	warp_event  7, 15, WHIRL_ISLAND_CAVE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
