InsertPokemonIntoBox: ; 51322
	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld hl, sBoxCount
	call InsertSpeciesIntoBoxOrParty
	ld a, [sBoxCount]
	dec a
	ld [wd265], a
	ld hl, sBoxMonNicknames
	ld bc, MON_NAME_LENGTH
	ld de, wBufferMonNick
	call InsertDataIntoBoxOrParty
	ld a, [sBoxCount]
	dec a
	ld [wd265], a
	ld hl, sBoxMonOT
	ld bc, NAME_LENGTH
	ld de, wBufferMonOT
	call InsertDataIntoBoxOrParty
	ld a, [sBoxCount]
	dec a
	ld [wd265], a
	ld hl, sBoxMons
	ld bc, BOXMON_STRUCT_LENGTH
	ld de, wBufferMon
	call InsertDataIntoBoxOrParty
	ld hl, wBufferMonMoves
	ld de, wTempMonMoves
	ld bc, NUM_MOVES
	call CopyBytes
	ld hl, wBufferMonPP
	ld de, wTempMonPP
	ld bc, NUM_MOVES
	call CopyBytes
	ld a, [wCurPartyMon]
	ld b, a
	farcall RestorePPofDepositedPokemon
	jp CloseSRAM

InsertPokemonIntoParty: ; 5138b
	ld hl, wPartyCount
	call InsertSpeciesIntoBoxOrParty
	ld a, [wPartyCount]
	dec a
	ld [wd265], a
	ld hl, wPartyMonNicknames
	ld bc, MON_NAME_LENGTH
	ld de, wBufferMonNick
	call InsertDataIntoBoxOrParty
	ld a, [wPartyCount]
	dec a
	ld [wd265], a
	ld hl, wPartyMonOT
	ld bc, NAME_LENGTH
	ld de, wBufferMonOT
	call InsertDataIntoBoxOrParty
	ld a, [wPartyCount]
	dec a
	ld [wd265], a
	ld hl, wPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	ld de, wBufferMon
	call InsertDataIntoBoxOrParty
	ret

InsertSpeciesIntoBoxOrParty: ; 513cb
	inc [hl]
	inc hl
	ld a, [wCurPartyMon]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [wCurPartySpecies]
	ld c, a
.loop
	ld a, [hl]
	ld [hl], c
	inc hl
	inc c
	ld c, a
	jr nz, .loop
	ret

InsertDataIntoBoxOrParty: ; 513e0
	push de
	push hl
	push bc
	ld a, [wd265]
	dec a
	call AddNTimes
	push hl
	add hl, bc
	ld d, h
	ld e, l
	pop hl
.loop
	push bc
	ld a, [wd265]
	ld b, a
	ld a, [wCurPartyMon]
	cp b
	pop bc
	jr z, .insert
	push hl
	push de
	push bc
	call CopyBytes
	pop bc
	pop de
	pop hl
	push hl
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	pop de
	ld a, [wd265]
	dec a
	ld [wd265], a
	jr .loop

.insert
	pop bc
	pop hl
	ld a, [wCurPartyMon]
	call AddNTimes
	ld d, h
	ld e, l
	pop hl
	call CopyBytes
	ret
