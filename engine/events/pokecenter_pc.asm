PokemonCenterPC: ; 1559a
	call PC_CheckPartyForPokemon
	ret c
	call PC_PlayBootSound
	ld hl, PokecenterPCText_BootedUpPC
	call PC_DisplayText
	ld hl, PokecenterPCText_AccessWhosePC
	call PC_DisplayTextWaitMenu
	ld hl, .TopMenu
	call LoadMenuHeader
.loop
	xor a
	ld [hBGMapMode], a
	call .ChooseWhichPCListToUse
	ld [wWhichIndexSet], a
	call DoNthMenu
	jr c, .shutdown
	ld a, [wMenuSelection]
	ld hl, .JumpTable
	call MenuJumptable
	jr nc, .loop

.shutdown
	call PC_PlayShutdownSound
	call ExitMenu
	call CloseWindow
	ret

.TopMenu:
	db MENU_BACKUP_TILES | MENU_NO_CLICK_SFX ; flags
	menu_coords 0, 0, 15, 12
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP ; flags
	db 0 ; items
	dw .WhichPC
	dw PlaceNthMenuStrings
	dw .JumpTable

PCPC_PLAYERS_PC   EQU 0
PCPC_BILLS_PC     EQU 1
PCPC_OAKS_PC      EQU 2
PCPC_HALL_OF_FAME EQU 3
PCPC_TURN_OFF     EQU 4

.JumpTable:
; entries correspond to PCPC_* constants
	dw PlayersPC,    .String_PlayersPC
	dw BillsPC,      .String_BillsPC
	dw OaksPC,       .String_OaksPC
	dw HallOfFamePC, .String_HallOfFame
	dw TurnOffPC,    .String_TurnOff

.String_PlayersPC:  db "<PLAYER>'s PC@"
.String_BillsPC:    db "BILL's PC@"
.String_OaksPC:     db "PROF.OAK's PC@"
.String_HallOfFame: db "HALL OF FAME@"
.String_TurnOff:    db "TURN OFF@"

.WhichPC:
	; before Pokédex
	db 3
	db PCPC_BILLS_PC
	db PCPC_PLAYERS_PC
	db PCPC_TURN_OFF
	db -1 ; end

	; before Hall Of Fame
	db 4
	db PCPC_BILLS_PC
	db PCPC_PLAYERS_PC
	db PCPC_OAKS_PC
	db PCPC_TURN_OFF
	db -1 ; end

	; postgame
	db 5
	db PCPC_BILLS_PC
	db PCPC_PLAYERS_PC
	db PCPC_OAKS_PC
	db PCPC_HALL_OF_FAME
	db PCPC_TURN_OFF
	db -1 ; end

.ChooseWhichPCListToUse:
	call CheckReceivedDex
	jr nz, .got_dex
	ld a, 0 ; before Pokédex
	ret

.got_dex
	ld a, [wHallOfFameCount]
	and a
	ld a, 1 ; before Hall Of Fame
	ret z
	ld a, 2 ; postgame
	ret
; 15650

PC_CheckPartyForPokemon: ; 15650
	ld a, [wPartyCount]
	and a
	ret nz
	ld de, SFX_CHOOSE_PC_OPTION
	call PlaySFX
	ld hl, .MustHavePokemonToUse
	call PC_DisplayText
	scf
	ret

.MustHavePokemonToUse:
	; Bzzzzt! You must have a #MON to use this!
	text_jump UnknownText_0x1c1328
	db "@"
; 0x15668

BillsPC: ; 15668
	call PC_PlayChoosePCSound
	ld hl, PokecenterPCText_AccessedBillsPC
	call PC_DisplayText
	farcall _BillsPC
	and a
	ret
; 15679 (5:5679)

PlayersPC: ; 15679
	call PC_PlayChoosePCSound
	ld hl, PokecenterPCText_AccessedOwnPC
	call PC_DisplayText
	ld b, $0
	call _PlayersPC
	and a
	ret
; 15689

OaksPC: ; 15689
	call PC_PlayChoosePCSound
	ld hl, PokecenterPCText_AccessedOaksPC
	call PC_DisplayText
	farcall ProfOaksPC
	and a
	ret
; 1569a

HallOfFamePC: ; 1569a
	call PC_PlayChoosePCSound
	call FadeToMenu
	farcall _HallOfFamePC
	call CloseSubmenu
	and a
	ret
; 156ab

TurnOffPC: ; 156ab
	ld hl, PokecenterPCText_LinkClosed
	call PrintText
	scf
	ret
; 156b3

PC_PlayBootSound: ; 156b3
	ld de, SFX_BOOT_PC
	jr PC_WaitPlaySFX

