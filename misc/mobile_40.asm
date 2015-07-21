
SECTION "bank40", ROMX, BANK[$40]

Function100000: ; 100000
	ld a, [rSVBK]
	push af
	ld a, $1
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
	call Function100063
	pop bc
	pop de
	ld a, d
	ld [wcd21], a
	ld a, e
	ld [CreditsTimer], a
	ld a, c
	ld [wcd23], a
	ld a, b
	ld [wcd24], a
	callba Function10127e
	callba Function106462
	callba Function106464
	callba Function11615a
	ld hl, VramState
	set 1, [hl]
	ret
; 100057

Function100057: ; 100057
	call Function1000a4
	call Function222a
	ld hl, VramState
	res 1, [hl]
	ret
; 100063

Function100063: ; 100063
	xor a
	ld hl, BGMapBuffer
	ld bc, $0065
	call ByteFill
	xor a
	ld hl, wc300
	ld bc, $100
	call ByteFill
	ld a, [rIE]
	ld [BGMapBuffer], a
	xor a
	ld [$ffde], a
	ld [hLCDStatCustom], a
	ret
; 100082

Function100082: ; 100082
	xor a
	ld hl, OverworldMap
	ld bc, 1300
	call ByteFill
	di
	call DoubleSpeed
	xor a
	ld [rIF], a
	ld a, 1 << VBLANK + 1 << LCD_STAT + 1 << TIMER + 1 << SERIAL
	ld [rIE], a
	xor a
	ld [$ffde], a
	ld [hLCDStatCustom], a
	ld a, $1
	ld [$ffc9], a
	ld [$ffe9], a
	ei
	ret
; 0x1000a4

Function1000a4: ; 1000a4
	di
	xor a
	ld [$ffc9], a
	ld [$ffe9], a
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
.asm_1000ba
	ld hl, wcd23
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcd25]
	ld e, a
	ld d, $0
rept 2
	add hl, de
endr
	ld a, [CreditsTimer]
	call GetFarHalfword
	ld a, [CreditsTimer]
	rst FarCall
	call Function1000e8
	call Function1000fa
	call Function100144
	call Function100163
	ld a, [wcd2b]
	and a
	jr z, .asm_1000ba
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
	ld [$ffc9], a
	ld [$ffe9], a
	ei
	ld a, [InLinkBattle]
	push af
	xor a
	ld [InLinkBattle], a
	ld a, $4
	ld [wc319], a
	callba Function11619d
	ld hl, wcd29
	set 6, [hl]
	pop af
	ld [InLinkBattle], a
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
	callba Function10402d
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
	cp $1
	ret z
	cp $2
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
	ret

.asm_1001af
	ld a, $d7
	ld de, $0000
	jr .asm_1001d7

.asm_1001b6
	ld a, $d5
	ld de, $0000
	jr .asm_1001d7

.asm_1001bd
	ld a, $d6
	ld de, $0000
	jr .asm_1001d7

.asm_1001c4
	ld a, $d2
	ld de, $0002
	jr .asm_1001d7

.asm_1001cb
	ld a, $d1
	ld de, $0001
	jr .asm_1001d7

.asm_1001d2
	ld a, $d0
	ld de, $0000

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
	callba FadeBlackBGMap
	callba Function106464
	call HideSprites
	call DelayFrame
	ld a, [rSVBK]
	push af
	ld a, $1
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
	call DrawOnMap
	hlcoord 1, 2
	pop de
	call PlaceString
	call Function100320
	call Functiona36
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
	cp $1
	jr z, .asm_10029f
	cp $2
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
	ld c, $2
	ret

.asm_100296
	callba Script_reloadmappart
	ld c, $4
	ret

.asm_10029f
	call Function1002dc
	ld c, $0
	ret

.asm_1002a5
	callba Script_reloadmappart
	call Function1002ed
	ld c, $3
	ret

.asm_1002b1
	call Function1002c9
	call Function1002dc
	ld de, String10024d
	call Function100232
	ld c, $2
	ret

.asm_1002c0
	call Function1002c9
	call Function1002dc
	ld c, $1
	ret
; 1002c9

Function1002c9: ; 1002c9
	ld hl, wcd2a
	bit 0, [hl]
	ret z
	callba Function3f6d0
	callba Function1500c
	ret
; 1002dc

Function1002dc: ; 1002dc
	ld a, $f8
	ld [$ff9f], a
	callba RunMapSetupScript
	xor a
	ld [$ff9f], a
	call Functione51
	ret
; 1002ed

Function1002ed: ; 1002ed
	callba Function49409
	callba Function96a4
	ld a, $1
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
	call Functiona36
	ret
; 100320

Function100320: ; 100320
	callba Function104099
	ret
; 100327

Function100327: ; 100327
	callba Function10402d
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
	ld a, $1
	and a
	ret

.asm_100364
	xor a
	ret

.asm_100366
	ld a, $2
	and a
	ret

.asm_10036a
	ld a, $0
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
	ld de, wd000
	ld bc, $0054
	ld a, $3
	call FarCopyWRAM
	ret
; 1003ab

Function1003ab: ; 1003ab
	ld hl, wd000
	ld de, wcc60
	ld bc, $0054
	ld a, $3
	call FarCopyWRAM
	ret
; 1003ba

Function1003ba: ; 1003ba
	ld hl, wccb4
	ld de, $d080
	ld bc, $0054
	ld a, $3
	call FarCopyWRAM
	ret
; 1003c9

Function1003c9: ; 1003c9
	ld hl, $d080
	ld de, wccb4
	ld bc, $0054
	ld a, $3
	call FarCopyWRAM
	ret
; 1003d8

Function1003d8: ; 1003d8
	ld hl, wccb4
	ld a, [hli]
	ld c, a
	ld b, $0
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
	add $2
	ld [wccb4], a
	ret
; 1003f5

Function1003f5: ; 1003f5
	ld a, [wcc60]
	sub $3
	ld [wcc60], a
	ld a, [wccb4]
	sub $3
	ld [wccb4], a
	ret
; 100406

Function100406: ; 100406
	ld a, [wcc60]
	sub $2
	ld c, a
	ld b, $0
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
	ld de, $0000
.asm_10043f
	ld a, [hli]
	add e
	ld e, a
	ld a, d
	adc $0
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
	cp $2
	jr z, .asm_100487
	jr .asm_10048d

.asm_100487
	ld a, $8
	ld [wcd27], a
	ret

.asm_10048d
	ld a, $2
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
	ld a, $8
	ld [wcd27], a
	ret
; 1004ce

Function1004ce: ; 1004ce
	call Function100337
	ret c
	ret z
	cp $2
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
	call DrawOnMap
	pop de
	hlcoord 4, 2
	call PlaceString
	ret
; 100513

Function100513: ; 100513
	call Function3f7c
	call Function1c89
	call Function1c10
	ld hl, wcfa5
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
	call DrawOnMap
	call Function321c
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
	callba Function241ba
	ld a, c
	ld hl, wcfa8
	and [hl]
	ret z
	call Function1ff8
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
	ld a, $0
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
	ld [wcfa9], a

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
	ld a, $0
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
	ld [wcfa9], a
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

Function10060d: ; 10060d
	hlcoord 3, 10
	ld b, $1
	ld c, $b
	call Function3eea
	ld de, String_100621
	hlcoord 4, 11
	call PlaceString
	ret
; 100621

String_100621: ; 100621
	db "つうしんたいきちゅう!@"
; 10062d

Function10062d: ; 10062d
	push bc
	call Function10064e
	pop bc
	ld a, [wcd44]
	cp b
	jr nc, .asm_10063a
	and a
	ret

.asm_10063a
	ld a, $fa
	ld [wcd2b], a
	scf
	ret
; 100641

Function100641: ; 100641
	xor a
	ld [wcd44], a
	ld [wcd45], a
	ld [wcd46], a
	ret
; 10064c

Function10064c: ; 10064c
	ld c, 1

Function10064e: ; 10064e
	ld hl, wcd46
	ld a, [hl]
	add c
	cp $3c
	jr c, .asm_100658
	xor a

.asm_100658
	ld [hld], a
	ret c
	ld a, [hl]
	inc a
	cp $3c
	jr c, .asm_100661
	xor a

.asm_100661
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
	ld bc, $8102
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
	ld a, $4
	ld hl, $a800
	call GetSRAMBank
	xor a
rept 3
	ld [hli], a
endr
	call CloseSRAM
	ret
; 10070d

Function10070d: ; 10070d
	ld a, $4
	ld hl, $a800
	call GetSRAMBank
	xor a
	ld [hli], a
	ld a, $a
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
	ld a, $4
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
	cp $1
	jr nz, .asm_1007f4
	ld hl, wcd2a
	bit 5, [hl]
	jr nz, .asm_1007f4
	ld hl, wcd2a
	bit 6, [hl]
	jr nz, .asm_1007f4
	ld a, [wcd6a]
	add c
	cp $3c
	jr nc, .asm_1007be
	ld [wcd6a], a
	and a
	ret

.asm_1007be
	sub $3c
	ld [wcd6a], a
	ld d, b
	push de
	call Function1007f6
	pop de
	jr c, .asm_1007e5
	ld a, c
	and a
	jr nz, .asm_1007e5
	ld a, b
	cp $a
	jr nc, .asm_1007e5
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

.asm_1007e5
	call Function1008e0
	ld hl, wcd2a
	set 4, [hl]
	ld a, $fc
	ld [wcd2b], a
	scf
	ret

.asm_1007f4
	and a
	ret
; 1007f6

Function1007f6: ; 1007f6
	call UpdateTime
	ld hl, wcd74
	ld de, wcd71
	call Function1006dc
	ld a, $4
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
	ld a, $0
	sub c
	jr nc, .asm_100858
	add $3c

.asm_100858
	ld [StringBuffer2 + 2], a
	ld a, [wcd6d]
	ld c, a
	ld a, $a
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
	ld a, $4
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
	ld a, $0
	sub b
	jr nc, .asm_1008c8
	add $3c

.asm_1008c8
	ld b, a
	ld a, [StringBuffer2 + 1]
	ld c, a
	ld a, $a
	sbc c
	ld c, a
	jr c, .asm_1008da
	ld a, [StringBuffer2]
	and a
	jr nz, .asm_1008da
	ret

.asm_1008da
	call Function10070d
	ld c, $0
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
	ld a, $3
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
	ld b, $1
	ld c, $b
	call TextBox
	ld a, [wcd6d]
	ld c, a
	ld a, $a
	sub c
	ld [StringBuffer2], a
	jr z, .asm_10093f
	ld de, .string_100966
	hlcoord 4, 11
	call PlaceString
	hlcoord 8, 11
	ld bc, $0102
	ld de, StringBuffer2
	call PrintNum
	ld de, SFX_TWO_PC_BEEPS
	call PlaySFX
	callba Function104061
	ld c, $3c
	call DelayFrames
	ret

.asm_10093f
	ld de, .string_10095a
	hlcoord 4, 11
	call PlaceString
	ld de, SFX_4_NOTE_DITTY
	call PlaySFX
	callba Function104061
	ld c, $78
	call DelayFrames
	ret
