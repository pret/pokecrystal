SECTION "bank46", ROMX

BattleTowerRoomMenu_DoNothing: ; 11805e (46:405e)
	ret
; 11805f

_BattleTowerRoomMenu: ; 118121
	xor a
	ld [wcd38], a
Function118125: ; 118125
	call BattleTowerRoomMenu_InitRAM
	ld a, $3
	ld [wcd33], a
	ld a, $d
	ld [wcd34], a
	ld a, $4
	ld [wc3f0], a
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
.loop
	call JoyTextDelay
	call Function118473
	ld a, [wcf66]
	cp $f
	jr c, .skip
	ld a, [wcd34]
	ld [wcf66], a
.skip
	call BattleTowerRoomMenu_Jumptable
	call BattleTowerRoomMenu_WriteMessage
	callba Function115dd3
	callba Function11619d
	call DelayFrame
	ld a, [wcf66]
	ld hl, wcd33
	cp [hl]
	jr nz, .loop
	xor a
	ld [w3_d000], a
	pop af
	ld [rSVBK], a
	call BattleTowerRoomMenu_Cleanup
	call Function118180
	call ReturnToMapFromSubmenu
	ret
; 118180

Function118180: ; 118180
	ld a, [ScriptVar]
	and a
	ret nz
	ld a, [wcd38]
	and a
	ret z
	ld a, $5
	call GetSRAMBank
	ld hl, wcd69
	ld de, $a89c
	ld bc, $0016
	call CopyBytes

	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a

	ld de, w3_d202
	ld c, $96
	callba CheckStringForErrors_IgnoreTerminator
	jr c, .return_d3

	ld de, w3_d202
	lb bc, 1, $96
	callba CheckStringContainsLessThanBNextCharacters
	jr c, .return_d3

	ld hl, w3_d202
	ld de, $a8b2
	ld bc, $0096
	call CopyBytes
.reset_banks
	pop af
	ld [rSVBK], a
	call CloseSRAM
	ret

.return_d3
	ld a, $d3
	ld [wc300], a
	ld [ScriptVar], a
	jr .reset_banks
; 1181da

Function118233: ; 118233
	call BattleTowerRoomMenu_InitRAM
	ld a, $1b
	ld [wcd33], a
	ld a, $1c
	ld [wcd34], a
	ld a, $6
	ld [wc3f0], a
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
.asm_11824c
	call JoyTextDelay
	call Function118473
	ld a, [wcf66]
	cp $1e
	jr c, .asm_11825f
	ld a, [wcd34]
	ld [wcf66], a

.asm_11825f
	call Function118624
	call BattleTowerRoomMenu_WriteMessage
	callba Function115dd3
	callba Function11619d
	call DelayFrame
	ld a, [wcf66]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_11824c
	pop af
	ld [rSVBK], a
	call BattleTowerRoomMenu_Cleanup
	ret
; 118284

Function118284: ; 118284
	call BattleTowerRoomMenu_InitRAM
	ld a, $19
	ld [wcd33], a
	ld a, $1e
	ld [wcd34], a
	ld a, $5
	ld [wc3f0], a
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
.asm_11829d
	call JoyTextDelay
	call Function118473
	ld a, [wcf66]
	cp $20
	jr c, .asm_1182b0
	ld a, [wcd34]
	ld [wcf66], a
.asm_1182b0
	call Function1186f5
	call BattleTowerRoomMenu_WriteMessage
	callba Function115dd3
	callba Function11619d
	call DelayFrame
	ld a, [wcf66]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_11829d
	pop af
	ld [rSVBK], a
	call BattleTowerRoomMenu_Cleanup
	ret
; 1182d5 (46:42d5)


Function118329: ; 118329
	call BattleTowerRoomMenu_InitRAM
	ld a, $15
	ld [wcd33], a
	ld a, $16
	ld [wcd34], a
	ld a, $6
	ld [wc3f0], a
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
.asm_118342
	call JoyTextDelay
	call Function118473
	ld a, [wcf66]
	cp $18
	jr c, .asm_118355
	ld a, [wcd34]
	ld [wcf66], a

.asm_118355
	call Function118671
	call BattleTowerRoomMenu_WriteMessage
	callba Function115dd3
	callba Function11619d
	call DelayFrame
	ld a, [wcf66]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_118342
	pop af
	ld [rSVBK], a
	call BattleTowerRoomMenu_Cleanup
	ret
; 11837a

Function11837a: ; 11837a
	call BattleTowerRoomMenu_InitRAM
	ld a, $16
	ld [wcd33], a
	ld a, $17
	ld [wcd34], a
	ld a, $6
	ld [wc3f0], a
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
.asm_118393
	call JoyTextDelay
	call Function118473
	ld a, [wcf66]
	cp $19
	jr c, .asm_1183a6
	ld a, [wcd34]
	ld [wcf66], a

.asm_1183a6
	call Function1186b2
	call BattleTowerRoomMenu_WriteMessage
	callba Function115dd3
	callba Function11619d
	call DelayFrame
	ld a, [wcf66]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_118393
	pop af
	ld [rSVBK], a
	call BattleTowerRoomMenu_Cleanup
	ret
; 1183cb

BattleTowerRoomMenu_InitRAM: ; 1183cb
	di
	ld a, [rIE]
	ld [wcd32], a
	call DoubleSpeed
	xor a
	ld [rIF], a
	ld [wc300], a
	ld [wc301], a
	ld [wc302], a
	ld [wcd80], a
	ld [wcd65], a
	ld [wcd66], a
	ld [wcd67], a
	ld [wcd68], a
	ld [$c31a], a
	ld [wcd89], a
	ld [wcd8a], a
	ld [wcd8b], a
	ld [wc3ec], a
	ld [wc3ed], a
	ld [wc3ee], a
	ld [wc3ef], a
	ld hl, VramState
	ld a, [hl]
	ld [wcd7f], a
	set 1, [hl]
	ld a, $f
	ld [rIE], a
	ld a, $1
	ld [hMobileReceive], a
	ld [hMobile], a
	ei
	callba MobileFunc_106462
	callba Function106464
	callba Function115d99
	callba Function11615a
	ld a, $5
	call GetSRAMBank
	xor a
	ld [$bfff], a
	call CloseSRAM
	ret
; 118440

Function118440: ; 118440
	push af
	ld a, $5
	call GetSRAMBank
	ld a, [$bfff]
	inc a
	ld [$bfff], a
	call CloseSRAM
	pop af
	ret
; 118452

BattleTowerRoomMenu_Cleanup: ; 118452
	di
	xor a
	ld [hMobileReceive], a
	ld [hMobile], a
	ld [hVBlank], a
	call NormalSpeed
	xor a
	ld [rIF], a
	ld a, [wcd32]
	ld [rIE], a
	ei
	ld a, [wcd7f]
	ld [VramState], a
	ld a, [wc300]
	ld [ScriptVar], a
	ret
; 118473

Function118473: ; 118473
	ld a, [wcd65]
	and a
	ret z
	ld a, [wcd66]
	inc a
	ld [wcd66], a
	cp 60
	ret nz
	xor a
	ld [wcd66], a
	ld a, [wcd67]
	inc a
	ld [wcd67], a
	cp 60
	ret nz
	ld a, [wcd68]
	inc a
	ld [wcd68], a
	cp 99
	jr z, .ninety_nine
	xor a
	ld [wcd67], a
	ret

.ninety_nine
	xor a
	ld [wcd65], a
	ret
; 1184a5

BattleTowerRoomMenu_Jumptable: ; 11854d
	jumptable .Jumptable, wcf66
; 11855c

.Jumptable: ; 11855c
	dw BattleTowerRoomMenu_PickLevelMessage
	dw BattleTowerRoomMenu_PlacePickLevelMenu
	dw BattleTowerRoomMenu_UpdatePickLevelMenu
	dw BattleTowerRoomMenu_DoNothing
	dw BattleTowerRoomMenu_PartyMonTopsThisLevelMessage
	dw BattleTowerRoomMenu_WaitForMessage
	dw BattleTowerRoomMenu_DelayRestartMenu
	dw BattleTowerRoomMenu_QuitMessage
	dw BattleTowerRoomMenu_PlaceYesNoMenu
	dw BattleTowerRoomMenu_UpdateYesNoMenu
	dw BattleTowerRoomMenu_UberRestrictionMessage
	dw BattleTowerRoomMenu_WaitForMessage
	dw BattleTowerRoomMenu_DelayRestartMenu
	dw Function118e76 ; mobile
	dw BattleTowerRoomMenu_CallRoomMenu2 ; mobile
	dw Function118e76 ; mobile
; 11857c

Function118624: ; 118624
	jumptable .Jumptable, wcf66
; 118633

.Jumptable: ; 118633
	dw Function118866
	dw Function118880
	dw Function11878d
	dw Function1188b0
	dw Function11878d
	dw Function1188b8
	dw Function11878d
	dw Function1188c0
	dw Function11878d
	dw Function1188c8
	dw Function11878d
	dw Function118903
	dw Function118aa4
	dw Function11878d
	dw Function118e92
	dw Function11878d
	dw Function11915d
	dw Function118f68
	dw Function11878d
	dw Function119009
	dw Function11878d
	dw Function119054
	dw Function118e6d
	dw Function11878d
	dw Function118e76
	dw Function118e7e
	dw Function11878d
	dw BattleTowerRoomMenu_DoNothing
	dw Function118e76
	dw BattleTowerRoomMenu_CallRoomMenu2
	dw Function118e76
; 118671

Function118671: ; 118671
	jumptable .Jumptable, wcf66
; 118680

.Jumptable: ; 118680
	dw Function118866
	dw Function118880
	dw Function11878d
	dw Function1188b0
	dw Function11878d
	dw Function1188b8
	dw Function11878d
	dw Function1188c0
	dw Function11878d
	dw Function1188c8
	dw Function11878d
	dw Function118903
	dw Function119380
	dw Function119388
	dw Function1193a0
	dw Function11878d
	dw Function118e6d
	dw Function11878d
	dw Function118e76
	dw Function118e7e
	dw Function11878d
	dw BattleTowerRoomMenu_DoNothing
	dw Function118e76
	dw BattleTowerRoomMenu_CallRoomMenu2
	dw Function118e76
; 1186b2

Function1186b2: ; 1186b2
	jumptable .Jumptable, wcf66
; 1186c1