PC_PlayShutdownSound: ; 156b8
	ld de, SFX_SHUT_DOWN_PC
	call PC_WaitPlaySFX
	call WaitSFX
	ret

PC_PlayChoosePCSound: ; 156c2
	ld de, SFX_CHOOSE_PC_OPTION
	jr PC_WaitPlaySFX

PC_PlaySwapItemsSound: ; 156c7
	ld de, SFX_SWITCH_POKEMON
	call PC_WaitPlaySFX
	ld de, SFX_SWITCH_POKEMON

PC_WaitPlaySFX: ; 156d0
	push de
	call WaitSFX
	pop de
	call PlaySFX
	ret
; 156d9

_PlayersHousePC: ; 156d9
	call PC_PlayBootSound
	ld hl, UnknownText_0x156ff
	call PC_DisplayText
	ld b, $1
	call _PlayersPC
	and a
	jr nz, .asm_156f9
	call OverworldTextModeSwitch
	call ApplyTilemap
	call UpdateSprites
	call PC_PlayShutdownSound
	ld c, $0
	ret

.asm_156f9
	call ClearBGPalettes
	ld c, $1
	ret
; 156ff

UnknownText_0x156ff: ; 0x156ff
	; turned on the PC.
	text_jump UnknownText_0x1c1353
	db "@"
; 0x15704

_PlayersPC: ; 15704
	ld a, b
	ld [wWhichIndexSet], a
	ld hl, UnknownText_0x157cc
	call PC_DisplayTextWaitMenu
	call Function15715
	call ExitMenu
	ret
; 15715

Function15715: ; 15715
	xor a
	ld [wPCItemsCursor], a
	ld [wPCItemsScrollPosition], a
	ld hl, PlayersPCMenuData
	call LoadMenuHeader
.asm_15722
	call UpdateTimePals
	call DoNthMenu
	jr c, .asm_15731
	call MenuJumptable
	jr nc, .asm_15722
	jr .asm_15732

.asm_15731
	xor a

.asm_15732
	call ExitMenu
	ret
; 15736

PlayersPCMenuData: ; 0x15736
	db MENU_BACKUP_TILES ; flags
	db  0,  0 ; top left corner coords (y, x)
	db 12, 15 ; bottom right corner coords (y, x)
	dw .PlayersPCMenuData
	db 1 ; default selected option

.PlayersPCMenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP ; flags
	db 0 ; # items?
	dw .PlayersPCMenuList1
	dw PlaceNthMenuStrings
	dw .PlayersPCMenuPointers

PLAYERSPC_WITHDRAW_ITEM EQU 0
PLAYERSPC_DEPOSIT_ITEM  EQU 1
PLAYERSPC_TOSS_ITEM     EQU 2
PLAYERSPC_MAIL_BOX      EQU 3
PLAYERSPC_DECORATION    EQU 4
PLAYERSPC_TURN_OFF      EQU 5
PLAYERSPC_LOG_OFF       EQU 6

.PlayersPCMenuPointers: ; 0x15746
; entries correspond to PLAYERSPC_* constants
	dw PlayerWithdrawItemMenu, .WithdrawItem
	dw PlayerDepositItemMenu,  .DepositItem
	dw PlayerTossItemMenu,     .TossItem
	dw PlayerMailBoxMenu,      .MailBox
	dw PlayerDecorationMenu,   .Decoration
	dw PlayerLogOffMenu,       .LogOff
	dw PlayerLogOffMenu,       .TurnOff

.WithdrawItem: db "WITHDRAW ITEM@"
.DepositItem:  db "DEPOSIT ITEM@"
.TossItem:     db "TOSS ITEM@"
.MailBox:      db "MAIL BOX@"
.Decoration:   db "DECORATION@"
.TurnOff:      db "TURN OFF@"
.LogOff:       db "LOG OFF@"

.PlayersPCMenuList1:
	db 5
	db PLAYERSPC_WITHDRAW_ITEM
	db PLAYERSPC_DEPOSIT_ITEM
	db PLAYERSPC_TOSS_ITEM
	db PLAYERSPC_MAIL_BOX
	db PLAYERSPC_TURN_OFF
	db -1 ; end

.PlayersPCMenuList2:
	db 6
	db PLAYERSPC_WITHDRAW_ITEM
	db PLAYERSPC_DEPOSIT_ITEM
	db PLAYERSPC_TOSS_ITEM
	db PLAYERSPC_MAIL_BOX
	db PLAYERSPC_DECORATION
	db PLAYERSPC_LOG_OFF
	db -1 ; end

PC_DisplayTextWaitMenu: ; 157bb
	ld a, [wOptions]
	push af
	set NO_TEXT_SCROLL, a
	ld [wOptions], a
	call MenuTextBox
	pop af
	ld [wOptions], a
	ret
; 157cc