; 10095a

.string_10095a ; 10095a
	db "たいせん しゅうりょう@"
.string_100966 ; 100966
	db "のこり   ふん", $e7, "@"
; 100970


Function100970: ; 100970
	ld hl, TileMap
	ld de, wdc00
	call Function1009a5
	ld hl, AttrMap
	ld de, $dd68
	call Function1009a5
	call Function1009d2
	call Function1009ae
	ret
; 100989

Function100989: ; 100989
	ld hl, wdc00
	ld de, TileMap
	call Function1009a5
	call Function1009ae
	callba Function104061
	ld hl, $dd68
	ld de, AttrMap
	call Function1009a5
	ret
; 1009a5

Function1009a5: ; 1009a5
	ld bc, $0168
	ld a, $3
	call FarCopyWRAM
	ret
; 1009ae

Function1009ae: ; 1009ae
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
	ld hl, $d800
	ld de, AttrMap
	ld c, $14
	ld b, $12
.asm_1009bf
	push bc
.asm_1009c0
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_1009c0
	ld bc, $000c
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_1009bf
	pop af
	ld [rSVBK], a
	ret
; 1009d2

Function1009d2: ; 1009d2
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
	ld a, [rVBK]
	push af
	ld a, $1
	ld [rVBK], a
	ld hl, $d800
	ld de, VBGMap0
	lb bc, $3, $24
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
	jr nz, .asm_100a07
	ld hl, wcd2a
	set 4, [hl]
	ld a, $f8
	ld [wcd2b], a
	scf
	ret

.asm_100a07
	xor a
	ret
; 100a09

Function100a09: ; 100a09
	call Function100a2e
	ld [wd431], a
	callba Function4000
	ld a, [InLinkBattle]
	cp $4
	jr nz, .asm_100a2a
	call Function100a87
	call Function100da5
	callba Function3ee27
	jr .asm_100a2d

.asm_100a2a
	call Function100a53

.asm_100a2d
	ret
; 100a2e

Function100a2e: ; 100a2e
	ld a, [wd0ec]
	and a
	jr nz, .asm_100a48
	ld a, [CurPlayerMove]
	ld b, $e
	cp STRUGGLE
	jr z, .asm_100a4f
	ld b, $d
	cp $ff
	jr z, .asm_100a4f
	ld a, [CurMoveNum]
	jr .asm_100a50

.asm_100a48
	ld a, [CurPartyMon]
	add $4
	jr .asm_100a50

.asm_100a4f
	ld a, b

.asm_100a50
	and $f
	ret
; 100a53

Function100a53: ; 100a53
	ld a, [wd431]
	ld [wcf56], a
	ld a, $ff
	ld [wcf52], a
.asm_100a5e
	call Function8c1
	call DelayFrame
	ld a, [wcf52]
	inc a
	jr z, .asm_100a5e
	ld b, $a
.asm_100a6c
	call DelayFrame
	call Function8c1
	dec b
	jr nz, .asm_100a6c
	ld b, $a
.asm_100a77
	call DelayFrame
	call Function908
	dec b
	jr nz, .asm_100a77
	ld a, [wcf52]
	ld [wd430], a
	ret
; 100a87

Function100a87: ; 100a87
	call Function100acf
	call Function100641
	ld a, $0
	ld [wcd27], a
.asm_100a92
	call DelayFrame
	call GetJoypad
	callba Function100382
	ld c, $1
	ld b, $3
	push bc
	call Function10062d
	pop bc
	jr c, .asm_100ac7
	ld b, $1
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
	ld a, $f
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
	ld c, $1
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
	ld a, $f
	ld [wd430], a
	ld a, $f1
	ld [wcd2b], a
	ret
; 100b0a


SECTION "tetsuji", ROMX, BANK[$40]

	charmap " ", $20 ; revert to ascii

Unknown_100b0a: ; 100b0a
	db "tetsuji", 0
; 100b12


SECTION "bank40_2", ROMX, BANK[$40]

Function100b12: ; 100b12
	call Function100dd8
	ret c
	ld hl, BattleMenuDataHeader
	ld a, BANK(BattleMenuDataHeader)
	ld de, LoadMenuDataHeader
	call FarCall_de
	ld a, BANK(BattleMenuDataHeader)
	ld [wcf94], a
	ld a, [wd0d2]
	ld [wcf88], a
	call Function100e72
	call Function100b45
	callba Function8e85
	call Function100ed4
	ld a, [wcf88]
	ld [wd0d2], a
	call ExitMenu
	ret
; 100b45

Function100b45: ; 100b45
	call Function100b7a
.asm_100b48
	call Function100dd2
	callba Function241ba
	push bc
	callba Function10402d
	call Function100e2d
	pop bc
	jr c, .asm_100b6b
	ld a, [wcfa8]
	and c
	jr z, .asm_100b48
	callba Function24098
	ret

.asm_100b6b
	ld a, [wcfa4]
	ld c, a
	ld a, [wcfa3]
	call SimpleMultiply
	ld [wcf88], a
	and a
	ret
; 100b7a

Function100b7a: ; 100b7a
	ld hl, Function1c66
	ld a, [wcf94]
	rst FarCall
	callba Function24085
	callba MobileTextBorder
	call DrawOnMap
	call Function321c
	callba Function2411a
	ld hl, wcfa5
	set 7, [hl]
	ret
; 100b9f

Function100b9f: ; 100b9f
	xor a
	ld [wd0e3], a
	callba Function3e786
	ret z
	call Function100dd8
	jp c, Function2ec8
	call Function100e72
	call Function100bc2
	push af
	callba Function8e85
	call Function100ed4
	pop af
	ret
; 100bc2

Function100bc2: ; 100bc2
	xor a
	ld [hBGMapMode], a
	call Function100c74
	call Function100c98
.asm_100bcb
	callba MoveInfoBox
.asm_100bd1
	call Function100dd2
	callba Function241ba
	push bc
	callba Function10402d
	call Function100e2d
	pop bc
	jr c, .asm_100c25
	ld a, [wcfa8]
	and c
	bit 6, a
	jp nz, .asm_100bff
	bit 7, a
	jp nz, .asm_100c10
	bit 0, a
	jr nz, .asm_100c30
	bit 1, a
	jr nz, .asm_100c25
	jr .asm_100bd1

.asm_100bff
	ld a, [wcfa9]
	and a
	jp nz, .asm_100bcb
	ld a, [wd0eb]
	inc a
	ld [wcfa9], a
	jp .asm_100bcb

.asm_100c10
	ld a, [wcfa9]
	ld b, a
	ld a, [wd0eb]
rept 2
	inc a
endr
	cp b
	jp nz, .asm_100bcb
	ld a, $1
	ld [wcfa9], a
	jp .asm_100bcb

.asm_100c25
	ld a, [wcfa9]
	dec a
	ld [CurMoveNum], a
	ld a, $1
	and a
	ret

.asm_100c30
	ld a, [wcfa9]
	dec a
	ld [CurMoveNum], a
	ld a, [wcfa9]
	dec a
	ld c, a
	ld b, 0
	ld hl, BattleMonPP
	add hl, bc
	ld a, [hl]
	and $3f
	jr z, .asm_100c68
	ld a, [PlayerDisableCount]
	swap a
	and $f
	dec a
	cp c
	jr z, .asm_100c63
	ld a, [wcfa9]
	dec a
	ld c, a
	ld b, 0
	ld hl, BattleMonMoves
	add hl, bc
	ld a, [hl]
	ld [CurPlayerMove], a
	xor a
	ret

.asm_100c63
	ld hl, BattleText_0x80c5b
	jr .asm_100c6b

.asm_100c68
	ld hl, BattleText_0x80c39

.asm_100c6b
	call StdBattleTextBox
	call Function30b4
	jp Function100bc2
; 100c74

Function100c74: ; 100c74
	hlcoord 0, 8
	ld b, 8
	ld c, 8
	call TextBox
	ld hl, BattleMonMoves
	ld de, wd25e
	ld bc, NUM_MOVES
	call CopyBytes
	ld a, SCREEN_WIDTH * 2
	ld [Buffer1], a
	hlcoord 2, 10
	predef ListMoves
	ret
; 100c98

Function100c98: ; 100c98
	ld de, Unknown_100cad
	call Function1bb1
	ld a, [wd0eb]
	inc a
	ld [wcfa3], a
	ld a, [CurMoveNum]
	inc a
	ld [wcfa9], a
	ret
; 100cad

Unknown_100cad: ; 100cad
	db $0a, $01, $ff, $01, $a0, $00, $20, $c3

Function100cb5: ; 100cb5
	call Function100dd8
	ret c
	ld hl, wcfa5
	set 7, [hl]
	res 6, [hl]
.asm_100cc0
	call Function100dd2
	callba Function241ba
	push bc
	callba Function8cf69
	callba Function10402d
	call Function100dfd
	pop bc
	jr c, .asm_100d17
	ld a, [wcfa8]
	and c
	jr z, .asm_100cc0
	call Function1bee
	ld a, [PartyCount]
	inc a
	ld b, a
	ld a, [wcfa9]
	cp b
	jr z, .asm_100d17
	ld [wd0d8], a
	ld a, [$ffa9]
	ld b, a
	bit 1, b
	jr nz, .asm_100d17
	ld a, [wcfa9]
	dec a
	ld [CurPartyMon], a
	ld c, a
	ld b, $0
	ld hl, PartySpecies
	add hl, bc
	ld a, [hl]
	ld [CurPartySpecies], a
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	call WaitSFX
	and a
	ret

.asm_100d17
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	call WaitSFX
	scf
	ret
; 100d22

Function100d22: ; 100d22
	call Function100dd8
	ret c
	call Function100d67
	ld hl, wcfa5
	set 7, [hl]
	res 6, [hl]
.asm_100d30
	call Function100dd2
	callba Function241ba
	push bc
	callba Function8cf69
	callba Function10402d
	call Function100dfd
	pop bc
	jr c, .asm_100d54
	ld a, [wcfa8]
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
	ld hl, MenuDataHeader_100d88
	call CopyMenuDataHeader
	xor a
	ld [hBGMapMode], a
	call Function1cbb
	call DrawOnMap
	call Function1c89
	call WaitBGMap
	call Function1c66
	call Function1c10
	ld hl, wcfa5
	set 6, [hl]
	ret
; 100d88

MenuDataHeader_100d88: ; 100d88
	db 0 ; flags
	db 11, 11 ; start coords
	db 17, 19 ; end coords
	dw MenuData2_100d90
	db 1 ; default option

MenuData2_100d90: ; 100d90
	db $c0 ; flags
	db 3
	db "いれかえる@"
	db "つよさをみる@"
	db "キャンセル@"
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
	ld a, [InLinkBattle]
	cp $4
	jr nz, .asm_100dd0
	ld hl, wcd2a
	bit 3, [hl]
	jr z, .asm_100dd0
	scf
	ret

.asm_100dd0
	xor a
	ret
; 100dd2

