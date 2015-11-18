LinkCommunications: ; 28000
	call ClearBGPalettes
	ld c, 80
	call DelayFrames
	call ClearScreen
	call ClearSprites
	call UpdateSprites
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld c, 80
	call DelayFrames
	call ClearScreen
	call UpdateSprites
	call LoadStandardFont
	call LoadFontsBattleExtra
	callba Function16d69a
	call Function3200
	hlcoord 3, 8
	ld b, $2
	ld c, $c
	ld d, h
	ld e, l
	callba Function4d35b
	hlcoord 4, 10
	ld de, String28419
	call PlaceString
	call Function28eff
	call Function3200
	ld hl, wcf5d
	xor a
	ld [hli], a
	ld [hl], $50
	ld a, [wLinkMode]
	cp LINK_TIMECAPSULE
	jp nz, Function28177

Function2805d: ; 2805d
	call Function28426
	call Function28499
	call Function28434
	xor a
	ld [wcf56], a
	call Function87d
	ld a, [hLinkPlayerNumber]
	cp $2
	jr nz, .asm_28091
	ld c, $3
	call DelayFrames
	xor a
	ld [hSerialSend], a
	ld a, $1
	ld [rSC], a
	ld a, $81
	ld [rSC], a
	call DelayFrame
	xor a
	ld [hSerialSend], a
	ld a, $1
	ld [rSC], a
	ld a, $81
	ld [rSC], a

.asm_28091
	ld de, MUSIC_NONE
	call PlayMusic
	ld c, $3
	call DelayFrames
	xor a
	ld [rIF], a
	ld a, $8
	ld [rIE], a
	ld hl, wd1f3
	ld de, EnemyMonSpecies
	ld bc, $11
	call Function75f
	ld a, $fe
	ld [de], a
	ld hl, OverworldMap
	ld de, wd26b
	ld bc, $1a8
	call Function75f
	ld a, $fe
	ld [de], a
	ld hl, wc608
	ld de, wc6d0
	ld bc, $c8
	call Function75f
	xor a
	ld [rIF], a
	ld a, $1d
	ld [rIE], a
	call Function287ab
	ld hl, wd26b
	call Function287ca
	push hl
	ld bc, NAME_LENGTH
	add hl, bc
	ld a, [hl]
	pop hl
	and a
	jp z, Function28b22
	cp $7
	jp nc, Function28b22
	ld de, OverworldMap
	ld bc, $1a2
	call Function2879e
	ld de, wc6d0
	ld hl, wc813
	ld c, $2
.asm_280fe
	ld a, [de]
	inc de
	and a
	jr z, .asm_280fe
	cp $fd
	jr z, .asm_280fe
	cp $fe
	jr z, .asm_280fe
	cp $ff
	jr z, .asm_2811d
	push hl
	push bc
	ld b, $0
	dec a
	ld c, a
	add hl, bc
	ld a, $fe
	ld [hl], a
	pop bc
	pop hl
	jr .asm_280fe

.asm_2811d
	ld hl, wc90f
	dec c
	jr nz, .asm_280fe
	ld hl, OverworldMap
	ld de, wd26b
	ld bc, NAME_LENGTH
	call CopyBytes
	ld de, OTPartyCount
	ld a, [hli]
	ld [de], a
	inc de
.asm_28135
	ld a, [hli]
	cp $ff
	jr z, .asm_2814e
	ld [wd265], a
	push hl
	push de
	callab ConvertMon_1to2
	pop de
	pop hl
	ld a, [wd265]
	ld [de], a
	inc de
	jr .asm_28135

.asm_2814e
	ld [de], a
	ld hl, wc813
	call Function2868a
	ld a, OTPartyMonOT % $100
	ld [wd102], a
	ld a, OTPartyMonOT / $100
	ld [wd103], a
	ld de, MUSIC_NONE
	call PlayMusic
	ld a, [hLinkPlayerNumber]
	cp $2
	ld c, 66
	call z, DelayFrames
	ld de, MUSIC_ROUTE_30
	call PlayMusic
	jp Function287e3
; 28177

Function28177: ; 28177
	call Function28426
	call Function28595
	call Function28434
	call Function29dba
	ld a, [ScriptVar]
	and a
	jp z, Function283b2
	ld a, [hLinkPlayerNumber]
	cp $2
	jr nz, .asm_281ae
	ld c, $3
	call DelayFrames
	xor a
	ld [hSerialSend], a
	ld a, $1
	ld [rSC], a
	ld a, $81
	ld [rSC], a
	call DelayFrame
	xor a
	ld [hSerialSend], a
	ld a, $1
	ld [rSC], a
	ld a, $81
	ld [rSC], a

.asm_281ae
	ld de, MUSIC_NONE
	call PlayMusic
	ld c, $3
	call DelayFrames
	xor a
	ld [rIF], a
	ld a, $8
	ld [rIE], a
	ld hl, wd1f3
	ld de, EnemyMonSpecies
	ld bc, $11
	call Function75f
	ld a, $fe
	ld [de], a
	ld hl, OverworldMap
	ld de, wd26b
	ld bc, $1c2
	call Function75f
	ld a, $fe
	ld [de], a
	ld hl, wc608
	ld de, wc6d0
	ld bc, $c8
	call Function75f
	ld a, [wLinkMode]
	cp LINK_TRADECENTER
	jr nz, .asm_281fd
	ld hl, wc9f4
	ld de, wcb84
	ld bc, $186
	call Function283f2

.asm_281fd
	xor a
	ld [rIF], a
	ld a, $1d
	ld [rIE], a
	ld de, MUSIC_NONE
	call PlayMusic
	call Function287ab
	ld hl, wd26b
	call Function287ca
	ld de, OverworldMap
	ld bc, $1b9
	call Function2879e
	ld de, wc6d0
	ld hl, wc813
	ld c, $2
.asm_28224
	ld a, [de]
	inc de
	and a
	jr z, .asm_28224
	cp $fd
	jr z, .asm_28224
	cp $fe
	jr z, .asm_28224
	cp $ff
	jr z, .asm_28243
	push hl
	push bc
	ld b, $0
	dec a
	ld c, a
	add hl, bc
	ld a, $fe
	ld [hl], a
	pop bc
	pop hl
	jr .asm_28224

.asm_28243
	ld hl, wc90f
	dec c
	jr nz, .asm_28224
	ld a, [wLinkMode]
	cp LINK_TRADECENTER
	jp nz, .asm_282fe
	ld hl, wcb84
.asm_28254
	ld a, [hli]
	cp $20
	jr nz, .asm_28254
.asm_28259
	ld a, [hli]
	cp $fe
	jr z, .asm_28259
	cp $20
	jr z, .asm_28259
	dec hl
	ld de, wcb84
	ld bc, $190
	call CopyBytes
	ld hl, wcb84
	ld bc, $c6
.asm_28272
	ld a, [hl]
	cp $21
	jr nz, .asm_28279
	ld [hl], $fe

.asm_28279
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .asm_28272
	ld de, wcc9e
.asm_28282
	ld a, [de]
	inc de
	cp $ff
	jr z, .asm_28294
	ld hl, wcc4a
	dec a
	ld b, $0
	ld c, a
	add hl, bc
	ld [hl], $fe
	jr .asm_28282

.asm_28294
	ld hl, wcb84
	ld de, wc9f4
	ld b, $6
.asm_2829c
	push bc
	ld bc, $21
	call CopyBytes
	ld a, $e
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	pop bc
	dec b
	jr nz, .asm_2829c
	ld de, wc9f4
	ld b, $6
.asm_282b4
	push bc
	ld a, $21
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld bc, $e
	call CopyBytes
	pop bc
	dec b
	jr nz, .asm_282b4
	ld b, $6
	ld de, wc9f4
.asm_282cc
	push bc
	push de
	callba Function1de5c8
	ld a, c
	or a
	jr z, .asm_282ee
	sub $3
	jr nc, .asm_282e4
	callba Function1df203
	jr .asm_282ee

.asm_282e4
	cp $2
	jr nc, .asm_282ee
	callba Function1df220

.asm_282ee
	pop de
	ld hl, $2f
	add hl, de
	ld d, h
	ld e, l
	pop bc
	dec b
	jr nz, .asm_282cc
	ld de, wcb0e
	xor a
	ld [de], a

.asm_282fe
	ld hl, OverworldMap
	ld de, wd26b
	ld bc, NAME_LENGTH
	call CopyBytes
	ld de, OTPartyCount
	ld bc, 8
	call CopyBytes
	ld de, wd276
	ld bc, 2
	call CopyBytes
	ld de, OTPartyMon1Species
	ld bc, $1a4
	call CopyBytes
	ld a, OTPartyMonOT % $100
	ld [wd102], a
	ld a, OTPartyMonOT / $100
	ld [wd103], a
	ld de, MUSIC_NONE
	call PlayMusic
	ld a, [hLinkPlayerNumber]
	cp $2
	ld c, 66
	call z, DelayFrames
	ld a, [wLinkMode]
	cp LINK_COLOSSEUM
	jr nz, .asm_283a9
	ld a, CAL
	ld [OtherTrainerClass], a
	call ClearScreen
	callba Function4d354
	ld hl, Options
	ld a, [hl]
	push af
	and $20
	or $3
	ld [hl], a
	ld hl, wd26b
	ld de, OTName
	ld bc, NAME_LENGTH
	call CopyBytes
	call ReturnToMapFromSubmenu
	ld a, [wc2d7]
	push af
	ld a, $1
	ld [wc2d7], a
	ld a, [rIE]
	push af
	ld a, [rIF]
	push af
	xor a
	ld [rIF], a
	ld a, [rIE]
	set 1, a
	ld [rIE], a
	pop af
	ld [rIF], a
	predef StartBattle
	ld a, [rIF]
	ld h, a
	xor a
	ld [rIF], a
	pop af
	ld [rIE], a
	ld a, h
	ld [rIF], a
	pop af
	ld [wc2d7], a
	pop af
	ld [Options], a
	callba LoadPokemonData
	jp Function28b22

.asm_283a9
	ld de, MUSIC_ROUTE_30
	call PlayMusic
	jp Function287e3
; 283b2

Function283b2: ; 283b2
	ld de, UnknownText_0x283ed
	ld b, $a
.asm_283b7
	call DelayFrame
	call Function908
	dec b
	jr nz, .asm_283b7
	xor a
	ld [hld], a
	ld [hl], a
	ld [hVBlank], a
	push de
	hlcoord 0, 12
	ld b, $4
	ld c, $12
	push de
	ld d, h
	ld e, l
	callba Function4d35b
	pop de
	pop hl
	bccoord 1, 14
	call PlaceWholeStringInBoxAtOnce
	call FadeToWhite
	call ClearScreen
	ld b, $8
	call GetSGBLayout
	call Function3200
	ret
