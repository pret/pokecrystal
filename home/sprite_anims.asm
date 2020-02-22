INCLUDE "macros/rst.inc"


SECTION "home/sprite_anims.asm", ROM0

_InitSpriteAnimStruct::
	ld [wSpriteAnimIDBuffer], a
	ldh a, [hROMBank]
	push af

	ld a, BANK(InitSpriteAnimStruct)
	rst Bankswitch
	ld a, [wSpriteAnimIDBuffer]

	call InitSpriteAnimStruct

	pop af
	rst Bankswitch

	ret

ReinitSpriteAnimFrame::
	ld [wSpriteAnimIDBuffer], a
	ldh a, [hROMBank]
	push af

	ld a, BANK(_ReinitSpriteAnimFrame)
	rst Bankswitch
	ld a, [wSpriteAnimIDBuffer]

	call _ReinitSpriteAnimFrame

	pop af
	rst Bankswitch

	ret