Function100dd2: ; 100dd2
	ld a, 30
	ld [OverworldDelay], a
	ret
; 100dd8

Function100dd8: ; 100dd8
	ld c, $1
	ld b, $3
	callba Function10062d
	jr c, .asm_100dfb
	ld c, $3c
	ld b, $1
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

Function100dfd: ; 100dfd
	ld a, [OverworldDelay]
	ld c, a
	ld a, 30
	sub c
	ld c, a
	ld b, 3
	push bc
	callba Function10062d
	pop bc
	jr c, .asm_100e2b
	ld b, 1
	call Function10079c
	jr c, .asm_100e2b
	call Function1009f3
	jr c, .asm_100e2b
	callba Function10032e
	ld a, [wcd2b]
	and a
	jr nz, .asm_100e2b
	xor a
	ret

.asm_100e2b
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
	callba Function10062d
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
	cp $2
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
	ld a, $a

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
	cp $2
	ret c
	ld [hl], $0
	jr Function100ec5

Function100ec4: ; 100ec4
	ret

Function100ec5
	ld hl, wcd67
	inc [hl]
	ret
; 100eca

Function100eca: ; 100eca
	callba Function8e8b
	call Function100ed4
	ret
; 100ed4

Function100ed4: ; 100ed4
	callba Function96a4
	ld a, $1
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
	ld a, e
	ld [StringBuffer2 + 1], a
	ld a, d
	ld [StringBuffer2 + 2], a
	xor a
	ld [StringBuffer2 + 4], a
	ld [StringBuffer2 + 5], a
.asm_100f15
	ld a, [hl]
	cp $ff
	jr z, .asm_100f34
	ld [StringBuffer2 + 3], a
	push hl
	inc hl
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Function100f3d
	pop hl
	ld de, $0007
	add hl, de
	jr .asm_100f15

.asm_100f34
	ld a, [StringBuffer2 + 4]
	ld c, a
	ld a, [StringBuffer2 + 5]
	ld b, a
	ret
; 100f3d

Function100f3d: ; 100f3d
	ld a, [StringBuffer2]
	cp $2
	jr z, .asm_100f61
	cp $1
	jr z, .asm_100f77
	cp $3
	jr z, .asm_100f4d
	ret

.asm_100f4d
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

.asm_100f61
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

.asm_100f77
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
	jr z, .asm_100fb6
	and a
	jr nz, .asm_100fb0
	call CopyBytes
	ret

.asm_100fb0
	and $7f
	call FarCopyWRAM
	ret

.asm_100fb6
	call GetSRAMBank
	call CopyBytes
	call CloseSRAM
	ret
; 100fc0

Unknown_100fc0: ; 100fc0
	dbwww $80, PlayerName, NAME_LENGTH, wd26b
	dbwww $80, PartyCount, 1 + PARTY_LENGTH + 1, OTPartyCount
	dbwww $80, PlayerID, 2, wd276
	dbwww $80, PartyMons, $30 * PARTY_LENGTH, OTPartyMons
	dbwww $80, PartyMonOT, NAME_LENGTH * PARTY_LENGTH, OTPartyMonOT
	dbwww $80, PartyMonNicknames, PKMN_NAME_LENGTH * PARTY_LENGTH, OTPartyMonNicknames
	db -1

Unknown_100feb: ; 100feb
	dbwww $00, $a600, $2f * PARTY_LENGTH, NULL
	db -1

Unknown_100ff3: ; 100ff3
	dbwww $80, wdc41, 1, NULL
	dbwww $80, PlayerName, NAME_LENGTH, NULL
	dbwww $80, PlayerName, NAME_LENGTH, NULL
	dbwww $80, PlayerID, 2, NULL
	dbwww $80, wd84a, 2, NULL
	dbwww $80, PlayerGender, 1, NULL
	dbwww $04, $a603, 8, NULL
	dbwww $04, $a007, $30, NULL
	db -1

Unknown_10102c: ; 10102c
	dbwww $80, wd26b, 11, NULL
	dbwww $80, wd276, 2, NULL
	dbwww $80, OTPartyMonNicknames, PKMN_NAME_LENGTH * PARTY_LENGTH, NULL
	dbwww $80, OTPartyMonOT, NAME_LENGTH * PARTY_LENGTH, NULL
	dbwww $80, OTPartyMons, $30 * PARTY_LENGTH, NULL
	db -1
; 10104f

Function101050: ; 101050
	call Function10107d
	ld a, [OTPartyCount]
rept 2
	ld hl, $c608
endr
	ld bc, $01b3
	call Function1010de
	ld hl, wc7bb
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, $7
	call GetSRAMBank
	ld hl, $c608
	ld de, $a001
	ld bc, $01b5
	call CopyBytes
	call CloseSRAM
	ret
; 10107d

Function10107d: ; 10107d
	xor a
	ld hl, $c608
	ld bc, $01b5
	call ByteFill
	ld hl, wd26b
	ld de, $c608
	ld bc, $000b
	call CopyBytes
	ld hl, wd271
	ld a, [hli]
	ld [$c608 + 11], a
	ld a, [hl]
	ld [$c608 + 12], a
	ld hl, OTPartyMonNicknames
	ld de, $c608 + 13
	ld bc, $000b
	call Function1010cd
	ld hl, OTPartyMonOT
	ld de, $c656 + 1
	ld bc, $000b
	call Function1010cd
	ld hl, OTPartyMon1Species
	ld de, $c68a + 15
	ld bc, $0030
	call Function1010cd
	ld a, $50
	ld [wc7b9], a
	ld a, $33
	ld [wc7ba], a
	ret
; 1010cd

Function1010cd: ; 1010cd
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
.asm_1010e3
	ld a, [hli]
	add e
	ld e, a
	ld a, d
	adc 0
	ld d, a
	dec bc
	ld a, b
	or c
	jr nz, .asm_1010e3
	pop bc
	pop hl
	ret
; 1010f2

Function1010f2: ; 1010f2
	xor a
	ld hl, StringBuffer2
	ld bc, $0009
	call ByteFill
	ld hl, wdc5c
	ld de, PartyCount
	call Function101145
	ld hl, wdc5c
	ld de, PartyMon1Species
	call Function10117c
	ld hl, wdc5c
	ld de, PartyMonOT
	call Function101181
	ld hl, wdc5c
	ld de, PartyMonNicknames
	call Function101181
	ld hl, wcd75
	ld de, OTPartyCount
	call Function101145
	ld hl, wcd75
	ld de, OTPartyMon1Species
	call Function10117c
	ld hl, wcd75
	ld de, OTPartyMonOT
	call Function101181
	ld hl, wcd75
	ld de, OTPartyMonNicknames
	call Function101181
	ret
; 101145

Function101145: ; 101145
	push de
	ld bc, StringBuffer2 + 6
	xor a
.asm_10114a
	push af
	call Function101168
	ld [bc], a
	inc bc
	pop af
	inc a
	cp $3
	jr nz, .asm_10114a
	pop de
	ld a, $3
	ld [de], a
	inc de
	ld hl, StringBuffer2 + 6
	ld bc, $0003
	call CopyBytes
	ld a, $ff
	ld [de], a
	ret
; 101168

Function101168: ; 101168
	push hl
	add l
	ld l, a
	ld a, h
	adc $0
	ld h, a
	ld a, [hl]
	pop hl
	push de
	inc de
	add e
	ld e, a
	ld a, d
	adc $0
	ld d, a
	ld a, [de]
	pop de
	ret
; 10117c

Function10117c: ; 10117c
	ld bc, $0030
	jr asm_101184

Function101181: ; 101181
	ld bc, $000b

asm_101184:
	ld a, $c608 % $100
	ld [StringBuffer2], a
	ld a, $c608 / $100
	ld [StringBuffer2 + 1], a
	ld a, c
	ld [StringBuffer2 + 2], a
	ld a, b
	ld [StringBuffer2 + 3], a
	ld a, e
	ld [StringBuffer2 + 4], a
	ld a, d
	ld [StringBuffer2 + 5], a
	ld a, $3
.asm_1011a0
	push af
	ld a, [hli]
	push hl
	push af
	call Function1011df
	call Function1011e8
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
	jr nz, .asm_1011a0
	call Function1011e8
	ld a, 3
	ld hl, 0
	call AddNTimes
	ld b, h
	ld c, l
	call Function1011df
	ld d, h
	ld e, l
	ld hl, $c608
	call CopyBytes
	ret
; 1011df

Function1011df: ; 1011df
	ld a, [StringBuffer2 + 4]
	ld l, a
	ld a, [StringBuffer2 + 5]
	ld h, a
	ret
; 1011e8

Function1011e8: ; 1011e8
	ld a, [StringBuffer2 + 2]
	ld c, a
	ld a, [StringBuffer2 + 3]
	ld b, a
	ret
; 1011f1

Function1011f1: ; 1011f1
	ld a, $4
	call GetSRAMBank
	ld a, [$a60c]
	ld [wdc41], a
	call CloseSRAM
	ld hl, wdc41
	res 4, [hl]
	ld hl, GameTimerPause
	bit 7, [hl]
	jr z, .asm_101210
	ld hl, wdc41
	set 4, [hl]

.asm_101210
	call Function10209c
	xor a
	ld [wdc5f], a
	ld [wdc60], a
	ld a, $4
	ld [InLinkBattle], a
	ret
; 101220

Function101220: ; 101220
	xor a
	ld [InLinkBattle], a
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
	call DrawOnMap
	call ResetWindow
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
	call DrawOnMap
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
	jr z, .asm_101290
	cp $1
	ld c, $27
	jr z, .asm_101292
	cp $2
	ld c, $37
	jr z, .asm_101292

.asm_101290
	ld c, $0

.asm_101292
	ld a, c
	ld [wcd25], a
	ret
; 101297

