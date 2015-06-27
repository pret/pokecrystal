
Special:: ; c01b
; Run script special de.
	ld hl, SpecialsPointers
	add hl, de
	add hl, de
	add hl, de
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, b
	rst FarCall
	ret
; c029

SpecialsPointers:: ; c029
	add_special Function97c28
	add_special Function29ce8
	add_special Function29d11
	add_special Function29d92
	add_special Function29e66
	add_special Function29e82
	add_special Function29efa
	add_special Function29eee
	add_special Function29c92
	add_special Function29cf1
	add_special Function29cfa
	add_special Function29bfb
	add_special Function29c7b
	add_special Function29ec4
	add_special Function29ed9
	add_special Function29eaf
	add_special Function29f47
	add_special Functionc2f6
	add_special Functionc309
	add_special Function1050b9
	add_special Functionc34a
	add_special Function4d9e5
	add_special Function13a12
	add_special Function13a31
	add_special Function135db
	add_special Functionfbb32
	add_special Functionfbcd2
	add_special HealParty
	add_special Function1559a
	add_special Functionc2e7
	add_special Function166d6
	add_special Function1672a
	add_special Function16936
	add_special MoveDeletion
	add_special Function16218
	add_special Function8cc04
	add_special SpecialNameRival
	add_special Function90913
	add_special Functionc2c0
	add_special Functionc2cd
	add_special Functionc355
	add_special Functionc360
	add_special Functionc373
	add_special Functionc380
	add_special Functionc38d
	add_special Functionc3db
	add_special Function8c084
	add_special Function8c092
	add_special Function8c0b6
	add_special Function8c079
	add_special Function8c0ab
	add_special Functiond91
	add_special WhiteBGMap
	add_special UpdateTimePals
	add_special ClearTileMap
	add_special Function1ad2
	add_special Functione4a
	add_special Functionc230
	add_special SpecialSeenMon
	add_special WaitSFX
	add_special PlayMapMusic
	add_special RestartMapMusic
	add_special HealMachineAnim
	add_special Function8379
	add_special Functionc25a
	add_special Functionc268
	add_special Functionc276
	add_special Functionc284
	add_special Functionc3ef
	add_special Function17421
	add_special Function17440
	add_special Function139a8
	add_special Functionc3fc
	add_special Function26feb
	add_special Function27043
	add_special SpecialGiveShuckle
	add_special SpecialReturnShuckle
	add_special Function73f7
	add_special SpecialCheckPokerus
	add_special Function24b25
	add_special Function24b4e
	add_special Function24ae8
	add_special Function4d87a
	add_special Functionc434
	add_special Functionc422
	add_special Function4d9d3
	add_special Function88018
	add_special SpecialNameRater
	add_special Functionc2da
	add_special Function718d
	add_special Function71ac
	add_special Function2a4ab
	add_special Function2a51f
	add_special RandomPhoneMon
	add_special Function14209
	add_special Functionfb841
	add_special SpecialSnorlaxAwake
	add_special Function7413
	add_special Function7418
	add_special Function741d
	add_special Functionc472
	add_special ProfOaksPCBoot
	add_special SpecialGameboyCheck
	add_special SpecialTrainerHouse
	add_special Function16dc7
	add_special InitRoamMons
	add_special Functionc48f
	add_special Functionc49f
	add_special Functionc4ac
	add_special Function11ac3e
	add_special Function11b444
	add_special Function11b5e8
	add_special Function11b7e5
	add_special Function11b879
	add_special Function11b920
	add_special Function11b93b
	add_special Function1700b0
	add_special Function1700ba
	add_special Function170114
	add_special Function170215
	add_special Function1704e1
	add_special Function17021d
	add_special Function170b44
	add_special Function11ba38
	add_special Function170bd3
	add_special Function117656
	add_special Reset
	add_special Function1011f1
	add_special Function101220
	add_special Function101225
	add_special Function101231
	add_special Function4925b
	add_special Function8adef
	add_special Function11c1ab
	add_special Function170687
	add_special Function8ae68
	add_special Function17d224
	add_special Function17d2b6
	add_special Function17d2ce
	add_special Function17f53d
	add_special Function103612
	add_special SpecialHoOhChamber
	add_special Function102142
	add_special Function4989a
	add_special Function49bf9
	add_special SpecialPokeSeer
	add_special SpecialBuenasPassword
	add_special SpecialBuenaPrize
	add_special SpecialDratini
	add_special Function11485
	add_special SpecialBeastsCheck
	add_special SpecialMonCheck
	add_special Functionc225
	add_special Function170bd2
	add_special Function10366e
	add_special Function1037eb
	add_special Function10383c
	add_special Function1060a2
	add_special Function14168
	add_special Function1037c2
	add_special Function10630f
	add_special Function103780
	add_special Function10387b
	add_special Function4ae12
	add_special Function1047eb
	add_special Function4a927
	add_special Function90a54
	add_special Function90a88
	add_special SpecialNone
