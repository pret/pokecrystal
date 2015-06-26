WhirlIslandB1F_MapScriptHeader: ; 0x18c40e
	; trigger count
	db 0

	; callback count
	db 0
; 0x18c410

ItemFragment_0x18c410: ; 0x18c410
	db FULL_RESTORE, 1
; 0x18c412

ItemFragment_0x18c412: ; 0x18c412
	db CARBOS, 1
; 0x18c414

ItemFragment_0x18c414: ; 0x18c414
	db CALCIUM, 1
; 0x18c416

ItemFragment_0x18c416: ; 0x18c416
	db NUGGET, 1
; 0x18c418

ItemFragment_0x18c418: ; 0x18c418
	db ESCAPE_ROPE, 1
; 0x18c41a

WhirlIslandB1FBoulder:
	jumpstd strengthboulder

MapWhirlIslandB1FSignpostItem0: ; 0x18c41d
	dw $0097
	db RARE_CANDY
	
; 0x18c420

MapWhirlIslandB1FSignpostItem1: ; 0x18c420
	dw $0098
	db ULTRA_BALL
	
; 0x18c423

MapWhirlIslandB1FSignpostItem2: ; 0x18c423
	dw $0099
	db FULL_RESTORE
	
; 0x18c426

WhirlIslandB1F_MapEventHeader: ; 0x18c426
	; filler
	db 0, 0

	; warps
	db 9
	warp_def $5, $5, 2, GROUP_WHIRL_ISLAND_NW, MAP_WHIRL_ISLAND_NW
	warp_def $3, $23, 2, GROUP_WHIRL_ISLAND_NE, MAP_WHIRL_ISLAND_NE
	warp_def $9, $1d, 3, GROUP_WHIRL_ISLAND_NE, MAP_WHIRL_ISLAND_NE
	warp_def $1f, $9, 3, GROUP_WHIRL_ISLAND_SW, MAP_WHIRL_ISLAND_SW
	warp_def $1f, $17, 2, GROUP_WHIRL_ISLAND_SW, MAP_WHIRL_ISLAND_SW
	warp_def $1d, $1f, 2, GROUP_WHIRL_ISLAND_SE, MAP_WHIRL_ISLAND_SE
	warp_def $15, $19, 1, GROUP_WHIRL_ISLAND_B2F, MAP_WHIRL_ISLAND_B2F
	warp_def $1b, $d, 2, GROUP_WHIRL_ISLAND_B2F, MAP_WHIRL_ISLAND_B2F
	warp_def $15, $11, 1, GROUP_WHIRL_ISLAND_CAVE, MAP_WHIRL_ISLAND_CAVE

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 4, 30, $7, MapWhirlIslandB1FSignpostItem0
	signpost 18, 36, $7, MapWhirlIslandB1FSignpostItem1
	signpost 23, 2, $7, MapWhirlIslandB1FSignpostItem2

	; people-events
	db 6
	person_event SPRITE_POKE_BALL, 17, 11, $1, $0, 255, 255, $1, 0, ItemFragment_0x18c410, $0691
	person_event SPRITE_POKE_BALL, 22, 6, $1, $0, 255, 255, $1, 0, ItemFragment_0x18c412, $0692
	person_event SPRITE_POKE_BALL, 27, 37, $1, $0, 255, 255, $1, 0, ItemFragment_0x18c414, $0693
	person_event SPRITE_POKE_BALL, 12, 21, $1, $0, 255, 255, $1, 0, ItemFragment_0x18c416, $0694
	person_event SPRITE_POKE_BALL, 30, 23, $1, $0, 255, 255, $1, 0, ItemFragment_0x18c418, $0695
	person_event SPRITE_BOULDER, 30, 27, $19, $0, 255, 255, $0, 0, WhirlIslandB1FBoulder, $ffff
; 0x18c4b6