Jumptable_101297: ; 101297
	dw Function101a97
	dw Function101ab4
	dw Function101475
	dw Function101b0f
	dw Function101438
	dw Function101b2b
	dw Function101b59
	dw Function101475
	dw Function101b70
	dw Function101438
	dw Function101b8f
	dw Function101d7b
	dw Function101d95
	dw Function101475
	dw Function101db2
	dw Function101e4f
	dw Function101475
	dw Function101e64
	dw Function101e4f
	dw Function101475
	dw Function101e64
	dw Function101d95
	dw Function101475
	dw Function101db2
	dw Function101dd0
	dw Function101de3
	dw Function101e39
	dw Function101e09
	dw Function101e4f
	dw Function101475
	dw Function101e64
	dw Function101d95
	dw Function101475
	dw Function101db2
	dw Function101e09
	dw Function101e31
	dw Function101bc8
	dw Function101438
	dw Function101be5
	dw Function101ac6
	dw Function101ab4
	dw Function101475
	dw Function101c11
	dw Function1014f4
	dw Function101cc8
	dw Function1014e2
	dw Function1014e2
	dw Function101d10
	dw Function101d2a
	dw Function101d2a
	dw Function101507
	dw Function10156d
	dw Function101557
	dw Function10158a
	dw Function101c42
	dw Function101aed
	dw Function101ab4
	dw Function101475
	dw Function101c2b
	dw Function1014f4
	dw Function101cdf
	dw Function1014e2
	dw Function1014e2
	dw Function101d1e
	dw Function101d2a
	dw Function101d2a
	dw Function101507
	dw Function10156d
	dw Function101544
	dw Function10158a
	dw Function101c42
	dw Function101c50
	dw Function1014ce
	dw Function101cf6
	dw Function101826
	dw Function1017e4
	dw Function1017f1
	dw Function1018a8
	dw Function1018d6
	dw Function1017e4
	dw Function1017f1
	dw Function1018e1
	dw Function1015df
	dw Function10167d
	dw Function10168a
	dw Function10162a
	dw Function1015be
	dw Function10167d
	dw Function10168a
	dw Function10161f
	dw Function10159d
	dw Function10167d
	dw Function10168a
	dw Function101600
	dw Function101d03
	dw Function101d6b
	dw Function10159d
	dw Function1014ce
	dw Function10168e
	dw Function101600
	dw Function101913
	dw Function10194b
	dw Function10196d
	dw Function1017e4
	dw Function1017f5
	dw Function1019ab
	dw Function101537
	dw Function101571
	dw Function101c92
	dw Function10152a
	dw Function101571
	dw Function101a4f
	dw Function101cbc
	dw Function101c62
	dw Function101537
	dw Function101571
	dw Function101c92
	dw Function10152a
	dw Function101571
	dw Function101ca0
	dw Function101475
	dw Function101cbc
; 10138b

Function10138b: ; 10138b
	callba Function8adcc
	ld c, $0
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
	cp $1
	jr z, .asm_1013a9
	inc c

.asm_1013a9
	ret
; 1013aa

Function1013aa: ; 1013aa
	call WhiteBGMap
	call Function1d7d
	call Function2bae
	callba Function106464
	call DrawOnMap
	call Function2b5c
	ret
; 1013c0

Function1013c0: ; 1013c0
	callba Function8000
	callba Function106462
	callba Function106464
	call Function2b5c
	ret
; 1013d6

Function1013d6: ; 1013d6
	callba Function104000
	ret
; 1013dd

Function1013dd: ; 1013dd
	call Function3238
	ret
; 1013e1

Function1013e1: ; 1013e1 ; unreferenced
	push de
	inc de
	ld b, a
	ld c, $0
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
	ld b, $0
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
	ld a, $1
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
	ld a, $0
	ld [wcd26], a
	ld a, [wcd25]
	inc a
	ld [wcd25], a
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
	ld a, $0
	ld [wcd26], a
	ld a, [wcd25]
	inc a
	ld [wcd25], a
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
	and $3
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
	callba Function100641
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 1014e2

Function1014e2: ; 1014e2
	ld hl, wcd29
	set 6, [hl]
	ld a, $0
	ld [wcd26], a
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 1014f4

Function1014f4: ; 1014f4
	callba Function100082
	ld hl, wcd29
	set 6, [hl]
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 101507

Function101507: ; 101507
	ld de, wcd30
	ld hl, $0040
	ld bc, $0040
	ld a, $2
	call Function3e32
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 10151d

Function10151d: ; 10151d ; unreferenced
	ld a, $34
	call Function3e32
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 10152a

Function10152a: ; 10152a
	ld a, $36
	call Function3e32
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 101537

Function101537: ; 101537
	ld a, $a
	call Function3e32
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 101544

Function101544: ; 101544
	callba Function100641
	ld a, $12
	call Function3e32
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 101557

Function101557: ; 101557
	callba Function100641
	ld hl, wcd53
	ld a, $8
	call Function3e32
	ld a, [wcd25]
	inc a
	ld [wcd25], a
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
	cp $1
	jr z, .asm_101582
	ld [wcd2b], a
	ret

.asm_101582
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 10158a

Function10158a: ; 10158a
	callba Function10064c
	ld a, [wcd44]
	cp $a
	jr c, Function10156d
	ld a, $fb
	ld [wcd2b], a
	ret
; 10159d

Function10159d: ; 10159d
	ld de, $c608
	callba Function100edf
	ld de, $c608
	ld a, $5
	ld hl, $d800
	call Function10174c
	ld a, $0
	ld [wcd26], a
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 1015be

Function1015be: ; 1015be
	ld de, $c608
	callba Function100eed
	ld de, $c608
	ld a, $5
	ld hl, $d800
	call Function10174c
	ld a, $0
	ld [wcd26], a
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 1015df

Function1015df: ; 1015df
	ld de, $c608
	callba Function100ef4
	ld de, $c608
	ld a, $5
	ld hl, $d800
	call Function10174c
	ld a, $0
	ld [wcd26], a
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 101600

Function101600: ; 101600
	ld hl, $d800
	ld de, $c608
	ld bc, $01e0
	ld a, $5
	call FarCopyWRAM
	ld de, $c608
	callba Function100ee6
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 10161f

Function10161f: ; 10161f
	call Function101649
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 10162a

Function10162a: ; 10162a
	call Function101663
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 101635

Function101635: ; 101635
	ld de, $c608
	ld bc, $01e0
	call FarCopyWRAM
	ret
; 10163f

Function10163f: ; 10163f
	ld hl, $c608
	ld bc, $01e0
	call FarCopyWRAM
	ret
; 101649

Function101649: ; 101649
	ld a, $5
	ld hl, $d800
	call Function101635
	ld a, $5
	ld de, wda00
	call Function10163f
	ret
; 10165a

Function10165a: ; 10165a
	ld a, $5
	ld hl, wda00
	call Function101635
	ret
; 101663

Function101663: ; 101663
	ld a, $5
	ld hl, $d800
	call Function101635
	ld a, $5
	ld de, wdc00
	call Function10163f
	ret
; 101674

Function101674: ; 101674 ; unreferenced
	ld a, $5
	ld hl, wdc00
	call Function101635
	ret
; 10167d

Function10167d: ; 10167d
	ld a, $0
	ld [wcd26], a
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 10168a

Function10168a: ; 10168a
	call Function101418
	ret c

Function10168e: ; 10168e
	ld b, $0
	ld c, $1
	callba Function10079c
	ret c
	ld c, $1
	ld b, $3
	callba Function10062d
	ret c
	ld a, [wcd26]
	ld hl, Jumptable_1016c3
	rst JumpTable
	ld hl, wcd29
	set 6, [hl]
	ld a, [wcd26]
	bit 7, a
	ret z
	ld a, $0
	ld [wcd26], a
	ld a, [wcd25]
	inc a
	ld [wcd25], a
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
	ld a, $0
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
	ld a, $0
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
	ld b, $0
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
	ld bc, $0054
	ld a, $11
	call ByteFill
	ret
; 10177b

Function10177b: ; 10177b
	ld a, [Unknown_10173a]
	ld c, a
	ld b, $0
	ld a, [wcd3a]
	ld hl, $0000
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
	ld b, $0
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
	ld a, $0
	ld [wcd27], a
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 1017f1

Function1017f1: ; 1017f1
	call Function101418
	ret c

Function1017f5: ; 1017f5
	ld b, $0
	ld c, $1
	callba Function10079c
	ret c
	ld c, $1
	ld b, $3
	callba Function10062d
	ret c
	callba Function100382
	ld a, [wcd27]
	bit 7, a
	jr nz, .asm_10181e
	ld hl, wcd29
	set 6, [hl]
	ret

.asm_10181e
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 101826

Function101826: ; 101826
	ld a, [wcd21]
	cp $2
	jr z, .asm_101833
	cp $1
	jr z, .asm_101844
	jr .asm_101869

.asm_101833
	ld hl, Unknown_10186f
	ld de, wccb4
	call Function1013f5
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret

.asm_101844
	callba Function103654
	ld a, c
	ld hl, Unknown_101882
	cp $1
	jr z, .asm_10185b
	ld hl, Unknown_101895
	cp $2
	jr z, .asm_10185b
	jr .asm_101869

.asm_10185b
	ld de, wccb4
	call Function1013f5
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret

.asm_101869
	ld a, $fe
	ld [wcd2b], a
	ret
; 10186f


SECTION "ascii 10186f", ROMX, BANK[$40]

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


SECTION "bank40_3", ROMX, BANK[$40]

Function1018a8: ; 1018a8
	ld hl, wccb5
	ld de, wcc61
	ld a, $4
	call Function101406
	jr c, .asm_1018d0
	ld hl, wccb9
	ld de, wcc65
	ld a, $6
	call Function101406
	jr c, .asm_1018ca
	ld a, [wcd25]
	inc a
	ld [wcd25], a
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
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 1018e1

Function1018e1: ; 1018e1
	call Function1018fb
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 1018ec

Function1018ec: ; 1018ec
	ld a, $a
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
	ld bc, $000a
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
	cp $1
	jr z, .asm_10193f
	cp $2
	jr z, .asm_101945
	ld a, $71
	ld [wcd25], a
	ret

.asm_10193f
	ld a, $66
	ld [wcd25], a
	ret

.asm_101945
	ld a, $65
	ld [wcd25], a
	ret
; 10194b

Function10194b: ; 10194b
	call Function2ed3
	call ClearSprites
	callba Function1021f9
	ld hl, wcd29
	bit 3, [hl]
	jr nz, .asm_101967
	call Function1013c0
	ld a, $71
	ld [wcd25], a
	ret

.asm_101967
	ld a, $60
	ld [wcd25], a
	ret
; 10196d

Function10196d: ; 10196d
	callba Function8000
	callba Function10060d
	ld hl, wcd29
	set 5, [hl]
	ld hl, wcd2a
	set 6, [hl]
	ld a, $6
	ld [wccb4], a
	ld hl, wdc5c
	ld de, wccb5
	ld bc, $0003
	call CopyBytes
	ld hl, wcd6c
	ld a, [hli]
	ld [wccb8], a
	ld a, [hli]
	ld [wccb9], a
	ld a, [hl]
	ld [wccba], a
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 1019ab

Function1019ab: ; 1019ab
	call Function101a75
	callba Function100754
	xor a
	ld [wdc5f], a
	ld [wdc60], a
	callba Function8000
	call SpeechTextBox
	callba Function100846
	ld c, $78
	call DelayFrames
	callba ClearTileMap
	call Function1019ee
	call Function101a21
	ld a, [wcd2b]
	cp $fc
	jr nz, .asm_1019e6
	xor a
	ld [wcd2b], a

.asm_1019e6
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 1019ee

Function1019ee: ; 1019ee
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld bc, wdc0d
	ld de, wdc11
	callba Function4e929
	pop af
	ld [rSVBK], a
	ld a, c
	ld [OtherTrainerClass], a
	ld hl, wd26b
	ld de, $c656
	ld bc, $000b
	call CopyBytes
	ld a, [wcd2f]
	and a
	ld a, $2
	jr z, .asm_101a1e
	ld a, $1

.asm_101a1e
	ld [$ffcb], a
	ret
; 101a21

