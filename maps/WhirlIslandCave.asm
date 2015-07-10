WhirlIslandCave_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

WhirlIslandCave_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $5, $7, 9, GROUP_WHIRL_ISLAND_B1F, MAP_WHIRL_ISLAND_B1F
	warp_def $d, $3, 4, GROUP_WHIRL_ISLAND_NW, MAP_WHIRL_ISLAND_NW

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 0
