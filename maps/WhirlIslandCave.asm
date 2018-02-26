WhirlIslandCave_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WhirlIslandCave_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7,  5, WHIRL_ISLAND_B1F, 9
	warp_event  3, 13, WHIRL_ISLAND_NW, 4

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
