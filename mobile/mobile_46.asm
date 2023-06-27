Function118000:
	ld a, $1
	ld [wcd38], a
	jr asm_11800b

Function118007:
	xor a
	ld [wcd38], a

asm_11800b:
	call BattleTowerRoomMenu_InitRAM
	ld a, $18
	ld [wcd33], a
	ld a, $19
	ld [wcd34], a
	ld a, $4
	ld [wc3f0], a
	ldh a, [rSVBK]
	push af
	ld a, $3
	ldh [rSVBK], a
.loop
	call JoyTextDelay
	call Function118473
	ld a, [wBattleTowerRoomMenuJumptableIndex]
	cp $1b
	jr c, .skip
	ld a, [wcd34]
	ld [wBattleTowerRoomMenuJumptableIndex], a

.skip
	call Function1184a5
	call BattleTowerRoomMenu_WriteMessage
	farcall Function115dd3
	farcall Function11619d
	call DelayFrame
	ld a, [wBattleTowerRoomMenuJumptableIndex]
	ld hl, wcd33
	cp [hl]
	jr nz, .loop
	pop af
	ldh [rSVBK], a
	call BattleTowerRoomMenu_Cleanup
	call ReturnToMapFromSubmenu
BattleTowerRoomMenu_DoNothing:
	ret

Function11805f:
	ld a, $1
	ld [wcd38], a
	call BattleTowerRoomMenu_InitRAM
	ld a, $18
	ld [wcd33], a
	ld a, $19
	ld [wcd34], a
	ld a, $4
	ld [wc3f0], a
	ldh a, [rSVBK]
	push af
	ld a, $3
	ldh [rSVBK], a
.asm_11807d
	call JoyTextDelay
	call Function118473
	ld a, [wBattleTowerRoomMenuJumptableIndex]
	cp $1b
	jr c, .asm_118090
	ld a, [wcd34]
	ld [wBattleTowerRoomMenuJumptableIndex], a

.asm_118090
	call Function11857c
	call BattleTowerRoomMenu_WriteMessage
	farcall Function115dd3
	farcall Function11619d
	call DelayFrame
	ld a, [wBattleTowerRoomMenuJumptableIndex]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_11807d
	pop af
	ldh [rSVBK], a
	call BattleTowerRoomMenu_Cleanup
	call ReturnToMapFromSubmenu
	ret

Function1180b8:
	call BattleTowerRoomMenu_InitRAM
	ld a, $22
	ld [wcd33], a
	ld a, $23
	ld [wcd34], a
	ld a, $4
	ld [wc3f0], a
	ldh a, [rSVBK]
	push af
	ld a, $3
	ldh [rSVBK], a
.asm_1180d1
	call JoyTextDelay
	call Function118473
	ld a, [wBattleTowerRoomMenuJumptableIndex]
	cp $28
	jr c, .asm_1180e4
	ld a, [wcd34]
	ld [wBattleTowerRoomMenuJumptableIndex], a

.asm_1180e4
	ld a, [wBattleTowerRoomMenuJumptableIndex]
	cp $10
	jr c, .asm_1180f2
	cp $16
	jr nc, .asm_1180f2
	call Function11884c

.asm_1180f2
	call Function1184ec
	call BattleTowerRoomMenu_WriteMessage
	farcall Function115dd3
	farcall Function11619d
	call DelayFrame
	ld a, [wBattleTowerRoomMenuJumptableIndex]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_1180d1
	pop af
	ldh [rSVBK], a
	call BattleTowerRoomMenu_Cleanup
	call ReturnToMapFromSubmenu
	ret

Function11811a:
	ld a, 1
	ld [wcd38], a
	jr Function118125

_BattleTowerRoomMenu:
	xor a
	ld [wcd38], a
Function118125:
	call BattleTowerRoomMenu_InitRAM
	ld a, $3
	ld [wcd33], a
	ld a, $d
	ld [wcd34], a
	ld a, $4
	ld [wc3f0], a
	ldh a, [rSVBK]
	push af
	ld a, $3
	ldh [rSVBK], a
.loop
	call JoyTextDelay
	call Function118473
	ld a, [wBattleTowerRoomMenuJumptableIndex]
	cp $f
	jr c, .skip
	ld a, [wcd34]
	ld [wBattleTowerRoomMenuJumptableIndex], a
.skip
	call BattleTowerRoomMenu_Jumptable
	call BattleTowerRoomMenu_WriteMessage
	farcall Function115dd3
	farcall Function11619d
	call DelayFrame
	ld a, [wBattleTowerRoomMenuJumptableIndex]
	ld hl, wcd33
	cp [hl]
	jr nz, .loop
	xor a
	ld [w3_d000], a
	pop af
	ldh [rSVBK], a
	call BattleTowerRoomMenu_Cleanup
	call Function118180
	call ReturnToMapFromSubmenu
	ret

Function118180:
	ld a, [wScriptVar]
	and a
	ret nz
	ld a, [wcd38]
	and a
	ret z
	ld a, BANK(s5_a89c) ; aka BANK(s5_a8b2)
	call OpenSRAM
	ld hl, wcd69
	ld de, s5_a89c
	ld bc, 22
	call CopyBytes

	ldh a, [rSVBK]
	push af
	ld a, BANK(w3_d202)
	ldh [rSVBK], a

	ld de, w3_d202
	ld c, $96
	farcall CheckStringForErrors_IgnoreTerminator
	jr c, .return_d3

	ld de, w3_d202
	lb bc, 1, $96
	farcall CheckStringContainsLessThanBNextCharacters
	jr c, .return_d3

	ld hl, w3_d202
	ld de, s5_a8b2
	ld bc, 150
	call CopyBytes
.reset_banks
	pop af
	ldh [rSVBK], a
	call CloseSRAM
	ret

.return_d3
	ld a, $d3
	ld [wMobileErrorCodeBuffer], a
	ld [wScriptVar], a
	jr .reset_banks

Function1181da:
	call BattleTowerRoomMenu_InitRAM
	ld a, $2
	ld [wcd38], a
	ld a, $21
	ld [wcd33], a
	ld a, $22
	ld [wcd34], a
	ld a, $4
	ld [wc3f0], a
	ldh a, [rSVBK]
	push af
	ld a, $3
	ldh [rSVBK], a
.asm_1181f8
	call JoyTextDelay
	call Function118473
	ld a, [wBattleTowerRoomMenuJumptableIndex]
	cp $28
	jr c, .asm_11820b
	ld a, [wcd34]
	ld [wBattleTowerRoomMenuJumptableIndex], a

.asm_11820b
	call Function1185c3
	call BattleTowerRoomMenu_WriteMessage
	farcall Function115dd3
	farcall Function11619d
	call DelayFrame
	ld a, [wBattleTowerRoomMenuJumptableIndex]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_1181f8
	pop af
	ldh [rSVBK], a
	call BattleTowerRoomMenu_Cleanup
	call ReturnToMapFromSubmenu
	ret

Function118233:
	call BattleTowerRoomMenu_InitRAM
	ld a, $1b
	ld [wcd33], a
	ld a, $1c
	ld [wcd34], a
	ld a, $6
	ld [wc3f0], a
	ldh a, [rSVBK]
	push af
	ld a, $3
	ldh [rSVBK], a
.asm_11824c
	call JoyTextDelay
	call Function118473
	ld a, [wBattleTowerRoomMenuJumptableIndex]
	cp $1e
	jr c, .asm_11825f
	ld a, [wcd34]
	ld [wBattleTowerRoomMenuJumptableIndex], a

.asm_11825f
	call Function118624
	call BattleTowerRoomMenu_WriteMessage
	farcall Function115dd3
	farcall Function11619d
	call DelayFrame
	ld a, [wBattleTowerRoomMenuJumptableIndex]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_11824c
	pop af
	ldh [rSVBK], a
	call BattleTowerRoomMenu_Cleanup
	ret

Function118284:
	call BattleTowerRoomMenu_InitRAM
	ld a, $19
	ld [wcd33], a
	ld a, $1e
	ld [wcd34], a
	ld a, $5
	ld [wc3f0], a
	ldh a, [rSVBK]
	push af
	ld a, $3
	ldh [rSVBK], a
.asm_11829d
	call JoyTextDelay
	call Function118473
	ld a, [wBattleTowerRoomMenuJumptableIndex]
	cp $20
	jr c, .asm_1182b0
	ld a, [wcd34]
	ld [wBattleTowerRoomMenuJumptableIndex], a
.asm_1182b0
	call Function1186f5
	call BattleTowerRoomMenu_WriteMessage
	farcall Function115dd3
	farcall Function11619d
	call DelayFrame
	ld a, [wBattleTowerRoomMenuJumptableIndex]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_11829d
	pop af
	ldh [rSVBK], a
	call BattleTowerRoomMenu_Cleanup
	ret

Function1182d5: ; unreferenced
	call BattleTowerRoomMenu_InitRAM
	ld a, $18
	ld [wcd33], a
	ld a, $19
	ld [wcd34], a
	ld a, $4
	ld [wc3f0], a
	ldh a, [rSVBK]
	push af
	ld a, $3
	ldh [rSVBK], a
.asm_1182ee
	call JoyTextDelay
	call Function118473
	ld a, [wBattleTowerRoomMenuJumptableIndex]
	cp $1b
	jr c, .asm_118301
	ld a, [wcd34]
	ld [wBattleTowerRoomMenuJumptableIndex], a

.asm_118301
	call Function118746
	call BattleTowerRoomMenu_WriteMessage
	farcall Function115dd3
	farcall Function11619d
	call DelayFrame
	ld a, [wBattleTowerRoomMenuJumptableIndex]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_1182ee
	pop af
	ldh [rSVBK], a
	call BattleTowerRoomMenu_Cleanup
	call ReturnToMapFromSubmenu
	ret

Function118329:
	call BattleTowerRoomMenu_InitRAM
	ld a, $15
	ld [wcd33], a
	ld a, $16
	ld [wcd34], a
	ld a, $6
	ld [wc3f0], a
	ldh a, [rSVBK]
	push af
	ld a, $3
	ldh [rSVBK], a
.asm_118342
	call JoyTextDelay
	call Function118473
	ld a, [wBattleTowerRoomMenuJumptableIndex]
	cp $18
	jr c, .asm_118355
	ld a, [wcd34]
	ld [wBattleTowerRoomMenuJumptableIndex], a

.asm_118355
	call Function118671
	call BattleTowerRoomMenu_WriteMessage
	farcall Function115dd3
	farcall Function11619d
	call DelayFrame
	ld a, [wBattleTowerRoomMenuJumptableIndex]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_118342
	pop af
	ldh [rSVBK], a
	call BattleTowerRoomMenu_Cleanup
	ret

Function11837a:
	call BattleTowerRoomMenu_InitRAM
	ld a, $16
	ld [wcd33], a
	ld a, $17
	ld [wcd34], a
	ld a, $6
	ld [wc3f0], a
	ldh a, [rSVBK]
	push af
	ld a, $3
	ldh [rSVBK], a
.asm_118393
	call JoyTextDelay
	call Function118473
	ld a, [wBattleTowerRoomMenuJumptableIndex]
	cp $19
	jr c, .asm_1183a6
	ld a, [wcd34]
	ld [wBattleTowerRoomMenuJumptableIndex], a

.asm_1183a6
	call Function1186b2
	call BattleTowerRoomMenu_WriteMessage
	farcall Function115dd3
	farcall Function11619d
	call DelayFrame
	ld a, [wBattleTowerRoomMenuJumptableIndex]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_118393
	pop af
	ldh [rSVBK], a
	call BattleTowerRoomMenu_Cleanup
	ret

BattleTowerRoomMenu_InitRAM:
	di
	ldh a, [rIE]
	ld [wcd32], a
	call DoubleSpeed
	xor a
	ldh [rIF], a
	ld [wMobileErrorCodeBuffer], a
	ld [wMobileErrorCodeBuffer + 1], a
	ld [wMobileErrorCodeBuffer + 2], a
	ld [wcd80], a
	ld [wcd65], a
	ld [wcd66], a
	ld [wcd67], a
	ld [wcd68], a
	ld [wc31a], a
	ld [wcd89], a
	ld [wcd8a], a
	ld [wcd8b], a
	ld [wc3ec], a
	ld [wc3ed], a
	ld [wc3ee], a
	ld [wc3ef], a
	ld hl, wVramState
	ld a, [hl]
	ld [wcd7f], a
	set 1, [hl]
	ld a, (1 << SERIAL) | (1 << TIMER) | (1 << LCD_STAT) | (1 << VBLANK)
	ldh [rIE], a
	ld a, $1
	ldh [hMobileReceive], a
	ldh [hMobile], a
	ei
	farcall Stubbed_Function106462
	farcall Function106464
	farcall Function115d99
	farcall Function11615a
	ld a, BANK(s5_bfff)
	call OpenSRAM
	xor a
	ld [s5_bfff], a
	call CloseSRAM
	ret

Function118440:
	push af
	ld a, BANK(s5_bfff)
	call OpenSRAM
	ld a, [s5_bfff]
	inc a
	ld [s5_bfff], a
	call CloseSRAM
	pop af
	ret

BattleTowerRoomMenu_Cleanup:
	di
	xor a
	ldh [hMobileReceive], a
	ldh [hMobile], a
	ldh [hVBlank], a
	call NormalSpeed
	xor a
	ldh [rIF], a
	ld a, [wcd32]
	ldh [rIE], a
	ei
	ld a, [wcd7f]
	ld [wVramState], a
	ld a, [wMobileErrorCodeBuffer]
	ld [wScriptVar], a
	ret

Function118473:
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

Function1184a5:
	jumptable .Jumptable, wBattleTowerRoomMenuJumptableIndex

.Jumptable:
	dw Function11886e
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
	dw SetExchangeDownloadURL
	dw Function11878d
	dw Function118d80
	dw Function118d9b
	dw Function11878d
	dw Function118ded
	dw Function118e6d
	dw Function11878d
	dw Function11984e
	dw Function118e76
	dw Function118e7e
	dw Function11878d
	dw BattleTowerRoomMenu_DoNothing
	dw Function118e76
	dw BattleTowerRoomMenu_CallRoomMenu2
	dw Function118e76

Function1184ec:
	jumptable .Jumptable, wBattleTowerRoomMenuJumptableIndex

.Jumptable:
	dw Function11886e
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
	dw Function119954
	dw Function11878d
	dw Function119973
	dw Function11878d
	dw Function119987
	dw Function11878d
	dw Function1199b4
	dw Function1199ca
	dw Function11878d
	dw Function1199e2
	dw Function119b0d
	dw Function11878d
	dw Function119b6b
	dw Function119b3b
	dw Function11878d
	dw Function119b52
	dw Function11878d
	dw Function118e6d
	dw Function11878d
	dw Function118e76
	dw Function118e7e
	dw Function11878d
	dw BattleTowerRoomMenu_DoNothing
	dw Function118e76
	dw BattleTowerRoomMenu_CallRoomMenu2
	dw Function119b45
	dw Function11878d
	dw Function119ac9
	dw Function118e76

BattleTowerRoomMenu_Jumptable:
	jumptable .Jumptable, wBattleTowerRoomMenuJumptableIndex

.Jumptable:
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

Function11857c:
	jumptable .Jumptable, wBattleTowerRoomMenuJumptableIndex

.Jumptable:
	dw Function11886e
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
	dw SetBattleDownloadURL
	dw Function11878d
	dw Function11891c
	dw Function1198ee
	dw Function1198f7
	dw Function11878d
	dw Function119937
	dw Function118e6d
	dw Function11878d
	dw Function118e76
	dw Function118e7e
	dw Function11878d
	dw BattleTowerRoomMenu_DoNothing
	dw Function118e76
	dw BattleTowerRoomMenu_CallRoomMenu2
	dw Function118e76

Function1185c3:
	jumptable .Jumptable, wBattleTowerRoomMenuJumptableIndex

.Jumptable:
	dw Function11886e
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
	dw SetNewsDownloadURL
	dw Function11878d
	dw Function118e92
	dw Function11878d
	dw Function118eb0
	dw Function118ec6
	dw Function118f0d
	dw Function118f14
	dw Function118f5e
	dw Function11878d
	dw Function118fc0
	dw Function11878d
	dw Function119054
	dw Function1190d0
	dw Function11878d
	dw Function1190ec
	dw Function118e6d
	dw Function11878d
	dw Function118e76
	dw Function118e7e
	dw Function11878d
	dw BattleTowerRoomMenu_DoNothing
	dw Function118e76
	dw BattleTowerRoomMenu_CallRoomMenu2
	dw BattleTowerRoomMenu_QuitMessage
	dw BattleTowerRoomMenu_PlaceYesNoMenu
	dw BattleTowerRoomMenu_UpdateYesNoMenu
	dw Function11914e
	dw Function118e76

Function118624:
	jumptable .Jumptable, wBattleTowerRoomMenuJumptableIndex

.Jumptable:
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
	dw SetNewsDownloadURL
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

Function118671:
	jumptable .Jumptable, wBattleTowerRoomMenuJumptableIndex

.Jumptable:
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

Function1186b2:
	jumptable .Jumptable, wBattleTowerRoomMenuJumptableIndex

.Jumptable:
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

Function1186f5:
	jumptable .Jumptable, wBattleTowerRoomMenuJumptableIndex

.Jumptable:
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
	dw SetStadiumDownloadURL
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

Function118746:
	jumptable .Jumptable, wBattleTowerRoomMenuJumptableIndex

.Jumptable:
	dw Function11886e
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
	dw SetOddEggDownloadURL
	dw Function11878d
	dw Function1196f2
	dw Function1197c9
	dw Function1197dc
	dw Function11878d
	dw Function118e6d
	dw Function11878d
	dw Function119800
	dw Function118e76
	dw Function118e7e
	dw Function11878d
	dw BattleTowerRoomMenu_DoNothing
	dw Function118e76
	dw BattleTowerRoomMenu_CallRoomMenu2
	dw Function118e76

Function11878d:
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
	ldh [rSVBK], a
.asm_1187a7
	jp BattleTowerRoomMenu_IncrementJumptable
.asm_1187aa
	call Function118821
	ret c
	ret
.asm_1187af
	ld a, MOBILEAPI_00
	call MobileAPI
	ld [wMobileErrorCodeBuffer], a
	ld a, l
	ld [wMobileErrorCodeBuffer + 1], a
	ld a, h
	ld [wMobileErrorCodeBuffer + 2], a
	ld a, MOBILEAPI_05
	call MobileAPI
	ld a, [wc3f0]
	ld [wc319], a
	ld a, [wcd34]
	ld [wBattleTowerRoomMenuJumptableIndex], a
	ret
