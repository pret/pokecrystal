WhirlIslandNE_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ItemFragment_0x18c396:
	db ULTRA_BALL, 1

WhirlIslandNE_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $d, $3, 2, GROUP_ROUTE_41, MAP_ROUTE_41
	warp_def $3, $11, 2, GROUP_WHIRL_ISLAND_B1F, MAP_WHIRL_ISLAND_B1F
	warp_def $b, $d, 3, GROUP_WHIRL_ISLAND_B1F, MAP_WHIRL_ISLAND_B1F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_POKE_BALL, 15, 15, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x18c396, EVENT_WHIRL_ISLAND_NE_ULTRA_BALL
