Underground_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

MapUndergroundSignpostItem0:
	dwb EVENT_UNDERGROUND_HIDDEN_FULL_RESTORE, FULL_RESTORE
	

MapUndergroundSignpostItem1:
	dwb EVENT_UNDERGROUND_HIDDEN_X_SPECIAL, X_SPECIAL
	

Underground_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $2, $3, 3, GROUP_ROUTE_5_UNDERGROUND_ENTRANCE, MAP_ROUTE_5_UNDERGROUND_ENTRANCE
	warp_def $18, $3, 3, GROUP_ROUTE_6_UNDERGROUND_ENTRANCE, MAP_ROUTE_6_UNDERGROUND_ENTRANCE

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 9, 3, SIGNPOST_ITEM, MapUndergroundSignpostItem0
	signpost 19, 1, SIGNPOST_ITEM, MapUndergroundSignpostItem1

.PersonEvents:
	db 0