.asm_1187d1
	ld hl, wcd89
	bit 0, [hl]
	jr nz, .asm_118803
	set 0, [hl]
	ld a, BANK(w6_d000)
	ldh [rSVBK], a
	ld de, w6_d000
	ld bc, $1000
	ld a, [hl]
	sla a
	jr c, .asm_1187f9
	sla a
	jr c, .asm_1187fd
	sla a
	jr c, .asm_1187f5
	ld a, MOBILEAPI_12
	jr .asm_1187ff
.asm_1187f5
	ld a, MOBILEAPI_14
	jr .asm_1187ff
.asm_1187f9
	ld a, MOBILEAPI_15
	jr .asm_1187ff
.asm_1187fd
	ld a, MOBILEAPI_16
.asm_1187ff
	call MobileAPI
	ret
.asm_118803
	ld a, $d3

SetMobileErrorCode:
	ld [wMobileErrorCodeBuffer], a
	xor a
	ld [wMobileErrorCodeBuffer + 1], a
	ld [wMobileErrorCodeBuffer + 2], a
	ld a, MOBILEAPI_05
	call MobileAPI
	ld a, [wc3f0]
	ld [wc319], a
	ld a, [wcd34]
	ld [wBattleTowerRoomMenuJumptableIndex], a
	ret

Function118821:
	ld a, [wc319]
	cp $3
	jr c, .asm_11884a
	cp $4
	jr z, .asm_11884a
	ldh a, [hJoyDown]
	cp $5
	jr nz, .asm_11884a
	ld a, MOBILEAPI_05
	call MobileAPI
	ld a, $a
	ld [wMobileErrorCodeBuffer], a
	ld a, [wc3f0]
	ld [wc319], a
	ld a, [wcd34]
	ld [wBattleTowerRoomMenuJumptableIndex], a
	scf
	ret
.asm_11884a
	and a
	ret

Function11884c:
	ldh a, [hJoyDown]
	cp $5
	jr nz, .asm_118864
	ld a, MOBILEAPI_05
	call MobileAPI
	ld a, $a
	ld [wMobileErrorCodeBuffer], a
	ld a, [wcd34]
	ld [wBattleTowerRoomMenuJumptableIndex], a
	scf
	ret

.asm_118864
	and a
	ret

Function118866:
	ld a, 2
	jr asm_11886f

Function11886a:
	ld a, 1
	jr asm_11886f

Function11886e:
	xor a

asm_11886f:
	ld [wBGMapPalBuffer], a
	ld a, $0
	ld [wBattleTowerRoomMenu2JumptableIndex], a
	call BattleTowerRoomMenu_IncrementJumptable
	ld a, [wcd33]
	ld [wMobileInactivityTimerSeconds], a

Function118880:
	call BattleTowerRoomMenu2
	ret c
	xor a
	ld [wcf64], a
	ld [wc807], a
	ld de, wcd81
	ld hl, $46
	ld a, MOBILEAPI_01
	jp Function119e2b

Function118896: ; unreferenced
	ld a, [wc821]
	bit 1, a
	jr nz, .asm_1188a5
	bit 2, a
	jr nz, .asm_1188a5
	bit 0, a
	jr z, .asm_1188aa

.asm_1188a5
	ld a, MOBILEAPI_1A
	jp Function119e2b

.asm_1188aa
	call BattleTowerRoomMenu_IncrementJumptable
	jp BattleTowerRoomMenu_IncrementJumptable

Function1188b0:
	ld de, wc346
	ld a, MOBILEAPI_06
	jp Function119e2b

Function1188b8:
	ld de, wc3ac
	ld a, MOBILEAPI_07
	jp Function119e2b

Function1188c0:
	ld de, wEmailAddress
	ld a, MOBILEAPI_08
	jp Function119e2b

Function1188c8:
	ld a, $1
	ld [wcd65], a
	call Function1188e7
	ld hl, wc708
.asm_1188d3
	ld a, [de]
	inc de
	ld [hli], a
	and a
	jr nz, .asm_1188d3
	call Function119eb4
	call Function119ec2
	ld hl, wc708
	ld a, MOBILEAPI_03
	jp Function119e2b

Function1188e7:
	ld de, wc346
	ld a, BANK(s5_aa4a)
	call OpenSRAM
	ld a, [s5_aa4a]
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

Function118903:
	ld a, [wc3f0]
	ld [wc319], a
	ld c, $1
	farcall Function115e18
	ld a, $8
	ld [wBattleTowerRoomMenu2JumptableIndex], a
	call BattleTowerRoomMenu2
	jp BattleTowerRoomMenu_IncrementJumptable

Function11891c:
	call Function118b42
	jp BattleTowerRoomMenu_IncrementJumptable

BattleTowerRoomMenu_PickLevelMessage:
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
	ld a, [wc31a]
	and a
	ret nz
	ld hl, MenuHeader_119cf7
	call LoadMenuHeader
	call MenuBox
	call MenuBoxCoord2Tile
	call ApplyTilemap
	hlcoord 16, 8, wAttrmap
	ld a, $40
	or [hl]
	ld [hl], a
	call WaitBGMap2
	ld a, $1
	ld [wcd4f], a
	ld a, $1
	ldh [rSVBK], a
	ld a, [wStatusFlags]
	bit STATUSFLAGS_HALL_OF_FAME_F, a
	jr nz, .asm_11896b
	ld hl, Strings_Ll0ToL40 ; Address to list of strings with the choosable levels
	ld a, 5                 ; 4 levels to choose from, including 'Cancel'-option
	jr .asm_118970

.asm_11896b
	ld hl, Strings_L10ToL100 ; Address to list of strings with the choosable levels
	ld a, 11                 ; 10 levels to choose from, including 'Cancel'-option

.asm_118970
	ld [wcd4a], a
	ld a, l
	ld [wcd4b], a
	ld a, h
	ld [wcd4c], a
	ld a, $3
	ldh [rSVBK], a
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
	ldh a, [rSVBK]
	push af
	ld a, $1
	ldh [rSVBK], a
	ld bc, wStringBuffer3
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
	ldh [rSVBK], a
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
	ldh a, [rSVBK]
	push af
	ld a, $1
	ldh [rSVBK], a
	call CloseWindow
	pop af
	ldh [rSVBK], a
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
	ldh a, [rSVBK]
	push af
	ld a, $1
	ldh [rSVBK], a
	call CloseWindow
	pop af
	ldh [rSVBK], a
	ld a, $7
	ld [wBattleTowerRoomMenuJumptableIndex], a
	ld a, $0
	ld [wMobileInactivityTimerFrames], a
	ret

Function118a54: ; unreferenced
	ld a, [wcd55]
	ld l, a
	ld a, [wcd56]
	ld h, a
	ld de, wc3ec
	ld bc, $0004
	jp Function118ae4

Function118a65: ; unreferenced
	ld hl, BattleDownloadURL
	ld de, wcc60
	ld bc, $80
	call CopyBytes
	ld de, w3_d000
	ld bc, $1000
	jp Function118b10

SetBattleDownloadURL:
	ld hl, BattleDownloadURL
	ld de, wcc60
	ld bc, $80
	call CopyBytes
	ld de, w3_d000
	ld bc, $1000
	jp Function118b10

SetExchangeDownloadURL:
	ld hl, ExchangeDownloadURL
	ld de, wcc60
	ld bc, $80
	call CopyBytes
	ld de, w3_d000
	ld bc, $1000
	jp Function118b10

SetNewsDownloadURL:
	ld hl, NewsDownloadURL
	ld de, wcc60
	ld bc, $80
	call CopyBytes
	ld a, $5
	ldh [rSVBK], a
	ld de, w3_d100
	ld bc, $e00
	jr Function118b10

SetStadiumDownloadURL:
	ld hl, StadiumDownloadURL
	ld de, wcc60
	ld bc, $80
	call CopyBytes
	ld de, w3_d000
	ld bc, $1000
	jr Function118b10

SetOddEggDownloadURL:
	ld hl, OddEggDownloadURL
	ld de, wcc60
	ld bc, $80
	call CopyBytes
	ld de, w3_d000
	ld bc, $1000
	jr Function118b10

Function118ae4:
	push bc
	push de
	push hl
	ld a, $8
	ld [wBattleTowerRoomMenu2JumptableIndex], a
	call BattleTowerRoomMenu2
	pop hl
	ld c, $0
	ld de, wcc60
.asm_118af5
	ld a, [hli]
	ld [de], a
	inc de
	and a
	jr z, .asm_118b06
	inc c
	ld a, c
	cp $a6
	jr c, .asm_118af5
	ld a, $da
	jp SetMobileErrorCode

.asm_118b06
	call Function118b24
	pop de
	pop bc
	ld a, MOBILEAPI_15
	jp Function119e2b

Function118b10:
	push de
	push bc
	ld a, $8
	ld [wBattleTowerRoomMenu2JumptableIndex], a
	call BattleTowerRoomMenu2
	call Function118b24
	pop bc
	pop de
	ld a, MOBILEAPI_15
	jp Function119e2b

Function118b24:
	ld hl, wc346
	ld a, LOW(wc708)
	ld [hli], a
	ld a, HIGH(wc708)
	ld [hli], a
	ld a, LOW(wcc60)
	ld [hli], a
	ld a, HIGH(wcc60)
	ld [hli], a
	call Function119eb4
	call Function119ec2
	ld a, $80
	ld [wcd89], a
	ld hl, wc346
	ret

Function118b42:
	ld hl, wd002
	ld a, l
	ld [wcd51], a
	ld a, h
	ld [wcd52], a
	call Function118b8c
	ld a, l
	ld [wcd55], a
	ld [wcd59], a
	ld a, h
	ld [wcd56], a
	ld [wcd5a], a
	call Function118b8c
	ld a, l
	ld [wcd53], a
	ld [wcd5d], a
	ld a, h
	ld [wcd54], a
	ld [wcd5e], a
	call Function118b8c
	ld a, l
	ld [wcd57], a
	ld [wcd5b], a
	ld a, h
	ld [wcd58], a
	ld [wcd5c], a
	call Function118b8c
	ld a, l
	ld [wcd5f], a
	ld a, h
	ld [wcd60], a
	ret

Function118b8c:
.asm_118b8c
	call Function118b9a
	ret nc
	ld a, [hli]
	cp $d
	jr nz, .asm_118b8c
	dec hl
	xor a
	ld [hli], a
	ld [hli], a
	ret

Function118b9a:
	ld a, h
	cp $e0
	ret c
	ld a, $d3
	call SetMobileErrorCode
	and a
	ret

pushc
setcharmap ascii

ExchangeDownloadURL:
	db "http://gameboy.datacenter.ne.jp/cgb/download?name=/01/CGB-BXTJ/exchange/index.txt", 0

BattleDownloadURL:
	db "http://gameboy.datacenter.ne.jp/cgb/download?name=/01/CGB-BXTJ/battle/index.txt", 0

NewsDownloadURL:
	db "http://gameboy.datacenter.ne.jp/cgb/download?name=/01/CGB-BXTJ/news/index.txt", 0

StadiumDownloadURL:
	db "http://gameboy.datacenter.ne.jp/cgb/download?name=/01/CGB-BXTJ/POKESTA/menu.cgb", 0

OddEggDownloadURL:
	db "http://gameboy.datacenter.ne.jp/cgb/download?name=/01/CGB-BXTJ/tamago/index.txt", 0

popc

Function118d35: ; unreferenced
	ld hl, $d200
	ld a, [wcd38]
	and a
	jr nz, .asm_118d6e
	ld a, [hli]
	cp $94
	jr nz, .asm_118d7b
	ld a, [hl]
	cp $5
	jr nz, .asm_118d7b
	ld a, [wcd4f]
	sla a
	ld b, a
	sla a
	sla a
	add b
	ld b, a
	ld a, BANK(s5_b2fb)
	call OpenSRAM
	ld a, b
	ld [s5_b2fb], a
	call CloseSRAM
	farcall Function170be4
	farcall Function1700c4
	jr .asm_118d78

.asm_118d6e
	ld a, [hli]
	cp $96
	jr nz, .asm_118d7b
	ld a, [hl]
	cp $0
	jr nz, .asm_118d7b

.asm_118d78
	jp BattleTowerRoomMenu_IncrementJumptable

.asm_118d7b
	ld a, $d3
	jp SetMobileErrorCode

Function118d80:
	call Function118e06
	ld a, [wcd38]
	and a
	jr z, .asm_118d8e
	call BattleTowerRoomMenu_IncrementJumptable
	jr asm_118d9f

.asm_118d8e
	ld a, $9
	ld [wBattleTowerRoomMenu2JumptableIndex], a
	ld a, $12
	ld [wMobileInactivityTimerSeconds], a
	call BattleTowerRoomMenu_IncrementJumptable

Function118d9b:
	call BattleTowerRoomMenu2
	ret c

asm_118d9f:
	ld hl, wc608
	call Function119940
	ld a, [wcd38]
	and a
	jr nz, .asm_118db2
	ld a, TRADE_CORNER_REQUEST_LENGTH
	ld [wcd3b], a
	jr .asm_118db7

.asm_118db2
	ld a, $26
	ld [wcd3b], a

.asm_118db7
	ld hl, w3_d800
	ld a, LOW(wc608)
	ld [hli], a
	ld a, HIGH(wc608)
	ld [hli], a
	ld a, [wcd3b]
	ld [hli], a
	xor a
	ld [hli], a
	ld a, LOW(wc708)
	ld [hli], a
	ld a, HIGH(wc708)
	ld [hli], a
	ld a, [wcd39]
	ld [hli], a
	ld a, [wcd3a]
	ld [hli], a
	call Function119eb4
	call Function119ec2
	ld a, $40
	ld [wcd89], a
	ld hl, w3_d800
	ld de, w3_de00
	ld bc, $200
	ld a, MOBILEAPI_16
	jp Function119e2b

Function118ded:
	ld a, [wcd38]
	and a
	jr z, .asm_118e03
	ldh a, [rSVBK]
	push af
	ld a, $1
	ldh [rSVBK], a
	farcall Function11b93b
	pop af
	ldh [rSVBK], a

.asm_118e03
	jp BattleTowerRoomMenu_IncrementJumptable

Function118e06:
	ld hl, wd002
	ld a, [wcd38]
	and a
	jr z, .asm_118e1d
.asm_118e0f
	call Function118b9a
	ret nc
	ld a, [hli]
	cp $d
	jr nz, .asm_118e0f
	ld a, [hli]
	cp $a
	jr nz, .asm_118e0f

.asm_118e1d
	ld a, l
	ld [wcd39], a
	ld a, h
	ld [wcd3a], a
.asm_118e25
	call Function118b9a
	ret nc
	ld a, [hli]
	cp $d
	jr nz, .asm_118e25
	ld a, [hli]
	cp $a
	jr nz, .asm_118e25
	dec hl
	xor a
	ld [hld], a
	ld [hl], a
	jr asm_118e3e

Function118e39:
	ld a, [hli]
	and a
	jr nz, Function118e39
	dec hl

asm_118e3e:
	ld a, [hld]
	cp $2f
	jr nz, asm_118e3e
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

Function118e6d:
	xor a
	ld [wcd65], a
	ld a, MOBILEAPI_05
	jp Function119e2b

Function118e76:
	; Call $c in BattleTowerRoomMenu2
	ld a, $c
	ld [wBattleTowerRoomMenu2JumptableIndex], a
	jp BattleTowerRoomMenu_IncrementJumptable

Function118e7e:
	call BattleTowerRoomMenu2
	ret c
	ld a, MOBILEAPI_1B
	jp Function119e2b

BattleTowerRoomMenu_CallRoomMenu2:
	call BattleTowerRoomMenu2
	ret c
	ld a, [wcd33]
	ld [wBattleTowerRoomMenuJumptableIndex], a
	ret

Function118e92:
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

Function118eb0:
	call Function118440
	ld hl, w3_d802
	ld de, wBGMapBuffer
	ld bc, $000c
	call CopyBytes
	call Function1192cc
	ret c
	jp BattleTowerRoomMenu_IncrementJumptable

Function118ec6:
	call Function118440
	call SpeechTextbox
	ld hl, w3_d80e
	ld de, wc320
	ld bc, $0026
	call CopyBytes
	xor a
	ld [wc31f], a
	ld a, LOW(wc320)
	ld [wc31b], a
	ld a, HIGH(wc320)
	ld [wc31c], a
	hlcoord 1, 14
	ld a, l
	ld [wc31d], a
	ld a, h
	ld [wc31e], a
	ld a, $2
	ld [wc31a], a
	ld a, $1d
	ld [wBattleTowerRoomMenu2JumptableIndex], a
	ld a, $24
	ld [wMobileInactivityTimerSeconds], a
	ld a, $11
	ld [wMobileInactivityTimerFrames], a
	ld a, $1c
	ld [wcd47], a
	jp BattleTowerRoomMenu_IncrementJumptable

Function118f0d:
	call BattleTowerRoomMenu2
	ret c
	call Function118440

Function118f14:
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
	jr z, .DontSendSaveFile
	ld hl, Text_SaveFileWillBeSent
	call BattleTowerRoomMenu_SetMessage

.DontSendSaveFile:
	ld a, [wcd57]
	ld l, a
	ld a, [wcd58]
	ld h, a
	ld de, wcc60
	call Function1191ad
	ret c
	ld hl, wcc60
	call Function118e39
	ld a, $9
	ld [wBattleTowerRoomMenu2JumptableIndex], a
	ld a, $24
	ld [wMobileInactivityTimerSeconds], a
	ld a, $13
	ld [wMobileInactivityTimerFrames], a
	ld a, $1c
	ld [wcd47], a
	jp BattleTowerRoomMenu_IncrementJumptable

Function118f5e:
	call BattleTowerRoomMenu2
	ret c
	call Function118440
	call DelayFrame

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
	ld hl, wc346
	ld a, LOW(wc608)
	ld [hli], a
	ld a, HIGH(wc608)
	ld [hli], a
	ld a, [wcd4b]
	ld [hli], a
	ld a, [wcd4c]
	ld [hli], a
	ld a, LOW(wc708)
	ld [hli], a
	ld a, HIGH(wc708)
	ld [hli], a
	ld a, LOW(wcc60)
	ld [hli], a
	ld a, HIGH(wcc60)
	ld [hli], a
	call Function119eb4
	call Function119ec2
	ld a, $40
	ld [wcd89], a
	ld hl, wc346
	ld de, w3_de00
	ld bc, $200
	ld a, MOBILEAPI_16
	jp Function119e2b

.asm_118fba
	call BattleTowerRoomMenu_IncrementJumptable
	jp BattleTowerRoomMenu_IncrementJumptable

