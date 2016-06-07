TryAddMonToParty: ; d88c
; Check if to copy wild Pkmn or generate new Pkmn
	; Whose is it?
	ld de, PartyCount
	ld a, [MonType]
	and $f
	jr z, .getpartylocation ; PARTYMON
	ld de, OTPartyCount

.getpartylocation
	; Do we have room for it?
	ld a, [de]
	inc a
	cp PARTY_LENGTH + 1
	ret nc
	; Increase the party count
	ld [de], a
	ld a, [de] ; Why are we doing this?
	ld [hMoveMon], a ; HRAM backup
	add e
	ld e, a
	jr nc, .loadspecies
	inc d

.loadspecies
	; Load the species of the Pokemon into the party list.
	; The terminator is usually here, but it'll be back.
	ld a, [CurPartySpecies]
	ld [de], a
	; Load the terminator into the next slot.
	inc de
	ld a, -1
	ld [de], a
	; Now let's load the OT name.
	ld hl, PartyMonOT
	ld a, [MonType]
	and $f
	jr z, .loadOTname
	ld hl, OTPartyMonOT

.loadOTname
	ld a, [hMoveMon] ; Restore index from backup
	dec a
	call SkipNames
	ld d, h
	ld e, l
	ld hl, PlayerName
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, [MonType]
	and a
	jr nz, .skipnickname
	ld a, [CurPartySpecies]
	ld [wd265], a
	call GetPokemonName
	ld hl, PartyMonNicknames
	ld a, [hMoveMon]
	dec a
	call SkipNames
	ld d, h
	ld e, l
	ld hl, StringBuffer1
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes

.skipnickname
	ld hl, PartyMon1Species
	ld a, [MonType]
	and $f
	jr z, .initializeStats
	ld hl, OTPartyMon1Species

.initializeStats
	ld a, [hMoveMon]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
GeneratePartyMonStats: ; d906
	ld e, l
	ld d, h
	push hl
	ld a, [CurPartySpecies]
	ld [CurSpecies], a
	call GetBaseData
	ld a, [BaseDexNo]
	ld [de], a
	inc de
	ld a, [wBattleMode]
	and a
	ld a, $0
	jr z, .skipitem
	ld a, [EnemyMonItem]

.skipitem
	ld [de], a
	inc de
	push de
	ld h, d
	ld l, e
	ld a, [wBattleMode]
	and a
	jr z, .randomlygeneratemoves
	ld a, [MonType]
	and a
	jr nz, .randomlygeneratemoves
	ld de, EnemyMonMoves
	rept NUM_MOVES + -1
	ld a, [de]
	inc de
	ld [hli], a
	endr
	ld a, [de]
	ld [hl], a
	jr .next

.randomlygeneratemoves
	xor a
	rept NUM_MOVES + -1
	ld [hli], a
	endr
	ld [hl], a
	ld [Buffer1], a
	predef FillMoves

.next
	pop de
rept 4
	inc de
endr
	ld a, [PlayerID]
	ld [de], a
	inc de
	ld a, [PlayerID + 1]
	ld [de], a
	inc de
	push de
	ld a, [CurPartyLevel]
	ld d, a
	callab CalcExpAtLevel
	pop de
	ld a, [hProduct + 1]
	ld [de], a
	inc de
	ld a, [hProduct + 2]
	ld [de], a
	inc de
	ld a, [hProduct + 3]
	ld [de], a
	inc de
	xor a
	ld b, $a
.loop
	ld [de], a
	inc de
	dec b
	jr nz, .loop
	pop hl
	push hl
	ld a, [MonType]
	and $f
	jr z, .generateDVs
	push hl
	callba GetTrainerDVs
	pop hl
	jr .initializetrainermonstats

.generateDVs
	ld a, [CurPartySpecies]
	ld [wd265], a
	dec a
	push de
	call CheckCaughtMon
	ld a, [wd265]
	dec a
	call SetSeenAndCaughtMon
	pop de
	pop hl
	push hl
	ld a, [wBattleMode]
	and a
	jr nz, .copywildmonstats
	call Random
	ld b, a
	call Random
	ld c, a

.initializetrainermonstats
	ld a, b
	ld [de], a
	inc de
	ld a, c
	ld [de], a
	inc de
	push hl
	push de
	inc hl
	inc hl
	call FillPP
	pop de
	pop hl
rept 4
	inc de
endr
	ld a, 70
	ld [de], a
	inc de
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld a, [CurPartyLevel]
	ld [de], a
	inc de
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld bc, 10
	add hl, bc
	ld a, $1
	ld c, a
	ld b, FALSE
	call CalcPkmnStatC
	ld a, [hProduct + 2]
	ld [de], a
	inc de
	ld a, [hProduct + 3]
	ld [de], a
	inc de
	jr .next2

