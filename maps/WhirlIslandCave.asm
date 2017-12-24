WhirlIslandCave_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

WhirlIslandCave_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $5, $7, 9, WHIRL_ISLAND_B1F
	warp_def $d, $3, 4, WHIRL_ISLAND_NW

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 0