Function118fc0:
	call Function118440
	ld a, [wcd55]
	ld l, a
	ld a, [wcd56]
	ld h, a
	ld de, wcc60
	call Function1191ad
	ret c
	ld a, [wcc60]
	and a
	jr z, .asm_118ffa
	ld a, [wcd51]
	ld l, a
	ld a, [wcd52]
	ld h, a
	ld de, wcc60
	call Function1191ad
	ret c
	ld a, [wcc60]
	and a
	jr z, .asm_118ff2
	ld hl, Text_SentSaveFileReadingNews
	jr .asm_118ff5

.asm_118ff2
	ld hl, Text_ReadingNews

.asm_118ff5
	call BattleTowerRoomMenu_SetMessage
	jr Function119009

.asm_118ffa
	ld hl, Text_ReadingNews
	call BattleTowerRoomMenu_SetMessage
	call BattleTowerRoomMenu_IncrementJumptable
	call BattleTowerRoomMenu_IncrementJumptable
	jp BattleTowerRoomMenu_IncrementJumptable

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
	ld hl, wc346
	ld a, LOW(wc608)
	ld [hli], a
	ld a, HIGH(wc608)
	ld [hli], a
	ld a, [wcd4b]
	ld [hli], a
	ld a, [wcd4c]
	ld [hli], a
	ld a, LOW(wc708)
	ld [hli], a
	ld a, HIGH(wc708)
	ld [hli], a
	ld a, LOW(wcc60)
	ld [hli], a
	ld a, HIGH(wcc60)
	ld [hli], a
	call Function119eb4
	call Function119ec2
	ld a, $40
	ld [wcd89], a
	ld hl, wc346
	ld de, w3_d000
	ld bc, $1000
	ld a, MOBILEAPI_16
	jp Function119e2b

Function119054:
	ld a, $6
	call OpenSRAM
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
	ldh [rSVBK], a
	ld hl, wd002
	ld a, [w3_d000]
	ld c, a
	ld a, [w3_d000 + 1]
	ld b, a
	call Function119192
	ret c

.asm_11908a
	call CloseSRAM
	ld a, $3 ; ???
	ldh [rSVBK], a
	ld a, BANK(s5_b1b3) ; aka BANK(s5_b1b4) and BANK(s5_aa7f) and BANK(s5_b2f3) and BANK(s5_b2f4)
	call OpenSRAM
	ld a, [wcd4f]
	ld [s5_b1b3], a
	ld a, [wcd50]
	ld [s5_b1b4], a
	ld hl, wcd20
	ld de, s5_aa7f
	ld bc, 12
	call CopyBytes
	ldh a, [rSVBK]
	push af
	ld a, BANK(wd474) ; aka BANK(wd475)
	ldh [rSVBK], a
	ld a, [wd474]
	ld [s5_b2f3], a
	ld hl, wd475
	ld de, s5_b2f4
	ld bc, 4
	call CopyBytes
	pop af
	ldh [rSVBK], a
	call CloseSRAM
	jp BattleTowerRoomMenu_IncrementJumptable

Function1190d0:
	ld a, BANK(w3_d000)
	ldh [rSVBK], a
	ld a, [wcd57]
	ld l, a
	ld a, [wcd58]
	ld h, a
	ld de, wcc60
	call Function1191ad
	ret c
	ld de, w3_d000
	ld bc, $1000
	jp Function118b10

Function1190ec:
	ld a, BANK(s5_aa73)
	call OpenSRAM
	ld hl, wBGMapBuffer
	ld de, s5_aa73
	ld bc, 12
	call CopyBytes
	call CloseSRAM
	ld a, BANK(s5_aa72)
	call OpenSRAM
	ld a, $1
	ld [s5_aa72], a
	call CloseSRAM
	ld a, BANK(s6_a000)
	call OpenSRAM
	ld a, [w3_d000]
	ld c, a
	ld a, [w3_d000 + 1]
	ld b, a
	ld hl, wd002
	ld de, s6_a000
	call Function119192
	ret c
	ld a, [wcd89]
	and $1
	jr z, .asm_11913e
	ld a, BANK(w6_d000)
	ldh [rSVBK], a
	ld a, [w6_d000]
	ld c, a
	ld a, [w6_d000 + 1]
	ld b, a
	ld hl, w6_d000 + 2
	call Function119192
	ret c

.asm_11913e
	ld a, BANK("Battle Tower RAM")
	ldh [rSVBK], a
	call CloseSRAM
	ld hl, Text_ReceivedNews
	call BattleTowerRoomMenu_SetMessage
	jp BattleTowerRoomMenu_IncrementJumptable

Function11914e:
	call BattleTowerRoomMenu2
	ret c
	ld a, $1c
	ld [wBattleTowerRoomMenuJumptableIndex], a
	ld a, $a
	ld [wMobileErrorCodeBuffer], a
	ret

Function11915d:
	ld hl, w3_d802
	ld de, wcd20
	ld bc, 12
	call CopyBytes
	ld a, BANK(s5_aa7f)
	call OpenSRAM
	ld hl, wBGMapBuffer
	ld de, s5_aa7f
	ld c, 12
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
	ld [wBattleTowerRoomMenuJumptableIndex], a
	ld a, $b
	ld [wMobileErrorCodeBuffer], a

.asm_11918e
	call CloseSRAM
	ret

Function119192:
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
	call SetMobileErrorCode
	scf
	ret

Function1191ad:
	push bc
	ld c, $0
	ld a, $5
	ldh [rSVBK], a
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
	call SetMobileErrorCode
	ld a, BANK("Battle Tower RAM")
	ldh [rSVBK], a
	pop bc
	scf
	ret

.asm_1191cc
	ld a, BANK("Battle Tower RAM")
	ldh [rSVBK], a
	pop bc
	and a
	ret

Function1191d3:
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

Function11920f:
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

Function119223:
	xor a
	ld [wcd4b], a
	ld [wcd4c], a
	ld a, BANK(s5_b092) ; aka BANK(s5_b1b1) and BANK(s5_b1b2) and BANK(s5_b1d3)
	call OpenSRAM
	ld hl, wEmailAddress
	ld de, s5_b092
	ld bc, 31
	call CopyBytes
	dec de
	xor a
	ld [de], a
	ld hl, w3_d810
.asm_119241
	ld a, [hli]
	cp $50
	jr nz, .asm_119241
	ld a, [hli]
	ld [wcd4f], a
	ld a, [hli]
	ld [wcd50], a
	ld a, [hli]
	ld [s5_b1b1], a
	ld c, a
	ld a, [hli]
	ld [s5_b1b2], a
	ld b, a
	ld de, s5_b1d3
	call CopyBytes
	call CloseSRAM
	ld e, l
	ld d, h
	ld hl, wc608
.asm_119266
	ld a, [de]
	inc de
	cp $ff
	jr z, .asm_1192c2
	cp $fe
	jr z, .asm_1192a5
	call OpenSRAM
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
	call SetMobileErrorCode
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

Function1192cc:
	ld a, BANK(s5_aa73)
	call OpenSRAM
	ld hl, s5_aa73
	ld de, wc608
	ld bc, 12
	call CopyBytes
	call CloseSRAM
	ld hl, wc608
	ld de, wcd20
	ld c, $c
.asm_1192e8
	ld a, [de]
	inc de
	ld b, a
	ld a, [hli]
	cp b
	jr nz, .asm_1192fe
	dec c
	jr nz, .asm_1192e8
	ld a, $1f
	ld [wBattleTowerRoomMenu2JumptableIndex], a
	ld a, $27
	ld [wBattleTowerRoomMenuJumptableIndex], a
	scf
	ret

.asm_1192fe
	and a
	ret

Function119300:
	xor a
	ld [wcd4b], a
	ld [wcd4c], a
	ld a, [wcd4d]
	ld e, a
	ld a, [wcd4e]
	ld d, a
	ld hl, wc608
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
	call OpenSRAM
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

Function119380:
	ld a, $80
	ld [wcd49], a
	jp BattleTowerRoomMenu_IncrementJumptable

Function119388:
	ld hl, wcd49
	dec [hl]
	ret nz
	ld hl, wcc60
	call Function118e39
	ld a, $9
	ld [wBattleTowerRoomMenu2JumptableIndex], a
	ld a, $10
	ld [wMobileInactivityTimerSeconds], a
	call BattleTowerRoomMenu_IncrementJumptable

Function1193a0:
	call BattleTowerRoomMenu2
	ret c
	call DelayFrame
	ld a, $8
	ld [wBattleTowerRoomMenu2JumptableIndex], a
	call BattleTowerRoomMenu2
	ld hl, wc346
	ld a, LOW(w3_d000)
	ld [hli], a
	ld a, HIGH(w3_d000)
	ld [hli], a
	ld a, [wcd3b]
	ld [hli], a
	xor a
	ld [hli], a
	ld a, LOW(wc708)
	ld [hli], a
	ld a, HIGH(wc708)
	ld [hli], a
	ld a, LOW(wcc60)
	ld [hli], a
	ld a, HIGH(wcc60)
	ld [hli], a
	call Function119eb4
	call Function119ec2
	ld a, $40
	ld [wcd89], a
	ld hl, wc346
	ld de, w3_de00
	ld bc, $200
	ld a, MOBILEAPI_16
	jp Function119e2b

Function1193e3:
	ld hl, wcd49
	dec [hl]
	ret nz
	ld hl, wcc60
	call Function118e39
	ld a, $9
	ld [wBattleTowerRoomMenu2JumptableIndex], a
	ld a, $11
	ld [wMobileInactivityTimerSeconds], a
	call BattleTowerRoomMenu_IncrementJumptable

Function1193fb:
	call BattleTowerRoomMenu2
	ret c
	call DelayFrame
	ld a, $8
	ld [wBattleTowerRoomMenu2JumptableIndex], a
	call BattleTowerRoomMenu2
	ld de, w3_d000
	ld bc, $1000
	jp Function118b10

Function119413:
	ld a, $6 ; ???
	call OpenSRAM
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
	ld a, BANK(w6_d000)
	ldh [rSVBK], a
	ld a, [w6_d000]
	ld c, a
	ld a, [w6_d000 + 1]
	ld b, a
	ld hl, w6_d000 + 2
	call Function119192
	ret c

.asm_119447
	ld a, BANK("Battle Tower RAM")
	ldh [rSVBK], a
	call CloseSRAM
	jp BattleTowerRoomMenu_IncrementJumptable

Function119451:
	ld a, [wcd89]
	and $1
	jr z, .asm_11945d
	ld a, $d3
	jp SetMobileErrorCode
.asm_11945d
	xor a
	ld [wcd50], a
	call Function119694
	ld a, b
	ld [wcd49], a
	call Function1196cd
	ld a, [wd002]
	ld hl, wd003

Function119471:
	push af
	ld a, [hli]
	ld [wc608], a
	ld a, [hli]
	ld [wc608 + 3], a
	ld a, [hli]
	ld [wc608 + 1], a
	ld a, [hli]
	ld [wc608 + 2], a
	ld a, [hli]
	ld [wc608 + 4], a
	ld a, [hli]
	ld [wc608 + 5], a
	push hl
	ld a, [wc608]
	cp $ff
	jr z, .asm_1194a7
	ld a, [wc608 + 2]
	cp $ff
	jr z, .asm_1194a7
	ld a, [wc608 + 1]
	cp $ff
	jr nz, .asm_1194a7
	call Function119584
	jr c, .asm_11950c
	jr .asm_1194f0
.asm_1194a7
	ld hl, wc608
	ld de, wc608 + 3
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
	ld de, wc608
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
	ld de, wc608 + 3
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
	ld de, wc608
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
	ld [wc608], a
	ld a, h
	ld [wc608 + 1], a
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
	ld [wBattleTowerRoomMenuJumptableIndex], a
	ret
.asm_119571
	ld a, $d8
	jp SetMobileErrorCode
.asm_119576
	ld a, $10
	jr .asm_11957c
.asm_11957a
	ld a, $f
.asm_11957c
	ld [wBattleTowerRoomMenuJumptableIndex], a
	pop af
	call Function1195c4
	ret

Function119584:
	ld a, [wc608]
	ld b, a
	ld a, [wc608 + 3]
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
	ld a, [wc608 + 2]
	ld b, a
	ld a, [wc608 + 5]
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

Function1195c4:
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
	ld a, [wc608]
	ld l, a
	ld a, [wc608 + 1]
	ld h, a
	ld de, wcd69
	ld bc, $10
	call CopyBytes
	ret
.asm_1195f3
	ld a, $d8
	jp SetMobileErrorCode

Function1195f8:
	ld a, $11
	ld [wBattleTowerRoomMenu2JumptableIndex], a
	ld a, $1c
	ld [wMobileInactivityTimerSeconds], a
	ld a, $f
	ld [wMobileInactivityTimerFrames], a
	ld a, $14
	ld [wcd47], a
	call BattleTowerRoomMenu_IncrementJumptable
	jp BattleTowerRoomMenu_IncrementJumptable

Function119612:
	ld a, $14
	ld [wBattleTowerRoomMenu2JumptableIndex], a
	ld a, $1c
	ld [wMobileInactivityTimerSeconds], a
	ld a, $10
	ld [wMobileInactivityTimerFrames], a
	ld a, $14
	ld [wcd47], a
	jp BattleTowerRoomMenu_IncrementJumptable

Function119629:
	call BattleTowerRoomMenu2
	ret c
	ld a, LOW(wcc60)
	ld l, a
	ld a, HIGH(wcc60)
	ld h, a
	call Function118e39
	ld a, $9
	ld [wBattleTowerRoomMenu2JumptableIndex], a
	ld a, $1c
	ld [wMobileInactivityTimerSeconds], a
	ld a, $14
	ld [wcd47], a
	call BattleTowerRoomMenu_IncrementJumptable

Function119648:
	call BattleTowerRoomMenu2
	ret c
	call DelayFrame
	ld a, $8
	ld [wBattleTowerRoomMenu2JumptableIndex], a
	call BattleTowerRoomMenu2
	call Function118b24
	ld de, w3_d000
	ld bc, $1000
	ld a, MOBILEAPI_15
	jp Function119e2b

Function119665:
	ld a, $1a
	ld [wBattleTowerRoomMenu2JumptableIndex], a
	call BattleTowerRoomMenu_IncrementJumptable

Function11966d:
	call BattleTowerRoomMenu2
	ret c
	ld a, [wcd47]
	ld [wBattleTowerRoomMenuJumptableIndex], a
	ld a, $a
	ld [wMobileErrorCodeBuffer], a
	ret

Function11967d:
	ld a, $18
	ld [wBattleTowerRoomMenu2JumptableIndex], a
	call BattleTowerRoomMenu_IncrementJumptable

Function119685:
	call BattleTowerRoomMenu2
	ret c
	ld a, $14
	ld [wBattleTowerRoomMenuJumptableIndex], a
	ld a, $a
	ld [wMobileErrorCodeBuffer], a
	ret

Function119694:
	ld b, 0
	ld hl, Unknown_1196b8
.asm_119699
	ld de, wc708
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

pushc
setcharmap ascii

Unknown_1196b8:
	db "Mon"
	db "Tue"
	db "Wed"
	db "Thu"
	db "Fri"
	db "Sat"
	db "Sun"

popc

Function1196cd:
	ld de, wc719
	call Function1196de
	ld [wcd4a], a
	inc de
	call Function1196de
	ld [wcd4b], a
	ret

Function1196de:
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

Function1196f2:
	ld hl, wd002
.asm_1196f5
	call Function118b9a
	ret nc
	ld a, [hli]
	cp $d
	jr nz, .asm_1196f5
	ld a, [hl]
	cp $a
	jr nz, .asm_1196f5
	xor a
	ld [hld], a
	ld [hli], a
	ld a, l
	ld [wcd5b], a
	ld a, h
	ld [wcd5c], a
	inc hl
	ld e, l
	ld d, h
	ld a, [de]
	inc de
	cp $d
	jr nz, .asm_119722
	ld a, [de]
	inc de
	cp $a
	jr nz, .asm_119722
	ld a, $b
	jp SetMobileErrorCode

.asm_119722
	call Random
	ld c, $0
	ld b, c
.asm_119728
	call Function119798
	ld a, d
	cp $ff
	jr nz, .asm_119735
	ld a, e
	cp $ff
	jr z, .asm_11974c

.asm_119735
	ldh a, [hRandomSub]
	cp d
	jr c, .asm_11974c
	jr z, .asm_11973e
	jr .asm_119745

.asm_11973e
	ldh a, [hRandomAdd]
	cp e
	jr c, .asm_11974c
	jr z, .asm_11974c

.asm_119745
	inc bc
	ld a, c
	or b
	jr z, .asm_119770
	jr .asm_119728

.asm_11974c
	ld a, [wcd5b]
	ld l, a
	ld a, [wcd5c]
	ld h, a
.asm_119754
	ld a, [hld]
	cp $58
	jr nz, .asm_119754
	ld d, $0
.asm_11975b
	inc d
	ld a, [hld]
	cp $58
	jr z, .asm_11975b
	inc hl
	inc hl
	ld a, d
	dec a
	jr z, .asm_11978e
	dec a
	jr z, .asm_119785
	dec a
	jr z, .asm_11977e
	dec a
	jr z, .asm_119775

.asm_119770
	ld a, $d3
	jp SetMobileErrorCode

.asm_119775
	ld a, b
	and $f0
	swap a
	call Function1197bf
	ld [hli], a

.asm_11977e
	ld a, b
	and $f
	call Function1197bf
	ld [hli], a

.asm_119785
	ld a, c
	and $f0
	swap a
	call Function1197bf
	ld [hli], a

.asm_11978e
	ld a, c
	and $f
	call Function1197bf
	ld [hli], a
	jp BattleTowerRoomMenu_IncrementJumptable

Function119798:
	ld d, $0
	ld e, d
	call Function1197b4
	swap a
	or d
	ld d, a
	call Function1197b4
	or d
	ld d, a
	call Function1197b4
	swap a
	or e
	ld e, a
	call Function1197b4
	or e
	ld e, a
	ret

Function1197b4:
	ld a, [hli]
	cp $61
	jr nc, .asm_1197bc
	sub $30
	ret

.asm_1197bc
	sub $57
	ret

Function1197bf:
	cp $a
	jr nc, .asm_1197c6
	add $30
	ret

.asm_1197c6
	add $57
	ret

Function1197c9:
	ld hl, wd002
	call Function118e39
	ld a, $9
	ld [wBattleTowerRoomMenu2JumptableIndex], a
	ld a, $12
	ld [wMobileInactivityTimerSeconds], a
	call BattleTowerRoomMenu_IncrementJumptable

