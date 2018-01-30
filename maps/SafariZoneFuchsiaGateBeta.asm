SafariZoneFuchsiaGateBeta_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SafariZoneFuchsiaGateBeta_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 4, 0, 1, SAFARI_ZONE_BETA
	warp_event 5, 0, 2, SAFARI_ZONE_BETA
	warp_event 4, 7, 7, FUCHSIA_CITY
	warp_event 5, 7, 7, FUCHSIA_CITY

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
