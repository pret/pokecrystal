GetNextTrainerDataByte:
	ld a, [wTrainerGroupBank]
	call GetFarByte
	inc hl
	ret
	
ReadTrainerParty:
	ld a, [wInBattleTowerBattle]
	bit 0, a
	ret nz

	ld a, [wLinkMode]
	and a
	ret nz

	ld hl, wOTPartyCount
	xor a
	ld [hli], a
	dec a
	ld [hl], a

	ld hl, wOTPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH * PARTY_LENGTH
	xor a
	call ByteFill

	ld a, [wOtherTrainerClass]
	cp CAL
	jr nz, .not_cal2
	ld a, [wOtherTrainerID]
	cp CAL2
	jr z, .cal2
	ld a, [wOtherTrainerClass]
.not_cal2

	dec a
	ld c, a
	ld b, 0
	ld hl, TrainerGroups
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld [wTrainerGroupBank], a
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [wOtherTrainerID]
	ld b, a
.skip_trainer
	dec b
	jr z, .got_trainer
.loop
	call GetNextTrainerDataByte
	cp -1
	jr nz, .loop
	jr .skip_trainer
.got_trainer

.skip_name
	call GetNextTrainerDataByte
	cp "@"
	jr nz, .skip_name

	call GetNextTrainerDataByte
	ld [wOtherTrainerType], a
	ld d, h
	ld e, l
	call ReadTrainerPartyPieces

.done
	jp ComputeTrainerReward

.cal2
	ld a, BANK(sMysteryGiftTrainer)
	call OpenSRAM
	ld a, TRAINERTYPE_MOVES
	ld [wOtherTrainerType], a
	ld de, sMysteryGiftTrainer
	call ReadTrainerPartyPieces
	call CloseSRAM
	jr .done

ReadTrainerPartyPieces:
	ld h, d
	ld l, e

; Variable?
	bit TRAINERTYPE_VARIABLE_F, a
	jr z, .not_variable
	; get badge count in c
	push hl
    ld hl, wBadges
	ld b, 2
	call CountSetBits
	pop hl
	; Skip that many $fe delimiters
.outerloop
	ld a, c
	and a
	jr z, .continue
.innerloop
	call GetNextTrainerDataByte
	cp $fe
	jr nz, .innerloop
	dec c
	jr .outerloop

.continue
	; Get trainer type of variable stage
	call GetNextTrainerDataByte
	ld [wOtherTrainerType], a
	; fallthrough
.not_variable
.loop
; end?
	call GetNextTrainerDataByte
	cp -1
	ret z
	cp $fe
	ret z

; level
	ld [wCurPartyLevel], a

; species
	call GetNextTrainerDataByte
	ld [wCurPartySpecies], a

; add to party
	ld a, OTPARTYMON
	ld [wMonType], a
	push hl
	predef TryAddMonToParty
	pop hl

; item?
	ld a, [wOtherTrainerType]
	bit TRAINERTYPE_ITEM_F, a
	jr z, .no_item

	push hl
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1Item
	call GetPartyLocation
	ld d, h
	ld e, l
	pop hl

	call GetNextTrainerDataByte
	ld [de], a
.no_item

; moves?
	ld a, [wOtherTrainerType]
	bit TRAINERTYPE_MOVES_F, a
	jr z, .no_moves

	push hl
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1Moves
	call GetPartyLocation
	ld d, h
	ld e, l
	pop hl

	ld b, NUM_MOVES
.copy_moves
	call GetNextTrainerDataByte
	ld [de], a
	inc de
	dec b
	jr nz, .copy_moves

	push hl

	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1
	call GetPartyLocation
	ld d, h
	ld e, l
    ld hl, MON_PP
	add hl, de

	push hl
	ld hl, MON_MOVES
	add hl, de
	pop de

	ld b, NUM_MOVES
.copy_pp
	ld a, [hli]
	and a
	jr z, .copied_pp

	push hl
	push bc
	dec a
	ld hl, Moves + MOVE_PP
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	pop bc
	pop hl

	ld [de], a
	inc de
	dec b
	jr nz, .copy_pp
.copied_pp

	pop hl
.no_moves

	jp .loop

ComputeTrainerReward:
	ld hl, hProduct
	xor a
	ld [hli], a
	ld [hli], a ; hMultiplicand + 0
	ld [hli], a ; hMultiplicand + 1
	ld a, [wEnemyTrainerBaseReward]
	ld [hli], a ; hMultiplicand + 2
	ld a, [wCurPartyLevel]
	ld [hl], a ; hMultiplier
	call Multiply
	ld hl, wBattleReward
	xor a
	ld [hli], a
	ldh a, [hProduct + 2]
	ld [hli], a
	ldh a, [hProduct + 3]
	ld [hl], a
	ret

Battle_GetTrainerName::
	ld a, [wInBattleTowerBattle]
	bit 0, a
	ld hl, wOTPlayerName
	ld a, BANK(Battle_GetTrainerName)
	ld [wTrainerGroupBank], a
	jp nz, CopyTrainerName

	ld a, [wOtherTrainerID]
	ld b, a
	ld a, [wOtherTrainerClass]
	ld c, a

GetTrainerName::
	ld a, c
	cp CAL
	jr nz, .not_cal2

	ld a, BANK(sMysteryGiftTrainerHouseFlag)
	call OpenSRAM
	ld a, [sMysteryGiftTrainerHouseFlag]
	and a
	call CloseSRAM
	jr z, .not_cal2

	ld a, BANK(sMysteryGiftPartnerName)
	call OpenSRAM
	ld hl, sMysteryGiftPartnerName
	call CopyTrainerName
	jp CloseSRAM

.not_cal2
	dec c
	push bc
	ld b, 0
	ld hl, TrainerGroups
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld [wTrainerGroupBank], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop bc

.loop
	dec b
	jr z, CopyTrainerName

.skip
	call GetNextTrainerDataByte
	cp $ff
	jr nz, .skip
	jr .loop

CopyTrainerName:
	ld de, wStringBuffer1
	push de
	ld bc, NAME_LENGTH
	ld a, [wTrainerGroupBank]
	call FarCopyBytes
	pop de
	ret

IncompleteCopyNameFunction: ; unreferenced
; Copy of CopyTrainerName but without "call CopyBytes"
	ld de, wStringBuffer1
	push de
	ld bc, NAME_LENGTH
	pop de
	ret

INCLUDE "data/trainers/party_pointers.asm"
