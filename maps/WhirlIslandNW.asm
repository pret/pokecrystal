WhirlIslandNW_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WhirlIslandNW_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 5, 7, 1, ROUTE_41
	warp_event 5, 3, 1, WHIRL_ISLAND_B1F
	warp_event 3, 15, 4, WHIRL_ISLAND_SW
	warp_event 7, 15, 2, WHIRL_ISLAND_CAVE

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
