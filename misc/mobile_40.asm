Function100000: ; 100000
; d: 1 or 2
; e: bank
; bc: addr
	ld a, [rSVBK]
	push af
	ld a, 1
	ld [rSVBK], a

	call Function100022
	call Function1000ba
	call Function100675
	call Function100057
	call Function10016f
	call Function100276

	push bc
	call Function100301
	pop bc

	pop af
	ld [rSVBK], a
	ret
; 100022

Function100022: ; 100022
	push de
	push bc
	call SetRAMStateForMobile
	pop bc
	pop de
	ld a, d
	ld [wcd21], a
	ld a, e
	ld [wcd22], a
	ld a, c
	ld [wcd23], a
	ld a, b
	ld [wcd24], a
	callba Function10127e
	callba MobileFunc_106462
	callba Function106464 ; load broken gfx
	callba Function11615a ; init RAM
	ld hl, VramState
	set 1, [hl]
	ret
; 100057

Function100057: ; 100057
	call DisableMobile
	call ReturnToMapFromSubmenu
	ld hl, VramState
	res 1, [hl]
	ret
; 100063

SetRAMStateForMobile: ; 100063
	xor a
	ld hl, BGMapBuffer
	ld bc, $65
	call ByteFill
	xor a
	ld hl, wc300
	ld bc, $100
	call ByteFill
	ld a, [rIE]
	ld [BGMapBuffer], a
	xor a
	ld [hMapAnims], a
	ld [hLCDCPointer], a
	ret
; 100082

EnableMobile: ; 100082
	xor a
	ld hl, OverworldMap
	ld bc, OverworldMapEnd - OverworldMap
	call ByteFill

	di
	call DoubleSpeed
	xor a
	ld [rIF], a
	ld a, 1 << VBLANK + 1 << LCD_STAT + 1 << TIMER + 1 << SERIAL
	ld [rIE], a
	xor a
	ld [hMapAnims], a
	ld [hLCDCPointer], a
	ld a, $01
	ld [hMobileReceive], a
	ld [hMobile], a
	ei

	ret
; 0x1000a4

DisableMobile: ; 1000a4
	di
	xor a
	ld [hMobileReceive], a
	ld [hMobile], a
	xor a
	ld [hVBlank], a
	call NormalSpeed
	xor a
	ld [rIF], a
	ld a, [BGMapBuffer]
	ld [rIE], a
	ei
	ret
; 1000ba

Function1000ba: ; 1000ba
.loop
	; call [wcd22]:([wcd23][wcd24] + [wMobileCommsJumptableIndex])
	ld hl, wcd23
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMobileCommsJumptableIndex]
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [wcd22]
	call GetFarHalfword
	ld a, [wcd22]
	rst FarCall

	call Function1000e8
	call Function1000fa
	call Function100144
	call Function100163
	ld a, [wcd2b]
	and a
	jr z, .loop
	call DelayFrame
	ret
; 1000e8

Function1000e8: ; 1000e8
	ld hl, wcd29
	bit 7, [hl]
	ret z
	callba Function115dd3
	ld hl, wcd29
	set 6, [hl]
	ret
; 1000fa

Function1000fa: ; 1000fa
	ld a, [wc30d]
	and a
	ret z
	ld hl, wcd29
	bit 4, [hl]
	ret z
	ld a, [wcd2b]
	and a
	jr nz, .asm_100117
	callba Function11619d
	ld hl, wcd29
	set 6, [hl]
	ret

.asm_100117
	di
	xor a
	ld [rIF], a
	ld a, [rIE]
	and $13
	ld [rIE], a
	xor a
	ld [hMobileReceive], a
	ld [hMobile], a
	ei

	ld a, [wLinkMode]
	push af
	xor a
	ld [wLinkMode], a
	ld a, $04
	ld [wc314 + 5], a
	callba Function11619d
	ld hl, wcd29
	set 6, [hl]
	pop af
	ld [wLinkMode], a
	ret
; 100144

Function100144: ; 100144
	ld hl, wcd29
	bit 5, [hl]
	jr z, .asm_100155
	res 5, [hl]
	res 2, [hl]
	res 6, [hl]
	call Function100320
	ret

.asm_100155
	bit 2, [hl]
	ret z
	res 2, [hl]
	res 6, [hl]
	callba HDMATransferTileMapToWRAMBank3
	ret
; 100163

Function100163: ; 100163
	ld hl, wcd29
	bit 6, [hl]
	ret z
	res 6, [hl]
	call DelayFrame
	ret
; 10016f

Function10016f: ; 10016f
	ld a, [wcd2b]
	cp $01
	ret z
	cp $02
	ret z
	cp $ff
	jp z, .asm_1001f5
	cp $fe
	jr z, .asm_1001c4
	cp $f5
	jr z, .asm_1001e7
	cp $f6
	jr z, .asm_1001b6
	cp $fa
	jp z, .asm_1001bd
	cp $f7
	jp z, .asm_1001ee
	cp $f4
	jr z, .asm_1001d2
	cp $f3
	jr z, .asm_1001cb
	cp $f1
	jr z, .asm_1001c4
	cp $f2
	jr z, .asm_1001c4
	cp $fc
	jr z, .asm_1001e6
	cp $fb
	jr z, .asm_1001af
	cp $f8
	ret z
	ret   ; ????????????????????????????

.asm_1001af
	ld a, $d7
	ld de, 0
	jr .asm_1001d7

.asm_1001b6
	ld a, $d5
	ld de, 0
	jr .asm_1001d7

.asm_1001bd
	ld a, $d6
	ld de, 0
	jr .asm_1001d7

.asm_1001c4
	ld a, $d2
	ld de, 2
	jr .asm_1001d7

.asm_1001cb
	ld a, $d1
	ld de, 1
	jr .asm_1001d7

.asm_1001d2
	ld a, $d0
	ld de, 0

.asm_1001d7
	ld [wc300], a
	ld a, d
	ld [wc302], a
	ld a, e
	ld [wc301], a
	call Function10020b
	ret

.asm_1001e6
	ret

.asm_1001e7
	ld de, String10025e
	call Function100232
	ret

.asm_1001ee
	ld de, String10024d
	call Function100232
	ret

.asm_1001f5
	ld a, [wcd2c]
	ld [wc300], a
	ld a, [wcd2d]
	ld [wc302], a
	ld a, [wcd2d]
	ld [wc301], a
	call Function10020b
	ret
; 10020b

Function10020b: ; 10020b
	xor a
	ld [wc303], a
	callba FadeOutPalettes
	callba Function106464
	call HideSprites
	call DelayFrame

	ld a, [rSVBK]
	push af
	ld a, $01
	ld [rSVBK], a

	callba Function17f555

	pop af
	ld [rSVBK], a
	ret
; 100232

Function100232: ; 100232
	push de
	callba Function106464
	call Function3f20
	call UpdateSprites
	hlcoord 1, 2
	pop de
	call PlaceString
	call Function100320
	call JoyWaitAorB
	ret
; 10024d

String10024d: ; 10024d
	db   "つうしんを キャンセル しました@"
; 10025e

String10025e: ; 10025e
	db   "おともだちと えらんだ へやが"
	next "ちがうようです@"
; 100276

Function100276: ; 100276
	ld a, [wcd2b]
	cp $01
	jr z, .asm_10029f
	cp $02
	jr z, .asm_100296
	cp $f5
	jr z, .asm_1002a5
	cp $f6
	jr z, .asm_1002a5
	cp $f7
	jr z, .asm_100293
	cp $f8
	jr z, .asm_1002b1
	jr .asm_1002c0

.asm_100293
	ld c, $02
	ret

.asm_100296
	callba Script_reloadmappart
	ld c, $04
	ret

.asm_10029f
	call Function1002dc
	ld c, 0
	ret

.asm_1002a5
	callba Script_reloadmappart
	call Function1002ed
	ld c, $03
	ret

.asm_1002b1
	call Function1002c9
	call Function1002dc
	ld de, String10024d
	call Function100232
	ld c, $02
	ret

.asm_1002c0
	call Function1002c9
	call Function1002dc
	ld c, $01
	ret
; 1002c9

Function1002c9: ; 1002c9
	ld hl, wcd2a
	bit 0, [hl]
	ret z
	callba CleanUpBattleRAM
	callba LoadPokemonData
	ret
; 1002dc

Function1002dc: ; 1002dc
	ld a, MAPSETUP_LINKRETURN
	ld [hMapEntryMethod], a
	callba RunMapSetupScript
	xor a
	ld [hMapEntryMethod], a
	call LoadStandardFont
	ret
; 1002ed

Function1002ed: ; 1002ed
	callba LoadOW_BGPal7
	callba ApplyPals
	ld a, $01
	ld [hCGBPalUpdate], a
	call DelayFrame
	ret
; 100301

Function100301: ; 100301
	ld hl, wcd2a
	bit 1, [hl]
	ret z
	callba Function106464
	callba Function10202c
	callba Function115dd3
	call Function100320
	call JoyWaitAorB
	ret
; 100320

Function100320: ; 100320
	callba Mobile_ReloadMapPart
	ret
; 100327

Function100327: ; 100327
	callba HDMATransferTileMapToWRAMBank3
	ret
; 100327


Function10032e: ; 10032e
	call Function10034d
	ld e, a
	ret nc
	ld [wcd2b], a
	ret
; 100337

Function100337: ; 100337
	call Function10032e
	ret c
	ld a, [wc821]
	bit 4, a
	jr z, .asm_100345
	ld a, e
	and a
	ret

.asm_100345
	ld a, $f9
	ld e, a
	ld [wcd2b], a
	scf
	ret
; 10034d

Function10034d: ; 10034d
	ld a, [wc821]
	bit 1, a
	jr nz, .asm_10036a
	bit 2, a
	jr nz, .asm_10037e
	bit 3, a
	jr nz, .asm_100366
	bit 0, a
	jr nz, .asm_100364
	ld a, $01
	and a
	ret

.asm_100364
	xor a
	ret

.asm_100366
	ld a, $02
	and a
	ret

.asm_10036a
	ld a, 0
	call Function3e32
	ld [wcd2c], a
	ld a, h
	ld [wcd2d], a
	ld a, l
	ld [wcd2e], a
	ld a, $ff
	scf
	ret

.asm_10037e
	ld a, $fe
	scf
	ret
; 100382

Function100382: ; 100382
	ld a, [wcd27]
	ld hl, Jumptable_10044e
	rst JumpTable
	ret
; 10038a

Function10038a: ; 10038a
	ld hl, wccb4
	ld a, $2e
	call Function3e32
	ret
; 100393

Function100393: ; 100393
	ld hl, wcc60
	ld a, $3a
	call Function3e32
	ret
; 10039c

Function10039c: ; 10039c
	ld hl, wcc60
	ld de, w3_d000
	ld bc, $54
	ld a, $03
	call FarCopyWRAM
	ret
; 1003ab

Function1003ab: ; 1003ab
	ld hl, w3_d000
	ld de, wcc60
	ld bc, $54
	ld a, $03
	call FarCopyWRAM
	ret
; 1003ba

Function1003ba: ; 1003ba
	ld hl, wccb4
	ld de, w3_d080
	ld bc, $54
	ld a, $03
	call FarCopyWRAM
	ret
; 1003c9

Function1003c9: ; 1003c9
	ld hl, w3_d080
	ld de, wccb4
	ld bc, $54
	ld a, $03
	call FarCopyWRAM
	ret
; 1003d8

Function1003d8: ; 1003d8
	ld hl, wccb4
	ld a, [hli]
	ld c, a
	ld b, 0
	push hl
	add hl, bc
	ld a, [BGMapPalBuffer]
	ld [hl], a
	pop hl
	inc bc
	call Function10043a
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, c
	add $02
	ld [wccb4], a
	ret
; 1003f5

Function1003f5: ; 1003f5
	ld a, [wcc60]
	sub $03
	ld [wcc60], a
	ld a, [wccb4]
	sub $03
	ld [wccb4], a
	ret
; 100406

Function100406: ; 100406
	ld a, [wcc60]
	sub $02
	ld c, a
	ld b, 0
	ld hl, wcc61
	call Function10043a
	add hl, bc
	ld a, [hli]
	cp e
	jr nz, .asm_100426
	ld a, [hld]
	cp d
	jr nz, .asm_100426
	dec hl
	ld a, [BGMapPalBuffer]
	cp [hl]
	jr nz, .asm_10042d
	xor a
	ret

.asm_100426
	ld a, $f4
	ld [wcd2b], a
	jr .asm_100432

.asm_10042d
	ld a, $f3
	ld [wcd2b], a

.asm_100432
	push hl
	ld hl, wcd7c
	inc [hl]
	pop hl
	scf
	ret
; 10043a

Function10043a: ; 10043a
	push hl
	push bc
	ld de, 0
.asm_10043f
	ld a, [hli]
	add e
	ld e, a
	ld a, d
	adc 0
	ld d, a
	dec bc
	ld a, b
	or c
	jr nz, .asm_10043f
	pop bc
	pop hl
	ret
; 10044e


Jumptable_10044e: ; 10044e (40:444e)
	dw Function10046a
	dw Function10047c
	dw Function100493
	dw Function1004ba
	dw Function1004f4
	dw Function1004ce
	dw Function1004de
	dw Function1004a4
	dw Function100495
	dw Function1004ce
	dw Function1004de
	dw Function1004e9
	dw Function1004f4
	dw Function1004a4

Function10046a: ; 10046a
	ld hl, BGMapPalBuffer
	inc [hl]
	call Function1003d8
	call Function1003ba
	ld a, [wcd27]
	inc a
	ld [wcd27], a
	ret
; 10047c

Function10047c: ; 10047c
	call Function100337
	ret c
	ret z
	cp $02
	jr z, .asm_100487
	jr .asm_10048d

.asm_100487
	ld a, $08
	ld [wcd27], a
	ret

.asm_10048d
	ld a, $02
	ld [wcd27], a
	ret
; 100493

Function100493: ; 100493
	jr asm_100497

Function100495: ; 100495
	jr asm_100497

asm_100497
	call Function100337
	ret c
	ret z
	ld a, [wcd27]
	inc a
	ld [wcd27], a
	ret
; 1004a4

Function1004a4: ; 1004a4
	call Function100406
	jr c, .asm_1004b8
	call Function1003c9
	call Function1003f5
	ld a, [wcd27]
	set 7, a
	ld [wcd27], a
	ret

.asm_1004b8
	scf
	ret
; 1004ba

Function1004ba: ; 1004ba
	call Function10038a
	and a
	jr nz, .asm_1004c8
	ld a, [wcd27]
	inc a
	ld [wcd27], a
	ret

.asm_1004c8
	ld a, $08
	ld [wcd27], a
	ret
; 1004ce

Function1004ce: ; 1004ce
	call Function100337
	ret c
	ret z
	cp $02
	ret nz
	ld a, [wcd27]
	inc a
	ld [wcd27], a
	ret
; 1004de

Function1004de: ; 1004de
	call Function100393
	ld a, [wcd27]
	inc a
	ld [wcd27], a
	ret
; 1004e9

Function1004e9: ; 1004e9
	call Function10038a
	ld a, [wcd27]
	inc a
	ld [wcd27], a
	ret
; 1004f4

Function1004f4: ; 1004f4
	call Function100337
	ret c
	ret z
	ld a, [wcd27]
	inc a
	ld [wcd27], a
	call Function10039c
	ret
; 100504

Function100504: ; 100504
	push de
	call Function3f20
	call UpdateSprites
	pop de
	hlcoord 4, 2
	call PlaceString
	ret
; 100513

Function100513: ; 100513
	call Function3f7c
	call PlaceVerticalMenuItems
	call InitVerticalMenuCursor
	ld hl, w2DMenuFlags1
	set 7, [hl]
	ret
; 100522

Function100522: ; 100522
	ld a, [wcd28]
	ld hl, Jumptable_10052a
	rst JumpTable
	ret
; 10052a

Jumptable_10052a: ; 10052a
	dw Function100534
	dw Function100545
	dw Function100545
	dw Function100545
	dw Function10054d
; 100534

Function100534: ; 100534
	call Function100513
	call UpdateSprites
	call ApplyTilemap
	ld a, [wcd28]
	inc a
	ld [wcd28], a
	ret
; 100545

Function100545: ; 100545
	ld a, [wcd28]
	inc a
	ld [wcd28], a
	ret
; 10054d

Function10054d: ; 10054d
	callba MobileMenuJoypad
	ld a, c
	ld hl, wMenuJoypadFilter
	and [hl]
	ret z
	call MenuClickSound
	bit 0, a
	jr nz, .asm_100565
	bit 1, a
	jr nz, .asm_10056f
	ret

.asm_100565
	ld a, [wcd28]
	set 7, a
	ld [wcd28], a
	and a
	ret

.asm_10056f
	ld a, [wcd28]
	set 7, a
	ld [wcd28], a
	scf
	ret
; 100579

Function100579: ; 100579
	ld a, [wcd26]
	ld hl, Jumptable_100581
	rst JumpTable
	ret
; 100581

Jumptable_100581: ; 100581
	dw Function100585
	dw Function100597
; 100585

Function100585: ; 100585
	ld hl, MenuDataHeader_1005b2
	call LoadMenuDataHeader
	ld a, 0
	ld [wcd28], a
	ld a, [wcd26]
	inc a
	ld [wcd26], a

Function100597: ; 100597
	call Function100522
	ld a, [wcd28]
	bit 7, a
	ret z
	jr nc, .asm_1005a6
	xor a
	ld [wMenuCursorY], a

.asm_1005a6
	call ExitMenu
	ld a, [wcd26]
	set 7, a
	ld [wcd26], a
	ret
; 1005b2

MenuDataHeader_1005b2: ; 1005b2
	db $40 ; flags
	db 6, 14
	db 10, 19
	dw MenuData2_1005ba
	db 1 ; default option

MenuData2_1005ba:
	db $c0 ; flags
	db 2
	db "はい@"
	db "いいえ@"
; 1005c3

Function1005c3: ; 1005c3
	ld a, [wcd26]
	ld hl, Jumptable_1005cb
	rst JumpTable
	ret
; 1005cb

Jumptable_1005cb: ; 1005cb
	dw Function1005cf
	dw Function1005e1
; 1005cf

Function1005cf: ; 1005cf
	ld hl, MenuDataHeader_1005fc
	call LoadMenuDataHeader
	ld a, 0
	ld [wcd28], a
	ld a, [wcd26]
	inc a
	ld [wcd26], a

Function1005e1: ; 1005e1
	call Function100522
	ld a, [wcd28]
	bit 7, a
	ret z
	jr nc, .asm_1005f0
	xor a
	ld [wMenuCursorY], a
.asm_1005f0
	call ExitMenu
	ld a, [wcd26]
	set 7, a
	ld [wcd26], a
	ret
; 1005fc

MenuDataHeader_1005fc: ; 1005fc
	db $40 ; flags
	db 6, 14
	db 10, 19
	dw MenuData2_100604
	db 1 ; default option

MenuData2_100604: ; 100604
	db $c0 ; flags
	db 2
	db "かける@"
	db "まつ@"
; 10060d

Mobile_CommunicationStandby: ; 10060d
	hlcoord 3, 10
	ld b, 1
	ld c, 11
	call Function3eea
	ld de, .String
	hlcoord 4, 11
	call PlaceString
	ret
; 100621

.String: ; 100621
	db "つうしんたいきちゅう!@"
; 10062d

AdvanceMobileInactivityTimerAndCheckExpired: ; 10062d
	push bc
	call IncrementMobileInactivityTimerByCFrames
	pop bc
	ld a, [wMobileInactivityTimerMinutes]
	cp b
	jr nc, .timed_out
	and a
	ret

.timed_out
	ld a, $fa
	ld [wcd2b], a
	scf
	ret
; 100641

StartMobileInactivityTimer: ; 100641
	xor a
	ld [wMobileInactivityTimerMinutes], a
	ld [wMobileInactivityTimerSeconds], a
	ld [wMobileInactivityTimerFrames], a
	ret
; 10064c

IncrementMobileInactivityTimerBy1Frame: ; 10064c
	ld c, 1
IncrementMobileInactivityTimerByCFrames: ; 10064e
	ld hl, wMobileInactivityTimerFrames ; timer?
	ld a, [hl]
	add c
	cp 60
	jr c, .seconds
	xor a

.seconds
	ld [hld], a
	ret c
	ld a, [hl]
	inc a
	cp 60
	jr c, .minutes
	xor a

.minutes
	ld [hld], a
	ret c
	inc [hl]
	ret
; 100665

Function100665: ; 100665
	call UpdateTime
	ld hl, wcd36
	ld a, [hHours]
	ld [hli], a
	ld a, [hMinutes]
	ld [hli], a
	ld a, [hSeconds]
	ld [hl], a
	ret
; 100675

Function100675: ; 100675
	ld hl, wcd2a
	bit 2, [hl]
	set 2, [hl]
	ret nz
	call Function1006d3
	ret
