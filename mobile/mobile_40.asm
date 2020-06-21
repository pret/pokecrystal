Function100000:
; d: 1 or 2
; e: bank
; bc: addr
	ldh a, [rSVBK]
	push af
	ld a, 1
	ldh [rSVBK], a

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
	ldh [rSVBK], a
	ret

Function100022:
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
	farcall Function10127e
	farcall Stubbed_Function106462
	farcall Function106464 ; load broken gfx
	farcall Function11615a ; init RAM
	ld hl, wVramState
	set 1, [hl]
	ret

Function100057:
	call DisableMobile
	call ReturnToMapFromSubmenu
	ld hl, wVramState
	res 1, [hl]
	ret

SetRAMStateForMobile:
	xor a
	ld hl, wBGMapBuffer
	ld bc, $65
	call ByteFill
	xor a
	ld hl, wMobileWRAM
	ld bc, wMobileWRAMEnd - wMobileWRAM
	call ByteFill
	ldh a, [rIE]
	ld [wBGMapBuffer], a
	xor a
	ldh [hMapAnims], a
	ldh [hLCDCPointer], a
	ret

EnableMobile:
	xor a
	ld hl, wOverworldMapBlocks
	ld bc, wOverworldMapBlocksEnd - wOverworldMapBlocks
	call ByteFill

	di
	call DoubleSpeed
	xor a
	ldh [rIF], a
	ld a, IE_DEFAULT
	ldh [rIE], a
	xor a
	ldh [hMapAnims], a
	ldh [hLCDCPointer], a
	ld a, $01
	ldh [hMobileReceive], a
	ldh [hMobile], a
	ei

	ret

DisableMobile:
	di
	xor a
	ldh [hMobileReceive], a
	ldh [hMobile], a
	xor a
	ldh [hVBlank], a
	call NormalSpeed
	xor a
	ldh [rIF], a
	ld a, [wBGMapBuffer]
	ldh [rIE], a
	ei
	ret

Function1000ba:
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

Function1000e8:
	ld hl, wcd29
	bit 7, [hl]
	ret z
	farcall Function115dd3
	ld hl, wcd29
	set 6, [hl]
	ret

Function1000fa:
	ld a, [wc30d]
	and a
	ret z
	ld hl, wcd29
	bit 4, [hl]
	ret z
	ld a, [wcd2b]
	and a
	jr nz, .asm_100117
	farcall Function11619d
	ld hl, wcd29
	set 6, [hl]
	ret

.asm_100117
	di
	xor a
	ldh [rIF], a
	ldh a, [rIE]
	and $1f ^ (1 << SERIAL | 1 << TIMER)
	ldh [rIE], a
	xor a
	ldh [hMobileReceive], a
	ldh [hMobile], a
	ei

	ld a, [wLinkMode]
	push af
	xor a
	ld [wLinkMode], a
	ld a, $04
	ld [wc314 + 5], a
	farcall Function11619d
	ld hl, wcd29
	set 6, [hl]
	pop af
	ld [wLinkMode], a
	ret

Function100144:
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
	farcall HDMATransferTilemapToWRAMBank3
	ret

Function100163:
	ld hl, wcd29
	bit 6, [hl]
	ret z
	res 6, [hl]
	call DelayFrame
	ret

Function10016f:
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
	ld [wMobileErrorCodeBuffer], a
	ld a, d
	ld [wMobileErrorCodeBuffer + 2], a
	ld a, e
	ld [wMobileErrorCodeBuffer + 1], a
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
	ld [wMobileErrorCodeBuffer], a
	ld a, [wcd2d]
	ld [wMobileErrorCodeBuffer + 2], a
	ld a, [wcd2d]
	ld [wMobileErrorCodeBuffer + 1], a
	call Function10020b
	ret

Function10020b:
	xor a
	ld [wc303], a
	farcall FadeOutPalettes
	farcall Function106464
	call HideSprites
	call DelayFrame

	ldh a, [rSVBK]
	push af
	ld a, $01
	ldh [rSVBK], a

	farcall DisplayMobileError

	pop af
	ldh [rSVBK], a
	ret

Function100232:
	push de
	farcall Function106464
	call Function3f20
	call UpdateSprites
	hlcoord 1, 2
	pop de
	call PlaceString
	call Function100320
	call JoyWaitAorB
	ret

String10024d:
	db   "つうしんを　キャンセル　しました@"

String10025e:
	db   "おともだちと　えらんだ　へやが"
	next "ちがうようです@"

Function100276:
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
	farcall Script_reloadmappart
	ld c, $04
	ret

.asm_10029f
	call Function1002dc
	ld c, 0
	ret

.asm_1002a5
	farcall Script_reloadmappart
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

Function1002c9:
	ld hl, wcd2a
	bit 0, [hl]
	ret z
	farcall CleanUpBattleRAM
	farcall LoadPokemonData
	ret

Function1002dc:
	ld a, MAPSETUP_LINKRETURN
	ldh [hMapEntryMethod], a
	farcall RunMapSetupScript
	xor a
	ldh [hMapEntryMethod], a
	call LoadStandardFont
	ret

Function1002ed:
	farcall LoadOW_BGPal7
	farcall ApplyPals
	ld a, $01
	ldh [hCGBPalUpdate], a
	call DelayFrame
	ret

Function100301:
	ld hl, wcd2a
	bit 1, [hl]
	ret z
	farcall Function106464
	farcall Function10202c
	farcall Function115dd3
	call Function100320
	call JoyWaitAorB
	ret

Function100320:
	farcall Mobile_ReloadMapPart
	ret

Function100327:
	farcall HDMATransferTilemapToWRAMBank3
	ret

Function10032e:
	call Function10034d
	ld e, a
	ret nc
	ld [wcd2b], a
	ret

Function100337:
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

Function10034d:
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

Function100382:
	ld a, [wcd27]
	ld hl, Jumptable_10044e
	rst JumpTable
	ret

Function10038a:
	ld hl, wccb4
	ld a, $2e
	call Function3e32
	ret

Function100393:
	ld hl, wcc60
	ld a, $3a
	call Function3e32
	ret

Function10039c:
	ld hl, wcc60
	ld de, w3_d000
	ld bc, $54
	ld a, $03
	call FarCopyWRAM
	ret

Function1003ab:
	ld hl, w3_d000
	ld de, wcc60
	ld bc, $54
	ld a, $03
	call FarCopyWRAM
	ret

Function1003ba:
	ld hl, wccb4
	ld de, w3_d080
	ld bc, $54
	ld a, $03
	call FarCopyWRAM
	ret

Function1003c9:
	ld hl, w3_d080
	ld de, wccb4
	ld bc, $54
	ld a, $03
	call FarCopyWRAM
	ret

Function1003d8:
	ld hl, wccb4
	ld a, [hli]
	ld c, a
	ld b, 0
	push hl
	add hl, bc
	ld a, [wBGMapPalBuffer]
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

Function1003f5:
	ld a, [wcc60]
	sub $03
	ld [wcc60], a
	ld a, [wccb4]
	sub $03
	ld [wccb4], a
	ret

Function100406:
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
	ld a, [wBGMapPalBuffer]
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

Function10043a:
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

Jumptable_10044e:
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

Function10046a:
	ld hl, wBGMapPalBuffer
	inc [hl]
	call Function1003d8
	call Function1003ba
	ld a, [wcd27]
	inc a
	ld [wcd27], a
	ret

Function10047c:
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

Function100493:
	jr asm_100497

Function100495:
	jr asm_100497

asm_100497:
	call Function100337
	ret c
	ret z
	ld a, [wcd27]
	inc a
	ld [wcd27], a
	ret

Function1004a4:
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

Function1004ba:
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

Function1004ce:
	call Function100337
	ret c
	ret z
	cp $02
	ret nz
	ld a, [wcd27]
	inc a
	ld [wcd27], a
	ret

Function1004de:
	call Function100393
	ld a, [wcd27]
	inc a
	ld [wcd27], a
	ret

Function1004e9:
	call Function10038a
	ld a, [wcd27]
	inc a
	ld [wcd27], a
	ret

Function1004f4:
	call Function100337
	ret c
	ret z
	ld a, [wcd27]
	inc a
	ld [wcd27], a
	call Function10039c
	ret

Function100504:
	push de
	call Function3f20
	call UpdateSprites
	pop de
	hlcoord 4, 2
	call PlaceString
	ret

Function100513:
	call Function3f7c
	call PlaceVerticalMenuItems
	call InitVerticalMenuCursor
	ld hl, w2DMenuFlags1
	set 7, [hl]
	ret

Function100522:
	ld a, [wcd28]
	ld hl, Jumptable_10052a
	rst JumpTable
	ret

Jumptable_10052a:
	dw Function100534
	dw Function100545
	dw Function100545
	dw Function100545
	dw Function10054d

Function100534:
	call Function100513
	call UpdateSprites
	call ApplyTilemap
	ld a, [wcd28]
	inc a
	ld [wcd28], a
	ret

Function100545:
	ld a, [wcd28]
	inc a
	ld [wcd28], a
	ret

Function10054d:
	farcall MobileMenuJoypad
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

Function100579:
	ld a, [wcd26]
	ld hl, Jumptable_100581
	rst JumpTable
	ret

Jumptable_100581:
	dw Function100585
	dw Function100597

Function100585:
	ld hl, MenuHeader_1005b2
	call LoadMenuHeader
	ld a, 0
	ld [wcd28], a
	ld a, [wcd26]
	inc a
	ld [wcd26], a

Function100597:
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

MenuHeader_1005b2:
	db MENU_BACKUP_TILES ; flags
	db 6, 14
	db 10, 19
	dw MenuData_1005ba
	db 1 ; default option

MenuData_1005ba:
	db STATICMENU_CURSOR | STATICMENU_NO_TOP_SPACING ; flags
	db 2
	db "はい@"
	db "いいえ@"

Function1005c3:
	ld a, [wcd26]
	ld hl, Jumptable_1005cb
	rst JumpTable
	ret

Jumptable_1005cb:
	dw Function1005cf
	dw Function1005e1

Function1005cf:
	ld hl, MenuHeader_1005fc
	call LoadMenuHeader
	ld a, 0
	ld [wcd28], a
	ld a, [wcd26]
	inc a
	ld [wcd26], a

Function1005e1:
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

MenuHeader_1005fc:
	db MENU_BACKUP_TILES ; flags
	db 6, 14
	db 10, 19
	dw MenuData_100604
	db 1 ; default option

MenuData_100604:
	db STATICMENU_CURSOR | STATICMENU_NO_TOP_SPACING ; flags
	db 2
	db "かける@"
	db "まつ@"

Mobile_CommunicationStandby:
	hlcoord 3, 10
	ld b, 1
	ld c, 11
	call Function3eea
	ld de, .String
	hlcoord 4, 11
	call PlaceString
	ret

.String:
	db "つうしんたいきちゅう！@"

AdvanceMobileInactivityTimerAndCheckExpired:
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

StartMobileInactivityTimer:
	xor a
	ld [wMobileInactivityTimerMinutes], a
	ld [wMobileInactivityTimerSeconds], a
	ld [wMobileInactivityTimerFrames], a
	ret

IncrementMobileInactivityTimerBy1Frame:
	ld c, 1
IncrementMobileInactivityTimerByCFrames:
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

Function100665:
	call UpdateTime
	ld hl, wcd36
	ldh a, [hHours]
	ld [hli], a
	ldh a, [hMinutes]
	ld [hli], a
	ldh a, [hSeconds]
	ld [hl], a
	ret

Function100675:
	ld hl, wcd2a
	bit 2, [hl]
	set 2, [hl]
	ret nz
	call Function1006d3
	ret

Function100681:
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

Function100697:
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

String1006c2:
	db "ふん　@"
