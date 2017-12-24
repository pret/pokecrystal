WhirlIslandSE_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

WhirlIslandSE_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $d, $5, 4, ROUTE_41
	warp_def $3, $5, 6, WHIRL_ISLAND_B1F

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 0