; c224

SpecialNone: ; c224
	ret
; c225

Functionc225: ; c225
	ld a, [ScriptVar]
	ld d, a
	callba Function57e2
	ret
; c230

Functionc230: ; c230
	ld a, [ScriptVar]
	dec a
	call CheckCaughtMon
	ret nz
	ld a, [ScriptVar]
	dec a
	call SetSeenAndCaughtMon
	call FadeToMenu
	ld a, [ScriptVar]
	ld [wd265], a
	callba Functionfb877
	call Function2b4d
	ret
; c252

SpecialSeenMon: ; c252
	ld a, [ScriptVar]
	dec a
	call SetSeenMon
	ret
; c25a

Functionc25a: ; c25a
	ld a, [ScriptVar]
	ld b, a
	callba Function4dbd2
	jr z, Functionc298
	jr Functionc292

Functionc268: ; c268
	ld a, [ScriptVar]
	ld b, a
	callba Function4dbd9
	jr z, Functionc298
	jr Functionc292

Functionc276: ; c276
	ld a, [ScriptVar]
	ld b, a
	callba Function4dbe0
	jr z, Functionc298
	jr Functionc292

Functionc284: ; c284
	ld a, [ScriptVar]
	ld b, a
	callba Function4dbe6
	jr z, Functionc298
	jr Functionc292

Functionc292: ; c292
	ld a, $1
	ld [ScriptVar], a
	ret

Functionc298: ; c298
	xor a
	ld [ScriptVar], a
	ret
; c29d

SpecialNameRival: ; 0xc29d
	ld b, $2 ; rival
	ld de, RivalName
	callba Function116b7
	; default to "SILVER"
	ld hl, RivalName
	ld de, DefaultRivalName
	call InitName
	ret
; 0xc2b2

DefaultRivalName: ; 0xc2b2
	db "SILVER@"

SpecialNameRater: ; c2b9
	callba NameRater
	ret
; c2c0

Functionc2c0: ; c2c0
	call FadeToMenu
	callba Function9191c
	call Function2b4d
	ret
; c2cd

Functionc2cd: ; c2cd
	call FadeToMenu
	callba Function16be4
	call Function2b4d
	ret
; c2da

Functionc2da: ; c2da
	call FadeToMenu
	callba Function3f836
	call Function2b4d
	ret
; c2e7

Functionc2e7: ; c2e7
	xor a
	ld [ScriptVar], a
	callba Function156d9
	ld a, c
	ld [ScriptVar], a
	ret
; c2f6

Functionc2f6: ; c2f6
	ld a, $0
	call GetSRAMBank
	ld a, [$abe2]
	and a
	jr z, .asm_c302
	inc a

.asm_c302
	ld [ScriptVar], a
	call CloseSRAM
	ret
; c309

Functionc309: ; c309
	ld a, $0
	call GetSRAMBank
	ld a, [$abe2]
	ld [CurItem], a
	ld a, $1
	ld [wd10c], a
	ld hl, NumItems
	call ReceiveItem
	jr nc, .asm_c33d
	xor a
	ld [$abe2], a
	call CloseSRAM
	ld a, [CurItem]
	ld [wd265], a
	call GetItemName
	ld hl, UnknownText_0xc345
	call PrintText
	ld a, $1
	ld [ScriptVar], a
	ret

.asm_c33d
	call CloseSRAM
	xor a
	ld [ScriptVar], a
	ret
; c345

UnknownText_0xc345: ; 0xc345
	; received item
	text_jump UnknownText_0x1bd3be
	db "@"
; 0xc34a

Functionc34a: ; c34a
	callba Function1369d
	ld a, b
	ld [ScriptVar], a
	ret
; c355

Functionc355: ; c355
	ld a, [ScriptVar]
	ld e, a
	callba Function91a53
	ret
; c360

Functionc360: ; c360
	call FadeToMenu
	callba Functione1190
	ld a, [wd0ec]
	ld [ScriptVar], a
	call Function2b4d
	ret
; c373

Functionc373: ; c373
	call Functionc3ae
	ret c
	ld a, BANK(Function926c7)
	ld hl, Function926c7
	call Functionc39a
	ret
; c380

Functionc380: ; c380
	call Functionc3ae
	ret c
	ld a, BANK(Functione00ee)
	ld hl, Functione00ee
	call Functionc39a
	ret
; c38d

Functionc38d: ; c38d
	call Functionc3ae
	ret c
	ld a, BANK(Functione1e5b)
	ld hl, Functione1e5b
	call Functionc39a
	ret
