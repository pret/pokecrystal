Function16e1d: ; 16e1d
	call Function16ed6
	ld c, $0
	jp nc, .asm_16eb7
	ld a, [wBreedMon1Species]
	ld [CurPartySpecies], a
	ld a, [wBreedMon1DVs]
	ld [TempMonDVs], a
	ld a, [wBreedMon1DVs + 1]
	ld [TempMonDVs + 1], a
	ld a, $3
	ld [MonType], a
	predef GetGender
	jr c, .asm_16e70
	ld b, $1
	jr nz, .asm_16e48
	inc b

.asm_16e48
	push bc
	ld a, [wBreedMon2Species]
	ld [CurPartySpecies], a
	ld a, [wBreedMon2DVs]
	ld [TempMonDVs], a
	ld a, [wBreedMon2DVs + 1]
	ld [TempMonDVs + 1], a
	ld a, $3
	ld [MonType], a
	predef GetGender
	pop bc
	jr c, .asm_16e70
	ld a, $1
	jr nz, .asm_16e6d
	inc a

.asm_16e6d
	cp b
	jr nz, .asm_16e89

.asm_16e70
	ld c, $0
	ld a, [wBreedMon1Species]
	cp DITTO
	jr z, .asm_16e82
	ld a, [wBreedMon2Species]
	cp DITTO
	jr nz, .asm_16eb7
	jr .asm_16e89

.asm_16e82
	ld a, [wBreedMon2Species]
	cp DITTO
	jr z, .asm_16eb7

.asm_16e89
	call Function16ebc
	ld c, $ff
	jp z, .asm_16eb7
	ld a, [wBreedMon2Species]
	ld b, a
	ld a, [wBreedMon1Species]
	cp b
	ld c, $fe
	jr z, .asm_16e9f
	ld c, $80
.asm_16e9f
	ld a, [wBreedMon1ID]
	ld b, a
	ld a, [wBreedMon2ID]
	cp b
	jr nz, .asm_16eb7
	ld a, [wBreedMon1ID + 1]
	ld b, a
	ld a, [wBreedMon2ID + 1]
	cp b
	jr nz, .asm_16eb7
	ld a, c
	sub $4d
	ld c, a

.asm_16eb7
	ld a, c
	ld [wd265], a
	ret
; 16ebc


Function16ebc: ; 16ebc (5:6ebc)
	ld a, [wBreedMon1DVs]
	and $f
	ld b, a
	ld a, [wBreedMon2DVs]
	and $f
	cp b
	ret nz
	ld a, [wBreedMon1DVs + 1]
	and $7
	ld b, a
	ld a, [wBreedMon2DVs + 1]
	and $7
	cp b
	ret
; 16ed6

Function16ed6: ; 16ed6
	ld a, [wBreedMon2Species]
	ld [CurSpecies], a
	call GetBaseData
	ld a, [BaseEggGroups]
	cp $ff
	jr z, .asm_16f3a
	ld a, [wBreedMon1Species]
	ld [CurSpecies], a
	call GetBaseData
	ld a, [BaseEggGroups]
	cp $ff
	jr z, .asm_16f3a
	ld a, [wBreedMon2Species]
	cp DITTO
	jr z, .asm_16f3c
	ld [CurSpecies], a
	call GetBaseData
	ld a, [BaseEggGroups]
	push af
	and $f
	ld b, a
	pop af
	and $f0
	swap a
	ld c, a
	ld a, [wBreedMon1Species]
	cp DITTO
	jr z, .asm_16f3c
	ld [CurSpecies], a
	push bc
	call GetBaseData
	pop bc
	ld a, [BaseEggGroups]
	push af
	and $f
	ld d, a
	pop af
	and $f0
	swap a
	ld e, a
	ld a, d
	cp b
	jr z, .asm_16f3c
	cp c
	jr z, .asm_16f3c
	ld a, e
	cp b
	jr z, .asm_16f3c
	cp c
	jr z, .asm_16f3c

.asm_16f3a
	and a
	ret

.asm_16f3c
	scf
	ret
; 16f3e

DoEggStep:: ; 16f3e
	ld de, PartySpecies
	ld hl, PartyMon1Happiness
	ld c, 0
.loop
	ld a, [de]
	inc de
	cp -1
	ret z
	cp EGG
	jr nz, .next
	dec [hl]
	jr nz, .next
	ld a, 1
	and a
	ret

.next
	push de
	ld de, PARTYMON_STRUCT_LENGTH
	add hl, de
	pop de
	jr .loop