Function1197dc:
	call BattleTowerRoomMenu2
	ret c
	call DelayFrame
	ld hl, wd002
	ld de, wcc60
	ld bc, $0080
	call CopyBytes
	dec de
	xor a
	ld [de], a
	call Function118b24
	ld de, w3_d000
	ld bc, $1000
	ld a, MOBILEAPI_15
	jp Function119e2b

Function119800:
	ld a, $fd
	ld [wc6d0], a
	ld [wOTTrademonSpecies], a
	ld a, [wcd81]
	ld [wc74e], a
	ld a, [wJumptableIndex]
	push af
	ld a, [wcf64]
	push af
	ld a, [wcf65]
	push af
	ld a, [wBattleTowerRoomMenuJumptableIndex]
	push af
	ld a, $1
	ldh [rSVBK], a
	call FadeToMenu
	farcall Function10803d
	call Function11a9ce
	call RestartMapMusic
	ld a, BANK("Battle Tower RAM")
	ldh [rSVBK], a
	pop af
	ld [wBattleTowerRoomMenuJumptableIndex], a
	pop af
	ld [wcf65], a
	pop af
	ld [wcf64], a
	pop af
	ld [wJumptableIndex], a
	farcall Function115dc3
	jp BattleTowerRoomMenu_IncrementJumptable

Function11984e:
	ld a, [wcd80]
	and a
	jr nz, .asm_1198a0
	ld a, [wcd38]
	and a
	jr nz, .asm_1198a8
	farcall Function170000
	ld a, [wJumptableIndex]
	push af
	ld a, [wcf64]
	push af
	ld a, [wcf65]
	push af
	ld a, [wBattleTowerRoomMenuJumptableIndex]
	push af
	ld a, $1
	ldh [rSVBK], a
	call FadeToMenu
	farcall MobileTradeAnimation_SendGivemonToGTS
	call Function11a9ce
	call RestartMapMusic
	ld a, BANK("Battle Tower RAM")
	ldh [rSVBK], a
	pop af
	ld [wBattleTowerRoomMenuJumptableIndex], a
	pop af
	ld [wcf65], a
	pop af
	ld [wcf64], a
	pop af
	ld [wJumptableIndex], a
	farcall Function115dc3
	jp BattleTowerRoomMenu_IncrementJumptable

.asm_1198a0
	ld a, $a
	ld [wMobileErrorCodeBuffer], a
	jp BattleTowerRoomMenu_IncrementJumptable

.asm_1198a8
	farcall Function17005a
	ld a, [wJumptableIndex]
	push af
	ld a, [wcf64]
	push af
	ld a, [wcf65]
	push af
	ld a, [wBattleTowerRoomMenuJumptableIndex]
	push af
	ld a, $1
	ldh [rSVBK], a
	call FadeToMenu
	farcall MobileTradeAnimation_RetrieveGivemonFromGTS
	call Function11a9ce
	call RestartMapMusic
	ld a, BANK("Battle Tower RAM")
	ldh [rSVBK], a
	pop af
	ld [wBattleTowerRoomMenuJumptableIndex], a
	pop af
	ld [wcf65], a
	pop af
	ld [wcf64], a
	pop af
	ld [wJumptableIndex], a
	farcall Function115dc3
	jp BattleTowerRoomMenu_IncrementJumptable

Function1198ee:
	ld hl, Text_RegisteringRecord
	call BattleTowerRoomMenu_SetMessage
	call BattleTowerRoomMenu_IncrementJumptable

Function1198f7:
	ld a, [wc31a]
	and a
	ret nz
	ld hl, wc608 + 2
	call Function119940
	ld hl, w3_d800
	ld a, LOW(wc608)
	ld [hli], a
	ld a, HIGH(wc608)
	ld [hli], a
	ld a, $f6
	ld [hli], a
	xor a
	ld [hli], a
	ld a, LOW(wc708)
	ld [hli], a
	ld a, HIGH(wc708)
	ld [hli], a
	ld a, [wcd51]
	ld [hli], a
	ld a, [wcd52]
	ld [hli], a
	call Function119eb4
	call Function119ec2
	ld a, $40
	ld [wcd89], a
	ld hl, w3_d800
	ld de, w3_de00
	ld bc, $200
	ld a, MOBILEAPI_16
	jp Function119e2b

Function119937:
	farcall BattleTowerAction_06
	jp BattleTowerRoomMenu_IncrementJumptable

Function119940:
	ld de, wEmailAddress
	ld c, MOBILE_EMAIL_LENGTH
.asm_119945
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr z, .asm_119953
	and a
	jr nz, .asm_119945
	xor a
.asm_11994f
	ld [hli], a
	dec c
	jr nz, .asm_11994f

.asm_119953
	ret

Function119954:
	ld a, $1c
	ld [wBattleTowerRoomMenu2JumptableIndex], a
	call BattleTowerRoomMenu2
	ld hl, wc608
	ld de, wEmailAddress
.asm_119962
	ld a, [de]
	inc de
	ld [hli], a
	and a
	jr nz, .asm_119962
	call Function119ec2
	ld hl, wc608
	ld a, MOBILEAPI_0F
	jp Function119e2b

Function119973:
	ld a, $1
	ld [wcf64], a
	xor a
	ld [wcf65], a
	ld [w3_d090], a
	ld de, w3_d000
	ld a, MOBILEAPI_10
	jp Function119e2b

Function119987:
	ld hl, w3_d000 + 1
	ld a, [w3_d000]
	or [hl]
	jr z, .asm_1199a0
	ld a, [wcf64]
	ld l, a
	ld a, [wcf65]
	ld h, a
	ld de, wBGPals2
	ld a, MOBILEAPI_11
	jp Function119e2b

.asm_1199a0
	ld a, [w3_d090]
	and a
	jr z, .asm_1199ae
	ld a, $16
	ld [wBattleTowerRoomMenuJumptableIndex], a
	jp Function119b0d

.asm_1199ae
	ld a, $1b
	ld [wBattleTowerRoomMenuJumptableIndex], a
	ret

Function1199b4:
	ld a, [w3_d081 + 1]
	and a
	jr nz, .asm_1199c7
	ld a, [w3_d081]
	cp $7
	jr nc, .asm_1199c7
	call BattleTowerRoomMenu_IncrementJumptable
	jp Function1199ca

.asm_1199c7
	jp Function119ac9

Function1199ca:
	ld a, $20
	ld [wcd89], a
	ld a, [wcf64]
	ld l, a
	ld a, [wcf65]
	ld h, a
	ld de, w3_d100
	ld bc, $0700
	ld a, MOBILEAPI_14
	jp Function119e2b

Function1199e2:
	ld c, $c
	ld de, XGameCodePrefix
	call Function119e4f
	jp c, Function119ac9
	ld a, c
	cp $1
	jp nz, Function119ac9
	ld hl, w3_d880
	ld bc, XGameCode
.loop
	ld a, [bc]
	and a
	jr z, .game_result_prefix
	cp [hl]
	jp nz, Function119ac9
	inc bc
	inc hl
	jr .loop

.game_result_prefix
	ld c, $17
	ld de, XGameResultPrefix
	call Function119e4f
	jp c, .asm_119aa7
	ld a, c
	cp $1
	jp nz, .asm_119aa7
	ld a, [w3_d880]
	cp $31
	jp nz, .asm_119aa7
	ld a, [w3_d881]
	cp $20
	jp nz, .asm_119aa7
	ld a, [w3_d88a]
	cp $20
	jp nz, .asm_119aa7
	ld a, [w3_d894]
	cp $20
	jp nz, .asm_119aa7
	xor a
	ld [w3_d8a0], a
	ld [w3_d8a1], a
	ld [w3_d8a2], a
	ld [w3_d8a3], a
	ld hl, w3_d8a0
	ld bc, w3_d889
	call Function119e98
	call Function119e98
	ld hl, w3_d8a0
	ld a, [wcd2d]
	cp [hl]
	jr nz, Function119ac9
	inc hl
	ld a, [wcd2c]
	cp [hl]
	jr nz, Function119ac9
	inc hl
	ld a, [wcd2b]
	cp [hl]
	jr nz, Function119ac9
	inc hl
	ld a, [wcd2a]
	cp [hl]
	jr nz, Function119ac9
	xor a
	ld [w3_d8a0], a
	ld [w3_d8a1], a
	ld [w3_d8a2], a
	ld [w3_d8a3], a
	ld hl, w3_d8a0
	ld bc, w3_d88e
	call Function119e98
	ld bc, w3_d893
	call Function119e98
	ld hl, w3_d8a0
	ld a, [wcd2f]
	cp [hl]
	jr nz, .asm_119aa7
	inc hl
	ld a, [wcd2e]
	cp [hl]
	jr nz, .asm_119aa7
	inc hl
	ld a, [wcd31]
	cp [hl]
	jr nz, .asm_119aa7
	inc hl
	ld a, [wcd30]
	cp [hl]
	jr z, .asm_119aaf

.asm_119aa7
	ld a, $25
	ld [wBattleTowerRoomMenuJumptableIndex], a
	jp Function119b45

.asm_119aaf
	ld a, [w3_d090]
	and a
	jr nz, .asm_119aa7
	ld a, [w3_d895]
	sub $30
	ld [w3_d090], a
	ld a, [wcf64]
	ld [w3_d090 + 1], a
	ld a, [wcf65]
	ld [w3_d090 + 2], a

Function119ac9:
	ld a, [w3_d000]
	ld l, a
	ld a, [w3_d000 + 1]
	ld h, a
	dec hl
	ld a, l
	ld [w3_d000], a
	ld a, h
	ld [w3_d000 + 1], a
	ld a, [wcf64]
	ld l, a
	ld a, [wcf65]
	ld h, a
	inc hl
	ld a, l
	ld [wcf64], a
	ld a, h
	ld [wcf65], a
	ld a, $10
	ld [wBattleTowerRoomMenuJumptableIndex], a
	ret

pushc
setcharmap ascii

XGameCode:
	db "CGB-BXTJ-00", $0

XGameResult: ; unreferenced
	db "pokemon_crystal", $0

popc

Function119b0d:
	ld a, $8
	ld [wBattleTowerRoomMenu2JumptableIndex], a
	call BattleTowerRoomMenu2
	ld a, [w3_d090]
	cp $1
	jr z, .asm_119b23
	ld a, $19
	ld [wBattleTowerRoomMenuJumptableIndex], a
	jr Function119b3b

.asm_119b23
	ld a, $10
	ld [wcd89], a
	ld a, [w3_d090 + 1]
	ld l, a
	ld a, [w3_d090 + 2]
	ld h, a
	ld de, w3_d100
	ld bc, $0700
	ld a, MOBILEAPI_12
	jp Function119e2b

Function119b3b:
	ld a, [w3_d090 + 1]
	ld l, a
	ld a, [w3_d090 + 2]
	ld h, a
	jr asm_119b4d

Function119b45:
	ld a, [wcf64]
	ld l, a
	ld a, [wcf65]
	ld h, a

asm_119b4d:
	ld a, MOBILEAPI_13
	jp Function119e2b

Function119b52:
	ld a, [w3_d090]
	cp $1
	jr nz, .asm_119b66
	ld a, BANK(s5_a800)
	call OpenSRAM
	ld a, $4
	ld [s5_a800], a
	call CloseSRAM

.asm_119b66
	ld a, MOBILEAPI_0E
	jp Function119e2b

Function119b6b:
	ld a, [w3_d090]
	cp $1
	jr z, .asm_119b75
	jp BattleTowerRoomMenu_IncrementJumptable

.asm_119b75
	ld a, [w3_d100]
	ld b, a
	ld a, [w3_d100 + 1]
	or b
	jr z, .asm_119be3
	ld hl, w3_d800
	ld de, w3_d100 + 2
.asm_119b85
	ld a, [de]
	inc de
	cp $d
	jr nz, .asm_119b85
	inc de
	ld a, [de]
	cp $d
	jr nz, .asm_119b85
	inc de
	inc de
.asm_119b93
	ld a, [de]
	inc de
	cp $d
	jr z, .asm_119bfa
	call .decodeBase64Character
	ret c
	ld [hli], a
	ld a, [de]
	inc de
	call .decodeBase64Character
	ret c
	ld [hli], a
	ld a, [de]
	inc de
	call .decodeBase64Character
	ret c
	ld [hli], a
	ld a, [de]
	inc de
	call .decodeBase64Character
	ret c
	ld [hl], a
	push de
	ld d, [hl]
	dec hl
	ld c, [hl]
	dec hl
	ld b, [hl]
	dec hl
	ld a, [hl]
	sla b
	sla b
	sla b
	rla
	sla b
	rla
	ld [hli], a
	ld [hl], b
	inc hl
	rrc c
	rrc c
	ld [hl], c
	dec hl
	ld a, $f
	and c
	or [hl]
	ld [hli], a
	ld a, [hli]
	and $c0
	or [hl]
	dec hl
	ld [hld], a
	dec hl
	pop de
	inc hl
	inc hl
	inc hl
	ld a, h
	cp $e0
	jr c, .asm_119b93

.asm_119be3
	ld a, $19
	ld [wBattleTowerRoomMenuJumptableIndex], a
	ld a, BANK(s5_a800)
	call OpenSRAM
	ld a, $1
	ld [s5_a800], a
	call CloseSRAM
	xor a
	ld [w3_d090], a
	ret

.asm_119bfa
	inc de
	ld a, [de]
	cp $d
	jr nz, .asm_119b93
	ld a, l
	cp LOW(w3_d869)
	jr nz, .asm_119be3
	ld a, h
	cp HIGH(w3_d869)
	jr nz, .asm_119be3
	ld a, BANK(s5_b090) ; aka BANK(s5_b091) and BANK(s5_b023)
	call OpenSRAM
	ld a, [wcf64]
	ld [s5_b090], a
	ld a, [wcf65]
	ld [s5_b091], a
	ld hl, w3_d800
	ld de, s5_b023
	ld bc, 105
	call CopyBytes
	ld a, $3
	ld [s5_a800], a
	call CloseSRAM
	ld hl, w3_d800
	ld de, wc608
	ld bc, 105
	call CopyBytes
	jp BattleTowerRoomMenu_IncrementJumptable

pushc
setcharmap ascii

.decodeBase64Character
	cp "+"
	jr c, .asm_119c68
	jr z, .asm_119c80
	cp "/"
	jr c, .asm_119c68
	jr z, .asm_119c84
	cp "0"
	jr c, .asm_119c68
	cp "9" + 1
	jr c, .asm_119c88
	cp "="
	jr c, .asm_119c68
	jr z, .asm_119c8c
	cp "A"
	jr c, .asm_119c68
	cp "Z" + 1
	jr c, .asm_119c8f
	cp "a"
	jr c, .asm_119c68
	cp "z" + 1
	jr c, .asm_119c93

popc

.asm_119c68
	ld a, $19
	ld [wBattleTowerRoomMenuJumptableIndex], a
	ld a, BANK(s5_a800)
	call OpenSRAM
	ld a, $1
	ld [s5_a800], a
	call CloseSRAM
	xor a
	ld [w3_d090], a
	scf
	ret

.asm_119c80
	ld a, $3e
	and a
	ret

.asm_119c84
	ld a, $3f
	and a
	ret

.asm_119c88
	add $4
	and a
	ret

.asm_119c8c
	xor a
	and a
	ret

.asm_119c8f
	sub $41
	and a
	ret

.asm_119c93
	sub $47
	and a
	ret

BattleTowerRoomMenu_UberRestrictionMessage:
	ld hl, Text_UberRestriction
	call BattleTowerRoomMenu_SetMessage
	call BattleTowerRoomMenu_IncrementJumptable
	jr BattleTowerRoomMenu_WaitForMessage

BattleTowerRoomMenu_PartyMonTopsThisLevelMessage:
	ld hl, Text_PartyMonTopsThisLevel
	call BattleTowerRoomMenu_SetMessage
	call BattleTowerRoomMenu_IncrementJumptable

BattleTowerRoomMenu_WaitForMessage:
	ld a, [wc31a]
	and a
	ret nz
	ld a, $80
	ld [wcd50], a
	call BattleTowerRoomMenu_IncrementJumptable

BattleTowerRoomMenu_DelayRestartMenu:
	; Loops while (--[wcd50] != 0),
	;   to create some sort of "delay" after the message is written on the screen,
	;   before starting the menu again.
	ld hl, wcd50
	dec [hl]
	ret nz
	ld a, $0
	ld [wBattleTowerRoomMenuJumptableIndex], a
	ret

BattleTowerRoomMenu_QuitMessage:
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
	ld a, [wc31a]
	and a
	ret nz
	ld a, $f
	ld [wBattleTowerRoomMenu2JumptableIndex], a
	call BattleTowerRoomMenu_IncrementJumptable

BattleTowerRoomMenu_UpdateYesNoMenu:
	; Only ever called when [wBattleTowerRoomMenu2JumptableIndex] is $10
	call BattleTowerRoomMenu2
	ret c
	ld a, [wMobileInactivityTimerFrames]
	ld [wBattleTowerRoomMenuJumptableIndex], a
	ret

MenuHeader_119cf7:
	db MENU_BACKUP_TILES ; flags
	menu_coords 12, 7, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw NULL
	db 0 ; default option

MenuData_119cff: ; unreferenced
	db MENU_BACKUP_TILES ; flags
	menu_coords 15, 7, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw NULL
	db 0 ; default option

String_119d07:
	db "   ▼@"

Strings_L10ToL100:
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

Strings_Ll0ToL40:
	db " L:10 @@"
	db " L:20 @@"
	db " L:30 @@"
	db " L:40 @@"
	db "CANCEL@@"

BattleTowerCancelString: ; unreferenced
	db "CANCEL@"

BattleTower_LevelCheck:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wPartyMons)
	ldh [rSVBK], a
	ld a, [wcd4f]
	ld c, 10
	call SimpleMultiply
	ld hl, wcd50
	ld [hl], a
	ld bc, PARTYMON_STRUCT_LENGTH
	ld de, wPartyMon1Level
	ld a, [wPartyCount]
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
	ldh [rSVBK], a
	and a
	ret

.exceeds
	pop af
	ld a, $4
	ld [wBattleTowerRoomMenuJumptableIndex], a
	pop af
	ldh [rSVBK], a
	scf
	ret

BattleTower_UbersCheck:
	ldh a, [rSVBK]
	push af
	ld a, [wcd4f]
	cp 70 / 10
	jr nc, .level_70_or_more
	ld a, BANK(wPartyMons)
	ldh [rSVBK], a
	ld hl, wPartyMon1Level
	ld bc, PARTYMON_STRUCT_LENGTH
	ld de, wPartySpecies
	ld a, [wPartyCount]
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
	ldh [rSVBK], a
	and a
	ret

