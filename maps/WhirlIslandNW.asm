WhirlIslandNW_MapScriptHeader: ; 0x18c378
	; trigger count
	db 0

	; callback count
	db 0
; 0x18c37a

WhirlIslandNW_MapEventHeader: ; 0x18c37a
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $7, $5, 1, GROUP_ROUTE_41, MAP_ROUTE_41
	warp_def $3, $5, 1, GROUP_WHIRL_ISLAND_B1F, MAP_WHIRL_ISLAND_B1F
	warp_def $f, $3, 4, GROUP_WHIRL_ISLAND_SW, MAP_WHIRL_ISLAND_SW
	warp_def $f, $7, 2, GROUP_WHIRL_ISLAND_CAVE, MAP_WHIRL_ISLAND_CAVE

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 0
; 0x18c394
