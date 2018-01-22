UndergroundPath_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

UndergroundPathHiddenFullRestore:
	hiddenitem EVENT_UNDERGROUND_PATH_HIDDEN_FULL_RESTORE, FULL_RESTORE

UndergroundPathHiddenXSpecial:
	hiddenitem EVENT_UNDERGROUND_PATH_HIDDEN_X_SPECIAL, X_SPECIAL

UndergroundPath_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 3, 2, 3, ROUTE_5_UNDERGROUND_PATH_ENTRANCE
	warp_def 3, 24, 3, ROUTE_6_UNDERGROUND_PATH_ENTRANCE

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 3, 9, BGEVENT_ITEM, UndergroundPathHiddenFullRestore
	bg_event 1, 19, BGEVENT_ITEM, UndergroundPathHiddenXSpecial

.ObjectEvents:
	db 0