.Jumptable: ; 1186c1
	dw Function118866
	dw Function118880
	dw Function11878d
	dw Function1188b0
	dw Function11878d
	dw Function1188b8
	dw Function11878d
	dw Function1188c0
	dw Function11878d
	dw Function1188c8
	dw Function11878d
	dw Function118903
	dw Function119380
	dw Function1193e3
	dw Function1193fb
	dw Function11878d
	dw Function119413
	dw Function118e6d
	dw Function11878d
	dw Function118e76
	dw Function118e7e
	dw Function11878d
	dw BattleTowerRoomMenu_DoNothing
	dw Function118e76
	dw BattleTowerRoomMenu_CallRoomMenu2
	dw Function118e76
; 1186f5

Function1186f5: ; 1186f5 (46:46f5)
	jumptable .Jumptable, wcf66
; 118704 (46:4704)

.Jumptable: ; 118704 (46:4704)
	dw Function11886a
	dw Function118880
	dw Function11878d
	dw Function1188b0
	dw Function11878d
	dw Function1188b8
	dw Function11878d
	dw Function1188c0
	dw Function11878d
	dw Function1188c8
	dw Function11878d
	dw Function118903
	dw Function118abc
	dw Function11878d
	dw Function119451
	dw Function1195f8
	dw Function119612
	dw Function119629
	dw Function119648
	dw Function11878d
	dw Function118e6d
	dw Function11878d
	dw Function118e76
	dw Function118e7e
	dw Function11878d
	dw BattleTowerRoomMenu_DoNothing
	dw Function11967d
	dw Function119685
	dw Function119665
	dw Function11966d
	dw Function118e76
	dw BattleTowerRoomMenu_CallRoomMenu2
	dw Function118e76
; 118746 (46:4746)

Function11878d: ; 11878d (46:478d)
	ld a, [wc821]
	bit 1, a
	jr nz, .asm_1187af
	bit 2, a
	jr nz, .asm_1187d1
	bit 0, a
	jr nz, .asm_1187aa
	ld a, [wcd89]
	and $1
	jr z, .asm_1187a7
	ld a, $3
	ld [rSVBK], a
.asm_1187a7
	jp BattleTowerRoomMenu_IncrementJumptable
.asm_1187aa
	call Function118821
	ret c
	ret
.asm_1187af
	ld a, $0
	call Function3e32
	ld [wc300], a
	ld a, l
	ld [wc301], a
	ld a, h
	ld [wc302], a
	ld a, $a
	call Function3e32
	ld a, [wc3f0]
	ld [$c319], a
	ld a, [wcd34]
	ld [wcf66], a
	ret
.asm_1187d1
	ld hl, wcd89
	bit 0, [hl]
	jr nz, .asm_118803
	set 0, [hl]
	ld a, $6
	ld [rSVBK], a
	ld de, w3_d000
	ld bc, $1000
	ld a, [hl]
	sla a
	jr c, .asm_1187f9
	sla a
	jr c, .asm_1187fd
	sla a
	jr c, .asm_1187f5
	ld a, $24
	jr .asm_1187ff
.asm_1187f5
	ld a, $28
	jr .asm_1187ff
.asm_1187f9
	ld a, $2a
	jr .asm_1187ff
.asm_1187fd
	ld a, $2c
.asm_1187ff
	call Function3e32
	ret
.asm_118803
	ld a, $d3

Function118805: ; 118805 (46:4805)
	ld [wc300], a
	xor a
	ld [wc301], a
	ld [wc302], a
	ld a, $a
	call Function3e32
	ld a, [wc3f0]
	ld [$c319], a
	ld a, [wcd34]
	ld [wcf66], a
	ret

Function118821: ; 118821 (46:4821)
	ld a, [$c319]
	cp $3
	jr c, .asm_11884a
	cp $4
	jr z, .asm_11884a
	ld a, [hJoyDown]
	cp $5
	jr nz, .asm_11884a
	ld a, $a
	call Function3e32
	ld a, $a
	ld [wc300], a
	ld a, [wc3f0]
	ld [$c319], a
	ld a, [wcd34]
	ld [wcf66], a
	scf
	ret
.asm_11884a
	and a
	ret
; 11884c (46:484c)

Function118866:
	ld a, 2
	jr asm_11886f

Function11886a: ; 11886a (46:486a)
	ld a, 1
; 11886e (46:486e)

asm_11886f
	ld [BGMapPalBuffer], a
	ld a, $0
	ld [wcd3c], a
	call BattleTowerRoomMenu_IncrementJumptable
	ld a, [wcd33]
	ld [wMobileInactivityTimerSeconds], a

Function118880: ; 118880 (46:4880)
	call BattleTowerRoomMenu2
	ret c
	xor a
	ld [wcf64], a
	ld [wc807], a
	ld de, wcd81
	ld hl, $46
	ld a, $2
	jp Function119e2b
; 118896 (46:4896)

Function1188b0: ; 1188b0 (46:48b0)
	ld de, $c346
	ld a, $c
	jp Function119e2b

Function1188b8: ; 1188b8 (46:48b8)
	ld de, wc3ac
	ld a, $e
	jp Function119e2b

Function1188c0: ; 1188c0 (46:48c0)
	ld de, wc3cd
	ld a, $10
	jp Function119e2b

Function1188c8: ; 1188c8 (46:48c8)
	ld a, $1
	ld [wcd65], a
	call Function1188e7
	ld hl, $c708
.asm_1188d3
	ld a, [de]
	inc de
	ld [hli], a
	and a
	jr nz, .asm_1188d3
	call Function119eb4
	call Function119ec2
	ld hl, $c708
	ld a, $6
	jp Function119e2b

Function1188e7: ; 1188e7 (46:48e7)
	ld de, $c346
	ld a, $5
	call GetSRAMBank
	ld a, [$aa4a]
	call CloseSRAM
	and a
	ret z
	sla a
	ld c, a
.asm_1188fa
	ld a, [de]
	inc de
	and a
	jr nz, .asm_1188fa
	dec c
	jr nz, .asm_1188fa
	ret

Function118903: ; 118903 (46:4903)
	ld a, [wc3f0]
	ld [$c319], a
	ld c, $1
	callba Function115e18
	ld a, $8
	ld [wcd3c], a
	call BattleTowerRoomMenu2
	jp BattleTowerRoomMenu_IncrementJumptable


BattleTowerRoomMenu_PickLevelMessage: ; 118922
	ld a, [wcd38]
	and a
	jr nz, .asm_11892d
	ld hl, Text_WhatLevelDoYouWantToChallenge
	jr .asm_118930

.asm_11892d
	ld hl, Text_CheckBattleRoomListByMaxLevel

.asm_118930
	call BattleTowerRoomMenu_SetMessage
	call BattleTowerRoomMenu_IncrementJumptable

BattleTowerRoomMenu_PlacePickLevelMenu:
	ld a, [$c31a]
	and a
	ret nz
	ld hl, MenuDataHeader_119cf7
	call LoadMenuDataHeader
	call MenuBox
	call MenuBoxCoord2Tile
	call ApplyTilemap
	hlcoord 16, 8, AttrMap
	ld a, $40
	or [hl]
	ld [hl], a
	call WaitBGMap2
	ld a, $1
	ld [wcd4f], a
	ld a, $1
	ld [rSVBK], a
	ld a, [StatusFlags]
	bit 6, a ; Hall Of Fame
	jr nz, .asm_11896b
	ld hl, Strings_Ll0ToL40		; Address to list of strings with the choosable levels
	ld a, 5						; 4 levels to choose from, including 'Cancel'-option
	jr .asm_118970

.asm_11896b
	ld hl, Strings_L10ToL100	; Address to list of strings with the choosable levels
	ld a, 11					; 10 levels to choose from, including 'Cancel'-option

.asm_118970
	ld [wcd4a], a
	ld a, l
	ld [wcd4b], a
	ld a, h
	ld [wcd4c], a
	ld a, $3
	ld [rSVBK], a
	call BattleTowerRoomMenu_IncrementJumptable

BattleTowerRoomMenu_UpdatePickLevelMenu:
	hlcoord 13, 8
	ld de, String_119d07
	call PlaceString
	hlcoord 13, 10
	ld de, String_119d07
	call PlaceString
	ld a, [wcd4b]
	ld l, a
	ld a, [wcd4c]
	ld h, a
	ld d, $0
	ld a, [wcd4f]
	dec a
	rlca
	rlca
	rlca
	ld e, a
	add hl, de
	ld a, l
	ld e, a
	ld a, h
	ld d, a
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld bc, StringBuffer3
.asm_1189b5
	ld a, [hli]
	cp $50
	jr z, .asm_1189c4
	cp $7f
	jr z, .asm_1189c2
	ld [bc], a
	inc bc
	jr .asm_1189b5

.asm_1189c2
	ld a, $50

.asm_1189c4
	ld [bc], a
	pop af
	ld [rSVBK], a
	hlcoord 13, 9
	call PlaceString
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .b_button
	ld a, [hl]
	and A_BUTTON
	jr nz, .a_button
	ld a, [hl]
	and D_DOWN
	jr nz, .d_down
	ld a, [hl]
	and D_UP
	jr nz, .d_up
.asm_1189e5
	ret

.d_down
	ld hl, wcd4f
	dec [hl]
	jr nz, .asm_1189e5
	ld a, [wcd4a]
	ld [hl], a
	jr .asm_1189e5

.d_up
	ld a, [wcd4a]
	ld hl, wcd4f
	inc [hl]
	cp [hl]
	jr nc, .asm_1189e5
	ld a, $1
	ld [hl], a
	jr .asm_1189e5

.a_button
	call PlayClickSFX
	ld a, [wcd4f]
	ld hl, wcd4a
	cp [hl]
	jr z, .asm_118a3c
	dec a
	and $fe
	srl a
	ld [wcf65], a
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	call CloseWindow
	pop af
	ld [rSVBK], a
	ld a, [wcd38]
	and a
	jr nz, .asm_118a30
	call BattleTower_LevelCheck
	ret c
	call BattleTower_UbersCheck
	ret c

.asm_118a30
	ld a, [wcd4f]
	ld [w3_d800], a
	jp BattleTowerRoomMenu_IncrementJumptable

.b_button
	call PlayClickSFX

.asm_118a3c
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	call CloseWindow
	pop af
	ld [rSVBK], a
	ld a, $7
	ld [wcf66], a
	ld a, $0
	ld [wMobileInactivityTimerFrames], a
	ret



Function118aa4: ; 118aa4
	ld hl, NewsDownloadURL
	ld de, wcc60
	ld bc, $80
	call CopyBytes
	ld a, $5
	ld [rSVBK], a
	ld de, w3_d100
	ld bc, $e00
	jr Function118b10
; 118abc

