WhirlIslandNW_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

WhirlIslandNW_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def 5, 7, 1, ROUTE_41
	warp_def 5, 3, 1, WHIRL_ISLAND_B1F
	warp_def 3, 15, 4, WHIRL_ISLAND_SW
	warp_def 7, 15, 2, WHIRL_ISLAND_CAVE

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 0
