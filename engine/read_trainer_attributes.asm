GetTrainerClassName: ; 3952d
	ld hl, RivalName
	ld a, c
	cp RIVAL1
	jr z, .rival

	ld [CurSpecies], a
	ld a, TRAINER_NAME
	ld [wNamedObjectTypeBuffer], a
	call GetName
	ld de, StringBuffer1
	ret

.rival
	ld de, StringBuffer1
	push de
	ld bc, NAME_LENGTH
	call CopyBytes
	pop de
	ret

GetOTName: ; 39550
	ld hl, OTPlayerName
	ld a, [wLinkMode]
	and a
	jr nz, .ok

	ld hl, RivalName
	ld a, c
	cp RIVAL1
	jr z, .ok

	ld [CurSpecies], a
	ld a, TRAINER_NAME
	ld [wNamedObjectTypeBuffer], a
	call GetName
	ld hl, StringBuffer1

.ok
	ld bc, TRAINER_CLASS_NAME_LENGTH
	ld de, OTClassName
	push de
	call CopyBytes
	pop de
	ret

GetTrainerAttributes: ; 3957b
	ld a, [TrainerClass]
	ld c, a
	call GetOTName
	ld a, [TrainerClass]
	dec a
	ld hl, TrainerClassAttributes + TRNATTR_ITEM1
	ld bc, NUM_TRAINER_ATTRIBUTES
	call AddNTimes
	ld de, wEnemyTrainerItem1
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld a, [hl]
	ld [wEnemyTrainerBaseReward], a
	ret