Function118abc: ; 118abc (46:4abc)
	ld hl, MenuDownloadURL
	ld de, wcc60
	ld bc, $80
	call CopyBytes
	ld de, w3_d000
	ld bc, $1000
; 118ad0 (46:4ad0)

Function118b10:
	push de
	push bc
	ld a, $8
	ld [wcd3c], a
	call BattleTowerRoomMenu2
	call Function118b24
	pop bc
	pop de
	ld a, $2a
	jp Function119e2b

Function118b24: ; 118b24 (46:4b24)
	ld hl, $c346
	ld a, $8
	ld [hli], a
	ld a, $c7
	ld [hli], a
	ld a, $60
	ld [hli], a
	ld a, $cc
	ld [hli], a
	call Function119eb4
	call Function119ec2
	ld a, $80
	ld [wcd89], a
	ld hl, $c346
	ret
; 118b42 (46:4b42)

Function118b9a: ; 118b9a
	ld a, h
	cp $e0
	ret c
	ld a, $d3
	call Function118805
	and a
	ret
; 118ba5


	charmap " ", $20 ; revert to ascii

NewsDownloadURL: ; 0x118c47
	db "http://gameboy.datacenter.ne.jp/cgb/download?name=/01/CGB-BXTJ/news/index.txt", 0

MenuDownloadURL: ; 0x118c95
	db "http://gameboy.datacenter.ne.jp/cgb/download?name=/01/CGB-BXTJ/POKESTA/menu.cgb", 0


Function118e39: ; 118e39 (46:4e39)
.asm_118e39
	ld a, [hli]
	and a
	jr nz, .asm_118e39
	dec hl
asm_118e3e
.asm_118e3e
	ld a, [hld]
	cp $2f
	jr nz, .asm_118e3e
	inc hl
	inc hl
	ld de, wcd85
	ld c, $4
.asm_118e4a
	ld a, [hli]
	cp $2e
	jr z, .asm_118e63
	cp $30
	jr c, .asm_118e67
	cp $3a
	jr nc, .asm_118e67
	sub $30
	add $f6
	ld [de], a
	inc de
	dec c
	jr nz, .asm_118e4a
	ld de, wcd85
.asm_118e63
	ld a, $50
	ld [de], a
	ret
.asm_118e67
	ld a, $f3
	ld [de], a
	inc de
	jr .asm_118e63

Function118e6d: ; 118e6d (46:4e6d)
	xor a
	ld [wcd65], a
	ld a, $a
	jp Function119e2b

Function118e76: ; 118e76 (46:4e76)
	; Call $c in BattleTowerRoomMenu2
	ld a, $c
	ld [wcd3c], a
	jp BattleTowerRoomMenu_IncrementJumptable

Function118e7e: ; 118e7e (46:4e7e)
	call BattleTowerRoomMenu2
	ret c
	ld a, $36
	jp Function119e2b

BattleTowerRoomMenu_CallRoomMenu2: ; 118e87 (46:4e87)
	call BattleTowerRoomMenu2
	ret c
	ld a, [wcd33]
	ld [wcf66], a
	ret
; 118e92 (46:4e92)

Function118e92: ; 118e92
	call Function118440
	call Function1191d3
	ld a, [wcd53]
	ld l, a
	ld a, [wcd54]
	ld h, a
	ld de, wcc60
	call Function1191ad
	ret c
	ld de, w3_d800
	ld bc, $0800
	jp Function118b10
; 118eb0

Function118f68:
	call Function119223
	ret c
	call Function118440
	ld a, [wcd51]
	ld l, a
	ld a, [wcd52]
	ld h, a
	ld de, wcc60
	call Function1191ad
	ret c
	ld a, [wcc60]
	and a
	jr z, .asm_118fba
	ld hl, $c346
	ld a, $c608 % $100
	ld [hli], a
	ld a, $c608 / $100
	ld [hli], a
	ld a, [wcd4b]
	ld [hli], a
	ld a, [wcd4c]
	ld [hli], a
	ld a, $c708 % $100
	ld [hli], a
	ld a, $c708 / $100
	ld [hli], a
	ld a, $60
	ld [hli], a
	ld a, $cc
	ld [hli], a
	call Function119eb4
	call Function119ec2
	ld a, $40
	ld [wcd89], a
	ld hl, $c346
	ld de, $de00
	ld bc, $0200
	ld a, $2c
	jp Function119e2b

.asm_118fba
	call BattleTowerRoomMenu_IncrementJumptable
	jp BattleTowerRoomMenu_IncrementJumptable
; 118fc0

Function119009:
	call Function118440
	call Function119300
	ld a, [wcd55]
	ld l, a
	ld a, [wcd56]
	ld h, a
	ld de, wcc60
	call Function1191ad
	ret c
	ld hl, $c346
	ld a, $8
	ld [hli], a
	ld a, $c6
	ld [hli], a
	ld a, [wcd4b]
	ld [hli], a
	ld a, [wcd4c]
	ld [hli], a
	ld a, $8
	ld [hli], a
	ld a, $c7
	ld [hli], a
	ld a, $60
	ld [hli], a
	ld a, $cc
	ld [hli], a
	call Function119eb4
	call Function119ec2
	ld a, $40
	ld [wcd89], a
	ld hl, $c346
	ld de, w3_d000
	ld bc, $1000
	ld a, $2c
	jp Function119e2b
; 119054

Function119054: ; 119054
	ld a, $6
	call GetSRAMBank
	ld hl, wd002
	ld a, [wcd4f]
	ld e, a
	ld a, [wcd50]
	ld d, a
	ld a, [w3_d000]
	ld c, a
	ld a, [w3_d000 + 1]
	ld b, a
	call Function119192
	ret c
	ld a, [wcd89]
	and $1
	jr z, .asm_11908a
	ld a, $6
	ld [rSVBK], a
	ld hl, wd002
	ld a, [w3_d000]
	ld c, a
	ld a, [w3_d000 + 1]
	ld b, a
	call Function119192
	ret c

.asm_11908a
	call CloseSRAM
	ld a, $3
	ld [rSVBK], a
	ld a, $5
	call GetSRAMBank
	ld a, [wcd4f]
	ld [$b1b3], a
	ld a, [wcd50]
	ld [$b1b4], a
	ld hl, BGMapBuffer
	ld de, $aa7f
	ld bc, $000c
	call CopyBytes
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld a, [wd474]
	ld [$b2f3], a
	ld hl, wd475
	ld de, $b2f4
	ld bc, $0004
	call CopyBytes
	pop af
	ld [rSVBK], a
	call CloseSRAM
	jp BattleTowerRoomMenu_IncrementJumptable
; 1190d0

Function11915d: ; 11915d
	ld hl, $d802
	ld de, BGMapBuffer
	ld bc, $000c
	call CopyBytes
	ld a, $5
	call GetSRAMBank
	ld hl, BGMapBuffer
	ld de, $aa7f
	ld c, $c
.asm_119176
	ld a, [de]
	inc de
	cp [hl]
	jr nz, .asm_119184
	inc hl
	dec c
	jr nz, .asm_119176
	call BattleTowerRoomMenu_IncrementJumptable
	jr .asm_11918e

.asm_119184
	ld a, $16
	ld [wcf66], a
	ld a, $b
	ld [wc300], a

.asm_11918e
	call CloseSRAM
	ret
; 119192

Function119192: ; 119192
	inc b
	inc c
	jr .asm_11919e

.asm_119196
	ld a, [hli]
	ld [de], a
	inc de
	ld a, $bf
	cp d
	jr c, .asm_1191a6

.asm_11919e
	dec c
	jr nz, .asm_119196
	dec b
	jr nz, .asm_119196
	and a
	ret

.asm_1191a6
	ld a, $d3
	call Function118805
	scf
	ret
; 1191ad

Function1191ad: ; 1191ad
	push bc
	ld c, $0
	ld a, $5
	ld [rSVBK], a
.asm_1191b4
	ld a, [hli]
	ld [de], a
	inc de
	and a
	jr z, .asm_1191cc
	inc c
	ld a, c
	cp $a6
	jr c, .asm_1191b4
	ld a, $da
	call Function118805
	ld a, $3
	ld [rSVBK], a
	pop bc
	scf
	ret

.asm_1191cc
	ld a, $3
	ld [rSVBK], a
	pop bc
	and a
	ret
; 1191d3

Function1191d3: ; 1191d3
	ld hl, w3_d100 + 2
	ld a, l
	ld [wcd53], a
	ld a, h
	ld [wcd54], a
	call Function11920f
	ld a, l
	ld [wcd51], a
	ld a, [wcd4a]
	ld a, h
	ld [wcd52], a
	call Function11920f
	ld a, l
	ld [wcd55], a
	ld a, [wcd4a]
	ld a, h
	ld [wcd56], a
	call Function11920f
	ld a, [wcd49]
	ld a, l
	ld [wcd57], a
	ld a, [wcd4a]
	ld a, h
	ld [wcd58], a
	call Function11920f
	ret
; 11920f

Function11920f: ; 11920f
.asm_11920f
	call Function118b9a
	ret nc
	ld a, [hli]
	cp $d
	jr nz, .asm_11920f
	ld a, [hli]
	cp $a
	jr nz, .asm_11920f
	dec hl
	xor a
	ld [hld], a
	ld [hli], a
	inc hl
	ret
; 119223

Function119223: ; 119223
	xor a
	ld [wcd4b], a
	ld [wcd4c], a
	ld a, $5
	call GetSRAMBank
	ld hl, wc3cd
	ld de, $b092
	ld bc, $001f
	call CopyBytes
	dec de
	xor a
	ld [de], a
	ld hl, $d810
.asm_119241
	ld a, [hli]
	cp $50
	jr nz, .asm_119241
	ld a, [hli]
	ld [wcd4f], a
	ld a, [hli]
	ld [wcd50], a
	ld a, [hli]
	ld [$b1b1], a
	ld c, a
	ld a, [hli]
	ld [$b1b2], a
	ld b, a
	ld de, $b1d3
	call CopyBytes
	call CloseSRAM
	ld e, l
	ld d, h
	ld hl, $c608
.asm_119266
	ld a, [de]
	inc de
	cp $ff
	jr z, .asm_1192c2
	cp $fe
	jr z, .asm_1192a5
	call GetSRAMBank
	ld a, [de]
	inc de
	ld c, a
	ld a, [de]
	inc de
	ld b, a
	ld a, [de]
	inc de
	push de
	push af
	ld a, [wcd4b]
	ld e, a
	ld a, [wcd4c]
	ld d, a
	pop af
