WhirlIslandB2F_MapScriptHeader: ; 0x18c4b6
	; trigger count
	db 0

	; callback count
	db 0
; 0x18c4b8

ItemFragment_0x18c4b8: ; 0x18c4b8
	db FULL_RESTORE, 1
; 0x18c4ba

ItemFragment_0x18c4ba: ; 0x18c4ba
	db MAX_REVIVE, 1
; 0x18c4bc

ItemFragment_0x18c4bc: ; 0x18c4bc
	db MAX_ELIXER, 1
; 0x18c4be

WhirlIslandB2F_MapEventHeader: ; 0x18c4be
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $5, $b, 7, GROUP_WHIRL_ISLAND_B1F, MAP_WHIRL_ISLAND_B1F
	warp_def $b, $7, 8, GROUP_WHIRL_ISLAND_B1F, MAP_WHIRL_ISLAND_B1F
	warp_def $19, $7, 1, GROUP_WHIRL_ISLAND_LUGIA_CHAMBER, MAP_WHIRL_ISLAND_LUGIA_CHAMBER
	warp_def $1f, $d, 5, GROUP_WHIRL_ISLAND_SW, MAP_WHIRL_ISLAND_SW

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_POKE_BALL, 15, 14, $1, $0, 255, 255, $1, 0, ItemFragment_0x18c4b8, $0696
	person_event SPRITE_POKE_BALL, 8, 10, $1, $0, 255, 255, $1, 0, ItemFragment_0x18c4ba, $0697
	person_event SPRITE_POKE_BALL, 16, 9, $1, $0, 255, 255, $1, 0, ItemFragment_0x18c4bc, $0698
; 0x18c4ff