.uber_under_70
	pop af
	ld a, [de]
	ld [wNamedObjectIndex], a
	call GetPokemonName
	ld hl, wStringBuffer1
	ld de, wcd49
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	ld a, $a
	ld [wBattleTowerRoomMenuJumptableIndex], a
	pop af
	ldh [rSVBK], a
	scf
	ret

Function119e2b:
	call MobileAPI

BattleTowerRoomMenu_IncrementJumptable:
	ld hl, wBattleTowerRoomMenuJumptableIndex
	inc [hl]
	ret

pushc
setcharmap ascii

XGameCodePrefix:
	db "X-Game-code:\n"

XGameResultPrefix:
	db "X-Game-result:\n"

popc

Function119e4f:
	push bc
	ld hl, w3_d100
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
.loop
	ld a, [de]
	cp [hl]
	jr z, .found_equality
.next
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .loop
.return_carry
	pop bc
	scf
	ret

.found_equality
	push de
.loop2
	ld a, [de]
	inc de
pushc
setcharmap ascii
	cp "\n"
popc
	jr z, .newline
	cp [hl]
	jr nz, .unequal
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .loop2
	pop de
	jr .return_carry

.unequal
	pop de
	jr .next

.newline
	pop de
	pop bc
	inc hl
	ld de, w3_d880
.loop3
	ld a, [hli]
	ld [de], a
	inc de
pushc
setcharmap ascii
	cp "\r"
popc
	jr z, .finish
	dec c
	jr nz, .loop3
	scf
	ret

.finish
	and a
	ret

Function119e8e:
	cp $60
	jr c, .less_than_0x60
	sub $57
	ret

.less_than_0x60
	sub $30
	ret

Function119e98:
	ld a, $2
.loop
	push af
	ld a, [bc]
	dec bc
	call Function119e8e
	or [hl]
	ld [hl], a
	ld a, [bc]
	dec bc
	call Function119e8e
	rlca
	rlca
	rlca
	rlca
	or [hl]
	ld [hl], a
	inc hl
	pop af
	dec a
	and a
	jr nz, .loop
	ret

Function119eb4:
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

Function119ec2:
	ld a, BANK(sMobileLoginPassword)
	call OpenSRAM
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

BattleTowerRoomMenu2:
	ldh a, [rSVBK]
	ld [wcd8c], a
	ld a, $1
	ldh [rSVBK], a

	call .RunJumptable

	ld a, [wcd8c]
	ldh [rSVBK], a
	ld a, $1
	ldh [hBGMapMode], a
	ret

.RunJumptable:
	jumptable .Jumptable, wBattleTowerRoomMenu2JumptableIndex

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

Function119f3f:
	call Function11a5b9
	jp BattleTowerRoomMenu2_IncrementJumptable

Function119f45:
	hlcoord 4, 2
	ld de, String_11a661
	call PlaceString
	ld a, $80
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable

Function119f56:
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

Function119f76:
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

Function119f98:
	call Function11a536
	ret c
	call PlayClickSFX
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr nz, .asm_119fef
	call ExitMenu
	call Function11a63c
	xor a
	ld [wScriptVar], a
	call Function11a00e
	ld a, [wScriptVar]
	and a
	jr z, .asm_119fd4
	call ExitMenu
	farcall ReloadMapPart
	farcall Function115dc3
	ld a, [wcd33]
	ld [wcf66], a
	ld a, $a
	ld [wMobileErrorCodeBuffer], a
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
	farcall ReloadMapPart
	and a
	ret

.asm_119fef
	call ExitMenu
	call ExitMenu
	farcall ReloadMapPart
	ld a, [wMobileInactivityTimerSeconds]
	ld [wcf66], a
	farcall Function115dc3
	ld a, $a
	ld [wMobileErrorCodeBuffer], a
	scf
	ret

Function11a00e:
	ld a, BANK(sMobileLoginPassword)
	call OpenSRAM
	ld a, [sMobileLoginPassword]
	and a
	jr z, .asm_11a02a
	ld a, [sMobileLoginPassword + 1]
	call CloseSRAM
	and a
	ret nz
	ld a, BANK(sMobileLoginPassword)
	call OpenSRAM
	xor a
	ld [sMobileLoginPassword], a

.asm_11a02a
	call CloseSRAM
	ld a, [wBGMapPalBuffer]
	and a
	jr z, .asm_11a039
	dec a
	jr z, .asm_11a081
	jp Function11a0ca

.asm_11a039
	ld a, BANK(w3_d800)
	ldh [rSVBK], a
	ld hl, wc608
	ld de, w3_d800
	ld bc, 246
	call CopyBytes
	ld a, $1
	ldh [rSVBK], a
	call FadeToMenu
	farcall Function11765d
	call Function11a9ce
	ld a, BANK(w3_d800)
	ldh [rSVBK], a
	ld hl, w3_d800
	ld de, wc608
	ld bc, 246
	call CopyBytes
	ld a, $1
	ldh [rSVBK], a
	farcall Function115d99
	ld c, $0
	farcall Function115e18
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
	farcall Function11765d
	farcall Function117ab4
	farcall Stubbed_Function106462
	farcall Function106464
	call ExitMenu
	farcall ReloadMapPart
	farcall Function115d99
	ld c, $0
	farcall Function115e18
	ld a, $1
	ld [wc305], a
	ret

Function11a0ca:
	xor a
	ld [wMenuBorderLeftCoord], a
	ld [wMenuBorderTopCoord], a
	ld a, $13
	ld [wMenuBorderRightCoord], a
	ld a, $11
	ld [wMenuBorderBottomCoord], a
	call PushWindow
	farcall Function11765d
	farcall Function17d3f6
	farcall Stubbed_Function106462
	farcall Function106464
	call ExitMenu
	farcall ReloadMapPart
	farcall Function115d99
	ld c, $0
	farcall Function115e18
	ld a, $1
	ld [wc305], a
	ret

Function11a113:
	call Function11a63c
	ld c, $1
	farcall Function115e18
	hlcoord 4, 2
	ld de, String_11a6c8
	call PlaceString
	and a
	ret

Function11a129:
	ld a, $80
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable

Function11a131:
	ld hl, wMobileInactivityTimerMinutes
	dec [hl]
	ret nz
	ld a, [wBattleTowerRoomMenu2JumptableIndex]
	inc a
	ld [wBattleTowerRoomMenu2JumptableIndex], a

Function11a13d:
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	and a
	ret

Function11a14b:
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

Function11a16d:
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
	ld de, wc346
	call PlaceString
	call Function11a5f5
	xor a
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable

Function11a192:
	call Function11a536
	ret c
	call PlayClickSFX
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr nz, .asm_11a1b6
	call ExitMenu
	farcall ReloadMapPart
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	and a
	ret

.asm_11a1b6
	call ExitMenu
	farcall ReloadMapPart
	ld a, [wMobileInactivityTimerSeconds]
	ld [wcf66], a
	ld [wcd80], a
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	scf
	ret

Function11a1d6:
	ld a, [wcd85]
	cp $50
	jr nz, .asm_11a1e4
	ld a, $d3
	call SetMobileErrorCode
	scf
	ret

.asm_11a1e4
	and a
	ret

Function11a1e6:
	ld hl, String_11a706
	ld de, wc346
	call Function11a1ff
	ld hl, wcd85
	call Function11a1ff
	ld hl, String_11a70b
	call Function11a1ff
	ld a, $50
	ld [de], a
	ret

Function11a1ff:
.asm_11a1ff
	ld a, [hli]
	cp $50
	ret z
	ld [de], a
	inc de
	jr .asm_11a1ff

BattleTowerRoomMenu2_PlaceYesNoMenu:
	ld hl, MenuHeader_11a2de
	call LoadMenuHeader
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

BattleTowerRoomMenu2_UpdateYesNoMenu:
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
	farcall ReloadMapPart
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
	ld [wMobileErrorCodeBuffer], a
	scf
	ret

.b_button
	call PlayClickSFX

.exit_no_carry
	call ExitMenu
	farcall ReloadMapPart
	and a
	ret

String_11a2cf:
	db "YES@"

String_11a2d3:
	db "NO@"

MenuHeader_11a2d6: ; unreferenced
	db MENU_BACKUP_TILES ; flags
	menu_coords 14, 6, SCREEN_WIDTH - 1, 10
	dw NULL
	db 0 ; default option

MenuHeader_11a2de:
	db MENU_BACKUP_TILES ; flags
	menu_coords 14, 7, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw NULL
	db 0 ; default option

Function11a2e6:
	call Function11a63c
	ld c, $2
	farcall Function115e18
	hlcoord 4, 2
	ld de, String_11a71e
	call PlaceString
	ld a, $80
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable

Function11a302:
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

Function11a33a:
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr z, .asm_11a346
	dec a
	ld [wMobileInactivityTimerMinutes], a
	scf
	ret

.asm_11a346
	call ExitMenu
	farcall ReloadMapPart
	farcall Function115dc3
	and a
	ret

Function11a357:
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a743
	call PlaceString
	ld a, $80
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable

Function11a36b:
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

Function11a38d:
	call Function11a536
	ret c
	call PlayClickSFX
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr nz, .asm_11a3b1
	call ExitMenu
	farcall ReloadMapPart
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	and a
	ret

.asm_11a3b1
	call ExitMenu
	farcall ReloadMapPart
	ld a, [wMobileInactivityTimerSeconds]
	ld [wcf66], a
	ld [wcd80], a
	scf
	ret

Function11a3c5:
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a762
	call PlaceString
	ld a, $80
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable

Function11a3d9:
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

Function11a3f9:
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

Function11a41b:
	call Function11a536
	ret c
	call PlayClickSFX
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr nz, .asm_11a43f
	call ExitMenu
	farcall ReloadMapPart
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	and a
	ret

.asm_11a43f
	call ExitMenu
	farcall ReloadMapPart
	ld a, $1c
	ld [wcf66], a
	ld [wcd80], a
	scf
	ret

Function11a452:
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a791
	call PlaceString
	ld a, $80
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable

Function11a466:
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a7c1
	call PlaceString
	ld a, $80
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable

Function11a47a:
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

Function11a488:
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a7ac
	call PlaceString
	call Function11a5f5
	xor a
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable

Function11a49e:
	call Function11a536
	ret c
	call PlayClickSFX
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr nz, .asm_11a4c7
	call ExitMenu
	farcall ReloadMapPart
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
	farcall ReloadMapPart
	ld a, [wMobileInactivityTimerFrames]
	ld [wcf66], a
	ld [wcd80], a
	scf
	ret

Function11a4db:
	call Function11a63c
	ld de, String_11a6db
	hlcoord 4, 2
	call PlaceString
	ret

Function11a4e8:
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a7d7
	call PlaceString
	call Function11a5f5
	xor a
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable

Function11a4fe:
	call Function11a536
	ret c
	call PlayClickSFX
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr nz, .asm_11a522
	call ExitMenu
	farcall ReloadMapPart
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	and a
	ret

.asm_11a522
	call ExitMenu
	farcall ReloadMapPart
	ld a, [wMobileInactivityTimerSeconds]
	ld [wcf66], a
	ld [wcd80], a
	scf
	ret

Function11a536:
	ld hl, hJoyPressed
	ld a, [hl]
	and A_BUTTON
	jr nz, .asm_11a5a7
	ld a, [hl]
	and B_BUTTON
	jr nz, .asm_11a5a2
	ld a, [hl]
	and D_UP
	jr nz, .asm_11a564
	ld a, [hl]
	and D_DOWN
	jr nz, .asm_11a583
.asm_11a54d
	ld a, [wBattleTowerRoomMenu2JumptableIndex]
	cp $4
	jr z, .asm_11a562
	call Function11a9f0
	jr nz, .asm_11a562
	call ExitMenu
	farcall ReloadMapPart

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

BattleTowerRoomMenu2_IncrementJumptable:
	ld a, [wBattleTowerRoomMenu2JumptableIndex]
	inc a
	ld [wBattleTowerRoomMenu2JumptableIndex], a
	scf
	ret

Function11a5b9:
	xor a
	ld [wMenuBorderLeftCoord], a
	ld [wMenuBorderTopCoord], a
	ld a, $13
	ld [wMenuBorderRightCoord], a
	ld a, $5
	ld [wMenuBorderBottomCoord], a
	call PushWindow
	hlcoord 0, 0, wAttrmap
	ld b, $6
	ld c, $14
	hlcoord 0, 0
	ld b, $4
	ld c, $12
	call Function3eea
	farcall ReloadMapPart
	call UpdateSprites
	ld c, $0
	farcall Function115e18
	ld a, $1
	ld [wc305], a
	ret

Function11a5f5:
	ld a, $e
	ld [wMenuBorderLeftCoord], a
	ld a, $13
	ld [wMenuBorderRightCoord], a
	ld a, $6
	ld [wMenuBorderTopCoord], a
	ld a, $a
	ld [wMenuBorderBottomCoord], a
	call PushWindow
	hlcoord 14, 6, wAttrmap
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
	farcall ReloadMapPart
	ret

Function11a63c:
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

String_11a661:
	db   "これから　モバイルセンターに"
	next "でんわ<WO>かけます@"

String_11a679:
	db   "モバイルアダプタ<NO>じゅんびは"
	next "できて　いますか？@"

String_11a692:
	db   "でんわ<WO>かけています"
	next "しばらく　おまちください@"

String_11a6aa:
	db   "でんわをかけると　つうわりょう"
	next "せつぞくりょう<GA>かかります@"

String_11a6c8:
	db   "せつぞく　しました@"

String_11a6d2:
	db   "つうしん　ちゅう@"

String_11a6db:
	db   "つうしん　ちゅう"
	next "セレクト　エーでちゅうし@"

String_11a6f1:
	db   "この　サービスには"
	next "つうわりょう<NO>ほかに@"

String_11a706:
	db   "おかね<GA>@"

String_11a70b:
	db   "えん"
	next "かかります　よろしい　ですか？@"

String_11a71e:
	db   "つうしん　しゅうりょう@"

String_11a72a:
	db   "つないだ　じかん"
	next "　　やく　　　ふん　　　びょう@"

String_11a743:
	db   "もっていない　データが"
	next "あります！@"

String_11a755:
	db   "データ<WO>よみこみますか？@"

String_11a762:
	db   "おなじ　データ<WO>よみこんだ"
	next "こと<GA>ありますが@"

String_11a779:
	db   "そのデータ<WA>なくなっているか"
	next "こわれて　います@"

String_11a791:
	db   "もっている　データと"
	next "おなじデータしか　ありません！@"

String_11a7ac:
	db   "データ<NO>よみこみを"
	next "ちゅうし　しますか？@"

String_11a7c1:
	db   "あたらしい　ニュースは"
	next "ありません　でした@"

String_11a7d7:
	db   "あたらしいニュース<GA>あります"
	next "ニュース<WO>よみこみますか？@"

String_11a7f4:
	db   "　　　　　　　　　　　　　　　@"

MenuHeader_11a804: ; unreferenced
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, SCREEN_WIDTH - 1, 5
	dw NULL
	db 0 ; default option

Function11a80c:
	ld de, hDivisor
	ld bc, hDividend
	ld hl, Unknown_11a89a
	call Function11a88c
	ld bc, hQuotient + 1
	ld hl, Unknown_11a8ba
	call Function11a88c
	ld bc, hPrintNumBuffer + 2
	ld hl, Unknown_11a8da
	call Function11a88c
	xor a
	ld b, a
	ldh a, [hDivisor]
	and $f
	ld e, a
	ldh a, [hPrintNumBuffer + 6]
	and $f
	call Function11a884
	ld e, a
	ldh a, [hPrintNumBuffer + 8]
	and $f
	call Function11a884
	ld [wcd62], a
	ld e, b
	xor a
	ld b, a
	ldh a, [hDivisor]
	and $f0
	swap a
	call Function11a884
	ld e, a
	ldh a, [hPrintNumBuffer + 6]
	and $f0
	swap a
	call Function11a884
	ld e, a
	ldh a, [hPrintNumBuffer + 8]
	and $f0
	swap a
	call Function11a884
	ld [wcd63], a
	ld e, b
	xor a
	ld b, a
	ldh a, [hMathBuffer]
	and $f
	call Function11a884
	ld e, a
	ldh a, [hPrintNumBuffer + 7]
	and $f
	call Function11a884
	ld e, a
	ldh a, [hPrintNumBuffer + 9]
	and $f
	call Function11a884
	ld [wcd64], a
	ret

Function11a884:
	add e
	cp $a
	ret c
	sub $a
	inc b
	ret

Function11a88c:
	ld a, [bc]
	sla a
	ld c, a
	xor a
	ld b, a
	add hl, bc
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ret

Unknown_11a89a:
for x, 16
	bcd x % 100, x / 100
endr

Unknown_11a8ba:
for x, 0, 16**2, 16
	bcd x % 100, x / 100
endr

Unknown_11a8da:
for x, 0, 16**3, 16**2
	bcd x % 100, x / 100
endr

BattleTowerRoomMenu_WriteMessage:
	jumptable .Jumptable, wc31a

.Jumptable:
	dw BattleTowerRoomMenu_WriteMessage_DoNothing
	dw Function11a90f
	dw Function11a971

Function11a90f:
	ld a, $1
	ldh [rSVBK], a
	call SpeechTextbox
	ld a, $50
	ld hl, wc320
	ld bc, $008c
	call ByteFill
	ld a, [wc31b]
	ld l, a
	ld a, [wc31c]
	ld h, a
	ld de, wc320
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
	ld [wc31f], a
	ld a, LOW(wc320)
	ld [wc31b], a
	ld a, HIGH(wc320)
	ld [wc31c], a
	hlcoord 1, 14
	ld a, l
	ld [wc31d], a
	ld a, h
	ld [wc31e], a
	ld hl, wc31a
	inc [hl]
	ld a, $3
	ldh [rSVBK], a

BattleTowerRoomMenu_WriteMessage_DoNothing:
	ret

Function11a971:
	ld hl, wc31f
	ldh a, [hJoyDown]
	and a
	jr nz, .asm_11a97f
	ld a, [hl]
	and a
	jr z, .asm_11a97f
	dec [hl]
	ret

.asm_11a97f
	ld a, [wOptions]
	and $7
	ld [hl], a
	ld hl, wcd8d
	ld a, [wc31b]
	ld e, a
	ld a, [wc31c]
	ld d, a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, e
	ld [wc31b], a
	ld a, d
	ld [wc31c], a
	ld a, $50
	ld [hl], a
	ld a, [wc31d]
	ld l, a
	ld a, [wc31e]
	ld h, a
	ld de, wcd8d
	call PlaceString
	ld a, c
	ld [wc31d], a
	ld a, b
	ld [wc31e], a
	ld a, [wcd8d]
	cp $50
	jr nz, .asm_11a9bf
	xor a
	ld [wc31a], a

