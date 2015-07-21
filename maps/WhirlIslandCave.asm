WhirlIslandCave_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

WhirlIslandCave_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $5, $7, 9, GROUP_WHIRL_ISLAND_B1F, MAP_WHIRL_ISLAND_B1F
	warp_def $d, $3, 4, GROUP_WHIRL_ISLAND_NW, MAP_WHIRL_ISLAND_NW

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 0