Function101a21: ; 101a21
	ld hl, Options
	ld a, [hl]
	push af
	and $20
	or $1
	ld [hl], a
	ld a, $1
	ld [wc2d7], a
	callba Function3f4dd
	callba Function3c000
	callba Function3f759
	xor a
	ld [wc2d7], a
	ld a, $ff
	ld [$ffcb], a
	pop af
	ld [Options], a
	ret
; 101a4f

Function101a4f: ; 101a4f
	ld a, $1
	ld [wc2d7], a
	callba Function3f77c
	xor a
	ld [wc2d7], a
	callba Function3f6d0
	callba Function1500c
	call Function1013c0
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 101a75

Function101a75: ; 101a75
	ld hl, wcc61
	ld de, wcd75
	ld bc, $0003
	call CopyBytes
	ld de, wcc64
	callba Function100772
	callba Function101050
	callba Function1010f2
	ret
; 101a97

Function101a97: ; 101a97
	callba Function115d99
	ld hl, wcd29
	set 7, [hl]
	ld c, $2
	call Function10142c
	ld hl, wcd29
	set 6, [hl]
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 101ab4

Function101ab4: ; 101ab4
	ld e, $1
	call Function101ee4
	ld hl, wcd29
	set 5, [hl]
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 101ac6

Function101ac6: ; 101ac6
	callba Function115d99
	ld hl, wcd29
	set 7, [hl]
	ld c, $2
	call Function10142c
	ld hl, wcd29
	set 6, [hl]
	xor a
	ld [wcd2f], a
	ld de, wdc42
	call Function102068
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 101aed

Function101aed: ; 101aed
	callba Function115d99
	ld hl, wcd29
	set 7, [hl]
	ld c, $2
	call Function10142c
	ld hl, wcd29
	set 6, [hl]
	ld a, $1
	ld [wcd2f], a
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 101b0f

Function101b0f: ; 101b0f
	ld c, $0
	call Function10142c
	ld e, $3
	call Function101ee4
	ld hl, wcd29
	set 5, [hl]
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ld a, $0
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
	ld a, $0
	ld [wcd26], a
	ld a, [wcfa9]
	cp $1
	jr z, .asm_101b51
	ld a, $2
	ld [wcd2b], a
	ret

.asm_101b51
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 101b59

Function101b59: ; 101b59
	ld c, $2
	call Function10142c
	ld e, $2
	call Function101ee4
	ld hl, wcd29
	set 5, [hl]
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 101b70

Function101b70: ; 101b70
	ld c, $2
	call Function10142c
	ld e, $4
	call Function101ee4
	ld hl, wcd29
	set 5, [hl]
	call DrawOnMap
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ld a, $0
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
	ld a, $0
	ld [wcd26], a
	ld a, [wcfa9]
	cp $1
	jr z, .asm_101bbc
	ld a, $1
	ld [wcd2f], a
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret

.asm_101bbc
	xor a
	ld [wcd2f], a
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 101bc8

Function101bc8: ; 101bc8
	ld c, $2
	call Function10142c
	ld e, $8
	call Function101ee4
	call Function102048
	call Function1013dd
	ld a, $0
	ld [wcd26], a
	ld a, [wcd25]
	inc a
	ld [wcd25], a
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
	ld a, $0
	ld [wcd26], a
	ld a, [wcfa9]
	cp $1
	jr nz, .asm_101c0b
	ld a, $2a
	ld [wcd25], a
	ret

.asm_101c0b
	ld a, $2
	ld [wcd2b], a
	ret
; 101c11

Function101c11: ; 101c11
	ld a, $1
	ld [wdc5f], a
	ld e, $9
	call Function101ee4
	call Function102048
	ld hl, wcd29
	set 5, [hl]
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 101c2b

Function101c2b: ; 101c2b
	ld a, $2
	ld [wdc5f], a
	ld e, $7
	call Function101ee4
	ld hl, wcd29
	set 5, [hl]
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 101c42

Function101c42: ; 101c42
	ld hl, wcd2a
	set 1, [hl]
	call Function100665
	ld a, $47
	ld [wcd25], a
	ret
; 101c50

Function101c50: ; 101c50
	ld e, $a
	call Function101ee4
	ld hl, wcd29
	set 2, [hl]
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 101c62

Function101c62: ; 101c62
	callba Function115d99
	ld hl, wcd29
	set 7, [hl]
	ld c, $1
	call Function10142c
	xor a
	ld [wc30d], a
	ld hl, wcd29
	res 4, [hl]
	ld e, $b
	call Function101ee4
	ld hl, wcd29
	set 5, [hl]
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ld a, $0
	ld [wcd26], a
	ret
; 101c92

Function101c92: ; 101c92
	callba Function100675
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 101ca0

Function101ca0: ; 101ca0
	ld c, $2
	call Function10142c
	ld e, $c
	call Function101ee4
	ld hl, wcd29
	set 5, [hl]
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ld a, $0
	ld [wcd26], a
	ret
; 101cbc

Function101cbc: ; 101cbc
	ld a, $1
	ld [wcd2b], a
	ret
; 101cc2

Function101cc2: ; 101cc2 ; unreferenced
	ld a, $2
	ld [wcd2b], a
	ret
; 101cc8

Function101cc8: ; 101cc8
	ld a, $1
	ld [wc314], a
	ld a, $1
	ld [wc30d], a
	ld hl, wcd29
	set 4, [hl]
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 101cdf

Function101cdf: ; 101cdf
	ld a, $6
	ld [wc314], a
	ld a, $1
	ld [wc30d], a
	ld hl, wcd29
	set 4, [hl]
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 101cf6

Function101cf6: ; 101cf6
	ld a, $b
	ld [wc315], a
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 101d03

Function101d03: ; 101d03
	ld a, $e
	ld [wc315], a
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 101d10

Function101d10: ; 101d10
	ld c, $1
	call Function10142c
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	jr Function101d2a

Function101d1e: ; 101d1e
	ld c, $3
	call Function10142c
	ld a, [wcd25]
	inc a
	ld [wcd25], a

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
	ld a, $0
	ld [wcd26], a
	ld a, [wcd25]
	inc a
	ld [wcd25], a
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
	ld [wcd25], a
	ret
; 101d7b

Function101d7b: ; 101d7b
	callba Function10138b
	ld b, 0
	ld hl, Unknown_101d8d
	add hl, bc
	ld c, [hl]
	ld a, c
	ld [wcd25], a
	ret
; 101d8d

Unknown_101d8d: ; 101d8d
	db $15, $15, $1f, $1f, $0c, $12, $3a, $3a
; 101d95

Function101d95: ; 101d95
	call Function101ee2
	call Function1d6e
	ld e, $e
	call Function101ee4
	ld hl, wcd29
	set 5, [hl]
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ld a, $0
	ld [wcd26], a
	ret
; 101db2

Function101db2: ; 101db2
	callba Function103302
	call ExitMenu
	ld hl, wcd29
	set 5, [hl]
	jr c, .asm_101dca
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret

.asm_101dca
	ld a, $2
	ld [wcd2b], a
	ret
; 101dd0

Function101dd0: ; 101dd0
	ld hl, wdc41
	bit 1, [hl]
	jr nz, .asm_101ddd
	ld a, $19
	ld [wcd25], a
	ret

.asm_101ddd
	ld a, $1b
	ld [wcd25], a
	ret
; 101de3

Function101de3: ; 101de3
	call Function101ecc
	call Function101ead
	jr c, .asm_101df3
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret

.asm_101df3
	call Function101e98
	jr c, .asm_101e00
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret

.asm_101e00
	call Function101ed3
	ld a, $2
	ld [wcd2b], a
	ret
; 101e09

Function101e09: ; 101e09
	call Function101ead
	jr c, .asm_101e16
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret

.asm_101e16
	call Function101ecc
	call Function101e98
	push af
	call Function101ed3
	pop af
	jr c, .asm_101e2b
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret

.asm_101e2b
	ld a, $2
	ld [wcd2b], a
	ret
; 101e31

Function101e31: ; 101e31
	ld a, $3a
	ld [wcd25], a
	jp Function101c2b
; 101e39

Function101e39: ; 101e39
	call Function1020bf
	push af
	call Function101ed3
	pop af
	jr c, .asm_101e49
	ld a, $2a
	ld [wcd25], a
	ret

.asm_101e49
	ld a, $2
	ld [wcd2b], a
	ret
; 101e4f

Function101e4f: ; 101e4f
	ld e, $6
	call Function101ee4
	call Function1013d6
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ld a, $0
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
	ld [wcd25], a
	ret

.asm_101e77
	ld hl, wcd29
	set 5, [hl]
	ld a, $2
	ld [wcd2b], a
	ret
; 101e82

Function101e82: ; 101e82 ; unreferenced
	call Function101ecc
	ld a, [wcd25]
	inc a
	ld [wcd25], a
	ret
; 101e8d

Function101e8d: ; 101e8d ; unreferenced
	call Function101ed3
	ld a, [wcd25]
	inc a
	ld [wcd25], a
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
rept 2
	add hl, de
endr
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
	ld c, $2
	call Function10142c
	ld e, $d
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
	cp $a
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
	ld c, $8
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
	and $f
	cp $f
	jr z, .asm_10208a
	add $30
	ld [hli], a
	ret

.asm_10208a
	ld [hl], $0
	scf
	ret
; 10208e

Function10208e: ; 10208e
	push de
	ld h, d
	ld l, e
	ld de, wdc42
	ld bc, $0008
	call CopyBytes
	pop de
	ret
; 10209c

Function10209c: ; 10209c
	ld a, $ff
	ld hl, wdc42
	ld bc, $0008
	call ByteFill
	ret
; 1020a8

Function1020a8: ; 1020a8
	call Function10209c
	ld c, $1
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
	ld bc, $0025
	call AddNTimes
	ld d, h
	ld e, l
	ld a, $4
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
	jr z, .asm_102110
	ld hl, wdc41
	bit 2, [hl]
	jr nz, .asm_102110
	call Function10218d
	ld hl, $c608
	bit 4, [hl]
	jr z, .asm_102110
	ld hl, $c608
	bit 2, [hl]
	jr nz, .asm_102110
	call Function102112
	jr z, .asm_102110
	and a
	ret

.asm_102110
	scf
	ret
; 102112

Function102112: ; 102112
	ld a, $4
	call GetSRAMBank
	ld hl, $a041
	ld c, $28
.asm_10211c
	push hl
	ld de, $c60f
	ld b, $1f
.asm_102122
	ld a, [de]
	cp [hl]
	jr nz, .asm_10212f
	inc de
	inc hl
	dec b
	jr nz, .asm_102122
	pop hl
	xor a
	jr .asm_10213c

.asm_10212f
	pop hl
	ld de, $0025
	add hl, de
	dec c
	jr nz, .asm_10211c
	ld a, $1
	and a
	jr .asm_10213c

.asm_10213c
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
	call Functiona36
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
	ld hl, $c608 + 1
	ld de, StringBuffer2
	ld bc, $000b
	call CopyBytes
	ret
; 10218d