String1006c6:
	db "びょう@"
String1006ca:
	db "１じかんいじょう@"

Function1006d3:
	call UpdateTime
	ld de, wcd34
	ld hl, wcd38

Function1006dc:
	ld a, [hld]
	ld c, a
	ldh a, [hSeconds]
	sub c
	jr nc, .asm_1006e5
	add $3c

.asm_1006e5
	ld [de], a
	dec de
	ld a, [hld]
	ld c, a
	ldh a, [hMinutes]
	sbc c
	jr nc, .asm_1006f0
	add $3c

.asm_1006f0
	ld [de], a
	dec de
	ld a, [hl]
	ld c, a
	ldh a, [hHours]
	sbc c
	jr nc, .asm_1006fb
	add $18

.asm_1006fb
	ld [de], a
	ret

MobileBattleResetTimer:
	ld a, BANK(sMobileBattleTimer)
	ld hl, sMobileBattleTimer
	call OpenSRAM
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	call CloseSRAM
	ret

MobileBattleFixTimer:
	ld a, BANK(sMobileBattleTimer)
	ld hl, sMobileBattleTimer
	call OpenSRAM
	xor a ; MOBILE_BATTLE_ALLOWED_SECONDS
	ld [hli], a
	ld a, MOBILE_BATTLE_ALLOWED_MINUTES
	ld [hli], a
	xor a
	ld [hli], a
	call CloseSRAM
	ret

Function100720:
	xor a
	ld [wcd6a], a
	call UpdateTime
	ldh a, [hHours]
	ld [wcd72], a
	ldh a, [hMinutes]
	ld [wcd73], a
	ldh a, [hSeconds]
	ld [wcd74], a
	ld a, BANK(sMobileBattleTimer)
	ld hl, sMobileBattleTimer
	call OpenSRAM
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

Function100754:
	call UpdateTime
	ldh a, [hHours]
	ld [wcd72], a
	ldh a, [hMinutes]
	ld [wcd73], a
	ldh a, [hSeconds]
	ld [wcd74], a
	ld a, [wcd6d]
	ld [wcd6b], a
	ld hl, wcd2a
	res 6, [hl]
	ret

Function100772:
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

Function10079c:
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

Function1007f6:
	call UpdateTime
	ld hl, wcd74
	ld de, wcd71
	call Function1006dc
	ld a, $04
	call OpenSRAM
	ld hl, $a802
	call Function100826
	call CloseSRAM
	ld hl, wcd6e
	call Function100826
	ldh a, [hHours]
	ld [wcd72], a
	ldh a, [hMinutes]
	ld [wcd73], a
	ldh a, [hSeconds]
	ld [wcd74], a
	ret

Function100826:
	ld a, [wcd71]
	add [hl]
	sub $3c
	jr nc, .asm_100830
	add $3c

.asm_100830
	ld [hld], a
	ccf
	ld a, [wcd70]
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

Function100846:
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
	ld [wStringBuffer2 + 2], a
	ld a, [wcd6d]
	ld c, a
	ld a, $0a
	sbc c
	ld [wStringBuffer2 + 1], a
	xor a
	ld [wStringBuffer2], a
	ld de, String_10088e
	hlcoord 1, 14
	call PlaceString
	ld de, wStringBuffer2
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

String_10088e:
	db   "モバイルたいせん　できる"
	next "じかん@"

String_10089f:
	db "　むせいげん@"

MobileBattleGetRemainingTime:
; Calculates the difference between 10 minutes and sMobileBattleTimer
; Returns minutes in c and seconds in b
	ld a, BANK(sMobileBattleTimer)
	ld hl, sMobileBattleTimer
	call OpenSRAM
	ld a, [hli]
	ld [wStringBuffer2], a
	ld a, [hli]
	ld [wStringBuffer2 + 1], a
	ld a, [hli]
	ld [wStringBuffer2 + 2], a
	call CloseSRAM
	ld a, [wStringBuffer2 + 2]
	ld b, a
	ld a, MOBILE_BATTLE_ALLOWED_SECONDS
	sub b
	jr nc, .no_carry_seconds
	add 60
.no_carry_seconds
	ld b, a
	ld a, [wStringBuffer2 + 1]
	ld c, a
	ld a, MOBILE_BATTLE_ALLOWED_MINUTES
	sbc c
	ld c, a
	jr c, .fail
	ld a, [wStringBuffer2]
	and a
	jr nz, .fail
	ret

.fail
	call MobileBattleFixTimer
	ld c, 0
	ret

Function1008e0:
	ldh a, [hBGMapMode]
	ld b, a
	ldh a, [hVBlank]
	ld c, a
	push bc
	xor a
	ldh [hBGMapMode], a
	ld a, $03
	ldh [hVBlank], a
	call Function100970
	call Function100902
	call Function100989
	call DelayFrame
	pop bc
	ld a, c
	ldh [hVBlank], a
	ld a, b
	ldh [hBGMapMode], a
	ret

Function100902:
	hlcoord 3, 10
	ld b, $01
	ld c, $0b
	call Textbox
	ld a, [wcd6d]
	ld c, a
	ld a, $0a
	sub c
	ld [wStringBuffer2], a
	jr z, .asm_10093f
	ld de, .string_100966
	hlcoord 4, 11
	call PlaceString
	hlcoord 8, 11
	lb bc, 1, 2
	ld de, wStringBuffer2
	call PrintNum
	ld de, SFX_TWO_PC_BEEPS
	call PlaySFX
	farcall ReloadMapPart
	ld c, $3c
	call DelayFrames
	ret

.asm_10093f
	ld de, .string_10095a
	hlcoord 4, 11
	call PlaceString
	ld de, SFX_4_NOTE_DITTY
	call PlaySFX
	farcall ReloadMapPart
	ld c, 120
	call DelayFrames
	ret

.string_10095a
	db "たいせん　しゅうりょう@"
.string_100966
	db "のこり　　　ふん！@"

Function100970:
	hlcoord 0, 0
	ld de, w3_dc00
	call Function1009a5
	hlcoord 0, 0, wAttrmap
	ld de, w3_dd68
	call Function1009a5
	call Function1009d2
	call Function1009ae
	ret

Function100989:
	ld hl, w3_dc00
	decoord 0, 0
	call Function1009a5
	call Function1009ae
	farcall ReloadMapPart
	ld hl, w3_dd68
	decoord 0, 0, wAttrmap
	call Function1009a5
	ret

Function1009a5:
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, $03
	call FarCopyWRAM
	ret

Function1009ae:
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a

	ld hl, w3_d800
	decoord 0, 0, wAttrmap
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
	ldh [rSVBK], a
	ret

Function1009d2:
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a

	ldh a, [rVBK]
	push af
	ld a, $01
	ldh [rVBK], a

	ld hl, w3_d800
	debgcoord 0, 0
	lb bc, $03, $24
	call Get2bpp

	pop af
	ldh [rVBK], a

	pop af
	ldh [rSVBK], a
	ret

Function1009f3:
	ldh a, [hJoyDown]
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

_LinkBattleSendReceiveAction:
	call .StageForSend
	ld [wLinkBattleSentAction], a
	farcall PlaceWaitingText
	ld a, [wLinkMode]
	cp LINK_MOBILE
	jr nz, .not_mobile

	call .MobileBattle_SendReceiveAction
	call Function100da5
	farcall FinishBattleAnim
	jr .done

.not_mobile
	call .LinkBattle_SendReceiveAction

.done
	ret

.StageForSend:
	ld a, [wBattlePlayerAction]
	and a ; BATTLEPLAYERACTION_USEMOVE?
	jr nz, .switch
	ld a, [wCurPlayerMove]
	ld b, BATTLEACTION_STRUGGLE
	cp STRUGGLE
	jr z, .struggle
	ld b, BATTLEACTION_SKIPTURN
	cp $ff
	jr z, .struggle
	ld a, [wCurMoveNum]
	jr .use_move

.switch
	ld a, [wCurPartyMon]
	add BATTLEACTION_SWITCH1
	jr .use_move

.struggle
	ld a, b

.use_move
	and $0f
	ret

.LinkBattle_SendReceiveAction:
	ld a, [wLinkBattleSentAction]
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

.MobileBattle_SendReceiveAction:
	call Function100acf
	call StartMobileInactivityTimer
	ld a, 0
	ld [wcd27], a
.asm_100a92
	call DelayFrame
	call GetJoypad
	farcall Function100382
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

Function100acf:
	ld de, Unknown_100b0a
	ld hl, wccb5
	ld a, [wLinkBattleSentAction]
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

Function100ae7:
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

pushc
setcharmap ascii

Unknown_100b0a:
	db "tetsuji", 0

popc

Function100b12:
	call Function100dd8
	ret c
	ld hl, BattleMenuHeader
	ld a, BANK(BattleMenuHeader)
	ld de, LoadMenuHeader
	call FarCall_de
	ld a, BANK(BattleMenuHeader)
	ld [wMenuData_2DMenuItemStringsBank], a
	ld a, [wBattleMenuCursorBuffer]
	ld [wMenuCursorBuffer], a
	call Function100e72
	call Function100b45
	farcall InitPartyMenuBGPal7
	call Function100ed4
	ld a, [wMenuCursorBuffer]
	ld [wBattleMenuCursorBuffer], a
	call ExitMenu
	ret

Function100b45:
	call Function100b7a
.loop
	call Mobile_SetOverworldDelay
	farcall MobileMenuJoypad
	push bc
	farcall HDMATransferTilemapToWRAMBank3
	call Function100e2d
	pop bc
	jr c, .asm_100b6b
	ld a, [wMenuJoypadFilter]
	and c
	jr z, .loop
	farcall Mobile_GetMenuSelection
	ret

.asm_100b6b
	ld a, [w2DMenuNumCols]
	ld c, a
	ld a, [w2DMenuNumRows]
	call SimpleMultiply
	ld [wMenuCursorBuffer], a
	and a
	ret

Function100b7a:
	ld hl, CopyMenuData
	ld a, [wMenuData_2DMenuItemStringsBank]
	rst FarCall
	farcall Draw2DMenu
	farcall MobileTextBorder
	call UpdateSprites
	call ApplyTilemap
	farcall Init2DMenuCursorPosition
	ld hl, w2DMenuFlags1
	set 7, [hl]
	ret

MobileMoveSelectionScreen:
	xor a
	ld [wMoveSwapBuffer], a
	farcall CheckPlayerHasUsableMoves
	ret z
	call Function100dd8
	jp c, xor_a_dec_a
	call Function100e72
	call .GetMoveSelection
	push af
	farcall InitPartyMenuBGPal7
	call Function100ed4
	pop af
	ret

.GetMoveSelection:
	xor a
	ldh [hBGMapMode], a
	call Function100c74
	call Function100c98
.master_loop
	farcall MoveInfoBox
.loop
	call Mobile_SetOverworldDelay
	farcall MobileMenuJoypad
	push bc
	farcall HDMATransferTilemapToWRAMBank3
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
	ld [wCurMoveNum], a
	ld a, $01
	and a
	ret

.a_button
	ld a, [wMenuCursorY]
	dec a
	ld [wCurMoveNum], a
	ld a, [wMenuCursorY]
	dec a
	ld c, a
	ld b, 0
	ld hl, wBattleMonPP
	add hl, bc
	ld a, [hl]
	and $3f
	jr z, .no_pp_left
	ld a, [wPlayerDisableCount]
	swap a
	and $0f
	dec a
	cp c
	jr z, .move_disabled
	ld a, [wMenuCursorY]
	dec a
	ld c, a
	ld b, 0
	ld hl, wBattleMonMoves
	add hl, bc
	ld a, [hl]
	ld [wCurPlayerMove], a
	xor a
	ret

