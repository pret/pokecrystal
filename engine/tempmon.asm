Predef_CopyPkmnToTempMon: ; 5084a
; gets the BaseData of a Pkmn
; and copys the PkmnStructure to TempMon

	ld a, [CurPartyMon]
	ld e, a
	call GetPkmnSpecies
	ld a, [CurPartySpecies]
	ld [CurSpecies], a
	call GetBaseData

	ld a, [MonType]
	ld hl, PartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	and a
	jr z, .copywholestruct
	ld hl, OTPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	cp OTPARTYMON
	jr z, .copywholestruct
	ld bc, BOXMON_STRUCT_LENGTH
	callfar CopyBoxmonToTempMon
	jr .done

.copywholestruct
	ld a, [CurPartyMon]
	call AddNTimes
	ld de, TempMon
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes

.done
	ret

CalcwBufferMonStats: ; 5088b
	ld bc, wBufferMon
	jr _TempMonStatsCalculation

CalcTempmonStats: ; 50890
	ld bc, TempMon
_TempMonStatsCalculation: ; 50893
	ld hl, MON_LEVEL
	add hl, bc
	ld a, [hl]
	ld [CurPartyLevel], a
	ld hl, MON_MAXHP
	add hl, bc
	ld d, h
	ld e, l
	ld hl, MON_STAT_EXP - 1
	add hl, bc
	push bc
	ld b, $1
	predef Predef_CalcPkmnStats
	pop bc
	ld hl, MON_HP
	add hl, bc
	ld d, h
	ld e, l
	ld a, [CurPartySpecies]
	cp EGG
	jr nz, .not_egg
	xor a
	ld [de], a
	inc de
	ld [de], a
	jr .zero_status

.not_egg
	push bc
	ld hl, MON_MAXHP
	add hl, bc
	ld bc, 2
	call CopyBytes
	pop bc

.zero_status
	ld hl, MON_STATUS
	add hl, bc
	xor a
	ld [hli], a
	ld [hl], a
	ret

GetPkmnSpecies: ; 508d5
; [MonType] has the type of the Pkmn
; e = Nr. of Pkmn (i.e. [CurPartyMon])

	ld a, [MonType]
	and a ; PARTYMON
	jr z, .partymon
	cp OTPARTYMON
	jr z, .otpartymon
	cp BOXMON
	jr z, .boxmon
	cp TEMPMON
	jr z, .breedmon
	; WILDMON

.partymon
	ld hl, PartySpecies
	jr .done

.otpartymon
	ld hl, OTPartySpecies
	jr .done

.boxmon
	ld a, BANK(sBoxSpecies)
	call GetSRAMBank
	ld hl, sBoxSpecies
	call .done
	call CloseSRAM
	ret

.breedmon
	ld a, [wBreedMon1Species]
	jr .done2

.done
	ld d, 0
	add hl, de
	ld a, [hl]

.done2
	ld [CurPartySpecies], a
	ret
