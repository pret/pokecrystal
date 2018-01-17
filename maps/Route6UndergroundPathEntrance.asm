Route6UndergroundPathEntrance_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

Route6UndergroundPathEntrance_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def 3, 7, 1, ROUTE_6
	warp_def 4, 7, 1, ROUTE_6
	warp_def 4, 3, 2, UNDERGROUND_PATH

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 0