; 283ed

UnknownText_0x283ed: ; 0x283ed
	; Too much time has elapsed. Please try again.
	text_jump UnknownText_0x1c4183
	db "@"
; 0x283f2

Function283f2: ; 283f2
	ld a, $1
	ld [hFFCC], a
.asm_283f6
	ld a, [hl]
	ld [hSerialSend], a
	call Function78a
	push bc
	ld b, a
	inc hl
	ld a, $30
.asm_28401
	dec a
	jr nz, .asm_28401
	ld a, [hFFCC]
	and a
	ld a, b
	pop bc
	jr z, .asm_28411
	dec hl
	xor a
	ld [hFFCC], a
	jr .asm_283f6

.asm_28411
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .asm_283f6
	ret
; 28419

String28419: ; 28419
	db "PLEASE WAIT!@"
; 28426

Function28426: ; 28426
	ld hl, OverworldMap
	lb bc, 5, SCREEN_WIDTH
.asm_2842c
	xor a
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .asm_2842c
	ret
; 28434

Function28434: ; 28434
	ld hl, wd1f3
	ld a, $fd
	ld b, $7
.asm_2843b
	ld [hli], a
	dec b
	jr nz, .asm_2843b
	ld b, $a
.asm_28441
	call Random
	cp $fd
	jr nc, .asm_28441
	ld [hli], a
	dec b
	jr nz, .asm_28441
	ld hl, wc608
	ld a, $fd
rept 3
	ld [hli], a
endr
	ld b, $c8
	xor a
.asm_28457
	ld [hli], a
	dec b
	jr nz, .asm_28457
	ld hl, wc818
	ld de, wc608 + 10
	ld bc, 0
.asm_28464
	inc c
	ld a, c
	cp $fd
	jr z, .asm_2848c
	ld a, b
	dec a
	jr nz, .asm_2847f
	push bc
	ld a, [wLinkMode]
	cp LINK_TIMECAPSULE
	ld b, $d
	jr z, .asm_2847a
	ld b, $27

.asm_2847a
	ld a, c
	cp b
	pop bc
	jr z, .asm_28495

.asm_2847f
	inc hl
	ld a, [hl]
	cp $fe
	jr nz, .asm_28464
	ld a, c
	ld [de], a
	inc de
	ld [hl], $ff
	jr .asm_28464

.asm_2848c
	ld a, $ff
	ld [de], a
	inc de
	lb bc, 1, 0
	jr .asm_28464

.asm_28495
	ld a, $ff
	ld [de], a
	ret
; 28499

Function28499: ; 28499
	ld de, OverworldMap
	ld a, $fd
	ld b, $6
.asm_284a0
	ld [de], a
	inc de
	dec b
	jr nz, .asm_284a0
	ld hl, PlayerName
	ld bc, NAME_LENGTH
	call CopyBytes
	push de
	ld hl, PartyCount
	ld a, [hli]
	ld [de], a
	inc de
.asm_284b5
	ld a, [hli]
	cp $ff
	jr z, .asm_284ce
	ld [wd265], a
	push hl
	push de
	callab ConvertMon_2to1
	pop de
	pop hl
	ld a, [wd265]
	ld [de], a
	inc de
	jr .asm_284b5

.asm_284ce
	ld [de], a
	pop de
	ld hl, $8
	add hl, de
	ld d, h
	ld e, l
	ld hl, PartyMon1Species
	ld c, $6
.asm_284db
	push bc
	call Function284f6
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_284db
	ld hl, PartyMonOT
	call .asm_284f0
	ld hl, PartyMonNicknames
.asm_284f0
	ld bc, $42
	jp CopyBytes
; 284f6

Function284f6: ; 284f6
	ld b, h
	ld c, l
	push de
	push bc
	ld a, [hl]
	ld [wd265], a
	callab ConvertMon_2to1
	pop bc
	pop de
	ld a, [wd265]
	ld [de], a
	inc de
	ld hl, $22
	add hl, bc
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	xor a
	ld [de], a
	inc de
	ld hl, $20
	add hl, bc
	ld a, [hl]
	ld [de], a
	inc de
	ld a, [bc]
	cp $51
	jr z, .asm_28528
	cp $52
	jr nz, .asm_28530

.asm_28528
	ld a, $17
	ld [de], a
	inc de
	ld [de], a
	inc de
	jr .asm_28544

.asm_28530
	push bc
	dec a
	ld hl, BaseData + 7 ; type
	ld bc, BaseData1 - BaseData0
	call AddNTimes
	ld bc, 2
	ld a, BANK(BaseData)
	call FarCopyBytes
	pop bc

.asm_28544
	push bc
	ld hl, $1
	add hl, bc
	ld bc, $1a
	call CopyBytes
	pop bc

	ld hl, $1f
	add hl, bc
	ld a, [hl]
	ld [de], a
	ld [CurPartyLevel], a
	inc de

	push bc
	ld hl, $24
	add hl, bc
	ld bc, 8
	call CopyBytes
	pop bc

	push de
	push bc

	ld a, [bc]
	dec a
	push bc
	ld b, 0
	ld c, a
	ld hl, KantoMonSpecials
	add hl, bc
	ld a, BANK(KantoMonSpecials)
	call GetFarByte
	ld [BaseSpecialAttack], a
	pop bc

	ld hl, $a
	add hl, bc
	ld c, $5
	ld b, $1
	predef CalcPkmnStatC

	pop bc
	pop de

	ld a, [$ffb5]
	ld [de], a
	inc de
	ld a, [$ffb6]
	ld [de], a
	inc de
	ld h, b
	ld l, c
	ret
; 28595

Function28595: ; 28595
	ld de, OverworldMap
	ld a, $fd
	ld b, $6
.loop1
	ld [de], a
	inc de
	dec b
	jr nz, .loop1
	ld hl, PlayerName
	ld bc, NAME_LENGTH
	call CopyBytes
	ld hl, PartyCount
	ld bc, 8
	call CopyBytes
	ld hl, PlayerID
	ld bc, 2
	call CopyBytes
	ld hl, PartyMon1Species
	ld bc, $120
	call CopyBytes
	ld hl, PartyMonOT
	ld bc, $42
	call CopyBytes
	ld hl, PartyMonNicknames
	ld bc, $42
	call CopyBytes
	ld a, [wLinkMode]
	cp LINK_TRADECENTER
	ret nz
	ld de, wc9f4
	ld a, $20
	call Function28682
	ld a, BANK(sPartyMail)
	call GetSRAMBank
	ld hl, sPartyMail
	ld b, PARTY_LENGTH
.loop2
	push bc
	ld bc, $21
	call CopyBytes
	ld bc, $e
	add hl, bc
	pop bc
	dec b
	jr nz, .loop2
	ld hl, sPartyMail
	ld b, PARTY_LENGTH
.loop3
	push bc
	ld bc, $21
	add hl, bc
	ld bc, $e
	call CopyBytes
	pop bc
	dec b
	jr nz, .loop3
	ld b, PARTY_LENGTH
	ld de, sPartyMail
	ld hl, wc9f9
.loop4
	push bc
	push hl
	push de
	push hl
	callba Function1de5c8
	pop de
	ld a, c
	or a
	jr z, .next
	sub $3
	jr nc, .skip
	callba Function1df1e6
	jr .next

.skip
	cp $2
	jr nc, .next
	callba Function1df220

.next
	pop de
	ld hl, MAIL_STRUCT_LENGTH
	add hl, de
	ld d, h
	ld e, l
	pop hl
	ld bc, $21
	add hl, bc
	pop bc
	dec b
	jr nz, .loop4
	call CloseSRAM
	ld hl, wc9f9
	ld bc, $c6
.loop5
	ld a, [hl]
	cp $fe
	jr nz, .skip2
	ld [hl], $21

.skip2
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .loop5
	ld hl, wcabf
	ld de, wcb13
	ld b, $54
	ld c, $0
.loop6
	inc c
	ld a, [hl]
	cp $fe
	jr nz, .skip3
	ld [hl], $ff
	ld a, c
	ld [de], a
	inc de

.skip3
	inc hl
	dec b
	jr nz, .loop6
	ld a, $ff
	ld [de], a
	ret
; 28682

Function28682: ; 28682
	ld c, $5
.loop
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ret
; 2868a

Function2868a: ; 2868a
	push hl
	ld d, h
	ld e, l
	ld bc, wcbea
	ld hl, wcbe8
	ld a, c
	ld [hli], a
	ld [hl], b
	ld hl, OTPartyMon1Species
	ld c, $6
.loop
	push bc
	call Function286ba
	pop bc
	dec c
	jr nz, .loop
	pop hl
	lb bc, 1, 8
	add hl, bc
	ld de, OTPartyMonOT
	ld bc, $42
	call CopyBytes
	ld de, OTPartyMonNicknames
	ld bc, $42
	jp CopyBytes
; 286ba

Function286ba: ; 286ba
	ld b, h
	ld c, l
	ld a, [de]
	inc de
	push bc
	push de
	ld [wd265], a
	callab ConvertMon_1to2
	pop de
	pop bc
	ld a, [wd265]
	ld [bc], a
	ld [CurSpecies], a
	ld hl, $22
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hl], a
	inc de
	ld hl, $20
	add hl, bc
	ld a, [de]
	inc de
	ld [hl], a
	ld hl, wcbe8
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, l
	ld [wcbe8], a
	ld a, h
	ld [wcbe9], a
	push bc
	ld hl, $1
	add hl, bc
	push hl
	ld h, d
	ld l, e
	pop de
	push bc
	ld a, [hli]
	ld b, a
	call Function28771
	ld a, b
	ld [de], a
	inc de
	pop bc
	ld bc, $19
	call CopyBytes
	pop bc
	ld d, h
	ld e, l
	ld hl, $1f
	add hl, bc
	ld a, [de]
	inc de
	ld [hl], a
	ld [CurPartyLevel], a
	push bc
	ld hl, $24
	add hl, bc
	push hl
	ld h, d
	ld l, e
	pop de
	ld bc, 8
	call CopyBytes
	pop bc
	call GetBaseData
	push de
	push bc
	ld d, h
	ld e, l
	ld hl, $a
	add hl, bc
	ld c, $5
	ld b, $1
	predef CalcPkmnStatC
	pop bc
	pop hl
	ld a, [$ffb5]
	ld [hli], a
	ld a, [$ffb6]
	ld [hli], a
	push hl
	push bc
	ld hl, $a
	add hl, bc
	ld c, $6
	ld b, $1
	predef CalcPkmnStatC
	pop bc
	pop hl
	ld a, [$ffb5]
	ld [hli], a
	ld a, [$ffb6]
	ld [hli], a
	push hl
	ld hl, $1b
	add hl, bc
	ld a, $46
	ld [hli], a
	xor a
