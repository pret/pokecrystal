WhirlIslandNE_MapScriptHeader: ; 0x18c394
	; trigger count
	db 0

	; callback count
	db 0
; 0x18c396

ItemFragment_0x18c396: ; 0x18c396
	db ULTRA_BALL, 1
; 0x18c398

WhirlIslandNE_MapEventHeader: ; 0x18c398
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $d, $3, 2, GROUP_ROUTE_41, MAP_ROUTE_41
	warp_def $3, $11, 2, GROUP_WHIRL_ISLAND_B1F, MAP_WHIRL_ISLAND_B1F
	warp_def $b, $d, 3, GROUP_WHIRL_ISLAND_B1F, MAP_WHIRL_ISLAND_B1F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_POKE_BALL, 15, 15, $1, $0, 255, 255, $1, 0, ItemFragment_0x18c396, $068f
; 0x18c3ba