; 100681

Function100681: ; 100681
	push hl
	ld hl, wcd2a
	bit 2, [hl]
	ld hl, wcd2a
	set 2, [hl]
	pop hl
	jr nz, .asm_100694
	push hl
	call Function1006d3
	pop hl
.asm_100694
	ld de, wcd32

Function100697: ; 100697
	ld a, [de]
	and a
	jr nz, .asm_1006bb
	inc de
	push de
	call .asm_1006b4
	ld de, String1006c2
	call PlaceString
	ld h, b
	ld l, c
	pop de
	inc de
	call .asm_1006b4
	ld de, String1006c6
	call PlaceString
	ret

.asm_1006b4
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret

.asm_1006bb
	ld de, String1006ca
	call PlaceString
	ret
; 1006c2

String1006c2: ; 1006c2
	db "ふん @"
String1006c6: ; 1006c6
	db "びょう@"
String1006ca: ; 1006ca
	db "1じかんいじょう@"
; 1006d3

Function1006d3: ; 1006d3
	call UpdateTime
	ld de, wcd34
	ld hl, wcd38

Function1006dc: ; 1006dc
	ld a, [hld]
	ld c, a
	ld a, [hSeconds]
	sub c
	jr nc, .asm_1006e5
	add $3c

.asm_1006e5
	ld [de], a
	dec de
	ld a, [hld]
	ld c, a
	ld a, [hMinutes]
	sbc c
	jr nc, .asm_1006f0
	add $3c

.asm_1006f0
	ld [de], a
	dec de
	ld a, [hl]
	ld c, a
	ld a, [hHours]
	sbc c
	jr nc, .asm_1006fb
	add $18

.asm_1006fb
	ld [de], a
	ret
; 1006fd

Function1006fd: ; 1006fd
	ld a, $04
	ld hl, $a800
	call GetSRAMBank
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	call CloseSRAM
	ret
; 10070d

Function10070d: ; 10070d
	ld a, $04
	ld hl, $a800
	call GetSRAMBank
	xor a
	ld [hli], a
	ld a, $0a
	ld [hli], a
	xor a
	ld [hli], a
	call CloseSRAM
	ret
; 100720

Function100720: ; 100720
	xor a
	ld [wcd6a], a
	call UpdateTime
	ld a, [hHours]
	ld [wcd72], a
	ld a, [hMinutes]
	ld [wcd73], a
	ld a, [hSeconds]
	ld [wcd74], a
	ld a, $04
	ld hl, $a800
	call GetSRAMBank
	ld a, [hli]
	ld [wcd6c], a
	ld a, [hli]
	ld [wcd6d], a
	ld a, [hli]
	ld [wcd6e], a
	call CloseSRAM
	ld a, [wcd6d]
	ld [wcd6b], a
	ret
; 100754

Function100754: ; 100754
	call UpdateTime
	ld a, [hHours]
	ld [wcd72], a
	ld a, [hMinutes]
	ld [wcd73], a
	ld a, [hSeconds]
	ld [wcd74], a
	ld a, [wcd6d]
	ld [wcd6b], a
	ld hl, wcd2a
	res 6, [hl]
	ret
; 100772

Function100772: ; 100772
	push de
	ld hl, wcd6c
	ld a, [de]
	cp [hl]
	jr c, .asm_10079a
	jr nz, .asm_10078c
	inc hl
	inc de
	ld a, [de]
	cp [hl]
	jr c, .asm_10079a
	jr nz, .asm_10078c
	inc hl
	inc de
	ld a, [de]
	cp [hl]
	jr c, .asm_10079a
	jr z, .asm_10079a

.asm_10078c
	pop hl
	ld a, [hli]
	ld [wcd6c], a
	ld a, [hli]
	ld [wcd6d], a
	ld a, [hli]
	ld [wcd6e], a
	ret

.asm_10079a
	pop de
	ret
; 10079c


Function10079c: ; 10079c
	ld a, [wcd21]
	cp $01
	jr nz, .dont_quit
	ld hl, wcd2a
	bit 5, [hl]
	jr nz, .dont_quit
	ld hl, wcd2a
	bit 6, [hl]
	jr nz, .dont_quit
	ld a, [wcd6a]
	add c
	cp 60
	jr nc, .overflow
	ld [wcd6a], a
	and a
	ret

.overflow
	sub 60
	ld [wcd6a], a
	ld d, b
	push de
	call Function1007f6
	pop de
	jr c, .quit
	ld a, c
	and a
	jr nz, .quit
	ld a, b
	cp 10
	jr nc, .quit
	ld a, d
	and a
	ret z
	ld a, [wcd6b]
	cp b
	ret z
	ld a, b
	ld [wcd6b], a
	call Function1008e0
	and a
	ret

.quit
	call Function1008e0
	ld hl, wcd2a
	set 4, [hl]
	ld a, $fc
	ld [wcd2b], a
	scf
	ret

.dont_quit
	and a
	ret
; 1007f6

Function1007f6: ; 1007f6
	call UpdateTime
	ld hl, wcd74
	ld de, wcd71
	call Function1006dc
	ld a, $04
	call GetSRAMBank
	ld hl, $a802
	call Function100826
	call CloseSRAM
	ld hl, wcd6e
	call Function100826
	ld a, [hHours]
	ld [wcd72], a
	ld a, [hMinutes]
	ld [wcd73], a
	ld a, [hSeconds]
	ld [wcd74], a
	ret
; 100826

Function100826: ; 100826
	ld a, [wcd71]
	add [hl]
	sub $3c
	jr nc, .asm_100830
	add $3c

.asm_100830
	ld [hld], a
	ccf
	ld a, [BGMapBufferPtrs]
	adc [hl]
	sub $3c
	jr nc, .asm_10083c
	add $3c

.asm_10083c
	ld [hld], a
	ld b, a
	ccf
	ld a, [wcd6f]
	adc [hl]
	ld [hl], a
	ld c, a
	ret
; 100846

Function100846: ; 100846
	ld hl, wcd2a
	bit 5, [hl]
	jr nz, .asm_10087c
	ld a, [wcd6e]
	ld c, a
	ld a, 0
	sub c
	jr nc, .asm_100858
	add $3c

.asm_100858
	ld [StringBuffer2 + 2], a
	ld a, [wcd6d]
	ld c, a
	ld a, $0a
	sbc c
	ld [StringBuffer2 + 1], a
	xor a
	ld [StringBuffer2], a
	ld de, String_10088e
	hlcoord 1, 14
	call PlaceString
	ld de, StringBuffer2
	hlcoord 4, 16
	call Function100697
	ret

.asm_10087c
	ld de, String_10088e
	hlcoord 1, 14
	call PlaceString
	ld h, b
	ld l, c
	ld de, String_10089f
	call PlaceString
	ret
; 10088e

String_10088e: ; 10088e
	db   "モバイルたいせん できる"
	next "じかん@"
; 10089f

String_10089f: ; 10089f
	db " むせいげん@"
; 1008a6

Function1008a6: ; 1008a6
	ld a, $04
	ld hl, $a800
	call GetSRAMBank
	ld a, [hli]
	ld [StringBuffer2], a
	ld a, [hli]
	ld [StringBuffer2 + 1], a
	ld a, [hli]
	ld [StringBuffer2 + 2], a
	call CloseSRAM
	ld a, [StringBuffer2 + 2]
	ld b, a
	ld a, 0
	sub b
	jr nc, .asm_1008c8
	add $3c

.asm_1008c8
	ld b, a
	ld a, [StringBuffer2 + 1]
	ld c, a
	ld a, $0a
	sbc c
	ld c, a
	jr c, .asm_1008da
	ld a, [StringBuffer2]
	and a
	jr nz, .asm_1008da
	ret

.asm_1008da
	call Function10070d
	ld c, 0
	ret
; 1008e0


Function1008e0: ; 1008e0
	ld a, [hBGMapMode]
	ld b, a
	ld a, [hVBlank]
	ld c, a
	push bc
	xor a
	ld [hBGMapMode], a
	ld a, $03
	ld [hVBlank], a
	call Function100970
	call Function100902
	call Function100989
	call DelayFrame
	pop bc
	ld a, c
	ld [hVBlank], a
	ld a, b
	ld [hBGMapMode], a
	ret
; 100902

Function100902: ; 100902
	hlcoord 3, 10
	ld b, $01
	ld c, $0b
	call TextBox
	ld a, [wcd6d]
	ld c, a
	ld a, $0a
	sub c
	ld [StringBuffer2], a
	jr z, .asm_10093f
	ld de, .string_100966
	hlcoord 4, 11
	call PlaceString
	hlcoord 8, 11
	lb bc, 1, 2
	ld de, StringBuffer2
	call PrintNum
	ld de, SFX_TWO_PC_BEEPS
	call PlaySFX
	callba ReloadMapPart
	ld c, $3c
	call DelayFrames
	ret

.asm_10093f
	ld de, .string_10095a
	hlcoord 4, 11
	call PlaceString
	ld de, SFX_4_NOTE_DITTY
	call PlaySFX
	callba ReloadMapPart
	ld c, 120
	call DelayFrames
	ret
; 10095a

.string_10095a ; 10095a
	db "たいせん しゅうりょう@"
.string_100966 ; 100966
	db "のこり   ふん", $e7, "@"
; 100970


Function100970: ; 100970
	hlcoord 0, 0
	ld de, w3_dc00
	call Function1009a5
	hlcoord 0, 0, AttrMap
	ld de, w3_dd68
	call Function1009a5
	call Function1009d2
	call Function1009ae
	ret
; 100989

Function100989: ; 100989
	ld hl, w3_dc00
	decoord 0, 0
	call Function1009a5
	call Function1009ae
	callba ReloadMapPart
	ld hl, w3_dd68
	decoord 0, 0, AttrMap
	call Function1009a5
	ret
; 1009a5

Function1009a5: ; 1009a5
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, $03
	call FarCopyWRAM
	ret
; 1009ae

Function1009ae: ; 1009ae
	ld a, [rSVBK]
	push af
	ld a, $03
	ld [rSVBK], a

	ld hl, w3_d800
	decoord 0, 0, AttrMap
	ld c, SCREEN_WIDTH
	ld b, SCREEN_HEIGHT
.loop_row
	push bc
.loop_col
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop_col
	ld bc, BG_MAP_WIDTH - SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .loop_row

	pop af
	ld [rSVBK], a
	ret
; 1009d2

Function1009d2: ; 1009d2
	ld a, [rSVBK]
	push af
	ld a, $03
	ld [rSVBK], a

	ld a, [rVBK]
	push af
	ld a, $01
	ld [rVBK], a

	ld hl, w3_d800
	debgcoord 0, 0
	lb bc, $03, $24
	call Get2bpp

	pop af
	ld [rVBK], a

	pop af
	ld [rSVBK], a
	ret
; 1009f3

Function1009f3: ; 1009f3
	ld a, [hJoyDown]
	and SELECT + A_BUTTON
	cp SELECT + A_BUTTON
	jr nz, .select_a
	ld hl, wcd2a
	set 4, [hl]
	ld a, $f8
	ld [wcd2b], a
	scf
	ret

.select_a
	xor a
	ret
; 100a09

_LinkBattleSendReceiveAction: ; 100a09
	call .StageForSend
	ld [wd431], a
	callba PlaceWaitingText
	ld a, [wLinkMode]
	cp LINK_MOBILE
	jr nz, .not_mobile

	call .MobileBattle_SendReceiveAction
	call Function100da5
	callba FinishBattleAnim
	jr .done

.not_mobile
	call .LinkBattle_SendReceiveAction

.done
	ret
; 100a2e

.StageForSend: ; 100a2e
	ld a, [wPlayerAction]
	and a
	jr nz, .switch
	ld a, [CurPlayerMove]
	ld b, BATTLEACTION_E
	cp STRUGGLE
	jr z, .struggle
	ld b, BATTLEACTION_D
	cp $ff
	jr z, .struggle
	ld a, [CurMoveNum]
	jr .use_move

.switch
	ld a, [CurPartyMon]
	add BATTLEACTION_SWITCH1
	jr .use_move

.struggle
	ld a, b

.use_move
	and $0f
	ret
; 100a53

.LinkBattle_SendReceiveAction: ; 100a53
	ld a, [wd431]
	ld [wPlayerLinkAction], a
	ld a, $ff
	ld [wOtherPlayerLinkAction], a
.waiting
	call LinkTransfer
	call DelayFrame
	ld a, [wOtherPlayerLinkAction]
	inc a
	jr z, .waiting

	ld b, 10
.receive
	call DelayFrame
	call LinkTransfer
	dec b
	jr nz, .receive

	ld b, 10
.acknowledge
	call DelayFrame
	call LinkDataReceived
	dec b
	jr nz, .acknowledge

	ld a, [wOtherPlayerLinkAction]
	ld [wBattleAction], a
	ret
; 100a87

.MobileBattle_SendReceiveAction: ; 100a87
	call Function100acf
	call StartMobileInactivityTimer
	ld a, 0
	ld [wcd27], a
.asm_100a92
	call DelayFrame
	call GetJoypad
	callba Function100382
	ld c, $01
	ld b, $03
	push bc
	call AdvanceMobileInactivityTimerAndCheckExpired
	pop bc
	jr c, .asm_100ac7
	ld b, $01
	call Function10079c
	jr c, .asm_100ac7
	call Function1009f3
	jr c, .asm_100ac7
	ld a, [wcd2b]
	and a
	jr nz, .asm_100ac7
	ld a, [wcd27]
	bit 7, a
	jr z, .asm_100a92
	call Function100ae7
	jr .asm_100ace

.asm_100ac7
	ld a, $0f
	ld [wd430], a
	jr .asm_100ace

.asm_100ace
	ret
; 100acf

Function100acf: ; 100acf
	ld de, Unknown_100b0a
	ld hl, wccb5
	ld a, [wd431]
	ld [hli], a
	ld c, $01
.asm_100adb
	ld a, [de]
	inc de
	ld [hli], a
	inc c
	and a
	jr nz, .asm_100adb
	ld a, c
	ld [wccb4], a
	ret
; 100ae7

Function100ae7: ; 100ae7
	ld de, Unknown_100b0a
	ld hl, wcc62
.asm_100aed
	ld a, [de]
	inc de
	and a
	jr z, .asm_100af8
	cp [hl]
	jr nz, .asm_100aff
	inc hl
	jr .asm_100aed

.asm_100af8
	ld a, [wcc61]
	ld [wd430], a
	ret

.asm_100aff
	ld a, $0f
	ld [wd430], a
	ld a, $f1
	ld [wcd2b], a
	ret
; 100b0a


SECTION "tetsuji", ROMX

	charmap " ", $20 ; revert to ascii

Unknown_100b0a: ; 100b0a
	db "tetsuji", 0
; 100b12


SECTION "bank40_2", ROMX

Function100b12: ; 100b12
	call Function100dd8
	ret c
	ld hl, BattleMenuDataHeader
	ld a, BANK(BattleMenuDataHeader)
	ld de, LoadMenuDataHeader
	call FarCall_de
	ld a, BANK(BattleMenuDataHeader)
	ld [wMenuData2_2DMenuItemStringsBank], a
	ld a, [wd0d2]
	ld [wMenuCursorBuffer], a
	call Function100e72
	call Function100b45
	callba InitPartyMenuBGPal7
	call Function100ed4
	ld a, [wMenuCursorBuffer]
	ld [wd0d2], a
	call ExitMenu
	ret
; 100b45

Function100b45: ; 100b45
	call Function100b7a
.loop
	call Mobile_SetOverworldDelay
	callba MobileMenuJoypad
	push bc
	callba HDMATransferTileMapToWRAMBank3
	call Function100e2d
	pop bc
	jr c, .asm_100b6b
	ld a, [wMenuJoypadFilter]
	and c
	jr z, .loop
	callba Mobile_GetMenuSelection
	ret

.asm_100b6b
	ld a, [w2DMenuNumCols]
	ld c, a
	ld a, [w2DMenuNumRows]
	call SimpleMultiply
	ld [wMenuCursorBuffer], a
	and a
	ret
; 100b7a

Function100b7a: ; 100b7a
	ld hl, CopyMenuData2
	ld a, [wMenuData2_2DMenuItemStringsBank]
	rst FarCall
	callba Draw2DMenu
	callba MobileTextBorder
	call UpdateSprites
	call ApplyTilemap
	callba Init2DMenuCursorPosition
	ld hl, w2DMenuFlags1
	set 7, [hl]
	ret
; 100b9f

MobileMoveSelectionScreen: ; 100b9f
	xor a
	ld [wMoveSwapBuffer], a
	callba CheckPlayerHasUsableMoves
	ret z
	call Function100dd8
	jp c, xor_a_dec_a
	call Function100e72
	call .GetMoveSelection
	push af
	callba InitPartyMenuBGPal7
	call Function100ed4
	pop af
	ret
; 100bc2

.GetMoveSelection: ; 100bc2
	xor a
	ld [hBGMapMode], a
	call Function100c74
	call Function100c98
.master_loop
	callba MoveInfoBox
.loop
	call Mobile_SetOverworldDelay
	callba MobileMenuJoypad
	push bc
	callba HDMATransferTileMapToWRAMBank3
	call Function100e2d
	pop bc
	jr c, .b_button
	ld a, [wMenuJoypadFilter]
	and c
	bit D_UP_F, a
	jp nz, .d_up
	bit D_DOWN_F, a
	jp nz, .d_down
	bit A_BUTTON_F, a
	jr nz, .a_button
	bit B_BUTTON_F, a
	jr nz, .b_button
	jr .loop

.d_up
	ld a, [wMenuCursorY]
	and a
	jp nz, .master_loop
	ld a, [wNumMoves]
	inc a
	ld [wMenuCursorY], a
	jp .master_loop

.d_down
	ld a, [wMenuCursorY]
	ld b, a
	ld a, [wNumMoves]
	inc a
	inc a
	cp b
	jp nz, .master_loop
	ld a, $01
	ld [wMenuCursorY], a
	jp .master_loop

.b_button
	ld a, [wMenuCursorY]
	dec a
	ld [CurMoveNum], a
	ld a, $01
	and a
	ret

.a_button
	ld a, [wMenuCursorY]
	dec a
	ld [CurMoveNum], a
	ld a, [wMenuCursorY]
	dec a
	ld c, a
	ld b, 0
	ld hl, BattleMonPP
	add hl, bc
	ld a, [hl]
	and $3f
	jr z, .no_pp_left
	ld a, [PlayerDisableCount]
	swap a
	and $0f
	dec a
	cp c
	jr z, .move_disabled
	ld a, [wMenuCursorY]
	dec a
	ld c, a
	ld b, 0
	ld hl, BattleMonMoves
	add hl, bc
	ld a, [hl]
	ld [CurPlayerMove], a
	xor a
	ret

.move_disabled
	ld hl, BattleText_TheMoveIsDisabled
	jr .print_text

.no_pp_left
	ld hl, BattleText_TheresNoPPLeftForThisMove

.print_text
	call StdBattleTextBox
	call Call_LoadTempTileMapToTileMap
	jp .GetMoveSelection
; 100c74

Function100c74: ; 100c74
	hlcoord 0, 8
	ld b, 8
	ld c, 8
	call TextBox
	ld hl, BattleMonMoves
	ld de, wListMoves_MoveIndicesBuffer
	ld bc, NUM_MOVES
	call CopyBytes
	ld a, SCREEN_WIDTH * 2
	ld [Buffer1], a
	hlcoord 2, 10
	predef ListMoves
	ret
; 100c98

Function100c98: ; 100c98
	ld de, .attrs
	call SetMenuAttributes
	ld a, [wNumMoves]
	inc a
	ld [w2DMenuNumRows], a
	ld a, [CurMoveNum]
	inc a
	ld [wMenuCursorY], a
	ret
; 100cad

.attrs ; 100cad
	db 10, 1
	db 255, 1
	db $a0, $00
	dn 2, 0
	db D_UP | D_DOWN | A_BUTTON | B_BUTTON

Mobile_PartyMenuSelect: ; 100cb5
	call Function100dd8
	ret c
	ld hl, w2DMenuFlags1
	set 7, [hl]
	res 6, [hl]
.loop
	call Mobile_SetOverworldDelay
	callba MobileMenuJoypad
	push bc
	callba PlaySpriteAnimations
	callba HDMATransferTileMapToWRAMBank3
	call MobileComms_CheckInactivityTimer
	pop bc
	jr c, .done
	ld a, [wMenuJoypadFilter]
	and c
	jr z, .loop
	call PlaceHollowCursor
	ld a, [PartyCount]
	inc a
	ld b, a
	ld a, [wMenuCursorY]
	cp b
	jr z, .done
	ld [wPartyMenuCursor], a
	ld a, [hJoyLast]
	ld b, a
	bit 1, b
	jr nz, .done
	ld a, [wMenuCursorY]
	dec a
	ld [CurPartyMon], a
	ld c, a
	ld b, 0
	ld hl, PartySpecies
	add hl, bc
	ld a, [hl]
	ld [CurPartySpecies], a
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	call WaitSFX
	and a
	ret

