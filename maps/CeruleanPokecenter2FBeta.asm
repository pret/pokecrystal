CeruleanPokecenter2FBeta_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeruleanPokecenter2FBeta_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  0,  7, CERULEAN_POKECENTER_1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
