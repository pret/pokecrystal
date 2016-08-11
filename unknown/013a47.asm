CorrectErrorsInPlayerParty: ; unreferenced
	ld hl, PartyCount
	ld a, [hl]
	and a
	ret z

	cp PARTY_LENGTH + 1
	jr c, .party_length_okay
	ld a, PARTY_LENGTH
	ld [hl], a
.party_length_okay
	inc hl

	ld b, a
	ld c, 0
.loop1
	ld a, [hl]
	and a
	jr z, .invalid_species
	cp NUM_POKEMON + 1
	jr z, .invalid_species
	cp EGG + 1
	jr c, .next_species

.invalid_species
	ld [hl], SMEARGLE
	push hl
	push bc
	ld a, c
	ld hl, PartyMon1Species
	call GetPartyLocation
	ld [hl], SMEARGLE
	pop bc
	pop hl

.next_species
	inc hl
	inc c
	dec b
	jr nz, .loop1
	ld [hl], $ff

	ld hl, PartyMon1
	ld a, [PartyCount]
	ld d, a
	ld e, 0
.loop2
	push de
	push hl
	ld b, h
	ld c, l
	ld a, [hl]
	and a
	jr z, .invalid_species_2
	cp NUM_POKEMON + 1
	jr c, .check_level

.invalid_species_2
	ld [hl], SMEARGLE
	push de
	ld d, 0
	ld hl, PartySpecies
	add hl, de
	pop de
	ld a, SMEARGLE
	ld [hl], a

.check_level
	ld [CurSpecies], a
	call GetBaseData
	ld hl, MON_LEVEL
	add hl, bc
	ld a, [hl]
	cp MIN_LEVEL
	ld a, MIN_LEVEL
	jr c, .invalid_level
	ld a, [hl]
	cp MAX_LEVEL
	jr c, .load_level
	ld a, MAX_LEVEL
.invalid_level
	ld [hl], a
.load_level
	ld [CurPartyLevel], a

	ld hl, MON_MAXHP
	add hl, bc
	ld d, h
	ld e, l
	ld hl, MON_STAT_EXP - 1
	add hl, bc
	ld b, $1
	predef CalcPkmnStats
	pop hl
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop de
	inc e
	dec d
	jr nz, .loop2

	ld de, PartyMonNicknames
	ld a, [PartyCount]
	ld b, a
	ld c, 0
.loop3
	push bc
	call .GetLengthOfStringWith6CharCap
	push de
	callba CheckStringForErrors
	pop hl
	pop bc
	jr nc, .valid_nickname

	push bc
	push hl
	ld hl, PartySpecies
	push bc
	ld b, 0
	add hl, bc
	pop bc
	ld a, [hl]
	cp EGG
	ld hl, .TAMAGO
	jr z, .got_nickname
	ld [wd265], a
	call GetPokemonName
	ld hl, StringBuffer1
.got_nickname
	pop de
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	pop bc

.valid_nickname
	inc c
	dec b
	jr nz, .loop3

	ld de, PartyMonOT
	ld a, [PartyCount]
	ld b, a
	ld c, 0
.loop4
	push bc
	call .GetLengthOfStringWith6CharCap
	push de
	callba CheckStringForErrors
	pop hl
	jr nc, .valid_ot_name
	ld d, h
	ld e, l
	ld hl, PlayerName
	ld bc, NAME_LENGTH
	call CopyBytes
.valid_ot_name
	pop bc
	inc c
	dec b
	jr nz, .loop4

	ld hl, PartyMon1Moves
	ld a, [PartyCount]
	ld b, a
.loop5
	push hl
	ld c, NUM_MOVES
	ld a, [hl]
	and a
	jr z, .invalid_move
	cp NUM_ATTACKS + 1
	jr c, .moves_loop
.invalid_move
	ld [hl], POUND

.moves_loop
	ld a, [hl]
	and a
	jr z, .fill_invalid_moves
	cp NUM_ATTACKS + 1
	jr c, .next_move

.fill_invalid_moves
	xor a
	ld [hli], a
	dec c
	jr nz, .fill_invalid_moves
	jr .next_pokemon

.next_move
	inc hl
	dec c
	jr nz, .moves_loop

.next_pokemon
	pop hl
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	dec b
	jr nz, .loop5
	ret
; 13b6b

.TAMAGO: ; 13b6b
	db "タマゴ@@@"
; 13b71

.GetLengthOfStringWith6CharCap: ; 13b71
	push de
	ld c, 1
	ld b, 6
.search_loop
	ld a, [de]
	cp "@"
	jr z, .done
	inc de
	inc c
	dec b
	jr nz, .search_loop
	dec c
	dec de
	ld a, "@"
	ld [de], a
.done
	pop de
	ret
; 13b87
