DragonsDen1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DragonsDen1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3,  5, BLACKTHORN_CITY, 8
	warp_event  3,  3, DRAGONS_DEN_1F, 4
	warp_event  5, 15, DRAGONS_DEN_B1F, 1
	warp_event  5, 13, DRAGONS_DEN_1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
