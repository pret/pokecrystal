UndergroundPath_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

UndergroundPathHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_UNDERGROUND_PATH_HIDDEN_FULL_RESTORE

UndergroundPathHiddenXSpecial:
	hiddenitem X_SPECIAL, EVENT_UNDERGROUND_PATH_HIDDEN_X_SPECIAL

UndergroundPath_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_event 3, 2, 3, ROUTE_5_UNDERGROUND_PATH_ENTRANCE
	warp_event 3, 24, 3, ROUTE_6_UNDERGROUND_PATH_ENTRANCE

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 3, 9, BGEVENT_ITEM, UndergroundPathHiddenFullRestore
	bg_event 1, 19, BGEVENT_ITEM, UndergroundPathHiddenXSpecial

.ObjectEvents:
	db 0