rept 2
	ld [hli], a
endr
	ld [hl], a
	pop hl
rept 2
	inc de
endr
	ret
; 28771

Function28771: ; 28771
	ld a, b
	and a
	ret z
	push hl
	ld hl, .TimeCapsuleAlt
.loop
	ld a, [hli]
	and a
	jr z, .end
	cp b
	jr z, .found
	inc hl
	jr .loop

.found
	ld b, [hl]

.end
	pop hl
	ret

.TimeCapsuleAlt ; 28785
; Pokémon traded from RBY do not have held items, so GSC usually interprets the
; catch rate as an item. However, if the catch rate appears in this table, the
; item associated with the table entry is used instead.
	db ITEM_19, LEFTOVERS
	db ITEM_2D, BITTER_BERRY
	db ITEM_32, GOLD_BERRY
	db ITEM_5A, BERRY
	db ITEM_64, BERRY
	db ITEM_78, BERRY
	db ITEM_87, BERRY
	db ITEM_BE, BERRY
	db ITEM_C3, BERRY
	db ITEM_DC, BERRY
	db HM_08,   BERRY
	db $ff,     BERRY
	db $00
; 2879e

Function2879e: ; 2879e
.asm_2879e
	ld a, [hli]
	cp $fe
	jr z, .asm_2879e
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .asm_2879e
	ret
; 287ab

Function287ab: ; 287ab
	ld a, [hLinkPlayerNumber]
	cp $2
	ret z
	ld hl, EnemyMonSpecies
	call Function287d8
	ld de, LinkBattleRNs
	ld c, $a
.asm_287bb
	ld a, [hli]
	cp $fe
	jr z, .asm_287bb
	cp $fd
	jr z, .asm_287bb
	ld [de], a
	inc de
	dec c
	jr nz, .asm_287bb
	ret
; 287ca

Function287ca: ; 287ca
.asm_287ca
	ld a, [hli]
	and a
	jr z, .asm_287ca
	cp $fd
	jr z, .asm_287ca
	cp $fe
	jr z, .asm_287ca
	dec hl
	ret
; 287d8

Function287d8: ; 287d8
.asm_287d8
	ld a, [hli]
	cp $fd
	jr z, .asm_287d8
	cp $fe
	jr z, .asm_287d8
	dec hl
	ret
; 287e3

Function287e3: ; 287e3
	call ClearScreen
	call Function28ef8
	callba Function16d673
	xor a
	ld hl, wcf51
rept 3
	ld [hli], a
endr
	ld [hl], a
	ld a, $1
	ld [MenuSelection2], a
	inc a
	ld [wcf56], a
	jp Function2888b
; 28803

Function28803: ; 28803
	ld a, $1
	ld [MonType], a
	ld a, $c1
	ld [wcfa8], a
	ld a, [OTPartyCount]
	ld [wcfa3], a
	ld a, $1
	ld [wcfa4], a
	ld a, $9
	ld [wcfa1], a
	ld a, $6
	ld [wcfa2], a
	ld a, $1
	ld [wcfaa], a
	ld a, $10
	ld [wcfa7], a
	ld a, $20
	ld [wcfa5], a
	xor a
	ld [wcfa6], a

Function28835: ; 28835
	callba Function16d70c
	ld a, d
	and a
	jp z, Function2891c
	bit 0, a
	jr z, .asm_2885b
	ld a, $1
	ld [wd263], a
	callab Function50db9
	ld hl, OTPartyMon1Species
	callba Function4d319
	jp Function2891c

.asm_2885b
	bit 6, a
	jr z, .asm_28883
	ld a, [MenuSelection2]
	ld b, a
	ld a, [OTPartyCount]
	cp b
	jp nz, Function2891c
	xor a
	ld [MonType], a
	call Function1bf7
	push hl
	push bc
	ld bc, NAME_LENGTH
	add hl, bc
	ld [hl], $7f
	pop bc
	pop hl
	ld a, [PartyCount]
	ld [MenuSelection2], a
	jr Function2888b

.asm_28883
	bit 7, a
	jp z, Function2891c
	jp Function28ac9
; 2888b

Function2888b: ; 2888b
	callba Function49856
	xor a
	ld [MonType], a
	ld a, $c1
	ld [wcfa8], a
	ld a, [PartyCount]
	ld [wcfa3], a
	ld a, $1
	ld [wcfa4], a
	ld a, $1
	ld [wcfa1], a
	ld a, $6
	ld [wcfa2], a
	ld a, $1
	ld [wcfaa], a
	ld a, $10
	ld [wcfa7], a
	ld a, $20
	ld [wcfa5], a
	xor a
	ld [wcfa6], a
	call Function3200

Function288c5: ; 288c5
	callba Function16d70c
	ld a, d
	and a
	jr nz, .asm_288d2
	jp Function2891c

.asm_288d2
	bit 0, a
	jr z, .asm_288d9
	jp Function28926

.asm_288d9
	bit 7, a
	jr z, .asm_288fe
	ld a, [MenuSelection2]
	dec a
	jp nz, Function2891c
	ld a, $1
	ld [MonType], a
	call Function1bf7
	push hl
	push bc
	ld bc, NAME_LENGTH
	add hl, bc
	ld [hl], $7f
	pop bc
	pop hl
	ld a, $1
	ld [MenuSelection2], a
	jp Function28803

.asm_288fe
	bit 6, a
	jr z, Function2891c
	ld a, [MenuSelection2]
	ld b, a
	ld a, [PartyCount]
	cp b
	jr nz, Function2891c
	call Function1bf7
	push hl
	push bc
	ld bc, NAME_LENGTH
	add hl, bc
	ld [hl], $7f
	pop bc
	pop hl
	jp Function28ade
; 2891c

Function2891c: ; 2891c
	ld a, [MonType]
	and a
	jp z, Function288c5
	jp Function28835
; 28926

Function28926: ; 28926
	call LoadTileMapToTempTileMap
	ld a, [MenuSelection2]
	push af
	hlcoord 0, 15
	ld b, $1
	ld c, $12
	call Function28eef
	hlcoord 2, 16
	ld de, String28ab4
	call PlaceString
	callba Function4d354

.asm_28946
	ld a, $7f
	ldcoord_a 11, 16
	ld a, $13
	ld [wcfa8], a
	ld a, $1
	ld [wcfa3], a
	ld a, $1
	ld [wcfa4], a
	ld a, $10
	ld [wcfa1], a
	ld a, $1
	ld [wcfa2], a
	ld a, $1
	ld [MenuSelection2], a
	ld [wcfaa], a
	ld a, $20
	ld [wcfa7], a
	xor a
	ld [wcfa5], a
	ld [wcfa6], a
	call Function1bd3
	bit 4, a
	jr nz, .asm_2898d
	bit 1, a
	jr z, .asm_289cd
.asm_28983
	pop af
	ld [MenuSelection2], a
	call Call_LoadTempTileMapToTileMap
	jp Function2888b

.asm_2898d
	ld a, $7f
	ldcoord_a 1, 16
	ld a, $23
	ld [wcfa8], a
	ld a, $1
	ld [wcfa3], a
	ld a, $1
	ld [wcfa4], a
	ld a, $10
	ld [wcfa1], a
	ld a, $b
	ld [wcfa2], a
	ld a, $1
	ld [MenuSelection2], a
	ld [wcfaa], a
	ld a, $20
	ld [wcfa7], a
	xor a
	ld [wcfa5], a
	ld [wcfa6], a
	call Function1bd3
	bit 5, a
	jp nz, .asm_28946
	bit 1, a
	jr nz, .asm_28983
	jr .asm_289fe

.asm_289cd
	pop af
	ld [MenuSelection2], a
	ld a, $4
	ld [wd263], a
	callab Function50db9
	callba Function4d319
	call Call_LoadTempTileMapToTileMap
	hlcoord 6, 1
	lb bc, 6, 1
	ld a, " "
	call Function28b77
	hlcoord 17, 1
	lb bc, 6, 1
	ld a, " "
	call Function28b77
	jp Function2888b

.asm_289fe
	call Function1bee
	pop af
	ld [MenuSelection2], a
	dec a
	ld [wd002], a
	ld [wcf56], a
	callba Function16d6ce
	ld a, [wcf51]
	cp $f
	jp z, Function287e3
	ld [wd003], a
	call Function28b68
	ld c, $64
	call DelayFrames
	callba Functionfb57e
	jr c, .asm_28a58
	callba Functionfb5dd
	jp nc, Function28b87
	xor a
	ld [wcf57], a
	ld [wcf52], a
	hlcoord 0, 12
	ld b, $4
	ld c, $12
	call Function28eef
	callba Function4d354
	ld hl, UnknownText_0x28aaf
	bccoord 1, 14
	call PlaceWholeStringInBoxAtOnce
	jr .asm_28a89

.asm_28a58
	xor a
	ld [wcf57], a
	ld [wcf52], a
	ld a, [wd003]
	ld hl, OTPartySpecies
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	ld [wd265], a
	call GetPokemonName
	hlcoord 0, 12
	ld b, $4
	ld c, $12
	call Function28eef
	callba Function4d354
	ld hl, UnknownText_0x28ac4
	bccoord 1, 14
	call PlaceWholeStringInBoxAtOnce

.asm_28a89
	hlcoord 0, 12
	ld b, $4
	ld c, $12
	call Function28eef
	hlcoord 1, 14
	ld de, String28ece
	call PlaceString
	ld a, $1
	ld [wcf56], a
	callba Function16d6ce
	ld c, $64
	call DelayFrames
	jp Function287e3
; 28aaf


UnknownText_0x28aaf: ; 0x28aaf
	; If you trade that #MON, you won't be able to battle.
	text_jump UnknownText_0x1c41b1
	db "@"
; 0x28ab4

String28ab4: ; 28ab4
	db "STATS     TRADE@"

UnknownText_0x28ac4: ; 0x28ac4
	; Your friend's @  appears to be abnormal!
	text_jump UnknownText_0x1c41e6
	db "@"
; 0x28ac9


Function28ac9: ; 28ac9
	ld a, [MenuSelection2]
	cp $1
	jp nz, Function2891c
	call Function1bf7
	push hl
	push bc
	ld bc, NAME_LENGTH
	add hl, bc
	ld [hl], $7f
	pop bc
	pop hl