.done
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	call WaitSFX
	scf
	ret
; 100d22

MobileBattleMonMenu: ; 100d22
	call Function100dd8
	ret c
	call Function100d67
	ld hl, w2DMenuFlags1
	set 7, [hl]
	res 6, [hl]
.asm_100d30
	call Mobile_SetOverworldDelay
	callba MobileMenuJoypad
	push bc
	callba PlaySpriteAnimations
	callba HDMATransferTileMapToWRAMBank3
	call MobileComms_CheckInactivityTimer
	pop bc
	jr c, .asm_100d54
	ld a, [wMenuJoypadFilter]
	and c
	jr nz, .asm_100d56
	jr .asm_100d30

.asm_100d54
	scf
	ret

.asm_100d56
	push af
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	pop af
	bit 1, a
	jr z, .asm_100d65
	ret z
	scf
	ret

.asm_100d65
	and a
	ret
; 100d67

Function100d67: ; 100d67
	ld hl, .MenuDataHeader
	call CopyMenuDataHeader
	xor a
	ld [hBGMapMode], a
	call MenuBox
	call UpdateSprites
	call PlaceVerticalMenuItems
	call WaitBGMap
	call CopyMenuData2
	call InitVerticalMenuCursor
	ld hl, w2DMenuFlags1
	set 6, [hl]
	ret
; 100d88

.MenuDataHeader: ; 100d88
	db 0 ; flags
	db 11, 11 ; start coords
	db 17, 19 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2: ; 100d90
	db $c0 ; flags
	db 3
	db "いれかえる@"  ; TRADE
	db "つよさをみる@" ; STATS
	db "キャンセル@"  ; CANCEL
; 100da5

Function100da5: ; 100da5
	ld hl, wcd2a
	res 3, [hl]
	ld hl, wcd29
	res 0, [hl]
	ret
; 100db0

Function100db0: ; 100db0
	ld hl, wcd2a
	bit 3, [hl]
	jr nz, .asm_100dbe
	ld hl, wcd2a
	set 3, [hl]
	scf
	ret

.asm_100dbe
	xor a
	ret
; 100dc0



Function100dc0: ; 100dc0
	ld a, [wLinkMode]
	cp LINK_MOBILE
	jr nz, .mobile
	ld hl, wcd2a
	bit 3, [hl]
	jr z, .mobile
	scf
	ret

.mobile
	xor a
	ret
; 100dd2

Mobile_SetOverworldDelay: ; 100dd2
	ld a, 30
	ld [OverworldDelay], a
	ret
; 100dd8

Function100dd8: ; 100dd8
	ld c, $01
	ld b, $03
	callba AdvanceMobileInactivityTimerAndCheckExpired
	jr c, .asm_100dfb
	ld c, $3c
	ld b, $01
	call Function10079c
	jr c, .asm_100dfb
	callba Function10032e
	ld a, [wcd2b]
	and a
	jr nz, .asm_100dfb
	xor a
	ret

.asm_100dfb
	scf
	ret
; 100dfd

MobileComms_CheckInactivityTimer: ; 100dfd
	ld a, [OverworldDelay]
	ld c, a
	ld a, 30
	sub c
	ld c, a
	ld b, 3
	push bc
	callba AdvanceMobileInactivityTimerAndCheckExpired ; useless to farcall
	pop bc
	jr c, .quit
	ld b, 1
	call Function10079c
	jr c, .quit
	call Function1009f3
	jr c, .quit
	callba Function10032e ; useless to farcall
	ld a, [wcd2b]
	and a
	jr nz, .quit
	xor a
	ret

.quit
	scf
	ret
; 100e2d

Function100e2d: ; 100e2d
	ld a, [OverworldDelay]
	ld c, a
	ld a, 30
	sub c
	ld c, a
	ld b, 3
	push bc
	callba AdvanceMobileInactivityTimerAndCheckExpired
	pop bc
	jr c, .asm_100e61
	ld b, 1
	call Function10079c
	jr c, .asm_100e61
	call Function1009f3
	jr c, .asm_100e61
	callba Function10032e
	ld a, [wcd2b]
	and a
	jr nz, .asm_100e61
	call Function100e63
	call Function100e84
	xor a
	ret

.asm_100e61
	scf
	ret
; 100e63

Function100e63: ; 100e63
	ld a, e
	cp $02
	ret nz
	call Function100db0
	ret nc
	ld de, SFX_ELEVATOR_END
	call PlaySFX
	ret
; 100e72

Function100e72: ; 100e72
	xor a
	ld hl, wcd29
	bit 0, [hl]
	jr z, .asm_100e7c
	ld a, $0a

.asm_100e7c
	ld [wcd67], a
	xor a
	ld [wcd68], a
	ret
; 100e84

Function100e84: ; 100e84
	ld a, [wcd67]
	ld hl, Jumptable_100e8c
	rst JumpTable
	ret
; 100e8c


Jumptable_100e8c: ; 100e8c (40:4e8c)
	dw Function100ea2
	dw Function100eae
	dw Function100eb4
	dw Function100eae
	dw Function100eb4
	dw Function100eae
	dw Function100eb4
	dw Function100eae
	dw Function100eb4
	dw Function100eae
	dw Function100ec4


Function100ea2: ; 100ea2 (40:4ea2)
	call Function100dc0
	ret nc
	ld hl, wcd29
	set 0, [hl]
	call Function100ec5


Function100eae: ; 100eae
	scf
	call Function100eca
	jr asm_100eb8

Function100eb4: ; 100eb4
	and a
	call Function100eca

asm_100eb8
	ld hl, wcd68
	inc [hl]
	ld a, [hl]
	cp $02
	ret c
	ld [hl], 0
	jr Function100ec5

Function100ec4: ; 100ec4
	ret

Function100ec5
	ld hl, wcd67
	inc [hl]
	ret
; 100eca

Function100eca: ; 100eca
	callba Mobile_InitPartyMenuBGPal7
	call Function100ed4
	ret
; 100ed4

Function100ed4: ; 100ed4
	callba ApplyPals
	ld a, $01
	ld [hCGBPalUpdate], a
	ret
; 100edf

Function100edf: ; 100edf
	ld hl, Unknown_100fc0
	ld c, 1
	jr asm_100f02

Function100ee6: ; 100ee6
	ld hl, Unknown_100fc0
	ld c, 2
	jr asm_100f02

Function100eed: ; 100eed
	ld hl, Unknown_100feb
	ld c, 1
	jr asm_100f02

Function100ef4: ; 100ef4
	ld hl, Unknown_100ff3
	ld c, 1
	jr asm_100f02

Function100efb: ; 100efb
	ld hl, Unknown_10102c
	ld c, 1
	jr asm_100f02

asm_100f02:
	ld a, c
	ld [StringBuffer2], a
	; someting that was previously stored in de gets backed up to here
	ld a, e
	ld [StringBuffer2 + 1], a
	ld a, d
	ld [StringBuffer2 + 2], a
	; empty this
	xor a
	ld [StringBuffer2 + 4], a
	ld [StringBuffer2 + 5], a
.loop
	ld a, [hl]
	cp $ff
	jr z, .done
	ld [StringBuffer2 + 3], a ; bank
	push hl
	inc hl
	; addr 1
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	; size
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	; addr 2
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Function100f3d
	; next line
	pop hl
	ld de, 7
	add hl, de
	jr .loop

.done
	; recover the values into bc
	ld a, [StringBuffer2 + 4]
	ld c, a
	ld a, [StringBuffer2 + 5]
	ld b, a
	ret
; 100f3d

Function100f3d: ; 100f3d
	; parameter
	ld a, [StringBuffer2]
	cp $02
	jr z, .two
	cp $01
	jr z, .one
	cp $03
	jr z, .three
	ret

.three
	; what was once in de gets copied to hl,
	; modified by Function100f8d, and put back
	; into this backup
	ld a, [StringBuffer2 + 1]
	ld l, a
	ld a, [StringBuffer2 + 2]
	ld h, a
	call Function100f8d
	ld a, l
	ld [StringBuffer2 + 1], a
	ld a, h
	ld [StringBuffer2 + 2], a
	ret

.two
	; hl gets backed up to de, then
	; do the same as in .three
	ld d, h
	ld e, l
	ld a, [StringBuffer2 + 1]
	ld l, a
	ld a, [StringBuffer2 + 2]
	ld h, a
	call Function100f8d
	ld a, l
	ld [StringBuffer2 + 1], a
	ld a, h
	ld [StringBuffer2 + 2], a
	ret

.one
	; de gets copied to hl, then
	; load the backup into de,
	; finally run Function100f8d
	; and store the de result
	ld h, d
	ld l, e
	ld a, [StringBuffer2 + 1]
	ld e, a
	ld a, [StringBuffer2 + 2]
	ld d, a
	call Function100f8d
	ld a, e
	ld [StringBuffer2 + 1], a
	ld a, d
	ld [StringBuffer2 + 2], a
	ret
; 100f8d

Function100f8d: ; 100f8d
	push hl
	ld a, [StringBuffer2 + 4]
	ld l, a
	ld a, [StringBuffer2 + 5]
	ld h, a
	add hl, bc
	ld a, l
	ld [StringBuffer2 + 4], a
	ld a, h
	ld [StringBuffer2 + 5], a
	pop hl
	ld a, [StringBuffer2 + 3]
	bit 7, a
	res 7, a
	jr z, .sram
	and a
	jr nz, .far_wram
	call CopyBytes
	ret

.far_wram
	and $7f
	call FarCopyWRAM
	ret

.sram
	call GetSRAMBank
	call CopyBytes
	call CloseSRAM
	ret
; 100fc0

Unknown_100fc0: ; 100fc0
	; first byte:
	;     Bit 7 set: Not SRAM
	;     Lower 7 bits: Bank
	; Address, size (dw), address
	dbwww $80, PlayerName, NAME_LENGTH, OTPlayerName
	dbwww $80, PartyCount, 1 + PARTY_LENGTH + 1, OTPartyCount
	dbwww $80, PlayerID, 2, OTPlayerID
	dbwww $80, PartyMons, PARTYMON_STRUCT_LENGTH * PARTY_LENGTH, OTPartyMons
	dbwww $80, PartyMonOT, NAME_LENGTH * PARTY_LENGTH, OTPartyMonOT
	dbwww $80, PartyMonNicknames, PKMN_NAME_LENGTH * PARTY_LENGTH, OTPartyMonNicknames
	db -1

Unknown_100feb: ; 100feb
	dbwww $00, sPartyMail, MAIL_STRUCT_LENGTH * PARTY_LENGTH, NULL
	db -1

Unknown_100ff3: ; 100ff3
	dbwww $80, wdc41, 1, NULL
	dbwww $80, PlayerName, NAME_LENGTH, NULL
	dbwww $80, PlayerName, NAME_LENGTH, NULL
	dbwww $80, PlayerID, 2, NULL
	dbwww $80, wSecretID, 2, NULL
	dbwww $80, PlayerGender, 1, NULL
	dbwww $04, $a603, 8, NULL
	dbwww $04, $a007, PARTYMON_STRUCT_LENGTH, NULL
	db -1

Unknown_10102c: ; 10102c
	dbwww $80, OTPlayerName, NAME_LENGTH, NULL
	dbwww $80, OTPlayerID, 2, NULL
	dbwww $80, OTPartyMonNicknames, PKMN_NAME_LENGTH * PARTY_LENGTH, NULL
	dbwww $80, OTPartyMonOT, NAME_LENGTH * PARTY_LENGTH, NULL
	dbwww $80, OTPartyMons, PARTYMON_STRUCT_LENGTH * PARTY_LENGTH, NULL
	db -1
; 10104f

Function101050: ; 101050
	call Function10107d
	ld a, [OTPartyCount]
rept 2 ; ???
	ld hl, wc608
endr
	ld bc, wc7bb - wc608
	call Function1010de
	ld hl, wc7bb
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, $07
	call GetSRAMBank
	ld hl, wc608
	ld de, $a001
	ld bc, wc7bd - wc608
	call CopyBytes
	call CloseSRAM
	ret
; 10107d

Function10107d: ; 10107d
	xor a
	ld hl, wc608
	ld bc, wc7bd - wc608
	call ByteFill
	ld hl, OTPlayerName
	ld de, wc608
	ld bc, NAME_LENGTH
	call CopyBytes
	ld hl, wd271
	ld a, [hli]
	ld [wc608 + 11], a
	ld a, [hl]
	ld [wc608 + 12], a
	ld hl, OTPartyMonNicknames
	ld de, wc608 + 13
	ld bc, NAME_LENGTH
	call .CopyAllFromOT
	ld hl, OTPartyMonOT
	ld de, OTClassName + 1
	ld bc, NAME_LENGTH
	call .CopyAllFromOT
	ld hl, OTPartyMon1Species
	ld de, $c699
	ld bc, PARTYMON_STRUCT_LENGTH
	call .CopyAllFromOT
	ld a, $50
	ld [wc7b9], a
	ld a, $33
	ld [wc7ba], a
	ret
; 1010cd

.CopyAllFromOT: ; 1010cd
	push hl
	ld hl, 0
	ld a, [OTPartyCount]
	call AddNTimes
	ld b, h
	ld c, l
	pop hl
	call CopyBytes
	ret
; 1010de

Function1010de: ; 1010de
	push hl
	push bc
	ld de, 0
.loop
	ld a, [hli]
	add e
	ld e, a
	ld a, d
	adc 0
	ld d, a
	dec bc
	ld a, b
	or c
	jr nz, .loop
	pop bc
	pop hl
	ret
; 1010f2

LoadSelectedPartiesForColosseum: ; 1010f2
	xor a
	ld hl, StringBuffer2
	ld bc, 9
	call ByteFill
	ld hl, wPlayerMonSelection
	ld de, PartyCount
	call .CopyThreeSpecies
	ld hl, wPlayerMonSelection
	ld de, PartyMon1Species
	call .CopyPartyStruct
	ld hl, wPlayerMonSelection
	ld de, PartyMonOT
	call .CopyName
	ld hl, wPlayerMonSelection
	ld de, PartyMonNicknames
	call .CopyName
	ld hl, wOTMonSelection
	ld de, OTPartyCount
	call .CopyThreeSpecies
	ld hl, wOTMonSelection
	ld de, OTPartyMon1Species
	call .CopyPartyStruct
	ld hl, wOTMonSelection
	ld de, OTPartyMonOT
	call .CopyName
	ld hl, wOTMonSelection
	ld de, OTPartyMonNicknames
	call .CopyName
	ret
; 101145

.CopyThreeSpecies: ; 101145
; Load the 3 choices to the buffer
	push de
	ld bc, StringBuffer2 + 6
	xor a
.party_loop
	push af
	call .GetNthSpecies
	ld [bc], a
	inc bc
	pop af
	inc a
	cp 3
	jr nz, .party_loop
	pop de
; Copy the 3 choices to the party
	ld a, 3
	ld [de], a
	inc de
	ld hl, StringBuffer2 + 6
	ld bc, 3
	call CopyBytes
	ld a, $ff
	ld [de], a
	ret
; 101168

.GetNthSpecies: ; 101168
; Preserves hl and de
; Get the index of the Nth selection
	push hl
	add l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [hl]
	pop hl
; Get the corresponding species
	push de
	inc de
	add e
	ld e, a
	ld a, d
	adc 0
	ld d, a
	ld a, [de]
	pop de
	ret
; 10117c

.CopyPartyStruct: ; 10117c
	ld bc, PARTYMON_STRUCT_LENGTH
	jr .ContinueCopy

.CopyName: ; 101181
	ld bc, NAME_LENGTH

.ContinueCopy:
	; Copy, via wc608...
	ld a, wc608 % $100
	ld [StringBuffer2], a
	ld a, wc608 / $100
	ld [StringBuffer2 + 1], a
	; ... bc bytes...
	ld a, c
	ld [StringBuffer2 + 2], a
	ld a, b
	ld [StringBuffer2 + 3], a
	; ... to de...
	ld a, e
	ld [StringBuffer2 + 4], a
	ld a, d
	ld [StringBuffer2 + 5], a
	; ... 3 times.
	ld a, 3
.big_copy_loop
	push af
	ld a, [hli]
	push hl
	push af
	call .GetDestinationAddress
	call .GetCopySize
	pop af
	call AddNTimes
	ld a, [StringBuffer2]
	ld e, a
	ld a, [StringBuffer2 + 1]
	ld d, a
	call CopyBytes
	ld a, e
	ld [StringBuffer2], a
	ld a, d
	ld [StringBuffer2 + 1], a
	pop hl
	pop af
	dec a
	jr nz, .big_copy_loop
	call .GetCopySize
	ld a, 3
	ld hl, 0
	call AddNTimes
	ld b, h
	ld c, l
	call .GetDestinationAddress
	ld d, h
	ld e, l
	ld hl, wc608
	call CopyBytes
	ret
; 1011df

.GetDestinationAddress: ; 1011df
	ld a, [StringBuffer2 + 4]
	ld l, a
	ld a, [StringBuffer2 + 5]
	ld h, a
	ret
; 1011e8

.GetCopySize: ; 1011e8
	ld a, [StringBuffer2 + 2]
	ld c, a
	ld a, [StringBuffer2 + 3]
	ld b, a
	ret
; 1011f1

Function1011f1: ; 1011f1
	ld a, $04
	call GetSRAMBank
	ld a, [$a60c]
	ld [wdc41], a
	call CloseSRAM
	ld hl, wdc41
	res 4, [hl]
	ld hl, GameTimerPause
	bit 7, [hl]
	jr z, .skip
	ld hl, wdc41
	set 4, [hl]

.skip
	call Function10209c
	xor a
	ld [wdc5f], a
	ld [wdc60], a
	ld a, LINK_MOBILE
	ld [wLinkMode], a
	ret
; 101220

Function101220: ; 101220
	xor a
	ld [wLinkMode], a
	ret
; 101225

Function101225: ; 101225
	ld d, 1
	ld e, BANK(Jumptable_101297)
	ld bc, Jumptable_101297
	call Function100000
	jr Function10123d

Function101231: ; 101231
	ld d, 2
	ld e, BANK(Jumptable_101297)
	ld bc, Jumptable_101297
	call Function100000
	jr Function10123d

Function10123d: ; 10123d
	xor a
	ld [ScriptVar], a
	ld a, c
	ld hl, Jumptable_101247
	rst JumpTable
	ret
; 101247

Jumptable_101247: ; 101247
	dw Function101251
	dw Function10127d
	dw Function10127c
	dw Function10126c
	dw Function101265
; 101251

Function101251: ; 101251
	call UpdateSprites
	call RefreshScreen
	ld hl, UnknownText_0x1021f4
	call Function1021e0
	call Function1020ea
	ret c
	call Function102142
	ret
; 101265

Function101265: ; 101265
	ld hl, UnknownText_0x1021ef
	call Function1021e0
	ret
; 10126c

Function10126c: ; 10126c
	call UpdateSprites
	callba Script_reloadmappart
	ld hl, UnknownText_0x1021f4
	call Function1021e0
	ret
; 10127c

Function10127c: ; 10127c
	ret
; 10127d

Function10127d: ; 10127d
	ret
; 10127e

Function10127e: ; 10127e
	ld a, [wdc5f]
	and a
	jr z, .zero
	cp 1
	ld c, $27
	jr z, .load
	cp 2
	ld c, $37
	jr z, .load
.zero
	ld c, 0
.load
	ld a, c
	ld [wMobileCommsJumptableIndex], a
	ret
; 101297

