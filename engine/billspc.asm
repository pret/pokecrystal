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
	call BillsPC_InitRAM
	xor a
	ld [wBillsPC_LoadedBox], a
	call DelayFrame
.loop
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done
	call .RunJumptable
	call DelayFrame
	jr .loop
.done
	call ClearSprites
	pop af
	ld [hInMenu], a
	pop af
	ld [VramState], a
	pop af
	ld [Options], a
	ret

.RunJumptable: ; e23d5 (38:63d5)
	ld a, [wJumptableIndex]
	ld hl, .Jumptable
	call BillsPC_Jumptable
	jp [hl]

.Jumptable: ; e23df (38:63df)

	dw .Init
	dw .HandleJoypad
	dw .WhatsUp
	dw .Submenu
	dw BillsPC_EndJumptableLoop


.Init: ; e23e9 (38:63e9)
	xor a
	ld [hBGMapMode], a
	call ClearSprites
	call CopyBoxmonSpecies
	call BillsPC_BoxName
	ld de, PCString_ChooseaPKMN
	call BillsPC_PlaceString
	ld a, $5
	ld [wBillsPC_NumMonsOnScreen], a
	call BillsPC_RefreshTextboxes
	call PCMonInfo
	ld a, $ff
	ld [CurPartySpecies], a
	ld a, SCGB_BILLS_PC
	call BillsPC_ApplyPalettes
	call WaitBGMap
	call BillsPC_UpdateSelectionCursor
	call BillsPC_IncrementJumptableIndex
	ret