Function28ade: ; 28ade
.asm_28ade
	ld a, $ed
	ldcoord_a 9, 17
.asm_28ae3
	call JoyTextDelay
	ld a, [hJoyLast]
	and a
	jr z, .asm_28ae3
	bit 0, a
	jr nz, .asm_28b0b
	push af
	ld a, " "
	ldcoord_a 9, 17
	pop af
	bit 6, a
	jr z, .asm_28b03
	ld a, [OTPartyCount]
	ld [MenuSelection2], a
	jp Function28803

.asm_28b03
	ld a, $1
	ld [MenuSelection2], a
	jp Function2888b

.asm_28b0b
	ld a, $ec
	ldcoord_a 9, 17
	ld a, $f
	ld [wcf56], a
	callba Function16d6ce
	ld a, [wcf51]
	cp $f
	jr nz, .asm_28ade

Function28b22: ; 28b22
	call FadeToWhite
	call ClearScreen
	ld b, $8
	call GetSGBLayout
	call Function3200
	xor a
	ld [wcfbb], a
	xor a
	ld [rSB], a
	ld [hSerialSend], a
	ld a, $1
	ld [rSC], a
	ld a, $81
	ld [rSC], a
	ret
; 28b42

Function28b42: ; 28b42
	hlcoord 0, 16
	ld a, "┘"
	ld bc, 2 * SCREEN_WIDTH
	call ByteFill
	hlcoord 1, 16
	ld a, " "
	ld bc, SCREEN_WIDTH - 2
	call ByteFill
	hlcoord 2, 16
	ld de, String_28b61
	jp PlaceString
; 28b61

String_28b61: ; 28b61
	db "CANCEL@"
; 28b68

Function28b68: ; 28b68
	ld a, [wcf51]
	hlcoord 6, 9
	ld bc, SCREEN_WIDTH
	call AddNTimes
	ld [hl], $ec
	ret
; 28b77

Function28b77: ; 28b77
.asm_28b77
	push bc
	push hl
.asm_28b79
	ld [hli], a
	dec c
	jr nz, .asm_28b79
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_28b77
	ret
; 28b87

Function28b87: ; 28b87
	xor a
	ld [wcf57], a
	ld [wcf52], a
	hlcoord 0, 12
	ld b, $4
	ld c, $12
	call Function28eef
	callba Function4d354
	ld a, [wd002]
	ld hl, PartySpecies
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	ld [wd265], a
	call GetPokemonName
	ld hl, StringBuffer1
	ld de, wd004
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	ld a, [wd003]
	ld hl, OTPartySpecies
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	ld [wd265], a
	call GetPokemonName
	ld hl, UnknownText_0x28eb8
	bccoord 1, 14
	call PlaceWholeStringInBoxAtOnce
	call LoadStandardMenuDataHeader
	hlcoord 10, 7
	ld b, $3
	ld c, $7
	call Function28eef
	ld de, String28eab
	hlcoord 12, 8
	call PlaceString
	ld a, $8
	ld [wcfa1], a
	ld a, $b
	ld [wcfa2], a
	ld a, $1
	ld [wcfa4], a
	ld a, $2
	ld [wcfa3], a
	xor a
	ld [wcfa5], a
	ld [wcfa6], a
	ld a, $20
	ld [wcfa7], a
	ld a, $3
	ld [wcfa8], a
	ld a, $1
	ld [MenuSelection2], a
	ld [wcfaa], a
	callba Function4d354
	call Function1bd3
	push af
	call Call_ExitMenu
	call Function3200
	pop af
	bit 1, a
	jr nz, .asm_28c33
	ld a, [MenuSelection2]
	dec a
	jr z, .asm_28c54

.asm_28c33
	ld a, $1
	ld [wcf56], a
	hlcoord 0, 12
	ld b, 4
	ld c, 18
	call Function28eef
	hlcoord 1, 14
	ld de, String28ece
	call PlaceString
	callba Function16d6ce
	jp Function28ea3

.asm_28c54
	ld a, $2
	ld [wcf56], a
	callba Function16d6ce
	ld a, [wcf51]
	dec a
	jr nz, .asm_28c7b
	hlcoord 0, 12
	ld b, 4
	ld c, 18
	call Function28eef
	hlcoord 1, 14
	ld de, String28ece
	call PlaceString
	jp Function28ea3

.asm_28c7b
	ld hl, sPartyMail
	ld a, [wd002]
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	ld a, BANK(sPartyMail)
	call GetSRAMBank
	ld d, h
	ld e, l
	ld bc, MAIL_STRUCT_LENGTH
	add hl, bc
	ld a, [wd002]
	ld c, a
.asm_28c96
	inc c
	ld a, c
	cp $6
	jr z, .asm_28ca6
	push bc
	ld bc, MAIL_STRUCT_LENGTH
	call CopyBytes
	pop bc
	jr .asm_28c96

.asm_28ca6
	ld hl, sPartyMail
	ld a, [PartyCount]
	dec a
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	push hl
	ld hl, wc9f4
	ld a, [wd003]
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	pop de
	ld bc, MAIL_STRUCT_LENGTH
	call CopyBytes
	call CloseSRAM
	ld hl, PlayerName
	ld de, wc6e7
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, [wd002]
	ld hl, PartySpecies
	ld b, $0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wc6d0], a
	push af
	ld a, [wd002]
	ld hl, PartyMonOT
	call SkipNames
	ld de, wc6f2
	ld bc, NAME_LENGTH
	call CopyBytes
	ld hl, PartyMon1ID
	ld a, [wd002]
	call GetPartyLocation
	ld a, [hli]
	ld [PlayerScreens], a
	ld a, [hl]
	ld [EnemyScreens], a
	ld hl, PartyMon1DVs
	ld a, [wd002]
	call GetPartyLocation
	ld a, [hli]
	ld [wc6fd], a
	ld a, [hl]
	ld [wPlayerMinimized], a
	ld a, [wd002]
	ld hl, PartyMon1Species
	call GetPartyLocation
	ld b, h
	ld c, l
	callba GetCaughtGender
	ld a, c
	ld [wc701], a
	ld hl, wd26b
	ld de, wc719
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, [wd003]
	ld hl, OTPartySpecies
	ld b, $0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wc702], a
	ld a, [wd003]
	ld hl, OTPartyMonOT
	call SkipNames
	ld de, wc724
	ld bc, NAME_LENGTH
	call CopyBytes
	ld hl, OTPartyMon1ID
	ld a, [wd003]
	call GetPartyLocation
	ld a, [hli]
	ld [wEnemyWrapCount], a
	ld a, [hl]
	ld [wPlayerCharging], a
	ld hl, OTPartyMon1DVs
	ld a, [wd003]
	call GetPartyLocation
	ld a, [hli]
	ld [wEnemyTrappingMove], a
	ld a, [hl]
	ld [wPlayerWrapCount], a
	ld a, [wd003]
	ld hl, OTPartyMon1Species
	call GetPartyLocation
	ld b, h
	ld c, l
	callba GetCaughtGender
	ld a, c
	ld [wEnemyCharging], a
	ld a, [wd002]
	ld [CurPartyMon], a
	ld hl, PartySpecies
	ld b, $0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wd002], a
	xor a
	ld [wPokemonWithdrawDepositParameter], a
	callab Functione039
	ld a, [PartyCount]
	dec a
	ld [CurPartyMon], a
	ld a, $1
	ld [wd1e9], a
	ld a, [wd003]
	push af
	ld hl, OTPartySpecies
	ld b, $0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wd003], a
	ld c, 100
	call DelayFrames
	call ClearTileMap
	call LoadFontsBattleExtra
	ld b, $8
	call GetSGBLayout
	ld a, [hLinkPlayerNumber]
	cp $1
	jr z, .asm_28de4
	predef Function28f24
	jr .asm_28de9

.asm_28de4
	predef Function28f63

.asm_28de9
	pop af
	ld c, a
	ld [CurPartyMon], a
	ld hl, OTPartySpecies
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hl]
	ld [CurPartySpecies], a
	ld hl, OTPartyMon1Species
	ld a, c
	call GetPartyLocation
	ld de, TempMonSpecies
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	predef AddTempmonToParty
	ld a, [PartyCount]
	dec a
	ld [CurPartyMon], a
	callab Function421d8
	call ClearScreen
	call Function28ef8
	call Function28eff
	callba Function4d354
	ld b, $1
	pop af
	ld c, a
	cp MEW
	jr z, .asm_28e49
	ld a, [CurPartySpecies]
	cp MEW
	jr z, .asm_28e49
	ld b, $2
	ld a, c
	cp CELEBI
	jr z, .asm_28e49
	ld a, [CurPartySpecies]
	cp CELEBI
	jr z, .asm_28e49
	ld b, $0

.asm_28e49
	ld a, b
	ld [wcf56], a
	push bc
	call Function862
	pop bc
	ld a, [wLinkMode]
	cp LINK_TIMECAPSULE
	jr z, .asm_28e63
	ld a, b
	and a
	jr z, .asm_28e63
	ld a, [wcf52]
	cp b
	jr nz, .asm_28e49

.asm_28e63
	callba Function14a58
	callba MobileFn_1060af
	callba BackupMobileEventIndex
	ld c, 40
	call DelayFrames
	hlcoord 0, 12
	ld b, 4
	ld c, 18
	call Function28eef
	hlcoord 1, 14
	ld de, String28ebd
	call PlaceString
	callba Function4d354
	ld c, 50
	call DelayFrames
	ld a, [wLinkMode]
	cp LINK_TIMECAPSULE
	jp z, Function2805d
	jp Function28177
; 28ea3

Function28ea3: ; 28ea3
	ld c, 100
	call DelayFrames
	jp Function287e3
; 28eab

String28eab: ; 28eab
	db   "TRADE"
	next "CANCEL@"

UnknownText_0x28eb8: ; 0x28eb8
	; Trade @ for @ ?
	text_jump UnknownText_0x1c4212
	db "@"
; 0x28ebd

String28ebd: ; 28ebd
	db   "Trade completed!@"

String28ece: ; 28ece
	db   "Too bad! The trade"
	next "was canceled!@"


Function28eef: ; 28eef
	ld d, h
	ld e, l
	callba Function16d6ca
	ret
; 28ef8

Function28ef8: ; 28ef8
	callba Function16d696
	ret
; 28eff

Function28eff: ; 28eff
	callba Function16d6a7
	call SetPalettes
	ret
; 28f09