UnknownText_0x157cc: ; 0x157cc
	; What do you want to do?
	text_jump UnknownText_0x1c1368
	db "@"
; 0x157d1

PlayerWithdrawItemMenu: ; 0x157d1
	call LoadStandardMenuHeader
	farcall ClearPCItemScreen
.loop
	call PCItemsJoypad
	jr c, .quit
	call .Submenu
	jr .loop

.quit
	call CloseSubmenu
	xor a
	ret

.Submenu:
	; check if the item has a quantity
	farcall _CheckTossableItem
	ld a, [wItemAttributeParamBuffer]
	and a
	jr z, .askquantity

	; items without quantity are always ×1
	ld a, 1
	ld [wItemQuantityChangeBuffer], a
	jr .withdraw

.askquantity
	ld hl, .HowManyText
	call MenuTextBox
	farcall SelectQuantityToToss
	call ExitMenu
	call ExitMenu
	jr c, .done

.withdraw
	ld a, [wItemQuantityChangeBuffer]
	ld [wBuffer1], a ; quantity
	ld a, [wCurItemQuantity]
	ld [wBuffer2], a
	ld hl, wNumItems
	call ReceiveItem
	jr nc, .PackFull
	ld a, [wBuffer1]
	ld [wItemQuantityChangeBuffer], a
	ld a, [wBuffer2]
	ld [wCurItemQuantity], a
	ld hl, wPCItems
	call TossItem
	predef PartyMonItemName
	ld hl, .WithdrewText
	call MenuTextBox
	xor a
	ld [hBGMapMode], a
	call ExitMenu
	ret

.PackFull:
	ld hl, .NoRoomText
	call MenuTextBoxBackup
	ret

.done
	ret

.HowManyText: ; 0x15850
	text_jump _PlayersPCHowManyWithdrawText
	db "@"

.WithdrewText: ; 0x15855
	text_jump _PlayersPCWithdrewItemsText
	db "@"

.NoRoomText: ; 0x1585a
	text_jump _PlayersPCNoRoomWithdrawText
	db "@"

PlayerTossItemMenu: ; 0x1585f
	call LoadStandardMenuHeader
	farcall ClearPCItemScreen
.loop
	call PCItemsJoypad
	jr c, .quit
	ld de, wPCItems
	farcall TossItemFromPC
	jr .loop

.quit
	call CloseSubmenu
	xor a
	ret
; 0x1587d

PlayerDecorationMenu: ; 0x1587d
	farcall _PlayerDecorationMenu
	ld a, c
	and a
	ret z
	scf
	ret
; 0x15888

PlayerLogOffMenu: ; 0x15888
	xor a
	scf
	ret
; 0x1588b

PlayerDepositItemMenu: ; 0x1588b
	call .CheckItemsInBag
	jr c, .nope
	call DisableSpriteUpdates
	call LoadStandardMenuHeader
	farcall DepositSellInitPackBuffers
.loop
	farcall DepositSellPack
	ld a, [wPackUsedItem]
	and a
	jr z, .close
	call .TryDepositItem
	farcall CheckRegisteredItem
	jr .loop

.close
	call CloseSubmenu

.nope
	xor a
	ret

.CheckItemsInBag:
	farcall HasNoItems
	ret nc
	ld hl, .NoItemsInBag
	call MenuTextBoxBackup
	scf
	ret

.NoItemsInBag:
	; No items here!
	text_jump UnknownText_0x1c13df
	db "@"

.TryDepositItem:
	ld a, [wSpriteUpdatesEnabled]
	push af
	ld a, $0
	ld [wSpriteUpdatesEnabled], a
	farcall CheckItemMenu
	ld a, [wItemAttributeParamBuffer]
	ld hl, .dw
	rst JumpTable
	pop af
	ld [wSpriteUpdatesEnabled], a
	ret

.dw
; entries correspond to ITEMMENU_* constants
	dw .tossable ; ITEMMENU_NOUSE
	dw .no_toss
	dw .no_toss
	dw .no_toss
	dw .tossable ; ITEMMENU_CURRENT
	dw .tossable ; ITEMMENU_PARTY
	dw .tossable ; ITEMMENU_CLOSE

.no_toss
	ret

.tossable
	ld a, [wBuffer1]
	push af
	ld a, [wBuffer2]
	push af
	call .DepositItem_
	pop af
	ld [wBuffer2], a
	pop af
	ld [wBuffer1], a
	ret

.DepositItem_:
	farcall _CheckTossableItem
	ld a, [wItemAttributeParamBuffer]
	and a
	jr z, .AskQuantity
	ld a, $1
	ld [wItemQuantityChangeBuffer], a
	jr .DepositItem

