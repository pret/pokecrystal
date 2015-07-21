WhirlIslandNW_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

WhirlIslandNW_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $7, $5, 1, GROUP_ROUTE_41, MAP_ROUTE_41
	warp_def $3, $5, 1, GROUP_WHIRL_ISLAND_B1F, MAP_WHIRL_ISLAND_B1F
	warp_def $f, $3, 4, GROUP_WHIRL_ISLAND_SW, MAP_WHIRL_ISLAND_SW
	warp_def $f, $7, 2, GROUP_WHIRL_ISLAND_CAVE, MAP_WHIRL_ISLAND_CAVE

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 0
