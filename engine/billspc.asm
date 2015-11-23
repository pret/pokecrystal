_DepositPKMN: ; e2391 (38:6391)
	ld hl, Options
	ld a, [hl]
	push af
	set 4, [hl]
	ld a, [VramState]
	push af
	xor a
	ld [VramState], a
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	xor a
	ld [hMapAnims], a
	call Functione2963
	xor a
	ld [wcb2e], a
	call DelayFrame
.asm_e23b4
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .asm_e23c6
	call Functione23d5
	call DelayFrame
	jr .asm_e23b4
.asm_e23c6
	call ClearSprites
	pop af
	ld [hInMenu], a
	pop af
	ld [VramState], a
	pop af
	ld [Options], a
	ret

Functione23d5: ; e23d5 (38:63d5)
	ld a, [wJumptableIndex]
	ld hl, Jumptable_e23df
	call Functione33df
	jp [hl]

Jumptable_e23df: ; e23df (38:63df)
	dw Functione23e9
	dw Functione241a
	dw Functione245d
	dw Functione247d
	dw Functione2992


Functione23e9: ; e23e9 (38:63e9)
	xor a
	ld [hBGMapMode], a
	call ClearSprites
	call Functione2d30
	call Functione2a8e
	ld de, PCString_ChooseaPKMN
	call Functione2a6e
	ld a, $5
	ld [wcb2d], a
	call Functione2c2c
	call PCMonInfo
	ld a, $ff
	ld [CurPartySpecies], a
	ld a, $17
	call Functione33d0
	call WaitBGMap
	call Functione2e01
	call Functione298d
	ret

