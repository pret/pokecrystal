; overworld_sprite struct members (see data/sprites.asm)
	const_def
	const SPRITEDATA_ADDR    ; 0
	const SPRITEDATA_ADDR_HI ; 1
	const SPRITEDATA_SIZE    ; 2
	const SPRITEDATA_BANK    ; 3
	const SPRITEDATA_TYPE    ; 4
	const SPRITEDATA_PALETTE ; 5
NUM_SPRITEDATA_FIELDS EQU const_value

; sprite types
	const_def 1
	const WALKING_SPRITE  ; 1
	const STANDING_SPRITE ; 2
	const STILL_SPRITE    ; 3

; sprite palettes
	const_def
	const PAL_OW_RED    ; 0
	const PAL_OW_BLUE   ; 1
	const PAL_OW_GREEN  ; 2
	const PAL_OW_BROWN  ; 3
	const PAL_OW_PINK   ; 4
	const PAL_OW_SILVER ; 5
	const PAL_OW_TREE   ; 6
	const PAL_OW_ROCK   ; 7

; object_events set bit 3 so as not to use the sprite's default palette
; MapObjectPals indexes (see gfx/overworld/npc_sprites.pal)
	const_def 1 << 3
	const PAL_NPC_RED    ; 8
	const PAL_NPC_BLUE   ; 9
	const PAL_NPC_GREEN  ; a
	const PAL_NPC_BROWN  ; b
	const PAL_NPC_PINK   ; c
	const PAL_NPC_SILVER ; d
	const PAL_NPC_TREE   ; e
	const PAL_NPC_ROCK   ; f