Function10218d: ; 10218d
	ld hl, wdc00
	ld de, $c608
	ld bc, $0026
	ld a, $5
	call FarCopyWRAM
	ld de, $c608 + 1
	ret
; 10219f

Function10219f: ; 10219f
	call FadeToMenu
	call Function10218d
	ld de, $c608 + 1
	callba Function8ac4e
	call Functiona36
	call PlayClickSFX
	call Function1013aa
	ret
; 1021b8

Function1021b8: ; 1021b8
	call FadeToMenu
	call Function10218d
	ld de, $c60f
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
	call Functiona36
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
	ld a, $0
	ld [wcd49], a
	ld hl, wcd29
	bit 3, [hl]
	res 3, [hl]
	jr z, .asm_10220f
	ld a, $1
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
	ld bc, $000a
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
	callba Function104099
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
	ld de, $0008
	call PlaySFX
	ret
; 102283

Function102283: ; 102283
	ld a, $1
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
	cp $2
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
	ld a, $1
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
	ld b, $3
	callba Function10062d
	jr c, .asm_1022f3
	xor a
	ret

.asm_1022f3
	scf
	ret
; 1022f5

Jumptable_1022f5: ; 1022f5
	dw Function10234b
	dw Function102361
	dw Function10236e
	dw Function102387
	dw Function1023a1
	dw Function1025c7
	dw Function1025dc
	dw Function1024f6
	dw Function10250c
	dw Function1024a8
	dw Function102591
	dw Function1024a8
	dw Function1025b0
	dw Function1025bd
	dw Function102814
	dw Function10283c
	dw Function102862
	dw Function10286f
	dw Function1024a8
	dw Function1028a5
	dw Function1028ab
	dw Function1023b5
	dw Function1023c6
	dw Function1024af
	dw Function102416
	dw Function102423
	dw Function10244b
	dw Function1024af
	dw Function10246a
	dw Function102652
	dw Function10266b
	dw Function1025e9
	dw Function1025ff
	dw Function102738
	dw Function102754
	dw Function1026b7
	dw Function1026c8
	dw Function1028bf
	dw Function1028c6
	dw Function1028d3
	dw Function1028da
	dw Function1024a8
	dw Function10248d
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
	ld a, $1
	ld [wcfa9], a

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
	callba Functione039
	ld hl, PartyCount
	inc [hl]
	ld a, [hli]
	ld c, a
	ld b, $0
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
	ld a, $0
	ld [wcd4f], a
	ld a, $0
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
	callba Function14a58
	callba Function1060af
	callba Function106187
	ld hl, wcd4b
	set 1, [hl]
	ld a, $0
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
	ld a, $0
	ld [wcd4f], a
	ld a, $0
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
	ld a, $0
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
	ld a, $0
	ld [wcd4a], a
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret
; 1024f6

Function1024f6: ; 1024f6
	call Function1bee
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
	cp $f
	jr z, .asm_10254b
	and a
	jr z, .asm_102572
	cp $aa
	jr z, .asm_102572
	cp $7
	jr nc, .asm_102572
	ld [wcd4d], a
	dec a
	ld [wd003], a
	ld a, [wcd4c]
	dec a
	ld [DefaultFlypoint], a
	call Function102b9c
	call Function102bdc
	jr c, .asm_10256d
	callba Functionfb5dd
	jr c, .asm_102568
	ld hl, wcd4b
	set 1, [hl]
	ld a, $e
	ld [wcd49], a
	ret

.asm_10254b
	call Function103021
	ld hl, wcd4b
	set 1, [hl]
	ld a, $0
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
	ld a, $0
	ld [wcd4a], a
	ld a, $1e
	ld [wcd4e], a
	ld a, $3c
	ld [wcd4f], a
	ld a, $9
	ld [wcd49], a
	ret
; 102591

Function102591: ; 102591
	call Function102ee7
	ld hl, wcd4b
	set 1, [hl]
	ld a, $0
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
	ld a, $9
	call Function1028e8
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret
; 1025bd

Function1025bd: ; 1025bd
	call Function1028fc
	ret nc
	ld a, $4
	ld [wcd49], a
	ret
; 1025c7

Function1025c7: ; 1025c7
	call Function102f6d
	ld hl, wcd4b
	set 1, [hl]
	ld a, $f
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
	callba Function241ba
	ld a, [wcfa8]
	and c
	ret z
	bit 0, c
	jr nz, .asm_102623
	bit 6, c
	jr nz, .asm_10262e
	bit 7, c
	jr nz, .asm_102646
	ret

.asm_102623
	ld hl, wcd4b
	set 3, [hl]
	ld a, $27
	ld [wcd49], a
	ret

.asm_10262e
	ld a, [wcfa9]
	ld b, a
	ld a, [OTPartyCount]
	cp b
	ret nz
	call Function1bf7
	ld a, [PartyCount]
	ld [wcfa9], a
	ld a, $1d
	ld [wcd49], a
	ret

.asm_102646
	ld a, [wcfa9]
	cp $1
	ret nz
	ld a, $23
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
	callba Function241ba
	ld a, [wcfa8]
	and c
	ret z
	bit 0, c
	jr nz, .asm_10268f
	bit 7, c
	jr nz, .asm_10269a
	bit 6, c
	jr nz, .asm_1026a8
	ret

.asm_10268f
	ld hl, wcd4b
	set 3, [hl]
	ld a, $21
	ld [wcd49], a
	ret

.asm_10269a
	ld a, [wcfa9]
	dec a
	ret nz
	call Function1bf7
	ld a, $1f
	ld [wcd49], a
	ret

.asm_1026a8
	ld a, [wcfa9]
	ld b, a
	ld a, [PartyCount]
	cp b
	ret nz
	ld a, $23
	ld [wcd49], a
	ret
; 1026b7

Function1026b7: ; 1026b7
	ld hl, wcd4b
	set 6, [hl]
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ld a, $0
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
	call Function1bf7
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
	bit 0, a
	jr nz, .asm_102723
	bit 6, a
	jr nz, .asm_102712
	bit 7, a
	jr nz, .asm_102702
	ret

.asm_102702
	hlcoord 9, 17
	ld [hl], $7f
	ld a, $1
	ld [wcfa9], a
	ld a, $1d
	ld [wcd49], a
	ret

.asm_102712
	hlcoord 9, 17
	ld [hl], $7f
	ld a, [OTPartyCount]
	ld [wcfa9], a
	ld a, $1f
	ld [wcd49], a
	ret

.asm_102723
	hlcoord 9, 17
	ld [hl], $ec
	ld hl, wcd4b
	set 3, [hl]
	ld hl, wcd4b
	set 2, [hl]
	ld a, $5
	ld [wcd49], a
	ret
; 102738

Function102738: ; 102738
	ld hl, wcd4b
	set 6, [hl]
	call Function1bee
	call Function1027eb
	ld hl, wcd4b
	set 1, [hl]
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ld a, $0
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
	ld a, $1
	ld [wcd4a], a

Function102775: ; 102775
	hlcoord 1, 16
	ld [hl], $ed
	hlcoord 11, 16
	ld [hl], $7f
	ld hl, wcd4b
	set 2, [hl]
	ld a, [wcd4a]
	inc a
	ld [wcd4a], a
	ret
; 10278c

Function10278c: ; 10278c
	ld a, [hJoyPressed]
	bit 0, a
	jr nz, asm_1027c6
	bit 1, a
	jr nz, asm_1027e2
	bit 4, a
	jr nz, .asm_10279b
	ret

.asm_10279b
	ld a, $3
	ld [wcd4a], a

Function1027a0: ; 1027a0
	hlcoord 1, 16
	ld [hl], $7f
	hlcoord 11, 16
	ld [hl], $ed
	ld hl, wcd4b
	set 2, [hl]
	ld a, [wcd4a]
	inc a
	ld [wcd4a], a
	ret

Function1027b7: ; 1027b7
	ld a, [hJoyPressed]
	bit 0, a
	jr nz, asm_1027d1
	bit 1, a
	jr nz, asm_1027e2
	bit 5, a
	jr nz, Function102770
	ret

asm_1027c6:
	ld hl, wcd4b
	set 3, [hl]
	ld a, $25
	ld [wcd49], a
	ret

asm_1027d1:
	ld hl, wcd4b
	set 3, [hl]
	ld a, [wcfa9]
	ld [wcd4c], a
	ld a, $7
	ld [wcd49], a
	ret

asm_1027e2:
	call Function102db7
	ld a, $1d
	ld [wcd49], a
	ret
; 1027eb

Function1027eb: ; 1027eb
	hlcoord 0, 14
	ld b, $2
	ld c, $12
	ld d, h
	ld e, l
	callba Function16d61d
	ld de, String_102804
	hlcoord 2, 16
	call PlaceString
	ret
; 102804

String_102804: ; 102804
	db "STATS     TRADE@"
; 102814

Function102814: ; 102814
	ld a, [wcfa9]
	ld [wcd52], a
	ld a, [wcd4c]
	dec a
	ld [DefaultFlypoint], a
	ld a, [wcd4d]
	dec a
	ld [wd003], a
	call Function102ea8
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ld a, $0
	ld [wcd4a], a
	ld hl, wcd4b
	set 1, [hl]

Function10283c: ; 10283c
	ld hl, wcd4b
	set 2, [hl]
	call Function1029c3
	ret z
	jr c, .asm_102852
	ld a, $10
	ld [wcd49], a
	ld hl, wcd4b
	set 1, [hl]
	ret

.asm_102852
	ld a, $14
	ld [wcd49], a
	ld hl, wcd4b
	set 3, [hl]
	ld hl, wcd4b
	set 1, [hl]
	ret
; 102862

Function102862: ; 102862
	ld a, $8
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
	ld [wcfa9], a
	ld a, [wcd51]
	cp $8
	jr nz, .asm_102886
	ld a, $15
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
	ld a, $0
	ld [wcd4a], a
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret
; 1028a5

Function1028a5: ; 1028a5
	ld a, $4
	ld [wcd49], a
	ret
; 1028ab

Function1028ab: ; 1028ab
	ld a, [wcd52]
	ld [wcfa9], a
	call Function102f15
	ld hl, wcd4b
	set 1, [hl]
	ld a, $c
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
	ld a, $1d
	ld [wcd49], a
	ret
; 1028d3

Function1028d3: ; 1028d3
	ld a, [wcd49]
	inc a
	ld [wcd49], a

Function1028da: ; 1028da
	ld a, $1
	ld [MonType], a
	call Function102bac
	ld a, $1f
	ld [wcd49], a
	ret
; 1028e8

Function1028e8: ; 1028e8
	ld hl, wcd4b
	res 6, [hl]
	ld [wcd50], a
	callba Function100641
	ld a, $0
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
	ld a, $0
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
	ld a, $0
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
	ld a, $0
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
	ld a, $1
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
	call Function1d6e
	hlcoord 10, 7
	ld b, $3
	ld c, $8
	ld d, h
	ld e, l
	callba Function16d61d
	ld de, String_102a26
	hlcoord 12, 8
	call PlaceString
	ld hl, wcd4b
	set 1, [hl]
	ld de, Unknown_102a33
	call Function1bb1
	ld a, [wcd4a]
	inc a
	ld [wcd4a], a
	xor a
	ret
