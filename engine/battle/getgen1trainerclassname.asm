GetGen1TrainerClassName: ; unreferenced
	ld hl, Gen1TrainerClassNames
	ld a, [wTrainerClass]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wStringBuffer1
.copy
	ld a, [hli]
	ld [de], a
	inc de
	cp "@"
	jr nz, .copy
	ret

INCLUDE "data/text/unused_gen1_trainer_names.asm"
