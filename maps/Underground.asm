Underground_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

UndergroundHiddenFullRestore:
	dwb EVENT_UNDERGROUND_HIDDEN_FULL_RESTORE, FULL_RESTORE


UndergroundHiddenXSpecial:
	dwb EVENT_UNDERGROUND_HIDDEN_X_SPECIAL, X_SPECIAL


Underground_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $2, $3, 3, ROUTE_5_UNDERGROUND_ENTRANCE
	warp_def $18, $3, 3, ROUTE_6_UNDERGROUND_ENTRANCE

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 9, 3, BGEVENT_ITEM, UndergroundHiddenFullRestore
	bg_event 19, 1, BGEVENT_ITEM, UndergroundHiddenXSpecial

.ObjectEvents:
	db 0
