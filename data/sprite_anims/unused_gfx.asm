UnusedSpriteAnimGFX:
; entries correspond to SPRITE_ANIM_DICT_* constants
	; # tiles, gfx bank, gfx pointer
	; (all pointers were dummied out to .DeletedGFX)
	dbbw 128, $01, .DeletedGFX ; SPRITE_ANIM_DICT_DEFAULT
	dbbw 128, $01, .DeletedGFX ; unused
	dbbw 128, $01, .DeletedGFX ; unused
	dbbw 128, $01, .DeletedGFX ; unused
	dbbw  16, $37, .DeletedGFX ; unused
	dbbw  16, $11, .DeletedGFX ; SPRITE_ANIM_DICT_TEXT_CURSOR
	dbbw  16, $39, .DeletedGFX ; SPRITE_ANIM_DICT_GS_SPLASH (the bank includes engine/movie/splash.asm)
	dbbw  16, $24, .DeletedGFX ; SPRITE_ANIM_DICT_SLOTS (the bank includes engine/games/slot_machine.asm)
	dbbw  16, $21, .DeletedGFX ; SPRITE_ANIM_DICT_ARROW_CURSOR

.DeletedGFX