.AskQuantity:
	ld hl, .HowManyText
	call MenuTextBox
	farcall SelectQuantityToToss
	push af
	call ExitMenu
	call ExitMenu
	pop af
	jr c, .DeclinedToDeposit

.DepositItem:
	ld a, [wItemQuantityChangeBuffer]
	ld [wBuffer1], a
	ld a, [wCurItemQuantity]
	ld [wBuffer2], a
	ld hl, wPCItems
	call ReceiveItem
	jr nc, .NoRoomInPC
	ld a, [wBuffer1]
	ld [wItemQuantityChangeBuffer], a
	ld a, [wBuffer2]
	ld [wCurItemQuantity], a
	ld hl, wNumItems
	call TossItem
	predef PartyMonItemName
	ld hl, .DepositText
	call PrintText
	ret

.NoRoomInPC:
	ld hl, .NoRoomText
	call PrintText
	ret

.DeclinedToDeposit:
	and a
	ret

.HowManyText: ; 0x1596e
	text_jump _PlayersPCHowManyDepositText
	db "@"

.DepositText: ; 0x15973
	text_jump _PlayersPCDepositItemsText
	db "@"

.NoRoomText: ; 0x15978
	text_jump _PlayersPCNoRoomDepositText
	db "@"

PlayerMailBoxMenu: ; 0x1597d
	farcall _PlayerMailBoxMenu
	xor a
	ret
; 0x15985

PCItemsJoypad: ; 0x15985
	xor a
	ld [wSwitchItem], a
.loop
	ld a, [wSpriteUpdatesEnabled]
	push af
	ld a, $0
	ld [wSpriteUpdatesEnabled], a
	ld hl, .PCItemsMenuData
	call CopyMenuHeader
	hlcoord 0, 0
	ld b, 10
	ld c, 18
	call TextBox
	ld a, [wPCItemsCursor]
	ld [wMenuCursorBuffer], a
	ld a, [wPCItemsScrollPosition]
	ld [wMenuScrollPosition], a
	call ScrollingMenu
	ld a, [wMenuScrollPosition]
	ld [wPCItemsScrollPosition], a
	ld a, [wMenuCursorY]
	ld [wPCItemsCursor], a
	pop af
	ld [wSpriteUpdatesEnabled], a
	ld a, [wSwitchItem]
	and a
	jr nz, .moving_stuff_around
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .b_1
	cp A_BUTTON
	jr z, .a_1
	cp SELECT
	jr z, .select_1
	jr .next

.moving_stuff_around
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .b_2
	cp A_BUTTON
	jr z, .a_select_2
	cp SELECT
	jr z, .a_select_2
	jr .next

.b_2
	xor a
	ld [wSwitchItem], a
	jr .next

.a_select_2
	call PC_PlaySwapItemsSound
.select_1
	farcall SwitchItemsInBag
.next
	jp .loop

.a_1
	farcall ScrollingMenu_ClearLeftColumn
	call PlaceHollowCursor
	and a
	ret

.b_1
	scf
	ret

.PCItemsMenuData:
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 1, 18, 10
	dw .MenuData
	db 1 ; default option

.MenuData:
	db SCROLLINGMENU_ENABLE_SELECT | SCROLLINGMENU_ENABLE_FUNCTION3 | SCROLLINGMENU_DISPLAY_ARROWS ; flags
	db 4, 8 ; rows/cols?
	db 2 ; horizontal spacing?
	dbw 0, wPCItems
	dba PlaceMenuItemName
	dba PlaceMenuItemQuantity
	dba UpdateItemDescription

PC_DisplayText: ; 15a20
	call MenuTextBox
	call ExitMenu
	ret
; 15a27

PokecenterPCText_BootedUpPC: ; 0x15a27
	; turned on the PC.
	text_jump UnknownText_0x1c144d
	db "@"
; 0x15a2c

PokecenterPCText_AccessWhosePC: ; 0x15a2c
	; Access whose PC?
	text_jump UnknownText_0x1c1462
	db "@"
; 0x15a31

PokecenterPCText_AccessedBillsPC: ; 0x15a31
	; BILL's PC accessed. #MON Storage System opened.
	text_jump UnknownText_0x1c1474
	db "@"
; 0x15a36

PokecenterPCText_AccessedOwnPC: ; 0x15a36
	; Accessed own PC. Item Storage System opened.
	text_jump UnknownText_0x1c14a4
	db "@"
; 0x15a3b

PokecenterPCText_AccessedOaksPC: ; 0x15a3b
	; PROF.OAK's PC accessed. #DEX Rating System opened.
	text_jump UnknownText_0x1c14d2
	db "@"
; 0x15a40

PokecenterPCText_LinkClosed: ; 0x15a40
	; … Link closed…
	text_jump UnknownText_0x1c1505
	db "@"
; 0x15a45