Function28f09: ; 28f09
	hlcoord 0, 0
	ld b, 6
	ld c, 18
	call Function28eef
	hlcoord 0, 8
	ld b, 6
	ld c, 18
	call Function28eef
	callba Functionfb60d
	ret
; 28f24

Function28f24: ; 28f24
	xor a
	ld [wcf66], a
	ld hl, wc6e7
	ld de, wc719
	call Function297ff
	ld hl, wc6d0
	ld de, wc702
	call Function29814
	ld de, .data_28f3f
	jr Function28fa1

.data_28f3f
	db $1b
	db $1
	db $1c
	db $21
	db $2d
	db $27
	db $23
	db $3
	db $25
	db $28
	db $25
	db $1e
	db $29
	db $6
	db $16
	db $1f
	db $19
	db $17
	db $22
	db $1f
	db $2a
	db $e
	db $3
	db $24
	db $5
	db $25
	db $2
	db $27
	db $25
	db $1d
	db $2c
	db $2e
	db $1e
	db $18
	db $1f
	db $2b

Function28f63: ; 28f63
	xor a
	ld [wcf66], a
	ld hl, wc719
	ld de, wc6e7
	call Function297ff
	ld hl, wc702
	ld de, wc6d0
	call Function29814
	ld de, .data_28f7e
	jr Function28fa1

.data_28f7e
	db $1a
	db $17
	db $22
	db $1f
	db $2a
	db $6
	db $3
	db $24
	db $5
	db $25
	db $2
	db $27
	db $25
	db $1d
	db $2c
	db $2f
	db $1e
	db $18
	db $1f
	db $1b
	db $1
	db $1c
	db $22
	db $27
	db $23
	db $3
	db $25
	db $28
	db $25
	db $1e
	db $29
	db $e
	db $16
	db $1f
	db $2b

Function28fa1: ; 28fa1
	ld hl, BattleEnded
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, [hMapAnims]
	push af
	xor a
	ld [hMapAnims], a
	ld hl, VramState
	ld a, [hl]
	push af
	res 0, [hl]
	ld hl, Options
	ld a, [hl]
	push af
	set 4, [hl]
	call Function28fdb
	ld a, [wcf66]
	and a
	jr nz, .asm_28fca
	ld de, MUSIC_EVOLUTION
	call PlayMusic2
.asm_28fca
	call Function29082
	jr nc, .asm_28fca
	pop af
	ld [Options], a
	pop af
	ld [VramState], a
	pop af
	ld [hMapAnims], a
	ret
; 28fdb

Function28fdb: ; 28fdb
	xor a
	ld [wJumptableIndex], a
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	call DisableLCD
	call LoadFontsBattleExtra
	callab Function8cf53
	ld a, [hCGB]
	and a
	jr z, .asm_2900b
	ld a, $1
	ld [rVBK], a
	ld hl, VTiles0
	ld bc, sScratch - VTiles0
	xor a
	call ByteFill
	ld a, $0
	ld [rVBK], a

.asm_2900b
	ld hl, VBGMap0
	ld bc, sScratch - VBGMap0
	ld a, " "
	call ByteFill
	ld hl, TradeGameBoyLZ
	ld de, VTiles2 tile $31
	call Decompress
	ld hl, TradeArrowGFX
	ld de, VTiles1 tile $6d
	ld bc, $10
	ld a, BANK(TradeArrowGFX)
	call FarCopyBytes
	ld hl, TradeArrowGFX + $10
	ld de, VTiles1 tile $6e
	ld bc, $10
	ld a, BANK(TradeArrowGFX)
	call FarCopyBytes
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	callba Function4d7fd
	call EnableLCD
	call Function2982b
	ld a, [wc6d0]
	ld hl, wc6fd
	ld de, VTiles0
	call Function29491
	ld a, [wc702]
	ld hl, wEnemyTrappingMove
	ld de, VTiles0 tile $31
	call Function29491
	ld a, [wc6d0]
	ld de, wc6d1
	call Function294a9
	ld a, [wc702]
	ld de, wc703
	call Function294a9
	call Function297ed
	ret
; 29082

Function29082: ; 29082
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .asm_2909b
	call Function290a0
	callab Function8cf69
	ld hl, wcf65
	inc [hl]
	call DelayFrame
	and a
	ret

.asm_2909b
	call LoadStandardFont
	scf
	ret
; 290a0

Function290a0: ; 290a0
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, JumpTable290af
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 290af

JumpTable290af: ; 290af
	dw Function29114
	dw Function2942e
	dw Function29461
	dw Function29348
	dw Function2937e
	dw Function29391
	dw Function29129
	dw Function291af
	dw Function291c4
	dw Function291d9
	dw Function2925d
	dw Function29220
	dw Function2925d
	dw Function29229
	dw Function2913c
	dw Function2925d
	dw Function291e8
	dw Function291fd
	dw Function29211
	dw Function29220
	dw Function2925d
	dw Function29229
	dw Function29701
	dw Function2973c
	dw Function2975c
	dw Function2977f
	dw Function297a4
	dw Function293a6
	dw Function293b6
	dw Function293d2
	dw Function293de
	dw Function293ea
	dw Function2940c
	dw Function294e7
	dw Function294f0
	dw Function2961b
	dw Function2962c
	dw Function29879
	dw Function29886
	dw Function29649
	dw Function29660
	dw Function2926d
	dw Function29277
	dw Function29123
	dw Function29487
	dw Function294f9
	dw Function29502
	dw Function2950c
; 2910f

Function2910f: ; 2910f
	ld hl, wJumptableIndex
	inc [hl]
	ret
; 29114

Function29114: ; 29114
	ld hl, BattleEnded
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld [wJumptableIndex], a
	inc de
	ld [hl], d
	dec hl
	ld [hl], e
	ret
; 29123

Function29123: ; 29123
	ld hl, wJumptableIndex
	set 7, [hl]
	ret
; 29129

Function29129: ; 29129
	ld a, $ed
	call Function292f6
	ld a, [wc74c]
	ld [wd265], a
	xor a
	ld de, $2c58
	ld b, $0
	jr Function2914e

Function2913c: ; 2913c
	ld a, $ee
	call Function292f6
	ld a, [wc74d]
	ld [wd265], a
	ld a, $2
	lb de, $4c, $94
	ld b, $4

Function2914e: ; 2914e
	push bc
	push de
	push bc
	push de
	push af
	call DisableLCD
	callab Function8cf53
	ld hl, $9874
	ld bc, $c
	ld a, $60
	call ByteFill
	pop af
	call Function29281
	xor a
	ld [hSCX], a
	ld a, $7
	ld [hWX], a
	ld a, $70
	ld [hWY], a
	call EnableLCD
	call Function2985a
	pop de
	ld a, $11
	call _InitSpriteAnimStruct
	ld hl, $b
	add hl, bc
	pop bc
	ld [hl], b
	pop de
	ld a, $12
	call _InitSpriteAnimStruct
	ld hl, $b
	add hl, bc
	pop bc
	ld [hl], b
	call WaitBGMap
	ld b, $1b
	call GetSGBLayout
	ld a, $e4
	call DmgToCgbBGPals
	ld a, $d0
	call Functioncf8
	call Function2910f
	ld a, $5c
	ld [wcf64], a
	ret
; 291af

Function291af: ; 291af
	call Function2981d
	ld a, [hSCX]
	add $2
	ld [hSCX], a
	cp $50
	ret nz
	ld a, $1
	call Function29281
	call Function2910f
	ret
; 291c4

Function291c4: ; 291c4
	call Function2981d
	ld a, [hSCX]
	add $2
	ld [hSCX], a
	cp $a0
	ret nz
	ld a, $2
	call Function29281
	call Function2910f
	ret
; 291d9

Function291d9: ; 291d9
	call Function2981d
	ld a, [hSCX]
	add $2
	ld [hSCX], a
	and a
	ret nz
	call Function2910f
	ret
; 291e8

Function291e8: ; 291e8
	call Function2981d
	ld a, [hSCX]
	sub $2
	ld [hSCX], a
	cp $b0
	ret nz
	ld a, $1
	call Function29281
	call Function2910f
	ret
; 291fd

Function291fd: ; 291fd
	call Function2981d
	ld a, [hSCX]
	sub $2
	ld [hSCX], a
	cp $60
	ret nz
	xor a
	call Function29281
	call Function2910f
	ret
; 29211

Function29211: ; 29211
	call Function2981d
	ld a, [hSCX]
	sub $2
	ld [hSCX], a
	and a
	ret nz
	call Function2910f
	ret
; 29220

Function29220: ; 29220
	ld a, $80
	ld [wcf64], a
	call Function2910f
	ret
; 29229

Function29229: ; 29229
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	callab Function8cf53
	ld hl, VBGMap0
	ld bc, sScratch - VBGMap0
	ld a, " "
	call ByteFill
	xor a
	ld [hSCX], a
	ld a, $90
	ld [hWY], a
	call EnableLCD
	call Function2982b
	call WaitBGMap
	call Function297ed
	call Function29114
	ret
; 2925d

Function2925d: ; 2925d
	call Function2981d
	ld hl, wcf64
	ld a, [hl]
	and a
	jr z, .asm_29269
	dec [hl]
	ret

.asm_29269
	call Function2910f
	ret
; 2926d

Function2926d: ; 2926d
	call Function29114
	ld de, SFX_GIVE_TRADEMON
	call PlaySFX
	ret
; 29277

Function29277: ; 29277
	call Function29114
	ld de, SFX_GET_TRADEMON
	call PlaySFX
	ret
; 29281

Function29281: ; 29281
	and 3
	ld e, a
	ld d, 0
	ld hl, Jumptable_2928f
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 2928f

Jumptable_2928f: ; 2928f
	dw Function29297
	dw Function292af
	dw Function292be
	dw Function29297
; 29297

Function29297: ; 29297
	call Function297cf
	hlcoord 9, 3
	ld [hl], $5b
	inc hl
	ld bc, $a
	ld a, $60
	call ByteFill
	hlcoord 3, 2
	call Function292ec
	ret
; 292af

Function292af: ; 292af
	call Function297cf
	hlcoord 0, 3
	ld bc, SCREEN_WIDTH
	ld a, $60
	call ByteFill
	ret
; 292be

Function292be: ; 292be
	call Function297cf
	hlcoord 0, 3
	ld bc, $11
	ld a, $60
	call ByteFill
	hlcoord 17, 3
	ld a, $5d
	ld [hl], a
	ld a, $61
	ld de, SCREEN_WIDTH
	ld c, $3