Jumptable_101297: ; 101297
	dw Function101a97                         ; 00
	dw Function101ab4                         ; 01
	dw Function101475                         ; 02
	dw Function101b0f                         ; 03
	dw Function101438                         ; 04
	dw Function101b2b                         ; 05
	dw Function101b59                         ; 06
	dw Function101475                         ; 07
	dw Function101b70                         ; 08
	dw Function101438                         ; 09
	dw Function101b8f                         ; 0a
	dw Function101d7b                         ; 0b
	dw Function101d95                         ; 0c
	dw Function101475                         ; 0d
	dw Function101db2                         ; 0e
	dw Function101e4f                         ; 0f
	dw Function101475                         ; 10
	dw Function101e64                         ; 11
	dw Function101e4f                         ; 12
	dw Function101475                         ; 13
	dw Function101e64                         ; 14
	dw Function101d95                         ; 15
	dw Function101475                         ; 16
	dw Function101db2                         ; 17
	dw Function101dd0                         ; 18
	dw Function101de3                         ; 19
	dw Function101e39                         ; 1a
	dw Function101e09                         ; 1b
	dw Function101e4f                         ; 1c
	dw Function101475                         ; 1d
	dw Function101e64                         ; 1e
	dw Function101d95                         ; 1f
	dw Function101475                         ; 20
	dw Function101db2                         ; 21
	dw Function101e09                         ; 22
	dw Function101e31                         ; 23
	dw Function101bc8                         ; 24
	dw Function101438                         ; 25
	dw Function101be5                         ; 26
	dw Function101ac6                         ; 27
	dw Function101ab4                         ; 28
	dw Function101475                         ; 29
	dw Function101c11                         ; 2a
	dw Function1014f4                         ; 2b
	dw Function101cc8                         ; 2c
	dw Function1014e2                         ; 2d
	dw Function1014e2                         ; 2e
	dw Function101d10                         ; 2f
	dw Function101d2a                         ; 30
	dw Function101d2a                         ; 31
	dw Function101507                         ; 32
	dw Function10156d                         ; 33
	dw Function101557                         ; 34
	dw Function10158a                         ; 35
	dw Function101c42                         ; 36
	dw Function101aed                         ; 37
	dw Function101ab4                         ; 38
	dw Function101475                         ; 39
	dw Function101c2b                         ; 3a
	dw Function1014f4                         ; 3b
	dw Function101cdf                         ; 3c
	dw Function1014e2                         ; 3d
	dw Function1014e2                         ; 3e
	dw Function101d1e                         ; 3f
	dw Function101d2a                         ; 40
	dw Function101d2a                         ; 41
	dw Function101507                         ; 42
	dw Function10156d                         ; 43
	dw Function101544                         ; 44
	dw Function10158a                         ; 45
	dw Function101c42                         ; 46
	dw Function101c50                         ; 47
	dw Function1014ce                         ; 48
	dw Function101cf6                         ; 49
	dw Function101826                         ; 4a
	dw Function1017e4                         ; 4b
	dw Function1017f1                         ; 4c
	dw Function1018a8                         ; 4d
	dw Function1018d6                         ; 4e
	dw Function1017e4                         ; 4f
	dw Function1017f1                         ; 50
	dw Function1018e1                         ; 51
	dw Function1015df                         ; 52
	dw Function10167d                         ; 53
	dw Function10168a                         ; 54
	dw Function10162a                         ; 55
	dw Function1015be                         ; 56
	dw Function10167d                         ; 57
	dw Function10168a                         ; 58
	dw Function10161f                         ; 59
	dw Function10159d                         ; 5a
	dw Function10167d                         ; 5b
	dw Function10168a                         ; 5c
	dw Function101600                         ; 5d
	dw Function101d03                         ; 5e
	dw Function101d6b                         ; 5f
	dw Function10159d                         ; 60
	dw Function1014ce                         ; 61
	dw Function10168e                         ; 62
	dw Function101600                         ; 63
	dw Function101913                         ; 64
	dw Function10194b                         ; 65
	dw _SelectMonsForMobileBattle             ; 66
	dw Function1017e4                         ; 67
	dw Function1017f5                         ; 68
	dw _StartMobileBattle                     ; 69
	dw Function101537                         ; 6a
	dw Function101571                         ; 6b
	dw Function101c92                         ; 6c
	dw Function10152a                         ; 6d
	dw Function101571                         ; 6e
	dw Function101a4f                         ; 6f
	dw Function101cbc                         ; 70
	dw Function101c62                         ; 71
	dw Function101537                         ; 72
	dw Function101571                         ; 73
	dw Function101c92                         ; 74
	dw Function10152a                         ; 75
	dw Function101571                         ; 76
	dw Function101ca0                         ; 77
	dw Function101475                         ; 78
	dw Function101cbc                         ; 79
; 10138b

Function10138b: ; 10138b
	callba Function8adcc
	ld c, 0
	jr c, .asm_101396
	inc c

.asm_101396
	sla c
	ld a, [wcd2f]
	and a
	jr z, .asm_10139f
	inc c

.asm_10139f
	sla c
	ld a, [wcd21]
	cp $01
	jr z, .asm_1013a9
	inc c

.asm_1013a9
	ret
; 1013aa

Function1013aa: ; 1013aa
	call ClearBGPalettes
	call Call_ExitMenu
	call ReloadTilesetAndPalettes
	callba Function106464
	call UpdateSprites
	call FinishExitMenu
	ret
; 1013c0

Function1013c0: ; 1013c0
	callba BlankScreen
	callba MobileFunc_106462
	callba Function106464
	call FinishExitMenu
	ret
; 1013d6

Function1013d6: ; 1013d6
	callba HDMATransferAttrMapAndTileMapToWRAMBank3
	ret
; 1013dd

Function1013dd: ; 1013dd
	call CGBOnly_LoadEDTile
	ret
; 1013e1

Function1013e1: ; 1013e1 ; unreferenced
	push de
	inc de
	ld b, a
	ld c, 0
.asm_1013e6
	inc c
	ld a, [hli]
	ld [de], a
	inc de
	and a
	jr z, .asm_1013f1
	dec b
	jr nz, .asm_1013e6
	scf

.asm_1013f1
	pop de
	ld a, c
	ld [de], a
	ret
; 1013f5

Function1013f5: ; 1013f5
	ld a, [hli]
	ld [de], a
	inc de
	ld c, a
.asm_1013f9
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_1013f9
	ret
; 101400

Function101400: ; 101400 ; unreferenced
	ld a, [de]
	inc de
	cp [hl]
	jr nz, asm_101416
	inc hl

Function101406: ; 101406
	ld c, a
	ld b, 0
.asm_101409
	ld a, [de]
	inc de
	cp [hl]
	jr nz, asm_101416
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .asm_101409
	and a
	ret

asm_101416
	scf
	ret
; 101418

Function101418: ; 101418
	call GetJoypad
	ld a, [hJoyDown]
	and SELECT + A_BUTTON
	cp SELECT + A_BUTTON
	jr z, .asm_101425
	xor a
	ret

.asm_101425
	ld a, $f7
	ld [wcd2b], a
	scf
	ret
; 10142c

Function10142c: ; 10142c
	ld a, $01
	ld [wc305], a
	callba Function115e18
	ret
; 101438

Function101438: ; 101438
	ld hl, wcd29
	set 6, [hl]
	ld a, [wcd26]
	ld hl, Jumptable_101457
	rst JumpTable
	ld a, [wcd26]
	bit 7, a
	ret z
	ld a, 0
	ld [wcd26], a
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 101457

Jumptable_101457: ; 101457
	dw Function10145b
	dw Function101467
; 10145b

Function10145b: ; 10145b
	ld a, $3c
	ld [wcd42], a
	ld a, [wcd26]
	inc a
	ld [wcd26], a

Function101467: ; 101467
	ld hl, wcd42
	dec [hl]
	ret nz
	ld a, [wcd26]
	set 7, a
	ld [wcd26], a
	ret
; 101475

Function101475: ; 101475
	ld hl, wcd29
	set 6, [hl]
	ld a, [wcd26]
	ld hl, Jumptable_101494
	rst JumpTable
	ld a, [wcd26]
	bit 7, a
	ret z
	ld a, 0
	ld [wcd26], a
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 101494

Jumptable_101494: ; 101494
	dw Function10149a
	dw Function1014a6
	dw Function1014b7
; 10149a

Function10149a: ; 10149a
	ld a, $28
	ld [wcd42], a
	ld a, [wcd26]
	inc a
	ld [wcd26], a

Function1014a6: ; 1014a6
	ld hl, wcd42
	dec [hl]
	ret nz
	ld a, $50
	ld [wcd42], a
	ld a, [wcd26]
	inc a
	ld [wcd26], a

Function1014b7: ; 1014b7
	call GetJoypad
	ld a, [hJoyPressed]
	and $03
	jr nz, .asm_1014c5
	ld hl, wcd42
	dec [hl]
	ret nz

.asm_1014c5
	ld a, [wcd26]
	set 7, a
	ld [wcd26], a
	ret
; 1014ce

Function1014ce: ; 1014ce
	callba Function100720
	callba StartMobileInactivityTimer
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 1014e2

Function1014e2: ; 1014e2
	ld hl, wcd29
	set 6, [hl]
	ld a, 0
	ld [wcd26], a
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 1014f4

Function1014f4: ; 1014f4
	callba EnableMobile
	ld hl, wcd29
	set 6, [hl]
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 101507

Function101507: ; 101507
	ld de, wcd30
	ld hl, $40
	ld bc, $40
	ld a, $02
	call Function3e32
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 10151d

Function10151d: ; 10151d ; unreferenced
	ld a, $34
	call Function3e32
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 10152a

Function10152a: ; 10152a
	ld a, $36
	call Function3e32
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 101537

Function101537: ; 101537
	ld a, $0a
	call Function3e32
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 101544

Function101544: ; 101544
	callba StartMobileInactivityTimer
	ld a, $12
	call Function3e32
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 101557

Function101557: ; 101557
	callba StartMobileInactivityTimer
	ld hl, wcd53
	ld a, $08
	call Function3e32
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 10156d

Function10156d: ; 10156d
	call Function101418
	ret c

Function101571: ; 101571
	callba Function10032e
	ret c
	ret z
	ld a, e
	cp $01
	jr z, .asm_101582
	ld [wcd2b], a
	ret

.asm_101582
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 10158a

Function10158a: ; 10158a
	callba IncrementMobileInactivityTimerBy1Frame
	ld a, [wMobileInactivityTimerMinutes]
	cp $0a
	jr c, Function10156d
	ld a, $fb
	ld [wcd2b], a
	ret
; 10159d

Function10159d: ; 10159d
	ld de, wc608
	callba Function100edf
	ld de, wc608
	ld a, $05
	ld hl, w5_d800
	call Function10174c
	ld a, 0
	ld [wcd26], a
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 1015be

Function1015be: ; 1015be
	ld de, wc608
	callba Function100eed
	ld de, wc608
	ld a, $05
	ld hl, w5_d800
	call Function10174c
	ld a, 0
	ld [wcd26], a
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 1015df

Function1015df: ; 1015df
	ld de, wc608
	callba Function100ef4
	ld de, wc608
	ld a, $05
	ld hl, w5_d800
	call Function10174c
	ld a, 0
	ld [wcd26], a
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 101600

Function101600: ; 101600
	ld hl, w5_d800
	ld de, wc608
	ld bc, $1e0
	ld a, $05
	call FarCopyWRAM
	ld de, wc608
	callba Function100ee6
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 10161f

Function10161f: ; 10161f
	call Function101649
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 10162a

Function10162a: ; 10162a
	call Function101663
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 101635

Function101635: ; 101635
	ld de, wc608
	ld bc, $1e0
	call FarCopyWRAM
	ret
; 10163f

Function10163f: ; 10163f
	ld hl, wc608
	ld bc, $1e0
	call FarCopyWRAM
	ret
; 101649

Function101649: ; 101649
	ld a, $05
	ld hl, w5_d800
	call Function101635
	ld a, $05
	ld de, w5_da00
	call Function10163f
	ret
; 10165a

Function10165a: ; 10165a
	ld a, $05
	ld hl, w5_da00
	call Function101635
	ret
; 101663

Function101663: ; 101663
	ld a, $05
	ld hl, w5_d800
	call Function101635
	ld a, $05
	ld de, w5_dc00
	call Function10163f
	ret
; 101674

Function101674: ; 101674 ; unreferenced
	ld a, $05
	ld hl, w5_dc00
	call Function101635
	ret
; 10167d

Function10167d: ; 10167d
	ld a, 0
	ld [wcd26], a
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 10168a

Function10168a: ; 10168a
	call Function101418
	ret c

Function10168e: ; 10168e
	ld b, 0
	ld c, $01
	callba Function10079c
	ret c
	ld c, $01
	ld b, $03
	callba AdvanceMobileInactivityTimerAndCheckExpired
	ret c
	ld a, [wcd26]
	ld hl, Jumptable_1016c3
	rst JumpTable
	ld hl, wcd29
	set 6, [hl]
	ld a, [wcd26]
	bit 7, a
	ret z
	ld a, 0
	ld [wcd26], a
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 1016c3

Jumptable_1016c3: ; 1016c3
	dw Function1016cf
	dw Function1016de
	dw Function1016f8
	dw Function101705
	dw Function101719
	dw Function101724
; 1016cf

Function1016cf: ; 1016cf
	ld hl, wcd3a
	inc [hl]
	call Function10176f
	ld a, [wcd26]
	inc a
	ld [wcd26], a
	ret
; 1016de

Function1016de: ; 1016de
	call Function10177b
	jr nc, .asm_1016eb
	ld a, [wcd26]
	inc a
	ld [wcd26], a
	ret

.asm_1016eb
	ld a, $ff
	ld [wcd39], a
	ld a, [wcd26]
	inc a
	ld [wcd26], a
	ret
; 1016f8

Function1016f8: ; 1016f8
	ld a, 0
	ld [wcd27], a
	ld a, [wcd26]
	inc a
	ld [wcd26], a
	ret
; 101705

Function101705: ; 101705
	callba Function100382
	ld a, [wcd27]
	bit 7, a
	ret z
	ld a, [wcd26]
	inc a
	ld [wcd26], a
	ret
; 101719

Function101719: ; 101719
	call Function1017c7
	ld a, [wcd26]
	inc a
	ld [wcd26], a
	ret
; 101724

Function101724: ; 101724
	ld a, [wcd39]
	cp $ff
	jr z, .asm_101731
	ld a, 0
	ld [wcd26], a
	ret

.asm_101731
	ld a, [wcd26]
	set 7, a
	ld [wcd26], a
	ret
; 10173a

Unknown_10173a:
	db $50

Function10173b: ; 10173b
	push bc
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [Unknown_10173a]
	ld c, a
	ld b, 0
	pop af
	call AddNTimes
	pop bc
	ret
; 10174c

Function10174c: ; 10174c
	ld [wcd3d], a
	ld a, l
	ld [wcd3e], a
	ld a, h
	ld [wcd3f], a
	ld a, e
	ld [wcd3b], a
	ld a, d
	ld [wcd3c], a
	ld a, c
	ld [wcd40], a
	ld a, b
	ld [wcd41], a
	xor a
	ld [wcd39], a
	ld [wcd3a], a
	ret
; 10176f

Function10176f: ; 10176f
	ld hl, wccb4
	ld bc, $54
	ld a, $11
	call ByteFill
	ret
; 10177b

Function10177b: ; 10177b
	ld a, [Unknown_10173a]
	ld c, a
	ld b, 0
	ld a, [wcd3a]
	ld hl, 0
	call AddNTimes
	ld e, l
	ld d, h
	ld hl, wcd40
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	jr c, .asm_1017a0
	add hl, bc
	call Function1017b0
	scf
	ret

.asm_1017a0
	ld a, $ff
	ld [wcd39], a
	add hl, bc
	ld a, h
	or l
	ret z
	ld c, l
	ld b, h
	call Function1017b0
	xor a
	ret
; 1017b0

Function1017b0: ; 1017b0
	ld a, c
	ld [wccb4], a
	push bc
	ld a, [wcd3a]
	dec a
	ld hl, wcd3b
	call Function10173b
	pop bc
	ld de, wccb5
	call CopyBytes
	ret
; 1017c7

Function1017c7: ; 1017c7
	ld a, [wcc60]
	ld c, a
	ld b, 0
	ld a, [wcd3a]
	dec a
	ld hl, wcd3e
	call Function10173b
	ld e, l
	ld d, h
	ld hl, wcc61
	ld a, [wcd3d]
	call FarCopyWRAM
	and a
	ret
; 1017e4

Function1017e4: ; 1017e4
	ld a, 0
	ld [wcd27], a
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 1017f1

Function1017f1: ; 1017f1
	call Function101418
	ret c

Function1017f5: ; 1017f5
	ld b, 0
	ld c, $01
	callba Function10079c
	ret c
	ld c, $01
	ld b, $03
	callba AdvanceMobileInactivityTimerAndCheckExpired
	ret c
	callba Function100382
	ld a, [wcd27]
	bit 7, a
	jr nz, .next
	ld hl, wcd29
	set 6, [hl]
	ret

.next
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 101826

Function101826: ; 101826
	ld a, [wcd21]
	cp $02
	jr z, .asm_101833
	cp $01
	jr z, .asm_101844
	jr .asm_101869

.asm_101833
	ld hl, Unknown_10186f
	ld de, wccb4
	call Function1013f5
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

.asm_101844
	callba Function103654
	ld a, c
	ld hl, Unknown_101882
	cp $01
	jr z, .asm_10185b
	ld hl, Unknown_101895
	cp $02
	jr z, .asm_10185b
	jr .asm_101869

.asm_10185b
	ld de, wccb4
	call Function1013f5
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

.asm_101869
	ld a, $fe
	ld [wcd2b], a
	ret
; 10186f


SECTION "ascii 10186f", ROMX

	charmap " ", $20 ; revert to ascii

Unknown_10186f:
	db .end - @
	db $19, $73, $09, $13, "trade_crystal"
.end	db 0

Unknown_101882:
	db .end - @
	db $19, $67, $10, $01, "free__crystal"
.end	db 0

Unknown_101895:
	db .end - @
	db $19, $67, $10, $01, "limit_crystal"
.end	db 0
; 1018a8


SECTION "bank40_3", ROMX

Function1018a8: ; 1018a8
	ld hl, wccb5
	ld de, wcc61
	ld a, $04
	call Function101406
	jr c, .asm_1018d0
	ld hl, wccb9
	ld de, wcc65
	ld a, $06
	call Function101406
	jr c, .asm_1018ca
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

.asm_1018ca
	ld a, $f6
	ld [wcd2b], a
	ret

.asm_1018d0
	ld a, $f5
	ld [wcd2b], a
	ret
; 1018d6

Function1018d6: ; 1018d6
	call Function1018ec
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 1018e1

Function1018e1: ; 1018e1
	call Function1018fb
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 1018ec

Function1018ec: ; 1018ec
	ld a, $0a
	ld hl, wccb4
	ld [hli], a
	ld c, a
.asm_1018f3
	call Random
	ld [hli], a
	dec c
	jr nz, .asm_1018f3
	ret
; 1018fb

Function1018fb: ; 1018fb
	ld a, [wcd2f]
	and a
	jr z, .asm_101906
	ld hl, wcc61
	jr .asm_101909

.asm_101906
	ld hl, wccb5

.asm_101909
	ld de, LinkBattleRNs
	ld bc, 10
	call CopyBytes
	ret
; 101913

Function101913: ; 101913
	ld hl, wcd2a
	set 0, [hl]
	xor a
	ld [wc30d], a
	ld hl, wcd29
	res 4, [hl]
	xor a
	ld [wc305], a
	ld hl, wcd29
	res 7, [hl]
	ld a, $90
	ld [hWY], a
	ld a, [wcd21]
	cp $01
	jr z, .asm_10193f
	cp $02
	jr z, .asm_101945
	ld a, $71
	ld [wMobileCommsJumptableIndex], a
	ret

.asm_10193f
	ld a, $66
	ld [wMobileCommsJumptableIndex], a
	ret

.asm_101945
	ld a, $65
	ld [wMobileCommsJumptableIndex], a
	ret
; 10194b

Function10194b: ; 10194b
	call DisableSpriteUpdates
	call ClearSprites
	callba Function1021f9
	ld hl, wcd29
	bit 3, [hl]
	jr nz, .asm_101967
	call Function1013c0
	ld a, $71
	ld [wMobileCommsJumptableIndex], a
	ret

.asm_101967
	ld a, $60
	ld [wMobileCommsJumptableIndex], a
	ret
; 10196d

_SelectMonsForMobileBattle: ; 10196d
	callba BlankScreen
	callba Mobile_CommunicationStandby
	ld hl, wcd29
	set 5, [hl]
	ld hl, wcd2a
	set 6, [hl]
	ld a, $06
	ld [wccb4], a
	ld hl, wPlayerMonSelection
	ld de, wccb5
	ld bc, 3
	call CopyBytes
	ld hl, wcd6c
	ld a, [hli]
	ld [wccb8], a
	ld a, [hli]
	ld [wccb9], a
	ld a, [hl]
	ld [wccba], a
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 1019ab

_StartMobileBattle: ; 1019ab
	call CopyOtherPlayersBattleMonSelection
	callba Function100754
	xor a
	ld [wdc5f], a
	ld [wdc60], a
	callba BlankScreen
	call SpeechTextBox
	callba Function100846
	ld c, 120
	call DelayFrames
	callba ClearTileMap
	call .CopyOTDetails
	call StartMobileBattle
	ld a, [wcd2b]
	cp $fc
	jr nz, .asm_1019e6
	xor a
	ld [wcd2b], a
.asm_1019e6
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 1019ee

.CopyOTDetails: ; 1019ee
	ld a, [rSVBK]
	push af
	ld a, 5
	ld [rSVBK], a

	ld bc, w5_dc0d
	ld de, w5_dc11
	callba GetMobileOTTrainerClass

	pop af
	ld [rSVBK], a

	ld a, c
	ld [OtherTrainerClass], a
	ld hl, OTPlayerName
	ld de, OTClassName
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, [wcd2f]
	and a
	ld a, 2
	jr z, .got_link_player_number
	ld a, 1
