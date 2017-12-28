GetTrainerDVs: ; 270c4
; Return the DVs of OtherTrainerClass in bc

	push hl
	ld a, [OtherTrainerClass]
	dec a
	ld c, a
	ld b, 0

	ld hl, TrainerClassDVs
	add hl, bc
	add hl, bc

	ld a, [hli]
	ld b, a
	ld c, [hl]

	pop hl
	ret
; 270d6
