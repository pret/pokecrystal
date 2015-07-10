Route6UndergroundEntrance_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

Route6UndergroundEntrance_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 1, GROUP_ROUTE_6, MAP_ROUTE_6
	warp_def $7, $4, 1, GROUP_ROUTE_6, MAP_ROUTE_6
	warp_def $3, $4, 2, GROUP_UNDERGROUND, MAP_UNDERGROUND

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 0