.asm_11a9bf
	ret

BattleTowerRoomMenu_SetMessage:
	ld a, l
	ld [wc31b], a
	ld a, h
	ld [wc31c], a
	ld a, $1
	ld [wc31a], a
	ret

Function11a9ce:
	call ClearBGPalettes
	call ReloadTilesetAndPalettes
	call Call_ExitMenu
	farcall Stubbed_Function106462
	farcall Function106464
	call GSReloadPalettes
	farcall FinishExitMenu
	call UpdateSprites
	ret

Function11a9f0:
	ld a, $1
	and a
	ret

Function11a9f4: ; unreferenced
	ld a, [wcd8a]
	ld l, a
	ld a, [wcd8b]
	ld h, a
	inc hl
	ld a, l
	ld [wcd8a], a
	ld a, h
	ld [wcd8b], a
	ld de, $d5d0
	add hl, de
	bit 7, h
	ret nz
	ld a, $d6
	call SetMobileErrorCode
	and a
	ret

Text_SaveFileWillBeSent:
	text "SAVE FILE will be"
	line "sent."
	done

Text_SentSaveFileReadingNews:
	text "Sent SAVE FILE."
	line "Reading NEWS…"
	done

Text_ReadingNews:
	text "Reading NEWS…"
	done

Text_ReceivedNews:
	text "Received NEWS!"
	done

Text_QuitReadingNews:
	text "Quit reading NEWS?"
	done

Text_CanceledSendingSaveFile: ; unreferenced
	text "Canceled sending"
	line "SAVE FILE."
	done

Text_ReceivedOddEgg: ; unreferenced
	text "ODD EGG"
	line "was received!"
	done

Text_RegisteringRecord:
	text "Registering your"
	line "record…"
	done

Text_BattleRoomVisitLimit: ; unreferenced
	text "One visit per day"
	line "per BATTLE ROOM!"
	done

Text_PartyMonTopsThisLevel:
	text "A party #MON"
	line "tops this level."
	done

Text_UberRestriction:
	text_ram wcd49
	text " may go"
	line "only to BATTLE"

	para "ROOMS that are"
	line "Lv.70 or higher."
	done

Text_CancelBattleRoomChallenge:
	text "Cancel your BATTLE"
	line "ROOM challenge?"
	done

Text_ExitGymLeaderHonorRoll:
	text "Exit GYM LEADER"
	line "HONOR ROLL?"
	done

Text_LinkingWithCenter: ; unreferenced
	text "Linking with the"
	line "CENTER…"
	done

Text_WhatLevelDoYouWantToChallenge:
	text "What level do you"
	line "want to challenge?"
	done

Text_CheckBattleRoomListByMaxLevel:
	text "Check BATTLE ROOM"
	line "list by max level?"
	done

Text_EnterWhichBattleRoom: ; unreferenced
	text "Enter which"
	line "BATTLE ROOM?"
	done

Text_WhichBattleRoom: ; unreferenced
	text "Which BATTLE ROOM?"
	done

Text_ThisBattleRoomPleaseWait: ; unreferenced
	text_ram wStringBuffer3
	text "'s ROOM"
	line "@"
	text_ram wStringBuffer4
	text "?"
	cont "Please wait…"
	done

Function11ac3e:
	call SpeechTextbox
	call FadeToMenu
	callfar ClearSpriteAnims2
	call Function11ac51
	call CloseSubmenu
	ret

Function11ac51:
	xor a
	ldh [hBGMapMode], a
	ld hl, wOptions
	ld a, [hl]
	push af
	set 4, [hl]
	ld a, [wVramState]
	push af
	xor a
	ld [wVramState], a
	ldh a, [hInMenu]
	push af
	ld a, $1
	ldh [hInMenu], a
	xor a
	ldh [hMapAnims], a
	ld [wcd49], a
	ld [wcd4a], a
	ld [wcd4c], a
	ld [wcd4d], a
	ld [wcd4e], a
	call Function11ad1b
	call DelayFrame
.loop
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .asm_11aca8
	call Function11b314
	call Function11acb7
	call Function11ad6e
	ld a, 30 * SPRITEOAMSTRUCT_LENGTH
	ld [wCurSpriteOAMAddr], a
	farcall DoNextFrameForAllSprites
	farcall ReloadMapPart
	jr .loop

.asm_11aca8
	call ClearSprites
	pop af
	ldh [hInMenu], a
	pop af
	ld [wVramState], a
	pop af
	ld [wOptions], a
	ret

Function11acb7:
	ld hl, TilemapPack_11ba44
	ld a, [wcd49]
	ld c, a
	ld b, 0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	add hl, bc
	decoord 6, 6
	ld a, [hli]
	ld [de], a
	decoord 0, 7
	ld bc, 7
	call CopyBytes
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ld a, [hl]
	cp $ff
	jr nz, .get_the_other
	xor a
	ld [wcd49], a
.get_the_other
	ld hl, TilemapPack_11bb7d
	ld a, [wcd4a]
	ld c, a
	ld b, 0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	add hl, bc
	decoord 3, 9
	ld bc, 7
	call CopyBytes
	ld a, [wcd4a]
	inc a
	ld [wcd4a], a
	inc hl
	ld a, [hl]
	cp $ff
	ret nz
	xor a
	ld [wcd4a], a
	ret

Function11ad1b:
	call ClearBGPalettes
	call ClearSprites
	call ClearTilemap
	farcall Function17c000
	ld a, [wMenuCursorY]
	ld [wcd82], a
	dec a
	ldh [hObjectStructIndex], a
	ld a, $10
	ld [wCurIconTile], a
	ld hl, LoadMenuMonIcon
	ld a, BANK(LoadMenuMonIcon)
	ld e, MONICON_MOBILE1
	rst FarCall
	ld hl, LoadMenuMonIcon
	ld a, BANK(LoadMenuMonIcon)
	ld e, MONICON_MOBILE2
	rst FarCall
	ld hl, wPokedexOrder
	ld bc, $0115
	xor a
	call ByteFill
	xor a
	ld [wJumptableIndex], a
	ld [wcf64], a
	ld [wcf65], a
	ld [wcf66], a
	ld [wcd30], a
	ld a, DEXMODE_ABC
	ld [wCurDexMode], a
	farcall Pokedex_OrderMonsByMode
	ret

Function11ad6e:
	ld a, [wJumptableIndex]
	ld hl, Jumptable_11ad78
	call Function11b239
	jp hl

Jumptable_11ad78:
	dw Function11b082
	dw Function11b0ff
	dw Function11ad95
	dw Function11adc4
	dw Function11ae4e
	dw Function11ae98
	dw Function11ad8f
	dw Function11af04
	dw Function11af4e

MobileIncJumptableIndex:
	ld hl, wJumptableIndex
	inc [hl]
	ret

Function11ad8f:
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

Function11ad95:
	ld hl, MenuHeader_11ae38
	call LoadMenuHeader
	call MenuBox
	hlcoord 12, 12
	ld de, String_11ae40
	call PlaceString
	hlcoord 10, 10, wAttrmap
	lb bc, 8, 8
	call Function11afd6
	farcall ReloadMapPart
	call MobileIncJumptableIndex
	ld a, $1
	ld [wMenuCursorY], a
	ld hl, Unknown_11afcc
	call Function11afb7

Function11adc4:
	ld hl, hJoyPressed
	ld a, [hl]
	and a
	ret z
	ld a, [hl]
	and D_UP
	jr nz, .asm_11ade6
	ld a, [hl]
	and D_DOWN
	jr nz, .asm_11aded
	ld a, [hl]
	and A_BUTTON
	jr nz, .asm_11ae06
	ld a, [hl]
	and B_BUTTON
	ret z
	call PlayClickSFX
	xor a
	ld [wJumptableIndex], a
	jr .asm_11ae2e

.asm_11ade6
	ld a, [wMenuCursorY]
	dec a
	ret z
	jr .asm_11adf4

.asm_11aded
	ld a, [wMenuCursorY]
	inc a
	cp $4
	ret z

.asm_11adf4
	push af
	ld hl, Unknown_11afcc
	call Function11afbb
	pop af
	ld [wMenuCursorY], a
	ld hl, Unknown_11afcc
	call Function11afb7
	ret

.asm_11ae06
	call PlayClickSFX
	ld a, [wMenuCursorY]
	dec a
	ld hl, wcd30
	ld [hl], a
	and a
	jr z, .asm_11ae28
	hlcoord 2, 14
	ld a, [wMenuCursorY]
	cp $2
	jr z, .asm_11ae23
	call Function11b272
	jr .asm_11ae2b

.asm_11ae23
	call Function11b267
	jr .asm_11ae2b

.asm_11ae28
	ld a, $3
	ld [hl], a

.asm_11ae2b
	call MobileIncJumptableIndex

.asm_11ae2e
	call ExitMenu
	farcall ReloadMapPart
	ret

MenuHeader_11ae38:
	db MENU_BACKUP_TILES ; flags
	menu_coords 10, 10, 17, SCREEN_HEIGHT - 1
	dw NULL
	db 0 ; default option

String_11ae40:
	db   "どちらでも"
	next "♂オス"
	next "♀メス"
	db   "@"

Function11ae4e:
	ld hl, MenuHeader_11afe8
	call LoadMenuHeader
	call MenuBox
	hlcoord 10, 14
	ld de, String_11aff0
	call PlaceString
	ld hl, MenuHeader_11b013
	call LoadMenuHeader
	call MenuBox
	hlcoord 16, 8
	ld de, String_11b01b
	call PlaceString
	hlcoord 14, 7, wAttrmap
	lb bc, 5, 6
	call Function11afd6
	hlcoord 9, 12, wAttrmap
	lb bc, 6, 11
	call Function11afd6
	farcall ReloadMapPart
	call MobileIncJumptableIndex
	ld a, $1
	ld [wMenuCursorY], a
	ld hl, Unknown_11afd2
	call Function11afb7

Function11ae98:
	ld hl, hJoyPressed
	ld a, [hl]
	and a
	ret z
	ld a, [hl]
	and D_UP
	jr nz, .asm_11aec1
	ld a, [hl]
	and D_DOWN
	jr nz, .asm_11aec8
	ld a, [hl]
	and A_BUTTON
	jr nz, .asm_11aee1
	ld a, [hl]
	and B_BUTTON
	ret z
	call PlayClickSFX
.asm_11aeb4
	hlcoord 2, 14
	ld a, $7f
	ld [hl], a
	ld a, $1
	ld [wJumptableIndex], a
	jr .asm_11aef7

.asm_11aec1
	ld a, [wMenuCursorY]
	dec a
	ret z
	jr .asm_11aecf

.asm_11aec8
	ld a, [wMenuCursorY]
	inc a
	cp $3
	ret z

.asm_11aecf
	push af
	ld hl, Unknown_11afd2
	call Function11afbb
	pop af
	ld [wMenuCursorY], a
	ld hl, Unknown_11afd2
	call Function11afb7
	ret

.asm_11aee1
	call PlayClickSFX
	ld a, [wMenuCursorY]
	cp $2
	jr z, .asm_11aeb4
	ld a, [wcd4b]
	ld [wScriptVar], a
	call Function11b022
	call MobileIncJumptableIndex

.asm_11aef7
	call ExitMenu
	call ExitMenu
	farcall ReloadMapPart
	ret

Function11af04:
	ld hl, MenuHeader_11afe8
	call LoadMenuHeader
	call MenuBox
	hlcoord 10, 14
	ld de, String_11b003
	call PlaceString
	ld hl, MenuHeader_11b013
	call LoadMenuHeader
	call MenuBox
	hlcoord 16, 8
	ld de, String_11b01b
	call PlaceString
	hlcoord 14, 7, wAttrmap
	lb bc, 5, 6
	call Function11afd6
	hlcoord 9, 12, wAttrmap
	lb bc, 6, 11
	call Function11afd6
	farcall ReloadMapPart
	call MobileIncJumptableIndex
	ld a, $2
	ld [wMenuCursorY], a
	ld hl, Unknown_11afd2
	call Function11afb7

Function11af4e:
	ld hl, hJoyPressed
	ld a, [hl]
	and a
	ret z
	ld a, [hl]
	and D_UP
	jr nz, .asm_11af77
	ld a, [hl]
	and D_DOWN
	jr nz, .asm_11af7e
	ld a, [hl]
	and A_BUTTON
	jr nz, .asm_11af97
	ld a, [hl]
	and B_BUTTON
	ret z
	call PlayClickSFX
.asm_11af6a
	hlcoord 2, 14
	ld a, $7f
	ld [hl], a
	ld a, $1
	ld [wJumptableIndex], a
	jr .asm_11afaa

.asm_11af77
	ld a, [wMenuCursorY]
	dec a
	ret z
	jr .asm_11af85

.asm_11af7e
	ld a, [wMenuCursorY]
	inc a
	cp $3
	ret z

.asm_11af85
	push af
	ld hl, Unknown_11afd2
	call Function11afbb
	pop af
	ld [wMenuCursorY], a
	ld hl, Unknown_11afd2
	call Function11afb7
	ret

.asm_11af97
	call PlayClickSFX
	ld a, [wMenuCursorY]
	cp $2
	jr z, .asm_11af6a
	ld a, $6
	ld [wJumptableIndex], a
	xor a
	ld [wScriptVar], a

.asm_11afaa
	call ExitMenu
	call ExitMenu
	farcall ReloadMapPart
	ret

Function11afb7:
	ld e, $ed
	jr asm_11afbd

Function11afbb:
	ld e, $7f

asm_11afbd:
	ld a, [wMenuCursorY]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, e
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld [de], a
	ret

Unknown_11afcc:
	dwcoord 11, 12
	dwcoord 11, 14
	dwcoord 11, 16

Unknown_11afd2:
	dwcoord 15,  8
	dwcoord 15, 10

Function11afd6:
	ld de, SCREEN_WIDTH
	ld a, $3
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	add hl, de
	pop bc
	dec b
	jr nz, .row
	ret

MenuHeader_11afe8:
	db MENU_BACKUP_TILES ; flags
	menu_coords 9, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw NULL
	db 0 ; default option

String_11aff0:
	db   "この　じょうけんで"
	next "よろしいですか?@"

String_11b003:
	db   "こうかんを"
	next "ちゅうししますか？@"

MenuHeader_11b013:
	db MENU_BACKUP_TILES ; flags
	menu_coords 14, 7, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw NULL
	db 1 ; default option

String_11b01b:
	db   "はい"
	next "いいえ@"

Function11b022:
	ld a, [wcd2e]
	and a
	jr z, .asm_11b02e
	ld hl, wStringBuffer3
	call Function11b03d

.asm_11b02e
	ld a, [wcd30]
	and a
	ret z
	cp $3
	ret z
	ld hl, wStringBuffer4
	call Function11b03d
	ret

Function11b03d:
	push hl
	push af
	ld c, $1
.loop
	ld a, [hli]
	cp "♂"
	jr z, .gender
	cp "♀"
	jr z, .gender
	cp "@"
	jr z, .done
	inc c
	jr .loop

.gender
	dec hl
	ld a, "@"
	ld [hli], a

.done
	dec hl
	push hl
	ld e, 4
	ld d, 0
	add hl, de
	ld e, l
	ld d, h
	pop hl
.loop2
	ld a, [hld]
	ld [de], a
	dec de
	dec c
	jr nz, .loop2
	pop af
	pop de
	cp $1
	jr nz, .female
	ld hl, .MaleString
	jr .got_string

.female
	ld hl, .FemaleString

.got_string
	ld bc, 4 ; string length
	call CopyBytes
	ret

.MaleString: db "オスの　"
.FemaleString: db "メスの　"

Function11b082:
	call Function11b242
	ld a, $7
	ld [wc7d3], a
	call Function11b099
	call Function11b295
	call Function11b275
	call SetPalettes
	jp MobileIncJumptableIndex

Function11b099:
	ld c, $6
	hlcoord 11, 1
	ld a, [wc7d3]
	add a
	ld b, a
	xor a
	call Function11b236
	ld a, [wc7d0]
	ld e, a
	ld d, 0
	ld hl, wPokedexOrder
	add hl, de
	ld e, l
	ld d, h
	hlcoord 11, 2
	ld a, [wc7d3]
.loop
	push af
	ld a, [de]
	ld [wTempSpecies], a
	push de
	push hl
	call .PlaceMonNameOrPlaceholderString
	pop hl
	ld de, 2 * SCREEN_WIDTH
	add hl, de
	pop de
	inc de
	pop af
	dec a
	jr nz, .loop
	ret

.PlaceMonNameOrPlaceholderString:
	and a
	ret z

	call .CheckSeenFlag
	ret c

	call .SetCaughtFlag
	push hl
	call GetPokemonName
	pop hl
	call PlaceString
	ret

.SetCaughtFlag:
	call CheckCaughtMemMon
	jr nz, .okay
	inc hl
	ret

.okay
	ld a, $1
	ld [hli], a
	ret

.CheckSeenFlag:
	call CheckSeenMemMon
	ret nz

	inc hl
	ld de, .EmptySlot
	call PlaceString
	scf
	ret

.EmptySlot:
	db "ーーーーー@"

Function11b0ff:
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .asm_11b141
	ld a, [hl]
	and A_BUTTON
	jr nz, .asm_11b131
	call Function11b175
	jr nc, .asm_11b125
	ld a, [wcd4c]
	inc a
	and $3
	ld [wcd4c], a
	xor a
	ldh [hBGMapMode], a
	call Function11b099
	ld a, $1
	ldh [hBGMapMode], a
	ret

.asm_11b125
	ld a, [wcd4c]
	and a
	ret z
	inc a
	and $3
	ld [wcd4c], a
	ret

.asm_11b131
	call Function11b20b
	call CheckSeenMemMon
	jr z, .asm_11b13d
	ld a, $1
	jr .asm_11b148

.asm_11b13d
	ld a, $2
	jr .asm_11b148

.asm_11b141
	ld hl, wJumptableIndex
	ld a, $7
	ld [hl], a
	ret

.asm_11b148
	call PlayClickSFX
	ld [wcd4b], a
	and a
	jr z, .asm_11b16c
	ld a, [wcf65]
	cp $0
	jr z, .asm_11b163
	cp $fe
	jr z, .asm_11b167
	cp $ff
	jr z, .asm_11b16b
	jp MobileIncJumptableIndex

.asm_11b163
	ld a, $1
	jr .asm_11b16c

.asm_11b167
	ld a, $2
	jr .asm_11b16c

.asm_11b16b
	xor a

.asm_11b16c
	ld [wcd30], a
	ld a, $4
	ld [wJumptableIndex], a
	ret

