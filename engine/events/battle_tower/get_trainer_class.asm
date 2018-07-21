GetMobileOTTrainerClass: ; mobile function
	ld h, b
	ld l, c
	call .GetMobileOTTrainerClass
	ld c, a
	ret

.GetMobileOTTrainerClass:
	ld a, [hli]
	xor [hl]
	ld c, a
	jr z, .skip_male_trainers
	srl c
	srl c
.male_trainer_loop
	srl c
	ld a, c
	cp MaleTrainers.End - MaleTrainers - 1
	jr nc, .male_trainer_loop
	inc c

.skip_male_trainers
	ld a, [de]
	cp $1
	ld hl, MaleTrainers
	jr nz, .finished

	ld hl, FemaleTrainers
	ld a, c
	and a
	jr z, .finished

.female_trainer_loop
	srl c
	ld a, c
	cp FemaleTrainers.End - FemaleTrainers - 1
	jr nc, .female_trainer_loop
	inc c

.finished
	ld b, $0
	add hl, bc
	ld a, [hl]
	ret

INCLUDE "data/trainers/gendered_trainers.asm"