.asm_292d9
	add hl, de
	ld [hl], a
	dec c
	jr nz, .asm_292d9
	add hl, de
	ld a, $5f
	ld [hld], a
	ld a, $5b
	ld [hl], a
	hlcoord 10, 6
	call Function292ec
	ret
; 292ec

Function292ec: ; 292ec
	ld de, TradeGameBoyTilemap
	lb bc, 8, 6
	call Function297db
	ret
; 292f6

Function292f6: ; 292f6
	push af
	call ClearBGPalettes
	call WaitTop
	ld a, VBGMap1 / $100
	ld [hBGMapAddress + 1], a
	call ClearTileMap
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH
	ld a, "─"
	call ByteFill
	hlcoord 0, 1
	ld de, wc736
	call PlaceString
	ld hl, wc741
	ld de, 0
.asm_2931e
	ld a, [hli]
	cp "@"
	jr z, .asm_29326
	dec de
	jr .asm_2931e

.asm_29326
	hlcoord 0, 4
	add hl, de
	ld de, wc741
	call PlaceString
	hlcoord 7, 2
	ld bc, 6
	pop af
	call ByteFill
	call WaitBGMap
	call WaitTop
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	call ClearTileMap
	ret
; 29348

Function29348: ; 29348
	call ClearTileMap
	call WaitTop
	ld a, $a0
	ld [hSCX], a
	call DelayFrame
	hlcoord 8, 2
	ld de, Tilemap_298f7
	lb bc, 3, 12
	call Function297db
	call WaitBGMap
	ld b, $1b
	call GetSGBLayout
	ld a, $e4
	call DmgToCgbBGPals
	ld de, $e4e4
	call DmgToCgbObjPals
	ld de, SFX_POTION
	call PlaySFX
	call Function2910f
	ret
; 2937e

Function2937e: ; 2937e
	ld a, [hSCX]
	and a
	jr z, .asm_29388
	add $4
	ld [hSCX], a
	ret

.asm_29388
	ld c, $50
	call DelayFrames
	call Function29114
	ret
; 29391

Function29391: ; 29391
	ld a, [hSCX]
	cp $a0
	jr z, .asm_2939c
	sub $4
	ld [hSCX], a
	ret

.asm_2939c
	call ClearTileMap
	xor a
	ld [hSCX], a
	call Function29114
	ret
; 293a6

Function293a6: ; 293a6
	ld a, $8f
	ld [hWX], a
	ld a, $88
	ld [hSCX], a
	ld a, $50
	ld [hWY], a
	call Function29114
	ret
; 293b6

Function293b6: ; 293b6
	ld a, [hWX]
	cp $7
	jr z, .asm_293c7
	sub $4
	ld [hWX], a
	ld a, [hSCX]
	sub $4
	ld [hSCX], a
	ret

.asm_293c7
	ld a, $7
	ld [hWX], a
	xor a
	ld [hSCX], a
	call Function29114
	ret
; 293d2

Function293d2: ; 293d2
	ld a, $7
	ld [hWX], a
	ld a, $50
	ld [hWY], a
	call Function29114
	ret
; 293de

Function293de: ; 293de
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	call Function29114
	ret
; 293ea

Function293ea: ; 293ea
	call WaitTop
	ld a, VBGMap1 / $100
	ld [hBGMapAddress + 1], a
	call WaitBGMap
	ld a, $7
	ld [hWX], a
	xor a
	ld [hWY], a
	call DelayFrame
	call WaitTop
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	call ClearTileMap
	call Function2910f
	ret
; 2940c

Function2940c: ; 2940c
	ld a, [hWX]
	cp $a1
	jr nc, .asm_29417
	add $4
	ld [hWX], a
	ret

.asm_29417
	ld a, VBGMap1 / $100
	ld [hBGMapAddress + 1], a
	call WaitBGMap
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	call Function29114
	ret
; 2942e

Function2942e: ; 2942e
	call Function2951f
	ld a, [wc6d0]
	ld [CurPartySpecies], a
	ld a, [wc6fd]
	ld [TempMonDVs], a
	ld a, [wPlayerMinimized]
	ld [TempMonDVs + 1], a
	ld b, $1a
	call GetSGBLayout
	ld a, $e4
	call DmgToCgbBGPals
	call Function294bb

	ld a, [wc6d0]
	call GetCryIndex
	jr c, .asm_2945d
	ld e, c
	ld d, b
	call PlayCryHeader
.asm_2945d

	call Function29114
	ret
; 29461

Function29461: ; 29461
	call Function29549
	ld a, [wc702]
	ld [CurPartySpecies], a
	ld a, [wEnemyTrappingMove]
	ld [TempMonDVs], a
	ld a, [wPlayerWrapCount]
	ld [TempMonDVs + 1], a
	ld b, $1a
	call GetSGBLayout
	ld a, $e4
	call DmgToCgbBGPals
	call Function294c0
	call Function29114
	ret
; 29487

Function29487: ; 29487
	callba Function4d81e
	call Function29114
	ret
; 29491

Function29491: ; 29491
	push de
	push af
	predef GetUnownLetter
	pop af
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	call GetBaseData
	pop de
	predef GetFrontpic
	ret
; 294a9

Function294a9: ; 294a9
	push de
	ld [wd265], a
	call GetPokemonName
	ld hl, StringBuffer1
	pop de
	ld bc, NAME_LENGTH
	call CopyBytes
	ret
; 294bb

Function294bb: ; 294bb
	ld de, VTiles0
	jr Function294c3

Function294c0: ; 294c0
	ld de, VTiles0 tile $31

Function294c3: ; 294c3
	call DelayFrame
	ld hl, VTiles2
	ld bc, $a31
	call Request2bpp
	call WaitTop
	call Function297cf
	hlcoord 7, 2
	xor a
	ld [hFillBox], a
	lb bc, 7, 7
	predef FillBox
	call WaitBGMap
	ret
; 294e7

Function294e7: ; 294e7
	ld c, $50
	call DelayFrames
	call Function29114
	ret
; 294f0

Function294f0: ; 294f0
	ld c, $28
	call DelayFrames
	call Function29114
	ret
; 294f9

Function294f9: ; 294f9
	ld c, $60
	call DelayFrames
	call Function29114
	ret
; 29502

Function29502: ; 29502
	call Function29516
	ret nz
	ld c, $50
	call DelayFrames
	ret
; 2950c

Function2950c: ; 2950c
	call Function29516
	ret nz
	ld c, $b4
	call DelayFrames
	ret
; 29516

Function29516: ; 29516
	call Function29114
	ld a, [wc702]
	cp $fd
	ret
; 2951f

Function2951f: ; 2951f
	ld de, wc6d0
	ld a, [de]
	cp $fd
	jr z, Function295a1
	call Function29573
	ld de, wc6d0
	call Function295e3
	ld de, wc6d1
	call Function295ef
	ld a, [wc701]
	ld de, wc6f2
	call Function295f6
	ld de, PlayerScreens
	call Function29611
	call Function295d8
	ret
; 29549

Function29549: ; 29549
	ld de, wc702
	ld a, [de]
	cp $fd
	jr z, Function295a1
	call Function29573
	ld de, wc702
	call Function295e3
	ld de, wc703
	call Function295ef
	ld a, [wEnemyCharging]
	ld de, wc724
	call Function295f6
	ld de, wEnemyWrapCount
	call Function29611
	call Function295d8
	ret
; 29573

Function29573: ; 29573
	call WaitTop
	call Function297cf
	ld a, VBGMap1 / $100
	ld [hBGMapAddress + 1], a
	hlcoord 3, 0
	ld b, $6
	ld c, $d
	call TextBox
	hlcoord 4, 0
	ld de, String29591
	call PlaceString
	ret
; 29591

String29591: ; 29591
	db   "─── №."
	next ""
	next "OT/"
	next $73, "№.@"
; 295a1

Function295a1: ; 295a1
	call WaitTop
	call Function297cf
	ld a, VBGMap1 / $100
	ld [hBGMapAddress + 1], a
	hlcoord 3, 0
	ld b, $6
	ld c, $d
	call TextBox
	hlcoord 4, 2
	ld de, String295c2
	call PlaceString
	call Function295d8
	ret
; 295c2

String295c2: ; 295c2
	db   "EGG"
	next "OT/?????"
	next $73, "№.?????@"
; 295d8

Function295d8: ; 295d8
	call WaitBGMap
	call WaitTop
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	ret
; 295e3

Function295e3: ; 295e3
	hlcoord 10, 0
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	ld [hl], $7f
	ret
; 295ef

Function295ef: ; 295ef
	hlcoord 4, 2
	call PlaceString
	ret
; 295f6

Function295f6: ; 295f6
	cp 3
	jr c, .asm_295fb
	xor a

.asm_295fb
	push af
	hlcoord 7, 4
	call PlaceString
	inc bc
	pop af
	ld hl, Unknown_2960e
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hl]
	ld [bc], a
	ret
; 2960e

Unknown_2960e: ; 2960e
	db " ", "♂", "♀"
; 29611

Function29611: ; 29611
	hlcoord 7, 6
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ret
; 2961b

Function2961b: ; 2961b
	lb de, $54, $58
	ld a, $e
	call _InitSpriteAnimStruct
	call Function29114
	ld a, $20
	ld [wcf64], a
	ret
; 2962c

Function2962c: ; 2962c
	lb de, $54, $58
	ld a, $e
	call _InitSpriteAnimStruct
	ld hl, $b
	add hl, bc
	ld [hl], $1
	ld hl, $7
	add hl, bc
	ld [hl], $dc
	call Function29114
	ld a, $38
	ld [wcf64], a
	ret
; 29649

Function29649: ; 29649
	lb de, $54, $58
	ld a, $f
	call _InitSpriteAnimStruct
	call Function29114
	ld a, $10
	ld [wcf64], a
	ld de, SFX_BALL_POOF
	call PlaySFX
	ret
; 29660

Function29660: ; 29660
	ld a, $e4
	call Functioncf8
	lb de, $28, $58
	ld a, $10
	call _InitSpriteAnimStruct
	call Function29114
	ld a, $40
	ld [wcf64], a
	ret
; 29676

Function29676: ; 29676 (a:5676)
	ld hl, $b
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, Jumptable_29686
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 29686

Jumptable_29686: ; 29686 (a:5686)
	dw Function2969a
	dw Function296a4
	dw Function296af
	dw Function296bd
	dw Function296cf
	dw Function296dd
	dw Function296f2
; 2969a

Function29694: ; 29694 (a:5694)
	ld hl, $b
	add hl, bc
	inc [hl]
	ret