.move_disabled
	ld hl, BattleText_TheMoveIsDisabled
	jr .print_text

.no_pp_left
	ld hl, BattleText_TheresNoPPLeftForThisMove

.print_text
	call StdBattleTextbox
	call SafeLoadTempTilemapToTilemap
	jp .GetMoveSelection

Function100c74:
	hlcoord 0, 8
	ld b, 8
	ld c, 8
	call Textbox
	ld hl, wBattleMonMoves
	ld de, wListMoves_MoveIndicesBuffer
	ld bc, NUM_MOVES
	call CopyBytes
	ld a, SCREEN_WIDTH * 2
	ld [wBuffer1], a
	hlcoord 2, 10
	predef ListMoves
	ret

Function100c98:
	ld de, .attrs
	call SetMenuAttributes
	ld a, [wNumMoves]
	inc a
	ld [w2DMenuNumRows], a
	ld a, [wCurMoveNum]
	inc a
	ld [wMenuCursorY], a
	ret

.attrs
	db 10, 1
	db 255, 1
	db $a0, $00
	dn 2, 0
	db D_UP | D_DOWN | A_BUTTON | B_BUTTON

Mobile_PartyMenuSelect:
	call Function100dd8
	ret c
	ld hl, w2DMenuFlags1
	set 7, [hl]
	res 6, [hl]
.loop
	call Mobile_SetOverworldDelay
	farcall MobileMenuJoypad
	push bc
	farcall PlaySpriteAnimations
	farcall HDMATransferTilemapToWRAMBank3
	call MobileComms_CheckInactivityTimer
	pop bc
	jr c, .done
	ld a, [wMenuJoypadFilter]
	and c
	jr z, .loop
	call PlaceHollowCursor
	ld a, [wPartyCount]
	inc a
	ld b, a
	ld a, [wMenuCursorY]
	cp b
	jr z, .done
	ld [wPartyMenuCursor], a
	ldh a, [hJoyLast]
	ld b, a
	bit 1, b
	jr nz, .done
	ld a, [wMenuCursorY]
	dec a
	ld [wCurPartyMon], a
	ld c, a
	ld b, 0
	ld hl, wPartySpecies
	add hl, bc
	ld a, [hl]
	ld [wCurPartySpecies], a
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

MobileBattleMonMenu:
	call Function100dd8
	ret c
	call Function100d67
	ld hl, w2DMenuFlags1
	set 7, [hl]
	res 6, [hl]
.asm_100d30
	call Mobile_SetOverworldDelay
	farcall MobileMenuJoypad
	push bc
	farcall PlaySpriteAnimations
	farcall HDMATransferTilemapToWRAMBank3
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

Function100d67:
	ld hl, .MenuHeader
	call CopyMenuHeader
	xor a
	ldh [hBGMapMode], a
	call MenuBox
	call UpdateSprites
	call PlaceVerticalMenuItems
	call WaitBGMap
	call CopyMenuData
	call InitVerticalMenuCursor
	ld hl, w2DMenuFlags1
	set 6, [hl]
	ret

.MenuHeader:
	db 0 ; flags
	menu_coords 11, 11, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_NO_TOP_SPACING ; flags
	db 3
	db "いれかえる@"  ; TRADE
	db "つよさをみる@" ; STATS
	db "キャンセル@"  ; CANCEL

Function100da5:
	ld hl, wcd2a
	res 3, [hl]
	ld hl, wcd29
	res 0, [hl]
	ret

Function100db0:
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

Function100dc0:
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

Mobile_SetOverworldDelay:
	ld a, 30
	ld [wOverworldDelay], a
	ret

Function100dd8:
	ld c, $01
	ld b, $03
	farcall AdvanceMobileInactivityTimerAndCheckExpired
	jr c, .asm_100dfb
	ld c, $3c
	ld b, $01
	call Function10079c
	jr c, .asm_100dfb
	farcall Function10032e
	ld a, [wcd2b]
	and a
	jr nz, .asm_100dfb
	xor a
	ret

.asm_100dfb
	scf
	ret

MobileComms_CheckInactivityTimer:
	ld a, [wOverworldDelay]
	ld c, a
	ld a, 30
	sub c
	ld c, a
	ld b, 3
	push bc
	farcall AdvanceMobileInactivityTimerAndCheckExpired ; useless to farcall
	pop bc
	jr c, .quit
	ld b, 1
	call Function10079c
	jr c, .quit
	call Function1009f3
	jr c, .quit
	farcall Function10032e ; useless to farcall
	ld a, [wcd2b]
	and a
	jr nz, .quit
	xor a
	ret

.quit
	scf
	ret

Function100e2d:
	ld a, [wOverworldDelay]
	ld c, a
	ld a, 30
	sub c
	ld c, a
	ld b, 3
	push bc
	farcall AdvanceMobileInactivityTimerAndCheckExpired
	pop bc
	jr c, .asm_100e61
	ld b, 1
	call Function10079c
	jr c, .asm_100e61
	call Function1009f3
	jr c, .asm_100e61
	farcall Function10032e
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

Function100e63:
	ld a, e
	cp $02
	ret nz
	call Function100db0
	ret nc
	ld de, SFX_ELEVATOR_END
	call PlaySFX
	ret

Function100e72:
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

Function100e84:
	ld a, [wcd67]
	ld hl, Jumptable_100e8c
	rst JumpTable
	ret

Jumptable_100e8c:
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

Function100ea2:
	call Function100dc0
	ret nc
	ld hl, wcd29
	set 0, [hl]
	call Function100ec5

Function100eae:
	scf
	call Function100eca
	jr asm_100eb8

Function100eb4:
	and a
	call Function100eca

asm_100eb8:
	ld hl, wcd68
	inc [hl]
	ld a, [hl]
	cp $02
	ret c
	ld [hl], 0
	jr Function100ec5

Function100ec4:
	ret

Function100ec5:
	ld hl, wcd67
	inc [hl]
	ret

Function100eca:
	farcall Mobile_InitPartyMenuBGPal7
	call Function100ed4
	ret

Function100ed4:
	farcall ApplyPals
	ld a, $01
	ldh [hCGBPalUpdate], a
	ret

Function100edf:
	ld hl, Unknown_100fc0
	ld c, 1
	jr asm_100f02

Function100ee6:
	ld hl, Unknown_100fc0
	ld c, 2
	jr asm_100f02

Function100eed:
	ld hl, Unknown_100feb
	ld c, 1
	jr asm_100f02

Function100ef4:
	ld hl, Unknown_100ff3
	ld c, 1
	jr asm_100f02

Function100efb:
	ld hl, Unknown_10102c
	ld c, 1
	jr asm_100f02

asm_100f02:
	ld a, c
	ld [wStringBuffer2], a
	; someting that was previously stored in de gets backed up to here
	ld a, e
	ld [wStringBuffer2 + 1], a
	ld a, d
	ld [wStringBuffer2 + 2], a
	; empty this
	xor a
	ld [wStringBuffer2 + 4], a
	ld [wStringBuffer2 + 5], a
.loop
	ld a, [hl]
	cp $ff
	jr z, .done
	ld [wStringBuffer2 + 3], a ; bank
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
	ld a, [wStringBuffer2 + 4]
	ld c, a
	ld a, [wStringBuffer2 + 5]
	ld b, a
	ret

Function100f3d:
	; parameter
	ld a, [wStringBuffer2]
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
	ld a, [wStringBuffer2 + 1]
	ld l, a
	ld a, [wStringBuffer2 + 2]
	ld h, a
	call Function100f8d
	ld a, l
	ld [wStringBuffer2 + 1], a
	ld a, h
	ld [wStringBuffer2 + 2], a
	ret

.two
	; hl gets backed up to de, then
	; do the same as in .three
	ld d, h
	ld e, l
	ld a, [wStringBuffer2 + 1]
	ld l, a
	ld a, [wStringBuffer2 + 2]
	ld h, a
	call Function100f8d
	ld a, l
	ld [wStringBuffer2 + 1], a
	ld a, h
	ld [wStringBuffer2 + 2], a
	ret

.one
	; de gets copied to hl, then
	; load the backup into de,
	; finally run Function100f8d
	; and store the de result
	ld h, d
	ld l, e
	ld a, [wStringBuffer2 + 1]
	ld e, a
	ld a, [wStringBuffer2 + 2]
	ld d, a
	call Function100f8d
	ld a, e
	ld [wStringBuffer2 + 1], a
	ld a, d
	ld [wStringBuffer2 + 2], a
	ret

Function100f8d:
	push hl
	ld a, [wStringBuffer2 + 4]
	ld l, a
	ld a, [wStringBuffer2 + 5]
	ld h, a
	add hl, bc
	ld a, l
	ld [wStringBuffer2 + 4], a
	ld a, h
	ld [wStringBuffer2 + 5], a
	pop hl
	ld a, [wStringBuffer2 + 3]
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
	call OpenSRAM
	call CopyBytes
	call CloseSRAM
	ret

Unknown_100fc0:
	; first byte:
	;     Bit 7 set: Not SRAM
	;     Lower 7 bits: Bank
	; Address, size (dw), address
	dbwww $80, wPlayerName, NAME_LENGTH, wOTPlayerName
	dbwww $80, wPartyCount, 1 + PARTY_LENGTH + 1, wOTPartyCount
	dbwww $80, wPlayerID, 2, wOTPlayerID
	dbwww $80, wPartyMons, PARTYMON_STRUCT_LENGTH * PARTY_LENGTH, wOTPartyMons
	dbwww $80, wPartyMonOT, NAME_LENGTH * PARTY_LENGTH, wOTPartyMonOT
	dbwww $80, wPartyMonNicknames, MON_NAME_LENGTH * PARTY_LENGTH, wOTPartyMonNicknames
	db -1

Unknown_100feb:
	dbwww $00, sPartyMail, MAIL_STRUCT_LENGTH * PARTY_LENGTH, NULL
	db -1

Unknown_100ff3:
	dbwww $80, wdc41, 1, NULL
	dbwww $80, wPlayerName, NAME_LENGTH, NULL
	dbwww $80, wPlayerName, NAME_LENGTH, NULL
	dbwww $80, wPlayerID, 2, NULL
	dbwww $80, wSecretID, 2, NULL
	dbwww $80, wPlayerGender, 1, NULL
	dbwww $04, $a603, 8, NULL
	dbwww $04, $a007, PARTYMON_STRUCT_LENGTH, NULL
	db -1

Unknown_10102c:
	dbwww $80, wOTPlayerName, NAME_LENGTH, NULL
	dbwww $80, wOTPlayerID, 2, NULL
	dbwww $80, wOTPartyMonNicknames, MON_NAME_LENGTH * PARTY_LENGTH, NULL
	dbwww $80, wOTPartyMonOT, NAME_LENGTH * PARTY_LENGTH, NULL
	dbwww $80, wOTPartyMons, PARTYMON_STRUCT_LENGTH * PARTY_LENGTH, NULL
	db -1

Function101050:
	call Function10107d
	ld a, [wOTPartyCount]
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
	call OpenSRAM
	ld hl, wc608
	ld de, $a001
	ld bc, wc7bd - wc608
	call CopyBytes
	call CloseSRAM
	ret

Function10107d:
	xor a
	ld hl, wc608
	ld bc, wc7bd - wc608
	call ByteFill
	ld hl, wOTPlayerName
	ld de, wc608
	ld bc, NAME_LENGTH
	call CopyBytes
	ld hl, wd271
	ld a, [hli]
	ld [wc608 + 11], a
	ld a, [hl]
	ld [wc608 + 12], a
	ld hl, wOTPartyMonNicknames
	ld de, wc608 + 13
	ld bc, NAME_LENGTH
	call .CopyAllFromOT
	ld hl, wOTPartyMonOT
	ld de, wOTClassName + 1
	ld bc, NAME_LENGTH
	call .CopyAllFromOT
	ld hl, wOTPartyMon1Species
	ld de, $c699
	ld bc, PARTYMON_STRUCT_LENGTH
	call .CopyAllFromOT
	ld a, $50
	ld [wc7b9], a
	ld a, $33
	ld [wc7ba], a
	ret