; c39a

Functionc39a: ; c39a
	call Function31cf
	call FadeToMenu
	ld hl, wd0e8
	ld a, [hli]
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	rst FarCall
	call Function2b4d
	ret
; c3ae

Functionc3ae: ; c3ae
	ld hl, Coins
	ld a, [hli]
	or [hl]
	jr z, .asm_c3c4
	ld a, COIN_CASE
	ld [CurItem], a
	ld hl, NumItems
	call CheckItem
	jr nc, .asm_c3c9
	and a
	ret

.asm_c3c4
	ld hl, UnknownText_0xc3d1
	jr .asm_c3cc

.asm_c3c9
	ld hl, UnknownText_0xc3d6

.asm_c3cc
	call PrintText
	scf
	ret
; c3d1

UnknownText_0xc3d1: ; 0xc3d1
	; You have no coins.
	text_jump UnknownText_0x1bd3d7
	db "@"
; 0xc3d6

UnknownText_0xc3d6: ; 0xc3d6
	; You don't have a COIN CASE.
	text_jump UnknownText_0x1bd3eb
	db "@"
; 0xc3db

Functionc3db: ; c3db
	call WhiteBGMap
	call Function2879
	ret
; c3e2

ScriptReturnCarry: ; c3e2
	jr c, .carry
	xor a
	ld [ScriptVar], a
	ret
.carry
	ld a, 1
	ld [ScriptVar], a
	ret
; c3ef

Functionc3ef: ; c3ef
	callba Function1150c
	ld a, [wdc3a]
	ld [ScriptVar], a
	ret
; c3fc

Functionc3fc: ; c3fc
	ld a, [ScriptVar]
	ld [wdfce], a
	ret
; c403


Functionc403:: ; c403
	ld a, c
	and a
	jr nz, .asm_c410
	ld a, d
	ld [wdfcc], a
	ld a, e
	ld [wdfcd], a
	ret

.asm_c410
	ld a, d
	ld [wdc5a], a
	ld a, e
	ld [wdc5b], a
	ret
; c419


SpecialCheckPokerus: ; c419
; Check if a monster in your party has Pokerus
	callba CheckPokerus
	jp ScriptReturnCarry
; c422

Functionc422: ; c422
	callba Function1152b
	ld hl, wdc9d
	res 0, [hl]
	callba Function5d33
	ret
; c434

Functionc434: ; c434
	callba Function11542
	jp ScriptReturnCarry
; c43d

SpecialSnorlaxAwake: ; 0xc43d
; Check if the Poké Flute channel is playing, and if the player is standing
; next to Snorlax.

; outputs:
; ScriptVar is 1 if the conditions are met, otherwise 0.

; check background music
	ld a, [wMapMusic]
	cp MUSIC_POKE_FLUTE_CHANNEL
	jr nz, .nope

	ld a, [XCoord]
	ld b, a
	ld a, [YCoord]
	ld c, a

	ld hl, .ProximityCoords
.loop
	ld a, [hli]
	cp $ff
	jr z, .nope
	cp b
	jr nz, .nextcoord
	ld a, [hli]
	cp c
	jr nz, .loop

	ld a, $1
	jr .done

.nextcoord
	inc hl
	jr .loop

.nope
	xor a
.done
	ld [ScriptVar], a
	ret

.ProximityCoords
	;   x,  y
	db 33,  8 ; left
	db 34, 10 ; below
	db 35, 10 ; below
	db 36,  8 ; right
	db 36,  9 ; right
	db $ff


Functionc472: ; c472
	ld a, [CurPartySpecies]
	jp PlayCry
; c478


SpecialGameboyCheck: ; c478
	ld a, [hCGB]
	and a
	jr nz, .cgb

	ld a, [hSGB]
	and a
	jr nz, .sgb

.gb
	xor a
	jr .done
.sgb
	ld a, 1
	jr .done
.cgb
	ld a, 2
.done
	ld [ScriptVar], a
	ret


Functionc48f: ; c48f
	ld a, MUSIC_NONE % $100
	ld [MusicFadeIDLo], a
	ld a, MUSIC_NONE / $100
	ld [MusicFadeIDHi], a
	ld a, $2
	ld [MusicFade], a
	ret
; c49f

Functionc49f: ; c49f
	call FadeToMenu
	callba Function1dd702
	call Function2b4d
	ret
; c4ac

Functionc4ac: ; c4ac
	call FadeToMenu
	callba Function84688
	call Function2b4d
	ret
; c4b9

SpecialTrainerHouse: ; 0xc4b9
	ld a, 0
	call GetSRAMBank
	ld a, [$abfd] ; XXX what is this memory location?
	ld [ScriptVar], a
	jp CloseSRAM
