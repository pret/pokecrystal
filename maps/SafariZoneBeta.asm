SafariZoneBeta_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SafariZoneBeta_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  9, 23, SAFARI_ZONE_FUCHSIA_GATE_BETA, 1
	warp_event 10, 23, SAFARI_ZONE_FUCHSIA_GATE_BETA, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