.CopyAllFromOT:
	push hl
	ld hl, 0
	ld a, [wOTPartyCount]
	call AddNTimes
	ld b, h
	ld c, l
	pop hl
	call CopyBytes
	ret

Function1010de:
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

LoadSelectedPartiesForColosseum:
	xor a
	ld hl, wStringBuffer2
	ld bc, 9
	call ByteFill
	ld hl, wPlayerMonSelection
	ld de, wPartyCount
	call .CopyThreeSpecies
	ld hl, wPlayerMonSelection
	ld de, wPartyMon1Species
	call .CopyPartyStruct
	ld hl, wPlayerMonSelection
	ld de, wPartyMonOT
	call .CopyName
	ld hl, wPlayerMonSelection
	ld de, wPartyMonNicknames
	call .CopyName
	ld hl, wOTMonSelection
	ld de, wOTPartyCount
	call .CopyThreeSpecies
	ld hl, wOTMonSelection
	ld de, wOTPartyMon1Species
	call .CopyPartyStruct
	ld hl, wOTMonSelection
	ld de, wOTPartyMonOT
	call .CopyName
	ld hl, wOTMonSelection
	ld de, wOTPartyMonNicknames
	call .CopyName
	ret

.CopyThreeSpecies:
; Load the 3 choices to the buffer
	push de
	ld bc, wStringBuffer2 + NAME_LENGTH_JAPANESE
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
	ld hl, wStringBuffer2 + NAME_LENGTH_JAPANESE
	ld bc, 3
	call CopyBytes
	ld a, $ff
	ld [de], a
	ret

.GetNthSpecies:
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

.CopyPartyStruct:
	ld bc, PARTYMON_STRUCT_LENGTH
	jr .ContinueCopy

.CopyName:
	ld bc, NAME_LENGTH

.ContinueCopy:
	; Copy, via wc608...
	ld a, LOW(wc608)
	ld [wStringBuffer2], a
	ld a, HIGH(wc608)
	ld [wStringBuffer2 + 1], a
	; ... bc bytes...
	ld a, c
	ld [wStringBuffer2 + 2], a
	ld a, b
	ld [wStringBuffer2 + 3], a
	; ... to de...
	ld a, e
	ld [wStringBuffer2 + 4], a
	ld a, d
	ld [wStringBuffer2 + 5], a
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
	ld a, [wStringBuffer2]
	ld e, a
	ld a, [wStringBuffer2 + 1]
	ld d, a
	call CopyBytes
	ld a, e
	ld [wStringBuffer2], a
	ld a, d
	ld [wStringBuffer2 + 1], a
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

.GetDestinationAddress:
	ld a, [wStringBuffer2 + 4]
	ld l, a
	ld a, [wStringBuffer2 + 5]
	ld h, a
	ret

.GetCopySize:
	ld a, [wStringBuffer2 + 2]
	ld c, a
	ld a, [wStringBuffer2 + 3]
	ld b, a
	ret

Function1011f1:
	ld a, BANK(s4_a60c)
	call OpenSRAM
	ld a, [s4_a60c]
	ld [wdc41], a
	call CloseSRAM
	ld hl, wdc41
	res 4, [hl]
	ld hl, wGameTimerPause
	bit GAMETIMERPAUSE_MOBILE_7_F, [hl]
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

Function101220:
	xor a
	ld [wLinkMode], a
	ret

Function101225:
	ld d, 1
	ld e, BANK(Jumptable_101297)
	ld bc, Jumptable_101297
	call Function100000
	jr Function10123d

Function101231:
	ld d, 2
	ld e, BANK(Jumptable_101297)
	ld bc, Jumptable_101297
	call Function100000
	jr Function10123d

Function10123d:
	xor a
	ld [wScriptVar], a
	ld a, c
	ld hl, Jumptable_101247
	rst JumpTable
	ret

Jumptable_101247:
	dw Function101251
	dw Function10127d
	dw Function10127c
	dw Function10126c
	dw Function101265

Function101251:
	call UpdateSprites
	call RefreshScreen
	ld hl, UnknownText_0x1021f4
	call Function1021e0
	call Function1020ea
	ret c
	call Function102142
	ret

Function101265:
	ld hl, UnknownText_0x1021ef
	call Function1021e0
	ret

Function10126c:
	call UpdateSprites
	farcall Script_reloadmappart
	ld hl, UnknownText_0x1021f4
	call Function1021e0
	ret

Function10127c:
	ret

Function10127d:
	ret

Function10127e:
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

Jumptable_101297:
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

Function10138b:
	farcall Function8adcc
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

Function1013aa:
	call ClearBGPalettes
	call Call_ExitMenu
	call ReloadTilesetAndPalettes
	farcall Function106464
	call UpdateSprites
	call FinishExitMenu
	ret

Function1013c0:
	farcall BlankScreen
	farcall Stubbed_Function106462
	farcall Function106464
	call FinishExitMenu
	ret

Function1013d6:
	farcall HDMATransferAttrmapAndTilemapToWRAMBank3
	ret

Function1013dd:
	call CGBOnly_CopyTilemapAtOnce
	ret

Function1013e1: ; unreferenced
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

Function1013f5:
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

Function101400: ; unreferenced
	ld a, [de]
	inc de
	cp [hl]
	jr nz, asm_101416
	inc hl

Function101406:
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

asm_101416:
	scf
	ret

Function101418:
	call GetJoypad
	ldh a, [hJoyDown]
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

Function10142c:
	ld a, $01
	ld [wc305], a
	farcall Function115e18
	ret

Function101438:
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

Jumptable_101457:
	dw Function10145b
	dw Function101467

Function10145b:
	ld a, $3c
	ld [wcd42], a
	ld a, [wcd26]
	inc a
	ld [wcd26], a

Function101467:
	ld hl, wcd42
	dec [hl]
	ret nz
	ld a, [wcd26]
	set 7, a
	ld [wcd26], a
	ret

Function101475:
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

Jumptable_101494:
	dw Function10149a
	dw Function1014a6
	dw Function1014b7

Function10149a:
	ld a, $28
	ld [wcd42], a
	ld a, [wcd26]
	inc a
	ld [wcd26], a

Function1014a6:
	ld hl, wcd42
	dec [hl]
	ret nz
	ld a, $50
	ld [wcd42], a
	ld a, [wcd26]
	inc a
	ld [wcd26], a

Function1014b7:
	call GetJoypad
	ldh a, [hJoyPressed]
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

Function1014ce:
	farcall Function100720
	farcall StartMobileInactivityTimer
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

Function1014e2:
	ld hl, wcd29
	set 6, [hl]
	ld a, 0
	ld [wcd26], a
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

Function1014f4:
	farcall EnableMobile
	ld hl, wcd29
	set 6, [hl]
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

Function101507:
	ld de, wcd30
	ld hl, $40
	ld bc, $40
	ld a, $02
	call Function3e32
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

Function10151d: ; unreferenced
	ld a, $34
	call Function3e32
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

Function10152a:
	ld a, $36
	call Function3e32
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

Function101537:
	ld a, $0a
	call Function3e32
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

Function101544:
	farcall StartMobileInactivityTimer
	ld a, $12
	call Function3e32
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

Function101557:
	farcall StartMobileInactivityTimer
	ld hl, wcd53
	ld a, $08
	call Function3e32
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

Function10156d:
	call Function101418
	ret c

Function101571:
	farcall Function10032e
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

Function10158a:
	farcall IncrementMobileInactivityTimerBy1Frame
	ld a, [wMobileInactivityTimerMinutes]
	cp $0a
	jr c, Function10156d
	ld a, $fb
	ld [wcd2b], a
	ret

Function10159d:
	ld de, wc608
	farcall Function100edf
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

Function1015be:
	ld de, wc608
	farcall Function100eed
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

Function1015df:
	ld de, wc608
	farcall Function100ef4
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

Function101600:
	ld hl, w5_d800
	ld de, wc608
	ld bc, $1e0
	ld a, $05
	call FarCopyWRAM
	ld de, wc608
	farcall Function100ee6
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

Function10161f:
	call Function101649
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

Function10162a:
	call Function101663
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

MobileCopyTransferData:
	ld de, wMobileTransferData
	ld bc, $1e0
	call FarCopyWRAM
	ret

MobileCopyTransferData2:
	ld hl, wMobileTransferData
	ld bc, $1e0
	call FarCopyWRAM
	ret

Function101649:
	ld a, BANK(w5_d800)
	ld hl, w5_d800
	call MobileCopyTransferData
	ld a, BANK(w5_da00)
	ld de, w5_da00
	call MobileCopyTransferData2
	ret

Function10165a:
	ld a, BANK(w5_da00)
	ld hl, w5_da00
	call MobileCopyTransferData
	ret

Function101663:
	ld a, BANK(w5_dc00)
	ld hl, w5_d800
	call MobileCopyTransferData
	ld a, BANK(w5_dc00)
	ld de, w5_dc00
	call MobileCopyTransferData2
	ret

Function101674: ; unreferenced
	ld a, BANK(w5_dc00)
	ld hl, w5_dc00
	call MobileCopyTransferData
	ret

Function10167d:
	ld a, 0
	ld [wcd26], a
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

Function10168a:
	call Function101418
	ret c

Function10168e:
	ld b, 0
	ld c, $01
	farcall Function10079c
	ret c
	ld c, $01
	ld b, $03
	farcall AdvanceMobileInactivityTimerAndCheckExpired
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

Jumptable_1016c3:
	dw Function1016cf
	dw Function1016de
	dw Function1016f8
	dw Function101705
	dw Function101719
	dw Function101724

Function1016cf:
	ld hl, wcd3a
	inc [hl]
	call Function10176f
	ld a, [wcd26]
	inc a
	ld [wcd26], a
	ret

Function1016de:
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

Function1016f8:
	ld a, 0
	ld [wcd27], a
	ld a, [wcd26]
	inc a
	ld [wcd26], a
	ret

Function101705:
	farcall Function100382
	ld a, [wcd27]
	bit 7, a
	ret z
	ld a, [wcd26]
	inc a
	ld [wcd26], a
	ret

Function101719:
	call Function1017c7
	ld a, [wcd26]
	inc a
	ld [wcd26], a
	ret

Function101724:
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

Unknown_10173a:
	db $50

Function10173b:
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

Function10174c:
	ld [wcd3d], a
	ld a, l
	ld [wcd3e], a
	ld a, h
	ld [wcd3f], a
	ld a, e
	ld [wcd3b], a
	ld a, d
	ld [wBattleTowerRoomMenu2JumptableIndex], a
	ld a, c
	ld [wcd40], a
	ld a, b
	ld [wcd41], a
	xor a
	ld [wcd39], a
	ld [wcd3a], a
	ret

Function10176f:
	ld hl, wccb4
	ld bc, $54
	ld a, $11
	call ByteFill
	ret

Function10177b:
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

Function1017b0:
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

Function1017c7:
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

Function1017e4:
	ld a, 0
	ld [wcd27], a
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

Function1017f1:
	call Function101418
	ret c

Function1017f5:
	ld b, 0
	ld c, $01
	farcall Function10079c
	ret c
	ld c, $01
	ld b, $03
	farcall AdvanceMobileInactivityTimerAndCheckExpired
	ret c
	farcall Function100382
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

Function101826:
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
	farcall Function103654
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

pushc
setcharmap ascii

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

