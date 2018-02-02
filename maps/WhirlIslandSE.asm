WhirlIslandSE_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WhirlIslandSE_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 13, ROUTE_41, 4
	warp_event  5,  3, WHIRL_ISLAND_B1F, 6

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