.got_link_player_number
	ld [hLinkPlayerNumber], a
	ret
; 101a21

StartMobileBattle: ; 101a21
	; force stereo and fast text speed
	ld hl, Options
	ld a, [hl]
	push af
	and (1 << STEREO)
	or 1 ; 1 frame per character i.e. fast text
	ld [hl], a
	ld a, 1
	ld [wDisableTextAcceleration], a
	callba BattleIntro
	callba DoBattle
	callba ShowLinkBattleParticipantsAfterEnd
	xor a
	ld [wDisableTextAcceleration], a
	ld a, $ff
	ld [hLinkPlayerNumber], a
	pop af
	ld [Options], a
	ret
; 101a4f

Function101a4f: ; 101a4f
	ld a, 1
	ld [wDisableTextAcceleration], a
	callba DetermineMobileBattleResult
	xor a
	ld [wDisableTextAcceleration], a
	callba CleanUpBattleRAM
	callba LoadPokemonData
	call Function1013c0
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 101a75

CopyOtherPlayersBattleMonSelection: ; 101a75
	ld hl, wcc61
	ld de, wOTMonSelection
	ld bc, 3
	call CopyBytes
	ld de, wcc64
	callba Function100772
	callba Function101050
	callba LoadSelectedPartiesForColosseum
	ret
; 101a97

Function101a97: ; 101a97
	callba Function115d99
	ld hl, wcd29
	set 7, [hl]
	ld c, $02
	call Function10142c
	ld hl, wcd29
	set 6, [hl]
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 101ab4

Function101ab4: ; 101ab4
	ld e, $01
	call Function101ee4
	ld hl, wcd29
	set 5, [hl]
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 101ac6

Function101ac6: ; 101ac6
	callba Function115d99
	ld hl, wcd29
	set 7, [hl]
	ld c, $02
	call Function10142c
	ld hl, wcd29
	set 6, [hl]
	xor a
	ld [wcd2f], a
	ld de, wdc42
	call Function102068
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 101aed

Function101aed: ; 101aed
	callba Function115d99
	ld hl, wcd29
	set 7, [hl]
	ld c, $02
	call Function10142c
	ld hl, wcd29
	set 6, [hl]
	ld a, $01
	ld [wcd2f], a
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 101b0f

Function101b0f: ; 101b0f
	ld c, 0
	call Function10142c
	ld e, $03
	call Function101ee4
	ld hl, wcd29
	set 5, [hl]
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ld a, 0
	ld [wcd26], a
	ret
; 101b2b

Function101b2b: ; 101b2b
	callba Function100579
	ld hl, wcd29
	set 2, [hl]
	ld a, [wcd26]
	bit 7, a
	ret z
	call Function1013dd
	ld a, 0
	ld [wcd26], a
	ld a, [wMenuCursorY]
	cp $01
	jr z, .asm_101b51
	ld a, $02
	ld [wcd2b], a
	ret

.asm_101b51
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 101b59

Function101b59: ; 101b59
	ld c, $02
	call Function10142c
	ld e, $02
	call Function101ee4
	ld hl, wcd29
	set 5, [hl]
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 101b70

Function101b70: ; 101b70
	ld c, $02
	call Function10142c
	ld e, $04
	call Function101ee4
	ld hl, wcd29
	set 5, [hl]
	call UpdateSprites
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ld a, 0
	ld [wcd26], a
	ret
; 101b8f

Function101b8f: ; 101b8f
	callba Function1005c3
	ld hl, wcd29
	set 2, [hl]
	ld a, [wcd26]
	bit 7, a
	ret z
	call Function1013dd
	ld a, 0
	ld [wcd26], a
	ld a, [wMenuCursorY]
	cp $01
	jr z, .asm_101bbc
	ld a, $01
	ld [wcd2f], a
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

.asm_101bbc
	xor a
	ld [wcd2f], a
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 101bc8

Function101bc8: ; 101bc8
	ld c, $02
	call Function10142c
	ld e, $08
	call Function101ee4
	call Function102048
	call Function1013dd
	ld a, 0
	ld [wcd26], a
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 101be5

Function101be5: ; 101be5
	callba Function100579
	ld hl, wcd29
	set 2, [hl]
	ld a, [wcd26]
	bit 7, a
	ret z
	call Function1013dd
	ld a, 0
	ld [wcd26], a
	ld a, [wMenuCursorY]
	cp $01
	jr nz, .asm_101c0b
	ld a, $2a
	ld [wMobileCommsJumptableIndex], a
	ret

.asm_101c0b
	ld a, $02
	ld [wcd2b], a
	ret
; 101c11

Function101c11: ; 101c11
	ld a, $01
	ld [wdc5f], a
	ld e, $09
	call Function101ee4
	call Function102048
	ld hl, wcd29
	set 5, [hl]
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 101c2b

Function101c2b: ; 101c2b
	ld a, $02
	ld [wdc5f], a
	ld e, $07
	call Function101ee4
	ld hl, wcd29
	set 5, [hl]
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 101c42

Function101c42: ; 101c42
	ld hl, wcd2a
	set 1, [hl]
	call Function100665
	ld a, $47
	ld [wMobileCommsJumptableIndex], a
	ret
; 101c50

Function101c50: ; 101c50
	ld e, $0a
	call Function101ee4
	ld hl, wcd29
	set 2, [hl]
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 101c62

Function101c62: ; 101c62
	callba Function115d99
	ld hl, wcd29
	set 7, [hl]
	ld c, $01
	call Function10142c
	xor a
	ld [wc30d], a
	ld hl, wcd29
	res 4, [hl]
	ld e, $0b
	call Function101ee4
	ld hl, wcd29
	set 5, [hl]
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ld a, 0
	ld [wcd26], a
	ret
; 101c92

Function101c92: ; 101c92
	callba Function100675
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 101ca0

Function101ca0: ; 101ca0
	ld c, $02
	call Function10142c
	ld e, $0c
	call Function101ee4
	ld hl, wcd29
	set 5, [hl]
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ld a, 0
	ld [wcd26], a
	ret
; 101cbc

Function101cbc: ; 101cbc
	ld a, $01
	ld [wcd2b], a
	ret
; 101cc2

Function101cc2: ; 101cc2 ; unreferenced
	ld a, $02
	ld [wcd2b], a
	ret
; 101cc8

Function101cc8: ; 101cc8
	ld a, $01
	ld [wc314], a
	ld a, $01
	ld [wc30d], a
	ld hl, wcd29
	set 4, [hl]
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 101cdf

Function101cdf: ; 101cdf
	ld a, $06
	ld [wc314], a
	ld a, $01
	ld [wc30d], a
	ld hl, wcd29
	set 4, [hl]
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 101cf6

Function101cf6: ; 101cf6
	ld a, $0b
	ld [wc314 + 1], a
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 101d03

Function101d03: ; 101d03
	ld a, $0e
	ld [wc314 + 1], a
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 101d10

Function101d10: ; 101d10
	ld c, $01
	call Function10142c
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	jr Function101d2a

Function101d1e: ; 101d1e
	ld c, $03
	call Function10142c
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a

Function101d2a: ; 101d2a
	call Function101418
	ret c
	ld hl, wcd29
	set 6, [hl]
	ld a, [wcd26]
	ld hl, Jumptable_101d4d
	rst JumpTable
	ld a, [wcd26]
	bit 7, a
	ret z
	ld a, 0
	ld [wcd26], a
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 101d4d

Jumptable_101d4d: ; 101d4d
	dw Function101d51
	dw Function101d5d
; 101d51

Function101d51: ; 101d51
	ld a, $3c
	ld [wcd42], a
	ld a, [wcd26]
	inc a
	ld [wcd26], a

Function101d5d: ; 101d5d
	ld hl, wcd42
	dec [hl]
	ret nz
	ld a, [wcd26]
	set 7, a
	ld [wcd26], a
	ret
; 101d6b

Function101d6b: ; 101d6b
	ld a, [wc30d]
	and a
	ret nz
	ld hl, wcd29
	res 4, [hl]
	ld a, $64
	ld [wMobileCommsJumptableIndex], a
	ret
; 101d7b

Function101d7b: ; 101d7b
	callba Function10138b
	ld b, 0
	ld hl, Unknown_101d8d
	add hl, bc
	ld c, [hl]
	ld a, c
	ld [wMobileCommsJumptableIndex], a
	ret
; 101d8d

Unknown_101d8d: ; 101d8d
	db $15, $15, $1f, $1f, $0c, $12, $3a, $3a
; 101d95

Function101d95: ; 101d95
	call Function101ee2
	call LoadStandardMenuDataHeader
	ld e, $0e
	call Function101ee4
	ld hl, wcd29
	set 5, [hl]
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ld a, 0
	ld [wcd26], a
	ret
; 101db2

Function101db2: ; 101db2
	callba Function103302
	call ExitMenu
	ld hl, wcd29
	set 5, [hl]
	jr c, .asm_101dca
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

.asm_101dca
	ld a, $02
	ld [wcd2b], a
	ret
; 101dd0

Function101dd0: ; 101dd0
	ld hl, wdc41
	bit 1, [hl]
	jr nz, .asm_101ddd
	ld a, $19
	ld [wMobileCommsJumptableIndex], a
	ret

.asm_101ddd
	ld a, $1b
	ld [wMobileCommsJumptableIndex], a
	ret
; 101de3

Function101de3: ; 101de3
	call Function101ecc
	call Function101ead
	jr c, .asm_101df3
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

.asm_101df3
	call Function101e98
	jr c, .asm_101e00
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

.asm_101e00
	call Function101ed3
	ld a, $02
	ld [wcd2b], a
	ret
; 101e09

Function101e09: ; 101e09
	call Function101ead
	jr c, .asm_101e16
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

.asm_101e16
	call Function101ecc
	call Function101e98
	push af
	call Function101ed3
	pop af
	jr c, .asm_101e2b
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

.asm_101e2b
	ld a, $02
	ld [wcd2b], a
	ret
; 101e31

Function101e31: ; 101e31
	ld a, $3a
	ld [wMobileCommsJumptableIndex], a
	jp Function101c2b
; 101e39

Function101e39: ; 101e39
	call Function1020bf
	push af
	call Function101ed3
	pop af
	jr c, .asm_101e49
	ld a, $2a
	ld [wMobileCommsJumptableIndex], a
	ret

.asm_101e49
	ld a, $02
	ld [wcd2b], a
	ret
; 101e4f

Function101e4f: ; 101e4f
	ld e, $06
	call Function101ee4
	call Function1013d6
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ld a, 0
	ld [wcd26], a
	ret
; 101e64

Function101e64: ; 101e64
	call Function101ecc
	call Function1020a8
	push af
	call Function101ed3
	pop af
	jr c, .asm_101e77
	ld a, $24
	ld [wMobileCommsJumptableIndex], a
	ret

.asm_101e77
	ld hl, wcd29
	set 5, [hl]
	ld a, $02
	ld [wcd2b], a
	ret
; 101e82

Function101e82: ; 101e82 ; unreferenced
	call Function101ecc
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 101e8d

Function101e8d: ; 101e8d ; unreferenced
	call Function101ed3
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret
; 101e98

Function101e98: ; 101e98
	call ClearSprites
	callba Function8adb3
	ret c
	ld hl, GameTimerPause
	set 7, [hl]
	ld hl, wdc41
	set 4, [hl]
	ret
; 101ead

Function101ead: ; 101ead
	ld hl, GameTimerPause
	bit 7, [hl]
	jr nz, .asm_101ec8
	ld hl, wdc41
	bit 2, [hl]
	jr z, .asm_101eca
	ld a, [wcd2f]
	and a
	jr nz, .asm_101ec8
	ld hl, wdc41
	bit 1, [hl]
	jr z, .asm_101eca

.asm_101ec8
	xor a
	ret

.asm_101eca
	scf
	ret
; 101ecc

Function101ecc: ; 101ecc
	call Function101ee2
	call FadeToMenu
	ret
; 101ed3

Function101ed3: ; 101ed3
	call Function1013aa
	callba Function115d99
	ld hl, wcd29
	set 7, [hl]
	ret
; 101ee2

Function101ee2: ; 101ee2
	ld e, 0

Function101ee4: ; 101ee4
	ld d, 0
	ld hl, Unknown_101ef5
	add hl, de
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	callba Function100504
	ret
; 101ef5

Unknown_101ef5: ; 101ef5
	dw String_101f13
	dw String_101f14
	dw String_101f32
	dw String_101f4f
	dw String_101f69
	dw String_101f81
	dw String_101f93
	dw String_101faa
	dw String_101fc5
	dw String_101fd2
	dw String_101fe1
	dw String_101fef
	dw String_102000
	dw String_10200c
	dw String_102014

String_101f13: ; 101f13
	db "@"

String_101f14: ; 101f14
	db   "モバイルアダプタを つかって"
	next "おともだちと つうしんします@"

String_101f32: ; 101f32
	db   "でんわを かけるひとには"
	next "つうわりょうきんが かかります@"

String_101f4f: ; 101f4f
	db   "モバイルアダプタの じゅんびは"
	next "できて いますか?@"

String_101f69: ; 101f69
	db   "あなたが おともだちに"
	next "でんわを かけますか?@"

String_101f81: ; 101f81
	db   "めいしフ,ルダーを"
	next "つかいますか?@"

String_101f93: ; 101f93
	db   "でんわばんごうを にゅうりょく"
	next "してください@"

String_101faa: ; 101faa
	db   "それでは おともだちからの"
	next "でんわを おまちします…@"

String_101fc5: ; 101fc5
	next "に でんわを かけます@"

String_101fd2: ; 101fd2
	next "に でんわを かけています@"

String_101fe1: ; 101fe1
	db   "でんわが つながりました!@"

String_101fef: ; 101fef
	db   "つうわを"
	next "しゅうりょう します…@"

String_102000: ; 102000
	db   "つうしん しゅうりょう@"

String_10200c: ; 10200c
	db   "つうわ じかん@"

String_102014: ; 102014
	db   "それでは つうしんの"
	next "せっていを してください@"
; 10202c

Function10202c: ; 10202c
	callba Function115d99
	ld hl, wcd29
	set 7, [hl]
	ld c, $02
	call Function10142c
	ld e, $0d
	call Function101ee4
	hlcoord 4, 4
	call Function100681
	ret
; 102048

Function102048: ; 102048
	call Function10204c
	ret
; 10204c

Function10204c: ; 10204c
	hlcoord 3, 2
	ld c, $10
	ld de, wcd53
.asm_102054
	ld a, [de]
	inc de
	and a
	jr z, .asm_102067
	sub $30
	jr c, .asm_102067
	cp $0a
	jr nc, .asm_102067
	add $f6
	ld [hli], a
	dec c
	jr nz, .asm_102054

.asm_102067
	ret
; 102068

Function102068: ; 102068
	ld hl, wcd53
	ld c, $08
.asm_10206d
	ld a, [de]
	call Function102080
	jr c, .asm_10207f
	ld a, [de]
	swap a
	call Function102080
	jr c, .asm_10207f
	inc de
	dec c
	jr nz, .asm_10206d

.asm_10207f
	ret
; 102080

Function102080: ; 102080
	and $0f
	cp $0f
	jr z, .asm_10208a
	add $30
	ld [hli], a
	ret

.asm_10208a
	ld [hl], 0
	scf
	ret
; 10208e

Function10208e: ; 10208e
	push de
	ld h, d
	ld l, e
	ld de, wdc42
	ld bc, 8
	call CopyBytes
	pop de
	ret
; 10209c

Function10209c: ; 10209c
	ld a, $ff
	ld hl, wdc42
	ld bc, 8
	call ByteFill
	ret
; 1020a8

Function1020a8: ; 1020a8
	call Function10209c
	ld c, $01
	ld de, wdc42
	callba Function17a68f
	ret c
	call Function10208e
	call Function102068
	xor a
	ret
; 1020bf

Function1020bf: ; 1020bf
	call ClearSprites
	callba Function8aba9
	ld a, c
	and a
	jr z, .asm_1020e8
	dec a
	ld hl, $a04c
	ld bc, $25
	call AddNTimes
	ld d, h
	ld e, l
	ld a, $04
	call GetSRAMBank
	call Function10208e
	call Function102068
	call CloseSRAM
	xor a
	ret

.asm_1020e8
	scf
	ret
; 1020ea

Function1020ea: ; 1020ea
	ld hl, wdc41
	bit 4, [hl]
	jr z, .quit
	ld hl, wdc41
	bit 2, [hl]
	jr nz, .quit
	call Function10218d
	ld hl, wc608
	bit 4, [hl]
	jr z, .quit
	ld hl, wc608
	bit 2, [hl]
	jr nz, .quit
	call Function102112
	jr z, .quit
	and a
	ret

.quit
	scf
	ret
; 102112

Function102112: ; 102112
	ld a, $04
	call GetSRAMBank
	ld hl, $a041
	ld c, 40
.outer_loop
	push hl
	ld de, $c60f
	ld b, 31
.inner_loop
	ld a, [de]
	cp [hl]
	jr nz, .not_matching
	inc de
	inc hl
	dec b
	jr nz, .inner_loop
	pop hl
	xor a
	jr .done

.not_matching
	pop hl
	ld de, 37
	add hl, de
	dec c
	jr nz, .outer_loop
	ld a, $01
	and a
	jr .done ; useless jr

.done
	push af
	call CloseSRAM
	pop af
	ret
; 102142

Function102142: ; 102142
	call Function10218d
	call Function102180
	ld hl, UnknownText_0x1021d1
	call MenuTextBox
	ld de, SFX_LEVEL_UP
	call PlaySFX
	call JoyWaitAorB
	call ExitMenu
	call Function10219f
	ld hl, UnknownText_0x1021d6
	call MenuTextBox
	call YesNoBox
	call ExitMenu
	jr c, .asm_10217c
	call Function1021b8
	jr c, .asm_10217c
	call Function10218d
	call Function102180
	ld hl, UnknownText_0x1021db
	call PrintText

.asm_10217c
	call Function1013d6
	ret
; 102180

Function102180: ; 102180
	ld hl, wc608 + 1
	ld de, StringBuffer2
	ld bc, 11
	call CopyBytes
	ret
; 10218d

Function10218d: ; 10218d
	ld hl, w5_dc00
	ld de, wc608
	ld bc, $26
	ld a, $05
	call FarCopyWRAM
	ld de, wc608 + 1 ; useless
	ret
; 10219f

Function10219f: ; 10219f
	call FadeToMenu
	call Function10218d
	ld de, wc608 + 1
	callba Function8ac4e
	call JoyWaitAorB
	call PlayClickSFX
	call Function1013aa
	ret
; 1021b8

Function1021b8: ; 1021b8
	call FadeToMenu
	call Function10218d
	ld de, wPlayerMoveStruct
	callba Function8ac70
	ld a, c
	ld [StringBuffer1], a
	push af
	call Function1013aa
	pop af
	ret
; 1021d1

UnknownText_0x1021d1: ; 1021d1
	text_jump UnknownText_0x1bd19a
	db "@"

UnknownText_0x1021d6: ; 1021d1
	text_jump UnknownText_0x1bd1ba
	db "@"

UnknownText_0x1021db: ; 1021d1
	text_jump UnknownText_0x1bd1dd
	db "@"
; 1021e0

Function1021e0: ; 1021e0
	call MenuTextBox
	call JoyWaitAorB
	call ExitMenu
	ret
; 1021ea

UnknownText_0x1021ea: ; 1021ea
	text_jump UnknownText_0x1bd201
	db "@"

UnknownText_0x1021ef:
	text_jump UnknownText_0x1bd211
	db "@"

UnknownText_0x1021f4:
	text_jump UnknownText_0x1bd223
	db "@"
; 1021f9

Function1021f9: ; 1021f9
	call Function102233
	ld a, $0 ; Function10234b
	ld [wcd49], a
	ld hl, wcd29
	bit 3, [hl]
	res 3, [hl]
	jr z, .asm_10220f
	ld a, $1 ; Function102361
	ld [wcd49], a

.asm_10220f
	call Function1022ca
	ld a, [wcd49]
	ld hl, Jumptable_1022f5
	rst JumpTable
	call Function102241
	call Function1022d0
	jr c, .asm_102231
	ld a, [wcd49]
	bit 7, a
	jr z, .asm_10220f
	xor a
	ld hl, wcd29
	bit 3, [hl]
	ret z
	scf
	ret

.asm_102231
	xor a
	ret
; 102233

Function102233: ; 102233
	ld hl, wcd49
	ld bc, 10
	xor a
	call ByteFill
	call Function10304f
	ret
; 102241

Function102241: ; 102241
	call Function10226a
	call Function102274
	call Function10224b
	ret
; 10224b

Function10224b: ; 10224b
	ld hl, wcd4b
	bit 1, [hl]
	jr nz, .asm_10225e
	bit 2, [hl]
	jr nz, .asm_10225e
	call DelayFrame
	call DelayFrame
	xor a
	ret