popc

Function1018a8:
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

Function1018d6:
	call Function1018ec
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

Function1018e1:
	call Function1018fb
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

Function1018ec:
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

Function1018fb:
	ld a, [wcd2f]
	and a
	jr z, .asm_101906
	ld hl, wcc61
	jr .asm_101909

.asm_101906
	ld hl, wccb5

.asm_101909
	ld de, wLinkBattleRNs
	ld bc, 10
	call CopyBytes
	ret

Function101913:
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
	ldh [hWY], a
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

Function10194b:
	call DisableSpriteUpdates
	call ClearSprites
	farcall Function1021f9
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

_SelectMonsForMobileBattle:
	farcall BlankScreen
	farcall Mobile_CommunicationStandby
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

_StartMobileBattle:
	call CopyOtherPlayersBattleMonSelection
	farcall Function100754
	xor a
	ld [wdc5f], a
	ld [wdc60], a
	farcall BlankScreen
	call SpeechTextbox
	farcall Function100846
	ld c, 120
	call DelayFrames
	farcall ClearTilemap
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

.CopyOTDetails:
	ldh a, [rSVBK]
	push af
	ld a, 5
	ldh [rSVBK], a

	ld bc, w5_dc0d
	ld de, w5_dc11
	farcall GetMobileOTTrainerClass

	pop af
	ldh [rSVBK], a

	ld a, c
	ld [wOtherTrainerClass], a
	ld hl, wOTPlayerName
	ld de, wOTClassName
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, [wcd2f]
	and a
	ld a, USING_INTERNAL_CLOCK
	jr z, .got_link_player_number
	ld a, USING_EXTERNAL_CLOCK
.got_link_player_number
	ldh [hSerialConnectionStatus], a
	ret

StartMobileBattle:
	; force stereo and fast text speed
	ld hl, wOptions
	ld a, [hl]
	push af
	and (1 << STEREO)
	or 1 ; 1 frame per character i.e. fast text
	ld [hl], a
	ld a, 1
	ld [wDisableTextAcceleration], a
	farcall BattleIntro
	farcall DoBattle
	farcall ShowLinkBattleParticipantsAfterEnd
	xor a
	ld [wDisableTextAcceleration], a
	ld a, CONNECTION_NOT_ESTABLISHED
	ldh [hSerialConnectionStatus], a
	pop af
	ld [wOptions], a
	ret

Function101a4f:
	ld a, 1
	ld [wDisableTextAcceleration], a
	farcall DisplayLinkBattleResult
	xor a
	ld [wDisableTextAcceleration], a
	farcall CleanUpBattleRAM
	farcall LoadPokemonData
	call Function1013c0
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

CopyOtherPlayersBattleMonSelection:
	ld hl, wcc61
	ld de, wOTMonSelection
	ld bc, 3
	call CopyBytes
	ld de, wcc64
	farcall Function100772
	farcall Function101050
	farcall LoadSelectedPartiesForColosseum
	ret

Function101a97:
	farcall Function115d99
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

Function101ab4:
	ld e, $01
	call Function101ee4
	ld hl, wcd29
	set 5, [hl]
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

Function101ac6:
	farcall Function115d99
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

Function101aed:
	farcall Function115d99
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

Function101b0f:
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

Function101b2b:
	farcall Function100579
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

Function101b59:
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

Function101b70:
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

Function101b8f:
	farcall Function1005c3
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

Function101bc8:
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

Function101be5:
	farcall Function100579
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

Function101c11:
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

Function101c2b:
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

Function101c42:
	ld hl, wcd2a
	set 1, [hl]
	call Function100665
	ld a, $47
	ld [wMobileCommsJumptableIndex], a
	ret

Function101c50:
	ld e, $0a
	call Function101ee4
	ld hl, wcd29
	set 2, [hl]
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

Function101c62:
	farcall Function115d99
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

Function101c92:
	farcall Function100675
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

Function101ca0:
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

Function101cbc:
	ld a, $01
	ld [wcd2b], a
	ret

Function101cc2: ; unreferenced
	ld a, $02
	ld [wcd2b], a
	ret

Function101cc8:
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

Function101cdf:
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

Function101cf6:
	ld a, $0b
	ld [wc314 + 1], a
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

Function101d03:
	ld a, $0e
	ld [wc314 + 1], a
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

Function101d10:
	ld c, $01
	call Function10142c
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	jr Function101d2a

Function101d1e:
	ld c, $03
	call Function10142c
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a

Function101d2a:
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

Jumptable_101d4d:
	dw Function101d51
	dw Function101d5d

Function101d51:
	ld a, $3c
	ld [wcd42], a
	ld a, [wcd26]
	inc a
	ld [wcd26], a

Function101d5d:
	ld hl, wcd42
	dec [hl]
	ret nz
	ld a, [wcd26]
	set 7, a
	ld [wcd26], a
	ret

Function101d6b:
	ld a, [wc30d]
	and a
	ret nz
	ld hl, wcd29
	res 4, [hl]
	ld a, $64
	ld [wMobileCommsJumptableIndex], a
	ret

Function101d7b:
	farcall Function10138b
	ld b, 0
	ld hl, Unknown_101d8d
	add hl, bc
	ld c, [hl]
	ld a, c
	ld [wMobileCommsJumptableIndex], a
	ret

Unknown_101d8d:
	db $15, $15, $1f, $1f, $0c, $12, $3a, $3a

Function101d95:
	call Function101ee2
	call LoadStandardMenuHeader
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

Function101db2:
	farcall Function103302
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

Function101dd0:
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

Function101de3:
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

Function101e09:
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

Function101e31:
	ld a, $3a
	ld [wMobileCommsJumptableIndex], a
	jp Function101c2b

Function101e39:
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

Function101e4f:
	ld e, $06
	call Function101ee4
	call Function1013d6
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ld a, 0
	ld [wcd26], a
	ret

Function101e64:
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

Function101e82: ; unreferenced
	call Function101ecc
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

Function101e8d: ; unreferenced
	call Function101ed3
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

Function101e98:
	call ClearSprites
	farcall Function8adb3
	ret c
	ld hl, wGameTimerPause
	set GAMETIMERPAUSE_MOBILE_7_F, [hl]
	ld hl, wdc41
	set 4, [hl]
	ret

Function101ead:
	ld hl, wGameTimerPause
	bit GAMETIMERPAUSE_MOBILE_7_F, [hl]
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

Function101ecc:
	call Function101ee2
	call FadeToMenu
	ret

Function101ed3:
	call Function1013aa
	farcall Function115d99
	ld hl, wcd29
	set 7, [hl]
	ret

Function101ee2:
	ld e, 0

Function101ee4:
	ld d, 0
	ld hl, Unknown_101ef5
	add hl, de
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	farcall Function100504
	ret

Unknown_101ef5:
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

String_101f13:
	db "@"

String_101f14:
	db   "モバイルアダプタを　つかって"
	next "おともだちと　つうしんします@"

String_101f32:
	db   "でんわを　かけるひとには"
	next "つうわりょうきんが　かかります@"

String_101f4f:
	db   "モバイルアダプタの　じゅんびは"
	next "できて　いますか？@"

String_101f69:
	db   "あなたが　おともだちに"
	next "でんわを　かけますか？@"

String_101f81:
	db   "めいしフォルダーを"
	next "つかいますか？@"

String_101f93:
	db   "でんわばんごうを　にゅうりょく"
	next "してください@"

String_101faa:
	db   "それでは　おともだちからの"
	next "でんわを　おまちします⋯@"

String_101fc5:
	next "に　でんわを　かけます@"

String_101fd2:
	next "に　でんわを　かけています@"

String_101fe1:
	db   "でんわが　つながりました!@"

String_101fef:
	db   "つうわを"
	next "しゅうりょう　します⋯@"

String_102000:
	db   "つうしん　しゅうりょう@"

String_10200c:
	db   "つうわ　じかん@"

String_102014:
	db   "それでは　つうしんの"
	next "せっていを　してください@"

Function10202c:
	farcall Function115d99
	ld hl, wcd29
	set 7, [hl]
	ld c, $02
	call Function10142c
	ld e, $0d
	call Function101ee4
	hlcoord 4, 4
	call Function100681
	ret

Function102048:
	call Function10204c
	ret

Function10204c:
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

Function102068:
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

Function102080:
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

Function10208e:
	push de
	ld h, d
	ld l, e
	ld de, wdc42
	ld bc, 8
	call CopyBytes
	pop de
	ret

Function10209c:
	ld a, $ff
	ld hl, wdc42
	ld bc, 8
	call ByteFill
	ret

Function1020a8:
	call Function10209c
	ld c, $01
	ld de, wdc42
	farcall Function17a68f
	ret c
	call Function10208e
	call Function102068
	xor a
	ret

Function1020bf:
	call ClearSprites
	farcall Function8aba9
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
	call OpenSRAM
	call Function10208e
	call Function102068
	call CloseSRAM
	xor a
	ret

.asm_1020e8
	scf
	ret

Function1020ea:
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

Function102112:
	ld a, $04
	call OpenSRAM
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

Function102142:
	call Function10218d
	call Function102180
	ld hl, UnknownText_0x1021d1
	call MenuTextbox
	ld de, SFX_LEVEL_UP
	call PlaySFX
	call JoyWaitAorB
	call ExitMenu
	call Function10219f
	ld hl, UnknownText_0x1021d6
	call MenuTextbox
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

Function102180:
	ld hl, wc608 + 1
	ld de, wStringBuffer2
	ld bc, 11
	call CopyBytes
	ret

Function10218d:
	ld hl, w5_dc00
	ld de, wc608
	ld bc, $26
	ld a, $05
	call FarCopyWRAM
	ld de, wc608 + 1 ; useless
	ret

Function10219f:
	call FadeToMenu
	call Function10218d
	ld de, wc608 + 1
	farcall Function8ac4e
	call JoyWaitAorB
	call PlayClickSFX
	call Function1013aa
	ret

Function1021b8:
	call FadeToMenu
	call Function10218d
	ld de, wPlayerMoveStruct
	farcall Function8ac70
	ld a, c
	ld [wStringBuffer1], a
	push af
	call Function1013aa
	pop af
	ret

UnknownText_0x1021d1:
	text_far UnknownText_0x1bd19a
	text_end

UnknownText_0x1021d6:
	text_far UnknownText_0x1bd1ba
	text_end

UnknownText_0x1021db:
	text_far UnknownText_0x1bd1dd
	text_end

Function1021e0:
	call MenuTextbox
	call JoyWaitAorB
	call ExitMenu
	ret

UnknownText_0x1021ea:
	text_far UnknownText_0x1bd201
	text_end

UnknownText_0x1021ef:
	text_far UnknownText_0x1bd211
	text_end

UnknownText_0x1021f4:
	text_far UnknownText_0x1bd223
	text_end

Function1021f9:
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

Function102233:
	ld hl, wcd49
	ld bc, 10
	xor a
	call ByteFill
	call Function10304f
	ret

Function102241:
	call Function10226a
	call Function102274
	call Function10224b
	ret

Function10224b:
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
	farcall Mobile_ReloadMapPart
	scf
	ret

Function10226a:
	ld hl, wcd4b
	bit 0, [hl]
	ret z
	call Function10305d
	ret

Function102274:
	ld hl, wcd4b
	bit 3, [hl]
	ret z
	res 3, [hl]
	ld de, 8
	call PlaySFX
	ret

Function102283:
	ld a, $01
	ld [wAttrmapEnd], a
	ld hl, wcd4b
	set 0, [hl]
	ret

Function10228e:
	xor a
	ld [wAttrmapEnd], a
	ld hl, wcd4b
	res 0, [hl]
	ret

Function102298:
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
	ld [wAttrmapEnd], a
	ret