.asm_119286
	push af
	ld a, [bc]
	inc bc
	ld [hli], a
	inc de
	pop af
	dec a
	jr nz, .asm_119286
	call CloseSRAM
	ld a, e
	ld [wcd4b], a
	ld a, d
	ld [wcd4c], a
	pop de
.asm_11929b
	and a
	jr z, .asm_119266
	ld a, $d3
	call Function118805
	scf
	ret

.asm_1192a5
	ld a, [wcd4b]
	ld c, a
	ld a, [wcd4c]
	ld b, a
	ld a, [de]
	inc de
.asm_1192af
	push af
	ld a, [de]
	inc de
	ld [hli], a
	inc bc
	pop af
	dec a
	jr nz, .asm_1192af
	ld a, c
	ld [wcd4b], a
	ld a, b
	ld [wcd4c], a
	jr .asm_11929b

.asm_1192c2
	ld a, e
	ld [wcd4d], a
	ld a, d
	ld [wcd4e], a
	and a
	ret
; 1192cc

Function119300: ; 119300
	xor a
	ld [wcd4b], a
	ld [wcd4c], a
	ld a, [wcd4d]
	ld e, a
	ld a, [wcd4e]
	ld d, a
	ld hl, $c608
	ld a, [wcd4b]
	ld c, a
	ld a, [wcd4c]
	ld b, a
.asm_11931a
	ld a, [de]
	inc de
	cp $50
	jr z, .asm_119324
	ld [hli], a
	inc bc
	jr .asm_11931a

.asm_119324
	ld a, $3d
	ld [hli], a
	inc bc
	ld a, c
	ld [wcd4b], a
	ld a, b
	ld [wcd4c], a
	ld a, [de]
	inc de
	call GetSRAMBank
	ld a, [de]
	inc de
	ld c, a
	ld a, [de]
	inc de
	ld b, a
	ld a, [de]
	inc de
	push de
	push af
	ld a, [wcd4b]
	ld e, a
	ld a, [wcd4c]
	ld d, a
	pop af
.asm_119348
	push af
	ld a, [bc]
	and $f0
	swap a
	call Function1197bf
	ld [hli], a
	inc de
	ld a, [bc]
	inc bc
	and $f
	call Function1197bf
	ld [hli], a
	inc de
	pop af
	dec a
	jr nz, .asm_119348
	call CloseSRAM
	ld a, e
	ld [wcd4b], a
	ld a, d
	ld [wcd4c], a
	pop de
	ld a, [de]
	cp $50
	jr z, .asm_11937f
	ld a, [wcd4b]
	ld c, a
	ld a, [wcd4c]
	ld b, a
	ld a, $26
	ld [hli], a
	inc bc
	jr .asm_11931a

.asm_11937f
	ret
; 119380

Function119380: ; 119380
	ld a, $80
	ld [wcd49], a
	jp BattleTowerRoomMenu_IncrementJumptable
; 119388

Function119388: ; 119388
	ld hl, wcd49
	dec [hl]
	ret nz
	ld hl, wcc60
	call Function118e39
	ld a, $9
	ld [wcd3c], a
	ld a, $10
	ld [wMobileInactivityTimerSeconds], a
	call BattleTowerRoomMenu_IncrementJumptable

Function1193a0:
	call BattleTowerRoomMenu2
	ret c
	call DelayFrame
	ld a, $8
	ld [wcd3c], a
	call BattleTowerRoomMenu2
	ld hl, $c346
	ld a, wd000 % $100
	ld [hli], a
	ld a, wd000 / $100
	ld [hli], a
	ld a, [wcd3b]
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $c708 % $100
	ld [hli], a
	ld a, $c708 / $100
	ld [hli], a
	ld a, $60
	ld [hli], a
	ld a, $cc
	ld [hli], a
	call Function119eb4
	call Function119ec2
	ld a, $40
	ld [wcd89], a
	ld hl, $c346
	ld de, $de00
	ld bc, $0200
	ld a, $2c
	jp Function119e2b
; 1193e3

Function1193e3: ; 1193e3
	ld hl, wcd49
	dec [hl]
	ret nz
	ld hl, wcc60
	call Function118e39
	ld a, $9
	ld [wcd3c], a
	ld a, $11
	ld [wMobileInactivityTimerSeconds], a
	call BattleTowerRoomMenu_IncrementJumptable

Function1193fb:
	call BattleTowerRoomMenu2
	ret c
	call DelayFrame
	ld a, $8
	ld [wcd3c], a
	call BattleTowerRoomMenu2
	ld de, w3_d000
	ld bc, $1000
	jp Function118b10
; 119413

Function119413: ; 119413
	ld a, $6
	call GetSRAMBank
	ld a, [w3_d000]
	ld c, a
	ld a, [w3_d000 + 1]
	ld b, a
	dec bc
	dec bc
	ld hl, wd002
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	call Function119192
	ret c
	ld a, [wcd89]
	and $1
	jr z, .asm_119447
	ld a, $6
	ld [rSVBK], a
	ld a, [wd000]
	ld c, a
	ld a, [w3_d000 + 1]
	ld b, a
	ld hl, wd002
	call Function119192
	ret c

.asm_119447
	ld a, $3
	ld [rSVBK], a
	call CloseSRAM
	jp BattleTowerRoomMenu_IncrementJumptable
; 119451

Function119451: ; 119451 (46:5451)
	ld a, [wcd89]
	and $1
	jr z, .asm_11945d
	ld a, $d3
	jp Function118805
.asm_11945d
	xor a
	ld [wcd50], a
	call Function119694
	ld a, b
	ld [wcd49], a
	call Function1196cd
	ld a, [wd002]
	ld hl, wd003

Function119471: ; 119471 (46:5471)
	push af
	ld a, [hli]
	ld [$c608], a
	ld a, [hli]
	ld [$c608 + 3], a
	ld a, [hli]
	ld [$c608 + 1], a
	ld a, [hli]
	ld [$c608 + 2], a
	ld a, [hli]
	ld [$c608 + 4], a
	ld a, [hli]
	ld [$c608 + 5], a ; $c608 + 5
	push hl
	ld a, [$c608]
	cp $ff
	jr z, .asm_1194a7
	ld a, [$c608 + 2]
	cp $ff
	jr z, .asm_1194a7
	ld a, [$c608 + 1]
	cp $ff
	jr nz, .asm_1194a7
	call Function119584
	jr c, .asm_11950c
	jr .asm_1194f0
.asm_1194a7
	ld hl, $c608
	ld de, $c608 + 3
	ld c, $3
.asm_1194af
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	jr c, .asm_1194f3
	jr z, .asm_1194b9
	jr nc, .asm_1194bc
.asm_1194b9
	dec c
	jr nz, .asm_1194af
.asm_1194bc
	ld c, $3
	ld hl, wcd49
	ld de, $c608
.asm_1194c4
	ld a, [de]
	inc de
	cp $ff
	jr z, .asm_1194d1
	cp [hl]
	jr z, .asm_1194d1
	jr c, .asm_1194d5
	jr nc, .asm_1194f0
.asm_1194d1
	inc hl
	dec c
	jr nz, .asm_1194c4
.asm_1194d5
	ld c, $3
	ld hl, wcd49
	ld de, $c608 + 3
.asm_1194dd
	ld a, [de]
	inc de
	cp $ff
	jr z, .asm_1194ea
	cp [hl]
	jr c, .asm_1194f0
	jr z, .asm_1194ea
	jr nc, .asm_11950c
.asm_1194ea
	inc hl
	dec c
	jr nz, .asm_1194dd
	jr .asm_11950c
.asm_1194f0
	pop hl
	jr .asm_119557
.asm_1194f3
	ld c, $3
	ld hl, wcd49
	ld de, $c608
.asm_1194fb
	ld a, [de]
	inc de
	cp $ff
	jr z, .asm_119508
	cp [hl]
	jr c, .asm_11950c
	jr z, .asm_119508
	jr nc, .asm_1194d5
.asm_119508
	inc hl
	dec c
	jr nz, .asm_1194fb
.asm_11950c
	pop hl
	ld a, $1
	ld [wcd50], a
	ld a, l
	ld [$c608], a
	ld a, h
	ld [$c608 + 1], a
	ld de, wcd69
	ld c, $10
	ld b, $0
.asm_119521
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	jr nz, .asm_119528
	inc b
.asm_119528
	dec c
	jr nz, .asm_119521
	ld a, $10
	cp b
	jr z, .asm_119536
rept 4
	inc hl
endr
	jr .asm_11957a
.asm_119536
	ld a, [hli]
	cp $50
	jr nz, .asm_119552
	ld a, [hli]
	cp $33
	jr nz, .asm_119553
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [wcd83]
	cp c
	jr nz, .asm_119576
	ld a, [wcd84]
	cp b
	jr nz, .asm_119576
	jr .asm_11955b
.asm_119552
	inc hl
.asm_119553
	inc hl
	inc hl
	jr .asm_11955b
.asm_119557
	ld de, $14
	add hl, de
.asm_11955b
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	add hl, de
	pop af
	dec a
	jp nz, Function119471
	ld a, [wcd50]
	and a
	jr z, .asm_119571
	ld a, $1a
	ld [wcf66], a
	ret
.asm_119571
	ld a, $d8
	jp Function118805
.asm_119576
	ld a, $10
	jr .asm_11957c
.asm_11957a
	ld a, $f
.asm_11957c
	ld [wcf66], a
	pop af
	call Function1195c4
	ret

Function119584: ; 119584 (46:5584)
	ld a, [$c608]
	ld b, a
	ld a, [$c608 + 3]
	ld c, a
	cp b
	jr c, .asm_11959c
	ld a, [wcd49]
	cp b
	jr c, .asm_1195c2
.asm_119595
	cp c
	jr c, .asm_1195a2
	jr z, .asm_1195a2
	jr .asm_1195c2
.asm_11959c
	ld a, [wcd49]
	cp b
	jr c, .asm_119595
.asm_1195a2
	ld a, [$c608 + 2]
	ld b, a
	ld a, [$c608 + 5] ; $c608 + 5
	ld c, a
	cp b
	jr c, .asm_1195ba
	ld a, [wcd4b]
	cp b
	jr c, .asm_1195c2
.asm_1195b3
	cp c
	jr c, .asm_1195c0
	jr z, .asm_1195c0
	jr .asm_1195c2
.asm_1195ba
	ld a, [wcd4b]
	cp b
	jr c, .asm_1195b3
.asm_1195c0
	scf
	ret
.asm_1195c2
	and a
	ret

Function1195c4: ; 1195c4 (46:55c4)
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld de, $a5
	ld a, b
	cp d
	jr c, .asm_1195d9
	jr z, .asm_1195d3
	jr nc, .asm_1195f3