; 16f5e

OverworldHatchEgg:: ; 16f5e
	call ResetWindow
	call LoadStandardMenuDataHeader
	call Function16f70
	call ExitAllMenus
	call RestartMapMusic
	jp LoadMoveSprites
; 16f70

Function16f70: ; 16f70 (5:6f70)
	ld de, PartySpecies
	ld hl, PartyMon1Happiness
	xor a
	ld [CurPartyMon], a

Function16f7a: ; 16f7a (5:6f7a)
	ld a, [de]
	inc de
	cp -1
	jp z, Function1708a
	push de
	push hl
	cp EGG
	jp nz, Function1707d
	ld a, [hl]
	and a
	jp nz, Function1707d
	ld [hl], $78

	push de

	callba SetEggMonCaughtData
	callba MobileFn_10608d
	ld a, [CurPartyMon]
	ld hl, PartyMons ; wdcdf (aliases: PartyMon1, PartyMon1Species)
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
	ld [CurPartySpecies], a
	dec a
	call SetSeenAndCaughtMon

	ld a, [CurPartySpecies]
	cp TOGEPI
	jr nz, .nottogepi
	; set the event flag for hatching togepi
	ld de, EVENT_TOGEPI_HATCHED
	ld b, SET_FLAG
	call EventFlagAction
.nottogepi

	pop de

	ld a, [CurPartySpecies]
	dec de
	ld [de], a
	ld [wd265], a
	ld [CurSpecies], a
	call GetPokemonName
	xor a
	ld [wd26b], a
	call GetBaseData
	ld a, [CurPartyMon]
	ld hl, PartyMons ; wdcdf (aliases: PartyMon1, PartyMon1Species)
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	push hl
	ld bc, MON_MAXHP
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	push hl
	ld bc, MON_LEVEL
	add hl, bc
	ld a, [hl]
	ld [CurPartyLevel], a
	pop hl
	push hl
	ld bc, MON_STATUS
	add hl, bc
	xor a
	ld [hli], a
	ld [hl], a
	pop hl
	push hl
	ld bc, MON_EXP + 2
	add hl, bc
	ld b, $0
	predef CalcPkmnStats
	pop bc
	ld hl, MON_MAXHP
	add hl, bc
	ld d, h
	ld e, l
	ld hl, MON_HP
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hl], a
	ld hl, MON_ID
	add hl, bc
	ld a, [PlayerID]
	ld [hli], a
	ld a, [PlayerID + 1]
	ld [hl], a
	ld a, [CurPartyMon]
	ld hl, PartyMonOT ; wddff (aliases: PartyMonOT)
	ld bc, NAME_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, PlayerName
	call CopyBytes
	ld hl, UnknownText_0x1708b
	call PrintText
	ld a, [CurPartyMon]
	ld hl, PartyMonNicknames
	ld bc, PKMN_NAME_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	push de
	ld hl, UnknownText_0x170ba
	call PrintText
	call YesNoBox
	pop de
	jr c, .nonickname
	ld a, $1
	ld [wd26b], a
	xor a
	ld [MonType], a
	push de
	ld b, $0
	callba NamingScreen
	pop hl
	ld de, StringBuffer1
	call InitName
	jr Function1707d
.nonickname
	ld hl, StringBuffer1
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes

Function1707d: ; 1707d (5:707d)
	ld hl, CurPartyMon
	inc [hl]
	pop hl
	ld de, PARTYMON_STRUCT_LENGTH
	add hl, de
	pop de
	jp Function16f7a

Function1708a: ; 1708a (5:708a)
	ret
; 1708b (5:708b)

UnknownText_0x1708b: ; 0x1708b
	; Huh? @ @
	text_jump UnknownText_0x1c0db0
	start_asm
; 0x17090

Function17090: ; 17090
	ld hl, VramState
	res 0, [hl]
	push hl
	push de
	push bc
	ld a, [CurPartySpecies]
	push af
	call Function1728f
	ld hl, UnknownText_0x170b0
	call PrintText
	pop af
	ld [CurPartySpecies], a
	pop bc
	pop de
	pop hl
	ld hl, UnknownText_0x170b5
	ret
; 170b0 (5:70b0)

UnknownText_0x170b0: ; 0x170b0
	;
	text_jump UnknownText_0x1c0db8
	db "@"
; 0x170b5

UnknownText_0x170b5: ; 0x170b5
	; came out of its EGG!@ @
	text_jump UnknownText_0x1c0dba
	db "@"
; 0x170ba