Function2969a: ; 2969a (a:569a)
	call Function29694
	ld hl, $c
	add hl, bc
	ld [hl], $80
	ret

Function296a4: ; 296a4 (a:56a4)
	ld hl, $c
	add hl, bc
	ld a, [hl]
	dec [hl]
	and a
	ret nz
	call Function29694

Function296af: ; 296af (a:56af)
	ld hl, $4
	add hl, bc
	ld a, [hl]
	cp $94
	jr nc, .asm_296ba
	inc [hl]
	ret
.asm_296ba
	call Function29694

Function296bd: ; 296bd (a:56bd)
	ld hl, $5
	add hl, bc
	ld a, [hl]
	cp $4c
	jr nc, .asm_296c8
	inc [hl]
	ret
.asm_296c8
	ld hl, $
	add hl, bc
	ld [hl], $0
	ret

Function296cf: ; 296cf (a:56cf)
	ld hl, $5
	add hl, bc
	ld a, [hl]
	cp $2c
	jr z, .asm_296da
	dec [hl]
	ret
.asm_296da
	call Function29694

Function296dd: ; 296dd (a:56dd)
	ld hl, $4
	add hl, bc
	ld a, [hl]
	cp $58
	jr z, .asm_296e8
	dec [hl]
	ret
.asm_296e8
	call Function29694
	ld hl, $c
	add hl, bc
	ld [hl], $80
	ret

Function296f2: ; 296f2 (a:56f2)
	ld hl, $c
	add hl, bc
	ld a, [hl]
	dec [hl]
	and a
	ret nz
	ld hl, $
	add hl, bc
	ld [hl], $0
	ret
; 29701 (a:5701)

Function29701: ; 29701
	ld a, [wLinkMode]
	cp LINK_TIMECAPSULE
	jr z, .asm_29725
	ld hl, UnknownText_0x29737
	call PrintText
	ld c, $bd
	call DelayFrames
	ld hl, UnknownText_0x29732
	call PrintText
	call Function297c9
	ld c, $80
	call DelayFrames
	call Function29114
	ret

.asm_29725
	ld hl, UnknownText_0x29732
	call PrintText
	call Function297c9
	call Function29114
	ret
; 29732

UnknownText_0x29732: ; 0x29732
	; was sent to @ .
	text_jump UnknownText_0x1bc6e9
	db "@"
; 0x29737

UnknownText_0x29737: ; 0x29737
	;
	text_jump UnknownText_0x1bc701
	db "@"
; 0x2973c

Function2973c: ; 2973c
	ld hl, UnknownText_0x29752
	call PrintText
	call Function297c9
	ld hl, UnknownText_0x29757
	call PrintText
	call Function297c9
	call Function29114
	ret
; 29752

UnknownText_0x29752: ; 0x29752
	; bids farewell to
	text_jump UnknownText_0x1bc703
	db "@"
; 0x29757

UnknownText_0x29757: ; 0x29757
	; .
	text_jump UnknownText_0x1bc719
	db "@"
; 0x2975c

Function2975c: ; 2975c
	call WaitTop
	hlcoord 0, 10
	ld bc, 8 * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	call WaitBGMap
	ld hl, UnknownText_0x2977a
	call PrintText
	call Function297c9
	call Function29114
	ret
; 2977a

UnknownText_0x2977a: ; 0x2977a
	; Take good care of @ .
	text_jump UnknownText_0x1bc71f
	db "@"
; 0x2977f

Function2977f: ; 2977f
	ld hl, UnknownText_0x2979a
	call PrintText
	call Function297c9
	ld hl, UnknownText_0x2979f
	call PrintText
	call Function297c9
	ld c, $e
	call DelayFrames
	call Function29114
	ret
; 2979a

UnknownText_0x2979a: ; 0x2979a
	; For @ 's @ ,
	text_jump UnknownText_0x1bc739
	db "@"
; 0x2979f

UnknownText_0x2979f: ; 0x2979f
	; sends @ .
	text_jump UnknownText_0x1bc74c
	db "@"
; 0x297a4

Function297a4: ; 297a4
	ld hl, UnknownText_0x297bf
	call PrintText
	call Function297c9
	ld hl, UnknownText_0x297c4
	call PrintText
	call Function297c9
	ld c, $e
	call DelayFrames
	call Function29114
	ret
; 297bf

UnknownText_0x297bf: ; 0x297bf
	; will trade @ @
	text_jump UnknownText_0x1bc75e
	db "@"
; 0x297c4

UnknownText_0x297c4: ; 0x297c4
	; for @ 's @ .
	text_jump UnknownText_0x1bc774
	db "@"
; 0x297c9

Function297c9: ; 297c9
	ld c, $50
	call DelayFrames
	ret
; 297cf

Function297cf: ; 297cf
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, " "
	call ByteFill
	ret
; 297db

Function297db: ; 297db
.asm_297db
	push bc
	push hl
.asm_297dd
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_297dd
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_297db
	ret
; 297ed

Function297ed: ; 297ed
	ld a, [hSGB]
	and a
	ld a, $e4
	jr z, .asm_297f6
	ld a, $f0

.asm_297f6
	call Functioncf8
	ld a, $e4
	call DmgToCgbBGPals
	ret
; 297ff

Function297ff: ; 297ff
	push de
	ld de, wc736
	ld bc, NAME_LENGTH
	call CopyBytes
	pop hl
	ld de, wc741
	ld bc, NAME_LENGTH
	call CopyBytes
	ret
; 29814

Function29814: ; 29814
	ld a, [hl]
	ld [wc74c], a
	ld a, [de]
	ld [wc74d], a
	ret
; 2981d

Function2981d: ; 2981d
	ld a, [wcf65]
	and $7
	ret nz
	ld a, [rBGP]
	xor $3c
	call DmgToCgbBGPals
	ret
; 2982b

Function2982b: ; 2982b
	call DelayFrame
	ld de, TradeBallGFX
	ld hl, VTiles0 tile $62
	lb bc, BANK(TradeBallGFX), $6
	call Request2bpp
	ld de, TradePoofGFX
	ld hl, VTiles0 tile $68
	lb bc, BANK(TradePoofGFX), $c
	call Request2bpp
	ld de, TradeCableGFX
	ld hl, VTiles0 tile $74
	lb bc, BANK(TradeCableGFX), $4
	call Request2bpp
	xor a
	ld hl, wc300
	ld [hli], a
	ld [hl], $62
	ret
; 2985a

Function2985a: ; 2985a
	call DelayFrame
	ld e, $3
	callab Function8e83f
	ld de, TradeBubbleGFX
	ld hl, VTiles0 tile $72
	lb bc, BANK(TradeBubbleGFX), $4
	call Request2bpp
	xor a
	ld hl, wc300
	ld [hli], a
	ld [hl], $62
	ret
; 29879

Function29879: ; 29879
	ld hl, wcf64
	ld a, [hl]
	and a
	jr z, .asm_29882
	dec [hl]
	ret

.asm_29882
	call Function29114
	ret
; 29886

Function29886: ; 29886
	ld hl, wcf64
	ld a, [hl]
	and a
	jr z, .asm_2988f
	dec [hl]
	ret

.asm_2988f
	call Function29114
	ret
; 29893


Function29893: ; 29893
; This function is unreferenced.
; It was meant for use in Japanese versions, so the
; constant used for copy length was changed by accident.

	ld hl, Unknown_298b5

	ld a, [hli]
	ld [wc6d0], a
	ld de, wc6e7
	ld c, 13 ; jp: 8
.asm_2989f
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_2989f

	ld a, [hli]
	ld [wc702], a
	ld de, wc719
	ld c, 13 ; jp: 8
.asm_298ae
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_298ae
	ret
; 298b5

Unknown_298b5: ; 298b5
	db $03, "ゲーフり@@", $23, $01 ; GAME FREAK
	db $06, "クりーチャ@", $56, $04 ; Creatures Inc.
; 298c7


TradeGameBoyTilemap: ; 298c7
; 6x8
	db $31, $32, $32, $32, $32, $33
	db $34, $35, $36, $36, $37, $38
	db $34, $39, $3a, $3a, $3b, $38
	db $3c, $3d, $3e, $3e, $3f, $40
	db $41, $42, $43, $43, $44, $45
	db $46, $47, $43, $48, $49, $4a
	db $41, $43, $4b, $4c, $4d, $4e
	db $4f, $50, $50, $50, $51, $52
; 297f7

Tilemap_298f7: ; 297f7
; 12x3
	db $43, $55, $56, $53, $53, $53, $53, $53, $53, $53, $53, $53
	db $43, $57, $58, $54, $54, $54, $54, $54, $54, $54, $54, $54
	db $43, $59, $5a, $43, $43, $43, $43, $43, $43, $43, $43, $43
; 2991b

TradeArrowGFX:  INCBIN "gfx/trade/arrow.2bpp"
TradeCableGFX:  INCBIN "gfx/trade/cable.2bpp"
TradeBubbleGFX: INCBIN "gfx/trade/bubble.2bpp"
TradeGameBoyLZ: INCBIN "gfx/trade/game_boy.2bpp.lz"
TradeBallGFX:   INCBIN "gfx/trade/ball.2bpp"
TradePoofGFX:   INCBIN "gfx/trade/poof.2bpp"

Special_CheckTimeCapsuleCompatibility: ; 29bfb
; Checks to see if your Party is compatible with the generation 1 games.  Returns the following in ScriptVar:
; 0: Party is okay
; 1: At least one Pokemon was introduced in GS
; 2: At least one Pokemon has a move that was introduced in GS
; 3: At least one Pokemon is holding mail

; If any party Pokemon was introduced in the generation 2 games, don't let it in.
	ld hl, PartySpecies
	ld b, PARTY_LENGTH ; 6
.loop
	ld a, [hli]
	cp $ff
	jr z, .checkitem
	cp CHIKORITA ; MEW + 1 ; 151 + 1
	jr nc, .mon_too_new
	dec b
	jr nz, .loop

; If any party Pokemon is holding mail, don't let it in.
.checkitem
	ld a, [PartyCount]
	ld b, a
	ld hl, PartyMon1Item
.itemloop
	push hl
	push bc
	ld d, [hl]
	callba ItemIsMail
	pop bc
	pop hl
	jr c, .mon_has_mail
	ld de, PARTYMON_STRUCT_LENGTH
	add hl, de
	dec b
	jr nz, .itemloop

; If any party Pokemon has a move that was introduced in the generation 2 games, don't let it in.
	ld hl, PartyMon1Moves
	ld a, [PartyCount]
	ld b, a
.move_loop
	ld c, NUM_MOVES