.asm_1195d3
	ld a, c
	cp e
	jr z, .asm_1195d9
	jr nc, .asm_1195f3
.asm_1195d9
	ld de, wcc60
	call CopyBytes
	xor a
	ld [de], a
	ld a, [$c608]
	ld l, a
	ld a, [$c608 + 1]
	ld h, a
	ld de, wcd69
	ld bc, $10
	call CopyBytes
	ret
.asm_1195f3
	ld a, $d8
	jp Function118805

Function1195f8: ; 1195f8 (46:55f8)
	ld a, $11
	ld [wcd3c], a
	ld a, $1c
	ld [wMobileInactivityTimerSeconds], a
	ld a, $f
	ld [wMobileInactivityTimerFrames], a
	ld a, $14
	ld [wcd47], a
	call BattleTowerRoomMenu_IncrementJumptable
	jp BattleTowerRoomMenu_IncrementJumptable

Function119612: ; 119612 (46:5612)
	ld a, $14
	ld [wcd3c], a
	ld a, $1c
	ld [wMobileInactivityTimerSeconds], a
	ld a, $10
	ld [wMobileInactivityTimerFrames], a
	ld a, $14
	ld [wcd47], a
	jp BattleTowerRoomMenu_IncrementJumptable

Function119629: ; 119629 (46:5629)
	call BattleTowerRoomMenu2
	ret c
	ld a, $60
	ld l, a
	ld a, $cc
	ld h, a
	call Function118e39
	ld a, $9
	ld [wcd3c], a
	ld a, $1c
	ld [wMobileInactivityTimerSeconds], a
	ld a, $14
	ld [wcd47], a
	call BattleTowerRoomMenu_IncrementJumptable

Function119648: ; 119648 (46:5648)
	call BattleTowerRoomMenu2
	ret c
	call DelayFrame
	ld a, $8
	ld [wcd3c], a
	call BattleTowerRoomMenu2
	call Function118b24
	ld de, w3_d000
	ld bc, $1000
	ld a, $2a
	jp Function119e2b

Function119665: ; 119665 (46:5665)
	ld a, $1a
	ld [wcd3c], a
	call BattleTowerRoomMenu_IncrementJumptable

Function11966d: ; 11966d (46:566d)
	call BattleTowerRoomMenu2
	ret c
	ld a, [wcd47]
	ld [wcf66], a
	ld a, $a
	ld [wc300], a
	ret

Function11967d: ; 11967d (46:567d)
	ld a, $18
	ld [wcd3c], a
	call BattleTowerRoomMenu_IncrementJumptable

Function119685: ; 119685 (46:5685)
	call BattleTowerRoomMenu2
	ret c
	ld a, $14
	ld [wcf66], a
	ld a, $a
	ld [wc300], a
	ret

Function119694: ; 119694 (46:5694)
	ld b, 0
	ld hl, Unknown_1196b8
.asm_119699
	ld de, $c708
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	jr nz, .asm_1196af
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	jr nz, .asm_1196b0
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	jr nz, .asm_1196b1
	ret
.asm_1196af
	inc hl
.asm_1196b0
	inc hl
.asm_1196b1
	inc b
	ld a, b
	cp $7
	jr nz, .asm_119699
	ret
; 1196b8 (46:56b8)

Unknown_1196b8: ; 1196b8
	db "Mon"
	db "Tue"
	db "Wed"
	db "Thu"
	db "Fri"
	db "Sat"
	db "Sun"
; 1196cd

SECTION "bank46_2", ROMX
; A hack to use ascii above.

Function1196cd: ; 1196cd (46:56cd)
	ld de, $c719
	call Function1196de
	ld [wcd4a], a
	inc de
	call Function1196de
	ld [wcd4b], a
	ret

Function1196de: ; 1196de (46:56de)
	ld a, [de]
	inc de
	; b = ([de] - 48) * 2
	; c = ([de] - 48) * 10
	sub $30
	sla a
	ld b, a
	sla a
	sla a
	add b
	ld c, a
	add hl, bc
	ld a, [de]
	inc de
	sub $30
	add c
	ret
; 1196f2 (46:56f2)

Function1197bf: ; 1197bf
	cp $a
	jr nc, .asm_1197c6
	add $30
	ret

.asm_1197c6
	add $57
	ret
; 1197c9

BattleTowerRoomMenu_UberRestrictionMessage: ; 119c97
	ld hl, Text_UberRestriction
	call BattleTowerRoomMenu_SetMessage
	call BattleTowerRoomMenu_IncrementJumptable
	jr BattleTowerRoomMenu_WaitForMessage

BattleTowerRoomMenu_PartyMonTopsThisLevelMessage:
	ld hl, Text_PartyMonTopsThisLevel
	call BattleTowerRoomMenu_SetMessage
	call BattleTowerRoomMenu_IncrementJumptable

BattleTowerRoomMenu_WaitForMessage:
	ld a, [$c31a]
	and a
	ret nz
	ld a, $80
	ld [wcd50], a
	call BattleTowerRoomMenu_IncrementJumptable

BattleTowerRoomMenu_DelayRestartMenu:
	ld hl, wcd50
	dec [hl]
	ret nz
	ld a, $0
	ld [wcf66], a
	ret
; 119cc3

BattleTowerRoomMenu_QuitMessage: ; 119cc3
	ld a, [wcd38]
	and a
	jr z, .asm_119cd1
	dec a
	jr z, .asm_119cd6
	ld hl, Text_QuitReadingNews
	jr .asm_119cd9

.asm_119cd1
	ld hl, Text_CancelBattleRoomChallenge
	jr .asm_119cd9

.asm_119cd6
	ld hl, Text_ExitGymLeaderHonorRoll

.asm_119cd9
	call BattleTowerRoomMenu_SetMessage
	call BattleTowerRoomMenu_IncrementJumptable

BattleTowerRoomMenu_PlaceYesNoMenu:
	ld a, [$c31a]
	and a
	ret nz
	ld a, $f
	ld [wcd3c], a
	call BattleTowerRoomMenu_IncrementJumptable

BattleTowerRoomMenu_UpdateYesNoMenu:
	; Only ever called when [wcd3c] is $10
	call BattleTowerRoomMenu2
	ret c
	ld a, [wMobileInactivityTimerFrames]
	ld [wcf66], a
	ret
; 119cf7

MenuDataHeader_119cf7: ; 119cf7
	db $40 ; flags
	db  7, 12 ; start coords
	db 11, 19 ; end coords
	dw NULL
	db 0 ; default option
; 119cff

String_119d07:
	db "   ▼@"

Strings_L10ToL100: ; 119d0c
	db " L:10 @@"
	db " L:20 @@"
	db " L:30 @@"
	db " L:40 @@"
	db " L:50 @@"
	db " L:60 @@"
	db " L:70 @@"
	db " L:80 @@"
	db " L:90 @@"
	db " L:100@@"
	db "CANCEL@@"

Strings_Ll0ToL40: ; 119d64
	db " L:10 @@"
	db " L:20 @@"
	db " L:30 @@"
	db " L:40 @@"
	db "CANCEL@@"

BattleTower_LevelCheck: ; 119d93 (46:5d93)
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld a, [wcd4f]
	ld c, 10
	call SimpleMultiply
	ld hl, wcd50
	ld [hl], a
	ld bc, PARTYMON_STRUCT_LENGTH
	ld de, PartyMon1Level
	ld a, [PartyCount]
.party_loop
	push af
	ld a, [de]
	push hl
	push de
	pop hl
	add hl, bc
	push hl
	pop de
	pop hl
	cp [hl]
	jr z, .equal
	jr nc, .exceeds
.equal
	pop af
	dec a
	jr nz, .party_loop
	pop af
	ld [rSVBK], a
	and a
	ret

.exceeds
	pop af
	ld a, $4
	ld [wcf66], a
	pop af
	ld [rSVBK], a
	scf
	ret

BattleTower_UbersCheck: ; 119dd1 (46:5dd1)
	ld a, [rSVBK]
	push af
	ld a, [wcd4f]
	cp 70 / 10
	jr nc, .level_70_or_more
	ld a, $1
	ld [rSVBK], a
	ld hl, PartyMon1Level
	ld bc, PARTYMON_STRUCT_LENGTH
	ld de, PartySpecies
	ld a, [PartyCount]
.loop
	push af
	ld a, [de]
	cp MEWTWO
	jr z, .uber
	cp MEW
	jr z, .uber
	cp LUGIA
	jr c, .next
	cp NUM_POKEMON + 1
	jr nc, .next
.uber
	ld a, [hl]
	cp 70
	jr c, .uber_under_70
.next
	add hl, bc
	inc de
	pop af
	dec a
	jr nz, .loop
.level_70_or_more
	pop af
	ld [rSVBK], a
	and a
	ret

.uber_under_70
	pop af
	ld a, [de]
	ld [wd265], a
	call GetPokemonName
	ld hl, StringBuffer1
	ld de, wcd49
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	ld a, $a
	ld [wcf66], a
	pop af
	ld [rSVBK], a
	scf
	ret
; 119e2b (46:5e2b)

Function119e2b: ; 119e2b (46:5e2b)
	call Function3e32

BattleTowerRoomMenu_IncrementJumptable: ; 119e2e (46:5e2e)
	ld hl, wcf66
	inc [hl]
	ret
; 119e33 (46:5e33)

Function119eb4: ; 119eb4 (46:5eb4)
	xor a
	ld [wc3cc], a
	ld de, wc3ac
.loop
	ld a, [de]
	inc de
	ld [hli], a
	and a
	jr nz, .loop
	ret

Function119ec2: ; 119ec2 (46:5ec2)
	ld a, BANK(sMobileLoginPassword)
	call GetSRAMBank
	xor a
	ld [sMobileLoginPassword + MOBILE_LOGIN_PASSWORD_LENGTH], a
	ld de, sMobileLoginPassword + 1
.loop
	ld a, [de]
	inc de
	ld [hli], a
	and a
	jr nz, .loop
	call CloseSRAM
	ret

BattleTowerRoomMenu2: ; 119ed8 (46:5ed8)
	ld a, [rSVBK]
	ld [wcd8c], a
	ld a, $1
	ld [rSVBK], a

	call .RunJumptable

	ld a, [wcd8c]
	ld [rSVBK], a
	ld a, $1
	ld [hBGMapMode], a
	ret

.RunJumptable:
	jumptable .Jumptable, wcd3c