Function1022ca:
	ld a, 30
	ld [wOverworldDelay], a
	ret

Function1022d0:
	farcall Function10032e
	ld a, [wcd2b]
	and a
	jr nz, .asm_1022f3
	call Function102298
	ld a, [wOverworldDelay]
	ld c, a
	ld a, 30
	sub c
	ld c, a
	ld b, $03
	farcall AdvanceMobileInactivityTimerAndCheckExpired
	jr c, .asm_1022f3
	xor a
	ret

.asm_1022f3
	scf
	ret

Jumptable_1022f5:
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

Function10234b:
	call Function102d9a
	call Function102dd3
	call Function102dec
	ld hl, wcd4b
	set 1, [hl]
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret

Function102361:
	ld a, $cc
	call Function1028e8
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret

Function10236e:
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

Function102387:
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

Function1023a1:
	call Function102283
	call Function102db7
	call Function102dec
	ld hl, wcd4b
	set 1, [hl]
	ld a, $1d
	ld [wcd49], a
	ret

Function1023b5:
	call Function10228e
	call Function102a3b
	call Function102b12
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret

Function1023c6:
	call Function102c48
	call Function102c87
	ld a, [wcd4c]
	dec a
	ld [wCurPartyMon], a
	xor a ; REMOVE_PARTY
	ld [wPokemonWithdrawDepositParameter], a
	farcall RemoveMonFromPartyOrBox
	ld hl, wPartyCount
	inc [hl]
	ld a, [hli]
	ld c, a
	ld b, 0
	add hl, bc
	ld [hl], $ff
	ld a, [wPartyCount]
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

Function102416:
	ld a, $aa
	call Function1028e8
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret

Function102423:
	call Function102921
	ret nc
	farcall SaveAfterLinkTrade
	farcall StubbedTrainerRankings_Trades
	farcall BackupMobileEventIndex
	ld hl, wcd4b
	set 1, [hl]
	ld a, 0
	ld [wcd4a], a
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret

Function10244b:
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

Function10246a:
	call Function102d9a
	ld hl, wcd29
	set 3, [hl]
	call Function102e07
	ld hl, wcd4b
	set 1, [hl]
	ld a, $2a
	ld [wcd49], a
	ret

Function102480:
	ld c, $32
	call DelayFrames
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret

Function10248d:
	ld a, [wcd49]
	set 7, a
	ld [wcd49], a
	ret

Function102496:
	ld hl, wcd4e
	dec [hl]
	ret nz
	ld a, 0
	ld [wcd4a], a
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret

Function1024a8:
	farcall Function1009f3
	ret c

Function1024af:
	call GetJoypad
	ld a, [wcd4a]
	ld hl, Jumptable_1024ba
	rst JumpTable
	ret

Jumptable_1024ba:
	dw Function1024c0
	dw Function1024cb
	dw Function1024de

Function1024c0:
	ld hl, wcd4e
	inc [hl]
	ld a, [wcd4a]
	inc a
	ld [wcd4a], a

Function1024cb:
	ld hl, wcd4e
	dec [hl]
	ret nz
	ld a, [wcd4f]
	inc a
	ld [wcd4e], a
	ld a, [wcd4a]
	inc a
	ld [wcd4a], a

Function1024de:
	ld hl, wcd4e
	dec [hl]
	jr z, .asm_1024e9
	ldh a, [hJoyPressed]
	and A_BUTTON | B_BUTTON
	ret z

.asm_1024e9
	ld a, 0
	ld [wcd4a], a
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret

Function1024f6:
	call PlaceHollowCursor
	ld hl, wcd4b
	set 1, [hl]
	ld a, [wcd4c]
	call Function1028e8
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret

Function10250c:
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
	farcall Functionfb5dd
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

Function102591:
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

Function1025b0:
	ld a, $09
	call Function1028e8
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret

Function1025bd:
	call Function1028fc
	ret nc
	ld a, $04
	ld [wcd49], a
	ret

Function1025c7:
	call Function102f6d
	ld hl, wcd4b
	set 1, [hl]
	ld a, $0f
	call Function1028e8
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret

Function1025dc:
	call Function1028fc
	ret nc
	ld a, [wcd49]
	set 7, a
	ld [wcd49], a
	ret

Function1025e9:
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

Function1025ff:
	ld hl, wcd4b
	set 2, [hl]
	farcall Function1009f3
	ret c
	farcall MobileMenuJoypad
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
	ld a, [wOTPartyCount]
	cp b
	ret nz
	call HideCursor
	ld a, [wPartyCount]
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

Function102652:
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

Function10266b:
	ld hl, wcd4b
	set 2, [hl]
	farcall Function1009f3
	ret c
	farcall MobileMenuJoypad
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
	ld a, [wPartyCount]
	cp b
	ret nz
	ld a, $23 ; Function1026b7
	ld [wcd49], a
	ret

Function1026b7:
	ld hl, wcd4b
	set 6, [hl]
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ld a, 0
	ld [wcd4a], a

Function1026c8:
	call GetJoypad
	farcall Function1009f3
	ret c
	ld a, [wcd4a]
	ld hl, Jumptable_1026da
	rst JumpTable
	ret

Jumptable_1026da:
	dw Function1026de
	dw Function1026f3

Function1026de:
	call HideCursor
	hlcoord 9, 17
	ld [hl], $ed
	ld a, [wcd4a]
	inc a
	ld [wcd4a], a
	ld hl, wcd4b
	set 1, [hl]
	ret

Function1026f3:
	ldh a, [hJoyPressed]
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
	ld a, [wOTPartyCount]
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

Function102738:
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

Function102754:
	call GetJoypad
	farcall Function1009f3
	ret c
	ld a, [wcd4a]
	ld hl, Jumptable_102766
	rst JumpTable
	ret

Jumptable_102766:
	dw Function102770
	dw Function102775
	dw Function10278c
	dw Function1027a0
	dw Function1027b7

Function102770:
	ld a, $01
	ld [wcd4a], a

Function102775:
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

Function10278c:
	ldh a, [hJoyPressed]
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
Function1027a0:
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

Function1027b7:
	ldh a, [hJoyPressed]
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

Function1027eb:
	hlcoord 0, 14
	ld b, 2
	ld c, 18
	ld d, h
	ld e, l
	farcall _LinkTextbox
	ld de, .Stats_Trade
	hlcoord 2, 16
	call PlaceString
	ret

.Stats_Trade:
	db "STATS     TRADE@"

Function102814:
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

Function10283c:
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

Function102862:
	ld a, $08
	call Function1028e8
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ret

Function10286f:
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

Function1028a5:
	ld a, $4 ; Function1023a1
	ld [wcd49], a
	ret

Function1028ab:
	ld a, [wcd52]
	ld [wMenuCursorY], a
	call Function102f15
	ld hl, wcd4b
	set 1, [hl]
	ld a, $c ; Function1025b0
	ld [wcd49], a
	ret

Function1028bf:
	ld a, [wcd49]
	inc a
	ld [wcd49], a

Function1028c6:
	xor a
	ld [wMonType], a
	call Function102bac
	ld a, $1d ; Function102652
	ld [wcd49], a
	ret

Function1028d3:
	ld a, [wcd49]
	inc a
	ld [wcd49], a

Function1028da:
	ld a, OTPARTYMON
	ld [wMonType], a
	call Function102bac
	ld a, $1f ; Function1025e9
	ld [wcd49], a
	ret

Function1028e8:
	ld hl, wcd4b
	res 6, [hl]
	ld [wcd50], a
	farcall StartMobileInactivityTimer
	ld a, 0
	ld [wcd4a], a
	ret

Function1028fc:
	call GetJoypad
	farcall Function1009f3
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

Jumptable_102917:
	dw Function102933
	dw Function10294f
	dw Function10295d
	dw Function10296e
	dw Function102996

Function102921:
	ld a, [wcd4a]
	ld hl, Jumptable_10292f
	rst JumpTable
	ret nc
	ld a, 0
	ld [wcd4a], a
	ret

Jumptable_10292f:
	dw Function10295d
	dw Function102984

Function102933:
	ld hl, MenuHeader_1029bb
	call LoadMenuHeader
	call Function102e07
	ld a, $32
	ld [wTextDelayFrames], a
	ld hl, wcd4b
	set 1, [hl]
	ld a, [wcd4a]
	inc a
	ld [wcd4a], a
	and a
	ret

Function10294f:
	ld a, [wTextDelayFrames]
	and a
	ret nz
	ld a, [wcd4a]
	inc a
	ld [wcd4a], a
	and a
	ret

Function10295d:
	call Function10299e
	ld a, 0
	ld [wcd27], a
	ld a, [wcd4a]
	inc a
	ld [wcd4a], a
	and a
	ret

Function10296e:
	farcall Function100382
	and a
	ld a, [wcd27]
	bit 7, a
	ret z
	ld a, [wcd4a]
	inc a
	ld [wcd4a], a
	and a
	ret

Function102984:
	farcall Function100382
	and a
	ld a, [wcd27]
	bit 7, a
	ret z
	call Function1029af
	scf
	ret

Function102996:
	call Function1029af
	call ExitMenu
	scf
	ret

Function10299e:
	ld a, $01
	ld [wccb4], a
	ld a, [wcd50]
	ld [wccb5], a
	ld a, $aa
	ld [wcd51], a
	ret

Function1029af:
	ld hl, wcd4b
	res 7, [hl]
	ld a, [wcc61]
	ld [wcd51], a
	ret

MenuHeader_1029bb:
	db MENU_BACKUP_TILES ; flags
	menu_coords 3, 10, 15, 12
	dw NULL
	db 1 ; default option

Function1029c3:
	ld a, [wcd4a]
	ld hl, Jumptable_1029cb
	rst JumpTable
	ret

Jumptable_1029cb:
	dw Function1029cf
	dw Function1029fe

Function1029cf:
	call LoadStandardMenuHeader
	hlcoord 10, 7
	ld b, 3
	ld c, 8
	ld d, h
	ld e, l
	farcall _LinkTextbox
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

Function1029fe:
	farcall Function1009f3
	ret c
	farcall MobileMenuJoypad
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

String_102a26:
	db   "TRADE"
	next "CANCEL"
	db   "@"

MenuData3_102a33:
	db 8, 11
	db 2,  1
	db $80, $00
	dn 2, 0
	db A_BUTTON

Function102a3b:
	ld a, [wcd30]
	ld [wc74e], a
	ld hl, wPlayerName
	ld de, wPlayerTrademonSenderName
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, [wcd4c]
	dec a
	ld c, a
	ld b, 0
	ld hl, wPartySpecies
	add hl, bc
	ld a, [hl]
	ld [wPlayerTrademonSpecies], a
	ld a, [wcd4c]
	dec a
	ld hl, wPartyMonOT
	call SkipNames
	ld de, wPlayerTrademonOTName
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, [wcd4c]
	dec a
	ld hl, wPartyMon1ID
	call GetPartyLocation
	ld a, [hli]
	ld [wPlayerTrademonID], a
	ld a, [hl]
	ld [wPlayerTrademonID + 1], a
	ld a, [wcd4c]
	dec a
	ld hl, wPartyMon1DVs
	call GetPartyLocation
	ld a, [hli]
	ld [wPlayerTrademonDVs], a
	ld a, [hl]
	ld [wPlayerTrademonDVs + 1], a
	ld a, [wcd4c]
	dec a
	ld hl, wPartyMon1Species
	call GetPartyLocation
	ld b, h
	ld c, l
	farcall GetCaughtGender
	ld a, c
	ld [wPlayerTrademonCaughtData], a
	ld hl, wOTPlayerName
	ld de, wOTTrademonSenderName
	ld bc, NAME_LENGTH
	call CopyBytes

	ld a, [wcd4d]
	dec a
	ld c, a
	ld b, 0
	ld hl, wOTPartySpecies
	add hl, bc
	ld a, [hl]
	ld [wOTTrademonSpecies], a
	ld a, [wcd4d]
	dec a
	ld hl, wOTPartyMonOT
	call SkipNames
	ld de, wOTTrademonOTName
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, [wcd4d]
	dec a
	ld hl, wOTPartyMon1ID
	call GetPartyLocation
	ld a, [hli]
	ld [wOTTrademonID], a
	ld a, [hl]
	ld [wOTTrademonID + 1], a
	ld a, [wcd4d]
	dec a
	ld hl, wOTPartyMon1DVs
	call GetPartyLocation
	ld a, [hli]
	ld [wOTTrademonDVs], a
	ld a, [hl]
	ld [wOTTrademonDVs + 1], a
	ld a, [wcd4d]
	dec a
	ld hl, wOTPartyMon1Species
	call GetPartyLocation
	ld b, h
	ld c, l
	farcall GetCaughtGender
	ld a, c
	ld [wOTTrademonCaughtData], a
	ret