.asm_10225e
	res 1, [hl]
	res 2, [hl]
	callba Mobile_ReloadMapPart
	scf
	ret
; 10226a

Function10226a: ; 10226a
	ld hl, wcd4b
	bit 0, [hl]
	ret z
	call Function10305d
	ret
; 102274

Function102274: ; 102274
	ld hl, wcd4b
	bit 3, [hl]
	ret z
	res 3, [hl]
	ld de, 8
	call PlaySFX
	ret
; 102283

Function102283: ; 102283
	ld a, $01
	ld [AttrMapEnd], a
	ld hl, wcd4b
	set 0, [hl]
	ret
; 10228e

Function10228e: ; 10228e
	xor a
	ld [AttrMapEnd], a
	ld hl, wcd4b
	res 0, [hl]
	ret
; 102298

Function102298: ; 102298
	ld a, e
	cp $02
	ret nz
	ld hl, wcd4b
	bit 6, [hl]
	jr z, .asm_1022b6
	ld hl, wcd4b
	bit 7, [hl]
	ld hl, wcd4b
	set 7, [hl]
	ret nz
	ld de, SFX_ELEVATOR_END
	call PlaySFX
	jr .asm_1022c1

.asm_1022b6
	ld hl, wcd4b
	bit 7, [hl]
	ld hl, wcd4b
	res 7, [hl]
	ret z

.asm_1022c1
	call Function10304f
	ld a, $01
	ld [AttrMapEnd], a
	ret
; 1022ca

Function1022ca: ; 1022ca
	ld a, 30
	ld [OverworldDelay], a
	ret
; 1022d0

Function1022d0: ; 1022d0
	callba Function10032e
	ld a, [wcd2b]
	and a
	jr nz, .asm_1022f3
	call Function102298
	ld a, [OverworldDelay]
	ld c, a
	ld a, 30
	sub c
	ld c, a
	ld b, $03
	callba AdvanceMobileInactivityTimerAndCheckExpired
	jr c, .asm_1022f3
	xor a
	ret

.asm_1022f3
	scf
	ret
; 1022f5

Jumptable_1022f5: ; 1022f5
	dw Function10234b ; 00
	dw Function102361 ; 01
	dw Function10236e ; 02
	dw Function102387 ; 03
	dw Function1023a1 ; 04
	dw Function1025c7 ; 05
	dw Function1025dc ; 06
	dw Function1024f6 ; 07
	dw Function10250c ; 08
	dw Function1024a8 ; 09
	dw Function102591 ; 0a
	dw Function1024a8 ; 0b
	dw Function1025b0 ; 0c
	dw Function1025bd ; 0d
	dw Function102814 ; 0e
	dw Function10283c ; 0f
	dw Function102862 ; 10
	dw Function10286f ; 11
	dw Function1024a8 ; 12
	dw Function1028a5 ; 13
	dw Function1028ab ; 14
	dw Function1023b5 ; 15
	dw Function1023c6 ; 16
	dw Function1024af ; 17
	dw Function102416 ; 18
	dw Function102423 ; 19
	dw Function10244b ; 1a
	dw Function1024af ; 1b
	dw Function10246a ; 1c
	dw Function102652 ; 1d
	dw Function10266b ; 1e
	dw Function1025e9 ; 1f
	dw Function1025ff ; 20
	dw Function102738 ; 21
	dw Function102754 ; 22
	dw Function1026b7 ; 23
	dw Function1026c8 ; 24
	dw Function1028bf ; 25
	dw Function1028c6 ; 26
	dw Function1028d3 ; 27
	dw Function1028da ; 28
	dw Function1024a8 ; 29
	dw Function10248d ; 2a
; 10234b

Function10234b: ; 10234b
	call Function102d9a
	call Function102dd3
	call Function102dec
	ld hl, wcd4b
	set 1, [hl]
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret
; 102361

Function102361: ; 102361
	ld a, $cc
	call Function1028e8
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret
; 10236e

Function10236e: ; 10236e
	call Function1028fc
	ret nc
	ld a, [wcd51]
	cp $cc
	jr z, .asm_10237f
	ld a, $f2
	ld [wcd2b], a
	ret

.asm_10237f
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret
; 102387

Function102387: ; 102387
	ld hl, wcd4b
	set 6, [hl]
	xor a
	ld [wdc5f], a
	ld de, MUSIC_ROUTE_30
	call PlayMusic
	call Function102d9a
	call Function102dd3
	ld a, $01
	ld [wMenuCursorY], a

Function1023a1: ; 1023a1
	call Function102283
	call Function102db7
	call Function102dec
	ld hl, wcd4b
	set 1, [hl]
	ld a, $1d
	ld [wcd49], a
	ret
; 1023b5

Function1023b5: ; 1023b5
	call Function10228e
	call Function102a3b
	call Function102b12
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret
; 1023c6

Function1023c6: ; 1023c6
	call Function102c48
	call Function102c87
	ld a, [wcd4c]
	dec a
	ld [CurPartyMon], a
	xor a
	ld [wd10b], a
	callba RemoveMonFromPartyOrBox
	ld hl, PartyCount
	inc [hl]
	ld a, [hli]
	ld c, a
	ld b, 0
	add hl, bc
	ld [hl], $ff
	ld a, [PartyCount]
	ld [wcd4c], a
	call Function102c07
	call Function102d48
	call Function102b32
	call Function102f50
	ld hl, wcd4b
	set 1, [hl]
	ld a, $14
	ld [wcd4e], a
	ld a, 0
	ld [wcd4f], a
	ld a, 0
	ld [wcd4a], a
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret
; 102416

Function102416: ; 102416
	ld a, $aa
	call Function1028e8
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret
; 102423

Function102423: ; 102423
	call Function102921
	ret nc
	callba SaveAfterLinkTrade
	callba TrainerRankings_Trades
	callba BackupMobileEventIndex
	ld hl, wcd4b
	set 1, [hl]
	ld a, 0
	ld [wcd4a], a
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret
; 10244b

Function10244b: ; 10244b
	call Function102f32
	ld hl, wcd4b
	set 1, [hl]
	ld a, $19
	ld [wcd4e], a
	ld a, 0
	ld [wcd4f], a
	ld a, 0
	ld [wcd4a], a
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret
; 10246a

Function10246a: ; 10246a
	call Function102d9a
	ld hl, wcd29
	set 3, [hl]
	call Function102e07
	ld hl, wcd4b
	set 1, [hl]
	ld a, $2a
	ld [wcd49], a
	ret
; 102480

Function102480: ; 102480
	ld c, $32
	call DelayFrames
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret
; 10248d

Function10248d: ; 10248d
	ld a, [wcd49]
	set 7, a
	ld [wcd49], a
	ret
; 102496

Function102496: ; 102496
	ld hl, wcd4e
	dec [hl]
	ret nz
	ld a, 0
	ld [wcd4a], a
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret
; 1024a8

Function1024a8: ; 1024a8
	callba Function1009f3
	ret c

Function1024af: ; 1024af
	call GetJoypad
	ld a, [wcd4a]
	ld hl, Jumptable_1024ba
	rst JumpTable
	ret
; 1024ba

Jumptable_1024ba: ; 1024ba
	dw Function1024c0
	dw Function1024cb
	dw Function1024de
; 1024c0

Function1024c0: ; 1024c0
	ld hl, wcd4e
	inc [hl]
	ld a, [wcd4a]
	inc a
	ld [wcd4a], a

Function1024cb: ; 1024cb
	ld hl, wcd4e
	dec [hl]
	ret nz
	ld a, [wcd4f]
	inc a
	ld [wcd4e], a
	ld a, [wcd4a]
	inc a
	ld [wcd4a], a

Function1024de: ; 1024de
	ld hl, wcd4e
	dec [hl]
	jr z, .asm_1024e9
	ld a, [hJoyPressed]
	and A_BUTTON | B_BUTTON
	ret z

.asm_1024e9
	ld a, 0
	ld [wcd4a], a
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret
; 1024f6

Function1024f6: ; 1024f6
	call PlaceHollowCursor
	ld hl, wcd4b
	set 1, [hl]
	ld a, [wcd4c]
	call Function1028e8
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret
; 10250c

Function10250c: ; 10250c
	call Function1028fc
	ret nc
	ld a, [wcd51]
	cp $0f
	jr z, .asm_10254b
	and a
	jr z, .asm_102572
	cp $aa
	jr z, .asm_102572
	cp $07
	jr nc, .asm_102572
	ld [wcd4d], a
	dec a
	ld [wd003], a
	ld a, [wcd4c]
	dec a
	ld [wd002], a
	call Function102b9c
	call Function102bdc
	jr c, .asm_10256d
	callba Functionfb5dd
	jr c, .asm_102568
	ld hl, wcd4b
	set 1, [hl]
	ld a, $0e
	ld [wcd49], a
	ret

.asm_10254b
	call Function103021
	ld hl, wcd4b
	set 1, [hl]
	ld a, 0
	ld [wcd4a], a
	ld a, $1e
	ld [wcd4e], a
	ld a, $1e
	ld [wcd4f], a
	ld a, $29
	ld [wcd49], a
	ret

.asm_102568
	call Function102ff5
	jr .asm_102577

.asm_10256d
	call Function102f85
	jr .asm_102577

.asm_102572
	call Function102fce
	jr .asm_102577

.asm_102577
	ld hl, wcd4b
	set 1, [hl]
	ld a, 0
	ld [wcd4a], a
	ld a, $1e
	ld [wcd4e], a
	ld a, $3c
	ld [wcd4f], a
	ld a, $09
	ld [wcd49], a
	ret
; 102591

Function102591: ; 102591
	call Function102ee7
	ld hl, wcd4b
	set 1, [hl]
	ld a, 0
	ld [wcd4a], a
	ld a, $1e
	ld [wcd4e], a
	ld a, $3c
	ld [wcd4f], a
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret
; 1025b0

Function1025b0: ; 1025b0
	ld a, $09
	call Function1028e8
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret
; 1025bd

Function1025bd: ; 1025bd
	call Function1028fc
	ret nc
	ld a, $04
	ld [wcd49], a
	ret
; 1025c7

Function1025c7: ; 1025c7
	call Function102f6d
	ld hl, wcd4b
	set 1, [hl]
	ld a, $0f
	call Function1028e8
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret
; 1025dc

Function1025dc: ; 1025dc
	call Function1028fc
	ret nc
	ld a, [wcd49]
	set 7, a
	ld [wcd49], a
	ret
; 1025e9

Function1025e9: ; 1025e9
	nop
	ld hl, wcd4b
	set 6, [hl]
	call Function102b4e
	ld hl, wcd4b
	set 1, [hl]
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret
; 1025ff

Function1025ff: ; 1025ff
	ld hl, wcd4b
	set 2, [hl]
	callba Function1009f3
	ret c
	callba MobileMenuJoypad
	ld a, [wMenuJoypadFilter]
	and c
	ret z
	bit A_BUTTON_F, c
	jr nz, .a_button
	bit D_UP_F, c
	jr nz, .d_up
	bit D_DOWN_F, c
	jr nz, .d_down
	ret

.a_button
	ld hl, wcd4b
	set 3, [hl]
	ld a, $27 ; Function1028d3
	ld [wcd49], a
	ret

.d_up
	ld a, [wMenuCursorY]
	ld b, a
	ld a, [OTPartyCount]
	cp b
	ret nz
	call HideCursor
	ld a, [PartyCount]
	ld [wMenuCursorY], a
	ld a, $1d ; Function102652
	ld [wcd49], a
	ret

.d_down
	ld a, [wMenuCursorY]
	cp $01
	ret nz
	ld a, $23 ; Function1026b7
	ld [wcd49], a
	ret
; 102652

Function102652: ; 102652
	nop
	ld hl, wcd4b
	set 6, [hl]
	nop
	call Function102b7b
	nop
	ld hl, wcd4b
	set 1, [hl]
	nop
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret
; 10266b

Function10266b: ; 10266b
	ld hl, wcd4b
	set 2, [hl]
	callba Function1009f3
	ret c
	callba MobileMenuJoypad
	ld a, [wMenuJoypadFilter]
	and c
	ret z
	bit A_BUTTON_F, c
	jr nz, .a_button
	bit D_DOWN_F, c
	jr nz, .d_down
	bit D_UP_F, c
	jr nz, .d_up
	ret

.a_button
	ld hl, wcd4b
	set 3, [hl]
	ld a, $21 ; Function102738
	ld [wcd49], a
	ret

.d_down
	ld a, [wMenuCursorY]
	dec a
	ret nz
	call HideCursor
	ld a, $1f ; Function1025e9
	ld [wcd49], a
	ret

.d_up
	ld a, [wMenuCursorY]
	ld b, a
	ld a, [PartyCount]
	cp b
	ret nz
	ld a, $23 ; Function1026b7
	ld [wcd49], a
	ret
; 1026b7

Function1026b7: ; 1026b7
	ld hl, wcd4b
	set 6, [hl]
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ld a, 0
	ld [wcd4a], a

Function1026c8: ; 1026c8
	call GetJoypad
	callba Function1009f3
	ret c
	ld a, [wcd4a]
	ld hl, Jumptable_1026da
	rst JumpTable
	ret
; 1026da

Jumptable_1026da: ; 1026da
	dw Function1026de
	dw Function1026f3
; 1026de

Function1026de: ; 1026de
	call HideCursor
	hlcoord 9, 17
	ld [hl], $ed
	ld a, [wcd4a]
	inc a
	ld [wcd4a], a
	ld hl, wcd4b
	set 1, [hl]
	ret
; 1026f3

Function1026f3: ; 1026f3
	ld a, [hJoyPressed]
	bit A_BUTTON_F, a
	jr nz, .asm_102723
	bit D_UP_F, a
	jr nz, .asm_102712
	bit D_DOWN_F, a
	jr nz, .asm_102702
	ret

.asm_102702
	hlcoord 9, 17
	ld [hl], " "
	ld a, $01
	ld [wMenuCursorY], a
	ld a, $1d ; Function102652
	ld [wcd49], a
	ret

.asm_102712
	hlcoord 9, 17
	ld [hl], " "
	ld a, [OTPartyCount]
	ld [wMenuCursorY], a
	ld a, $1f ; Function1025e9
	ld [wcd49], a
	ret

.asm_102723
	hlcoord 9, 17
	ld [hl], "▷"
	ld hl, wcd4b
	set 3, [hl]
	ld hl, wcd4b
	set 2, [hl]
	ld a, $5 ; Function1025c7
	ld [wcd49], a
	ret
; 102738

Function102738: ; 102738
	ld hl, wcd4b
	set 6, [hl]
	call PlaceHollowCursor
	call Function1027eb
	ld hl, wcd4b
	set 1, [hl]
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ld a, 0
	ld [wcd4a], a

Function102754: ; 102754
	call GetJoypad
	callba Function1009f3
	ret c
	ld a, [wcd4a]
	ld hl, Jumptable_102766
	rst JumpTable
	ret
; 102766

Jumptable_102766: ; 102766
	dw Function102770
	dw Function102775
	dw Function10278c
	dw Function1027a0
	dw Function1027b7
; 102770

Function102770: ; 102770
	ld a, $01
	ld [wcd4a], a

Function102775: ; 102775
	hlcoord 1, 16
	ld [hl], "▶"
	hlcoord 11, 16
	ld [hl], " "
	ld hl, wcd4b
	set 2, [hl]
	ld a, [wcd4a]
	inc a
	ld [wcd4a], a
	ret
; 10278c

Function10278c: ; 10278c
	ld a, [hJoyPressed]
	bit A_BUTTON_F, a
	jr nz, asm_1027c6
	bit B_BUTTON_F, a
	jr nz, asm_1027e2
	bit D_RIGHT_F, a
	jr nz, .asm_10279b
	ret

.asm_10279b
	ld a, $03
	ld [wcd4a], a
Function1027a0: ; 1027a0
	hlcoord 1, 16
	ld [hl], " "
	hlcoord 11, 16
	ld [hl], "▶"
	ld hl, wcd4b
	set 2, [hl]
	ld a, [wcd4a]
	inc a
	ld [wcd4a], a
	ret

Function1027b7: ; 1027b7
	ld a, [hJoyPressed]
	bit A_BUTTON_F, a
	jr nz, asm_1027d1
	bit B_BUTTON_F, a
	jr nz, asm_1027e2
	bit D_LEFT_F, a
	jr nz, Function102770
	ret

asm_1027c6:
	ld hl, wcd4b
	set 3, [hl]
	ld a, $25 ; Function1028bf
	ld [wcd49], a
	ret

asm_1027d1:
	ld hl, wcd4b
	set 3, [hl]
	ld a, [wMenuCursorY]
	ld [wcd4c], a
	ld a, $7 ; Function1024f6
	ld [wcd49], a
	ret

asm_1027e2:
	call Function102db7
	ld a, $1d ; Function102652
	ld [wcd49], a
	ret
; 1027eb

Function1027eb: ; 1027eb
	hlcoord 0, 14
	ld b, 2
	ld c, 18
	ld d, h
	ld e, l
	callba _LinkTextbox
	ld de, .Stats_Trade
	hlcoord 2, 16
	call PlaceString
	ret
; 102804

.Stats_Trade: ; 102804
	db "STATS     TRADE@"
; 102814

Function102814: ; 102814
	ld a, [wMenuCursorY]
	ld [wcd52], a
	ld a, [wcd4c]
	dec a
	ld [wd002], a
	ld a, [wcd4d]
	dec a
	ld [wd003], a
	call Function102ea8
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ld a, 0
	ld [wcd4a], a
	ld hl, wcd4b
	set 1, [hl]

Function10283c: ; 10283c
	ld hl, wcd4b
	set 2, [hl]
	call Function1029c3
	ret z
	jr c, .asm_102852
	ld a, $10 ; Function102862
	ld [wcd49], a
	ld hl, wcd4b
	set 1, [hl]
	ret

.asm_102852
	ld a, $14 ; Function1028ab
	ld [wcd49], a
	ld hl, wcd4b
	set 3, [hl]
	ld hl, wcd4b
	set 1, [hl]
	ret
; 102862

Function102862: ; 102862
	ld a, $08
	call Function1028e8
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret
; 10286f

Function10286f: ; 10286f
	call Function1028fc
	ret nc
	ld a, [wcd52]
	ld [wMenuCursorY], a
	ld a, [wcd51]
	cp $08
	jr nz, .asm_102886
	ld a, $15 ; Function1023b5
	ld [wcd49], a
	ret

.asm_102886
	call Function102ee7
	ld hl, wcd4b
	set 1, [hl]
	ld a, $1e
	ld [wcd4e], a
	ld a, $3c
	ld [wcd4f], a
	ld a, 0
	ld [wcd4a], a
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret
; 1028a5

Function1028a5: ; 1028a5
	ld a, $4 ; Function1023a1
	ld [wcd49], a
	ret
; 1028ab

Function1028ab: ; 1028ab
	ld a, [wcd52]
	ld [wMenuCursorY], a
	call Function102f15
	ld hl, wcd4b
	set 1, [hl]
	ld a, $c ; Function1025b0
	ld [wcd49], a
	ret
; 1028bf

Function1028bf: ; 1028bf
	ld a, [wcd49]
	inc a
	ld [wcd49], a

Function1028c6: ; 1028c6
	xor a
	ld [MonType], a
	call Function102bac
	ld a, $1d ; Function102652
	ld [wcd49], a
	ret
; 1028d3

Function1028d3: ; 1028d3
	ld a, [wcd49]
	inc a
	ld [wcd49], a

Function1028da: ; 1028da
	ld a, OTPARTYMON
	ld [MonType], a
	call Function102bac
	ld a, $1f ; Function1025e9
	ld [wcd49], a
	ret
; 1028e8

Function1028e8: ; 1028e8
	ld hl, wcd4b
	res 6, [hl]
	ld [wcd50], a
	callba StartMobileInactivityTimer
	ld a, 0
	ld [wcd4a], a
	ret
; 1028fc

Function1028fc: ; 1028fc
	call GetJoypad
	callba Function1009f3
	jr nc, .asm_102909
	and a
	ret

.asm_102909
	ld a, [wcd4a]
	ld hl, Jumptable_102917
	rst JumpTable
	ret nc
	ld a, 0
	ld [wcd4a], a
	ret
; 102917

Jumptable_102917: ; 102917
	dw Function102933
	dw Function10294f
	dw Function10295d
	dw Function10296e
	dw Function102996
; 102921

Function102921: ; 102921
	ld a, [wcd4a]
	ld hl, Jumptable_10292f
	rst JumpTable
	ret nc
	ld a, 0
	ld [wcd4a], a
	ret
; 10292f

Jumptable_10292f: ; 10292f
	dw Function10295d
	dw Function102984
; 102933