.Jumptable:
	dw Function119f3f
	dw Function119f45
	dw Function119f56
	dw Function119f76
	dw Function119f98
	dw Function11a113
	dw Function11a129
	dw Function11a131
	dw Function11a13d
	dw Function11a14b
	dw Function11a16d
	dw Function11a192
	dw Function11a2e6
	dw Function11a302
	dw Function11a33a
	dw BattleTowerRoomMenu2_PlaceYesNoMenu
	dw BattleTowerRoomMenu2_UpdateYesNoMenu
	dw Function11a357
	dw Function11a36b
	dw Function11a38d
	dw Function11a3c5
	dw Function11a3d9
	dw Function11a3f9
	dw Function11a41b
	dw Function11a452
	dw Function11a47a
	dw Function11a488
	dw Function11a49e
	dw Function11a4db
	dw Function11a4e8
	dw Function11a4fe
	dw Function11a466
	dw Function11a47a
; 119f3f

Function119f3f: ; 119f3f
	call Function11a5b9
	jp BattleTowerRoomMenu2_IncrementJumptable
; 119f45

Function119f45: ; 119f45
	hlcoord 4, 2
	ld de, String_11a661
	call PlaceString
	ld a, $80
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable
; 119f56

Function119f56: ; 119f56
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr z, .asm_119f62
	dec a
	ld [wMobileInactivityTimerMinutes], a
	scf
	ret

.asm_119f62
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6aa
	call PlaceString
	ld a, $80
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable
; 119f76

Function119f76: ; 119f76
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr z, .asm_119f82
	dec a
	ld [wMobileInactivityTimerMinutes], a
	scf
	ret

.asm_119f82
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a679
	call PlaceString
	call Function11a5f5
	xor a
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable
; 119f98

Function119f98: ; 119f98
	call Function11a536
	ret c
	call PlayClickSFX
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr nz, .asm_119fef
	call ExitMenu
	call Function11a63c
	xor a
	ld [ScriptVar], a
	call Function11a00e
	ld a, [ScriptVar]
	and a
	jr z, .asm_119fd4
	call ExitMenu
	callba ReloadMapPart
	callba Function115dc3
	ld a, [wcd33]
	ld [wcf66], a
	ld a, $a
	ld [wc300], a
	scf
	ret

.asm_119fd4
	hlcoord 4, 2
	ld de, String_11a692
	call PlaceString
	ld a, $1
	ld [wc30d], a
	ld a, $1
	ld [wc314], a
	callba ReloadMapPart
	and a
	ret

.asm_119fef
	call ExitMenu
	call ExitMenu
	callba ReloadMapPart
	ld a, [wMobileInactivityTimerSeconds]
	ld [wcf66], a
	callba Function115dc3
	ld a, $a
	ld [wc300], a
	scf
	ret
; 11a00e

Function11a00e: ; 11a00e
	ld a, BANK(sMobileLoginPassword)
	call GetSRAMBank
	ld a, [sMobileLoginPassword]
	and a
	jr z, .asm_11a02a
	ld a, [sMobileLoginPassword + 1]
	call CloseSRAM
	and a
	ret nz
	ld a, BANK(sMobileLoginPassword)
	call GetSRAMBank
	xor a
	ld [sMobileLoginPassword], a

.asm_11a02a
	call CloseSRAM
	ld a, [BGMapPalBuffer]
	and a
	jr z, .asm_11a039
	dec a
	jr z, .asm_11a081
	jp Function11a0ca

.asm_11a039
	ld a, $3
	ld [rSVBK], a
	ld hl, $c608
	ld de, w3_d800
	ld bc, $00f6
	call CopyBytes
	ld a, $1
	ld [rSVBK], a
	call FadeToMenu
	callba Function11765d
	call Function11a9ce
	ld a, $3
	ld [rSVBK], a
	ld hl, w3_d800
	ld de, $c608
	ld bc, $00f6
	call CopyBytes
	ld a, $1
	ld [rSVBK], a
	callba Function115d99
	ld c, $0
	callba Function115e18
	ld a, $1
	ld [wc305], a
	ret

.asm_11a081
	xor a
	ld [wMenuBorderLeftCoord], a
	ld [wMenuBorderTopCoord], a
	ld a, $13
	ld [wMenuBorderRightCoord], a
	ld a, $5
	ld [wMenuBorderBottomCoord], a
	call PushWindow
	callba Function11765d
	callba Function117ab4
	callba MobileFunc_106462
	callba Function106464
	call ExitMenu
	callba ReloadMapPart
	callba Function115d99
	ld c, $0
	callba Function115e18
	ld a, $1
	ld [wc305], a
	ret
; 11a0ca

Function11a0ca: ; 11a0ca
	xor a
	ld [wMenuBorderLeftCoord], a
	ld [wMenuBorderTopCoord], a
	ld a, $13
	ld [wMenuBorderRightCoord], a
	ld a, $11
	ld [wMenuBorderBottomCoord], a
	call PushWindow
	callba Function11765d
	callba Function17d3f6
	callba MobileFunc_106462
	callba Function106464
	call ExitMenu
	callba ReloadMapPart
	callba Function115d99
	ld c, $0
	callba Function115e18
	ld a, $1
	ld [wc305], a
	ret
; 11a113

Function11a113: ; 11a113
	call Function11a63c
	ld c, $1
	callba Function115e18
	hlcoord 4, 2
	ld de, String_11a6c8
	call PlaceString
	and a
	ret
; 11a129

Function11a129: ; 11a129
	ld a, $80
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable
; 11a131

Function11a131: ; 11a131
	ld hl, wMobileInactivityTimerMinutes
	dec [hl]
	ret nz
	ld a, [wcd3c]
	inc a
	ld [wcd3c], a

Function11a13d:
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	and a
	ret
; 11a14b

Function11a14b: ; 11a14b
	ld hl, wcd85
	ld a, [hl]
	cp $f3
	jr nz, .asm_11a155
	and a
	ret

.asm_11a155
	call Function11a1d6
	ret c
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6f1
	call PlaceString
	ld a, $80
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable
; 11a16d

Function11a16d: ; 11a16d
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr z, .asm_11a179
	dec a
	ld [wMobileInactivityTimerMinutes], a
	scf
	ret

.asm_11a179
	call Function11a63c
	call Function11a1e6
	hlcoord 4, 2
	ld de, $c346
	call PlaceString
	call Function11a5f5
	xor a
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable
; 11a192

Function11a192: ; 11a192
	call Function11a536
	ret c
	call PlayClickSFX
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr nz, .asm_11a1b6
	call ExitMenu
	callba ReloadMapPart
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	and a
	ret

.asm_11a1b6
	call ExitMenu
	callba ReloadMapPart
	ld a, [wMobileInactivityTimerSeconds]
	ld [wcf66], a
	ld [wcd80], a
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	scf
	ret
; 11a1d6

Function11a1d6: ; 11a1d6
	ld a, [wcd85]
	cp $50
	jr nz, .asm_11a1e4
	ld a, $d3
	call Function118805
	scf
	ret

.asm_11a1e4
	and a
	ret
; 11a1e6

Function11a1e6: ; 11a1e6
	ld hl, String_11a706
	ld de, $c346
	call Function11a1ff
	ld hl, wcd85
	call Function11a1ff
	ld hl, String_11a70b
	call Function11a1ff
	ld a, $50
	ld [de], a
	ret
; 11a1ff

Function11a1ff: ; 11a1ff
.asm_11a1ff
	ld a, [hli]
	cp $50
	ret z
	ld [de], a
	inc de
	jr .asm_11a1ff
; 11a207

BattleTowerRoomMenu2_PlaceYesNoMenu: ; 11a207
	ld hl, MenuDataHeader_11a2de
	call LoadMenuDataHeader
	call MenuBox
	call MenuBoxCoord2Tile
	call ApplyTilemap
	hlcoord 16, 8
	ld de, String_11a2cf
	call PlaceString
	hlcoord 16, 10
	ld de, String_11a2d3
	call PlaceString
	hlcoord 15, 8
	ld a, $ed
	ld [hl], a
	xor a
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable
; 11a235

BattleTowerRoomMenu2_UpdateYesNoMenu: ; 11a235
	ld hl, hJoyPressed
	ld a, [hl]
	and A_BUTTON
	jr nz, .a_button
	ld a, [hl]
	and B_BUTTON
	jr nz, .b_button
	ld a, [hl]
	and D_UP
	jr nz, .d_up
	ld a, [hl]
	and D_DOWN
	jr nz, .d_down
.asm_11a24c
	call Function11a9f0
	scf
	ret

.d_up
	xor a
	ld [wcd8a], a
	ld [wcd8b], a
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr z, .asm_11a24c
	xor a
	ld [wMobileInactivityTimerMinutes], a
	hlcoord 15, 8
	ld a, $ed
	ld [hl], a
	hlcoord 15, 10
	ld a, $7f
	ld [hl], a
	jr .asm_11a24c

.d_down
	xor a
	ld [wcd8a], a
	ld [wcd8b], a
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr nz, .asm_11a24c
	inc a
	ld [wMobileInactivityTimerMinutes], a
	hlcoord 15, 8
	ld a, $7f
	ld [hl], a
	hlcoord 15, 10
	ld a, $ed
	ld [hl], a
	jr .asm_11a24c

.a_button
	xor a
	ld [wcd8a], a
	ld [wcd8b], a
	call PlayClickSFX
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr nz, .exit_no_carry
	call ExitMenu
	callba ReloadMapPart
	ld a, [wMobileInactivityTimerFrames]
	cp $0
	jr z, .asm_11a2b4
	ld a, [wcd47]
	jr .exit_carry

.asm_11a2b4
	ld a, [wcd33]

.exit_carry
	ld [wcf66], a
	ld a, $a
	ld [wc300], a
	scf
	ret

.b_button
	call PlayClickSFX

.exit_no_carry
	call ExitMenu
	callba ReloadMapPart
	and a
	ret
; 11a2cf

String_11a2cf: ; 11a2cf
	db "YES@"
; 11a2d3

String_11a2d3: ; 11a2d3
	db "NO@"
; 11a2d6

MenuDataHeader_11a2de: ; 11a2de
	db $40 ; flags
	db  7, 14 ; start coords
	db 11, 19 ; end coords
	dw NULL
	db 0 ; default option
; 11a2e6

Function11a2e6: ; 11a2e6
	call Function11a63c
	ld c, $2
	callba Function115e18
	hlcoord 4, 2
	ld de, String_11a71e
	call PlaceString
	ld a, $80
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable
; 11a302

Function11a302: ; 11a302
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr z, .asm_11a30e
	dec a
	ld [wMobileInactivityTimerMinutes], a
	scf
	ret