UnknownText_0x170ba: ; 0x170ba
	; Give a nickname to @ ?
	text_jump UnknownText_0x1c0dd8
	db "@"
; 0x170bf

Function170bf: ; 170bf
	call Function17197
	ld d, h
	ld e, l
	ld b, NUM_MOVES
.loop
	ld a, [de]
	and a
	jr z, .done
	ld hl, wEggMonMoves
	ld c, NUM_MOVES
.next
	ld a, [de]
	cp [hl]
	jr z, .skip
	inc hl
	dec c
	jr nz, .next
	call Function170e4
	jr nc, .skip
	call Function17169

.skip
	inc de
	dec b
	jr nz, .loop

.done
	ret
; 170e4

Function170e4: ; 170e4
GLOBAL EggMoves

	push bc
	ld a, [wEggMonSpecies]
	dec a
	ld c, a
	ld b, 0
	ld hl, EggMovePointers
rept 2
	add hl, bc
endr
	ld a, BANK(EggMovePointers)
	call GetFarHalfword
.loop
	ld a, BANK(EggMoves)
	call GetFarByte
	cp -1
	jr z, .found_mon
	ld b, a
	ld a, [de]
	cp b
	jr z, .done_carry
	inc hl
	jr .loop

.found_mon
	call Function1720b
	ld b, NUM_MOVES
.loop2
	ld a, [de]
	cp [hl]
	jr z, .found_eggmove
	inc hl
	dec b
	jr z, .inherit_tmhm
	jr .loop2

.found_eggmove
	ld a, [wEggMonSpecies]
	dec a
	ld c, a
	ld b, 0
	ld hl, EvosAttacksPointers
rept 2
	add hl, bc
endr
	ld a, BANK(EvosAttacksPointers)
	call GetFarHalfword
.loop3
	ld a, BANK(EvosAttacks)
	call GetFarByte
	inc hl
	and a
	jr nz, .loop3
.loop4
	ld a, BANK(EvosAttacks)
	call GetFarByte
	and a
	jr z, .inherit_tmhm
	inc hl
	ld a, BANK(EvosAttacks)
	call GetFarByte
	ld b, a
	ld a, [de]
	cp b
	jr z, .done_carry
	inc hl
	jr .loop4

.inherit_tmhm
	ld hl, TMHMMoves
.loop5
	ld a, BANK(TMHMMoves)
	call GetFarByte
	inc hl
	and a
	jr z, .done
	ld b, a
	ld a, [de]
	cp b
	jr nz, .loop5
	ld [wd262], a
	predef CanLearnTMHMMove
	ld a, c
	and a
	jr z, .done

.done_carry
	pop bc
	scf
	ret

.done
	pop bc
	and a
	ret
; 17169

Function17169: ; 17169
	push de
	push bc
	ld a, [de]
	ld b, a
	ld hl, wEggMonMoves
	ld c, NUM_MOVES
.loop
	ld a, [hli]
	and a
	jr z, .done
	dec c
	jr nz, .loop
	ld de, wEggMonMoves
	ld hl, wEggMonMoves + 1
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a

.done
	dec hl
	ld [hl], b
	ld hl, wEggMonMoves
	ld de, wEggMonPP
	predef FillPP
	pop bc
	pop de
	ret
; 17197

Function17197: ; 17197
	ld hl, wBreedMon2Moves
	ld a, [wBreedMon1Species]
	cp DITTO
	jr z, .ditto1
	ld a, [wBreedMon2Species]
	cp DITTO
	jr z, .ditto2
	ld a, [wDittoInDaycare]
	and a
	ret z
	ld hl, wBreedMon1Moves
	ret

.ditto1
	ld a, [CurPartySpecies]
	push af
	ld a, [wBreedMon2Species]
	ld [CurPartySpecies], a
	ld a, [wBreedMon2DVs]
	ld [TempMonDVs], a
	ld a, [wBreedMon2DVs + 1]
	ld [TempMonDVs + 1], a
	ld a, $3
	ld [MonType], a
	predef GetGender
	jr c, .inherit_mon2_moves
	jr nz, .inherit_mon2_moves
	jr .inherit_mon1_moves

.ditto2
	ld a, [CurPartySpecies]
	push af
	ld a, [wBreedMon1Species]
	ld [CurPartySpecies], a
	ld a, [wBreedMon1DVs]
	ld [TempMonDVs], a
	ld a, [wBreedMon1DVs + 1]
	ld [TempMonDVs + 1], a
	ld a, $3
	ld [MonType], a
	predef GetGender
	jr c, .inherit_mon1_moves
	jr nz, .inherit_mon1_moves