Function102933: ; 102933
	ld hl, MenuDataHeader_1029bb
	call LoadMenuDataHeader
	call Function102e07
	ld a, $32
	ld [TextDelayFrames], a
	ld hl, wcd4b
	set 1, [hl]
	ld a, [wcd4a]
	inc a
	ld [wcd4a], a
	and a
	ret
; 10294f

Function10294f: ; 10294f
	ld a, [TextDelayFrames]
	and a
	ret nz
	ld a, [wcd4a]
	inc a
	ld [wcd4a], a
	and a
	ret
; 10295d

Function10295d: ; 10295d
	call Function10299e
	ld a, 0
	ld [wcd27], a
	ld a, [wcd4a]
	inc a
	ld [wcd4a], a
	and a
	ret
; 10296e

Function10296e: ; 10296e
	callba Function100382
	and a
	ld a, [wcd27]
	bit 7, a
	ret z
	ld a, [wcd4a]
	inc a
	ld [wcd4a], a
	and a
	ret
; 102984

Function102984: ; 102984
	callba Function100382
	and a
	ld a, [wcd27]
	bit 7, a
	ret z
	call Function1029af
	scf
	ret
; 102996

Function102996: ; 102996
	call Function1029af
	call ExitMenu
	scf
	ret
; 10299e

Function10299e: ; 10299e
	ld a, $01
	ld [wccb4], a
	ld a, [wcd50]
	ld [wccb5], a
	ld a, $aa
	ld [wcd51], a
	ret
; 1029af

Function1029af: ; 1029af
	ld hl, wcd4b
	res 7, [hl]
	ld a, [wcc61]
	ld [wcd51], a
	ret
; 1029bb

MenuDataHeader_1029bb: ; 1029bb
	db $40 ; flags
	db 10, 3 ; start coords
	db 12, 15 ; end coords
	dw NULL
	db 1 ; default option
; 1029c3

Function1029c3: ; 1029c3
	ld a, [wcd4a]
	ld hl, Jumptable_1029cb
	rst JumpTable
	ret
; 1029cb

Jumptable_1029cb: ; 1029cb
	dw Function1029cf
	dw Function1029fe
; 1029cf

Function1029cf: ; 1029cf
	call LoadStandardMenuDataHeader
	hlcoord 10, 7
	ld b, 3
	ld c, 8
	ld d, h
	ld e, l
	callba _LinkTextbox
	ld de, String_102a26
	hlcoord 12, 8
	call PlaceString
	ld hl, wcd4b
	set 1, [hl]
	ld de, MenuData3_102a33
	call SetMenuAttributes
	ld a, [wcd4a]
	inc a
	ld [wcd4a], a
	xor a
	ret
; 1029fe

Function1029fe: ; 1029fe
	callba Function1009f3
	ret c
	callba MobileMenuJoypad
	ld a, c
	ld hl, wMenuJoypadFilter
	and [hl]
	ret z
	push af
	call ExitMenu
	pop af
	ld a, [wMenuCursorY]
	cp $01
	jr nz, .asm_102a21
	ld a, $01
	and a
	ret

.asm_102a21
	ld a, $01
	and a
	scf
	ret
; 102a26

String_102a26: ; 102a26
	db   "TRADE"
	next "CANCEL"
	db   "@"
; 102a33

MenuData3_102a33:
	db 8, 11
	db 2,  1
	db $80, $00
	dn 2, 0
	db A_BUTTON

Function102a3b: ; 102a3b
	ld a, [wcd30]
	ld [wc74e], a
	ld hl, PlayerName
	ld de, wPlayerTrademonSenderName
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, [wcd4c]
	dec a
	ld c, a
	ld b, 0
	ld hl, PartySpecies
	add hl, bc
	ld a, [hl]
	ld [wPlayerTrademonSpecies], a
	ld a, [wcd4c]
	dec a
	ld hl, PartyMonOT
	call SkipNames
	ld de, wPlayerTrademonOTName
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, [wcd4c]
	dec a
	ld hl, PartyMon1ID
	call GetPartyLocation
	ld a, [hli]
	ld [wPlayerTrademonID], a
	ld a, [hl]
	ld [wPlayerTrademonID + 1], a
	ld a, [wcd4c]
	dec a
	ld hl, PartyMon1DVs
	call GetPartyLocation
	ld a, [hli]
	ld [wPlayerTrademonDVs], a
	ld a, [hl]
	ld [wPlayerTrademonDVs + 1], a
	ld a, [wcd4c]
	dec a
	ld hl, PartyMon1Species
	call GetPartyLocation
	ld b, h
	ld c, l
	callba GetCaughtGender
	ld a, c
	ld [wPlayerTrademonCaughtData], a
	ld hl, OTPlayerName
	ld de, wOTTrademonSenderName
	ld bc, NAME_LENGTH
	call CopyBytes

	ld a, [wcd4d]
	dec a
	ld c, a
	ld b, 0
	ld hl, OTPartySpecies
	add hl, bc
	ld a, [hl]
	ld [wOTTrademonSpecies], a
	ld a, [wcd4d]
	dec a
	ld hl, OTPartyMonOT
	call SkipNames
	ld de, wOTTrademonOTName
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, [wcd4d]
	dec a
	ld hl, OTPartyMon1ID
	call GetPartyLocation
	ld a, [hli]
	ld [wOTTrademonID], a
	ld a, [hl]
	ld [wOTTrademonID + 1], a
	ld a, [wcd4d]
	dec a
	ld hl, OTPartyMon1DVs
	call GetPartyLocation
	ld a, [hli]
	ld [wOTTrademonDVs], a
	ld a, [hl]
	ld [wOTTrademonDVs + 1], a
	ld a, [wcd4d]
	dec a
	ld hl, OTPartyMon1Species
	call GetPartyLocation
	ld b, h
	ld c, l
	callba GetCaughtGender
	ld a, c
	ld [wOTTrademonCaughtData], a
	ret
; 102b12

Function102b12: ; 102b12
	ld c, 100
	call DelayFrames
	call Function102d9a
	call LoadFontsBattleExtra
	ld a, [wcd2f]
	and a
	jr nz, .asm_102b2b
	callba Function108026
	jr .asm_102b31

.asm_102b2b
	callba Function10802a

.asm_102b31
	ret
; 102b32

Function102b32: ; 102b32
	ld a, [wcd4c]
	dec a
	ld [CurPartyMon], a
	ld a, $01
	ld [wForceEvolution], a
	callba EvolvePokemon
	call Function102d9a
	call Function102dd3
	call Function102dec
	ret
; 102b4e

Function102b4e: ; 102b4e
	ld a, OTPARTYMON
	ld [MonType], a
	ld a, [wMenuCursorY]
	push af
	ld de, Unknown_102b73
	call SetMenuAttributes
	pop af
	ld [wMenuCursorY], a
	ld a, [OTPartyCount]
	ld [w2DMenuNumRows], a
	ret
; 102b68

Function102b68: ; 102b68 ; unreferenced
	xor a
	ld hl, wWindowStackPointer
	ld bc, $10
	call ByteFill
	ret
; 102b73

Unknown_102b73:
	db 9, 6
	db 255, 1
	db $a0, $00
	dn 1, 0
	db D_UP | D_DOWN | A_BUTTON

Function102b7b: ; 102b7b
	xor a
	ld [MonType], a
	ld a, [wMenuCursorY]
	push af
	ld de, Unknown_102b94
	call SetMenuAttributes
	pop af
	ld [wMenuCursorY], a
	ld a, [PartyCount]
	ld [w2DMenuNumRows], a
	ret
; 102b94

Unknown_102b94:
	db 1, 6
	db 255, 1
	db $a0, $00
	dn 1, 0
	db D_UP | D_DOWN | A_BUTTON

Function102b9c: ; 102b9c
	ld a, [wcd4d]
	dec a
	hlcoord 6, 9
	ld bc, $14
	call AddNTimes
	ld [hl], $ec
	ret
; 102bac

Function102bac: ; 102bac
	ld a, [wMenuCursorY]
	dec a
	ld [CurPartyMon], a
	call LowVolume
	call ClearSprites
	callba _MobileStatsScreenInit
	ld a, [CurPartyMon]
	inc a
	ld [wMenuCursorY], a
	call Function102d9a
	call ClearPalettes
	call DelayFrame
	call MaxVolume
	call Function102dd3
	call Function102dec
	call Function102db7
	ret
; 102bdc

Function102bdc: ; 102bdc
	ld a, [wcd4d]
	dec a
	ld hl, OTPartyMon1Species
	call GetPartyLocation
	push hl
	ld a, [wcd4d]
	ld c, a
	ld b, 0
	ld hl, OTPartyCount
	add hl, bc
	ld a, [hl]
	pop hl
	cp EGG
	jr z, .asm_102bfa
	cp [hl]
	jr nz, .asm_102c05

.asm_102bfa
	ld bc, MON_LEVEL
	add hl, bc
	ld a, [hl]
	cp MAX_LEVEL + 1
	jr nc, .asm_102c05
	and a
	ret

.asm_102c05
	scf
	ret
; 102c07

Function102c07: ; 102c07
	call Function102c14
	call Function102c3b
	call Function102c21
	call Function102c2e
	ret
; 102c14

Function102c14: ; 102c14
	ld hl, PartySpecies
	ld de, OTPartySpecies
	ld bc, 1
	call Function102c71
	ret
; 102c21

Function102c21: ; 102c21
	ld hl, PartyMonNicknames
	ld de, OTPartyMonNicknames
	ld bc, 11
	call Function102c71
	ret
; 102c2e

Function102c2e: ; 102c2e
	ld hl, PartyMonOT
	ld de, OTPartyMonOT
	ld bc, 11
	call Function102c71
	ret
; 102c3b

Function102c3b: ; 102c3b
	ld hl, PartyMon1
	ld de, OTPartyMon1
	ld bc, $30
	call Function102c71
	ret
; 102c48

Function102c48: ; 102c48
	callba Function10165a
	ld a, 0
	call GetSRAMBank
	ld hl, $a600
	ld de, wc608
	ld bc, $2f
	call Function102c71
	call CloseSRAM
	ld hl, wc608
	ld de, w5_da00
	ld bc, $1e0
	ld a, $05
	call FarCopyWRAM
	ret
; 102c71

Function102c71: ; 102c71
	ld a, [wcd4c]
	dec a
	call AddNTimes
	push hl
	ld h, d
	ld l, e
	ld a, [wcd4d]
	dec a
	call AddNTimes
	pop de
	call SwapBytes
	ret
; 102c87

Function102c87: ; 102c87
	ld a, [wJumptableIndex]
	push af
	ld a, [wcf64]
	push af
	ld a, [wcd4c]
	ld [wJumptableIndex], a
	ld a, [PartyCount]
	ld [wcf64], a
	ld a, 0
	ld hl, $a600
	ld de, wc608
	ld bc, $11a
	call Function102d3e
	call Function102cee
	ld a, 0
	ld hl, wc608
	ld de, $a600
	ld bc, $11a
	call Function102d3e
	ld a, [wcd4d]
	ld [wJumptableIndex], a
	ld a, [OTPartyCount]
	ld [wcf64], a
	ld a, $05
	ld hl, w5_da00
	ld de, wc608
	ld bc, $11a
	call FarCopyWRAM
	call Function102cee
	ld a, $05
	ld hl, wc608
	ld de, w5_da00
	ld bc, $11a
	call FarCopyWRAM
	pop af
	ld [wcf64], a
	pop af
	ld [wJumptableIndex], a
	ret
; 102cee

Function102cee: ; 102cee
	ld a, [wJumptableIndex]
	dec a
	call Function102d34
	ld de, wd002
	ld bc, $2f
	call CopyBytes
	ld a, [wJumptableIndex]
	ld c, a
	ld a, $06
	sub c
	ret z
	ld bc, $2f
	ld hl, 0
	call AddNTimes
	push hl
	ld a, [wJumptableIndex]
	dec a
	call Function102d34
	ld d, h
	ld e, l
	ld hl, $2f
	add hl, de
	pop bc
	call CopyBytes
	ld a, [wcf64]
	dec a
	call Function102d34
	ld d, h
	ld e, l
	ld hl, wd002
	ld bc, $2f
	call CopyBytes
	ret
; 102d34

Function102d34: ; 102d34
	ld hl, wc608
	ld bc, $2f
	call AddNTimes
	ret
; 102d3e

Function102d3e: ; 102d3e
	call GetSRAMBank
	call CopyBytes
	call CloseSRAM
	ret
; 102d48

Function102d48: ; 102d48
	ld a, [wcd4c]
	ld e, a
	ld d, 0
	ld hl, PartyCount
	add hl, de
	ld a, [hl]
	ld [wd265], a
	cp EGG
	jr z, .asm_102d6d
	dec a
	call SetSeenAndCaughtMon
	ld a, [wcd4c]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, PartyMon1Happiness
	call AddNTimes
	ld [hl], BASE_HAPPINESS

.asm_102d6d
	ld a, [wd265]
	cp UNOWN
	jr nz, .asm_102d98
	ld a, [wcd4c]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, PartyMon1DVs
	call AddNTimes
	predef GetUnownLetter
	callba UpdateUnownDex
	ld a, [wFirstUnownSeen]
	and a
	jr nz, .asm_102d98
	ld a, [UnownLetter]
	ld [wFirstUnownSeen], a

.asm_102d98
	and a
	ret
; 102d9a

Function102d9a: ; 102d9a
	ld a, " "
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	ld a, $07
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	callba HDMATransferAttrMapAndTileMapToWRAMBank3
	ret
; 102db7

Function102db7: ; 102db7
	call Function102e4f
	call Function102e3e
	ld hl, wcd4b
	set 1, [hl]
	ret
; 102dc3

Function102dc3: ; 102dc3
	hlcoord 0, 12
	ld b,  4
	ld c, 18
	ld d, h
	ld e, l
	callba _LinkTextbox
	ret
; 102dd3

Function102dd3: ; 102dd3
	call DisableLCD
	ld de, GFX_1032a2
	ld hl, VTiles0
	lb bc, BANK(GFX_1032a2), 4
	call Get2bpp
	callba __LoadTradeScreenBorder
	call EnableLCD
	ret
; 102dec

Function102dec: ; 102dec
	ld hl, Palettes_1032e2
	ld de, UnknOBPals
	ld bc, 4 palettes
	ld a, $05
	call FarCopyWRAM
	callba Function49742
	call SetPalettes
	call DelayFrame
	ret
; 102e07

Function102e07: ; 102e07
	hlcoord 3, 10
	ld b,  1
	ld c, 11
	ld a, [wBattleMode]
	and a
	jr z, .link_battle
	call TextBox
	jr .okay

.link_battle
; this is idiotic
	hlcoord 3, 10
	ld b,  1
	ld c, 11
	ld d, h
	ld e, l
	callba _LinkTextbox

.okay
	ld de, .waiting
	hlcoord 4, 11
	call PlaceString
	ret
; 102e32

.waiting ; 102e32
	db "Waiting...!@"
; 102e3e

Function102e3e: ; 102e3e
	ld de, .CANCEL
	hlcoord 10, 17
	call PlaceString
	ret
; 102e48

.CANCEL: ; 102e48
	db "CANCEL@"
; 102e4f

Function102e4f: ; 102e4f
	callba Function16d42e
	callba _InitMG_Mobile_LinkTradePalMap
	ld de, PlayerName
	hlcoord 4, 0
	call PlaceString
	ld a, $14
	ld [bc], a
	ld de, OTPlayerName
	hlcoord 4, 8
	call PlaceString
	ld a, $14
	ld [bc], a
	hlcoord 7, 1
	ld de, PartySpecies
	call .PlaceSpeciesNames
	hlcoord 7, 9
	ld de, OTPartySpecies
	call .PlaceSpeciesNames
	ret
; 102e86

.PlaceSpeciesNames: ; 102e86
	ld c, 0
.count_loop
	ld a, [de]
	cp $ff
	ret z
	ld [wd265], a
	push bc
	push hl
	push de
	push hl
	ld a, c
	ld [hDividend], a
	call GetPokemonName
	pop hl
	call PlaceString
	pop de
	inc de
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	inc c
	jr .count_loop
; 102ea8

Function102ea8: ; 102ea8
	call Function102dc3
	ld a, [wcd4c]
	dec a
	ld c, a
	ld b, 0
	ld hl, PartySpecies
	add hl, bc
	ld a, [hl]
	ld [wd265], a
	call GetPokemonName
	ld hl, StringBuffer1
	ld de, StringBuffer2
	ld bc, 11
	call CopyBytes
	ld a, [wcd4d]
	dec a
	ld c, a
	ld b, 0
	ld hl, OTPartySpecies
	add hl, bc
	ld a, [hl]
	ld [wd265], a
	call GetPokemonName
	ld hl, UnknownText_0x102ee2
	call PrintTextBoxText
	ret
; 102ee2

UnknownText_0x102ee2: ; 102ee2
	text_jump UnknownText_0x1bd286
	db "@"

Function102ee7: ; 102ee7
	call Function102dc3
	ld de, String_102ef4
	hlcoord 1, 14
	call PlaceString
	ret
; 102ef4

String_102ef4: ; 102ef4
	db   "Too bad! The trade"
	next "was canceled!"
	db   "@"
; 102f15

Function102f15: ; 102f15
	call Function102dc3
	ld de, .TooBadTheTradeWasCanceled
	hlcoord 1, 14
	call PlaceString
	ret
; 102f22

.TooBadTheTradeWasCanceled: ; 102f22
	db "こうかんを キャンセルしました@"
; 102f32

Function102f32: ; 102f32
	call Function102dc3
	ld de, .TradeCompleted
	hlcoord 1, 14
	call PlaceString
	ret
; 102f3f

.TradeCompleted: ; 102f3f
	db "Trade completed!@"
; 102f50

Function102f50: ; 102f50
	call Function102dc3
	ld de, .PleaseWait
	hlcoord 1, 14
	call PlaceString
	ret
; 102f5d

.PleaseWait: ; 102f5d
	db "しょうしょう おまち ください@"
; 102f6d

Function102f6d: ; 102f6d
	call Function102dc3
	ld de, .Finished
	hlcoord 1, 14
	call PlaceString
	ret
; 102f7a

.Finished: ; 102f7a
	db "しゅうりょう します@"
; 102f85

Function102f85: ; 102f85
	ld a, [wd003]
	ld c, a
	ld b, 0
	ld hl, OTPartySpecies
	add hl, bc
	ld a, [hl]
	ld [wd265], a
	call GetPokemonName
	call Function102dc3
	ld de, String_102fb2
	hlcoord 1, 14
	call PlaceString
	ld de, StringBuffer1
	hlcoord 13, 14
	call PlaceString
	ld de, String_102fcc
	call PlaceString
	ret
; 102fb2

String_102fb2: ; 102fb2
	db   "あいてがわ<PKMN>えらんだ "
	next "いじょう<PKMN>あるようです!!"
	db   "@"
; 102fcc

String_102fcc: ; 102fcc
	db "に@"
; 102fce

Function102fce: ; 102fce
	call Function102dc3
	ld de, String_102fdb
	hlcoord 1, 14
	call PlaceString
	ret
; 102fdb

String_102fdb: ; 102fdb
	db   "あいてがわ%せんたくに"
	next "いじょう<PKMN>あるようです!!"
	done
; 102ff5

Function102ff5: ; 102ff5
	call Function102dc3
	ld de, String_103002
	hlcoord 1, 14
	call PlaceString
	ret
; 103002

String_103002: ; 103002
	db   "その#を こうかんすると"
	next "せんとう できなく なっちゃうよ!"
	db   "@"
; 103021

Function103021: ; 103021
	call Function102dc3
	ld de, String_10302e
	hlcoord 1, 14
	call PlaceString
	ret
; 10302e

String_10302e: ; 10302e
	db   "あいてが ちゅうしを えらんだので"
	next "こうかんを ちゅうし します"
	db   "@"
; 10304f

Function10304f: ; 10304f
	xor a
	ld [AttrMapEnd], a
	ld [wcf42], a
	ld [wcf44], a
	ld [wcf45], a
	ret
; 10305d

Function10305d: ; 10305d
	nop
	ld a, [AttrMapEnd]
	and a
	ret z
	call Function10307f
	ret c
	call Function103094
	call Function10306e
	ret
; 10306e

Function10306e: ; 10306e
	ld a, $01
	ld [hOAMUpdate], a
	call ClearSprites
	ld de, Sprites
	call Function1030cd
	xor a
	ld [hOAMUpdate], a
	ret
; 10307f

Function10307f: ; 10307f
	ld c, $02
	ld hl, wcd4b
	bit 7, [hl]
	jr z, .asm_10308a
	ld c, $01

.asm_10308a
	ld hl, wcf45
	inc [hl]
	ld a, [hl]
	cp c
	ret c
	xor a
	ld [hl], a
	ret
; 103094