.asm_11a30e
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a72a
	call PlaceString
	hlcoord 9, 4
	ld de, wcd68
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	hlcoord 14, 4
	ld de, wcd67
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ld a, $80
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable
; 11a33a

Function11a33a: ; 11a33a
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr z, .asm_11a346
	dec a
	ld [wMobileInactivityTimerMinutes], a
	scf
	ret

.asm_11a346
	call ExitMenu
	callba ReloadMapPart
	callba Function115dc3
	and a
	ret
; 11a357

Function11a357: ; 11a357
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a743
	call PlaceString
	ld a, $80
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable
; 11a36b

Function11a36b: ; 11a36b
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr z, .asm_11a377
	dec a
	ld [wMobileInactivityTimerMinutes], a
	scf
	ret

.asm_11a377
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a755
	call PlaceString
	call Function11a5f5
	xor a
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable
; 11a38d

Function11a38d: ; 11a38d
	call Function11a536
	ret c
	call PlayClickSFX
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr nz, .asm_11a3b1
	call ExitMenu
	callba ReloadMapPart
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	and a
	ret

.asm_11a3b1
	call ExitMenu
	callba ReloadMapPart
	ld a, [wMobileInactivityTimerSeconds]
	ld [wcf66], a
	ld [wcd80], a
	scf
	ret
; 11a3c5

Function11a3c5: ; 11a3c5
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a762
	call PlaceString
	ld a, $80
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable
; 11a3d9

Function11a3d9: ; 11a3d9
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr z, .asm_11a3e5
	dec a
	ld [wMobileInactivityTimerMinutes], a
	scf
	ret

.asm_11a3e5
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a779
	call PlaceString
	ld a, $80
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable
; 11a3f9

Function11a3f9: ; 11a3f9
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr z, .asm_11a405
	dec a
	ld [wMobileInactivityTimerMinutes], a
	scf
	ret

.asm_11a405
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a755
	call PlaceString
	call Function11a5f5
	xor a
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable
; 11a41b

Function11a41b: ; 11a41b
	call Function11a536
	ret c
	call PlayClickSFX
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr nz, .asm_11a43f
	call ExitMenu
	callba ReloadMapPart
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	and a
	ret

.asm_11a43f
	call ExitMenu
	callba ReloadMapPart
	ld a, $1c
	ld [wcf66], a
	ld [wcd80], a
	scf
	ret
; 11a452

Function11a452: ; 11a452
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a791
	call PlaceString
	ld a, $80
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable
; 11a466

Function11a466: ; 11a466
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a7c1
	call PlaceString
	ld a, $80
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable
; 11a47a

Function11a47a: ; 11a47a
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr z, .asm_11a486
	dec a
	ld [wMobileInactivityTimerMinutes], a
	scf
	ret

.asm_11a486
	and a
	ret
; 11a488

Function11a488: ; 11a488
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a7ac
	call PlaceString
	call Function11a5f5
	xor a
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable
; 11a49e

Function11a49e: ; 11a49e
	call Function11a536
	ret c
	call PlayClickSFX
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr nz, .asm_11a4c7
	call ExitMenu
	callba ReloadMapPart
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	ld a, $14
	ld [wcf66], a
	and a
	ret

.asm_11a4c7
	call ExitMenu
	callba ReloadMapPart
	ld a, [wMobileInactivityTimerFrames]
	ld [wcf66], a
	ld [wcd80], a
	scf
	ret
; 11a4db

Function11a4db: ; 11a4db
	call Function11a63c
	ld de, String_11a6db
	hlcoord 4, 2
	call PlaceString
	ret
; 11a4e8

Function11a4e8: ; 11a4e8
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a7d7
	call PlaceString
	call Function11a5f5
	xor a
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable
; 11a4fe

Function11a4fe: ; 11a4fe
	call Function11a536
	ret c
	call PlayClickSFX
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr nz, .asm_11a522
	call ExitMenu
	callba ReloadMapPart
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	and a
	ret

.asm_11a522
	call ExitMenu
	callba ReloadMapPart
	ld a, [wMobileInactivityTimerSeconds]
	ld [wcf66], a
	ld [wcd80], a
	scf
	ret
; 11a536

Function11a536: ; 11a536
	ld hl, hJoyPressed
	ld a, [hl]
	and $1
	jr nz, .asm_11a5a7
	ld a, [hl]
	and $2
	jr nz, .asm_11a5a2
	ld a, [hl]
	and $40
	jr nz, .asm_11a564
	ld a, [hl]
	and $80
	jr nz, .asm_11a583
.asm_11a54d
	ld a, [wcd3c]
	cp $4
	jr z, .asm_11a562
	call Function11a9f0
	jr nz, .asm_11a562
	call ExitMenu
	callba ReloadMapPart

.asm_11a562
	scf
	ret

.asm_11a564
	xor a
	ld [wcd8a], a
	ld [wcd8b], a
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr z, .asm_11a54d
	xor a
	ld [wMobileInactivityTimerMinutes], a
	hlcoord 15, 7
	ld a, $ed
	ld [hl], a
	hlcoord 15, 9
	ld a, $7f
	ld [hl], a
	jr .asm_11a54d

.asm_11a583
	xor a
	ld [wcd8a], a
	ld [wcd8b], a
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr nz, .asm_11a54d
	inc a
	ld [wMobileInactivityTimerMinutes], a
	hlcoord 15, 7
	ld a, $7f
	ld [hl], a
	hlcoord 15, 9
	ld a, $ed
	ld [hl], a
	jr .asm_11a54d

.asm_11a5a2
	ld a, $1
	ld [wMobileInactivityTimerMinutes], a

.asm_11a5a7
	xor a
	ld [wcd8a], a
	ld [wcd8b], a
	and a
	ret
; 11a5b0

BattleTowerRoomMenu2_IncrementJumptable: ; 11a5b0
	ld a, [wcd3c]
	inc a
	ld [wcd3c], a
	scf
	ret
; 11a5b9

Function11a5b9: ; 11a5b9
	xor a
	ld [wMenuBorderLeftCoord], a
	ld [wMenuBorderTopCoord], a
	ld a, $13
	ld [wMenuBorderRightCoord], a
	ld a, $5
	ld [wMenuBorderBottomCoord], a
	call PushWindow
	hlcoord 0, 0, AttrMap
	ld b, $6
	ld c, $14
	hlcoord 0, 0
	ld b, $4
	ld c, $12
	call Function3eea
	callba ReloadMapPart
	call UpdateSprites
	ld c, $0
	callba Function115e18
	ld a, $1
	ld [wc305], a
	ret
; 11a5f5

Function11a5f5: ; 11a5f5
	ld a, $e
	ld [wMenuBorderLeftCoord], a
	ld a, $13
	ld [wMenuBorderRightCoord], a
	ld a, $6
	ld [wMenuBorderTopCoord], a
	ld a, $a
	ld [wMenuBorderBottomCoord], a
	call PushWindow
	hlcoord 14, 6, AttrMap
	ld b, $5
	ld c, $6
	hlcoord 14, 6
	ld b, $3
	ld c, $4
	call Function3eea
	hlcoord 16, 7
	ld de, String_11a2cf
	call PlaceString
	hlcoord 16, 9
	ld de, String_11a2d3
	call PlaceString
	hlcoord 15, 7
	ld a, $ed
	ld [hl], a
	callba ReloadMapPart
	ret
; 11a63c

Function11a63c: ; 11a63c
	hlcoord 4, 1
	ld de, String_11a7f4
	call PlaceString
	hlcoord 4, 2
	ld de, String_11a7f4
	call PlaceString
	hlcoord 4, 3
	ld de, String_11a7f4
	call PlaceString
	hlcoord 4, 4
	ld de, String_11a7f4
	call PlaceString
	ret
; 11a661

String_11a661: ; 11a661
	db   "これから モバイルセンターに"
	next "でんわ", $1f, "かけます@"
; 11a679

String_11a679: ; 11a679
	db   "モバイルアダプタ", $25, "じゅんびは"
	next "できて いますか?@"
; 11a692

String_11a692: ; 11a692
	db   "でんわ", $1f, "かけています"
	next "しばらく おまちください@"
; 11a6aa

String_11a6aa: ; 11a6aa
	db   "でんわをかけると つうわりょう"
	next "せつぞくりょう", $4a, "かかります@"
; 11a6c8

String_11a6c8: ; 11a6c8
	db   "せつぞく しました@"
; 11a6d2

String_11a6d2: ; 11a6d2
	db   "つうしん ちゅう@"
; 11a6db

String_11a6db: ; 11a6db
	db   "つうしん ちゅう"
	next "セレクト エーでちゅうし@"
; 11a6f1

String_11a6f1: ; 11a6f1
	db   "この サービスには"
	next "つうわりょう", $25, "ほかに@"
; 11a706

String_11a706: ; 11a706
	db   "おかね", $4a, "@"
; 11a70b

String_11a70b: ; 11a70b
	db   "えん"
	next "かかります よろしい ですか?@"
; 11a71e

String_11a71e: ; 11a71e
	db   "つうしん しゅうりょう@"
; 11a72a

String_11a72a: ; 11a72a
	db   "つないだ じかん"
	next "  やく   ふん   びょう@"
; 11a743

String_11a743: ; 11a743
	db   "もっていない データが"
	next "あります!@"
; 11a755

String_11a755: ; 11a755
	db   "データ", $1f, "よみこみますか?@"
; 11a762

String_11a762: ; 11a762
	db   "おなじ データ", $1f, "よみこんだ"
	next "こと", $4a, "ありますが@"
; 11a779

String_11a779: ; 11a779
	db   "そのデータ", $24, "なくなっているか"
	next "こわれて います@"
; 11a791

String_11a791: ; 11a791
	db   "もっている データと"
	next "おなじデータしか ありません!@"
; 11a7ac

String_11a7ac: ; 11a7ac
	db   "データ", $25, "よみこみを"
	next "ちゅうし しますか?@"
; 11a7c1

String_11a7c1: ; 11a7c1 ; new news?
	db   "あたらしい ニュースは"
	next "ありません でした@"
; 11a7d7

String_11a7d7: ; 11a7d7
	db   "あたらしいニュース", $4a, "あります"
	next "ニュース", $1f, "よみこみますか?@"
; 11a7f4

String_11a7f4: ; 11a7f4
	db   "               @"
; 11a804

BattleTowerRoomMenu_WriteMessage: ; 11a8fa
	jumptable .Jumptable, $c31a
; 11a909

.Jumptable: ; 11a909
	dw BattleTowerRoomMenu_WriteMessage_DoNothing
	dw Function11a90f
	dw Function11a971
; 11a90f