.inherit_mon2_moves
	ld hl, wBreedMon2Moves
	pop af
	ld [CurPartySpecies], a
	ret

.inherit_mon1_moves
	ld hl, wBreedMon1Moves
	pop af
	ld [CurPartySpecies], a
	ret
; 1720b

Function1720b: ; 1720b
	ld hl, wBreedMon1Moves
	ld a, [wBreedMon1Species]
	cp DITTO
	ret z
	ld a, [wBreedMon2Species]
	cp DITTO
	jr z, .ditto
	ld a, [wDittoInDaycare]
	and a
	ret z

.ditto
	ld hl, wBreedMon2Moves
	ret
; 17224


Function17224: ; 17224 (5:7224)
	push de
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	call GetBaseData
	ld hl, BattleMonDVs
	predef GetUnownLetter
	pop de
	predef_jump GetFrontpic

Function1723c: ; 1723c (5:723c)
	push de
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	call GetBaseData
	ld hl, BattleMonDVs
	predef GetUnownLetter
	pop de
	predef_jump Function5108b

Function17254: ; 17254 (5:7254)
	push af
	call WaitTop
	push hl
	push bc
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	pop bc
	pop hl
	ld a, b
	ld [hBGMapAddress + 1], a
	ld a, c
	ld [hFillBox], a
	lb bc, 7, 7
	predef FillBox
	pop af
	call Function17363
	call SetPalettes
	jp WaitBGMap

Function1727f: ; 1727f (5:727f)
	push hl
	push de
	push bc
	callab Function8cf69
	call DelayFrame
	pop bc
	pop de
	pop hl
	ret

Function1728f: ; 1728f (5:728f)
	ld a, [wd265]
	ld [wJumptableIndex], a
	ld a, [CurSpecies]
	push af
	ld de, MUSIC_NONE
	call PlayMusic
	callba Function8000
	call DisableLCD
	ld hl, EggHatchGFX
	ld de, VTiles0 tile $00
	ld bc, $20
	ld a, BANK(EggHatchGFX)
	call FarCopyBytes
	callba Function8cf53
	ld de, VTiles2 tile $00
	ld a, [wJumptableIndex]
	call Function1723c
	ld de, VTiles2 tile $31
	ld a, EGG
	call Function17224
	ld de, MUSIC_EVOLUTION
	call PlayMusic
	call EnableLCD
	hlcoord 7, 4
	ld b, $98
	ld c, $31
	ld a, EGG
	call Function17254
	ld c, $50
	call DelayFrames
	xor a
	ld [wcf64], a
	ld a, [hSCX]
	ld b, a
.asm_172ee
	ld hl, wcf64
	ld a, [hl]
	inc [hl]
	cp $8
	jr nc, .asm_17327
	ld e, [hl]
.asm_172f8
	ld a, $2
	ld [hSCX], a
	ld a, $fe
	ld [wc3c0], a
	call Function1727f
	ld c, $2
	call DelayFrames
	ld a, $fe
	ld [hSCX], a
	ld a, $2
	ld [wc3c0], a
	call Function1727f
	ld c, $2
	call DelayFrames
	dec e
	jr nz, .asm_172f8
	ld c, $10
	call DelayFrames
	call Function1736d
	jr .asm_172ee
.asm_17327
	ld de, SFX_EGG_HATCH
	call PlaySFX
	xor a
	ld [hSCX], a
	ld [wc3c0], a
	call ClearSprites
	call Function173b3
	hlcoord 6, 3
	ld b, $98
	ld c, $0
	ld a, [wJumptableIndex]
	call Function17254
	call Function17418
	call WaitSFX
	ld a, [wJumptableIndex]
	ld [CurPartySpecies], a
	hlcoord 6, 3
	ld d, $0
	ld e, ANIM_MON_HATCH
	predef AnimateFrontpic
	pop af
	ld [CurSpecies], a
	ret

Function17363: ; 17363 (5:7363)
	ld [PlayerHPPal], a
	ld b, $b
	ld c, $0
	jp GetSGBLayout

Function1736d: ; 1736d (5:736d)
	ld a, [wcf64]
	dec a
	and $7
	cp $7
	ret z
	srl a
	ret nc
	swap a
	srl a
	add $4c
	ld d, a
	ld e, $58
	ld a, SPRITE_ANIM_INDEX_19
	call _InitSpriteAnimStruct
	ld hl, $3
	add hl, bc
	ld [hl], $0
	ld de, SFX_EGG_CRACK
	jp PlaySFX
