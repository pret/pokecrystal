LoadOpponentTrainerAndPokemon:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBT_OTTrainer)
	ldh [rSVBK], a

	; Fill wBT_OTTrainer with zeros
	xor a
	ld hl, wBT_OTTrainer
	ld bc, BATTLE_TOWER_STRUCT_LENGTH
	call ByteFill

	; Write $ff into the Item-Slots
	ld a, $ff
	ld [wBT_OTMon1Item], a
	ld [wBT_OTMon2Item], a
	ld [wBT_OTMon3Item], a

	; Set wBT_OTTrainer as start address to write the following data to
	ld de, wBT_OTTrainer

	ldh a, [hRandomAdd]
	ld b, a
.resample ; loop to find a random trainer
	call Random
	ldh a, [hRandomAdd]
	add b
	ld b, a ; b contains the nr of the trainer
	maskbits BATTLETOWER_NUM_UNIQUE_TRAINERS
	cp BATTLETOWER_NUM_UNIQUE_TRAINERS
	jr nc, .resample
	ld b, a

	ld a, BANK(sBTTrainers)
	call OpenSRAM

	ld c, BATTLETOWER_STREAK_LENGTH
	ld hl, sBTTrainers
.next_trainer
	ld a, [hli]
	cp b
	jr z, .resample
	dec c
	jr nz, .next_trainer ; c <= 7  initialise all 7 trainers?

	ld hl, sBTTrainers
	ld a, [sNrOfBeatenBattleTowerTrainers]
	ld c, a
	ld a, b
	ld b, 0
	add hl, bc
	ld [hl], a

	call CloseSRAM

	push af
; Copy name (10 bytes) and class (1 byte) of trainer
	ld hl, BattleTowerTrainers
	ld bc, NAME_LENGTH
	call AddNTimes
	ld bc, NAME_LENGTH
	call CopyBytes

	call LoadRandomBattleTowerMon
	pop af

	ld hl, BattleTowerTrainerData
	ld bc, BATTLETOWER_TRAINERDATALENGTH
	call AddNTimes
	ld bc, BATTLETOWER_TRAINERDATALENGTH
.copy_bt_trainer_data_loop
	ld a, BANK(BattleTowerTrainerData)
	call GetFarByte
	ld [de], a
	inc hl
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .copy_bt_trainer_data_loop

	pop af
	ldh [rSVBK], a

	ret

LoadRandomBattleTowerMon:
	ld c, BATTLETOWER_PARTY_LENGTH
.loop
	push bc
	ld a, BANK(sBTMonOfTrainers)
	call OpenSRAM

.FindARandomBattleTowerMon:
	; From Which LevelGroup are the mon loaded
	; a = 1..10
	ld a, [wBTChoiceOfLvlGroup]
	dec a
	ld hl, BattleTowerMons
	ld bc, BATTLETOWER_NUM_UNIQUE_MON * NICKNAMED_MON_STRUCT_LENGTH
	call AddNTimes

	ldh a, [hRandomAdd]
	ld b, a
.resample
	call Random
	ldh a, [hRandomAdd]
	add b
	ld b, a
	maskbits BATTLETOWER_NUM_UNIQUE_MON
	cp BATTLETOWER_NUM_UNIQUE_MON
	jr nc, .resample
	; in register 'a' is the chosen mon of the LevelGroup

	; Check if mon was already loaded before
	; Check current and the 2 previous teams
	; includes check if item is double at the current team
	ld bc, NICKNAMED_MON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hli]
	ld b, a
	ld a, [hld]
	ld c, a
	ld a, [wBT_OTMon1]
	cp b
	jr z, .FindARandomBattleTowerMon
	ld a, [wBT_OTMon1Item]
	cp c
	jr z, .FindARandomBattleTowerMon
	ld a, [wBT_OTMon2]
	cp b
	jr z, .FindARandomBattleTowerMon
	ld a, [wBT_OTMon2Item]
	cp c
	jr z, .FindARandomBattleTowerMon
	ld a, [wBT_OTMon3]
	cp b
	jr z, .FindARandomBattleTowerMon
	ld a, [wBT_OTMon3Item]
	cp c
	jr z, .FindARandomBattleTowerMon
	ld a, [sBTMonPrevTrainer1]
	cp b
	jr z, .FindARandomBattleTowerMon
	ld a, [sBTMonPrevTrainer2]
	cp b
	jr z, .FindARandomBattleTowerMon
	ld a, [sBTMonPrevTrainer3]
	cp b
	jr z, .FindARandomBattleTowerMon
	ld a, [sBTMonPrevPrevTrainer1]
	cp b
	jr z, .FindARandomBattleTowerMon
	ld a, [sBTMonPrevPrevTrainer2]
	cp b
	jr z, .FindARandomBattleTowerMon
	ld a, [sBTMonPrevPrevTrainer3]
	cp b
	jr z, .FindARandomBattleTowerMon

	ld bc, NICKNAMED_MON_STRUCT_LENGTH
	call CopyBytes

	ld a, [wNamedObjectIndex]
	push af
	push de
	ld hl, -NICKNAMED_MON_STRUCT_LENGTH
	add hl, de
	ld a, [hl]
	ld [wNamedObjectIndex], a
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	push hl
	call GetPokemonName
	ld h, d
	ld l, e
	pop de
	ld bc, MON_NAME_LENGTH
	call CopyBytes

	pop de
	pop af
	ld [wNamedObjectIndex], a
	pop bc
	dec c
	jp nz, .loop

	ld a, [sBTMonPrevTrainer1]
	ld [sBTMonPrevPrevTrainer1], a
	ld a, [sBTMonPrevTrainer2]
	ld [sBTMonPrevPrevTrainer2], a
	ld a, [sBTMonPrevTrainer3]
	ld [sBTMonPrevPrevTrainer3], a
	ld a, [wBT_OTMon1]
	ld [sBTMonPrevTrainer1], a
	ld a, [wBT_OTMon2]
	ld [sBTMonPrevTrainer2], a
	ld a, [wBT_OTMon3]
	ld [sBTMonPrevTrainer3], a
	call CloseSRAM
	ret

INCLUDE "data/battle_tower/classes.asm"

INCLUDE "data/battle_tower/parties.asm"
