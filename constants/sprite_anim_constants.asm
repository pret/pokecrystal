; sprite_anim_struct members (see macros/ram.asm)
rsreset
DEF SPRITEANIMSTRUCT_INDEX           rb ; 0
DEF SPRITEANIMSTRUCT_CELSET_ID       rb ; 1
DEF SPRITEANIMSTRUCT_BEHAVIOR_ID     rb ; 2
DEF SPRITEANIMSTRUCT_TILE_ID         rb ; 3
DEF SPRITEANIMSTRUCT_XCOORD          rb ; 4
DEF SPRITEANIMSTRUCT_YCOORD          rb ; 5
DEF SPRITEANIMSTRUCT_XOFFSET         rb ; 6
DEF SPRITEANIMSTRUCT_YOFFSET         rb ; 7
DEF SPRITEANIMSTRUCT_DURATION        rb ; 8
DEF SPRITEANIMSTRUCT_DURATIONOFFSET  rb ; 9
DEF SPRITEANIMSTRUCT_CEL             rb ; a
DEF SPRITEANIMSTRUCT_VAR1            rb ; b
DEF SPRITEANIMSTRUCT_VAR2            rb ; c
DEF SPRITEANIMSTRUCT_VAR3            rb ; d
DEF SPRITEANIMSTRUCT_VAR4            rb ; e
DEF SPRITEANIMSTRUCT_VAR5            rb ; f
DEF SPRITEANIMSTRUCT_LENGTH EQU _RS
DEF NUM_SPRANIM_STRUCTS EQU 10 ; see wSpriteAnimationStructs

; wSpriteAnimDict keys (see wram.asm)
; UnusedSpriteAnimGFX indexes (see data/sprite_anims/unused_gfx.asm)
	const_def
	const SPRANIM_DICT_DEFAULT      ; 0
	const_skip 4                        ; unused
	const SPRANIM_DICT_TEXT_CURSOR  ; 5
	const SPRANIM_DICT_GS_SPLASH    ; 6
	const SPRANIM_DICT_SLOTS        ; 7
	const SPRANIM_DICT_ARROW_CURSOR ; 8
DEF NUM_SPRANIM_GFX EQU const_value

; wSpriteAnimDict size (see wram.asm)
DEF NUM_SPRITEANIMDICT_ENTRIES EQU 10

assert NUM_SPRANIM_OAMSETS <= FIRST_OAM_CMD, \
	"SPRANIM_OAMSET_* constants overlap oam*_command constants"
