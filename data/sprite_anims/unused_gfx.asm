MACRO sprite_anim_obj_gfx
; # tiles, gfx pointer
	db \1
	dbw \2, \3
ENDM

UnusedSpriteAnimGFX:
; entries correspond to SPRITE_ANIM_DICT_* constants
	table_width 4, UnusedSpriteAnimGFX
	; # tiles, gfx bank, gfx pointer
	; (all pointers were dummied out to .DeletedGFX)
	sprite_anim_obj_gfx 128, $01, .DeletedGFX ; SPRITE_ANIM_DICT_DEFAULT
	sprite_anim_obj_gfx 128, $01, .DeletedGFX ; unused
	sprite_anim_obj_gfx 128, $01, .DeletedGFX ; unused
	sprite_anim_obj_gfx 128, $01, .DeletedGFX ; unused
	sprite_anim_obj_gfx  16, $37, .DeletedGFX ; unused
	sprite_anim_obj_gfx  16, $11, .DeletedGFX ; SPRITE_ANIM_DICT_TEXT_CURSOR
	sprite_anim_obj_gfx  16, $39, .DeletedGFX ; SPRITE_ANIM_DICT_GS_SPLASH (the bank includes engine/movie/splash.asm)
	sprite_anim_obj_gfx  16, $24, .DeletedGFX ; SPRITE_ANIM_DICT_SLOTS (the bank includes engine/games/slot_machine.asm)
	sprite_anim_obj_gfx  16, $21, .DeletedGFX ; SPRITE_ANIM_DICT_ARROW_CURSOR
	assert_table_length NUM_SPRITE_ANIM_GFX

.DeletedGFX
