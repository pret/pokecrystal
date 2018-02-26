UndergroundPath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

UndergroundPathHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_UNDERGROUND_PATH_HIDDEN_FULL_RESTORE

UndergroundPathHiddenXSpecial:
	hiddenitem X_SPECIAL, EVENT_UNDERGROUND_PATH_HIDDEN_X_SPECIAL

UndergroundPath_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  2, ROUTE_5_UNDERGROUND_PATH_ENTRANCE, 3
	warp_event  3, 24, ROUTE_6_UNDERGROUND_PATH_ENTRANCE, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3,  9, BGEVENT_ITEM, UndergroundPathHiddenFullRestore
	bg_event  1, 19, BGEVENT_ITEM, UndergroundPathHiddenXSpecial

	db 0 ; object events