.HandleJoypad: ; e241a (38:641a)
	ld hl, hJoyPressed ; $ffa7
	ld a, [hl]
	and B_BUTTON
	jr nz, .b_button
	ld a, [hl]
	and A_BUTTON
	jr nz, .a_button
	call Withdraw_UpDown
	and a
	ret z
	call BillsPC_UpdateSelectionCursor
	xor a
	ld [hBGMapMode], a
	call BillsPC_RefreshTextboxes
	call PCMonInfo
	ld a, $1
	ld [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	ret

.a_button
	call BillsPC_GetSelectedPokemonSpecies
	and a
	ret z
	cp -1
	jr z, .b_button
	ld a, $2
	ld [wJumptableIndex], a
	ret
; e2452 (38:6452)

.go_back
	ld hl, wJumptableIndex
	dec [hl]
	ret

.b_button
	ld a, $4
	ld [wJumptableIndex], a
	ret

.WhatsUp: ; e245d (38:645d)
	xor a
	ld [hBGMapMode], a
	call ClearSprites
	call BillsPC_GetSelectedPokemonSpecies
	ld [CurPartySpecies], a
	ld a, SCGB_BILLS_PC
	call BillsPC_ApplyPalettes
	ld de, PCString_WhatsUp
	call BillsPC_PlaceString
	ld a, $1
	ld [wMenuCursorY], a
	call BillsPC_IncrementJumptableIndex
	ret

.Submenu: ; e247d (38:647d)
	ld hl, BillsPCDepositMenuDataHeader
	call CopyMenuDataHeader
	ld a, [wMenuCursorY]
	call StoreTo_wMenuCursorBuffer
	call VerticalMenu
	jp c, BillsPCDepositFuncCancel
	ld a, [wMenuCursorY]
	dec a
	and $3
	ld e, a
	ld d, 0
	ld hl, BillsPCDepositJumptable
	add hl, de
	add hl, de
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
	call BillsPC_CheckMail_PreventBlackout
	jp c, BillsPCDepositFuncCancel
	call DepositPokemon
	jr c, .box_full
	ld a, $0
	ld [wJumptableIndex], a
	xor a
	ld [wBillsPC_CursorPosition], a
	ld [wBillsPC_ScrollPosition], a
	ret

.box_full
	ld de, PCString_WhatsUp
	call BillsPC_PlaceString
	ret

BillsPCDepositFuncStats: ; e24c8 (38:64c8)
	call LoadStandardMenuDataHeader
	call BillsPC_StatsScreen
	call ExitMenu
	call PCMonInfo
	call BillsPC_GetSelectedPokemonSpecies
	ld [CurPartySpecies], a
	ld a, SCGB_BILLS_PC
	call BillsPC_ApplyPalettes
	ret

BillsPCDepositFuncRelease: ; e24e0 (38:64e0)
	call BillsPC_CheckMail_PreventBlackout
	jr c, BillsPCDepositFuncCancel
	call BillsPC_IsMonAnEgg
	jr c, BillsPCDepositFuncCancel
	ld a, [wMenuCursorY]
	push af
	ld de, PCString_ReleasePKMN
	call BillsPC_PlaceString
	call LoadStandardMenuDataHeader
	lb bc, 14, 11
	call PlaceYesNoBox
	ld a, [wMenuCursorY]
	dec a
	call ExitMenu
	and a
	jr nz, .failed_release
	ld a, [wBillsPC_CursorPosition]
	ld hl, wBillsPC_ScrollPosition
	add [hl]
	ld [CurPartyMon], a
	xor a
	ld [wPokemonWithdrawDepositParameter], a
	callba RemoveMonFromPartyOrBox
	call ReleasePKMN_ByePKMN
	ld a, $0
	ld [wJumptableIndex], a
	xor a
	ld [wBillsPC_CursorPosition], a
	ld [wBillsPC_ScrollPosition], a
	pop af
	ret

.failed_release
	ld de, PCString_WhatsUp
	call BillsPC_PlaceString
	pop af
	ld [wMenuCursorY], a
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
	dw .MenuData2
	db 1 ; default option
; 0xe2545

.MenuData2: ; 0xe2545 (38:6545)
	db $80 ; flags
	db 4 ; items
	db "DEPOSIT@"
	db "STATS@"
	db "RELEASE@"
	db "CANCEL@"
; 0xe2564 (38:6564)

BillsPC_ClearThreeBoxes: ; e2564
; unreferenced
	hlcoord 0, 0
	ld b,  4
	ld c,  8
	call ClearBox
	hlcoord 0, 4
	ld b, 10
	ld c,  9
	call ClearBox
	hlcoord 0, 14
	ld b,  2
	ld c,  8
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
	call BillsPC_InitRAM
	ld a, NUM_BOXES + 1
	ld [wBillsPC_LoadedBox], a
	call DelayFrame
.loop
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done
	call .RunJumptable
	call DelayFrame
	jr .loop
.done
	call ClearSprites
	pop af
	ld [hInMenu], a
	pop af
	ld [VramState], a
	pop af
	ld [Options], a
	ret

.RunJumptable: ; e25c8 (38:65c8)
	ld a, [wJumptableIndex]
	ld hl, .Jumptable
	call BillsPC_Jumptable
	jp [hl]

.Jumptable: ; e25d2 (38:65d2)

	dw .Init
	dw .Joypad
	dw .PrepSubmenu
	dw BillsPC_Withdraw
	dw BillsPC_EndJumptableLoop


.Init: ; e25dc (38:65dc)
	ld a, NUM_BOXES + 1
	ld [wBillsPC_LoadedBox], a
	xor a
	ld [hBGMapMode], a
	call ClearSprites
	call CopyBoxmonSpecies
	call BillsPC_BoxName
	ld de, PCString_ChooseaPKMN
	call BillsPC_PlaceString
	ld a, $5
	ld [wBillsPC_NumMonsOnScreen], a
	call BillsPC_RefreshTextboxes
	call PCMonInfo
	ld a, $ff
	ld [CurPartySpecies], a
	ld a, SCGB_BILLS_PC
	call BillsPC_ApplyPalettes
	call WaitBGMap
	call BillsPC_UpdateSelectionCursor
	call BillsPC_IncrementJumptableIndex
	ret

.Joypad: ; e2612 (38:6612)
	ld hl, hJoyPressed ; $ffa7
	ld a, [hl]
	and B_BUTTON
	jr nz, .b_button
	ld a, [hl]
	and A_BUTTON
	jr nz, .a_button
	call Withdraw_UpDown
	and a
	ret z
	call BillsPC_UpdateSelectionCursor
	xor a
	ld [hBGMapMode], a
	call BillsPC_RefreshTextboxes
	call PCMonInfo
	ld a, $1
	ld [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	ret
.a_button
	call BillsPC_GetSelectedPokemonSpecies
	and a
	ret z
	cp -1
	jr z, .b_button
	ld a, $2
	ld [wJumptableIndex], a
	ret ; e264a (38:664a)

.unused
	ld hl, wJumptableIndex
	dec [hl]
	ret

.b_button
	ld a, $4
	ld [wJumptableIndex], a
	ret
; e2655

.PrepSubmenu: ; e2655 (38:6655)
	xor a
	ld [hBGMapMode], a
	call ClearSprites
	call BillsPC_GetSelectedPokemonSpecies
	ld [CurPartySpecies], a
	ld a, SCGB_BILLS_PC
	call BillsPC_ApplyPalettes
	ld de, PCString_WhatsUp
	call BillsPC_PlaceString
	ld a, $1
	ld [wMenuCursorY], a
	call BillsPC_IncrementJumptableIndex
	ret

BillsPC_Withdraw: ; e2675 (38:6675)
	ld hl, .MenuDataHeader
	call CopyMenuDataHeader
	ld a, [wMenuCursorY]
	call StoreTo_wMenuCursorBuffer
	call VerticalMenu
	jp c, .cancel
	ld a, [wMenuCursorY]
	dec a
	and 3
	ld e, a
	ld d, 0
	ld hl, .dw
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

.dw ; e2699 (38:6699) #mark
	dw .withdraw ; Withdraw
	dw .stats ; Stats
	dw .release ; Release
	dw .cancel ; Cancel


.withdraw ; e26a1 (38:66a1)
	call BillsPC_CheckMail_PreventBlackout
	jp c, .cancel
	call TryWithdrawPokemon
	jr c, .FailedWithdraw
	ld a, $0
	ld [wJumptableIndex], a
	xor a
	ld [wBillsPC_CursorPosition], a
	ld [wBillsPC_ScrollPosition], a
	ret
.FailedWithdraw:
	ld de, PCString_WhatsUp
	call BillsPC_PlaceString
	ret

.stats ; e26c0 (38:66c0)
	call LoadStandardMenuDataHeader
	call BillsPC_StatsScreen
	call ExitMenu
	call PCMonInfo
	call BillsPC_GetSelectedPokemonSpecies
	ld [CurPartySpecies], a
	ld a, SCGB_BILLS_PC
	call BillsPC_ApplyPalettes
	ret

.release ; e26d8 (38:66d8)
	ld a, [wMenuCursorY]
	push af
	call BillsPC_IsMonAnEgg
	jr c, .FailedRelease
	ld de, PCString_ReleasePKMN
	call BillsPC_PlaceString
	call LoadStandardMenuDataHeader
	lb bc, 14, 11
	call PlaceYesNoBox
	ld a, [wMenuCursorY]
	dec a
	call ExitMenu
	and a
	jr nz, .FailedRelease
	ld a, [wBillsPC_CursorPosition]
	ld hl, wBillsPC_ScrollPosition
	add [hl]
	ld [CurPartyMon], a
	ld a, PC_DEPOSIT
	ld [wPokemonWithdrawDepositParameter], a
	callba RemoveMonFromPartyOrBox
	call ReleasePKMN_ByePKMN
	ld a, $0
	ld [wJumptableIndex], a
	xor a
	ld [wBillsPC_CursorPosition], a
	ld [wBillsPC_ScrollPosition], a
	pop af
	ret
.FailedRelease:
	ld de, PCString_WhatsUp
	call BillsPC_PlaceString
	pop af
	ld [wMenuCursorY], a
	ret

.cancel ; e272b (38:672b)
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
	call BillsPC_InitRAM
	ld a, [wCurBox]
	and $f
	inc a
	ld [wBillsPC_LoadedBox], a
	call DelayFrame
.asm_e2781
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .asm_e2793
	call .RunJumptable
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

.RunJumptable: ; e27a2
	ld a, [wJumptableIndex]
	ld hl, .Jumptable
	call BillsPC_Jumptable
	jp [hl]
; e27ac

.Jumptable: ; e27ac

	dw .Init
	dw .Joypad
	dw .PrepSubmenu
	dw .MoveMonWOMailSubmenu
	dw .PrepInsertCursor
	dw .Joypad2
	dw BillsPC_EndJumptableLoop
; e27ba

.Init: ; e27ba
	xor a
	ld [hBGMapMode], a
	call ClearSprites
	call CopyBoxmonSpecies
	ld de, PCString_ChooseaPKMN
	call BillsPC_PlaceString
	ld a, 5
	ld [wBillsPC_NumMonsOnScreen], a
	call BillsPC_RefreshTextboxes
	call BillsPC_MoveMonWOMail_BoxNameAndArrows
	call PCMonInfo
	ld a, $ff
	ld [CurPartySpecies], a
	ld a, SCGB_BILLS_PC
	call BillsPC_ApplyPalettes
	call WaitBGMap
	call BillsPC_UpdateSelectionCursor
	call BillsPC_IncrementJumptableIndex
	ret
; e27eb

.Joypad: ; e27eb
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .b_button
	ld a, [hl]
	and A_BUTTON
	jr nz, .a_button
	call MovePkmnWithoutMail_DPad
	jr c, .d_pad
	and a
	ret z
	call BillsPC_UpdateSelectionCursor
	xor a
	ld [hBGMapMode], a
	call BillsPC_RefreshTextboxes
	call PCMonInfo
	ld a, $1
	ld [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	ret

.d_pad
	xor a
	ld [wBillsPC_CursorPosition], a
	ld [wBillsPC_ScrollPosition], a
	ld a, $0
	ld [wJumptableIndex], a
	ret

.a_button
	call BillsPC_GetSelectedPokemonSpecies
	and a
	ret z
	cp -1
	jr z, .b_button
	ld a, $2
	ld [wJumptableIndex], a
	ret

.unused
	ld hl, wJumptableIndex
	dec [hl]
	ret

.b_button
	ld a, $6
	ld [wJumptableIndex], a
	ret
; e283d

.PrepSubmenu: ; e283d
	xor a
	ld [hBGMapMode], a
	call ClearSprites
	call BillsPC_GetSelectedPokemonSpecies
	ld [CurPartySpecies], a
	ld a, SCGB_BILLS_PC
	call BillsPC_ApplyPalettes
	ld de, PCString_WhatsUp
	call BillsPC_PlaceString
	ld a, $1
	ld [wMenuCursorY], a
	call BillsPC_IncrementJumptableIndex
	ret
; e285d

.MoveMonWOMailSubmenu: ; e285d
	ld hl, .MenuDataHeader
	call CopyMenuDataHeader
	ld a, [wMenuCursorY]
	call StoreTo_wMenuCursorBuffer
	call VerticalMenu
	jp c, .Cancel
	ld a, [wMenuCursorY]
	dec a
	and 3
	ld e, a
	ld d, 0
	ld hl, .Jumptable2
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; e2881

.Jumptable2: ; e2881
	dw .Move
	dw .Stats
	dw .Cancel
; e2887

.Move: ; e2887
	call BillsPC_CheckMail_PreventBlackout
	jp c, .Cancel
	ld a, [wBillsPC_ScrollPosition]
	ld [wBillsPC_BackupScrollPosition], a
	ld a, [wBillsPC_CursorPosition]
	ld [wBillsPC_BackupCursorPosition], a
	ld a, [wBillsPC_LoadedBox]
	ld [wBillsPC_BackupLoadedBox], a
	ld a, $4
	ld [wJumptableIndex], a
	ret
; e28a5

.Stats: ; e28a5
	call LoadStandardMenuDataHeader
	call BillsPC_StatsScreen
	call ExitMenu
	call PCMonInfo
	call BillsPC_GetSelectedPokemonSpecies
	ld [CurPartySpecies], a
	ld a, SCGB_BILLS_PC
	call BillsPC_ApplyPalettes
	ret
; e28bd

.Cancel: ; e28bd
	ld a, $0
	ld [wJumptableIndex], a
	ret
; e28c3

.MenuDataHeader: ; 0xe28c3
	db $40 ; flags
	db 04, 09 ; start coords
	db 13, 19 ; end coords
	dw .MenuData2
	db 1 ; default option
; 0xe28cb

.MenuData2: ; 0xe28cb
	db $80 ; flags
	db 3 ; items
	db "MOVE@"
	db "STATS@"
	db "CANCEL@"
; 0xe28df

.PrepInsertCursor: ; e28df
	xor a
	ld [hBGMapMode], a
	call CopyBoxmonSpecies
	ld de, PCString_MoveToWhere
	call BillsPC_PlaceString
	ld a, $5
	ld [wBillsPC_NumMonsOnScreen], a
	call BillsPC_RefreshTextboxes
	call BillsPC_MoveMonWOMail_BoxNameAndArrows
	call ClearSprites
	call BillsPC_UpdateInsertCursor
	call WaitBGMap
	call BillsPC_IncrementJumptableIndex
	ret
; e2903

.Joypad2: ; e2903
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .b_button_2
	ld a, [hl]
	and A_BUTTON
	jr nz, .a_button_2
	call MovePkmnWithoutMail_DPad_2
	jr c, .dpad_2
	and a
	ret z
	call BillsPC_UpdateInsertCursor
	xor a
	ld [hBGMapMode], a
	call BillsPC_RefreshTextboxes
	ld a, $1
	ld [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	ret

.dpad_2
	xor a
	ld [wBillsPC_CursorPosition], a
	ld [wBillsPC_ScrollPosition], a
	ld a, $4
	ld [wJumptableIndex], a
	ret

.a_button_2
	call BillsPC_CheckSpaceInDestination
	jr c, .no_space
	call MovePKMNWitoutMail_InsertMon
	ld a, $0
	ld [wJumptableIndex], a
	ret

.no_space
	ld hl, wJumptableIndex
	dec [hl]
	ret

.b_button_2
	ld a, [wBillsPC_BackupScrollPosition]
	ld [wBillsPC_ScrollPosition], a
	ld a, [wBillsPC_BackupCursorPosition]
	ld [wBillsPC_CursorPosition], a
	ld a, [wBillsPC_BackupLoadedBox]
	ld [wBillsPC_LoadedBox], a
	ld a, $0
	ld [wJumptableIndex], a
	ret
; e2963

BillsPC_InitRAM: ; e2963 (38:6963)
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	call BillsPC_InitGFX
	ld hl, wBillsPCPokemonList
	ld bc, $338
	xor a
	call ByteFill
	xor a
	ld [wJumptableIndex], a
	ld [wcf64], a
	ld [wcf65], a
	ld [wcf66], a
	ld [wBillsPC_CursorPosition], a
	ld [wBillsPC_ScrollPosition], a
	ret

BillsPC_IncrementJumptableIndex: ; e298d (38:698d)
	ld hl, wJumptableIndex
	inc [hl]
	ret

BillsPC_EndJumptableLoop: ; e2992 (38:6992)
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

_StatsScreenDPad: ; e2998 (38:6998)
	ld a, [wBillsPC_NumMonsOnScreen]
	ld d, a
	ld a, [wBillsPC_NumMonsInBox]
	and a
	jr z, .empty
	dec a
	cp $1
	jr z, .empty
	ld e, a
	ld a, [hl]
	and D_UP
	jr nz, BillsPC_PressUp
	ld a, [hl]
	and D_DOWN
	jr nz, BillsPC_PressDown
.empty
	jp BillsPC_JoypadDidNothing

Withdraw_UpDown: ; e29b5 (38:69b5)
	ld hl, hJoyLast
	ld a, [wBillsPC_NumMonsOnScreen]
	ld d, a
	ld a, [wBillsPC_NumMonsInBox]
	ld e, a
	and a
	jr z, .empty
	ld a, [hl]
	and D_UP
	jr nz, BillsPC_PressUp
	ld a, [hl]
	and D_DOWN
	jr nz, BillsPC_PressDown
.empty
	jp BillsPC_JoypadDidNothing
; e29d0 (38:69d0)

MovePkmnWithoutMail_DPad: ; e29d0
	ld hl, hJoyLast
	ld a, [wBillsPC_NumMonsOnScreen]
	ld d, a
	ld a, [wBillsPC_NumMonsInBox]
	ld e, a
	and a
	jr z, .check_left_right
	ld a, [hl]
	and D_UP
	jr nz, BillsPC_PressUp
	ld a, [hl]
	and D_DOWN
	jr nz, BillsPC_PressDown

.check_left_right
	ld a, [hl]
	and D_LEFT
	jr nz, BillsPC_PressLeft
	ld a, [hl]
	and D_RIGHT
	jr nz, BillsPC_PressRight
	jr BillsPC_JoypadDidNothing

MovePkmnWithoutMail_DPad_2: ; e29f4
	ld hl, hJoyLast
	ld a, [wBillsPC_NumMonsOnScreen]
	ld d, a
	ld a, [wBillsPC_NumMonsInBox]
	ld e, a
	and a
	jr z, .check_left_right

	ld a, [hl]
	and D_UP
	jr nz, BillsPC_PressUp
	ld a, [hl]
	and D_DOWN
	jr nz, BillsPC_PressDown

.check_left_right
	ld a, [hl]
	and D_LEFT
	jr nz, BillsPC_PressLeft
	ld a, [hl]
	and D_RIGHT
	jr nz, BillsPC_PressRight
	jr BillsPC_JoypadDidNothing

BillsPC_PressUp: ; e2a18 (38:6a18)
	ld hl, wBillsPC_CursorPosition
	ld a, [hl]
	and a
	jr z, .top
	dec [hl]
	jr BillsPC_UpDownDidSomething

.top
	ld hl, wBillsPC_ScrollPosition
	ld a, [hl]
	and a
	jr z, BillsPC_JoypadDidNothing
	dec [hl]
	jr BillsPC_UpDownDidSomething

BillsPC_PressDown: ; e2a2c (38:6a2c)
	ld a, [wBillsPC_CursorPosition]
	ld hl, wBillsPC_ScrollPosition
	add [hl]
	inc a
	cp e
	jr nc, BillsPC_JoypadDidNothing

	ld hl, wBillsPC_CursorPosition
	ld a, [hl]
	inc a
	cp d
	jr nc, .not_bottom
	inc [hl]
	jr BillsPC_UpDownDidSomething

.not_bottom
	ld hl, wBillsPC_ScrollPosition
	inc [hl]
	jr BillsPC_UpDownDidSomething
; e2a48 (38:6a48)

BillsPC_PressLeft: ; e2a48
	ld hl, wBillsPC_LoadedBox
	ld a, [hl]
	and a
	jr z, .wrap_around
	dec [hl]
	jr BillsPC_LeftRightDidSomething

.wrap_around
	ld [hl], NUM_BOXES
	jr BillsPC_LeftRightDidSomething

BillsPC_PressRight: ; e2a56
	ld hl, wBillsPC_LoadedBox
	ld a, [hl]
	cp NUM_BOXES
	jr z, .wrap_around
	inc [hl]
	jr BillsPC_LeftRightDidSomething

.wrap_around
	ld [hl], 0
	jr BillsPC_LeftRightDidSomething

BillsPC_JoypadDidNothing: ; e2a65 (38:6a65)
	xor a
	and a
	ret

BillsPC_UpDownDidSomething: ; e2a68 (38:6a68)
	ld a, TRUE
	and a
	ret
; e2a6c (38:6a6c)

BillsPC_LeftRightDidSomething: ; e2a6c
	scf
	ret
; e2a6e

BillsPC_PlaceString: ; e2a6e (38:6a6e)
	push de
	hlcoord 0, 15
	lb bc, 1, 18
	call TextBox
	pop de
	hlcoord 1, 16
	call PlaceString
	ret
; e2a80 (38:6a80)

BillsPC_MoveMonWOMail_BoxNameAndArrows: ; e2a80
	call BillsPC_BoxName
	hlcoord 8, 1
	ld [hl], $5f
	hlcoord 19, 1
	ld [hl], $5e
	ret
; e2a8e

BillsPC_BoxName: ; e2a8e (38:6a8e)
	hlcoord 8, 0
	lb bc, 1, 10
	call TextBox

	ld a, [wBillsPC_LoadedBox]
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
	ld de, .PartyPKMN
.print
	hlcoord 10, 1
	call PlaceString
	ret
; e2abd (38:6abd)

.PartyPKMN:
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

	call BillsPC_GetSelectedPokemonSpecies
	and a
	ret z
	cp -1
	ret z

	ld [wd265], a
	hlcoord 1, 4
	xor a
	ld b, 7
.row
	ld c, 7
	push af
	push hl
.col
	ld [hli], a
	add 7
	dec c
	jr nz, .col
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	pop af
	inc a
	dec b
	jr nz, .row

	call BillsPC_LoadMonStats
	ld a, [wd265]
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	ld hl, TempMonDVs
	predef GetUnownLetter
	call GetBaseData
	ld de, VTiles2 tile $00
	predef GetFrontpic
	xor a
	ld [wBillsPC_MonHasMail], a
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
	jr c, .skip_gender
	ld a, "♂"
	jr nz, .printgender
	ld a, "♀"
.printgender
	hlcoord 5, 12
	ld [hl], a
.skip_gender

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
	ld [wBillsPC_MonHasMail], a
	ld a, $5c ; mail icon
.printitem
	hlcoord 7, 12
	ld [hl], a
	ret

BillsPC_LoadMonStats: ; e2b6d (38:6b6d)
	ld a, [wBillsPC_CursorPosition]
	ld hl, wBillsPC_ScrollPosition
	add [hl]
	ld e, a
	ld d, $0
	ld hl, wBillsPCPokemonList + 1 ; box number
	add hl, de
	add hl, de
	add hl, de
	ld a, [hl]
	and a
	jr z, .party
	cp NUM_BOXES + 1
	jr z, .sBox
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

.party
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

.sBox
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

BillsPC_RefreshTextboxes: ; e2c2c (38:6c2c)
	hlcoord 8, 2
	lb bc, 10, 10
	call TextBox

	hlcoord 8, 2
	ld [hl], "└"
	hlcoord 19, 2
	ld [hl], "┘"

	ld a, [wBillsPC_ScrollPosition]
	ld e, a
	ld d, 0
	ld hl, wBillsPCPokemonList
	add hl, de
	add hl, de
	add hl, de
	ld e, l
	ld d, h
	hlcoord 9, 4
	ld a, [wBillsPC_NumMonsOnScreen]
.loop
	push af
	push de
	push hl
	call .PlaceNickname
	pop hl
	ld de, 2 * SCREEN_WIDTH
	add hl, de
	pop de
	inc de
	inc de
	inc de
	pop af
	dec a
	jr nz, .loop
	ret
; e2c67 (38:6c67)

.CancelString:
	db "CANCEL@"
; e2c6e

.PlaceNickname: ; e2c6e (38:6c6e)
	ld a, [de]
	and a
	ret z
	cp -1
	jr nz, .get_nickname
	ld de, .CancelString
	call PlaceString
	ret

.get_nickname
	inc de
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	ld e, a
	ld a, b
	and a
	jr z, .party
	cp NUM_BOXES + 1
	jr z, .sBox
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
	jr z, .boxfail
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

.boxfail
	call CloseSRAM
	pop hl
	jr .placeholder_string

.party
	push hl
	ld hl, PartySpecies
	ld d, $0
	add hl, de
	ld a, [hl]
	and a
	jr z, .partyfail
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

.partyfail
	pop hl
	jr .placeholder_string

.sBox
	push hl
	ld a, BANK(sBox)
	call GetSRAMBank
	ld hl, sBoxSpecies
	ld d, $0
	add hl, de
	ld a, [hl]
	and a
	jr z, .sBoxFail
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

.sBoxFail
	call CloseSRAM
	pop hl
.placeholder_string
	ld de, .Placeholder
	call PlaceString
	ret
; e2d2a (38:6d2a)

.Placeholder:
	db "-----@"
; e2d30

copy_box_data: MACRO
.loop\@
	ld a, [hl]
	cp -1
	jr z, .done\@
	and a
	jr z, .done\@
	ld [de], a
	inc de
	ld a, [wBillsPC_LoadedBox]
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
	jr .loop\@

.done\@
IF \1
	call CloseSRAM
ENDC
	ld a, -1
	ld [de], a
	ld a, [wd004]
	inc a
	ld [wBillsPC_NumMonsInBox], a
endm

CopyBoxmonSpecies: ; e2d30 (38:6d30)
	xor a
	ld hl, wBillsPCPokemonList
	ld bc, 3 * 30
	call ByteFill
	ld de, wBillsPCPokemonList
	xor a
	ld [wd003], a
	ld [wd004], a
	ld a, [wBillsPC_LoadedBox]
	and a
	jr z, .party
	cp NUM_BOXES + 1
	jr z, .sBox
	ld b, a
	call GetBoxPointer
	ld a, b
	call GetSRAMBank
	inc hl
	copy_box_data 1
	ret

.party
	ld hl, PartySpecies
	copy_box_data 0
	ret

.sBox
	ld a, BANK(sBox)
	call GetSRAMBank
	ld hl, sBoxSpecies
	copy_box_data 1
	ret

BillsPC_GetSelectedPokemonSpecies: ; e2def (38:6def)
	ld a, [wBillsPC_CursorPosition]
	ld hl, wBillsPC_ScrollPosition
	add [hl]
	ld e, a
	ld d, $0
	ld hl, wBillsPCPokemonList
	add hl, de
	add hl, de
	add hl, de
	ld a, [hl]
	ret

BillsPC_UpdateSelectionCursor: ; e2e01 (38:6e01)
	ld a, [wBillsPC_NumMonsInBox]
	and a
	jr nz, .place_cursor
	call ClearSprites
	ret

.place_cursor
	ld hl, .OAM
	ld de, Sprites
.loop
	ld a, [hl]
	cp -1
	ret z
	ld a, [wBillsPC_CursorPosition]
	and $7
	swap a
	add [hl]
	inc hl
	ld [de], a
	inc de
rept 3
	ld a, [hli]
	ld [de], a
	inc de
endr
	jr .loop
; e2e2b (38:6e2b)

.OAM: ; e2e2b
	dsprite 4, 6, 10, 0, $00, $00
	dsprite 4, 6, 11, 0, $00, $00
	dsprite 4, 6, 12, 0, $00, $00
	dsprite 4, 6, 13, 0, $00, $00
	dsprite 4, 6, 14, 0, $00, $00
	dsprite 4, 6, 15, 0, $00, $00
	dsprite 4, 6, 16, 0, $00, $00
	dsprite 4, 6, 17, 0, $00, $00
	dsprite 4, 6, 18, 0, $00, $00
	dsprite 4, 6, 18, 7, $00, $00
	dsprite 7, 1, 10, 0, $00, $40
	dsprite 7, 1, 11, 0, $00, $40
	dsprite 7, 1, 12, 0, $00, $40
	dsprite 7, 1, 13, 0, $00, $40
	dsprite 7, 1, 14, 0, $00, $40
	dsprite 7, 1, 15, 0, $00, $40
	dsprite 7, 1, 16, 0, $00, $40
	dsprite 7, 1, 17, 0, $00, $40
	dsprite 7, 1, 18, 0, $00, $40
	dsprite 7, 1, 18, 7, $00, $40
	dsprite 5, 6,  9, 6, $01, $00
	dsprite 6, 1,  9, 6, $01, $40
	dsprite 5, 6, 19, 1, $01, $20
	dsprite 6, 1, 19, 1, $01, $60
	db -1
; e2e8c

BillsPC_UpdateInsertCursor: ; e2e8c
	ld hl, .OAM
	ld de, Sprites
.loop
	ld a, [hl]
	cp -1
	ret z
	ld a, [wBillsPC_CursorPosition]
	and $7
	swap a
	add [hl]
	inc hl
	ld [de], a
	inc de
rept 3
	ld a, [hli]
	ld [de], a
	inc de
endr
	jr .loop
; e2eac

.OAM: ; e2eac
	dsprite 4, 7, 10, 0, $06, $00
	dsprite 5, 3, 11, 0, $00, $40
	dsprite 5, 3, 12, 0, $00, $40
	dsprite 5, 3, 13, 0, $00, $40
	dsprite 5, 3, 14, 0, $00, $40
	dsprite 5, 3, 15, 0, $00, $40
	dsprite 5, 3, 16, 0, $00, $40
	dsprite 5, 3, 17, 0, $00, $40
	dsprite 5, 3, 18, 0, $00, $40
	dsprite 4, 7, 19, 0, $07, $00
	db -1
; e2ed5

BillsPC_UnusedFillBox: ; e2ed5
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret
; e2ee5

BillsPC_CheckSpaceInDestination: ; e2ee5
; If moving within a box, no need to be here.
	ld hl, wBillsPC_LoadedBox
	ld a, [wBillsPC_BackupLoadedBox]
	cp [hl]
	jr z, .same_box

; Exceeding box or party capacity is a big no-no.
	ld a, [wBillsPC_LoadedBox]
	and a
	jr z, .party
	ld e, MONS_PER_BOX + 1
	jr .compare

.party
	ld e, PARTY_LENGTH + 1
.compare
	ld a, [wBillsPC_NumMonsInBox]
	cp e
	jr nc, .no_room
.same_box
	and a
	ret

.no_room
	ld de, PCString_TheresNoRoom
	call BillsPC_PlaceString
	ld de, SFX_WRONG
	call WaitPlaySFX
	call WaitSFX
	ld c, 50
	call DelayFrames
	scf
	ret
; e2f18

BillsPC_CheckMail_PreventBlackout: ; e2f18 (38:6f18)
	ld a, [wBillsPC_LoadedBox]
	and a
	jr nz, .Okay
	ld a, [wBillsPC_NumMonsInBox]
	cp $3
	jr c, .ItsYourLastPokemon
	ld a, [wBillsPC_CursorPosition]
	ld hl, wBillsPC_ScrollPosition
	add [hl]
	ld [CurPartyMon], a
	callba CheckCurPartyMonFainted
	jr c, .AllOthersFainted
	ld a, [wBillsPC_MonHasMail]
	and a
	jr nz, .HasMail
.Okay:
	and a
	ret

.HasMail:
	ld de, PCString_RemoveMail
	jr .NotOkay

.AllOthersFainted:
	ld de, PCString_NoMoreUsablePKMN
	jr .NotOkay

.ItsYourLastPokemon:
	ld de, PCString_ItsYourLastPKMN
.NotOkay:
	call BillsPC_PlaceString
	ld de, SFX_WRONG
	call WaitPlaySFX
	call WaitSFX
	ld c, 50
	call DelayFrames
	scf
	ret

BillsPC_IsMonAnEgg: ; e2f5f (38:6f5f)
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .egg
	and a
	ret

.egg
	ld de, PCString_NoReleasingEGGS
	call BillsPC_PlaceString
	ld de, SFX_WRONG
	call WaitPlaySFX
	call WaitSFX
	ld c, 50
	call DelayFrames
	scf
	ret

BillsPC_StatsScreen: ; e2f7e (38:6f7e)
	call LowVolume
	call BillsPC_CopyMon
	ld a, $3
	ld [MonType], a
	predef StatsScreenInit
	call BillsPC_InitGFX
	call MaxVolume
	ret

StatsScreenDPad: ; e2f95 (38:6f95)
	ld hl, hJoyPressed ; $ffa7
	ld a, [hl]
	and A_BUTTON | B_BUTTON | D_RIGHT | D_LEFT
	ld [wMenuJoypad], a
	jr nz, .pressed_a_b_right_left
	ld a, [hl]
	and D_DOWN | D_UP
	ld [wMenuJoypad], a
	jr nz, .pressed_down_up
	jr .pressed_a_b_right_left

.pressed_down_up
	call _StatsScreenDPad
	and a
	jr z, .did_nothing
	call BillsPC_GetSelectedPokemonSpecies
	ld [wd265], a
	call BillsPC_LoadMonStats
	ld a, [wd265]
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	ld hl, TempMonDVs
	predef GetUnownLetter
	call GetBaseData
	call BillsPC_CopyMon
.pressed_a_b_right_left
	ret

.did_nothing
	xor a
	ld [wMenuJoypad], a
	ret

BillsPC_CopyMon: ; e2fd6 (38:6fd6)
	ld a, [wBillsPC_CursorPosition]
	ld hl, wBillsPC_ScrollPosition
	add [hl]
	ld [CurPartyMon], a
	ld a, [wBillsPC_LoadedBox]
	and a
	jr z, .party
	cp NUM_BOXES + 1
	jr nz, .box
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
	ld de, wBufferMon
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	call CloseSRAM
	callba CalcwBufferMonStats
	ret

.party
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
	ld de, wBufferMon
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	ret

.box
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
	callba CalcwBufferMonStats
	ret

DepositPokemon: ; e307c (38:707c)
	ld a, [wBillsPC_CursorPosition]
	ld hl, wBillsPC_ScrollPosition
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
	callba RemoveMonFromPartyOrBox
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
	call BillsPC_PlaceString
	ld de, SFX_WRONG
	call WaitPlaySFX
	call WaitSFX
	ld c, 50
	call DelayFrames
	scf
	ret

TryWithdrawPokemon: ; e30fa (38:70fa)
	ld a, [wBillsPC_CursorPosition]
	ld hl, wBillsPC_ScrollPosition
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
	callba RemoveMonFromPartyOrBox
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

.PartyFull:
	ld de, PCString_PartyFull
	call BillsPC_PlaceString
	ld de, SFX_WRONG
	call WaitPlaySFX
	call WaitSFX
	ld c, 50
	call DelayFrames
	scf
	ret


ReleasePKMN_ByePKMN: ; e3180 (38:7180)
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
	jr c, .skip_cry
	ld e, c
	ld d, b
	call PlayCryHeader
.skip_cry

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

MovePKMNWitoutMail_InsertMon: ; e31e7
	push hl
	push de
	push bc
	push af
	hlcoord 0, 15
	lb bc, 1, 18
	call TextBox
	hlcoord 1, 16
	ld de, .Saving_LeaveOn
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
	ld a, [wBillsPC_BackupLoadedBox]
	and a
	jr nz, .moving_from_box
	set 0, c

.moving_from_box
	ld a, [wBillsPC_LoadedBox]
	and a
	jr nz, .moving_to_box
	set 1, c

.moving_to_box
	ld hl, .Jumptable
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .dw_return
	push de
	jp [hl]
; e322a

.dw_return ; e322a
	pop af
	ld e, a
	callba MovePkmnWOMail_InsertMon_SaveGame
	ret
; e3233

.Saving_LeaveOn:
	db "Saving… Leave ON!@"
; e3245

.Jumptable: ; e3245

	dw .BoxToBox
	dw .PartyToBox
	dw .BoxToParty
	dw .PartyToParty
; e324d

.BoxToBox: ; e324d
	ld hl, wBillsPC_BackupLoadedBox
	ld a, [wBillsPC_LoadedBox]
	cp [hl]
	jr z, .same_box
	call .CopyFromBox
	call .CopyToBox
	ret

.same_box
	call .CopyFromBox
	call .CheckTrivialMove
	call .CopyToBox
	ret
; e3267

.PartyToBox: ; e3267
	call .CopyFromParty
	ld a, $1
	ld [wGameLogicPaused], a
	callba SaveGameData
	xor a
	ld [wGameLogicPaused], a
	call .CopyToBox
	ret
; e327d

.BoxToParty: ; e327d
	call .CopyFromBox
	call .CopyToParty
	ret
; e3284

.PartyToParty: ; e3284
	call .CopyFromParty
	call .CheckTrivialMove
	call .CopyToParty
	ret
; e328e

.CheckTrivialMove: ; e328e
	ld a, [wBillsPC_CursorPosition]
	ld hl, wBillsPC_ScrollPosition
	add [hl]
	ld e, a
	ld a, [wBillsPC_BackupCursorPosition]
	ld hl, wBillsPC_BackupScrollPosition
	add [hl]
	cp e
	ret nc
	ld hl, wBillsPC_CursorPosition
	ld a, [hl]
	and a
	jr z, .top_of_screen
	dec [hl]
	ret

.top_of_screen
	ld hl, wBillsPC_ScrollPosition
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret
; e32b0

.CopyFromBox: ; e32b0
	ld a, [wBillsPC_BackupLoadedBox]
	dec a
	ld e, a
	callba MovePkmnWOMail_SaveGame
	ld a, [wBillsPC_BackupCursorPosition]
	ld hl, wBillsPC_BackupScrollPosition
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
	callba CalcwBufferMonStats
	ld a, PC_DEPOSIT
	ld [wPokemonWithdrawDepositParameter], a
	callba RemoveMonFromPartyOrBox
	ret
; e32fa

.CopyToBox: ; e32fa
	ld a, [wBillsPC_LoadedBox]
	dec a
	ld e, a
	callba MovePkmnWOMail_SaveGame
	ld a, [wBillsPC_CursorPosition]
	ld hl, wBillsPC_ScrollPosition
	add [hl]
	ld [CurPartyMon], a
	callba InsertPokemonIntoBox
	ret
; e3316

.CopyFromParty: ; e3316
	ld a, [wBillsPC_BackupCursorPosition]
	ld hl, wBillsPC_BackupScrollPosition
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
	callba RemoveMonFromPartyOrBox
	ret
; e3346

.CopyToParty: ; e3346
	ld a, [wBillsPC_CursorPosition]
	ld hl, wBillsPC_ScrollPosition
	add [hl]
	ld [CurPartyMon], a
	callba InsertPokemonIntoParty
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
	ld de, wBufferMonNick
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	ret

CopyOTNameToTemp: ; e3376 (38:7376)
	ld bc, NAME_LENGTH
	ld a, [CurPartyMon]
	call AddNTimes
	ld de, wBufferMonOT
	ld bc, NAME_LENGTH
	call CopyBytes
	ret

CopyMonToTemp: ; e3389 (38:7389)
	ld a, [CurPartyMon]
	call AddNTimes
	ld de, wBufferMon
	call CopyBytes
	ret

GetBoxPointer: ; e3396 (38:7396)
	dec b
	ld c, b
	ld b, 0
	ld hl, .boxes
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret
; e33a6 (38:73a6)

.boxes ; e33a6
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

BillsPC_ApplyPalettes: ; e33d0 (38:73d0)
	ld b, a
	call GetSGBLayout
	ld a, %11100100
	call DmgToCgbBGPals
	ld a, %11111100
	call DmgToCgbObjPal0
	ret

BillsPC_Jumptable: ; e33df (38:73df)
	ld e, a
	ld d, $0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

BillsPC_InitGFX: ; e33e8 (38:73e8)
	call DisableLCD
	ld hl, VTiles2 tile $00
	ld bc, $31 tiles
	xor a
	call ByteFill
	call LoadStandardFont
	call LoadFontsBattleExtra
	ld hl, PCMailGFX
	ld de, VTiles2 tile $5c
	ld bc, 4 tiles
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
	call BillsPC_ClearTilemap
.loop
	xor a
	ld [hBGMapMode], a
	call BillsPC_PrintBoxName
	call BillsPC_PlaceChooseABoxString
	ld hl, _ChangeBox_menudataheader
	call CopyMenuDataHeader
	xor a
	ld [wMenuScrollPosition], a
	hlcoord 0, 4
	lb bc, 8, 9
	call TextBox
	call ScrollingMenu
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .done
	call BillsPC_PlaceWhatsUpString
	call BillsPC_ChangeBoxSubmenu
	jr .loop
.done
	call CloseWindow
	ret

BillsPC_ClearTilemap: ; e35e2 (38:75e2)
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

.menudata2 ; 0xe35f9
	db $22 ; flags
	db 4, 0
	db 1
	dba .boxes
	dba .boxnames
	dba NULL
	dba BillsPC_PrintBoxCountAndCapacity
; e3609

.boxes ; e3609
	db NUM_BOXES
x = 1
rept NUM_BOXES
	db x
x = x + 1
endr
	db -1
; e3619

.boxnames ; e3619
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

BillsPC_PrintBoxCountAndCapacity: ; e3632
	hlcoord 11, 7
	lb bc, 5, 7
	call TextBox
	ld a, [MenuSelection]
	cp -1
	ret z
	hlcoord 12, 9
	ld de, .Pokemon
	call PlaceString
	call GetBoxCount
	ld [wd265], a
	hlcoord 13, 11
	ld de, wd265
	lb bc, 1, 2
	call PrintNum
	ld de, .out_of_20
	call PlaceString
	ret
; e3663

.Pokemon: ; e3663
	db "#MON@"
; e3668

.out_of_20 ; e3668
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
	add hl, bc
	add hl, bc
	add hl, bc
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

.boxbanks ; e36a5
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

BillsPC_PrintBoxName: ; e36cf (38:76cf)
	hlcoord 0, 0
	ld b, 2
	ld c, 18
	call TextBox
	hlcoord 1, 2
	ld de, .Current
	call PlaceString
	ld a, [wCurBox]
	and $f
	call GetBoxName
	hlcoord 11, 2
	call PlaceString
	ret
; e36f1 (38:76f1)

.Current: ; e36f1
	db "CURRENT@"
; e36f9

BillsPC_ChangeBoxSubmenu: ; e36f9 (38:76f9)
	ld hl, .MenuDataHeader
	call LoadMenuDataHeader
	call VerticalMenu
	call ExitMenu
	ret c
	ld a, [wMenuCursorY]
	cp $1
	jr z, .Switch
	cp $2
	jr z, .Name
	cp $3
	jr z, .Print
	and a
	ret

.Print:
	call GetBoxCount
	and a
	jr z, .EmptyBox
	ld e, l
	ld d, h
	ld a, [MenuSelection]
	dec a
	ld c, a
	callba PrintPCBox
	call BillsPC_ClearTilemap
	and a
	ret

.EmptyBox:
	call BillsPC_PlaceEmptyBoxString_SFX
	and a
	ret

.Switch:
	ld a, [MenuSelection]
	dec a
	ld e, a
	ld a, [wCurBox]
	cp e
	ret z
	callba ChangeBoxSaveGame
	ret

.Name:
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
	ld c, BOX_NAME_LENGTH - 1
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

BillsPC_PlaceChooseABoxString: ; e379c (38:779c)
	ld de, .ChooseABox
	jr BillsPC_PlaceChangeBoxString
; e37a1 (38:77a1)

.ChooseABox: ; e37a1
	db "Choose a BOX.@"
; e37af

BillsPC_PlaceWhatsUpString: ; e37af (38:77af)
	ld de, .WhatsUp
	jr BillsPC_PlaceChangeBoxString
; e37b4 (38:77b4)

.WhatsUp: ; e37b4
	db "What's up?@"
; e37be

BillsPC_PlaceEmptyBoxString_SFX: ; e37be (38:77be)
	ld de, .NoMonString
	call BillsPC_PlaceChangeBoxString
	ld de, SFX_WRONG
	call WaitPlaySFX
	call WaitSFX
	ld c, 50
	call DelayFrames
	ret
; e37d3 (38:77d3)

.NoMonString: ; e37d3
	db "There's no #MON.@"
; e37e3

BillsPC_PlaceChangeBoxString: ; e37e3 (38:77e3)
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