.copywildmonstats
	ld a, [EnemyMonDVs]
	ld [de], a
	inc de
	ld a, [EnemyMonDVs + 1]
	ld [de], a
	inc de

	push hl
	ld hl, EnemyMonPP
	ld b, NUM_MOVES
.wildmonpploop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .wildmonpploop
	pop hl

	ld a, BASE_HAPPINESS
	ld [de], a
	inc de
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld a, [CurPartyLevel]
	ld [de], a
	inc de
	ld hl, EnemyMonStatus
	; Copy EnemyMonStatus
	ld a, [hli]
	ld [de], a
	inc de
	; Copy EnemyMonUnused
	ld a, [hli]
	ld [de], a
	inc de
	; Copy EnemyMonHP
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de

.next2
	ld a, [wBattleMode]
	dec a
	jr nz, .generatestats
	ld hl, EnemyMonMaxHP
	ld bc, 2 * 6 ; MaxHP + 5 Stats
	call CopyBytes
	pop hl
	jr .next3

.generatestats
	pop hl
	ld bc, MON_STAT_EXP - 1
	add hl, bc
	ld b, $0 ; if b = 1, then stat calculation takes stat exp into account.
	call CalcPkmnStats

.next3
	ld a, [MonType]
	and $f
	jr nz, .done
	ld a, [CurPartySpecies]
	cp UNOWN
	jr nz, .done
	ld hl, PartyMon1DVs
	ld a, [PartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	predef GetUnownLetter
	callab UpdateUnownDex

.done
	scf ; When this function returns, the carry flag indicates success vs failure.
	ret
; da6d

FillPP: ; da6d
	push bc
	ld b, NUM_MOVES
.loop
	ld a, [hli]
	and a
	jr z, .next
	dec a
	push hl
	push de
	push bc
	ld hl, Moves
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld de, StringBuffer1
	ld a, BANK(Moves)
	call FarCopyBytes
	pop bc
	pop de
	pop hl
	ld a, [StringBuffer1 + MOVE_PP]

.next
	ld [de], a
	inc de
	dec b
	jr nz, .loop
	pop bc
	ret
; da96

AddTempmonToParty: ; da96
	ld hl, PartyCount
	ld a, [hl]
	cp PARTY_LENGTH
	scf
	ret z

	inc a
	ld [hl], a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [CurPartySpecies]
	ld [hli], a
	ld [hl], $ff

	ld hl, PartyMon1Species
	ld a, [PartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld e, l
	ld d, h
	ld hl, TempMonSpecies
	call CopyBytes

	ld hl, PartyMonOT
	ld a, [PartyCount]
	dec a
	call SkipNames
	ld d, h
	ld e, l
	ld hl, OTPartyMonOT
	ld a, [CurPartyMon]
	call SkipNames
	ld bc, NAME_LENGTH
	call CopyBytes

	ld hl, PartyMonNicknames
	ld a, [PartyCount]
	dec a
	call SkipNames
	ld d, h
	ld e, l
	ld hl, OTPartyMonNicknames
	ld a, [CurPartyMon]
	call SkipNames
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes

	ld a, [CurPartySpecies]
	ld [wNamedObjectIndexBuffer], a
	cp EGG
	jr z, .egg
	dec a
	call SetSeenAndCaughtMon
	ld hl, PartyMon1Happiness
	ld a, [PartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld [hl], BASE_HAPPINESS
.egg

	ld a, [CurPartySpecies]
	cp UNOWN
	jr nz, .done
	ld hl, PartyMon1DVs
	ld a, [PartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	predef GetUnownLetter
	callab UpdateUnownDex
	ld a, [wFirstUnownSeen]
	and a
	jr nz, .done
	ld a, [UnownLetter]
	ld [wFirstUnownSeen], a
.done

	and a
	ret

SentGetPkmnIntoFromBox: ; db3f
; Sents/Gets Pkmn into/from Box depending on Parameter
; wPokemonWithdrawDepositParameter == 0: get Pkmn into Party
; wPokemonWithdrawDepositParameter == 1: sent Pkmn into Box
; wPokemonWithdrawDepositParameter == 2: get Pkmn from DayCare
; wPokemonWithdrawDepositParameter == 3: put Pkmn into DayCare

	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .check_IfPartyIsFull
	cp DAYCARE_WITHDRAW
	jr z, .check_IfPartyIsFull
	cp DAYCARE_DEPOSIT
	ld hl, wBreedMon1Species
	jr z, .breedmon

	; we want to sent a Pkmn into the Box
	; so check if there's enough space
	ld hl, sBoxCount
	ld a, [hl]
	cp MONS_PER_BOX
	jr nz, .there_is_room
	jp CloseSRAM_And_SetCarryFlag

.check_IfPartyIsFull
	ld hl, PartyCount
	ld a, [hl]
	cp PARTY_LENGTH
	jp z, CloseSRAM_And_SetCarryFlag

.there_is_room
	inc a
	ld [hl], a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [wPokemonWithdrawDepositParameter]
	cp DAYCARE_WITHDRAW
	ld a, [wBreedMon1Species]
	jr z, .okay1
	ld a, [CurPartySpecies]

.okay1
	ld [hli], a
	ld [hl], $ff
	ld a, [wPokemonWithdrawDepositParameter]
	dec a
	ld hl, PartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [PartyCount]
	jr nz, .okay2
	ld hl, sBoxMon1Species
	ld bc, BOXMON_STRUCT_LENGTH
	ld a, [sBoxCount]

.okay2
	dec a ; PartyCount - 1
	call AddNTimes

.breedmon
	push hl
	ld e, l
	ld d, h
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	ld hl, sBoxMon1Species
	ld bc, BOXMON_STRUCT_LENGTH
	jr z, .okay3
	cp DAYCARE_WITHDRAW
	ld hl, wBreedMon1Species
	jr z, .okay4
	ld hl, PartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH

.okay3
	ld a, [CurPartyMon]
	call AddNTimes

.okay4
	ld bc, BOXMON_STRUCT_LENGTH
	call CopyBytes
	ld a, [wPokemonWithdrawDepositParameter]
	cp DAYCARE_DEPOSIT
	ld de, wBreedMon1OT
	jr z, .okay5
	dec a
	ld hl, PartyMonOT
	ld a, [PartyCount]
	jr nz, .okay6
	ld hl, sBoxMonOT
	ld a, [sBoxCount]

.okay6
	dec a
	call SkipNames
	ld d, h
	ld e, l

.okay5
	ld hl, sBoxMonOT
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .okay7
	ld hl, wBreedMon1OT
	cp DAYCARE_WITHDRAW
	jr z, .okay8
	ld hl, PartyMonOT

.okay7
	ld a, [CurPartyMon]
	call SkipNames

.okay8
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, [wPokemonWithdrawDepositParameter]
	cp DAYCARE_DEPOSIT
	ld de, wBreedMon1Nick
	jr z, .okay9
	dec a
	ld hl, PartyMonNicknames
	ld a, [PartyCount]
	jr nz, .okay10
	ld hl, sBoxMonNicknames
	ld a, [sBoxCount]

.okay10
	dec a
	call SkipNames
	ld d, h
	ld e, l

.okay9
	ld hl, sBoxMonNicknames
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .okay11
	ld hl, wBreedMon1Nick
	cp DAYCARE_WITHDRAW
	jr z, .okay12
	ld hl, PartyMonNicknames

.okay11
	ld a, [CurPartyMon]
	call SkipNames

.okay12
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	pop hl

	ld a, [wPokemonWithdrawDepositParameter]
	cp PC_DEPOSIT
	jr z, .took_out_of_box
	cp DAYCARE_DEPOSIT
	jp z, .CloseSRAM_And_ClearCarryFlag

	push hl
	srl a
	add $2
	ld [MonType], a
	predef CopyPkmnToTempMon
	callab CalcLevel
	ld a, d
	ld [CurPartyLevel], a
	pop hl

	ld b, h
	ld c, l
	ld hl, MON_LEVEL
	add hl, bc
	ld [hl], a
	ld hl, MON_MAXHP
	add hl, bc
	ld d, h
	ld e, l
	ld hl, MON_STAT_EXP - 1
	add hl, bc

	push bc
	ld b, $1
	call CalcPkmnStats
	pop bc

	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr nz, .CloseSRAM_And_ClearCarryFlag
	ld hl, MON_STATUS
	add hl, bc
	xor a
	ld [hl], a
	ld hl, MON_HP
	add hl, bc
	ld d, h
	ld e, l
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .egg
	inc hl
	inc hl
	ld a, [hli]
	ld [de], a
	ld a, [hl]
	inc de
	ld [de], a
	jr .CloseSRAM_And_ClearCarryFlag

.egg
	xor a
	ld [de], a
	inc de
	ld [de], a
	jr .CloseSRAM_And_ClearCarryFlag

.took_out_of_box
	ld a, [sBoxCount]
	dec a
	ld b, a
	call RestorePPofDepositedPokemon
.CloseSRAM_And_ClearCarryFlag:
	call CloseSRAM
	and a
	ret
; dcb1

CloseSRAM_And_SetCarryFlag: ; dcb1
	call CloseSRAM
	scf
	ret
; dcb6

RestorePPofDepositedPokemon: ; dcb6
	ld a, b
	ld hl, sBoxMons
	ld bc, BOXMON_STRUCT_LENGTH
	call AddNTimes
	ld b, h
	ld c, l
	ld hl, MON_PP
	add hl, bc
	push hl
	push bc
	ld de, TempMonPP
	ld bc, NUM_MOVES
	call CopyBytes
	pop bc
	ld hl, MON_MOVES
	add hl, bc
	push hl
	ld de, TempMonMoves
	ld bc, NUM_MOVES
	call CopyBytes
	pop hl
	pop de

	ld a, [wMenuCursorY]
	push af
	ld a, [MonType]
	push af
	ld b, 0
.loop
	ld a, [hli]
	and a
	jr z, .done
	ld [TempMonMoves], a
	ld a, BOXMON
	ld [MonType], a
	ld a, b
	ld [wMenuCursorY], a
	push bc
	push hl
	push de
	callba GetMaxPPOfMove
	pop de
	pop hl
	ld a, [wd265]
	ld b, a
	ld a, [de]
	and %11000000
	add b
	ld [de], a
	pop bc
	inc de
	inc b
	ld a, b
	cp NUM_MOVES
	jr c, .loop

.done
	pop af
	ld [MonType], a
	pop af
	ld [wMenuCursorY], a
	ret
; dd21

RetrievePokemonFromDaycareMan: ; dd21
	ld a, [wBreedMon1Species]
	ld [CurPartySpecies], a
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX
	call GetBreedMon1LevelGrowth
	ld a, b
	ld [wd002], a
	ld a, e
	ld [CurPartyLevel], a
	xor a
	ld [wPokemonWithdrawDepositParameter], a
	jp Functiondd64
; dd42

RetrievePokemonFromDaycareLady: ; dd42
	ld a, [wBreedMon2Species]
	ld [CurPartySpecies], a
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX
	call GetBreedMon2LevelGrowth
	ld a, b
	ld [wd002], a
	ld a, e
	ld [CurPartyLevel], a
	ld a, PC_DEPOSIT
	ld [wPokemonWithdrawDepositParameter], a
	jp Functiondd64
; dd64

Functiondd64: ; dd64
	ld hl, PartyCount
	ld a, [hl]
	cp PARTY_LENGTH
	jr nz, .room_in_party
	scf
	ret

.room_in_party
	inc a
	ld [hl], a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	ld a, [wBreedMon1Species]
	ld de, wBreedMon1Nick
	jr z, .okay
	ld a, [wBreedMon2Species]
	ld de, wBreedMon2Nick

.okay
	ld [hli], a
	ld [CurSpecies], a
	ld a, $ff
	ld [hl], a
	ld hl, PartyMonNicknames
	ld a, [PartyCount]
	dec a
	call SkipNames
	push hl
	ld h, d
	ld l, e
	pop de
	call CopyBytes
	push hl
	ld hl, PartyMonOT
	ld a, [PartyCount]
	dec a
	call SkipNames
	ld d, h
	ld e, l
	pop hl
	call CopyBytes
	push hl
	call Functionde1a
	pop hl
	ld bc, BOXMON_STRUCT_LENGTH
	call CopyBytes
	call GetBaseData
	call Functionde1a
	ld b, d
	ld c, e
	ld hl, MON_LEVEL
	add hl, bc
	ld a, [CurPartyLevel]
	ld [hl], a
	ld hl, MON_MAXHP
	add hl, bc
	ld d, h
	ld e, l
	ld hl, $a
	add hl, bc
	push bc
	ld b, $1
	call CalcPkmnStats
	ld hl, PartyMon1Moves
	ld a, [PartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld a, $1
	ld [Buffer1], a
	predef FillMoves
	ld a, [PartyCount]
	dec a
	ld [CurPartyMon], a
	callba HealPartyMon
	ld a, [CurPartyLevel]
	ld d, a
	callab CalcExpAtLevel
	pop bc
	ld hl, $8
	add hl, bc
	ld a, [hMultiplicand]
	ld [hli], a
	ld a, [hMultiplicand + 1]
	ld [hli], a
	ld a, [hMultiplicand + 2]
	ld [hl], a
	and a
	ret
; de1a

Functionde1a: ; de1a
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ret
; de2a

DepositMonWithDaycareMan: ; de2a
	ld de, wBreedMon1Nick
	call DepositBreedmon
	xor a
	ld [wPokemonWithdrawDepositParameter], a
	jp RemoveMonFromPartyOrBox
; de37

DepositMonWithDaycareLady: ; de37
	ld de, wBreedMon2Nick
	call DepositBreedmon
	xor a
	ld [wPokemonWithdrawDepositParameter], a
	jp RemoveMonFromPartyOrBox
; de44

DepositBreedmon: ; de44
	ld a, [CurPartyMon]
	ld hl, PartyMonNicknames
	call SkipNames
	call CopyBytes
	ld a, [CurPartyMon]
	ld hl, PartyMonOT
	call SkipNames
	call CopyBytes
	ld a, [CurPartyMon]
	ld hl, PartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld bc, BOXMON_STRUCT_LENGTH
	jp CopyBytes

SentPkmnIntoBox: ; de6e
; Sents the Pkmn into one of Bills Boxes
; the data comes mainly from 'EnemyMon:'
	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld de, sBoxCount
	ld a, [de]
	cp MONS_PER_BOX
	jp nc, .full
	inc a
	ld [de], a

	ld a, [CurPartySpecies]
	ld [CurSpecies], a
	ld c, a
.loop
	inc de
	ld a, [de]
	ld b, a
	ld a, c
	ld c, b
	ld [de], a
	inc a
	jr nz, .loop

	call GetBaseData
	call ShiftBoxMon

	ld hl, PlayerName
	ld de, sBoxMonOT
	ld bc, NAME_LENGTH
	call CopyBytes

	ld a, [CurPartySpecies]
	ld [wd265], a
	call GetPokemonName

	ld de, sBoxMonNicknames
	ld hl, StringBuffer1
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes

	ld hl, EnemyMon
	ld de, sBoxMon1
	ld bc, 1 + 1 + NUM_MOVES ; species + item + moves
	call CopyBytes

	ld hl, PlayerID
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	push de
	ld a, [CurPartyLevel]
	ld d, a
	callab CalcExpAtLevel
	pop de
	ld a, [hProduct + 1]
	ld [de], a
	inc de
	ld a, [hProduct + 2]
	ld [de], a
	inc de
	ld a, [hProduct + 3]
	ld [de], a
	inc de

	; Set all 5 Experience Values to 0
	xor a
	ld b, 2 * 5
.loop2
	ld [de], a
	inc de
	dec b
	jr nz, .loop2

	ld hl, EnemyMonDVs
	ld b, 2 + NUM_MOVES ; DVs and PP ; EnemyMonHappiness - EnemyMonDVs
.loop3
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .loop3

	ld a, BASE_HAPPINESS
	ld [de], a
	inc de
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld a, [CurPartyLevel]
	ld [de], a
	ld a, [CurPartySpecies]
	dec a
	call SetSeenAndCaughtMon
	ld a, [CurPartySpecies]
	cp UNOWN
	jr nz, .not_unown
	ld hl, sBoxMon1DVs
	predef GetUnownLetter
	callab UpdateUnownDex

.not_unown
	ld hl, sBoxMon1Moves
	ld de, TempMonMoves
	ld bc, NUM_MOVES
	call CopyBytes

	ld hl, sBoxMon1PP
	ld de, TempMonPP
	ld bc, NUM_MOVES
	call CopyBytes

	ld b, 0
	call RestorePPofDepositedPokemon

	call CloseSRAM
	scf
	ret
; df42

.full ; df42
	call CloseSRAM
	and a
	ret
; df47

ShiftBoxMon: ; df47
	ld hl, sBoxMonOT
	ld bc, NAME_LENGTH
	call .shift

	ld hl, sBoxMonNicknames
	ld bc, PKMN_NAME_LENGTH
	call .shift

	ld hl, sBoxMons
	ld bc, BOXMON_STRUCT_LENGTH

.shift
	ld a, [sBoxCount]
	cp 2
	ret c

	push hl
	call AddNTimes
	dec hl
	ld e, l
	ld d, h
	pop hl

	ld a, [sBoxCount]
	dec a
	call AddNTimes
	dec hl

	push hl
	ld a, [sBoxCount]
	dec a
	ld hl, 0
	call AddNTimes
	ld c, l
	ld b, h
	pop hl
.loop
	ld a, [hld]
	ld [de], a
	dec de
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret
; df8c

GiveEgg:: ; df8c
	ld a, [CurPartySpecies]
	push af
	callab GetPreEvolution
	callab GetPreEvolution
	ld a, [CurPartySpecies]
	dec a

; TryAddMonToParty sets Seen and Caught flags
; when it is successful.  This routine will make
; sure that we aren't newly setting flags.
	push af
	call CheckCaughtMon
	pop af
	push bc
	call CheckSeenMon
	push bc

	call TryAddMonToParty

; If we haven't caught this Pokemon before receiving
; the Egg, reset the flag that was just set by
; TryAddMonToParty.
	pop bc
	ld a, c
	and a
	jr nz, .skip_caught_flag
	ld a, [CurPartySpecies]
	dec a
	ld c, a
	ld d, $0
	ld hl, PokedexCaught
	ld b, RESET_FLAG
	predef FlagPredef

.skip_caught_flag
; If we haven't seen this Pokemon before receiving
; the Egg, reset the flag that was just set by
; TryAddMonToParty.
	pop bc
	ld a, c
	and a
	jr nz, .skip_seen_flag
	ld a, [CurPartySpecies]
	dec a
	ld c, a
	ld d, $0
	ld hl, PokedexSeen
	ld b, RESET_FLAG
	predef FlagPredef

.skip_seen_flag
	pop af
	ld [CurPartySpecies], a
	ld a, [PartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, PartyMon1Species
	call AddNTimes
	ld a, [CurPartySpecies]
	ld [hl], a
	ld hl, PartyCount
	ld a, [hl]
	ld b, 0
	ld c, a
	add hl, bc
	ld a, EGG
	ld [hl], a
	ld a, [PartyCount]
	dec a
	ld hl, PartyMonNicknames
	call SkipNames
	ld de, String_Egg
	call CopyName2
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1Happiness
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [wMonStatusFlags]
	bit 1, a
	ld a, 1
	jr nz, .got_init_happiness
	ld a, [BaseEggSteps]

.got_init_happiness
	ld [hl], a
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1HP
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	xor a
	ld [hli], a
	ld [hl], a
	and a
	ret
; e035

String_Egg: ; e035
	db "EGG@"
; e039

RemoveMonFromPartyOrBox: ; e039
	ld hl, PartyCount

	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .okay

	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld hl, sBoxCount

.okay
	ld a, [hl]
	dec a
	ld [hli], a
	ld a, [CurPartyMon]
	ld c, a
	ld b, 0
	add hl, bc
	ld e, l
	ld d, h
	inc de
.loop
	ld a, [de]
	inc de
	ld [hli], a
	inc a
	jr nz, .loop
	ld hl, PartyMonOT
	ld d, PARTY_LENGTH - 1
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .party
	ld hl, sBoxMonOT
	ld d, MONS_PER_BOX - 1

.party
	; If this is the last mon in our party (box),
	; shift all the other mons up to close the gap.
	ld a, [CurPartyMon]
	call SkipNames
	ld a, [CurPartyMon]
	cp d
	jr nz, .delete_inside
	ld [hl], -1
	jp .finish

.delete_inside
	; Shift the OT names
	ld d, h
	ld e, l
	ld bc, PKMN_NAME_LENGTH
	add hl, bc
	ld bc, PartyMonNicknames
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .party2
	ld bc, sBoxMonNicknames
.party2
	call CopyDataUntil
	; Shift the struct
	ld hl, PartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .party4
	ld hl, sBoxMons
	ld bc, BOXMON_STRUCT_LENGTH
.party4
	ld a, [CurPartyMon]
	call AddNTimes
	ld d, h
	ld e, l
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .party5
	ld bc, BOXMON_STRUCT_LENGTH
	add hl, bc
	ld bc, sBoxMonOT
	jr .copy

.party5
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	ld bc, PartyMonOT
.copy
	call CopyDataUntil
	; Shift the nicknames
	ld hl, PartyMonNicknames
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .party6
	ld hl, sBoxMonNicknames
.party6
	ld bc, PKMN_NAME_LENGTH
	ld a, [CurPartyMon]
	call AddNTimes
	ld d, h
	ld e, l
	ld bc, PKMN_NAME_LENGTH
	add hl, bc
	ld bc, PartyMonNicknamesEnd
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .party7
	ld bc, sBoxMonNicknamesEnd
.party7
	call CopyDataUntil
	; Mail time!
.finish
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jp nz, CloseSRAM
	ld a, [wLinkMode]
	and a
	ret nz
	; Shift mail
	ld a, BANK(sPartyMail)
	call GetSRAMBank
	; If this is the last mon in our party, no need to shift mail.
	ld hl, PartyCount
	ld a, [CurPartyMon]
	cp [hl]
	jr z, .close_sram
	; Shift our mail messages up.
	ld hl, sPartyMail
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	push hl
	add hl, bc
	pop de
	ld a, [CurPartyMon]
	ld b, a
.loop2
	push bc
	push hl
	ld bc, MAIL_STRUCT_LENGTH
	call CopyBytes
	pop hl
	push hl
	ld bc, MAIL_STRUCT_LENGTH
	add hl, bc
	pop de
	pop bc
	inc b
	ld a, [PartyCount]
	cp b
	jr nz, .loop2
.close_sram
	jp CloseSRAM
; e134


ComputeNPCTrademonStats: ; e134
	ld a, MON_LEVEL
	call GetPartyParamLocation
	ld a, [hl]
	ld [MON_LEVEL], a ; wow
	ld a, MON_SPECIES
	call GetPartyParamLocation
	ld a, [hl]
	ld [CurSpecies], a
	call GetBaseData
	ld a, MON_MAXHP
	call GetPartyParamLocation
	ld d, h
	ld e, l
	push de
	ld a, MON_STAT_EXP - 1
	call GetPartyParamLocation
	ld b, $1
	call CalcPkmnStats
	pop de
	ld a, MON_HP
	call GetPartyParamLocation
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hl], a
	ret
; e167

CalcPkmnStats: ; e167
; Calculates all 6 Stats of a Pkmn
; b: Take into account stat EXP if TRUE
; 'c' counts from 1-6 and points with 'BaseStats' to the base value
; hl is the path to the Stat EXP
; results in $ffb5 and $ffb6 are saved in [de]

	ld c, $0
.loop
	inc c
	call CalcPkmnStatC
	ld a, [hMultiplicand + 1]
	ld [de], a
	inc de
	ld a, [hMultiplicand + 2]
	ld [de], a
	inc de
	ld a, c
	cp STAT_SDEF
	jr nz, .loop
	ret
; e17b

CalcPkmnStatC: ; e17b
; 'c' is 1-6 and points to the BaseStat
; 1: HP
; 2: Attack
; 3: Defense
; 4: Speed
; 5: SpAtk
; 6: SpDef
	push hl
	push de
	push bc
	ld a, b
	ld d, a
	push hl
	ld hl, BaseStats
	dec hl ; has to be decreased, because 'c' begins with 1
	ld b, $0
	add hl, bc
	ld a, [hl]
	ld e, a
	pop hl
	push hl
	ld a, c
	cp STAT_SDEF
	jr nz, .not_spdef
	dec hl
	dec hl

.not_spdef
	sla c
	ld a, d
	and a
	jr z, .no_stat_exp
	add hl, bc
	push de
	ld a, [hld]
	ld e, a
	ld d, [hl]
	callba GetSquareRoot
	pop de

.no_stat_exp
	srl c
	pop hl
	push bc
	ld bc, MON_DVS - MON_HP_EXP + 1
	add hl, bc
	pop bc
	ld a, c
	cp STAT_ATK
	jr z, .Attack
	cp STAT_DEF
	jr z, .Defense
	cp STAT_SPD
	jr z, .Speed
	cp STAT_SATK
	jr z, .Special
	cp STAT_SDEF
	jr z, .Special
; DV_HP = (DV_ATK & 1) << 3 + (DV_DEF & 1) << 2 + (DV_SPD & 1) << 1 + (DV_SPC & 1)
	push bc
	ld a, [hl]
	swap a
	and $1
	add a
	add a
	add a
	ld b, a
	ld a, [hli]
	and $1
	add a
	add a
	add b
	ld b, a
	ld a, [hl]
	swap a
	and $1
	add a
	add b
	ld b, a
	ld a, [hl]
	and $1
	add b
	pop bc
	jr .GotDV

.Attack:
	ld a, [hl]
	swap a
	and $f
	jr .GotDV

.Defense:
	ld a, [hl]
	and $f
	jr .GotDV

.Speed:
	inc hl
	ld a, [hl]
	swap a
	and $f
	jr .GotDV

.Special:
	inc hl
	ld a, [hl]
	and $f

.GotDV:
	ld d, 0
	add e
	ld e, a
	jr nc, .no_overflow_1
	inc d

.no_overflow_1
	sla e
	rl d
	srl b
	srl b
	ld a, b
	add e
	jr nc, .no_overflow_2
	inc d

.no_overflow_2
	ld [hMultiplicand + 2], a
	ld a, d
	ld [hMultiplicand + 1], a
	xor a
	ld [hMultiplicand + 0], a
	ld a, [CurPartyLevel]
	ld [hMultiplier], a
	call Multiply
	ld a, [hProduct + 1]
	ld [hDividend + 0], a
	ld a, [hProduct + 2]
	ld [hDividend + 1], a
	ld a, [hProduct + 3]
	ld [hDividend + 2], a
	ld a, 100
	ld [hDivisor], a
	ld a, 3
	ld b, a
	call Divide
	ld a, c
	cp STAT_HP
	ld a, 5
	jr nz, .not_hp
	ld a, [CurPartyLevel]
	ld b, a
	ld a, [hQuotient + 2]
	add b
	ld [hMultiplicand + 2], a
	jr nc, .no_overflow_3
	ld a, [hQuotient + 1]
	inc a
	ld [hMultiplicand + 1], a

.no_overflow_3
	ld a, 10

.not_hp
	ld b, a
	ld a, [hQuotient + 2]
	add b
	ld [hMultiplicand + 2], a
	jr nc, .no_overflow_4
	ld a, [hQuotient + 1]
	inc a
	ld [hMultiplicand + 1], a

.no_overflow_4
	ld a, [hQuotient + 1]
	cp (1000 / $100) + 1
	jr nc, .max_stat
	cp 1000 / $100
	jr c, .stat_value_okay
	ld a, [hQuotient + 2]
	cp 1000 % $100
	jr c, .stat_value_okay

.max_stat
	ld a, 999 / $100
	ld [hMultiplicand + 1], a
	ld a, 999 % $100
	ld [hMultiplicand + 2], a

.stat_value_okay
	pop bc
	pop de
	pop hl
	ret
; e277

GivePoke:: ; e277
	push de
	push bc
	xor a ; PARTYMON
	ld [MonType], a
	call TryAddMonToParty
	jr nc, .failed
	ld hl, PartyMonNicknames
	ld a, [PartyCount]
	dec a
	ld [CurPartyMon], a
	call SkipNames
	ld d, h
	ld e, l
	pop bc
	ld a, b
	ld b, 0
	push bc
	push de
	push af
	ld a, [CurItem]
	and a
	jr z, .done
	ld a, [CurPartyMon]
	ld hl, PartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [CurItem]
	ld [hl], a
	jr .done

.failed
	ld a, [CurPartySpecies]
	ld [TempEnemyMonSpecies], a
	callab LoadEnemyMon
	call SentPkmnIntoBox
	jp nc, .FailedToGiveMon
	ld a, BOXMON
	ld [MonType], a
	xor a
	ld [CurPartyMon], a
	ld de, wMonOrItemNameBuffer
	pop bc
	ld a, b
	ld b, 1
	push bc
	push de
	push af
	ld a, [CurItem]
	and a
	jr z, .done
	ld a, [CurItem]
	ld [sBoxMon1Item], a

.done
	ld a, [CurPartySpecies]
	ld [wd265], a
	ld [TempEnemyMonSpecies], a
	call GetPokemonName
	ld hl, StringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	pop af
	and a
	jp z, .wildmon
	pop de
	pop bc
	pop hl
	push bc
	push hl
	ld a, [ScriptBank]
	call GetFarHalfword
	ld bc, PKMN_NAME_LENGTH
	ld a, [ScriptBank]
	call FarCopyBytes
	pop hl
	inc hl
	inc hl
	ld a, [ScriptBank]
	call GetFarHalfword
	pop bc
	ld a, b
	and a
	push de
	push bc
	jr nz, .send_to_box

	push hl
	ld a, [CurPartyMon]
	ld hl, PartyMonOT
	call SkipNames
	ld d, h
	ld e, l
	pop hl
.otnameloop
	ld a, [ScriptBank]
	call GetFarByte
	ld [de], a
	inc hl
	inc de
	cp "@"
	jr nz, .otnameloop
	ld a, [ScriptBank]
	call GetFarByte
	ld b, a
	push bc
	ld a, [CurPartyMon]
	ld hl, PartyMon1ID
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, 01001 / $100
	ld [hli], a
	ld [hl], 01001 % $100
	pop bc
	callba SetGiftPartyMonCaughtData
	jr .skip_nickname

.send_to_box
	ld a, BANK(sBoxMonOT)
	call GetSRAMBank
	ld de, sBoxMonOT
.loop
	ld a, [ScriptBank]
	call GetFarByte
	ld [de], a
	inc hl
	inc de
	cp "@"
	jr nz, .loop
	ld a, [ScriptBank]
	call GetFarByte
	ld b, a
	ld hl, sBoxMon1ID
	call Random
	ld [hli], a
	call Random
	ld [hl], a
	call CloseSRAM
	callba SetGiftBoxMonCaughtData
	jr .skip_nickname

.wildmon
	pop de
	pop bc
	push bc
	push de
	ld a, b
	and a
	jr z, .party
	callba SetBoxMonCaughtData
	jr .set_caught_data

.party
	callba SetCaughtData
.set_caught_data
	callba GiveANickname_YesNo
	pop de
	jr c, .skip_nickname
	call InitNickname

.skip_nickname
	pop bc
	pop de
	ld a, b
	and a
	ret z
	ld hl, TextJump_WasSentToBillsPC
	call PrintText
	ld a, BANK(sBoxMonNicknames)
	call GetSRAMBank
	ld hl, wMonOrItemNameBuffer
	ld de, sBoxMonNicknames
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	call CloseSRAM
	ld b, $1
	ret
; e3d4

.FailedToGiveMon: ; e3d4
	pop bc
	pop de
	ld b, $2
	ret
; e3d9

TextJump_WasSentToBillsPC: ; 0xe3d9
	; was sent to BILL's PC.
	text_jump Text_WasSentToBillsPC
	db "@"
; 0xe3de

InitNickname: ; e3de
	push de
	call LoadStandardMenuDataHeader
	call DisableSpriteUpdates
	pop de
	push de
	ld b, $0
	callba NamingScreen
	pop hl
	ld de, StringBuffer1
	call InitName
	ld a, $4 ; XXX could this be in bank 4 in pokered?
	ld hl, ExitAllMenus
	rst FarCall
	ret
; e3fd
