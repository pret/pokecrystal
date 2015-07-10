Underground_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

MapUndergroundSignpostItem0:
	dw $00e5
	db FULL_RESTORE
	

MapUndergroundSignpostItem1:
	dw $00e6
	db X_SPECIAL
	

Underground_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $2, $3, 3, GROUP_ROUTE_5_UNDERGROUND_ENTRANCE, MAP_ROUTE_5_UNDERGROUND_ENTRANCE
	warp_def $18, $3, 3, GROUP_ROUTE_6_UNDERGROUND_ENTRANCE, MAP_ROUTE_6_UNDERGROUND_ENTRANCE

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 9, 3, $7, MapUndergroundSignpostItem0
	signpost 19, 1, $7, MapUndergroundSignpostItem1

	; people-events
	db 0
