Function13a47: ; unreferenced
	ld hl, PartyCount
	ld a, [hl]
	and a
	ret z

	cp PARTY_LENGTH + 1
	jr c, .asm_13a54
	ld a, PARTY_LENGTH
	ld [hl], a
.asm_13a54
	inc hl

	ld b, a
	ld c, 0
.asm_13a58
	ld a, [hl]
	and a
	jr z, .asm_13a64
	cp $fc
	jr z, .asm_13a64
	cp $fe
	jr c, .asm_13a73

.asm_13a64
	ld [hl], SMEARGLE
	push hl
	push bc
	ld a, c
	ld hl, PartyMon1Species
	call GetPartyLocation
	ld [hl], SMEARGLE
	pop bc
	pop hl

.asm_13a73
	inc hl
	inc c
	dec b
	jr nz, .asm_13a58
	ld [hl], $ff

	ld hl, PartyMon1
	ld a, [PartyCount]
	ld d, a
	ld e, 0
.asm_13a83
	push de
	push hl
	ld b, h
	ld c, l
	ld a, [hl]
	and a
	jr z, .asm_13a8f
	cp NUM_POKEMON + 1
	jr c, .asm_13a9c

.asm_13a8f
	ld [hl], SMEARGLE
	push de
	ld d, 0
	ld hl, PartySpecies
	add hl, de
	pop de
	ld a, SMEARGLE
	ld [hl], a

.asm_13a9c
	ld [CurSpecies], a
	call GetBaseData
	ld hl, MON_LEVEL
	add hl, bc
	ld a, [hl]
	cp MIN_LEVEL
	ld a, MIN_LEVEL
	jr c, .asm_13ab4
	ld a, [hl]
	cp MAX_LEVEL
	jr c, .asm_13ab5
	ld a, MAX_LEVEL
.asm_13ab4
	ld [hl], a
.asm_13ab5
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
	jr nz, .asm_13a83

	ld de, PartyMonNicknames
	ld a, [PartyCount]
	ld b, a
	ld c, 0
.asm_13adc
	push bc
	call Function13b71
	push de
	callba CheckStringForErrors
	pop hl
	pop bc
	jr nc, .asm_13b0e

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
	jr z, .asm_13b06
	ld [wd265], a
	call GetPokemonName
	ld hl, StringBuffer1
.asm_13b06
	pop de
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	pop bc

.asm_13b0e
	inc c
	dec b
	jr nz, .asm_13adc

	ld de, PartyMonOT
	ld a, [PartyCount]
	ld b, a
	ld c, 0
.asm_13b1b
	push bc
	call Function13b71
	push de
	callba CheckStringForErrors
	pop hl
	jr nc, .asm_13b34
	ld d, h
	ld e, l
	ld hl, PlayerName
	ld bc, NAME_LENGTH
	call CopyBytes
.asm_13b34
	pop bc
	inc c
	dec b
	jr nz, .asm_13b1b

	ld hl, PartyMon1Moves
	ld a, [PartyCount]
	ld b, a
.asm_13b40
	push hl
	ld c, NUM_MOVES
	ld a, [hl]
	and a
	jr z, .asm_13b4b
	cp NUM_ATTACKS + 1
	jr c, .asm_13b4d
.asm_13b4b
	ld [hl], POUND

.asm_13b4d
	ld a, [hl]
	and a
	jr z, .asm_13b55
	cp NUM_ATTACKS + 1
	jr c, .asm_13b5c

.asm_13b55
	xor a
	ld [hli], a
	dec c
	jr nz, .asm_13b55
	jr .asm_13b60

.asm_13b5c
	inc hl
	dec c
	jr nz, .asm_13b4d

.asm_13b60
	pop hl
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_13b40
	ret
; 13b6b

.TAMAGO: ; 13b6b
	db "タマゴ@@@"
; 13b71

Function13b71: ; 13b71
	push de
	ld c, 1
	ld b, 6
.loop
	ld a, [de]
	cp "@"
	jr z, .done
	inc de
	inc c
	dec b
	jr nz, .loop
	dec c
	dec de
	ld a, "@"
	ld [de], a

.done
	pop de
	ret
; 13b87