Function102b12:
	ld c, 100
	call DelayFrames
	call Function102d9a
	call LoadFontsBattleExtra
	ld a, [wcd2f]
	and a
	jr nz, .asm_102b2b
	farcall Function108026
	jr .asm_102b31

.asm_102b2b
	farcall Function10802a

.asm_102b31
	ret

Function102b32:
	ld a, [wcd4c]
	dec a
	ld [wCurPartyMon], a
	ld a, $01
	ld [wForceEvolution], a
	farcall EvolvePokemon
	call Function102d9a
	call Function102dd3
	call Function102dec
	ret

Function102b4e:
	ld a, OTPARTYMON
	ld [wMonType], a
	ld a, [wMenuCursorY]
	push af
	ld de, Unknown_102b73
	call SetMenuAttributes
	pop af
	ld [wMenuCursorY], a
	ld a, [wOTPartyCount]
	ld [w2DMenuNumRows], a
	ret

Function102b68: ; unreferenced
	xor a
	ld hl, wWindowStackPointer
	ld bc, $10
	call ByteFill
	ret

Unknown_102b73:
	db 9, 6
	db 255, 1
	db $a0, $00
	dn 1, 0
	db D_UP | D_DOWN | A_BUTTON

Function102b7b:
	xor a
	ld [wMonType], a
	ld a, [wMenuCursorY]
	push af
	ld de, Unknown_102b94
	call SetMenuAttributes
	pop af
	ld [wMenuCursorY], a
	ld a, [wPartyCount]
	ld [w2DMenuNumRows], a
	ret

Unknown_102b94:
	db 1, 6
	db 255, 1
	db $a0, $00
	dn 1, 0
	db D_UP | D_DOWN | A_BUTTON

Function102b9c:
	ld a, [wcd4d]
	dec a
	hlcoord 6, 9
	ld bc, $14
	call AddNTimes
	ld [hl], $ec
	ret

Function102bac:
	ld a, [wMenuCursorY]
	dec a
	ld [wCurPartyMon], a
	call LowVolume
	call ClearSprites
	farcall _MobileStatsScreenInit
	ld a, [wCurPartyMon]
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

Function102bdc:
	ld a, [wcd4d]
	dec a
	ld hl, wOTPartyMon1Species
	call GetPartyLocation
	push hl
	ld a, [wcd4d]
	ld c, a
	ld b, 0
	ld hl, wOTPartyCount
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

Function102c07:
	call Function102c14
	call Function102c3b
	call Function102c21
	call Function102c2e
	ret

Function102c14:
	ld hl, wPartySpecies
	ld de, wOTPartySpecies
	ld bc, 1
	call Function102c71
	ret

Function102c21:
	ld hl, wPartyMonNicknames
	ld de, wOTPartyMonNicknames
	ld bc, 11
	call Function102c71
	ret

Function102c2e:
	ld hl, wPartyMonOT
	ld de, wOTPartyMonOT
	ld bc, 11
	call Function102c71
	ret

Function102c3b:
	ld hl, wPartyMon1
	ld de, wOTPartyMon1
	ld bc, $30
	call Function102c71
	ret

Function102c48:
	farcall Function10165a
	ld a, 0
	call OpenSRAM
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

Function102c71:
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

Function102c87:
	ld a, [wJumptableIndex]
	push af
	ld a, [wcf64]
	push af
	ld a, [wcd4c]
	ld [wJumptableIndex], a
	ld a, [wPartyCount]
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
	ld a, [wOTPartyCount]
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

Function102cee:
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

Function102d34:
	ld hl, wc608
	ld bc, $2f
	call AddNTimes
	ret

Function102d3e:
	call OpenSRAM
	call CopyBytes
	call CloseSRAM
	ret

Function102d48:
	ld a, [wcd4c]
	ld e, a
	ld d, 0
	ld hl, wPartyCount
	add hl, de
	ld a, [hl]
	ld [wTempSpecies], a
	cp EGG
	jr z, .asm_102d6d
	dec a
	call SetSeenAndCaughtMon
	ld a, [wcd4c]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1Happiness
	call AddNTimes
	ld [hl], BASE_HAPPINESS

.asm_102d6d
	ld a, [wTempSpecies]
	cp UNOWN
	jr nz, .asm_102d98
	ld a, [wcd4c]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1DVs
	call AddNTimes
	predef GetUnownLetter
	farcall UpdateUnownDex
	ld a, [wFirstUnownSeen]
	and a
	jr nz, .asm_102d98
	ld a, [wUnownLetter]
	ld [wFirstUnownSeen], a

.asm_102d98
	and a
	ret

Function102d9a:
	ld a, " "
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	ld a, $07
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	farcall HDMATransferAttrmapAndTilemapToWRAMBank3
	ret

Function102db7:
	call Function102e4f
	call Function102e3e
	ld hl, wcd4b
	set 1, [hl]
	ret

Function102dc3:
	hlcoord 0, 12
	ld b,  4
	ld c, 18
	ld d, h
	ld e, l
	farcall _LinkTextbox
	ret

Function102dd3:
	call DisableLCD
	ld de, MobileTradeLightsGFX
	ld hl, vTiles0
	lb bc, BANK(MobileTradeLightsGFX), 4
	call Get2bpp
	farcall __LoadTradeScreenBorder
	call EnableLCD
	ret

Function102dec:
	ld hl, MobileTradeLightsPalettes
	ld de, wOBPals1
	ld bc, 4 palettes
	ld a, $05
	call FarCopyWRAM
	farcall Function49742
	call SetPalettes
	call DelayFrame
	ret

Function102e07:
	hlcoord 3, 10
	ld b,  1
	ld c, 11
	ld a, [wBattleMode]
	and a
	jr z, .link_battle
	call Textbox
	jr .okay

.link_battle
; the next three operations are pointless
	hlcoord 3, 10
	ld b,  1
	ld c, 11
	ld d, h
	ld e, l
	farcall _LinkTextbox

.okay
	ld de, .waiting
	hlcoord 4, 11
	call PlaceString
	ret

.waiting
	db "Waiting...!@"

Function102e3e:
	ld de, .CancelString
	hlcoord 10, 17
	call PlaceString
	ret

.CancelString:
	db "CANCEL@"

Function102e4f:
	farcall Function16d42e
	farcall _InitMG_Mobile_LinkTradePalMap
	ld de, wPlayerName
	hlcoord 4, 0
	call PlaceString
	ld a, $14
	ld [bc], a
	ld de, wOTPlayerName
	hlcoord 4, 8
	call PlaceString
	ld a, $14
	ld [bc], a
	hlcoord 7, 1
	ld de, wPartySpecies
	call .PlaceSpeciesNames
	hlcoord 7, 9
	ld de, wOTPartySpecies
	call .PlaceSpeciesNames
	ret

.PlaceSpeciesNames:
	ld c, 0
.count_loop
	ld a, [de]
	cp $ff
	ret z
	ld [wNamedObjectIndexBuffer], a
	push bc
	push hl
	push de
	push hl
	ld a, c
	ldh [hDividend], a
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

Function102ea8:
	call Function102dc3
	ld a, [wcd4c]
	dec a
	ld c, a
	ld b, 0
	ld hl, wPartySpecies
	add hl, bc
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, wStringBuffer1
	ld de, wStringBuffer2
	ld bc, 11
	call CopyBytes
	ld a, [wcd4d]
	dec a
	ld c, a
	ld b, 0
	ld hl, wOTPartySpecies
	add hl, bc
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, UnknownText_0x102ee2
	call PrintTextboxText
	ret

UnknownText_0x102ee2:
	text_far UnknownText_0x1bd286
	text_end

Function102ee7:
	call Function102dc3
	ld de, String_102ef4
	hlcoord 1, 14
	call PlaceString
	ret

String_102ef4:
	db   "Too bad! The trade"
	next "was canceled!"
	db   "@"

Function102f15:
	call Function102dc3
	ld de, .TooBadTheTradeWasCanceled
	hlcoord 1, 14
	call PlaceString
	ret

.TooBadTheTradeWasCanceled:
	db "こうかんを　キャンセルしました@"

Function102f32:
	call Function102dc3
	ld de, .TradeCompleted
	hlcoord 1, 14
	call PlaceString
	ret

.TradeCompleted:
	db "Trade completed!@"

Function102f50:
	call Function102dc3
	ld de, .PleaseWait
	hlcoord 1, 14
	call PlaceString
	ret

.PleaseWait:
	db "しょうしょう　おまち　ください@"

Function102f6d:
	call Function102dc3
	ld de, .Finished
	hlcoord 1, 14
	call PlaceString
	ret

.Finished:
	db "しゅうりょう　します@"

Function102f85:
	ld a, [wd003]
	ld c, a
	ld b, 0
	ld hl, wOTPartySpecies
	add hl, bc
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	call Function102dc3
	ld de, String_102fb2
	hlcoord 1, 14
	call PlaceString
	ld de, wStringBuffer1
	hlcoord 13, 14
	call PlaceString
	ld de, String_102fcc
	call PlaceString
	ret

String_102fb2:
	db   "あいてがわ<PKMN>えらんだ　"
	next "いじょう<PKMN>あるようです！！"
	db   "@"

String_102fcc:
	db "に@"

Function102fce:
	call Function102dc3
	ld de, String_102fdb
	hlcoord 1, 14
	call PlaceString
	ret

String_102fdb:
	db   "あいてがわ<NO>せんたくに"
	next "いじょう<PKMN>あるようです！！"
	done

Function102ff5:
	call Function102dc3
	ld de, String_103002
	hlcoord 1, 14
	call PlaceString
	ret

String_103002:
	db   "その#を　こうかんすると"
	next "せんとう　できなく　なっちゃうよ！"
	db   "@"

Function103021:
	call Function102dc3
	ld de, String_10302e
	hlcoord 1, 14
	call PlaceString
	ret

String_10302e:
	db   "あいてが　ちゅうしを　えらんだので"
	next "こうかんを　ちゅうし　します"
	db   "@"

Function10304f:
	xor a
	ld [wAttrmapEnd], a
	ld [wcf42], a
	ld [wcf44], a
	ld [wcf45], a
	ret

Function10305d:
	nop
	ld a, [wAttrmapEnd]
	and a
	ret z
	call Function10307f
	ret c
	call Function103094
	call Function10306e
	ret

Function10306e:
	ld a, $01
	ldh [hOAMUpdate], a
	call ClearSprites
	ld de, wVirtualOAM
	call Function1030cd
	xor a
	ldh [hOAMUpdate], a
	ret

Function10307f:
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

Function103094:
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