; 1029fe

Function1029fe: ; 1029fe
	callba Function1009f3
	ret c
	callba Function241ba
	ld a, c
	ld hl, wcfa8
	and [hl]
	ret z
	push af
	call ExitMenu
	pop af
	ld a, [wcfa9]
	cp $1
	jr nz, .asm_102a21
	ld a, $1
	and a
	ret

.asm_102a21
	ld a, $1
	and a
	scf
	ret
; 102a26

String_102a26: ; 102a26
	db   "TRADE"
	next "CANCEL"
	db   "@"
; 102a33

Unknown_102a33:
	db $08, $0b, $02, $01, $80, $00, $20, $01

Function102a3b: ; 102a3b
	ld a, [wcd30]
	ld [wc74e], a
	ld hl, PlayerName
	ld de, $c6e7
	ld bc, $000b
	call CopyBytes
	ld a, [wcd4c]
	dec a
	ld c, a
	ld b, $0
	ld hl, PartySpecies
	add hl, bc
	ld a, [hl]
	ld [$c6d0], a
	ld a, [wcd4c]
	dec a
	ld hl, PartyMonOT
	call SkipNames
	ld de, $c6f2
	ld bc, $000b
	call CopyBytes
	ld a, [wcd4c]
	dec a
	ld hl, PartyMon1ID
	call GetPartyLocation
	ld a, [hli]
	ld [$c6ff], a
	ld a, [hl]
	ld [wc700], a
	ld a, [wcd4c]
	dec a
	ld hl, PartyMon1DVs
	call GetPartyLocation
	ld a, [hli]
	ld [$c6fd], a
	ld a, [hl]
	ld [$c6fe], a
	ld a, [wcd4c]
	dec a
	ld hl, PartyMon1Species
	call GetPartyLocation
	ld b, h
	ld c, l
	callba GetCaughtGender
	ld a, c
	ld [wc701], a
	ld hl, wd26b
	ld de, wc719
	ld bc, $000b
	call CopyBytes
	ld a, [wcd4d]
	dec a
	ld c, a
	ld b, $0
	ld hl, OTPartySpecies
	add hl, bc
	ld a, [hl]
	ld [wc702], a
	ld a, [wcd4d]
	dec a
	ld hl, OTPartyMonOT
	call SkipNames
	ld de, wc724
	ld bc, $000b
	call CopyBytes
	ld a, [wcd4d]
	dec a
	ld hl, OTPartyMon1ID
	call GetPartyLocation
	ld a, [hli]
	ld [wc731], a
	ld a, [hl]
	ld [wc732], a
	ld a, [wcd4d]
	dec a
	ld hl, OTPartyMon1DVs
	call GetPartyLocation
	ld a, [hli]
	ld [wc72f], a
	ld a, [hl]
	ld [wc730], a
	ld a, [wcd4d]
	dec a
	ld hl, OTPartyMon1Species
	call GetPartyLocation
	ld b, h
	ld c, l
	callba GetCaughtGender
	ld a, c
	ld [wc733], a
	ret
; 102b12

Function102b12: ; 102b12
	ld c, $64
	call DelayFrames
	call Function102d9a
	call Functione58
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
	ld a, $1
	ld [wd1e9], a
	callba Function421d8
	call Function102d9a
	call Function102dd3
	call Function102dec
	ret
; 102b4e

Function102b4e: ; 102b4e
	ld a, $1
	ld [MonType], a
	ld a, [wcfa9]
	push af
	ld de, Unknown_102b73
	call Function1bb1
	pop af
	ld [wcfa9], a
	ld a, [OTPartyCount]
	ld [wcfa3], a
	ret
; 102b68

Function102b68: ; 102b68 ; unreferenced
	xor a
	ld hl, wcf71
	ld bc, $0010
	call ByteFill
	ret
; 102b73

Unknown_102b73:
	db $09, $06, $ff, $01, $a0, $00, $10, $c1

Function102b7b: ; 102b7b
	xor a
	ld [MonType], a
	ld a, [wcfa9]
	push af
	ld de, Unknown_102b94
	call Function1bb1
	pop af
	ld [wcfa9], a
	ld a, [PartyCount]
	ld [wcfa3], a
	ret
; 102b94

Unknown_102b94:
	db $01, $06, $ff, $01, $a0, $00, $10, $c1

Function102b9c: ; 102b9c
	ld a, [wcd4d]
	dec a
	hlcoord 6, 9
	ld bc, $0014
	call AddNTimes
	ld [hl], $ec
	ret
; 102bac

Function102bac: ; 102bac
	ld a, [wcfa9]
	dec a
	ld [CurPartyMon], a
	call LowVolume
	call ClearSprites
	callba Function4dc8f
	ld a, [CurPartyMon]
	inc a
	ld [wcfa9], a
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
	ld b, $0
	ld hl, OTPartyCount
	add hl, bc
	ld a, [hl]
	pop hl
	cp EGG
	jr z, .asm_102bfa
	cp [hl]
	jr nz, .asm_102c05

.asm_102bfa
	ld bc, OTPartyMon1Level - OTPartyMon1
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
	ld bc, $0001
	call Function102c71
	ret
; 102c21

Function102c21: ; 102c21
	ld hl, PartyMonNicknames
	ld de, OTPartyMonNicknames
	ld bc, $000b
	call Function102c71
	ret
; 102c2e

Function102c2e: ; 102c2e
	ld hl, PartyMonOT
	ld de, OTPartyMonOT
	ld bc, $000b
	call Function102c71
	ret
; 102c3b

Function102c3b: ; 102c3b
	ld hl, PartyMon1
	ld de, OTPartyMon1
	ld bc, $0030
	call Function102c71
	ret
; 102c48

Function102c48: ; 102c48
	callba Function10165a
	ld a, $0
	call GetSRAMBank
	ld hl, $a600
	ld de, $c608
	ld bc, $002f
	call Function102c71
	call CloseSRAM
	ld hl, $c608
	ld de, wda00
	ld bc, $01e0
	ld a, $5
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
	ld a, [wcf63]
	push af
	ld a, [wcf64]
	push af
	ld a, [wcd4c]
	ld [wcf63], a
	ld a, [PartyCount]
	ld [wcf64], a
	ld a, $0
	ld hl, $a600
	ld de, $c608
	ld bc, $011a
	call Function102d3e
	call Function102cee
	ld a, $0
	ld hl, $c608
	ld de, $a600
	ld bc, $011a
	call Function102d3e
	ld a, [wcd4d]
	ld [wcf63], a
	ld a, [OTPartyCount]
	ld [wcf64], a
	ld a, $5
	ld hl, wda00
	ld de, $c608
	ld bc, $011a
	call FarCopyWRAM
	call Function102cee
	ld a, $5
	ld hl, $c608
	ld de, wda00
	ld bc, $011a
	call FarCopyWRAM
	pop af
	ld [wcf64], a
	pop af
	ld [wcf63], a
	ret
; 102cee

Function102cee: ; 102cee
	ld a, [wcf63]
	dec a
	call Function102d34
	ld de, DefaultFlypoint
	ld bc, $002f
	call CopyBytes
	ld a, [wcf63]
	ld c, a
	ld a, $6
	sub c
	ret z
	ld bc, $002f
	ld hl, $0000
	call AddNTimes
	push hl
	ld a, [wcf63]
	dec a
	call Function102d34
	ld d, h
	ld e, l
	ld hl, $002f
	add hl, de
	pop bc
	call CopyBytes
	ld a, [wcf64]
	dec a
	call Function102d34
	ld d, h
	ld e, l
	ld hl, DefaultFlypoint
	ld bc, $002f
	call CopyBytes
	ret
; 102d34

Function102d34: ; 102d34
	ld hl, $c608
	ld bc, $002f
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
	ld bc, PartyMon2 - PartyMon1
	ld hl, PartyMon1Happiness
	call AddNTimes
	ld [hl], BASE_HAPPINESS

.asm_102d6d
	ld a, [wd265]
	cp UNOWN
	jr nz, .asm_102d98
	ld a, [wcd4c]
	dec a
	ld bc, PartyMon2 - PartyMon1
	ld hl, PartyMon1DVs
	call AddNTimes
	predef GetUnownLetter
	callba Functionfba18
	ld a, [wdef4]
	and a
	jr nz, .asm_102d98
	ld a, [UnownLetter]
	ld [wdef4], a

.asm_102d98
	and a
	ret
; 102d9a

Function102d9a: ; 102d9a
	ld a, $7f
	ld hl, SpritesEnd
	ld bc, $0168
	call ByteFill
	ld a, $7
	ld hl, AttrMap
	ld bc, $0168
	call ByteFill
	callba Function104000
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
	ld b, $4
	ld c, $12
	ld d, h
	ld e, l
	callba Function16d61d
	ret
; 102dd3

Function102dd3: ; 102dd3
	call DisableLCD
	ld de, GFX_1032a2
	ld hl, VTiles0
	lb bc, BANK(GFX_1032a2), 4
	call Get2bpp
	callba Function16d421
	call EnableLCD
	ret
; 102dec

Function102dec: ; 102dec
	ld hl, Unknown_1032e2
	ld de, Unkn2Pals
	ld bc, $0020
	ld a, $5
	call FarCopyWRAM
	callba Function49742
	call Function32f9
	call DelayFrame
	ret
; 102e07

Function102e07: ; 102e07
	hlcoord 3, 10
	ld b, $1
	ld c, $b
	ld a, [IsInBattle]
	and a
	jr z, .asm_102e19
	call TextBox
	jr .asm_102e28

.asm_102e19
	hlcoord 3, 10
	ld b, $1
	ld c, $b
	ld d, h
	ld e, l
	callba Function16d61d

.asm_102e28
	ld de, String_102e32
	hlcoord 4, 11
	call PlaceString
	ret
; 102e32

String_102e32: ; 102e32
	db "Waiting...!@"
; 102e3e

Function102e3e: ; 102e3e
	ld de, String_102e48
	hlcoord 10, 17
	call PlaceString
	ret
; 102e48

String_102e48: ; 102e48
	db "CANCEL@"
; 102e4f

Function102e4f: ; 102e4f
	callba Function16d42e
	callba Function49797
	ld de, PlayerName
	hlcoord 4, 0
	call PlaceString
	ld a, $14
	ld [bc], a
	ld de, wd26b
	hlcoord 4, 8
	call PlaceString
	ld a, $14
	ld [bc], a
	hlcoord 7, 1
	ld de, PartySpecies
	call Function102e86
	hlcoord 7, 9
	ld de, OTPartySpecies
	call Function102e86
	ret
; 102e86

Function102e86: ; 102e86
	ld c, $0
.asm_102e88
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
	ld bc, $0014
	add hl, bc
	pop bc
	inc c
	jr .asm_102e88
; 102ea8

