WhirlIslandSE_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

WhirlIslandSE_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $d, $5, 4, GROUP_ROUTE_41, MAP_ROUTE_41
	warp_def $3, $5, 6, GROUP_WHIRL_ISLAND_B1F, MAP_WHIRL_ISLAND_B1F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 0
