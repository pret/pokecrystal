TinTower2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TinTower2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10, 14, TIN_TOWER_3F, 1
	warp_event 10,  2, TIN_TOWER_1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
