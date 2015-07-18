WhirlIslandSW_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

ItemFragment_0x18c3bc:
	db ULTRA_BALL, 1

WhirlIslandSW_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 5
	warp_def $7, $5, 3, GROUP_ROUTE_41, MAP_ROUTE_41
	warp_def $3, $11, 5, GROUP_WHIRL_ISLAND_B1F, MAP_WHIRL_ISLAND_B1F
	warp_def $3, $3, 4, GROUP_WHIRL_ISLAND_B1F, MAP_WHIRL_ISLAND_B1F
	warp_def $f, $3, 3, GROUP_WHIRL_ISLAND_NW, MAP_WHIRL_ISLAND_NW
	warp_def $f, $11, 4, GROUP_WHIRL_ISLAND_B2F, MAP_WHIRL_ISLAND_B2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_POKE_BALL, 6, 19, DOWN << 2 | $1, $0, -1, -1, $1, 0, ItemFragment_0x18c3bc, EVENT_WHIRL_ISLAND_SW_ULTRA_BALL
