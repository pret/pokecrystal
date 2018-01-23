DragonsDen1F_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

DragonsDen1F_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def 3, 5, 8, BLACKTHORN_CITY
	warp_def 3, 3, 4, DRAGONS_DEN_1F
	warp_def 5, 15, 1, DRAGONS_DEN_B1F
	warp_def 5, 13, 2, DRAGONS_DEN_1F

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 0