Function103094: ; 103094
	ld hl, wcd4b
	bit 7, [hl]
	jr nz, .asm_1030c0
	ld a, [wcf42]
	bit 7, a
	jr nz, .asm_1030b2
	ld a, [wcf44]
	inc a
	ld [wcf44], a
	cp $2c
	ret nz
	ld hl, wcf42
	set 7, [hl]
	ret

.asm_1030b2
	ld a, [wcf44]
	dec a
	ld [wcf44], a
	ret nz
	ld hl, wcf42
	res 7, [hl]
	ret

.asm_1030c0
	ld hl, wcf44
	ld a, [hl]
	and a
	jr z, .asm_1030ca
	dec a
	ld [hl], a
	ret nz

.asm_1030ca
	ld [hl], $2c
	ret
; 1030cd

Function1030cd: ; 1030cd
	ld a, [wcf44]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, Unknown_103112
	add hl, bc
	ld b, $30
	ld c, $08
.asm_1030de
	push hl
	ld hl, wcd4b
	bit 7, [hl]
	pop hl
	ld a, 0
	jr z, .asm_1030eb
	ld a, $05
.asm_1030eb

	add [hl]
	inc hl
	push hl

	add a
	add a

	add Unknown_10327a % $100
	ld l, a
	ld a, Unknown_10327a / $100
	adc 0
	ld h, a

	ld a, b
	add [hl]
	inc hl
	ld [de], a
	inc de
	ld a, $0a
	add [hl]
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	pop hl
	ld a, b
	add $08
	ld b, a
	dec c
	jr nz, .asm_1030de
	ret
; 103112

Unknown_103112: ; 103112
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $01, $00, $00, $00, $00, $00, $00, $00
	db $02, $01, $00, $00, $00, $00, $00, $00
	db $03, $02, $01, $00, $00, $00, $00, $00
	db $04, $03, $02, $01, $00, $00, $00, $00
	db $04, $04, $03, $02, $01, $00, $00, $00
	db $04, $04, $04, $03, $02, $01, $00, $00
	db $04, $04, $04, $04, $03, $02, $01, $00
	db $04, $04, $04, $04, $04, $03, $02, $01
	db $04, $04, $04, $04, $04, $04, $03, $02
	db $04, $04, $04, $04, $04, $04, $04, $03
	db $04, $04, $04, $04, $04, $04, $04, $04
	db $04, $04, $04, $04, $04, $04, $04, $04
	db $04, $04, $04, $04, $04, $04, $04, $04
	db $04, $04, $04, $04, $04, $04, $04, $04
	db $04, $04, $04, $04, $04, $04, $04, $04
	db $04, $04, $04, $04, $04, $04, $04, $04
	db $04, $04, $04, $04, $04, $04, $04, $04
	db $04, $04, $04, $04, $04, $04, $04, $04
	db $03, $04, $04, $04, $04, $04, $04, $04
	db $02, $03, $04, $04, $04, $04, $04, $04
	db $01, $02, $03, $04, $04, $04, $04, $04
	db $00, $01, $02, $03, $04, $04, $04, $04
	db $00, $00, $01, $02, $03, $04, $04, $04
	db $00, $00, $00, $01, $02, $03, $04, $04
	db $00, $00, $00, $00, $01, $02, $03, $04
	db $00, $00, $00, $00, $00, $01, $02, $03
	db $00, $00, $00, $00, $00, $00, $01, $02
	db $00, $00, $00, $00, $00, $00, $00, $01
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
; 10327a

Unknown_10327a: ; 10327a
	db $00, $00, $00, $00
	db $00, $00, $01, $00
	db $00, $00, $02, $00
	db $00, $00, $03, $00
	db $00, $00, $01, $01
	db $00, $00, $00, $00
	db $00, $00, $01, $02
	db $00, $00, $02, $02
	db $00, $00, $03, $02
	db $00, $00, $01, $03

GFX_1032a2:
INCBIN "gfx/unknown/1032a2.2bpp"

Palettes_1032e2:
	RGB  0,  0,  0
	RGB 31, 31,  7
	RGB 20, 31,  6
	RGB 13, 20, 16

	RGB  0,  0,  0
	RGB  7, 11, 17
	RGB  0,  0,  0
	RGB  0,  0,  0

	RGB  0,  0,  0
	RGB 31, 24,  4
	RGB 25, 12,  0
	RGB 31,  7,  4

	RGB  0,  0,  0
	RGB 25,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0

; 103302

Function103302: ; 103302
	call Function103309
	call Function103362
	ret
; 103309

Function103309: ; 103309
	xor a
	ld [hBGMapMode], a
	ld hl, Buffer1
	ld bc, 10
	xor a
	call ByteFill
	ld a, $04
	call GetSRAMBank
	ld a, [wdc41]
	ld [$a60c], a
	ld [Buffer1], a
	call CloseSRAM
	call Function1035c6
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld [wd1ef], a
	ld a, [hli]
	ld [wd1ec], a
	ld a, [hli]
	ld [wd1ed], a
	ld h, d
	ld l, e
	call Function3eea
	ld hl, wd1ec
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	ld [wd1ee], a
	call Function1034be
	call UpdateSprites
	callba HDMATransferAttrMapAndTileMapToWRAMBank3
	ld a, $01
	ld [wd1f0], a
	call Function10339a
	ret
; 103362

Function103362: ; 103362
.asm_103362
	ld a, [wd1f0]
	ld [wd1f1], a
	call Function1033af
	call Function10339a
	call Function10342c
	callba HDMATransferTileMapToWRAMBank3
	ld a, [Buffer2]
	bit 7, a
	jr z, .asm_103362
	ld hl, Buffer2
	bit 6, [hl]
	jr z, .asm_103398
	ld a, $04
	call GetSRAMBank
	ld a, [Buffer1]
	ld [$a60c], a
	ld [wdc41], a
	call CloseSRAM
	xor a
	ret

.asm_103398
	scf
	ret
; 10339a

Function10339a: ; 10339a
	ld a, [wd1f0]
	ld [wd1f2], a
	ld c, a
	ld b, 0
	ld hl, wd1ec
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, bc
	ld a, [hl]
	ld [wd1f3], a
	ret
; 1033af

Function1033af: ; 1033af
	call GetJoypad
	ld a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .left
	bit D_RIGHT_F, a
	jr nz, .right
	bit B_BUTTON_F, a
	jr nz, .b
	bit A_BUTTON_F, a
	jr nz, .a
	bit D_UP_F, a
	jr nz, .up
	bit D_DOWN_F, a
	jr nz, .down
	ret

.up
	ld a, [wd1f0]
	dec a
	ld [wd1f0], a
	cp 1
	ret nc
	ld a, [wd1ee]
	ld [wd1f0], a
	ret

.down
	ld a, [wd1f0]
	inc a
	ld [wd1f0], a
	ld c, a
	ld a, [wd1ee]
	cp c
	ret nc
	ld a, 1
	ld [wd1f0], a
	ret

.b
	call PlayClickSFX
	ld hl, Buffer2
	set 7, [hl]
	ret

.a
	ld a, [wd1f3]
	cp 3
	jr nz, .a_return
	ld de, SFX_TRANSACTION
	call PlaySFX
	ld hl, Buffer2
	set 7, [hl]
	ld hl, Buffer2
	set 6, [hl]
	ret

.left
.right
.a_return
	ld a, [wd1f3]
	cp 3
	ret z
	ld de, SFX_PUSH_BUTTON
	call PlaySFX
	ld bc, 8
	call Function10350f
	ld a, [Buffer1]
	xor e
	ld [Buffer1], a
	ret
; 10342c

Function10342c: ; 10342c
	ld a, [wd1f0]
	ld [wd1f2], a
	call Function103490
	call Function10343c
	call Function1034a7
	ret
; 10343c

Function10343c: ; 10343c
	ld a, [wd1f3]
	cp $02
	jr nz, .asm_103452
	ld bc, 1
	call Function1034f7
	ld c, $12
	ld b, $01
	call Function1034e0
	jr .asm_10345f

.asm_103452
	ld bc, $ffed
	call Function1034f7
	ld c, $12
	ld b, $02
	call Function1034e0

.asm_10345f
	ld bc, 0
	call Function10350f
	ld bc, 1
	call Function103487
	ld bc, 8
	call Function10350f
	ld a, [Buffer1]
	and e
	ld bc, 2
	jr z, .asm_10347d
	ld bc, 4

.asm_10347d
	call Function10350f
	ld bc, 11
	call Function103487
	ret
; 103487

Function103487: ; 103487
	push de
	call Function1034f7
	pop de
	call PlaceString
	ret
; 103490

Function103490: ; 103490
	hlcoord 0, 15
	ld c, $14
	ld b, $03
	call Function1034e0
	ld bc, 6
	call Function10350f
	hlcoord 1, 16
	call PlaceString
	ret
; 1034a7

Function1034a7: ; 1034a7
	ld a, [wd1f1]
	ld [wd1f2], a
	ld bc, 10
	call Function1034f7
	ld [hl], $7f
	ld bc, 10
	call Function1034f1
	ld [hl], $ed
	ret
; 1034be

Function1034be: ; 1034be
	ld a, $01
	ld [wd1f2], a
	ld hl, wd1ec
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
.asm_1034ca
	push af
	ld a, [hli]
	push hl
	ld [wd1f3], a
	call Function10343c
	ld hl, wd1f2
	inc [hl]
	pop hl
	pop af
	dec a
	jr nz, .asm_1034ca
	call Function103490
	ret
; 1034e0

Function1034e0: ; 1034e0
	push bc
	push hl
	call ClearBox
	pop hl
	ld bc, AttrMap - TileMap
	add hl, bc
	pop bc
	ld a, $06
	call FillBoxWithByte
	ret
; 1034f1

Function1034f1: ; 1034f1
	ld a, [wd1f0]
	ld [wd1f2], a

Function1034f7: ; 10134f7
	hlcoord 0, 0
	add hl, bc
	ld a, [wd1ef]
	ld bc, SCREEN_WIDTH
	call AddNTimes
	ld a, [wd1f2]
	dec a
	ld bc, 40
	call AddNTimes
	ret
; 10350f

Function10350f: ; 10350f
	ld a, [wd1f3]
	push bc
	ld hl, Unknown_103522
	ld bc, 9
	call AddNTimes
	pop bc
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ret
; 103522

Unknown_103522: ; 103522
	dw String_103546
	dw String_103598
	dw String_1035a0
	dw String_10355f
	db $01
	dw String_10354f
	dw String_1035a8
	dw String_1035b1
	dw String_103571
	db $02
	dw String_103557
	dw String_1035ba
	dw String_1035bd
	dw String_103585
	db $04
	dw String_103545
	dw String_1035c1
	dw String_1035c1
	dw String_103545

String_103545: db "@"
String_103546: db "せんとう アニメ@"
String_10354f: db "でんわばんごう@"
String_103557: db "めいしこうかん@"
String_10355f: db "でんわを かけるひとが きめられる@"
String_103571: db "でんわばんごうの にゅうりょくのしかた@"
String_103585: db "あたらしいめいしが あれば こうかん@"
String_103598: db "とばして みる@"
String_1035a0: db "じっくり みる@"
String_1035a8: db "めいしからえらぶ@"
String_1035b1: db "すうじで いれる@"
String_1035ba: db "する@"
String_1035bd: db "しない@"
String_1035c1: db "けってい@"
; 1035c6

Function1035c6: ; 1035c6
	callba Function10138b
	ld b, 0
	ld hl, Unknown_1035d7
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret
; 1035d7

Unknown_1035d7: ; 1035d7
	dw Unknown_1035e7
	dw Unknown_1035f3
	dw Unknown_103608
	dw Unknown_103608
	dw Unknown_1035fe
	dw AskMobileOrCable
	dw AskMobileOrCable
	dw AskMobileOrCable

Unknown_1035e7: ; 1035e7
	dwcoord 0, 6
	db $12, $07, $07
	dw .this
.this
	db 4, 2, 1, 0, 3

Unknown_1035f3: ; 1035f3
	dwcoord 0, 7
	db $12, $06, $09
	dw .this
.this
	db 3, 2, 1, 3

Unknown_1035fe: ; 1035fe
	dwcoord 0, 9
	db $12, $04, $0b
	dw .this
.this
	db 2, 0, 3

Unknown_103608: ; 103608
	dwcoord 0, 9
	db $12, $04, $0b
	dw .this
.this
	db 2, 2, 3
; 103612

AskMobileOrCable: ; 103612
	ld hl, MenuDataHeader_103640
	call LoadMenuDataHeader
	ld a, [wMobileOrCable_LastSelection]
	and $0f
	jr z, .skip_load
	ld [wMenuCursorBuffer], a

.skip_load
	call VerticalMenu
	call CloseWindow
	jr c, .pressed_b
	ld a, [wMenuCursorY]
	ld [ScriptVar], a
	ld c, a
	ld a, [wMobileOrCable_LastSelection]
	and $f0
	or c
	ld [wMobileOrCable_LastSelection], a
	ret

.pressed_b
	xor a
	ld [ScriptVar], a
	ret
; 103640

MenuDataHeader_103640: ; 103640
	db $40 ; flags
	db  6, 13 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_103648
	db 1 ; default option

MenuData2_103648: ; 103648
	db $80 ; flags
	db 2
	db "モバイル@"
	db "ケーブル@"
; 103654

Function103654: ; 103654
	callba Mobile_AlwaysReturnNotCarry
	bit 7, c
	jr nz, .asm_103666
	ld hl, wcd2a
	res 5, [hl]
	ld c, $02
	ret

.asm_103666
	ld hl, wcd2a
	set 5, [hl]
	ld c, $01
	ret
; 10366e

Mobile_SelectThreeMons: ; 10366e
	callba Mobile_AlwaysReturnNotCarry
	bit 7, c
	jr z, .asm_10369b
	ld hl, UnknownText_0x10375d
	call PrintText
	call YesNoBox
	jr c, .asm_103696
	callba CheckForMobileBattleRules
	jr nc, .asm_103690
	call JoyWaitAorB
	jr .asm_103696

.asm_103690
	ld a, $01
	ld [ScriptVar], a
	ret

.asm_103696
	xor a
	ld [ScriptVar], a
	ret

.asm_10369b
	ld hl, wMobileOrCable_LastSelection
	bit 7, [hl]
	set 7, [hl]
	jr nz, .asm_1036b5
	ld hl, UnknownText_0x103762
	call PrintText
	call YesNoBox
	jr c, .asm_1036b5
	call Function1036f9
	call JoyWaitAorB

.asm_1036b5
	call Function103700
	jr c, .asm_1036f4
	ld hl, MenuDataHeader_103747
	call LoadMenuDataHeader
	call VerticalMenu
	call ExitMenu
	jr c, .asm_1036f4
	ld a, [wMenuCursorY]
	cp $01
	jr z, .asm_1036d9
	cp $02
	jr z, .asm_1036f4
	cp $03
	jr z, .asm_1036ec
	jr .asm_1036b5

.asm_1036d9
	callba CheckForMobileBattleRules
	jr nc, .asm_1036e6
	call JoyWaitAorB
	jr .asm_1036f4

.asm_1036e6
	ld a, $01
	ld [ScriptVar], a
	ret

.asm_1036ec
	call Function1036f9
	call JoyWaitAorB
	jr .asm_1036b5

.asm_1036f4
	xor a
	ld [ScriptVar], a
	ret
; 1036f9

Function1036f9: ; 1036f9
	ld hl, UnknownText_0x103767
	call PrintText
	ret
; 103700

Function103700: ; 103700
	ld c, $0a
	ld hl, SwarmFlags
	bit 4, [hl]
	jr z, .asm_10370f
	callba Function1008a6

.asm_10370f
	ld a, c
	ld [StringBuffer2], a
	ld a, [StringBuffer2]
	cp $05
	jr nc, .asm_103724
	cp $02
	jr nc, .asm_10372c
	cp $01
	jr nc, .asm_103734
	jr .asm_10373c

.asm_103724
	ld hl, UnknownText_0x10376c
	call PrintText
	and a
	ret

.asm_10372c
	ld hl, UnknownText_0x103771
	call PrintText
	and a
	ret

.asm_103734
	ld hl, UnknownText_0x103776
	call PrintText
	and a
	ret

.asm_10373c
	ld hl, UnknownText_0x10377b
	call PrintText
	call JoyWaitAorB
	scf
	ret
; 103747

MenuDataHeader_103747: ; 103747
	db $40 ; flags
	db  5, 13 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_10374f
	db 1 ; default option

MenuData2_10374f: ; 10374f
	db $c0 ; flags
	db 3
	db "はい@"
	db "やめる@"
	db "せつめい@"
; 10375d

UnknownText_0x10375d: ; 0x10375d
	text_jump UnknownText_0x1c422a
	db "@"
; 0x103762
UnknownText_0x103762: ; 0x103762
	text_jump UnknownText_0x1c4275
	db "@"
; 0x103767
UnknownText_0x103767: ; 0x103767
	text_jump UnknownText_0x1c4298
	db "@"
; 0x10376c
UnknownText_0x10376c: ; 0x10376c
	text_jump UnknownText_0x1c439c
	db "@"
; 0x103771
UnknownText_0x103771: ; 0x103771
	text_jump UnknownText_0x1c43dc
	db "@"
; 0x103776
UnknownText_0x103776: ; 0x103776
	text_jump UnknownText_0x1c4419
	db "@"
; 0x10377b
UnknownText_0x10377b: ; 0x10377b
	text_jump UnknownText_0x1c445a
	db "@"
; 0x103780

Function103780: ; 103780
	ld a, [wd265]
	push af
	call Function10378c
	pop af
	ld [wd265], a
	ret
; 10378c

Function10378c: ; 10378c
	ld c, 0
	ld hl, SwarmFlags
	bit 4, [hl]
	jr nz, .already_set
	ld c, $01
	ld hl, SwarmFlags
	set 4, [hl]

.already_set
	push bc
	callba Link_SaveGame
	pop bc
	jr c, .failed_to_save
	ld a, $01
	ld [ScriptVar], a
	ld a, c
	and a
	ret z
	callba Function1006fd
	ret

.failed_to_save
	xor a
	ld [ScriptVar], a
	ld a, c
	and a
	ret z
	ld hl, SwarmFlags
	res 4, [hl]
	ret
; 1037c2

Function1037c2: ; 1037c2
	call Function103823
	jr c, .nope
	ld a, [wdc5f]
	and a
	jr z, .nope
	ld hl, UnknownText_0x1037e6
	call PrintText
	call YesNoBox
	jr c, .nope
	ld a, $01
	ld [ScriptVar], a
	ret

.nope
	xor a
	ld [wdc5f], a
	ld [ScriptVar], a
	ret
; 1037e6

UnknownText_0x1037e6: ; 0x1037e6
	text_jump UnknownText_0x1c449c
	db "@"
; 0x1037eb

Function1037eb: ; 1037eb
	call Function103823
	jr nc, .asm_103807
	ld hl, UnknownText_0x103819
	call PrintText
	call JoyWaitAorB
	ld hl, UnknownText_0x10381e
	call PrintText
	call JoyWaitAorB
	xor a
	ld [ScriptVar], a
	ret

.asm_103807
	ld a, [wdc60]
	and a
	jr nz, .asm_103813
	ld a, $01
	ld [ScriptVar], a
	ret

.asm_103813
	ld a, $02
	ld [ScriptVar], a
	ret
; 103819

UnknownText_0x103819: ; 0x103819
	text_jump UnknownText_0x1c44c0
	db "@"
; 0x10381e

UnknownText_0x10381e: ; 0x10381e
	text_jump UnknownText_0x1c44e7
	db "@"
; 0x103823

Function103823: ; 103823
	callba Mobile_AlwaysReturnNotCarry
	bit 7, c
	jr nz, .asm_103838
	callba Function1008a6
	ld a, c
	cp $01
	jr c, .asm_10383a

.asm_103838
	xor a
	ret

.asm_10383a
	scf
	ret
; 10383c

Function10383c: ; 10383c
	ld a, $01
	ld [wdc60], a
	xor a
	ld hl, wPlayerMonSelection
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, UnknownText_0x103876
	call PrintText
	call JoyWaitAorB
	callba Script_reloadmappart
	callba Function4a94e
	jr c, .asm_103870
	ld hl, wd002
	ld de, wPlayerMonSelection
	ld bc, 3
	call CopyBytes
	xor a
	ld [ScriptVar], a
	ret

.asm_103870
	ld a, $01
	ld [ScriptVar], a
	ret
; 103876

UnknownText_0x103876: ; 0x103876
	text_jump UnknownText_0x1c4508
	db "@"
; 0x10387b

Function10387b: ; 10387b
	callba Mobile_AlwaysReturnNotCarry
	bit 7, c
	ret nz
	callba Function1008a6
	ld a, c
	ld [StringBuffer2], a
	ld hl, UnknownText_0x103898
	call PrintText
	call JoyWaitAorB
	ret
; 103898

UnknownText_0x103898: ; 0x103898
	text_jump UnknownText_0x1c4525
	db "@"
; 0x10389d