Function11b175:
	ld a, [wc7d3]
	ld d, a
	ld a, [wc7d2]
	ld e, a
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .asm_11b19a
	ld a, [hl]
	and D_DOWN
	jr nz, .asm_11b1ae
	ld a, d
	cp e
	jr nc, .asm_11b1ed
	ld a, [hl]
	and D_LEFT
	jr nz, .asm_11b1c6
	ld a, [hl]
	and D_RIGHT
	jr nz, .asm_11b1d8
	jr .asm_11b1ed

.asm_11b19a
	ld hl, wc7d1
	ld a, [hl]
	and a
	jr z, .asm_11b1a4
	dec [hl]
	jr .asm_11b1ef

.asm_11b1a4
	ld hl, wc7d0
	ld a, [hl]
	and a
	jr z, .asm_11b1ed
	dec [hl]
	jr .asm_11b1ef

.asm_11b1ae
	ld hl, wc7d1
	ld a, [hl]
	inc a
	cp e
	jr nc, .asm_11b1ed
	cp d
	jr nc, .asm_11b1bc
	inc [hl]
	jr .asm_11b1ef

.asm_11b1bc
	ld hl, wc7d0
	add [hl]
	cp e
	jr nc, .asm_11b1ed
	inc [hl]
	jr .asm_11b1ef

.asm_11b1c6
	ld hl, wc7d0
	ld a, [hl]
	and a
	jr z, .asm_11b1ed
	cp d
	jr nc, .asm_11b1d4
	xor a
	ld [hl], a
	jr .asm_11b1ef

.asm_11b1d4
	sub d
	ld [hl], a
	jr .asm_11b1ef

.asm_11b1d8
	ld hl, wc7d0
	ld a, d
	add a
	add [hl]
	jr c, .asm_11b1e3
	cp e
	jr c, .asm_11b1e8

.asm_11b1e3
	ld a, e
	sub d
	ld [hl], a
	jr .asm_11b1ef

.asm_11b1e8
	ld a, [hl]
	add d
	ld [hl], a
	jr .asm_11b1ef

.asm_11b1ed
	and a
	ret

.asm_11b1ef
	call Function11b295
	call Function11b275
	scf
	ret

FillScreenWithTile32: ; unreferenced
	hlcoord 0, 0
	ld a, $32
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	ret

CopyDataUntilFF: ; unreferenced
.loop
	ld a, [de]
	cp $ff
	ret z
	inc de
	ld [hli], a
	jr .loop

Function11b20b:
	ld a, [wc7d1]
	ld hl, wc7d0
	add [hl]
	ld e, a
	ld d, 0
	ld hl, wc6d0
	add hl, de
	ld a, [hl]
	ld [wTempSpecies], a
	ret

CheckCaughtMemMon:
	push de
	push hl
	ld a, [wTempSpecies]
	dec a
	call CheckCaughtMon
	pop hl
	pop de
	ret

CheckSeenMemMon:
	push de
	push hl
	ld a, [wTempSpecies]
	dec a
	call CheckSeenMon
	pop hl
	pop de
	ret

Function11b236:
	jp FillBoxWithByte

Function11b239:
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

Function11b242:
	hlcoord 3, 4
	ld de, wStringBuffer3
	call PlaceString
	xor a
	ld [wMonType], a
	farcall GetGender
	hlcoord 1, 4
	ld a, [wCurPartySpecies]
	ld bc, wcd2f
	ld [bc], a
	dec bc
	jr c, asm_11b26a
	jr z, asm_11b26f
	ld a, $1
	ld [bc], a

Function11b267:
	ld [hl], $ef
	ret

asm_11b26a:
	xor a
	ld [bc], a
	ld [hl], $7f
	ret

asm_11b26f:
	ld a, $2
	ld [bc], a

Function11b272:
	ld [hl], $f5
	ret

Function11b275:
	call Function11b279
	ret

Function11b279:
	ld a, [wTempSpecies]
	ld [wCurSpecies], a
	call CheckSeenMemMon
	jr z, .asm_11b28f
	call GetBaseData
	ld a, [wBaseGender]
	ld [wcf65], a
	jr .asm_11b294

.asm_11b28f
	ld a, $ff
	ld [wcf65], a

.asm_11b294
	ret

Function11b295:
	hlcoord 4, 13
	ld de, String_11b308
	call PlaceString
	hlcoord 4, 14
	ld de, String_11b308
	call PlaceString
	call Function11b20b
	call CheckSeenMemMon
	jr z, .asm_11b2d1
	ld a, [wc608]
	ld c, a
	ld a, [wc608 + 1]
	ld b, a
	ld hl, $0007
	add hl, bc
	xor a
	ld [hl], a
	ld hl, $0003
	add hl, bc
	ld e, [hl]
	farcall FlyFunction_GetMonIcon
	hlcoord 4, 14
	push hl
	call GetPokemonName
	jr .asm_11b2e7

.asm_11b2d1
	ld a, [wc608]
	ld c, a
	ld a, [wc608 + 1]
	ld b, a
	ld hl, $0007
	add hl, bc
	ld a, $50
	ld [hl], a
	hlcoord 4, 13
	push hl
	ld de, String_11b30e

.asm_11b2e7
	ld a, NAME_LENGTH_JAPANESE
	ld bc, wStringBuffer4
.asm_11b2ec
	push af
	ld a, [de]
	ld [bc], a
	inc de
	inc bc
	pop af
	dec a
	and a
	jr nz, .asm_11b2ec
	pop hl
	ld de, wStringBuffer4
	call PlaceString
	ret

String_11b2fe: ; unreferenced
	db "あげる#@"

String_11b303: ; unreferenced
	db "ほしい#@"

String_11b308:
	db "　　　　　@"

String_11b30e:
	db "みはっけん@"

Function11b314:
	call Function11b31b
	call Function11b3d9
	ret

Function11b31b:
	ld hl, .Coords
	ld a, [wJumptableIndex]
	cp 2
	jr c, .tilemap_1
	ld a, [wc7d1]
	cp 4
	jr nc, .tilemap_3
	cp 3
	jr c, .tilemap_1
	ld a, [wJumptableIndex]
	cp 2
	jr z, .tilemap_1
	cp 3
	jr z, .tilemap_1
	cp 6
	jr z, .tilemap_1

	ld bc, .Tilemap2
	jr .load_sprites

.tilemap_3
	ld bc, .Tilemap3
	jr .load_sprites

.tilemap_1
	ld bc, .Tilemap1

.load_sprites
	call Function11b397
	ret

.Coords:
	dbpixel 3, 11, 2, 6 ;  0
	dbpixel 3, 12, 2, 6 ;  1
	dbpixel 3, 13, 2, 6 ;  2
	dbpixel 3, 14, 2, 6 ;  3
	dbpixel 3, 15, 2, 6 ;  4
	dbpixel 3, 16, 2, 6 ;  5
	dbpixel 3, 17, 2, 6 ;  6
	dbpixel 4, 11, 2, 6 ;  7
	dbpixel 4, 12, 2, 6 ;  8
	dbpixel 4, 13, 2, 6 ;  9
	dbpixel 4, 14, 2, 6 ; 10
	dbpixel 4, 15, 2, 6 ; 11
	dbpixel 4, 16, 2, 6 ; 12
	dbpixel 4, 17, 2, 6 ; 13
	db -1

.Tilemap1: ; vtiles
	db $30 ;  0
	db $31 ;  1
	db $31 ;  2
	db $31 ;  3
	db $31 ;  4
	db $31 ;  5
	db $32 ;  6
	db $40 ;  7
	db $41 ;  8
	db $41 ;  9
	db $41 ; 10
	db $41 ; 11
	db $41 ; 12
	db $42 ; 13

.Tilemap2: ; vtiles
	db $30 ;  0
	db $31 ;  1
	db $31 ;  2
	db $39 ;  3
	db $39 ;  4
	db $39 ;  5
	db $39 ;  6
	db $40 ;  7
	db $41 ;  8
	db $41 ;  9
	db $39 ; 10
	db $39 ; 11
	db $39 ; 12
	db $39 ; 13

.Tilemap3: ; vtiles
	db $39 ;  0
	db $39 ;  1
	db $39 ;  2
	db $39 ;  3
	db $39 ;  4
	db $39 ;  5
	db $39 ;  6
	db $39 ;  7
	db $39 ;  8
	db $39 ;  9
	db $39 ; 10
	db $39 ; 11
	db $39 ; 12
	db $39 ; 13

Function11b397:
	ld de, wShadowOAMSprite00
.loop
	ld a, [hl]
	cp $ff
	ret z
	ld a, [wc7d1]
	and $7
	swap a
	add [hl]
	inc hl
	ld [de], a ; y
	inc de

	ld a, [hli]
	ld [de], a ; x
	inc de

	ld a, [bc]
	inc bc
	ld [de], a ; tile id
	inc de
	ld a, $5
	ld [de], a ; attributes
	inc de
	jr .loop

Function11b3b6: ; unreferenced
.loop
	ld a, [hl]
	cp -1
	ret z
	ld a, [wcd4d]
	and $7
	swap a
	add [hl]
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	push hl
	ld l, c
	ld h, b
	ld a, [wcd4e]
	add [hl]
	inc bc
	ld [de], a
	inc de
	pop hl
	ld a, $5
	ld [de], a
	inc de
	jr .loop

Function11b3d9:
	ld de, wShadowOAMSprite28
	push de
	ld a, [wc7d2]
	dec a
	ld e, a
	ld a, [wc7d1]
	ld hl, wc7d0
	add [hl]
	cp e
	jr z, .skip
	ld hl, 0
	ld bc, $70
	call AddNTimes
	ld e, l
	ld d, h
	ld b, 0
	ld a, d
	or e
	jr z, .load_sprites
	ld a, [wc7d2]
	ld c, a
.loop1
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc $0
	ld d, a
	jr c, .load_sprites
	inc b
	jr .loop1

.skip
	ld b, 14 * TILE_WIDTH

.load_sprites
	ld a, 2 * TILE_WIDTH + 5
	add b
	pop hl
	ld [hli], a
	cp $41
	jr c, .version1
	ld a, [wJumptableIndex]
	cp 4
	jr z, .version2
	cp 5
	jr z, .version2
	cp 7
	jr z, .version2
	cp 8
	jr z, .version2

.version1
	ld a, 19 * TILE_WIDTH + 3
	ld [hli], a
	ld a, [wcd4c]
	add $3c
	ld [hli], a
	ld a, [wcd4c]
	add $1
	ld [hl], a
	ret

.version2
	ld a, 19 * TILE_WIDTH + 3
	ld [hli], a
	ld a, $39
	ld [hli], a
	xor a
	ld [hl], a
	ret

TradeCornerHoldMon:
; special
	call Mobile46_InitJumptable
	call TradeCornerHoldMon_RunJumptable
	ret

Mobile46_InitJumptable:
	xor a
	ld [wJumptableIndex], a
	ld [wcf64], a
	ld [wcf65], a
	ld [wcf66], a
	call UpdateTime
	ret

TradeCornerHoldMon_RunJumptable:
.loop
	call .IterateJumptable
	call DelayFrame
	ld a, [wJumptableIndex]
	cp 4
	jr nz, .loop
	ret

.IterateJumptable:
	jumptable .Jumptable, wJumptableIndex

.Jumptable:
	dw TradeCornerHoldMon_PrepareForUpload
	dw Function11b570
	dw TradeCornerHoldMon_RemoveFromParty
	dw TradeCornerHoldMon_Success
	dw TradeCornerHoldMon_Noop ; unused

TradeCornerHoldMon_PrepareForUpload:
	call .InitRAM
	ld hl, wPlayerName
	ld a, NAME_LENGTH_JAPANESE - 1
.get_char
	push af
	ld a, [hli]
	ld [bc], a
	inc bc
	pop af
	dec a
	and a
	jr nz, .get_char

	ld de, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1Species
	ld a, [wcd82]
	dec a
	push af

.get_next_party_mon
	and a
	jr z, .got_selected_mon
	add hl, de
	dec a
	jr .get_next_party_mon

.got_selected_mon
	push bc
	ld a, PARTYMON_STRUCT_LENGTH
.copy_mon_byte
	; copies wPartyMon to bc.
	push af
	ld a, [hli]
	ld [bc], a
	inc bc
	pop af
	dec a
	and a
	jr nz, .copy_mon_byte

	pop de ; pushed from bc
	push bc
	ld a, [de]
	ld [wCurSpecies], a
	call GetBaseData
	ld hl, MON_LEVEL
	add hl, de
	ld a, [hl]
	ld [wCurPartyLevel], a
	ld hl, MON_MAXHP
	add hl, de
	push hl
	ld hl, MON_STAT_EXP - 1
	add hl, de
	pop de
	push de
	ld b, TRUE
	predef CalcMonStats
	pop de
	ld h, d
	ld l, e
	dec hl
	dec hl
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	pop bc
	ld de, NAME_LENGTH
	ld hl, wPartyMonOTs
	pop af
	push af
.loop4
	and a
	jr z, .okay2
	add hl, de
	dec a
	jr .loop4

.okay2
	ld a, NAME_LENGTH - 1
.loop5
	push af
	ld a, [hli]
	ld [bc], a
	inc bc
	pop af
	dec a
	and a
	jr nz, .loop5
	ld de, NAME_LENGTH
	ld hl, wPartyMonNicknames
	pop af
	push af
.loop6
	and a
	jr z, .okay3
	add hl, de
	dec a
	jr .loop6

.okay3
	ld a, NAME_LENGTH - 1
.loop7
	push af
	ld a, [hli]
	ld [bc], a
	inc bc
	pop af
	dec a
	and a
	jr nz, .loop7
	ld de, MAIL_STRUCT_LENGTH
	ld hl, sPartyMail
	pop af
.loop8
	and a
	jr z, .okay4
	add hl, de
	dec a
	jr .loop8

.okay4
	ld a, BANK(sPartyMail)
	call OpenSRAM
	ld a, MAIL_STRUCT_LENGTH
.loop9
	push af
	ld a, [hli]
	ld [bc], a
	inc bc
	pop af
	dec a
	and a
	jr nz, .loop9
	call CloseSRAM
	jp MobileIncJumptableIndex

.InitRAM:
	ld bc, wOfferTrainerID
	ld a, [wPlayerID]
	ld [wcd2a], a
	ld [bc], a
	inc bc

	ld a, [wPlayerID + 1]
	ld [wcd2b], a
	ld [bc], a
	inc bc

	ld a, [wSecretID]
	ld [wcd2c], a
	ld [bc], a
	inc bc

	ld a, [wSecretID + 1]
	ld [wcd2d], a
	ld [bc], a
	inc bc

	ld a, [wcd2e] ; offer gender
	ld [bc], a
	inc bc

	ld a, [wcd2f] ; offer species
	ld [bc], a
	inc bc

	ld a, [wcd30] ; req gender
	ld [bc], a
	inc bc

	ld a, [wd265] ; req species
	ld [bc], a
	inc bc
	ret

Function11b570:
	call Function118007
	ld a, [wScriptVar]
	and a
	jr nz, .exit
	call .SaveData
	jp MobileIncJumptableIndex

.exit
	ld a, $4
	ld [wJumptableIndex], a
	ret

.SaveData:
	ld a, $3
	ldh [rSVBK], a

	ld hl, w3_d800
	ld de, wc608
	ld bc, w3_d88f - w3_d800
	call CopyBytes

	ld a, $1
	ldh [rSVBK], a
	ld a, BANK(s5_a800)
	call OpenSRAM

	ld de, s5_a800
	ld a, $1
	ld [de], a
	inc de
	ld hl, wc608
	ld bc, w3_d88f - w3_d800
	call CopyBytes

	push de
	pop hl

	ldh a, [hRTCMinutes]
	ld [hli], a
	ldh a, [hRTCHours]
	ld [hli], a
	ldh a, [hRTCDayLo]
	ld [hli], a
	ldh a, [hRTCDayHi]
	ld [hl], a

	call CloseSRAM
	ret

TradeCornerHoldMon_RemoveFromParty:
	ld a, [wcd82]
	dec a
	ld [wCurPartyMon], a
	xor a ; REMOVE_PARTY
	ld [wPokemonWithdrawDepositParameter], a
	farcall RemoveMonFromPartyOrBox
	farcall BattleTowerAction_16
	farcall SaveAfterLinkTrade
	jp MobileIncJumptableIndex

TradeCornerHoldMon_Success:
	xor a
	ld [wScriptVar], a
	jp MobileIncJumptableIndex

TradeCornerHoldMon_Noop:
	ret

Function11b5e8:
	ld a, $0
	call OpenSRAM
	ld hl, wRTC
	ld de, wc608
	ld bc, 4
	call CopyBytes
	call CloseSRAM
	ld a, $5
	call OpenSRAM
	ld hl, wc608
	ld de, $b08c
	ld bc, 4
	call CopyBytes
	ld a, $2
	ld [$a800], a
	ld a, [$a81f]
	ld [wcd2a], a
	ld a, [$a820]
	ld [wcd2b], a
	ld a, [$a821]
	ld [wcd2c], a
	ld a, [$a822]
	ld [wcd2d], a
	ld a, [$a823]
	ld [wcd2e], a
	ld a, [$a824]
	ld [wcd2f], a
	ld a, [$a825]
	ld [wcd30], a
	ld a, [$a826]
	ld [wcd31], a
	call CloseSRAM
	call Mobile46_InitJumptable
	call .loop
	ret

.loop
	call .RunJumptable
	call DelayFrame
	ld a, [wJumptableIndex]
	cp $1
	jr nz, .loop
	ret

.RunJumptable:
	jumptable .Jumptable, wJumptableIndex

.Jumptable:
	dw Function11b66d
	dw Function11b6b3

Function11b66d:
	call Function1180b8
	ld a, [wScriptVar]
	and a
	jr nz, .asm_11b6b0
	ldh a, [rSVBK]
	push af
	ld a, $3
	ldh [rSVBK], a
	ld a, [w3_d090]
	ld b, a
	pop af
	ldh [rSVBK], a
	ld a, b
	and a
	jr z, .asm_11b691
	cp $1
	jr nz, .asm_11b6b0
	call Function11b6b4
	jr .asm_11b6b0

.asm_11b691
	farcall BattleTowerAction_17
	ld a, [wScriptVar]
	and a
	jr z, .asm_11b6b0
	xor a
	ld [wScriptVar], a
	ldh a, [rSVBK]
	push af
	ld a, $3
	ldh [rSVBK], a
	ld a, $2
	ld [w3_d090], a
	pop af
	ldh [rSVBK], a

.asm_11b6b0
	jp MobileIncJumptableIndex

Function11b6b3:
	ret

