Unreferenced_GetGen1TrainerClassName: ; 50a28
	ld hl, Gen1TrainerClassNames
	ld a, [TrainerClass]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, StringBuffer1
.copy
	ld a, [hli]
	ld [de], a
	inc de
	cp "@"
	jr nz, .copy
	ret

INCLUDE "data/unused/gen_1_trainer_names.asm"