Function1030cd:
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

	add LOW(Unknown_10327a)
	ld l, a
	ld a, HIGH(Unknown_10327a)
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

Unknown_103112:
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

Unknown_10327a:
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

MobileTradeLightsGFX:
INCBIN "gfx/mobile/mobile_trade_lights.2bpp"

MobileTradeLightsPalettes:
INCLUDE "gfx/mobile/mobile_trade_lights.pal"

Function103302:
	call Function103309
	call Function103362
	ret

Function103309:
	xor a
	ldh [hBGMapMode], a
	ld hl, wBuffer1
	ld bc, 10
	xor a
	call ByteFill
	ld a, BANK(s4_a60c)
	call OpenSRAM
	ld a, [wdc41]
	ld [s4_a60c], a
	ld [wBuffer1], a
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
	farcall HDMATransferAttrmapAndTilemapToWRAMBank3
	ld a, $01
	ld [wd1f0], a
	call Function10339a
	ret

Function103362:
.asm_103362
	ld a, [wd1f0]
	ld [wd1f1], a
	call Function1033af
	call Function10339a
	call Function10342c
	farcall HDMATransferTilemapToWRAMBank3
	ld a, [wBuffer2]
	bit 7, a
	jr z, .asm_103362
	ld hl, wBuffer2
	bit 6, [hl]
	jr z, .asm_103398
	ld a, BANK(s4_a60c)
	call OpenSRAM
	ld a, [wBuffer1]
	ld [s4_a60c], a
	ld [wdc41], a
	call CloseSRAM
	xor a
	ret

.asm_103398
	scf
	ret

Function10339a:
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

Function1033af:
	call GetJoypad
	ldh a, [hJoyPressed]
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
	ld hl, wBuffer2
	set 7, [hl]
	ret

.a
	ld a, [wd1f3]
	cp 3
	jr nz, .a_return
	ld de, SFX_TRANSACTION
	call PlaySFX
	ld hl, wBuffer2
	set 7, [hl]
	ld hl, wBuffer2
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
	ld a, [wBuffer1]
	xor e
	ld [wBuffer1], a
	ret

Function10342c:
	ld a, [wd1f0]
	ld [wd1f2], a
	call Function103490
	call Function10343c
	call Function1034a7
	ret

Function10343c:
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
	ld a, [wBuffer1]
	and e
	ld bc, 2
	jr z, .asm_10347d
	ld bc, 4

.asm_10347d
	call Function10350f
	ld bc, 11
	call Function103487
	ret

Function103487:
	push de
	call Function1034f7
	pop de
	call PlaceString
	ret

Function103490:
	hlcoord 0, 15
	ld c, $14
	ld b, $03
	call Function1034e0
	ld bc, 6
	call Function10350f
	hlcoord 1, 16
	call PlaceString
	ret

Function1034a7:
	ld a, [wd1f1]
	ld [wd1f2], a
	ld bc, 10
	call Function1034f7
	ld [hl], $7f
	ld bc, 10
	call Function1034f1
	ld [hl], $ed
	ret

Function1034be:
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

Function1034e0:
	push bc
	push hl
	call ClearBox
	pop hl
	ld bc, wAttrmap - wTilemap
	add hl, bc
	pop bc
	ld a, $06
	call FillBoxWithByte
	ret

Function1034f1:
	ld a, [wd1f0]
	ld [wd1f2], a

Function1034f7:
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

Function10350f:
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

Unknown_103522:
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
String_103546: db "せんとう　アニメ@"
String_10354f: db "でんわばんごう@"
String_103557: db "めいしこうかん@"
String_10355f: db "でんわを　かけるひとが　きめられる@"
String_103571: db "でんわばんごうの　にゅうりょくのしかた@"
String_103585: db "あたらしいめいしが　あれば　こうかん@"
String_103598: db "とばして　みる@"
String_1035a0: db "じっくり　みる@"
String_1035a8: db "めいしからえらぶ@"
String_1035b1: db "すうじで　いれる@"
String_1035ba: db "する@"
String_1035bd: db "しない@"
String_1035c1: db "けってい@"

Function1035c6:
	farcall Function10138b
	ld b, 0
	ld hl, Unknown_1035d7
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

Unknown_1035d7:
	dw Unknown_1035e7
	dw Unknown_1035f3
	dw Unknown_103608
	dw Unknown_103608
	dw Unknown_1035fe
	dw AskMobileOrCable
	dw AskMobileOrCable
	dw AskMobileOrCable

Unknown_1035e7:
	dwcoord 0, 6
	db $12, $07, $07
	dw .this
.this
	db 4, 2, 1, 0, 3

Unknown_1035f3:
	dwcoord 0, 7
	db $12, $06, $09
	dw .this
.this
	db 3, 2, 1, 3

Unknown_1035fe:
	dwcoord 0, 9
	db $12, $04, $0b
	dw .this
.this
	db 2, 0, 3

Unknown_103608:
	dwcoord 0, 9
	db $12, $04, $0b
	dw .this
.this
	db 2, 2, 3

AskMobileOrCable:
	ld hl, MenuHeader_103640
	call LoadMenuHeader
	ld a, [wMobileOrCable_LastSelection]
	and $0f
	jr z, .skip_load
	ld [wMenuCursorBuffer], a

.skip_load
	call VerticalMenu
	call CloseWindow
	jr c, .pressed_b
	ld a, [wMenuCursorY]
	ld [wScriptVar], a
	ld c, a
	ld a, [wMobileOrCable_LastSelection]
	and $f0
	or c
	ld [wMobileOrCable_LastSelection], a
	ret

.pressed_b
	xor a
	ld [wScriptVar], a
	ret

MenuHeader_103640:
	db MENU_BACKUP_TILES ; flags
	menu_coords 13, 6, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw MenuData_103648
	db 1 ; default option

MenuData_103648:
	db STATICMENU_CURSOR ; flags
	db 2
	db "モバイル@"
	db "ケーブル@"

Function103654:
	farcall Mobile_AlwaysReturnNotCarry
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

Mobile_SelectThreeMons:
	farcall Mobile_AlwaysReturnNotCarry
	bit 7, c
	jr z, .asm_10369b
	ld hl, UnknownText_0x10375d
	call PrintText
	call YesNoBox
	jr c, .asm_103696
	farcall CheckForMobileBattleRules
	jr nc, .asm_103690
	call JoyWaitAorB
	jr .asm_103696

.asm_103690
	ld a, $01
	ld [wScriptVar], a
	ret

.asm_103696
	xor a
	ld [wScriptVar], a
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
	ld hl, MenuHeader_103747
	call LoadMenuHeader
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
	farcall CheckForMobileBattleRules
	jr nc, .asm_1036e6
	call JoyWaitAorB
	jr .asm_1036f4

.asm_1036e6
	ld a, $01
	ld [wScriptVar], a
	ret

.asm_1036ec
	call Function1036f9
	call JoyWaitAorB
	jr .asm_1036b5

.asm_1036f4
	xor a
	ld [wScriptVar], a
	ret

Function1036f9:
	ld hl, UnknownText_0x103767
	call PrintText
	ret

Function103700:
	ld c, $0a
	ld hl, wSwarmFlags
	bit SWARMFLAGS_MOBILE_4_F, [hl]
	jr z, .asm_10370f
	farcall MobileBattleGetRemainingTime

.asm_10370f
	ld a, c
	ld [wStringBuffer2], a
	ld a, [wStringBuffer2]
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

MenuHeader_103747:
	db MENU_BACKUP_TILES ; flags
	menu_coords 13, 5, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw MenuData_10374f
	db 1 ; default option

MenuData_10374f:
	db STATICMENU_CURSOR | STATICMENU_NO_TOP_SPACING ; flags
	db 3
	db "はい@"
	db "やめる@"
	db "せつめい@"

UnknownText_0x10375d:
	text_far UnknownText_0x1c422a
	text_end

UnknownText_0x103762:
	text_far UnknownText_0x1c4275
	text_end

UnknownText_0x103767:
	text_far UnknownText_0x1c4298
	text_end

UnknownText_0x10376c:
	text_far UnknownText_0x1c439c
	text_end

UnknownText_0x103771:
	text_far UnknownText_0x1c43dc
	text_end

UnknownText_0x103776:
	text_far UnknownText_0x1c4419
	text_end

UnknownText_0x10377b:
	text_far UnknownText_0x1c445a
	text_end

Function103780:
	ld a, [wChosenCableClubRoom]
	push af
	call Function10378c
	pop af
	ld [wChosenCableClubRoom], a
	ret

Function10378c:
	ld c, 0
	ld hl, wSwarmFlags
	bit SWARMFLAGS_MOBILE_4_F, [hl]
	jr nz, .already_set
	ld c, 1
	ld hl, wSwarmFlags
	set SWARMFLAGS_MOBILE_4_F, [hl]

.already_set
	push bc
	farcall Link_SaveGame
	pop bc
	jr c, .failed_to_save
	ld a, 1
	ld [wScriptVar], a
	ld a, c
	and a
	ret z
	farcall MobileBattleResetTimer
	ret

.failed_to_save
	xor a
	ld [wScriptVar], a
	ld a, c
	and a
	ret z
	ld hl, wSwarmFlags
	res SWARMFLAGS_MOBILE_4_F, [hl]
	ret

Function1037c2:
	call MobileCheckRemainingBattleTime
	jr c, .nope
	ld a, [wdc5f]
	and a
	jr z, .nope
	ld hl, UnknownText_0x1037e6
	call PrintText
	call YesNoBox
	jr c, .nope
	ld a, $01
	ld [wScriptVar], a
	ret

.nope
	xor a
	ld [wdc5f], a
	ld [wScriptVar], a
	ret

UnknownText_0x1037e6:
	text_far UnknownText_0x1c449c
	text_end

Function1037eb:
	call MobileCheckRemainingBattleTime
	jr nc, .asm_103807
	ld hl, MobileBattleLessThanOneMinuteLeftText
	call PrintText
	call JoyWaitAorB
	ld hl, MobileBattleNoTimeLeftForLinkingText
	call PrintText
	call JoyWaitAorB
	xor a
	ld [wScriptVar], a
	ret

.asm_103807
	ld a, [wdc60]
	and a
	jr nz, .asm_103813
	ld a, $01
	ld [wScriptVar], a
	ret

.asm_103813
	ld a, $02
	ld [wScriptVar], a
	ret

MobileBattleLessThanOneMinuteLeftText:
	text_far _MobileBattleLessThanOneMinuteLeftText
	text_end

MobileBattleNoTimeLeftForLinkingText:
	text_far _MobileBattleNoTimeLeftForLinkingText
	text_end

MobileCheckRemainingBattleTime:
; Returns carry if less than one minute remains
	farcall Mobile_AlwaysReturnNotCarry
	bit 7, c
	jr nz, .ok
	farcall MobileBattleGetRemainingTime
	ld a, c
	cp 1
	jr c, .fail

.ok
	xor a
	ret

.fail
	scf
	ret

Function10383c:
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
	farcall Script_reloadmappart
	farcall Function4a94e
	jr c, .asm_103870
	ld hl, wd002
	ld de, wPlayerMonSelection
	ld bc, 3
	call CopyBytes
	xor a
	ld [wScriptVar], a
	ret

.asm_103870
	ld a, $01
	ld [wScriptVar], a
	ret

UnknownText_0x103876:
	text_far UnknownText_0x1c4508
	text_end

Function10387b:
	farcall Mobile_AlwaysReturnNotCarry
	bit 7, c
	ret nz
	farcall MobileBattleGetRemainingTime
	ld a, c
	ld [wStringBuffer2], a
	ld hl, UnknownText_0x103898
	call PrintText
	call JoyWaitAorB
	ret

UnknownText_0x103898:
	text_far UnknownText_0x1c4525
	text_end