; 17393 (5:7393)

EggHatchGFX: ; 17393
INCBIN "gfx/unknown/017393.2bpp"
; 173b3

Function173b3: ; 173b3 (5:73b3)
	callba Function8cf53
	ld hl, Unknown_173ef
.loop
	ld a, [hli]
	cp $ff
	jr z, .done
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	push hl
	push bc
	ld a, SPRITE_ANIM_INDEX_1C
	call _InitSpriteAnimStruct
	ld hl, $3
	add hl, bc
	ld [hl], $0
	pop de
	ld a, e
	ld hl, $1
	add hl, bc
	add [hl]
	ld [hl], a
	ld hl, $b
	add hl, bc
	ld [hl], d
	pop hl
	jr .loop
.done
	ld de, SFX_EGG_HATCH
	call PlaySFX
	call Function1727f
	ret
; 173ef (5:73ef)

Unknown_173ef: ; 173ef
; Probably OAM.
	db $54, $48, $00, $3c
	db $5c, $48, $01, $04
	db $54, $50, $00, $30
	db $5c, $50, $01, $10
	db $54, $58, $02, $24
	db $5c, $58, $03, $1c
	db $50, $4c, $00, $36
	db $60, $4c, $01, $0a
	db $50, $54, $02, $2a
	db $60, $54, $03, $16
	db $ff
; 17418

Function17418: ; 17418 (5:7418)
	ld c, $81
.asm_1741a
	call Function1727f
	dec c
	jr nz, .asm_1741a
	ret

Special_DayCareMon1: ; 17421
	ld hl, UnknownText_0x17467
	call PrintText
	ld a, [wBreedMon1Species]
	call PlayCry
	ld a, [wDaycareLady]
	bit 0, a
	jr z, Function1745f
	call KeepTextOpen
	ld hl, wBreedMon2Nick
	call Function1746c
	jp PrintText

Special_DayCareMon2: ; 17440
	ld hl, UnknownText_0x17462
	call PrintText
	ld a, [wBreedMon2Species]
	call PlayCry
	ld a, [wDaycareMan]
	bit 0, a
	jr z, Function1745f
	call KeepTextOpen
	ld hl, wBreedMon1Nick
	call Function1746c
	jp PrintText

Function1745f: ; 1745f
	jp WaitPressAorB_BlinkCursor
; 17462

UnknownText_0x17462: ; 0x17462
	; It's @ that was left with the DAY-CARE LADY.
	text_jump UnknownText_0x1c0df3
	db "@"
; 0x17467

UnknownText_0x17467: ; 0x17467
	; It's @ that was left with the DAY-CARE MAN.
	text_jump UnknownText_0x1c0e24
	db "@"
; 0x1746c

Function1746c: ; 1746c
	push bc
	ld de, StringBuffer1
	ld bc, NAME_LENGTH
	call CopyBytes
	call Function16e1d
	pop bc
	ld a, [wd265]
	ld hl, UnknownText_0x1749c
	cp $ff
	jr z, .asm_1749b
	ld hl, UnknownText_0x174a1
	and a
	jr z, .asm_1749b
	ld hl, UnknownText_0x174a6
	cp 230
	jr nc, .asm_1749b
	cp 70
	ld hl, UnknownText_0x174ab
	jr nc, .asm_1749b
	ld hl, UnknownText_0x174b0

.asm_1749b
	ret
; 1749c

UnknownText_0x1749c: ; 0x1749c
	; It's brimming with energy.
	text_jump UnknownText_0x1c0e54
	db "@"
; 0x174a1

UnknownText_0x174a1: ; 0x174a1
	; It has no interest in @ .
	text_jump UnknownText_0x1c0e6f
	db "@"
; 0x174a6

UnknownText_0x174a6: ; 0x174a6
	; It appears to care for @ .
	text_jump UnknownText_0x1c0e8d
	db "@"
; 0x174ab

UnknownText_0x174ab: ; 0x174ab
	; It's friendly with @ .
	text_jump UnknownText_0x1c0eac
	db "@"
; 0x174b0

UnknownText_0x174b0: ; 0x174b0
	; It shows interest in @ .
	text_jump UnknownText_0x1c0ec6
	db "@"
; 0x174b5

Function_174b5: ; 174b5
	ld hl, String_174b9
	ret
; 174b9

String_174b9: ; 174b9
	db "@"
; 174ba