.move_next
	ld a, [hli]
	cp STRUGGLE + 1
	jr nc, .move_too_new
	dec c
	jr nz, .move_next
	ld de, PartyMon2 - (PartyMon1 + NUM_MOVES)
	add hl, de
	dec b
	jr nz, .move_loop
	xor a
	jr .done

.mon_too_new
	ld [wd265], a
	call GetPokemonName
	ld a, $1
	jr .done

.move_too_new
	push bc
	ld [wd265], a
	call GetMoveName
	call CopyName1
	pop bc
	call Function29c67
	ld a, $2
	jr .done

.mon_has_mail
	call Function29c67
	ld a, $3

.done
	ld [ScriptVar], a
	ret
; 29c67

Function29c67: ; 29c67
	ld a, [PartyCount]
	sub b
	ld c, a
	inc c
	ld b, $0
	ld hl, PartyCount
	add hl, bc
	ld a, [hl]
	ld [wd265], a
	call GetPokemonName
	ret
; 29c7b

Special_EnterTimeCapsule: ; 29c7b
	ld c, $a
	call DelayFrames
	ld a, $4
	call Function29f17
	ld c, $28
	call DelayFrames
	xor a
	ld [hVBlank], a
	inc a
	ld [wLinkMode], a
	ret
; 29c92

Special_AbortLink: ; 29c92
	ld c, $3
	call DelayFrames
	ld a, -1
	ld [hLinkPlayerNumber], a
	xor a
	ld [rSB], a
	ld [hSerialReceive], a
	ld a, $1
	ld [rSC], a
	ld a, $81
	ld [rSC], a
	ld c, $3
	call DelayFrames
	xor a
	ld [rSB], a
	ld [hSerialReceive], a
	ld a, $0
	ld [rSC], a
	ld a, $80
	ld [rSC], a
	ld c, $3
	call DelayFrames
	xor a
	ld [rSB], a
	ld [hSerialReceive], a
	ld [rSC], a
	ld c, $3
	call DelayFrames
	ld a, -1
	ld [hLinkPlayerNumber], a
	ld a, [rIF]
	push af
	xor a
	ld [rIF], a
	ld a, $f
	ld [rIE], a
	pop af
	ld [rIF], a
	ld hl, wcf5b
	xor a
	ld [hli], a
	ld [hl], a
	ld [hVBlank], a
	ld [wLinkMode], a
	ret
; 29ce8

Special_SetBitsForLinkTradeRequest: ; 29ce8
	ld a, $1
	ld [wcf56], a
	ld [wd265], a
	ret
; 29cf1

Special_SetBitsForBattleRequest: ; 29cf1
	ld a, $2
	ld [wcf56], a
	ld [wd265], a
	ret
; 29cfa

Special_SetBitsForTimeCapsuleRequest: ; 29cfa
	ld a, $2
	ld [rSB], a
	xor a
	ld [hSerialReceive], a
	ld a, $0
	ld [rSC], a
	ld a, $80
	ld [rSC], a
	xor a
	ld [wcf56], a
	ld [wd265], a
	ret
; 29d11

Special_WaitForLinkedFriend: ; 29d11
	ld a, [wcf56]
	and a
	jr z, .asm_29d2f
	ld a, $2
	ld [rSB], a
	xor a
	ld [hSerialReceive], a
	ld a, $0
	ld [rSC], a
	ld a, $80
	ld [rSC], a
	call DelayFrame
	call DelayFrame
	call DelayFrame

.asm_29d2f
	ld a, $2
	ld [wcf5c], a
	ld a, $ff
	ld [wcf5b], a
.asm_29d39
	ld a, [hLinkPlayerNumber]
	cp $2
	jr z, .asm_29d79
	cp $1
	jr z, .asm_29d79
	ld a, -1
	ld [hLinkPlayerNumber], a
	ld a, $2
	ld [rSB], a
	xor a
	ld [hSerialReceive], a
	ld a, $0
	ld [rSC], a
	ld a, $80
	ld [rSC], a
	ld a, [wcf5b]
	dec a
	ld [wcf5b], a
	jr nz, .asm_29d68
	ld a, [wcf5c]
	dec a
	ld [wcf5c], a
	jr z, .asm_29d8d

.asm_29d68
	ld a, $1
	ld [rSB], a
	ld a, $1
	ld [rSC], a
	ld a, $81
	ld [rSC], a
	call DelayFrame
	jr .asm_29d39

.asm_29d79
	call Function908
	call DelayFrame
	call Function908
	ld c, $32
	call DelayFrames
	ld a, $1
	ld [ScriptVar], a
	ret

.asm_29d8d
	xor a
	ld [ScriptVar], a
	ret
; 29d92

Special_CheckLinkTimeout: ; 29d92
	ld a, $1
	ld [wcf56], a
	ld hl, wcf5b
	ld a, $3
	ld [hli], a
	xor a
	ld [hl], a
	call WaitBGMap
	ld a, $2
	ld [hVBlank], a
	call DelayFrame
	call DelayFrame
	call Function29e0c
	xor a
	ld [hVBlank], a
	ld a, [ScriptVar]
	and a
	ret nz
	jp Function29f04
; 29dba

Function29dba: ; 29dba
	ld a, $5
	ld [wcf56], a
	ld hl, wcf5b
	ld a, $3
	ld [hli], a
	xor a
	ld [hl], a
	call WaitBGMap
	ld a, $2
	ld [hVBlank], a
	call DelayFrame
	call DelayFrame
	call Function29e0c
	ld a, [ScriptVar]
	and a
	jr z, .asm_29e08
	ld bc, rIE
.asm_29de0
	dec bc
	ld a, b
	or c
	jr nz, .asm_29de0
	ld a, [wcf51]
	cp $5
	jr nz, .asm_29e03
	ld a, $6
	ld [wcf56], a
	ld hl, wcf5b
	ld a, $1
	ld [hli], a
	ld [hl], $32
	call Function29e0c
	ld a, [wcf51]
	cp $6
	jr z, .asm_29e08

.asm_29e03
	xor a
	ld [ScriptVar], a
	ret

.asm_29e08
	xor a
	ld [hVBlank], a
	ret
; 29e0c

Function29e0c: ; 29e0c
	xor a
	ld [hFFCA], a
	ld a, [wcf5b]
	ld h, a
	ld a, [wcf5c]
	ld l, a
	push hl
	call Function29e3b
	pop hl
	jr nz, .asm_29e2f
	call Function29e47
	call Function29e53
	call Function29e3b
	jr nz, .asm_29e2f
	call Function29e47
	xor a
	jr .asm_29e31

.asm_29e2f
	ld a, $1

.asm_29e31
	ld [ScriptVar], a
	ld hl, wcf5b
	xor a
	ld [hli], a
	ld [hl], a
	ret
; 29e3b

Function29e3b: ; 29e3b
	call Function87d
	ld hl, wcf5b
	ld a, [hli]
	inc a
	ret nz
	ld a, [hl]
	inc a
	ret
; 29e47

Function29e47: ; 29e47
	ld b, $a
.asm_29e49
	call DelayFrame
	call Function908
	dec b
	jr nz, .asm_29e49
	ret
; 29e53

Function29e53: ; 29e53
	dec h
	srl h
	rr l
	srl h
	rr l
	inc h
	ld a, h
	ld [wcf5b], a
	ld a, l
	ld [wcf5c], a
	ret
; 29e66

Special_TryQuickSave: ; 29e66
	ld a, [wd265]
	push af
	callba Link_SaveGame
	ld a, $1
	jr nc, .asm_29e75
	xor a

.asm_29e75
	ld [ScriptVar], a
	ld c, $1e
	call DelayFrames
	pop af
	ld [wd265], a
	ret
; 29e82

Special_CheckBothSelectedSameRoom: ; 29e82
	ld a, [wd265]
	call Function29f17
	push af
	call Function908
	call DelayFrame
	call Function908
	pop af
	ld b, a
	ld a, [wd265]
	cp b
	jr nz, .asm_29eaa
	ld a, [wd265]
	inc a
	ld [wLinkMode], a
	xor a
	ld [hVBlank], a
	ld a, $1
	ld [ScriptVar], a
	ret

.asm_29eaa
	xor a
	ld [ScriptVar], a
	ret
; 29eaf

Special_TimeCapsule: ; 29eaf
	ld a, LINK_TIMECAPSULE
	ld [wLinkMode], a
	call DisableSpriteUpdates
	callab LinkCommunications
	call EnableSpriteUpdates
	xor a
	ld [hVBlank], a
	ret
; 29ec4

Special_TradeCenter: ; 29ec4
	ld a, LINK_TRADECENTER
	ld [wLinkMode], a
	call DisableSpriteUpdates
	callab LinkCommunications
	call EnableSpriteUpdates
	xor a
	ld [hVBlank], a
	ret
; 29ed9

Special_Colosseum: ; 29ed9
	ld a, LINK_COLOSSEUM
	ld [wLinkMode], a
	call DisableSpriteUpdates
	callab LinkCommunications
	call EnableSpriteUpdates
	xor a
	ld [hVBlank], a
	ret
; 29eee

Special_CloseLink: ; 29eee
	xor a
	ld [wLinkMode], a
	ld c, $3
	call DelayFrames
	jp Function29f04
; 29efa

Special_FailedLinkToPast: ; 29efa
	ld c, $28
	call DelayFrames
	ld a, $e
	jp Function29f17
; 29f04

Function29f04: ; 29f04
	ld c, $3
	call DelayFrames
	ld a, -1
	ld [hLinkPlayerNumber], a
	ld a, $2
	ld [rSB], a
	xor a
	ld [hSerialReceive], a
	ld [rSC], a
	ret
; 29f17

Function29f17: ; 29f17
	add $d0
	ld [wcf56], a
	ld [wcf57], a
	ld a, $2
	ld [hVBlank], a
	call DelayFrame
	call DelayFrame
.asm_29f29
	call Function83b
	ld a, [wcf51]
	ld b, a
	and $f0
	cp $d0
	jr z, .asm_29f40
	ld a, [wcf52]
	ld b, a
	and $f0
	cp $d0
	jr nz, .asm_29f29

.asm_29f40
	xor a
	ld [hVBlank], a
	ld a, b
	and $f
	ret
; 29f47

Special_CableClubCheckWhichChris: ; 29f47
	ld a, [hLinkPlayerNumber]
	cp $1
	ld a, $1
	jr z, .yes
	dec a

.yes
	ld [ScriptVar], a
	ret
; 29f54

GFX_29f54: ; 29f54
INCBIN "gfx/unknown/029f54.2bpp"
; 29fe4
