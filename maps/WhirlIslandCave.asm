WhirlIslandCave_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WhirlIslandCave_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 7, 5, 9, WHIRL_ISLAND_B1F
	warp_event 3, 13, 4, WHIRL_ISLAND_NW

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
