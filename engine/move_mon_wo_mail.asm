InsertPokemonIntoBox: ; 51322
	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld hl, sBoxCount
	call InsertSpeciesIntoBoxOrParty
	ld a, [sBoxCount]
	dec a
	ld [wd265], a
	ld hl, sBoxMonNicknames
	ld bc, PKMN_NAME_LENGTH
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
	ld de, TempMonMoves
	ld bc, NUM_MOVES
	call CopyBytes
	ld hl, wBufferMonPP
	ld de, TempMonPP
	ld bc, NUM_MOVES
	call CopyBytes
	ld a, [CurPartyMon]
	ld b, a
	callba RestorePPofDepositedPokemon
	jp CloseSRAM

InsertPokemonIntoParty: ; 5138b
	ld hl, PartyCount
	call InsertSpeciesIntoBoxOrParty
	ld a, [PartyCount]
	dec a
	ld [wd265], a
	ld hl, PartyMonNicknames
	ld bc, PKMN_NAME_LENGTH
	ld de, wBufferMonNick
	call InsertDataIntoBoxOrParty
	ld a, [PartyCount]
	dec a
	ld [wd265], a
	ld hl, PartyMonOT
	ld bc, NAME_LENGTH
	ld de, wBufferMonOT
	call InsertDataIntoBoxOrParty
	ld a, [PartyCount]
	dec a
	ld [wd265], a
	ld hl, PartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	ld de, wBufferMon
	call InsertDataIntoBoxOrParty
	ret

InsertSpeciesIntoBoxOrParty: ; 513cb
	inc [hl]
	inc hl
	ld a, [CurPartyMon]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [CurPartySpecies]
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
	ld a, [CurPartyMon]
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
	ld a, [CurPartyMon]
	call AddNTimes
	ld d, h
	ld e, l
	pop hl
	call CopyBytes
	ret