Function102ea8: ; 102ea8
	call Function102dc3
	ld a, [wcd4c]
	dec a
	ld c, a
	ld b, $0
	ld hl, PartySpecies
	add hl, bc
	ld a, [hl]
	ld [wd265], a
	call GetPokemonName
	ld hl, StringBuffer1
	ld de, StringBuffer2
	ld bc, $000b
	call CopyBytes
	ld a, [wcd4d]
	dec a
	ld c, a
	ld b, $0
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
	ld de, String_102f22
	hlcoord 1, 14
	call PlaceString
	ret
; 102f22

String_102f22: ; 102f22
	db "こうかんを キャンセルしました@"
; 102f32

Function102f32: ; 102f32
	call Function102dc3
	ld de, String_102f3f
	hlcoord 1, 14
	call PlaceString
	ret
; 102f3f

String_102f3f: ; 102f3f
	db "Trade completed!@"
; 102f50

Function102f50: ; 102f50
	call Function102dc3
	ld de, String_102f5d
	hlcoord 1, 14
	call PlaceString
	ret
; 102f5d

String_102f5d: ; 102f5d
	db "しょうしょう おまち ください@"
; 102f6d

Function102f6d: ; 102f6d
	call Function102dc3
	ld de, String_102f7a
	hlcoord 1, 14
	call PlaceString
	ret
; 102f7a

String_102f7a: ; 102f7a
	db "しゅうりょう します@"
; 102f85

Function102f85: ; 102f85
	ld a, [wd003]
	ld c, a
	ld b, $0
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
	db   "あいてがわ", $4a, "えらんだ "
	next "いじょう", $4a, "あるようです!!"
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
	db   "あいてがわ", $25, "せんたくに"
	next "いじょう", $4a, "あるようです!!"
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
	ld a, $1
	ld [hOAMUpdate], a
	call ClearSprites
	ld de, Sprites
	call Function1030cd
	xor a
	ld [hOAMUpdate], a
	ret
; 10307f

Function10307f: ; 10307f
	ld c, $2
	ld hl, wcd4b
	bit 7, [hl]
	jr z, .asm_10308a
	ld c, $1

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
rept 3
	add hl, hl
endr
	ld bc, Unknown_103112
	add hl, bc
	ld b, $30
	ld c, $8
.asm_1030de
	push hl
	ld hl, wcd4b
	bit 7, [hl]
	pop hl
	ld a, $0
	jr z, .asm_1030eb
	ld a, $5
.asm_1030eb

	add [hl]
	inc hl
	push hl

rept 2
	add a
endr

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
	ld a, $a
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
	add $8
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

Unknown_1032e2:
	db $00, $00, $ff, $1f
	db $f4, $1b, $8d, $42
	db $00, $00, $67, $45
	db $00, $00, $00, $00
	db $00, $00, $1f, $13
	db $99, $01, $ff, $10
	db $00, $00, $19, $00
	db $00, $00, $00, $00
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
	ld bc, $000a
	xor a
	call ByteFill
	ld a, $4
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
	call DrawOnMap
	callba Function104000
	ld a, $1
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
	callba Function10402d
	ld a, [Buffer2]
	bit 7, a
	jr z, .asm_103362
	ld hl, Buffer2
	bit 6, [hl]
	jr z, .asm_103398
	ld a, $4
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
	ld b, $0
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
	bit 5, a
	jr nz, .left
	bit 4, a
	jr nz, .right
	bit 1, a
	jr nz, .b
	bit 0, a
	jr nz, .a
	bit 6, a
	jr nz, .up
	bit 7, a
	jr nz, .down
	ret

.up
	ld a, [wd1f0]
	dec a
	ld [wd1f0], a
	cp $1
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
	ld a, $1
	ld [wd1f0], a
	ret

.b
	call PlayClickSFX
	ld hl, Buffer2
	set 7, [hl]
	ret

.a
	ld a, [wd1f3]
	cp $3
	jr nz, .asm_103412
	ld de, SFX_TRANSACTION
	call PlaySFX
	ld hl, Buffer2
	set 7, [hl]
	ld hl, Buffer2
	set 6, [hl]
	ret

.left
.right
.asm_103412
	ld a, [wd1f3]
	cp $3
	ret z
	ld de, SFX_PUSH_BUTTON
	call PlaySFX
	ld bc, $0008
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
	cp $2
	jr nz, .asm_103452
	ld bc, $0001
	call Function1034f7
	ld c, $12
	ld b, $1
	call Function1034e0
	jr .asm_10345f

.asm_103452
	ld bc, $ffed
	call Function1034f7
	ld c, $12
	ld b, $2
	call Function1034e0

.asm_10345f
	ld bc, $0000
	call Function10350f
	ld bc, $0001
	call Function103487
	ld bc, $0008
	call Function10350f
	ld a, [Buffer1]
	and e
	ld bc, $0002
	jr z, .asm_10347d
	ld bc, $0004

.asm_10347d
	call Function10350f
	ld bc, $000b
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
	ld b, $3
	call Function1034e0
	ld bc, $0006
	call Function10350f
	hlcoord 1, 16
	call PlaceString
	ret
; 1034a7

Function1034a7: ; 1034a7
	ld a, [wd1f1]
	ld [wd1f2], a
	ld bc, $000a
	call Function1034f7
	ld [hl], $7f
	ld bc, $000a
	call Function1034f1
	ld [hl], $ed
	ret
; 1034be

Function1034be: ; 1034be
	ld a, $1
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
	ld a, $6
	call Functionfb8
	ret
; 1034f1

Function1034f1: ; 1034f1
	ld a, [wd1f0]
	ld [wd1f2], a

Function1034f7: ; 10134f7
	ld hl, TileMap
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
	ld bc, $0009
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
	db $1
	dw String_10354f
	dw String_1035a8
	dw String_1035b1
	dw String_103571
	db $2
	dw String_103557
	dw String_1035ba
	dw String_1035bd
	dw String_103585
	db $4
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
rept 2
	add hl, bc
endr
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

	dw Function103612
	dw Function103612
	dw Function103612

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

Function103612: ; 103612
	ld hl, MenuDataHeader_103640
	call LoadMenuDataHeader
	ld a, [wdc40]
	and $f
	jr z, .asm_103622
	ld [wcf88], a

.asm_103622
	call InterpretMenu2
	call WriteBackup
	jr c, .asm_10363b
	ld a, [wcfa9]
	ld [ScriptVar], a
	ld c, a
	ld a, [wdc40]
	and $f0
	or c
	ld [wdc40], a
	ret

.asm_10363b
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
	callba Function10632f
	bit 7, c
	jr nz, .asm_103666
	ld hl, wcd2a
	res 5, [hl]
	ld c, $2
	ret

.asm_103666
	ld hl, wcd2a
	set 5, [hl]
	ld c, $1
	ret
; 10366e

Mobile_SelectThreeMons: ; 10366e
	callba Function10632f
	bit 7, c
	jr z, .asm_10369b
	ld hl, UnknownText_0x10375d
	call PrintText
	call YesNoBox
	jr c, .asm_103696
	callba Function8b1e1
	jr nc, .asm_103690
	call Functiona36
	jr .asm_103696

.asm_103690
	ld a, $1
	ld [ScriptVar], a
	ret

.asm_103696
	xor a
	ld [ScriptVar], a
	ret

.asm_10369b
	ld hl, wdc40
	bit 7, [hl]
	set 7, [hl]
	jr nz, .asm_1036b5
	ld hl, UnknownText_0x103762
	call PrintText
	call YesNoBox
	jr c, .asm_1036b5
	call Function1036f9
	call Functiona36

.asm_1036b5
	call Function103700
	jr c, .asm_1036f4
	ld hl, MenuDataHeader_103747
	call LoadMenuDataHeader
	call InterpretMenu2
	call ExitMenu
	jr c, .asm_1036f4
	ld a, [wcfa9]
	cp $1
	jr z, .asm_1036d9
	cp $2
	jr z, .asm_1036f4
	cp $3
	jr z, .asm_1036ec
	jr .asm_1036b5

.asm_1036d9
	callba Function8b1e1
	jr nc, .asm_1036e6
	call Functiona36
	jr .asm_1036f4

.asm_1036e6
	ld a, $1
	ld [ScriptVar], a
	ret

.asm_1036ec
	call Function1036f9
	call Functiona36
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
	ld c, $a
	ld hl, SwarmFlags
	bit 4, [hl]
	jr z, .asm_10370f
	callba Function1008a6

.asm_10370f
	ld a, c
	ld [StringBuffer2], a
	ld a, [StringBuffer2]
	cp $5
	jr nc, .asm_103724
	cp $2
	jr nc, .asm_10372c
	cp $1
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
	call Functiona36
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
	ld c, $0
	ld hl, SwarmFlags
	bit 4, [hl]
	jr nz, .asm_10379c
	ld c, $1
	ld hl, SwarmFlags
	set 4, [hl]

.asm_10379c
	push bc
	callba Function14ab2
	pop bc
	jr c, .asm_1037b5
	ld a, $1
	ld [ScriptVar], a
	ld a, c
	and a
	ret z
	callba Function1006fd
	ret

.asm_1037b5
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
	jr c, .asm_1037de
	ld a, [wdc5f]
	and a
	jr z, .asm_1037de
	ld hl, UnknownText_0x1037e6
	call PrintText
	call YesNoBox
	jr c, .asm_1037de
	ld a, $1
	ld [ScriptVar], a
	ret

.asm_1037de
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
	call Functiona36
	ld hl, UnknownText_0x10381e
	call PrintText
	call Functiona36
	xor a
	ld [ScriptVar], a
	ret

.asm_103807
	ld a, [wdc60]
	and a
	jr nz, .asm_103813
	ld a, $1
	ld [ScriptVar], a
	ret

.asm_103813
	ld a, $2
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
	callba Function10632f
	bit 7, c
	jr nz, .asm_103838
	callba Function1008a6
	ld a, c
	cp $1
	jr c, .asm_10383a

.asm_103838
	xor a
	ret

.asm_10383a
	scf
	ret
; 10383c

Function10383c: ; 10383c
	ld a, $1
	ld [wdc60], a
	xor a
	ld hl, wdc5c
rept 2
	ld [hli], a
endr
	ld [hl], a
	ld hl, UnknownText_0x103876
	call PrintText
	call Functiona36
	callba Script_reloadmappart
	callba Function4a94e
	jr c, .asm_103870
	ld hl, DefaultFlypoint
	ld de, wdc5c
	ld bc, $0003
	call CopyBytes
	xor a
	ld [ScriptVar], a
	ret

.asm_103870
	ld a, $1
	ld [ScriptVar], a
	ret
; 103876

UnknownText_0x103876: ; 0x103876
	text_jump UnknownText_0x1c4508
	db "@"
; 0x10387b

Function10387b: ; 10387b
	callba Function10632f
	bit 7, c
	ret nz
	callba Function1008a6
	ld a, c
	ld [StringBuffer2], a
	ld hl, UnknownText_0x103898
	call PrintText
	call Functiona36
	ret
; 103898

UnknownText_0x103898: ; 0x103898
	text_jump UnknownText_0x1c4525
	db "@"
; 0x10389d
