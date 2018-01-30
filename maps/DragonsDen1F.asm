DragonsDen1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DragonsDen1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 3, 5, 8, BLACKTHORN_CITY
	warp_event 3, 3, 4, DRAGONS_DEN_1F
	warp_event 5, 15, 1, DRAGONS_DEN_B1F
	warp_event 5, 13, 2, DRAGONS_DEN_1F

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
