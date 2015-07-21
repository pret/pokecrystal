DragonsDen1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

DragonsDen1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $5, $3, 8, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY
	warp_def $3, $3, 4, GROUP_DRAGONS_DEN_1F, MAP_DRAGONS_DEN_1F
	warp_def $f, $5, 1, GROUP_DRAGONS_DEN_B1F, MAP_DRAGONS_DEN_B1F
	warp_def $d, $5, 2, GROUP_DRAGONS_DEN_1F, MAP_DRAGONS_DEN_1F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 0