Function11b6b4:
	ld a, $5
	call OpenSRAM
	ld a, [wcd30]
	ld [wc708], a
	ld a, [wcd31]
	ld [wc709], a

	ld a, LOW(wc708)
	ld [wMobileMonSpeciesPointer], a
	ld a, HIGH(wc708)
	ld [wMobileMonSpeciesPointer + 1], a

	ld a, LOW(wMobileMon)
	ld [wMobileMonStructPointer], a
	ld a, HIGH(wMobileMon)
	ld [wMobileMonStructPointer + 1], a

	ld a, LOW(wMobileMonOT)
	ld [wMobileMonOTPointer], a
	ld a, HIGH(wMobileMonOT)
	ld [wMobileMonOTPointer + 1], a

	ld a, LOW(wMobileMonNick)
	ld [wMobileMonNicknamePointer], a
	ld a, HIGH(wMobileMonNick)
	ld [wMobileMonNicknamePointer + 1], a

	ld a, LOW(wMobileMonMail)
	ld [wMobileMonMailPointer], a
	ld a, HIGH(wMobileMonMail)
	ld [wMobileMonMailPointer + 1], a

	ld a, BASE_HAPPINESS
	ld [wMobileMonHappiness], a

	ld de, wMobileMonOT
	ld c, NAME_LENGTH_JAPANESE - 1
	farcall CheckStringForErrors
	jr nc, .length_check_OT
	farcall Mobile_CopyDefaultOTName

.length_check_OT
	ld de, wMobileMonOT
	lb bc, 1, NAME_LENGTH_JAPANESE - 1
	farcall CheckStringContainsLessThanBNextCharacters
	jr nc, .error_check_nick
	farcall Mobile_CopyDefaultOTName

.error_check_nick
	ld de, wMobileMonNick
	ld c, NAME_LENGTH_JAPANESE - 1
	farcall CheckStringForErrors
	jr nc, .length_check_nick
	farcall Mobile_CopyDefaultNickname

.length_check_nick
	ld de, wMobileMonNick
	lb bc, 1, NAME_LENGTH_JAPANESE - 1
	farcall CheckStringContainsLessThanBNextCharacters
	jr nc, .error_check_mail
	farcall Mobile_CopyDefaultNickname

.error_check_mail
	ld de, wMobileMonMail
	ld c, MAIL_MSG_LENGTH + 1
	farcall CheckStringForErrors
	jr nc, .length_check_mail
	farcall Mobile_CopyDefaultMail

.length_check_mail
	ld de, wMobileMonMail
	lb bc, 2, MAIL_MSG_LENGTH + 1
	farcall CheckStringContainsLessThanBNextCharacters
	jr c, .fix_mail
	ld a, b
	cp $2
	jr nz, .mail_ok

.fix_mail
	farcall Mobile_CopyDefaultMail

.mail_ok
	ld de, wMobileMonMailAuthor
	ld c, NAME_LENGTH_JAPANESE - 1
	farcall CheckStringForErrors
	jr nc, .length_check_author
	farcall Mobile_CopyDefaultMailAuthor

.length_check_author
	ld de, wMobileMonMailAuthor
	lb bc, 1, NAME_LENGTH_JAPANESE - 1
	farcall CheckStringContainsLessThanBNextCharacters
	jr nc, .author_okay
	farcall Mobile_CopyDefaultMailAuthor

.author_okay
	ld a, [wMobileMonItem]
	cp -1
	jr nz, .item_okay
	xor a
	ld [wMobileMonItem], a

.item_okay
	ld a, [wcd31]
	ld [wMobileMonSpecies], a
	ld [wCurSpecies], a
	call GetBaseData

	ld hl, wMobileMonLevel
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
	ld [wCurPartyLevel], a

	ld hl, wMobileMonExp + 2
	ld de, wMobileMonMaxHP
	ld b, TRUE
	predef CalcMonStats
	ld de, wMobileMonMaxHP
	ld hl, wMobileMonHP
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	call AddMobileMonToParty
	ret

Function11b7e5:
	ld a, [wMobileMonSpecies]
	ld [wOTTrademonSpecies], a
	ld [wCurPartySpecies], a
	ld a, [wcd81]
	ld [wc74e], a
	ld hl, wMobileMonOT ; OT
	ld de, wOTTrademonOTName
	ld bc, 5
	call CopyBytes
	ld a, "@"
	ld [de], a
	ld a, [wMobileMonID]
	ld [wOTTrademonID], a
	ld a, [wMobileMonID + 1]
	ld [wOTTrademonID + 1], a
	ld hl, wMobileMonDVs
	ld a, [hli]
	ld [wOTTrademonDVs], a
	ld a, [hl]
	ld [wOTTrademonDVs + 1], a
	ld bc, wMobileMon ; pokemon_data_start
	farcall GetCaughtGender
	ld a, c
	ld [wOTTrademonCaughtData], a
	call SpeechTextbox
	call FadeToMenu
	farcall MobileTradeAnimation_ReceiveGetmonFromGTS
	farcall Function17d1f1
	ld a, $1
	ld [wForceEvolution], a
	ld a, LINK_TRADECENTER
	ld [wLinkMode], a
	farcall EvolvePokemon
	xor a
	ld [wLinkMode], a
	farcall SaveAfterLinkTrade
	ld a, BANK(s5_a800)
	call OpenSRAM
	ld a, $5
	ld [s5_a800], a
	call CloseSRAM
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetMapSceneID
	ld a, d
	or e
	jr z, .asm_11b872
	ld a, $1
	ld [de], a

.asm_11b872
	call CloseSubmenu
	call RestartMapMusic
	ret

Function11b879:
	farcall BattleTower_CheckSaveFileExistsAndIsYours
	ld a, [wScriptVar]
	and a
	ret z
	ld a, BANK(s5_a800)
	call OpenSRAM
	ld a, [s5_a800]
	ld [wScriptVar], a
	ld a, [s5_a890]
	ld [wcd49], a
	ld a, [s5_a891]
	ld [wcd4a], a
	ld a, [s5_a892]
	ld [wcd4b], a
	ld a, [s5_a893]
	ld [wcd4c], a
	call CloseSRAM
	ld a, [wScriptVar]
	and a
	ret z
	ld hl, wcd4c
	ldh a, [hRTCDayHi]
	cp [hl]
	ret nz
	dec hl
	ldh a, [hRTCDayLo]
	cp [hl]
	ret nz
	ld hl, wcd4a
	ldh a, [hRTCHours]
	cp [hl]
	jr nc, .asm_11b8d8
	ld a, $18
	sub [hl]
	ld hl, hRTCHours
	add [hl]
	ld [wcd4c], a
	ldh a, [hRTCMinutes]
	ld [wcd4b], a
	xor a
	ld [wcd4a], a
	jr .asm_11b8e2

.asm_11b8d8
	ldh a, [hRTCMinutes]
	ld [wcd4b], a
	ldh a, [hRTCHours]
	ld [wcd4c], a

.asm_11b8e2
	xor a
	ld l, a
	ld h, a
	ld b, a
	ld d, a
	ld a, [wcd4b]
	ld e, a
	ld a, [wcd4c]
	ld c, $3c
	call AddNTimes
	add hl, de
	push hl
	xor a
	ld l, a
	ld h, a
	ld b, a
	ld d, a
	ld a, [wcd49]
	ld e, a
	ld a, [wcd4a]
	ld c, $3c
	call AddNTimes
	add hl, de
	ld a, l
	cpl
	add $1
	ld e, a
	ld a, h
	cpl
	adc 0
	ld d, a
	pop hl
	add hl, de
	ld de, $ff88
	add hl, de
	bit 7, h
	ret z
	ld a, $2
	ld [wScriptVar], a
	ret

Function11b920:
	call Mobile46_InitJumptable
	ld a, BANK(sOfferTrainerID)
	call OpenSRAM
	ld hl, sOfferTrainerID
	ld de, wOfferTrainerID
	ld bc, 8
	call CopyBytes
	call CloseSRAM
	call Function118000
	ret

Function11b93b:
	ld a, BANK(s5_a800)
	call OpenSRAM
	xor a
	ld [s5_a800], a
	ld hl, sOfferGender
	ld de, wc608
	ld bc, TRADE_CORNER_REQUEST_LENGTH
	call CopyBytes
	call CloseSRAM

	ld a, LOW(wUnknownGender)
	ld [wMobileMonSpeciesPointer], a
	ld a, HIGH(wUnknownGender)
	ld [wMobileMonSpeciesPointer + 1], a

	ld a, LOW(wUnknownMon)
	ld [wMobileMonStructPointer], a
	ld a, HIGH(wUnknownMon)
	ld [wMobileMonStructPointer + 1], a

	ld a, LOW(wUnknownMonOT)
	ld [wMobileMonOTPointer], a
	ld a, HIGH(wUnknownMonOT)
	ld [wMobileMonOTPointer + 1], a

	ld a, LOW(wUnknownMonNick)
	ld [wMobileMonNicknamePointer], a
	ld a, HIGH(wUnknownMonNick)
	ld [wMobileMonNicknamePointer + 1], a

	ld a, LOW(wUnknownMonMail)
	ld [wMobileMonMailPointer], a
	ld a, HIGH(wUnknownMonMail)
	ld [wMobileMonMailPointer + 1], a
	call AddMobileMonToParty
	farcall SaveAfterLinkTrade
	ret

AddMobileMonToParty:
	ld hl, wPartyCount
	ld a, [hl]
	ld e, a
	inc [hl]

	ld a, [wMobileMonSpeciesPointer]
	ld l, a
	ld a, [wMobileMonSpeciesPointer + 1]
	ld h, a
	inc hl
	ld bc, wPartySpecies
	ld d, e
.loop1
	inc bc
	dec d
	jr nz, .loop1
	ld a, e
	ld [wCurPartyMon], a
	ld a, [hl]
	ld [bc], a
	inc bc
	ld a, -1
	ld [bc], a

	ld hl, wPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, e
	ld [wMobileMonIndex], a
.loop2
	add hl, bc
	dec a
	and a
	jr nz, .loop2
	ld e, l
	ld d, h
	ld a, [wMobileMonStructPointer]
	ld l, a
	ld a, [wMobileMonStructPointer + 1]
	ld h, a
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes

	ld hl, wPartyMonOTs
	ld bc, NAME_LENGTH
	ld a, [wMobileMonIndex]
.loop3
	add hl, bc
	dec a
	and a
	jr nz, .loop3
	ld e, l
	ld d, h
	ld a, [wMobileMonOTPointer]
	ld l, a
	ld a, [wMobileMonOTPointer + 1]
	ld h, a
	ld bc, MON_NAME_LENGTH - 1
	call CopyBytes
	ld a, "@"
	ld [de], a

	ld hl, wPartyMonNicknames
	ld bc, MON_NAME_LENGTH
	ld a, [wMobileMonIndex]
.loop4
	add hl, bc
	dec a
	and a
	jr nz, .loop4
	ld e, l
	ld d, h
	ld a, [wMobileMonNicknamePointer]
	ld l, a
	ld a, [wMobileMonNicknamePointer + 1]
	ld h, a
	ld bc, MON_NAME_LENGTH - 1
	call CopyBytes
	ld a, "@"
	ld [de], a

	ld hl, sPartyMail
	ld bc, MAIL_STRUCT_LENGTH
	ld a, [wMobileMonIndex]
.loop5
	add hl, bc
	dec a
	and a
	jr nz, .loop5
	ld a, BANK(sPartyMail)
	call OpenSRAM
	ld e, l
	ld d, h
	ld a, [wMobileMonMailPointer]
	ld l, a
	ld a, [wMobileMonMailPointer + 1]
	ld h, a
	ld bc, MAIL_STRUCT_LENGTH
	call CopyBytes

	call CloseSRAM
	ret

Function11ba38:
	farcall CheckCurPartyMonFainted
	ret c
	xor a
	ld [wScriptVar], a
	ret

TilemapPack_11ba44:
	db $47, $30, $0a, $0a, $0a, $0a, $0a, $56 ; 00
	db $46, $2f, $0a, $0a, $0a, $0a, $0a, $55 ; 01
	db $45, $3d, $0a, $0a, $0a, $0a, $0a, $54 ; 02
	db $44, $30, $0a, $0a, $0a, $0a, $0a, $53 ; 03
	db $43, $2f, $0a, $0a, $0a, $0a, $0a, $52 ; 04
	db $4a, $3d, $0a, $0a, $0a, $0a, $0a, $51 ; 05
	db $4a, $30, $0a, $0a, $0a, $0a, $0a, $50 ; 06
	db $4a, $2f, $0a, $0a, $0a, $0a, $0a, $4f ; 07
	db $4a, $3d, $0a, $0a, $0a, $0a, $0a, $4e ; 08
	db $4a, $30, $0a, $0a, $0a, $0a, $4d, $42 ; 09
	db $4a, $2f, $0a, $0a, $0a, $0a, $6b, $58 ; 0a
	db $4a, $3d, $0a, $0a, $0a, $0a, $6a, $58 ; 0b
	db $4a, $30, $0a, $0a, $0a, $0a, $69, $58 ; 0c
	db $4a, $2f, $0a, $0a, $0a, $0a, $68, $58 ; 0d
	db $4a, $3d, $0a, $0a, $0a, $66, $67, $58 ; 0e
	db $4a, $30, $0a, $0a, $0a, $65, $0a, $58 ; 0f
	db $4a, $2f, $0a, $0a, $0a, $64, $0a, $58 ; 10
	db $4a, $3d, $0a, $0a, $0a, $63, $0a, $58 ; 11
	db $4a, $30, $0a, $0a, $61, $62, $0a, $58 ; 12
	db $4a, $2f, $0a, $0a, $5f, $60, $0a, $58 ; 13
	db $4a, $3d, $0a, $61, $62, $0a, $0a, $58 ; 14
	db $4a, $30, $0a, $63, $0a, $0a, $0a, $58 ; 15
	db $4a, $2f, $69, $0a, $0a, $0a, $0a, $58 ; 16
	db $4a, $3d, $81, $0a, $0a, $0a, $0a, $58 ; 17
	db $4a, $30, $80, $0a, $0a, $0a, $0a, $58 ; 18
	db $4a, $2f, $7f, $0a, $0a, $0a, $0a, $58 ; 19
	db $4a, $3d, $0a, $0a, $0a, $0a, $0a, $58 ; 1a
	db $4a, $30, $0a, $0a, $0a, $0a, $0a, $58 ; 1b
	db $4a, $2f, $68, $87, $88, $89, $0a, $58 ; 1c
	db $4a, $3d, $6e, $6f, $70, $75, $76, $58 ; 1d
	db $4a, $30, $75, $76, $5c, $5d, $5e, $58 ; 1e
	db $4a, $2f, $71, $72, $73, $74, $6d, $58 ; 1f
	db $4a, $3d, $75, $76, $77, $8a, $8b, $58 ; 20
	db $4a, $30, $66, $67, $65, $0a, $6a, $58 ; 21
	db $4a, $2f, $83, $84, $0a, $83, $84, $58 ; 22
	db $4a, $3d, $0a, $85, $82, $84, $0a, $58 ; 23
	db $4a, $30, $41, $80, $40, $0a, $0a, $58 ; 24
	db $4a, $2f, $83, $0a, $0a, $0a, $0a, $58 ; 25
	db $4a, $3d, $40, $0a, $0a, $0a, $0a, $58 ; 26
	db -1

TilemapPack_11bb7d:
	db $0a, $0a, $0a, $0a, $0a, $0a, $16, $00 ; 00
	db $78, $0a, $0a, $0a, $0a, $0a, $8c, $00 ; 01
	db $79, $0a, $0a, $0a, $0a, $0a, $8d, $00 ; 02
	db $7a, $0a, $0a, $0a, $0a, $0a, $8e, $00 ; 03
	db $7b, $0a, $0a, $0a, $0a, $0a, $8c, $00 ; 04
	db $7c, $0a, $0a, $0a, $0a, $0a, $8d, $00 ; 05
	db $7d, $0a, $0a, $0a, $0a, $0a, $8e, $00 ; 06
	db $2e, $7e, $0a, $0a, $0a, $0a, $8c, $00 ; 07
	db $2e, $80, $0a, $0a, $0a, $0a, $8d, $00 ; 08
	db $2e, $81, $0a, $0a, $0a, $0a, $8e, $00 ; 09
	db $2e, $82, $0a, $0a, $0a, $0a, $8c, $00 ; 0a
	db $2e, $69, $0a, $0a, $0a, $0a, $8d, $00 ; 0b
	db $2e, $6a, $0a, $0a, $0a, $0a, $8e, $00 ; 0c
	db $2e, $6b, $0a, $0a, $0a, $0a, $8c, $00 ; 0d
	db $2e, $0a, $68, $0a, $0a, $0a, $8d, $00 ; 0e
	db $2e, $0a, $69, $0a, $0a, $0a, $8e, $00 ; 0f
	db $2e, $0a, $0a, $6a, $0a, $0a, $8c, $00 ; 10
	db $2e, $0a, $0a, $6b, $0a, $0a, $8d, $00 ; 11
	db $2e, $0a, $0a, $0a, $80, $0a, $8e, $00 ; 12
	db $2e, $0a, $0a, $0a, $82, $0a, $8c, $00 ; 13
	db $2e, $0a, $0a, $0a, $6c, $0a, $8d, $00 ; 14
	db $2e, $0a, $0a, $0a, $0a, $83, $8e, $00 ; 15
	db $2e, $0a, $6b, $0a, $0a, $0a, $8c, $00 ; 16
	db $2e, $0a, $0a, $69, $0a, $0a, $8d, $00 ; 17
	db $2e, $0a, $0a, $6a, $0a, $0a, $8e, $00 ; 18
	db $2e, $0a, $0a, $0a, $68, $0a, $8c, $00 ; 19
	db $2e, $0a, $0a, $0a, $63, $0a, $8d, $00 ; 1a
	db $2e, $0a, $0a, $61, $62, $0a, $8e, $00 ; 1b
	db $2e, $0a, $0a, $0a, $5f, $60, $8c, $00 ; 1c
	db $2e, $0a, $0a, $0a, $63, $0a, $8d, $00 ; 1d
	db $2e, $0a, $0a, $0a, $0a, $69, $8c, $00 ; 1e
	db $2e, $0a, $0a, $0a, $0a, $6b, $8d, $00 ; 1f
	db $2e, $0a, $0a, $0a, $0a, $83, $8e, $00 ; 20
	db $2e, $0a, $0a, $0a, $0a, $86, $8c, $00 ; 21
	db $2e, $0a, $85, $0a, $0a, $0a, $8d, $00 ; 22
	db $2e, $0a, $0a, $84, $0a, $0a, $8e, $00 ; 23
	db -1
