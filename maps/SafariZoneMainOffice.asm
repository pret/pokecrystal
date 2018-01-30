SafariZoneMainOffice_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SafariZoneMainOffice_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2, 7, 2, FUCHSIA_CITY
	warp_event 3, 7, 2, FUCHSIA_CITY

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
