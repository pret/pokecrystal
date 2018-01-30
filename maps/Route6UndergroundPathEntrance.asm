Route6UndergroundPathEntrance_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route6UndergroundPathEntrance_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 3, 7, 1, ROUTE_6
	warp_event 4, 7, 1, ROUTE_6
	warp_event 4, 3, 2, UNDERGROUND_PATH

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