Functione241a: ; e241a (38:641a)
	ld hl, hJoyPressed ; $ffa7
	ld a, [hl]
	and B_BUTTON
	jr nz, .asm_e2457
	ld a, [hl]
	and A_BUTTON
	jr nz, .asm_e2443
	call Functione29b5
	and a
	ret z
	call Functione2e01
	xor a
	ld [hBGMapMode], a
	call Functione2c2c
	call PCMonInfo
	ld a, $1
	ld [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	ret
.asm_e2443
	call Functione2def
	and a
	ret z
	cp $ff
	jr z, .asm_e2457
	ld a, $2
	ld [wJumptableIndex], a
	ret
; e2452 (38:6452)

.asm_e2452
	ld hl, wJumptableIndex
	dec [hl]
	ret

.asm_e2457
	ld a, $4
	ld [wJumptableIndex], a
	ret

Functione245d: ; e245d (38:645d)
	xor a
	ld [hBGMapMode], a
	call ClearSprites
	call Functione2def
	ld [CurPartySpecies], a
	ld a, $17
	call Functione33d0
	ld de, PCString_WhatsUp
	call Functione2a6e
	ld a, $1
	ld [MenuSelection2], a
	call Functione298d
	ret

Functione247d: ; e247d (38:647d)
	ld hl, BillsPCDepositMenuDataHeader
	call CopyMenuDataHeader
	ld a, [MenuSelection2]
	call Function1d4b
	call InterpretMenu2
	jp c, BillsPCDepositFuncCancel
	ld a, [MenuSelection2]
	dec a
	and $3
	ld e, a
	ld d, 0
	ld hl, BillsPCDepositJumptable
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

BillsPCDepositJumptable: ; e24a1 (38:64a1)
	dw BillsPCDepositFuncDeposit ; Deposit Pokemon
	dw BillsPCDepositFuncStats ; Pokemon Stats
	dw BillsPCDepositFuncRelease ; Release Pokemon
	dw BillsPCDepositFuncCancel ; Cancel


BillsPCDepositFuncDeposit: ; e24a9 (38:64a9)
	call Functione2f18
	jp c, BillsPCDepositFuncCancel
	call Functione307c
	jr c, .no_overflow_31
	ld a, $0
	ld [wJumptableIndex], a
	xor a
	ld [wcb2b], a
	ld [wcb2a], a
	ret
.no_overflow_31
	ld de, PCString_WhatsUp
	call Functione2a6e
	ret

BillsPCDepositFuncStats: ; e24c8 (38:64c8)
	call LoadStandardMenuDataHeader
	call Functione2f7e
	call ExitMenu
	call PCMonInfo
	call Functione2def
	ld [CurPartySpecies], a
	ld a, $17
	call Functione33d0
	ret

BillsPCDepositFuncRelease: ; e24e0 (38:64e0)
	call Functione2f18
	jr c, BillsPCDepositFuncCancel
	call Functione2f5f
	jr c, BillsPCDepositFuncCancel
	ld a, [MenuSelection2]
	push af
	ld de, PCString_ReleasePKMN
	call Functione2a6e
	call LoadStandardMenuDataHeader
	lb bc, 14, 11
	call PlaceYesNoBox
	ld a, [MenuSelection2]
	dec a
	call ExitMenu
	and a
	jr nz, .asm_e252c
	ld a, [wcb2b]
	ld hl, wcb2a
	add [hl]
	ld [CurPartyMon], a
	xor a
	ld [wPokemonWithdrawDepositParameter], a
	callba Functione039
	call Functione3180
	ld a, $0
	ld [wJumptableIndex], a
	xor a
	ld [wcb2b], a
	ld [wcb2a], a
	pop af
	ret
.asm_e252c
	ld de, PCString_WhatsUp
	call Functione2a6e
	pop af
	ld [MenuSelection2], a
	ret

BillsPCDepositFuncCancel: ; e2537 (38:6537)
	ld a, $0
	ld [wJumptableIndex], a
	ret
; e253d (38:653d)

BillsPCDepositMenuDataHeader: ; 0xe253d (38:653d)
	db $40 ; flags
	db 04, 09 ; start coords
	db 13, 19 ; end coords
	dw BillsPCDepositMenuData
	db 1 ; default option
; 0xe2545

BillsPCDepositMenuData: ; 0xe2545 (38:6545)
	db $80 ; flags
	db 4 ; items
	db "DEPOSIT@"
	db "STATS@"
	db "RELEASE@"
	db "CANCEL@"
; 0xe2564 (38:6564)

Functione2564: ; e2564
	hlcoord 0, 0
	ld b, $4
	ld c, $8
	call ClearBox
	hlcoord 0, 4
	ld b, $a
	ld c, $9
	call ClearBox
	hlcoord 0, 14
	ld b, $2
	ld c, $8
	call ClearBox
	ret
; e2583

_WithdrawPKMN: ; e2583 (38:6583)
	ld hl, Options
	ld a, [hl]
	push af
	set 4, [hl]
	ld a, [VramState]
	push af
	xor a
	ld [VramState], a
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	xor a
	ld [hMapAnims], a
	call Functione2963
	ld a, $f
	ld [wcb2e], a
	call DelayFrame
.asm_e25a7
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .no_overflow_49
	call Functione25c8
	call DelayFrame
	jr .asm_e25a7
.no_overflow_49
	call ClearSprites
	pop af
	ld [hInMenu], a
	pop af
	ld [VramState], a
	pop af
	ld [Options], a
	ret

Functione25c8: ; e25c8 (38:65c8)
	ld a, [wJumptableIndex]
	ld hl, .jumptable
	call Functione33df
	jp [hl]

.jumptable: ; e25d2 (38:65d2)
	dw Functione25dc
	dw Functione2612
	dw Functione2655
	dw BillsPC_Withdraw
	dw Functione2992


Functione25dc: ; e25dc (38:65dc)
	ld a, $f
	ld [wcb2e], a
	xor a
	ld [hBGMapMode], a
	call ClearSprites
	call Functione2d30
	call Functione2a8e
	ld de, PCString_ChooseaPKMN
	call Functione2a6e
	ld a, $5
	ld [wcb2d], a
	call Functione2c2c
	call PCMonInfo
	ld a, $ff
	ld [CurPartySpecies], a
	ld a, $17
	call Functione33d0
	call WaitBGMap
	call Functione2e01
	call Functione298d
	ret

Functione2612: ; e2612 (38:6612)
	ld hl, hJoyPressed ; $ffa7
	ld a, [hl]
	and B_BUTTON
	jr nz, .asm_e264f
	ld a, [hl]
	and A_BUTTON
	jr nz, .asm_e263b
	call Functione29b5
	and a
	ret z
	call Functione2e01
	xor a
	ld [hBGMapMode], a
	call Functione2c2c
	call PCMonInfo
	ld a, $1
	ld [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	ret
.asm_e263b
	call Functione2def
	and a
	ret z
	cp $ff
	jr z, .asm_e264f
	ld a, $2
	ld [wJumptableIndex], a
	ret
; e264a (38:664a)

.asm_e264a
	ld hl, wJumptableIndex
	dec [hl]
	ret

.asm_e264f
	ld a, $4
	ld [wJumptableIndex], a
	ret
; e2655

Functione2655: ; e2655 (38:6655)
	xor a
	ld [hBGMapMode], a
	call ClearSprites
	call Functione2def
	ld [CurPartySpecies], a
	ld a, $17
	call Functione33d0
	ld de, PCString_WhatsUp
	call Functione2a6e
	ld a, $1
	ld [MenuSelection2], a
	call Functione298d
	ret

BillsPC_Withdraw: ; e2675 (38:6675)
	ld hl, .MenuDataHeader
	call CopyMenuDataHeader
	ld a, [MenuSelection2]
	call Function1d4b
	call InterpretMenu2
	jp c, .cancel
	ld a, [MenuSelection2]
	dec a
	and 3
	ld e, a
	ld d, 0
	ld hl, .jumptable
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

.jumptable: ; e2699 (38:6699) #mark
	dw .withdraw ; Withdraw
	dw .stats ; Stats
	dw .release ; Release
	dw .cancel ; Cancel


.withdraw: ; e26a1 (38:66a1)
	call Functione2f18
	jp c, .cancel
	call TryWithdrawPokemon
	jr c, .FailedWithdraw
	ld a, $0
	ld [wJumptableIndex], a
	xor a
	ld [wcb2b], a
	ld [wcb2a], a
	ret
.FailedWithdraw
	ld de, PCString_WhatsUp
	call Functione2a6e
	ret

.stats: ; e26c0 (38:66c0)
	call LoadStandardMenuDataHeader
	call Functione2f7e
	call ExitMenu
	call PCMonInfo
	call Functione2def
	ld [CurPartySpecies], a
	ld a, $17
	call Functione33d0
	ret

.release: ; e26d8 (38:66d8)
	ld a, [MenuSelection2]
	push af
	call Functione2f5f
	jr c, .FailedRelease
	ld de, PCString_ReleasePKMN
	call Functione2a6e
	call LoadStandardMenuDataHeader
	lb bc, 14, 11
	call PlaceYesNoBox
	ld a, [MenuSelection2]
	dec a
	call ExitMenu
	and a
	jr nz, .FailedRelease
	ld a, [wcb2b]
	ld hl, wcb2a
	add [hl]
	ld [CurPartyMon], a
	ld a, PC_DEPOSIT
	ld [wPokemonWithdrawDepositParameter], a
	callba Functione039
	call Functione3180
	ld a, $0
	ld [wJumptableIndex], a
	xor a
	ld [wcb2b], a
	ld [wcb2a], a
	pop af
	ret
.FailedRelease
	ld de, PCString_WhatsUp
	call Functione2a6e
	pop af
	ld [MenuSelection2], a
	ret

.cancel: ; e272b (38:672b)
	ld a, $0
	ld [wJumptableIndex], a
	ret
; e2731 (38:6731)

.MenuDataHeader: ; 0xe2731
	db $40 ; flags
	db 04, 09 ; start coords
	db 13, 19 ; end coords
	dw .MenuData
	db 1 ; default option
; 0xe2739

.MenuData: ; 0xe2739
	db $80 ; flags
	db 4 ; items
	db "WITHDRAW@"
	db "STATS@"
	db "RELEASE@"
	db "CANCEL@"
; 0xe2759

_MovePKMNWithoutMail: ; e2759
	ld hl, Options
	ld a, [hl]
	push af
	set 4, [hl]
	ld a, [VramState]
	push af
	xor a
	ld [VramState], a
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	xor a
	ld [hMapAnims], a
	call Functione2963
	ld a, [wCurBox]
	and $f
	inc a
	ld [wcb2e], a
	call DelayFrame
.asm_e2781
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .asm_e2793
	call Functione27a2
	call DelayFrame
	jr .asm_e2781

.asm_e2793
	call ClearSprites
	pop af
	ld [hInMenu], a
	pop af
	ld [VramState], a
	pop af
	ld [Options], a
	ret
; e27a2

Functione27a2: ; e27a2
	ld a, [wJumptableIndex]
	ld hl, Jumptable_e27ac
	call Functione33df
	jp [hl]
; e27ac

Jumptable_e27ac: ; e27ac
	dw Functione27ba
	dw Functione27eb
	dw Functione283d
	dw Functione285d
	dw Functione28df
	dw Functione2903
	dw Functione2992
; e27ba

Functione27ba: ; e27ba
	xor a
	ld [hBGMapMode], a
	call ClearSprites
	call Functione2d30
	ld de, PCString_ChooseaPKMN
	call Functione2a6e
	ld a, $5
	ld [wcb2d], a
	call Functione2c2c
	call Functione2a80
	call PCMonInfo
	ld a, $ff
	ld [CurPartySpecies], a
	ld a, $17
	call Functione33d0
	call WaitBGMap
	call Functione2e01
	call Functione298d
	ret
; e27eb

Functione27eb: ; e27eb
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .asm_e2837
	ld a, [hl]
	and A_BUTTON
	jr nz, .asm_e2823
	call Functione29d0
	jr c, .asm_e2816
	and a
	ret z
	call Functione2e01
	xor a
	ld [hBGMapMode], a
	call Functione2c2c
	call PCMonInfo
	ld a, $1
	ld [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	ret

.asm_e2816
	xor a
	ld [wcb2b], a
	ld [wcb2a], a
	ld a, $0
	ld [wJumptableIndex], a
	ret

.asm_e2823
	call Functione2def
	and a
	ret z
	cp $ff
	jr z, .asm_e2837
	ld a, $2
	ld [wJumptableIndex], a
	ret

	ld hl, wJumptableIndex
	dec [hl]
	ret

.asm_e2837
	ld a, $6
	ld [wJumptableIndex], a
	ret
; e283d

Functione283d: ; e283d
	xor a
	ld [hBGMapMode], a
	call ClearSprites
	call Functione2def
	ld [CurPartySpecies], a
	ld a, $17
	call Functione33d0
	ld de, PCString_WhatsUp
	call Functione2a6e
	ld a, $1
	ld [MenuSelection2], a
	call Functione298d
	ret
; e285d

Functione285d: ; e285d
	ld hl, MenuDataHeader_0xe28c3
	call CopyMenuDataHeader
	ld a, [MenuSelection2]
	call Function1d4b
	call InterpretMenu2
	jp c, Functione28bd
	ld a, [MenuSelection2]
	dec a
	and 3
	ld e, a
	ld d, 0
	ld hl, Jumptable_e2881
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; e2881

Jumptable_e2881: ; e2881
	dw Functione2887
	dw Functione28a5
	dw Functione28bd
; e2887

Functione2887: ; e2887
	call Functione2f18
	jp c, Functione28bd
	ld a, [wcb2a]
	ld [wcb2f], a
	ld a, [wcb2b]
	ld [wcb30], a
	ld a, [wcb2e]
	ld [wcb31], a
	ld a, $4
	ld [wJumptableIndex], a
	ret
; e28a5

Functione28a5: ; e28a5
	call LoadStandardMenuDataHeader
	call Functione2f7e
	call ExitMenu
	call PCMonInfo
	call Functione2def
	ld [CurPartySpecies], a
	ld a, $17
	call Functione33d0
	ret
; e28bd

Functione28bd: ; e28bd
	ld a, $0
	ld [wJumptableIndex], a
	ret
; e28c3

MenuDataHeader_0xe28c3: ; 0xe28c3
	db $40 ; flags
	db 04, 09 ; start coords
	db 13, 19 ; end coords
	dw MenuData2_0xe28cb
	db 1 ; default option
; 0xe28cb

MenuData2_0xe28cb: ; 0xe28cb
	db $80 ; flags
	db 3 ; items
	db "MOVE@"
	db "STATS@"
	db "CANCEL@"
; 0xe28df

Functione28df: ; e28df
	xor a
	ld [hBGMapMode], a
	call Functione2d30
	ld de, PCString_MoveToWhere
	call Functione2a6e
	ld a, $5
	ld [wcb2d], a
	call Functione2c2c
	call Functione2a80
	call ClearSprites
	call Functione2e8c
	call WaitBGMap
	call Functione298d
	ret
; e2903

Functione2903: ; e2903
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .asm_e294b
	ld a, [hl]
	and A_BUTTON
	jr nz, .asm_e2938
	call Functione29f4
	jr c, .asm_e292b
	and a
	ret z
	call Functione2e8c
	xor a
	ld [hBGMapMode], a
	call Functione2c2c
	ld a, $1
	ld [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	ret

.asm_e292b
	xor a
	ld [wcb2b], a
	ld [wcb2a], a
	ld a, $4
	ld [wJumptableIndex], a
	ret

.asm_e2938
	call Functione2ee5
	jr c, .asm_e2946
	call Functione31e7
	ld a, $0
	ld [wJumptableIndex], a
	ret

.asm_e2946
	ld hl, wJumptableIndex
	dec [hl]
	ret

.asm_e294b
	ld a, [wcb2f]
	ld [wcb2a], a
	ld a, [wcb30]
	ld [wcb2b], a
	ld a, [wcb31]
	ld [wcb2e], a
	ld a, $0
	ld [wJumptableIndex], a
	ret
; e2963

Functione2963: ; e2963 (38:6963)
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	call Functione33e8
	ld hl, OverworldMap
	ld bc, $338
	xor a
	call ByteFill
	xor a
	ld [wJumptableIndex], a
	ld [wcf64], a
	ld [wcf65], a
	ld [wcf66], a
	ld [wcb2b], a
	ld [wcb2a], a
	ret

Functione298d: ; e298d (38:698d)
	ld hl, wJumptableIndex
	inc [hl]
	ret

Functione2992: ; e2992 (38:6992)
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

Functione2998: ; e2998 (38:6998)
	ld a, [wcb2d]
	ld d, a
	ld a, [wcb2c]
	and a
	jr z, .asm_e29b2
	dec a
	cp $1
	jr z, .asm_e29b2
	ld e, a
	ld a, [hl]
	and D_UP
	jr nz, Functione2a18
	ld a, [hl]
	and D_DOWN
	jr nz, Functione2a2c
.asm_e29b2
	jp Functione2a65

Functione29b5: ; e29b5 (38:69b5)
	ld hl, hJoyLast
	ld a, [wcb2d]
	ld d, a
	ld a, [wcb2c]
	ld e, a
	and a
	jr z, .asm_e29cd
	ld a, [hl]
	and D_UP
	jr nz, Functione2a18
	ld a, [hl]
	and D_DOWN
	jr nz, Functione2a2c
.asm_e29cd
	jp Functione2a65
; e29d0 (38:69d0)

Functione29d0: ; e29d0
	ld hl, hJoyLast
	ld a, [wcb2d]
	ld d, a
	ld a, [wcb2c]
	ld e, a
	and a
	jr z, .asm_e29e8
	ld a, [hl]
	and D_UP
	jr nz, Functione2a18
	ld a, [hl]
	and D_DOWN
	jr nz, Functione2a2c

.asm_e29e8
	ld a, [hl]
	and D_LEFT
	jr nz, Functione2a48
	ld a, [hl]
	and D_RIGHT
	jr nz, Functione2a56
	jr Functione2a65

Functione29f4: ; e29f4
	ld hl, hJoyLast
	ld a, [wcb2d]
	ld d, a
	ld a, [wcb2c]
	ld e, a
	and a
	jr z, .asm_e2a0c

	ld a, [hl]
	and D_UP
	jr nz, Functione2a18
	ld a, [hl]
	and D_DOWN
	jr nz, Functione2a2c

.asm_e2a0c
	ld a, [hl]
	and D_LEFT
	jr nz, Functione2a48
	ld a, [hl]
	and D_RIGHT
	jr nz, Functione2a56
	jr Functione2a65

Functione2a18: ; e2a18 (38:6a18)
	ld hl, wcb2b
	ld a, [hl]
	and a
	jr z, .asm_e2a22
	dec [hl]
	jr Functione2a68

.asm_e2a22
	ld hl, wcb2a
	ld a, [hl]
	and a
	jr z, Functione2a65
	dec [hl]
	jr Functione2a68

Functione2a2c: ; e2a2c (38:6a2c)
	ld a, [wcb2b]
	ld hl, wcb2a
	add [hl]
	inc a
	cp e
	jr nc, Functione2a65

	ld hl, wcb2b
	ld a, [hl]
	inc a
	cp d
	jr nc, .asm_e2a42
	inc [hl]
	jr Functione2a68

.asm_e2a42
	ld hl, wcb2a
	inc [hl]
	jr Functione2a68
; e2a48 (38:6a48)

Functione2a48: ; e2a48
	ld hl, wcb2e
	ld a, [hl]
	and a
	jr z, .asm_e2a52
	dec [hl]
	jr Functione2a6c

.asm_e2a52
	ld [hl], $e
	jr Functione2a6c

Functione2a56: ; e2a56
	ld hl, wcb2e
	ld a, [hl]
	cp $e
	jr z, .asm_e2a61
	inc [hl]
	jr Functione2a6c

.asm_e2a61
	ld [hl], $0
	jr Functione2a6c

Functione2a65: ; e2a65 (38:6a65)
	xor a
	and a
	ret

Functione2a68: ; e2a68 (38:6a68)
	ld a, $1
	and a
	ret
; e2a6c (38:6a6c)

Functione2a6c: ; e2a6c
	scf
	ret
; e2a6e

Functione2a6e: ; e2a6e (38:6a6e)
	push de
	hlcoord 0, 15
	lb bc, 1, 18
	call TextBox
	pop de
	hlcoord 1, 16
	call PlaceString
	ret
; e2a80 (38:6a80)

Functione2a80: ; e2a80
	call Functione2a8e
	hlcoord 8, 1
	ld [hl], $5f
	hlcoord 19, 1
	ld [hl], $5e
	ret
; e2a8e

Functione2a8e: ; e2a8e (38:6a8e)
	hlcoord 8, 0
	lb bc, 1, 10
	call TextBox

	ld a, [wcb2e]
	and a
	jr z, .party

	cp NUM_BOXES + 1
	jr nz, .gotbox

	ld a, [wCurBox]
	inc a
.gotbox
	dec a
	ld hl, wBoxNames
	ld bc, BOX_NAME_LENGTH
	call AddNTimes
	ld e, l
	ld d, h
	jr .print

.party
	ld de, String_e2abd
.print
	hlcoord 10, 1
	call PlaceString
	ret
; e2abd (38:6abd)

String_e2abd:
	db "PARTY <PK><MN>@"
; e2ac6

PCMonInfo: ; e2ac6 (38:6ac6)
; Display a monster's pic and
; attributes when highlighting
; it in a PC menu.

; Includes the neat cascading
; effect when showing the pic.

; Example: Species, level, gender,
; whether it's holding an item.

	hlcoord 0, 0
	lb bc, 15, 8
	call ClearBox

	hlcoord 8, 14
	lb bc, 1, 3
	call ClearBox

	call Functione2def
	and a
	ret z
	cp $ff
	ret z

	ld [wd265], a
	hlcoord 1, 4
	xor a
	ld b, 7
.asm_e2ae9
	ld c, 7
	push af
	push hl
.asm_e2aed
	ld [hli], a
	add 7
	dec c
	jr nz, .asm_e2aed
	pop hl
	ld de, 20
	add hl, de
	pop af
	inc a
	dec b
	jr nz, .asm_e2ae9

	call Functione2b6d
	ld a, [wd265]
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	ld hl, TempMonDVs
	predef GetUnownLetter
	call GetBaseData
	ld de, VTiles2 tile $00
	predef GetFrontpic
	xor a
	ld [wcb32], a
	ld a, [CurPartySpecies]
	ld [wd265], a

	cp EGG
	ret z

	call GetBasePokemonName
	hlcoord 1, 14
	call PlaceString

	hlcoord 1, 12
	call PrintLevel

	ld a, $3
	ld [MonType], a
	callba GetGender
	jr c, .asm_e2b4f
	ld a, "♂"
	jr nz, .printgender
	ld a, "♀"
.printgender
	hlcoord 5, 12
	ld [hl], a
.asm_e2b4f

	ld a, [TempMonItem]
	and a
	ret z

	ld d, a
	callab ItemIsMail
	jr c, .mail
	ld a, $5d ; item icon
	jr .printitem
.mail
	ld a, $1
	ld [wcb32], a
	ld a, $5c ; mail icon
.printitem
	hlcoord 7, 12
	ld [hl], a
	ret

Functione2b6d: ; e2b6d (38:6b6d)
	ld a, [wcb2b]
	ld hl, wcb2a
	add [hl]
	ld e, a
	ld d, $0
	ld hl, wc801
rept 3
	add hl, de
endr
	ld a, [hl]
	and a
	jr z, .asm_e2bc6
	cp $f
	jr z, .asm_e2bf5
	ld b, a
	call GetBoxPointer
	ld a, b
	call GetSRAMBank
	push hl
	ld bc, sBoxMon1Level - sBox
	add hl, bc
	ld bc, BOXMON_STRUCT_LENGTH
	ld a, e
	call AddNTimes
	ld a, [hl]
	ld [TempMonLevel], a
	pop hl
	push hl
	ld bc, sBoxMon1Item - sBox
	add hl, bc
	ld bc, BOXMON_STRUCT_LENGTH
	ld a, e
	call AddNTimes
	ld a, [hl]
	ld [TempMonItem], a
	pop hl
	ld bc, sBoxMon1DVs - sBox
	add hl, bc
	ld bc, BOXMON_STRUCT_LENGTH
	ld a, e
	call AddNTimes
	ld de, TempMonDVs
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	call CloseSRAM
	ret
.asm_e2bc6
	ld hl, PartyMon1Level
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, e
	call AddNTimes
	ld a, [hl]
	ld [TempMonLevel], a
	ld hl, PartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, e
	call AddNTimes
	ld a, [hl]
	ld [TempMonItem], a
	ld hl, PartyMon1DVs
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, e
	call AddNTimes
	ld de, TempMonDVs
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ret

.asm_e2bf5
	ld a, BANK(sBox)
	call GetSRAMBank
	ld hl, sBoxMon1Level
	ld bc, BOXMON_STRUCT_LENGTH
	ld a, e
	call AddNTimes
	ld a, [hl]
	ld [TempMonLevel], a

	ld hl, sBoxMon1Item
	ld bc, BOXMON_STRUCT_LENGTH
	ld a, e
	call AddNTimes
	ld a, [hl]
	ld [TempMonItem], a

	ld hl, sBoxMon1DVs
	ld bc, BOXMON_STRUCT_LENGTH
	ld a, e
	call AddNTimes
	ld de, TempMonDVs
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a

	call CloseSRAM
	ret

Functione2c2c: ; e2c2c (38:6c2c)
	hlcoord 8, 2
	lb bc, 10, 10
	call TextBox

	hlcoord 8, 2
	ld [hl], "└"
	hlcoord 19, 2
	ld [hl], "┘"

	ld a, [wcb2a]
	ld e, a
	ld d, 0
	ld hl, OverworldMap
rept 3
	add hl, de
endr
	ld e, l
	ld d, h
	hlcoord 9, 4
	ld a, [wcb2d]
.asm_e2c53
	push af
	push de
	push hl
	call Functione2c6e
	pop hl
	ld de, $28
	add hl, de
	pop de
rept 3
	inc de
endr
	pop af
	dec a
	jr nz, .asm_e2c53
	ret
; e2c67 (38:6c67)

String_e2c67:
	db "CANCEL@"
; e2c6e

Functione2c6e: ; e2c6e (38:6c6e)
	ld a, [de]
	and a
	ret z
	cp $ff
	jr nz, .asm_e2c7c
	ld de, String_e2c67
	call PlaceString
	ret

.asm_e2c7c
	inc de
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	ld e, a
	ld a, b
	and a
	jr z, .asm_e2cc8
	cp $f
	jr z, .asm_e2cf1
	push hl
	call GetBoxPointer
	ld a, b
	call GetSRAMBank
	push hl
	ld bc, sBoxMons - sBox
	add hl, bc
	ld bc, BOXMON_STRUCT_LENGTH
	ld a, e
	call AddNTimes
	ld a, [hl]
	pop hl
	and a
	jr z, .asm_e2cc2
	ld bc, sBoxMonNicknames - sBox
	add hl, bc
	ld bc, PKMN_NAME_LENGTH
	ld a, e
	call AddNTimes
	ld de, StringBuffer1
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	call CloseSRAM
	pop hl
	ld de, StringBuffer1
	call PlaceString
	ret

.asm_e2cc2
	call CloseSRAM
	pop hl
	jr .asm_e2d23

.asm_e2cc8
	push hl
	ld hl, PartySpecies
	ld d, $0
	add hl, de
	ld a, [hl]
	and a
	jr z, .asm_e2cee
	ld hl, PartyMonNicknames
	ld bc, PKMN_NAME_LENGTH
	ld a, e
	call AddNTimes
	ld de, StringBuffer1
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	pop hl
	ld de, StringBuffer1
	call PlaceString
	ret

.asm_e2cee
	pop hl
	jr .asm_e2d23

.asm_e2cf1
	push hl
	ld a, BANK(sBox)
	call GetSRAMBank
	ld hl, sBoxSpecies
	ld d, $0
	add hl, de
	ld a, [hl]
	and a
	jr z, .asm_e2d1f
	ld hl, sBoxMonNicknames
	ld bc, PKMN_NAME_LENGTH
	ld a, e
	call AddNTimes
	ld de, StringBuffer1
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	call CloseSRAM
	pop hl
	ld de, StringBuffer1
	call PlaceString
	ret

.asm_e2d1f
	call CloseSRAM
	pop hl
.asm_e2d23
	ld de, String_e2d2a
	call PlaceString
	ret
; e2d2a (38:6d2a)

String_e2d2a:
	db "-----@"
; e2d30

Functione2d30: ; e2d30 (38:6d30)
	xor a
	ld hl, OverworldMap
	ld bc, $5a
	call ByteFill
	ld de, OverworldMap
	xor a
	ld [wd003], a
	ld [wd004], a
	ld a, [wcb2e]
	and a
	jr z, .asm_e2d87
	cp $f
	jr z, .asm_e2db7
	ld b, a
	call GetBoxPointer
	ld a, b
	call GetSRAMBank
	inc hl
.asm_e2d57
	ld a, [hl]
	cp $ff
	jr z, .asm_e2d79
	and a
	jr z, .asm_e2d79
	ld [de], a
	inc de
	ld a, [wcb2e]
	ld [de], a
	inc de
	ld a, [wd003]
	ld [de], a
	inc a
	ld [wd003], a
	inc de
	inc hl
	ld a, [wd004]
	inc a
	ld [wd004], a
	jr .asm_e2d57

.asm_e2d79
	call CloseSRAM
	ld a, $ff
	ld [de], a
	ld a, [wd004]
	inc a
	ld [wcb2c], a
	ret

.asm_e2d87
	ld hl, PartySpecies
.asm_e2d8a
	ld a, [hl]
	cp $ff
	jr z, .asm_e2dac
	and a
	jr z, .asm_e2dac
	ld [de], a
	inc de
	ld a, [wcb2e]
	ld [de], a
	inc de
	ld a, [wd003]
	ld [de], a
	inc a
	ld [wd003], a
	inc de
	inc hl
	ld a, [wd004]
	inc a
	ld [wd004], a
	jr .asm_e2d8a

.asm_e2dac
	ld a, $ff
	ld [de], a
	ld a, [wd004]
	inc a
	ld [wcb2c], a
	ret

.asm_e2db7
	ld a, BANK(sBox)
	call GetSRAMBank
	ld hl, sBoxSpecies
.asm_e2dbf
	ld a, [hl]
	cp $ff
	jr z, .asm_e2de1
	and a
	jr z, .asm_e2de1
	ld [de], a
	inc de
	ld a, [wcb2e]
	ld [de], a
	inc de
	ld a, [wd003]
	ld [de], a
	inc a
	ld [wd003], a
	inc de
	inc hl
	ld a, [wd004]
	inc a
	ld [wd004], a
	jr .asm_e2dbf

.asm_e2de1
	call CloseSRAM
	ld a, $ff
	ld [de], a
	ld a, [wd004]
	inc a
	ld [wcb2c], a
	ret

Functione2def: ; e2def (38:6def)
	ld a, [wcb2b]
	ld hl, wcb2a
	add [hl]
	ld e, a
	ld d, $0
	ld hl, OverworldMap
rept 3
	add hl, de
endr
	ld a, [hl]
	ret

Functione2e01: ; e2e01 (38:6e01)
	ld a, [wcb2c]
	and a
	jr nz, .asm_e2e0b
	call ClearSprites
	ret

.asm_e2e0b
	ld hl, Unknown_e2e2b
	ld de, Sprites
.loop
	ld a, [hl]
	cp $ff
	ret z
	ld a, [wcb2b]
	and $7
	swap a
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
	ld a, [hli]
	ld [de], a
	inc de
	jr .loop
; e2e2b (38:6e2b)

Unknown_e2e2b: ; e2e2b
	db $26, $50, $00, $00
	db $26, $58, $00, $00
	db $26, $60, $00, $00
	db $26, $68, $00, $00
	db $26, $70, $00, $00
	db $26, $78, $00, $00
	db $26, $80, $00, $00
	db $26, $88, $00, $00
	db $26, $90, $00, $00
	db $26, $97, $00, $00
	db $39, $50, $00, $40
	db $39, $58, $00, $40
	db $39, $60, $00, $40
	db $39, $68, $00, $40
	db $39, $70, $00, $40
	db $39, $78, $00, $40
	db $39, $80, $00, $40
	db $39, $88, $00, $40
	db $39, $90, $00, $40
	db $39, $97, $00, $40
	db $2e, $4e, $01, $00
	db $31, $4e, $01, $40
	db $2e, $99, $01, $20
	db $31, $99, $01, $60
	db $ff
; e2e8c

Functione2e8c: ; e2e8c
	ld hl, Unknown_e2eac
	ld de, Sprites
.asm_e2e92
	ld a, [hl]
	cp $ff
	ret z
	ld a, [wcb2b]
	and $7
	swap a
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
	ld a, [hli]
	ld [de], a
	inc de
	jr .asm_e2e92
; e2eac

Unknown_e2eac: ; e2eac
	db $27, $50, $06, $00
	db $2b, $58, $00, $40
	db $2b, $60, $00, $40
	db $2b, $68, $00, $40
	db $2b, $70, $00, $40
	db $2b, $78, $00, $40
	db $2b, $80, $00, $40
	db $2b, $88, $00, $40
	db $2b, $90, $00, $40
	db $27, $98, $07, $00
	db $ff
; e2ed5

Functione2ed5: ; e2ed5
.asm_e2ed5
	push bc
	push hl
.asm_e2ed7
	ld [hli], a
	dec c
	jr nz, .asm_e2ed7
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_e2ed5
	ret
; e2ee5

Functione2ee5: ; e2ee5
	ld hl, wcb2e
	ld a, [wcb31]
	cp [hl]
	jr z, .asm_e2f00
	ld a, [wcb2e]
	and a
	jr z, .asm_e2ef8
	ld e, $15
	jr .asm_e2efa

.asm_e2ef8
	ld e, $7

.asm_e2efa
	ld a, [wcb2c]
	cp e
	jr nc, .asm_e2f02

.asm_e2f00
	and a
	ret

.asm_e2f02
	ld de, PCString_TheresNoRoom
	call Functione2a6e
	ld de, SFX_WRONG
	call WaitPlaySFX
	call WaitSFX
	ld c, 50
	call DelayFrames
	scf
	ret
; e2f18

Functione2f18: ; e2f18 (38:6f18)
	ld a, [wcb2e]
	and a
	jr nz, .Okay
	ld a, [wcb2c]
	cp $3
	jr c, .ItsYourLastPokemon
	ld a, [wcb2b]
	ld hl, wcb2a
	add [hl]
	ld [CurPartyMon], a
	callba CheckCurPartyMonFainted
	jr c, .AllOthersFainted
	ld a, [wcb32]
	and a
	jr nz, .HasMail
.Okay
	and a
	ret
.HasMail
	ld de, PCString_RemoveMail
	jr .NotOkay
.AllOthersFainted
	ld de, PCString_NoMoreUsablePKMN
	jr .NotOkay
.ItsYourLastPokemon
	ld de, PCString_ItsYourLastPKMN
.NotOkay
	call Functione2a6e
	ld de, SFX_WRONG
	call WaitPlaySFX
	call WaitSFX
	ld c, 50
	call DelayFrames
	scf
	ret

Functione2f5f: ; e2f5f (38:6f5f)
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .asm_e2f68
	and a
	ret
.asm_e2f68
	ld de, PCString_NoReleasingEGGS
	call Functione2a6e
	ld de, SFX_WRONG
	call WaitPlaySFX
	call WaitSFX
	ld c, 50
	call DelayFrames
	scf
	ret

Functione2f7e: ; e2f7e (38:6f7e)
	call LowVolume
	call Functione2fd6
	ld a, $3
	ld [MonType], a
	predef StatsScreenInit
	call Functione33e8
	call MaxVolume
	ret

Functione2f95: ; e2f95 (38:6f95)
	ld hl, hJoyPressed ; $ffa7
	ld a, [hl]
	and A_BUTTON | B_BUTTON | D_RIGHT | D_LEFT
	ld [wcf73], a
	jr nz, .pressed_a_b_right_left
	ld a, [hl]
	and D_DOWN | D_UP
	ld [wcf73], a
	jr nz, .pressed_down_up
	jr .pressed_a_b_right_left

.pressed_down_up
	call Functione2998
	and a
	jr z, .asm_e2fd1
	call Functione2def
	ld [wd265], a
	call Functione2b6d
	ld a, [wd265]
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	ld hl, TempMonDVs
	predef GetUnownLetter
	call GetBaseData
	call Functione2fd6
.pressed_a_b_right_left
	ret

.asm_e2fd1
	xor a
	ld [wcf73], a
	ret

Functione2fd6: ; e2fd6 (38:6fd6)
	ld a, [wcb2b]
	ld hl, wcb2a
	add [hl]
	ld [CurPartyMon], a
	ld a, [wcb2e]
	and a
	jr z, .asm_e3020
	cp $f
	jr nz, .asm_e3048
	ld a, BANK(sBox)
	call GetSRAMBank
	ld hl, sBoxSpecies
	call CopySpeciesToTemp
	ld hl, sBoxMonNicknames
	call CopyNicknameToTemp
	ld hl, sBoxMonOT
	call CopyOTNameToTemp
	ld hl, sBoxMons
	ld bc, BOXMON_STRUCT_LENGTH
	ld a, [CurPartyMon]
	call AddNTimes
	ld de, wd018_Mon
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	call CloseSRAM
	callba Function5088b
	ret

.asm_e3020
	ld hl, PartySpecies
	call CopySpeciesToTemp
	ld hl, PartyMonNicknames
	call CopyNicknameToTemp
	ld hl, PartyMonOT
	call CopyOTNameToTemp
	ld hl, PartyMons ; wdcdf (aliases: PartyMon1, PartyMon1Species)
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [CurPartyMon]
	call AddNTimes
	ld de, wd018_Mon
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	ret

.asm_e3048
	ld b, a
	call GetBoxPointer
	ld a, b
	call GetSRAMBank
	push hl
	inc hl
	call CopySpeciesToTemp
	pop hl
	push hl
	ld bc, sBoxMonNicknames - sBox
	add hl, bc
	call CopyNicknameToTemp
	pop hl
	push hl
	ld bc, sBoxMonOT - sBox
	add hl, bc
	call CopyOTNameToTemp
	pop hl
	ld bc, sBoxMons - sBox
	add hl, bc
	ld bc, BOXMON_STRUCT_LENGTH
	call CopyMonToTemp
	call CloseSRAM
	callba Function5088b
	ret

Functione307c: ; e307c (38:707c)
	ld a, [wcb2b]
	ld hl, wcb2a
	add [hl]
	ld [CurPartyMon], a
	ld hl, PartyMonNicknames
	ld a, [CurPartyMon]
	call GetNick
	ld a, PC_DEPOSIT
	ld [wPokemonWithdrawDepositParameter], a
	predef SentGetPkmnIntoFromBox
	jr c, .asm_boxisfull
	xor a
	ld [wPokemonWithdrawDepositParameter], a
	callba Functione039
	ld a, [CurPartySpecies]
	call PlayCry
	hlcoord 0, 0
	lb bc, 15, 8
	call ClearBox
	hlcoord 8, 14
	lb bc, 1, 3
	call ClearBox
	hlcoord 0, 15
	lb bc, 1, 18
	call TextBox
	call WaitBGMap
	hlcoord 1, 16
	ld de, PCString_Stored
	call PlaceString
	ld l, c
	ld h, b
	ld de, StringBuffer1
	call PlaceString
	ld a, "!"
	ld [bc], a
	ld c, 50
	call DelayFrames
	and a
	ret

.asm_boxisfull
	ld de, PCString_BoxFull
	call Functione2a6e
	ld de, SFX_WRONG
	call WaitPlaySFX
	call WaitSFX
	ld c, 50
	call DelayFrames
	scf
	ret

TryWithdrawPokemon: ; e30fa (38:70fa)
	ld a, [wcb2b]
	ld hl, wcb2a
	add [hl]
	ld [CurPartyMon], a
	ld a, BANK(sBoxMonNicknames)
	call GetSRAMBank
	ld a, [CurPartyMon]
	ld hl, sBoxMonNicknames
	call GetNick
	call CloseSRAM
	xor a
	ld [wPokemonWithdrawDepositParameter], a
	predef SentGetPkmnIntoFromBox
	jr c, .PartyFull
	ld a, PC_DEPOSIT
	ld [wPokemonWithdrawDepositParameter], a
	callba Functione039
	ld a, [CurPartySpecies]
	call PlayCry
	hlcoord 0, 0
	lb bc, 15, 8
	call ClearBox
	hlcoord 8, 14
	lb bc, 1, 3
	call ClearBox
	hlcoord 0, 15
	lb bc, 1, 18
	call TextBox
	call WaitBGMap
	hlcoord 1, 16
	ld de, PCString_Got
	call PlaceString
	ld l, c
	ld h, b
	ld de, StringBuffer1
	call PlaceString
	ld a, $e7
	ld [bc], a
	ld c, 50
	call DelayFrames
	and a
	ret

.PartyFull
	ld de, PCString_PartyFull
	call Functione2a6e
	ld de, SFX_WRONG
	call WaitPlaySFX
	call WaitSFX
	ld c, 50
	call DelayFrames
	scf
	ret


Functione3180: ; e3180 (38:7180)
	hlcoord 0, 0
	lb bc, 15, 8
	call ClearBox
	hlcoord 8, 14
	lb bc, 1, 3
	call ClearBox
	hlcoord 0, 15
	lb bc, 1, 18
	call TextBox

	call WaitBGMap
	ld a, [CurPartySpecies]
	call GetCryIndex
	jr c, .asm_e31ab
	ld e, c
	ld d, b
	call PlayCryHeader
.asm_e31ab

	ld a, [CurPartySpecies]
	ld [wd265], a
	call GetPokemonName
	hlcoord 1, 16
	ld de, PCString_ReleasedPKMN
	call PlaceString
	ld c, 80
	call DelayFrames
	hlcoord 0, 15
	lb bc, 1, 18
	call TextBox
	hlcoord 1, 16
	ld de, PCString_Bye
	call PlaceString
	ld l, c
	ld h, b
	inc hl
	ld de, StringBuffer1
	call PlaceString
	ld l, c
	ld h, b
	ld [hl], $e7
	ld c, 50
	call DelayFrames
	ret
; e31e7 (38:71e7)

Functione31e7: ; e31e7
	push hl
	push de
	push bc
	push af
	hlcoord 0, 15
	lb bc, 1, 18
	call TextBox
	hlcoord 1, 16
	ld de, String_e3233
	call PlaceString
	ld c, 20
	call DelayFrames
	pop af
	pop bc
	pop de
	pop hl
	ld a, [wCurBox]
	push af
	ld bc, 0
	ld a, [wcb31]
	and a
	jr nz, .asm_e3215
	set 0, c

.asm_e3215
	ld a, [wcb2e]
	and a
	jr nz, .asm_e321d
	set 1, c

.asm_e321d
	ld hl, Jumptable_e3245
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, Functione322a
	push de
	jp [hl]
; e322a

Functione322a: ; e322a
	pop af
	ld e, a
	callba Function14ad5
	ret
; e3233

String_e3233:
	db "Saving… Leave ON!@"
; e3245

Jumptable_e3245: ; e3245
	dw Functione324d
	dw Functione3267
	dw Functione327d
	dw Functione3284
; e324d

Functione324d: ; e324d
	ld hl, wcb31
	ld a, [wcb2e]
	cp [hl]
	jr z, .asm_e325d
	call Functione32b0
	call Functione32fa
	ret

.asm_e325d
	call Functione32b0
	call Functione328e
	call Functione32fa
	ret
; e3267

Functione3267: ; e3267
	call Functione3316
	ld a, $1
	ld [wc2cd], a
	callba SaveGameData
	xor a
	ld [wc2cd], a
	call Functione32fa
	ret
; e327d

Functione327d: ; e327d
	call Functione32b0
	call Functione3346
	ret
; e3284

Functione3284: ; e3284
	call Functione3316
	call Functione328e
	call Functione3346
	ret
; e328e

Functione328e: ; e328e
	ld a, [wcb2b]
	ld hl, wcb2a
	add [hl]
	ld e, a
	ld a, [wcb30]
	ld hl, wcb2f
	add [hl]
	cp e
	ret nc
	ld hl, wcb2b
	ld a, [hl]
	and a
	jr z, .asm_e32a8
	dec [hl]
	ret

.asm_e32a8
	ld hl, wcb2a
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret
; e32b0

Functione32b0: ; e32b0
	ld a, [wcb31]
	dec a
	ld e, a
	callba MovePkmnWOMail_SaveGame
	ld a, [wcb30]
	ld hl, wcb2f
	add [hl]
	ld [CurPartyMon], a
	ld a, $1
	call GetSRAMBank
	ld hl, sBoxSpecies
	call CopySpeciesToTemp
	ld hl, sBoxMonNicknames
	call CopyNicknameToTemp
	ld hl, sBoxMonOT
	call CopyOTNameToTemp
	ld hl, sBoxMons
	ld bc, BOXMON_STRUCT_LENGTH
	call CopyMonToTemp
	call CloseSRAM
	callba Function5088b
	ld a, PC_DEPOSIT
	ld [wPokemonWithdrawDepositParameter], a
	callba Functione039
	ret
; e32fa

Functione32fa: ; e32fa
	ld a, [wcb2e]
	dec a
	ld e, a
	callba MovePkmnWOMail_SaveGame
	ld a, [wcb2b]
	ld hl, wcb2a
	add [hl]
	ld [CurPartyMon], a
	callba Function51322
	ret
; e3316

Functione3316: ; e3316
	ld a, [wcb30]
	ld hl, wcb2f
	add [hl]
	ld [CurPartyMon], a
	ld hl, PartySpecies
	call CopySpeciesToTemp
	ld hl, PartyMonNicknames
	call CopyNicknameToTemp
	ld hl, PartyMonOT
	call CopyOTNameToTemp
	ld hl, PartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyMonToTemp
	xor a
	ld [wPokemonWithdrawDepositParameter], a
	callba Functione039
	ret
; e3346

Functione3346: ; e3346
	ld a, [wcb2b]
	ld hl, wcb2a
	add [hl]
	ld [CurPartyMon], a
	callba Function5138b
	ret
; e3357

CopySpeciesToTemp: ; e3357 (38:7357)
	ld a, [CurPartyMon]
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	ld [CurPartySpecies], a
	ret

CopyNicknameToTemp: ; e3363 (38:7363)
	ld bc, PKMN_NAME_LENGTH
	ld a, [CurPartyMon]
	call AddNTimes
	ld de, wd002
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	ret

CopyOTNameToTemp: ; e3376 (38:7376)
	ld bc, NAME_LENGTH
	ld a, [CurPartyMon]
	call AddNTimes
	ld de, wd00d
	ld bc, NAME_LENGTH
	call CopyBytes
	ret

CopyMonToTemp: ; e3389 (38:7389)
	ld a, [CurPartyMon]
	call AddNTimes
	ld de, wd018_Mon
	call CopyBytes
	ret

GetBoxPointer: ; e3396 (38:7396)
	dec b
	ld c, b
	ld b, 0
	ld hl, .boxes
rept 3
	add hl, bc
endr
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret
; e33a6 (38:73a6)

.boxes: ; e33a6
	;  bank, address
	dba sBox1
	dba sBox2
	dba sBox3
	dba sBox4
	dba sBox5
	dba sBox6
	dba sBox7
	dba sBox8
	dba sBox9
	dba sBox10
	dba sBox11
	dba sBox12
	dba sBox13
	dba sBox14
; e33d0

Functione33d0: ; e33d0 (38:73d0)
	ld b, a
	call GetSGBLayout
	ld a, $e4
	call DmgToCgbBGPals
	ld a, $fc
	call Functioncf8
	ret

Functione33df: ; e33df (38:73df)
	ld e, a
	ld d, $0
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

Functione33e8: ; e33e8 (38:73e8)
	call DisableLCD
	ld hl, VTiles2 tile $00
	ld bc, $310
	xor a
	call ByteFill
	call LoadStandardFont
	call LoadFontsBattleExtra
	ld hl, PCMailGFX
	ld de, VTiles2 tile $5c
	ld bc, $40
	call CopyBytes
	ld hl, PCSelectLZ
	ld de, VTiles0 tile $00
	call Decompress
	ld a, 6
	call SkipMusic
	call EnableLCD
	ret
; e3419 (38:7419)

PCSelectLZ: INCBIN "gfx/pc.2bpp.lz"
PCMailGFX:  INCBIN "gfx/pc_mail.2bpp"
; e34dd

PCString_ChooseaPKMN: db "Choose a <PK><MN>.@"
PCString_WhatsUp: db "What's up?@"
PCString_ReleasePKMN: db "Release <PK><MN>?@"
PCString_MoveToWhere: db "Move to where?@"
PCString_ItsYourLastPKMN: db "It's your last <PK><MN>!@"
PCString_TheresNoRoom: db "There's no room!@"
PCString_NoMoreUsablePKMN: db "No more usable <PK><MN>!@"
PCString_RemoveMail: db "Remove MAIL.@"
PCString_ReleasedPKMN: db "Released <PK><MN>.@"
PCString_Bye: db "Bye,@"
PCString_Stored: db "Stored @"
PCString_Got: db "Got @"
PCString_Non: db "Non.@"
PCString_BoxFull: db "The BOX is full.@"
PCString_PartyFull: db "The party's full!@"
PCString_NoReleasingEGGS: db "No releasing EGGS!@"
; e35aa


_ChangeBox: ; e35aa (38:75aa)
	call LoadStandardMenuDataHeader
	call Functione35e2
.loop
	xor a
	ld [hBGMapMode], a
	call Functione36cf
	call Functione379c
	ld hl, _ChangeBox_menudataheader
	call CopyMenuDataHeader
	xor a
	ld [wd0e4], a
	hlcoord 0, 4
	lb bc, 8, 9
	call TextBox
	call HandleScrollingMenu
	ld a, [wcf73]
	cp $2
	jr z, .done
	call Functione37af
	call Functione36f9
	jr .loop
.done
	call WriteBackup
	ret

Functione35e2: ; e35e2 (38:75e2)
	xor a
	ld [hBGMapMode], a
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, " "
	call ByteFill
	ret
; e35f1 (38:75f1)

_ChangeBox_menudataheader: ; 0xe35f1
	db $40 ; flags
	db 05, 01 ; start coords
	db 12, 09 ; end coords
	dw .menudata2
	db 1 ; default option
; 0xe35f9

.menudata2: ; 0xe35f9
	db $22 ; flags
	db 4, 0
	db 1
	dba .boxes
	dba .boxnames
	dba NULL
	dba Functione3632
; e3609

.boxes: ; e3609
	db NUM_BOXES
x = 1
rept NUM_BOXES
	db x
x = x + 1
endr
	db -1
; e3619

.boxnames: ; e3619
	push de
	ld a, [MenuSelection]
	dec a
	call GetBoxName
	pop hl
	call PlaceString
	ret
; e3626

GetBoxName: ; e3626 (38:7626)
	ld bc, BOX_NAME_LENGTH
	ld hl, wBoxNames
	call AddNTimes
	ld d, h
	ld e, l
	ret
; e3632 (38:7632)

Functione3632: ; e3632
	hlcoord 11, 7
	lb bc, 5, 7
	call TextBox
	ld a, [MenuSelection]
	cp -1
	ret z
	hlcoord 12, 9
	ld de, String_e3663
	call PlaceString
	call GetBoxCount
	ld [wd265], a
	hlcoord 13, 11
	ld de, wd265
	lb bc, 1, 2
	call PrintNum
	ld de, String_e3668
	call PlaceString
	ret
; e3663

String_e3663: ; e3663
	db "#MON@"
; e3668

String_e3668: ; e3668
	; db "/20@"
	db "/"
	db "0" + MONS_PER_BOX / 10 ; "2"
	db "0" + MONS_PER_BOX % 10 ; "0"
	db "@"
; e366c

GetBoxCount: ; e366c (38:766c)
	ld a, [wCurBox]
	ld c, a
	ld a, [MenuSelection]
	dec a
	cp c
	jr z, .activebox
	ld c, a
	ld b, 0
	ld hl, .boxbanks
rept 3
	add hl, bc
endr
	ld a, [hli]
	ld b, a
	call GetSRAMBank
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	call CloseSRAM
	ld c, a
	ld a, [wSavedAtLeastOnce]
	and a
	jr z, .newfile
	ld a, c
	ret

.newfile
	xor a
	ret

.activebox
	ld a, BANK(sBoxCount)
	ld b, a
	call GetSRAMBank
	ld hl, sBoxCount
	ld a, [hl]
	call CloseSRAM
	ret
; e36a5 (38:76a5)

.boxbanks: ; e36a5
	dba sBox1
	dba sBox2
	dba sBox3
	dba sBox4
	dba sBox5
	dba sBox6
	dba sBox7
	dba sBox8
	dba sBox9
	dba sBox10
	dba sBox11
	dba sBox12
	dba sBox13
	dba sBox14
; e36cf

Functione36cf: ; e36cf (38:76cf)
	hlcoord 0, 0
	ld b, 2
	ld c, 18
	call TextBox
	hlcoord 1, 2
	ld de, String_e36f1
	call PlaceString
	ld a, [wCurBox]
	and $f
	call GetBoxName
	hlcoord 11, 2
	call PlaceString
	ret
; e36f1 (38:76f1)

String_e36f1: ; e36f1
	db "CURRENT@"
; e36f9

Functione36f9: ; e36f9 (38:76f9)
	ld hl, .MenuDataHeader
	call LoadMenuDataHeader
	call InterpretMenu2
	call ExitMenu
	ret c
	ld a, [MenuSelection2]
	cp $1
	jr z, .Switch
	cp $2
	jr z, .Name
	cp $3
	jr z, .Print
	and a
	ret

.Print
	call GetBoxCount
	and a
	jr z, .EmptyBox
	ld e, l
	ld d, h
	ld a, [MenuSelection]
	dec a
	ld c, a
	callba PrintPCBox
	call Functione35e2
	and a
	ret

.EmptyBox
	call Functione37be
	and a
	ret

.Switch
	ld a, [MenuSelection]
	dec a
	ld e, a
	ld a, [wCurBox]
	cp e
	ret z
	callba ChangeBoxSaveGame
	ret

.Name
	ld b, $4 ; box
	ld de, wd002
	callba NamingScreen
	call ClearTileMap
	call LoadStandardFont
	call LoadFontsBattleExtra
	ld a, [MenuSelection]
	dec a
	call GetBoxName
	ld e, l
	ld d, h
	ld hl, wd002
	ld c, $8
	call InitString
	ld a, [MenuSelection]
	dec a
	call GetBoxName
	ld de, wd002
	call CopyName2
	ret
; e3778 (38:7778)

	hlcoord 11, 7 ; XXX

.MenuDataHeader: ; 0xe377b
	db $40 ; flags
	db 04, 11 ; start coords
	db 13, 19 ; end coords
	dw .MenuData2
	db 1 ; default option
; 0xe3783

.MenuData2: ; 0xe3783
	db $80 ; flags
	db 4 ; items
	db "SWITCH@"
	db "NAME@"
	db "PRINT@"
	db "QUIT@"
; 0xe379c

Functione379c: ; e379c (38:779c)
	ld de, String_e37a1
	jr Functione37e3
; e37a1 (38:77a1)

String_e37a1: ; e37a1
	db "Choose a BOX.@"
; e37af

Functione37af: ; e37af (38:77af)
	ld de, String_e37b4
	jr Functione37e3
; e37b4 (38:77b4)

String_e37b4: ; e37b4
	db "What's up?@"
; e37be

Functione37be: ; e37be (38:77be)
	ld de, String_e37d3
	call Functione37e3
	ld de, SFX_WRONG
	call WaitPlaySFX
	call WaitSFX
	ld c, 50
	call DelayFrames
	ret
; e37d3 (38:77d3)

String_e37d3: ; e37d3
	db "There's no #MON.@"
; e37e3

Functione37e3: ; e37e3 (38:77e3)
	push de
	hlcoord 0, 14
	lb bc, 2, 18
	call TextBox
	pop de
	hlcoord 1, 16
	call PlaceString
	ld a, $1
	ld [hBGMapMode], a
	ret