Function11a90f: ; 11a90f
	ld a, $1
	ld [rSVBK], a
	call SpeechTextBox
	ld a, $50
	ld hl, $c320
	ld bc, $008c
	call ByteFill
	ld a, [$c31b]
	ld l, a
	ld a, [$c31c]
	ld h, a
	ld de, $c320
.asm_11a92c
	ld a, [hli]
	cp $57
	jr z, .asm_11a94f
	cp $0
	jr z, .asm_11a92c
	cp $50
	jr z, .asm_11a92c
	cp $1
	jr z, .asm_11a941
	ld [de], a
	inc de
	jr .asm_11a92c

.asm_11a941
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
.asm_11a945
	ld a, [bc]
	inc bc
	cp $50
	jr z, .asm_11a92c
	ld [de], a
	inc de
	jr .asm_11a945

.asm_11a94f
	xor a
	ld [$c31f], a
	ld a, $c320 % $100
	ld [$c31b], a
	ld a, $c320 / $100
	ld [$c31c], a
	hlcoord 1, 14
	ld a, l
	ld [$c31d], a
	ld a, h
	ld [$c31e], a
	ld hl, $c31a
	inc [hl]
	ld a, $3
	ld [rSVBK], a

BattleTowerRoomMenu_WriteMessage_DoNothing:
	ret
; 11a971

Function11a971: ; 11a971
	ld hl, $c31f
	ld a, [hJoyDown]
	and a
	jr nz, .asm_11a97f
	ld a, [hl]
	and a
	jr z, .asm_11a97f
	dec [hl]
	ret

.asm_11a97f
	ld a, [Options]
	and $7
	ld [hl], a
	ld hl, wcd8d
	ld a, [$c31b]
	ld e, a
	ld a, [$c31c]
	ld d, a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, e
	ld [$c31b], a
	ld a, d
	ld [$c31c], a
	ld a, $50
	ld [hl], a
	ld a, [$c31d]
	ld l, a
	ld a, [$c31e]
	ld h, a
	ld de, wcd8d
	call PlaceString
	ld a, c
	ld [$c31d], a
	ld a, b
	ld [$c31e], a
	ld a, [wcd8d]
	cp $50
	jr nz, .asm_11a9bf
	xor a
	ld [$c31a], a

.asm_11a9bf
	ret
; 11a9c0

BattleTowerRoomMenu_SetMessage: ; 11a9c0
	ld a, l
	ld [$c31b], a
	ld a, h
	ld [$c31c], a
	ld a, $1
	ld [$c31a], a
	ret
; 11a9ce

Function11a9ce: ; 11a9ce
	call ClearBGPalettes
	call ReloadTilesetAndPalettes
	call Call_ExitMenu
	callba MobileFunc_106462
	callba Function106464
	call ret_d90
	callba FinishExitMenu
	call UpdateSprites
	ret
; 11a9f0

Function11a9f0: ; 11a9f0
	ld a, $1
	and a
	ret
; 11a9f4

Text_QuitReadingNews: ; 0x11aa6a
	text "Quit reading NEWS?"
	done
; 0x11aa7e

Text_PartyMonTopsThisLevel: ; 0x11aaf0
	text "A party #MON"
	line "tops this level."
	done
; 0x11ab0f

Text_UberRestriction: ; 0x11ab0f
	text_from_ram wcd49
	text " may go"
	line "only to BATTLE"

	para "ROOMS that are"
	line "Lv.70 or higher."
	done
; 0x11ab4a

Text_CancelBattleRoomChallenge: ; 0x11ab4a
	text "Cancel your BATTLE"
	line "ROOM challenge?"
	done
; 0x11ab6e

Text_ExitGymLeaderHonorRoll: ; 0x11ab6e
	text "Exit GYM LEADER"
	line "HONOR ROLL?"
	done
; 0x11ab8b

Text_WhatLevelDoYouWantToChallenge: ; 0x11aba5
	text "What level do you"
	line "want to challenge?"
	done
; 0x11abcb

Text_CheckBattleRoomListByMaxLevel: ; 0x11abcb
	text "Check BATTLE ROOM"
	line "list by max level?"
	done
; 0x11abf1

Function11b6b4: ; 11b6b4
	ld a, $5
	call GetSRAMBank
	ld a, [wcd30]
	ld [$c708], a
	ld a, [wcd31]
	ld [$c709], a

	ld a, $c708 % $100
	ld [wMobileMonSpeciesPointerBuffer], a
	ld a, $c708 / $100
	ld [wMobileMonSpeciesPointerBuffer + 1], a

	ld a, $c60d % $100 ; Partymon Struct
	ld [wMobileMonStructurePointerBuffer], a
	ld a, $c60d / $100
	ld [wMobileMonStructurePointerBuffer + 1], a

	ld a, $c63d % $100 ; OT
	ld [wMobileMonOTNamePointerBuffer], a
	ld a, $c63d / $100
	ld [wMobileMonOTNamePointerBuffer + 1], a

	ld a, $c642 % $100 ; Nickname
	ld [wMobileMonNicknamePointerBuffer], a
	ld a, $c642 / $100
	ld [wMobileMonNicknamePointerBuffer + 1], a

	ld a, $c647 % $100 ; ???
	ld [wMobileMonMailPointerBuffer], a
	ld a, $c647 / $100
	ld [wMobileMonMailPointerBuffer + 1], a

	ld a, $46
	ld [$c628], a

	ld de, $c63d
	ld c, 5
	callba CheckStringForErrors
	jr nc, .length_check_OT
	callba Mobile_CopyDefaultOTName

.length_check_OT
	ld de, $c63d
	lb bc, 1, 5
	callba CheckStringContainsLessThanBNextCharacters
	jr nc, .error_check_nick
	callba Mobile_CopyDefaultOTName

.error_check_nick
	ld de, $c642
	ld c, 5
	callba CheckStringForErrors
	jr nc, .length_check_nick
	callba Mobile_CopyDefaultNickname

.length_check_nick
	ld de, $c642
	lb bc, 1, 5
	callba CheckStringContainsLessThanBNextCharacters
	jr nc, .error_check_mail
	callba Mobile_CopyDefaultNickname

.error_check_mail
	ld de, $c647
	ld c, MAIL_MSG_LENGTH + 1
	callba CheckStringForErrors
	jr nc, .length_check_mail
	callba Mobile_CopyDefaultMail

.length_check_mail
	ld de, $c647
	lb bc, 2, MAIL_MSG_LENGTH + 1
	callba CheckStringContainsLessThanBNextCharacters
	jr c, .fix_mail
	ld a, b
	cp $2
	jr nz, .mail_ok

.fix_mail
	callba Mobile_CopyDefaultMail

.mail_ok
	ld de, $c668
	ld c, $5
	callba CheckStringForErrors
	jr nc, .length_check_author
	callba Mobile_CopyDefaultMailAuthor

.length_check_author
	ld de, $c668
	lb bc, 1, 5
	callba CheckStringContainsLessThanBNextCharacters
	jr nc, .author_okay
	callba Mobile_CopyDefaultMailAuthor

.author_okay
	ld a, [$c60e]
	cp -1
	jr nz, .item_okay
	xor a
	ld [$c60e], a

.item_okay
	ld a, [wcd31]
	ld [$c60d], a
	ld [CurSpecies], a
	call GetBaseData

	ld hl, $c60d + MON_LEVEL
	ld a, [hl]
	cp MIN_LEVEL
	ld a, MIN_LEVEL
	jr c, .replace_level
	ld a, [hl]
	cp MAX_LEVEL
	jr c, .done_level
	ld a, MAX_LEVEL
.replace_level
	ld [hl], a
.done_level
	ld [CurPartyLevel], a

	ld hl, $c60d + MON_STAT_EXP - 1
	ld de, $c60d + MON_MAXHP
	ld b, $1
	predef CalcPkmnStats
	ld de, $c60d + MON_MAXHP
	ld hl, $c60d + MON_HP
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	call AddMobileMonToParty
	ret
; 11b7e5

AddMobileMonToParty: ; 11b98f
	ld hl, PartyCount
	ld a, [hl]
	ld e, a
	inc [hl]

	ld a, [wMobileMonSpeciesPointerBuffer]
	ld l, a
	ld a, [wMobileMonSpeciesPointerBuffer + 1]
	ld h, a
	inc hl
	ld bc, PartySpecies
	ld d, e
.loop1
	inc bc
	dec d
	jr nz, .loop1
	ld a, e
	ld [CurPartyMon], a
	ld a, [hl]
	ld [bc], a
	inc bc
	ld a, -1
	ld [bc], a

	ld hl, PartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, e
	ld [wMobileMonSpeciesBuffer], a
.loop2
	add hl, bc
	dec a
	and a
	jr nz, .loop2
	ld e, l
	ld d, h
	ld a, [wMobileMonStructurePointerBuffer]
	ld l, a
	ld a, [wMobileMonStructurePointerBuffer + 1]
	ld h, a
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes

	ld hl, PartyMonOT
	ld bc, NAME_LENGTH
	ld a, [wMobileMonSpeciesBuffer]
.loop3
	add hl, bc
	dec a
	and a
	jr nz, .loop3
	ld e, l
	ld d, h
	ld a, [wMobileMonOTNamePointerBuffer]
	ld l, a
	ld a, [wMobileMonOTNamePointerBuffer + 1]
	ld h, a
	ld bc, PKMN_NAME_LENGTH - 1
	call CopyBytes
	ld a, "@"
	ld [de], a

	ld hl, PartyMonNicknames
	ld bc, PKMN_NAME_LENGTH
	ld a, [wMobileMonSpeciesBuffer]
.loop4
	add hl, bc
	dec a
	and a
	jr nz, .loop4
	ld e, l
	ld d, h
	ld a, [wMobileMonNicknamePointerBuffer]
	ld l, a
	ld a, [wMobileMonNicknamePointerBuffer + 1]
	ld h, a
	ld bc, PKMN_NAME_LENGTH - 1
	call CopyBytes
	ld a, "@"
	ld [de], a

	ld hl, sPartyMail
	ld bc, MAIL_STRUCT_LENGTH
	ld a, [wMobileMonSpeciesBuffer]
.loop5
	add hl, bc
	dec a
	and a
	jr nz, .loop5
	ld a, BANK(sPartyMail)
	call GetSRAMBank
	ld e, l
	ld d, h
	ld a, [wMobileMonMailPointerBuffer]
	ld l, a
	ld a, [wMobileMonMailPointerBuffer + 1]
	ld h, a
	ld bc, MAIL_STRUCT_LENGTH
	call CopyBytes

	call CloseSRAM
	ret
; 11ba38
