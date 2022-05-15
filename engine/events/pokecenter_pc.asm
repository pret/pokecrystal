	; PokemonCenterPC.WhichPC indexes
	const_def
	const PCPC_BEFORE_POKEDEX ; 0
	const PCPC_BEFORE_HOF     ; 1
	const PCPC_POSTGAME       ; 2

	; PokemonCenterPC.Jumptable indexes
	const_def
	const PCPCITEM_PLAYERS_PC   ; 0
	const PCPCITEM_BILLS_PC     ; 1
	const PCPCITEM_OAKS_PC      ; 2
	const PCPCITEM_HALL_OF_FAME ; 3
	const PCPCITEM_TURN_OFF     ; 4

PokemonCenterPC:
	call PC_CheckPartyForPokemon
	ret c
	call PC_PlayBootSound
	ld hl, PokecenterPCTurnOnText
	call PC_DisplayText
	ld hl, PokecenterPCWhoseText
	call PC_DisplayTextWaitMenu
	ld hl, .TopMenu
	call LoadMenuHeader
.loop
	xor a
	ldh [hBGMapMode], a
	call .ChooseWhichPCListToUse
	ld [wWhichIndexSet], a
	call DoNthMenu
	jr c, .shutdown
	ld a, [wMenuSelection]
	ld hl, .Jumptable
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
	dw .Jumptable

.Jumptable:
; entries correspond to PCPCITEM_* constants
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
; entries correspond to PCPC_* constants

	; PCPC_BEFORE_POKEDEX
	db 3
	db PCPCITEM_BILLS_PC
	db PCPCITEM_PLAYERS_PC
	db PCPCITEM_TURN_OFF
	db -1 ; end

	; PCPC_BEFORE_HOF
	db 4
	db PCPCITEM_BILLS_PC
	db PCPCITEM_PLAYERS_PC
	db PCPCITEM_OAKS_PC
	db PCPCITEM_TURN_OFF
	db -1 ; end

	; PCPC_POSTGAME
	db 5
	db PCPCITEM_BILLS_PC
	db PCPCITEM_PLAYERS_PC
	db PCPCITEM_OAKS_PC
	db PCPCITEM_HALL_OF_FAME
	db PCPCITEM_TURN_OFF
	db -1 ; end

.ChooseWhichPCListToUse:
	call CheckReceivedDex
	jr nz, .got_dex
	ld a, PCPC_BEFORE_POKEDEX
	ret

.got_dex
	ld a, [wHallOfFameCount]
	and a
	ld a, PCPC_BEFORE_HOF
	ret z
	ld a, PCPC_POSTGAME
	ret

PC_CheckPartyForPokemon:
	ld a, [wPartyCount]
	and a
	ret nz
	ld de, SFX_CHOOSE_PC_OPTION
	call PlaySFX
	ld hl, .PokecenterPCCantUseText
	call PC_DisplayText
	scf
	ret

.PokecenterPCCantUseText:
	text_far _PokecenterPCCantUseText
	text_end


	; PlayersPCMenuData.WhichPC indexes
	const_def
	const PLAYERSPC_NORMAL ; 0
	const PLAYERSPC_HOUSE  ; 1

	; PlayersPCMenuData.PlayersPCMenuPointers indexes
	const_def
	const PLAYERSPCITEM_WITHDRAW_ITEM ; 0
	const PLAYERSPCITEM_DEPOSIT_ITEM  ; 1
	const PLAYERSPCITEM_TOSS_ITEM     ; 2
	const PLAYERSPCITEM_MAIL_BOX      ; 3
	const PLAYERSPCITEM_DECORATION    ; 4
	const PLAYERSPCITEM_LOG_OFF       ; 5
	const PLAYERSPCITEM_TURN_OFF      ; 6

BillsPC:
	call PC_PlayChoosePCSound
	ld hl, PokecenterBillsPCText
	call PC_DisplayText
	farcall _BillsPC
	and a
	ret

PlayersPC:
	call PC_PlayChoosePCSound
	ld hl, PokecenterPlayersPCText
	call PC_DisplayText
	ld b, PLAYERSPC_NORMAL
	call _PlayersPC
	and a
	ret

OaksPC:
	call PC_PlayChoosePCSound
	ld hl, PokecenterOaksPCText
	call PC_DisplayText
	farcall ProfOaksPC
	and a
	ret

HallOfFamePC:
	call PC_PlayChoosePCSound
	call FadeToMenu
	farcall _HallOfFamePC
	call CloseSubmenu
	and a
	ret

TurnOffPC:
	ld hl, PokecenterPCOaksClosedText
	call PrintText
	scf
	ret

PC_PlayBootSound:
	ld de, SFX_BOOT_PC
	jr PC_WaitPlaySFX

PC_PlayShutdownSound:
	ld de, SFX_SHUT_DOWN_PC
	call PC_WaitPlaySFX
	call WaitSFX
	ret

PC_PlayChoosePCSound:
	ld de, SFX_CHOOSE_PC_OPTION
	jr PC_WaitPlaySFX

PC_PlaySwapItemsSound:
	ld de, SFX_SWITCH_POKEMON
	call PC_WaitPlaySFX
	ld de, SFX_SWITCH_POKEMON

PC_WaitPlaySFX:
	push de
	call WaitSFX
	pop de
	call PlaySFX
	ret

_PlayersHousePC:
	call PC_PlayBootSound
	ld hl, PlayersPCTurnOnText
	call PC_DisplayText
	ld b, PLAYERSPC_HOUSE
	call _PlayersPC
	and a
	jr nz, .changed_deco_tiles
	call OverworldTextModeSwitch
	call ApplyTilemap
	call UpdateSprites
	call PC_PlayShutdownSound
	ld c, FALSE
	ret

.changed_deco_tiles
	call ClearBGPalettes
	ld c, TRUE
	ret

PlayersPCTurnOnText:
	text_far _PlayersPCTurnOnText
	text_end

_PlayersPC:
	ld a, b
	ld [wWhichIndexSet], a
	ld hl, PlayersPCAskWhatDoText
	call PC_DisplayTextWaitMenu
	call .PlayersPC
	call ExitMenu
	ret

.PlayersPC:
	xor a
	ld [wPCItemsCursor], a
	ld [wPCItemsScrollPosition], a
	ld hl, PlayersPCMenuData
	call LoadMenuHeader
.loop
	call UpdateTimePals
	call DoNthMenu
	jr c, .turn_off
	call MenuJumptable
	jr nc, .loop
	jr .done

.turn_off
	xor a

.done
	call ExitMenu
	ret

PlayersPCMenuData:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 12
	dw .PlayersPCMenuData
	db 1 ; default selected option

.PlayersPCMenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP ; flags
	db 0 ; # items?
	dw .WhichPC
	dw PlaceNthMenuStrings
	dw .PlayersPCMenuPointers

.PlayersPCMenuPointers:
; entries correspond to PLAYERSPCITEM_* constants
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

.WhichPC:
; entries correspond to PLAYERSPC_* constants

	; PLAYERSPC_NORMAL
	db 5
	db PLAYERSPCITEM_WITHDRAW_ITEM
	db PLAYERSPCITEM_DEPOSIT_ITEM
	db PLAYERSPCITEM_TOSS_ITEM
	db PLAYERSPCITEM_MAIL_BOX
	db PLAYERSPCITEM_LOG_OFF
	db -1 ; end

	; PLAYERSPC_HOUSE
	db 6
	db PLAYERSPCITEM_WITHDRAW_ITEM
	db PLAYERSPCITEM_DEPOSIT_ITEM
	db PLAYERSPCITEM_TOSS_ITEM
	db PLAYERSPCITEM_MAIL_BOX
	db PLAYERSPCITEM_DECORATION
	db PLAYERSPCITEM_TURN_OFF
	db -1 ; end

PC_DisplayTextWaitMenu:
	ld a, [wOptions]
	push af
	set NO_TEXT_SCROLL, a
	ld [wOptions], a
	call MenuTextbox
	pop af
	ld [wOptions], a
	ret

PlayersPCAskWhatDoText:
	text_far _PlayersPCAskWhatDoText
	text_end

PlayerWithdrawItemMenu:
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
	ld a, [wItemAttributeValue]
	and a
	jr z, .askquantity

	; items without quantity are always ×1
	ld a, 1
	ld [wItemQuantityChange], a
	jr .withdraw

.askquantity
	ld hl, .PlayersPCHowManyWithdrawText
	call MenuTextbox
	farcall SelectQuantityToToss
	call ExitMenu
	call ExitMenu
	jr c, .done

.withdraw
	ld a, [wItemQuantityChange]
	ld [wPCItemQuantityChange], a
	ld a, [wCurItemQuantity]
	ld [wPCItemQuantity], a
	ld hl, wNumItems
	call ReceiveItem
	jr nc, .PackFull
	ld a, [wPCItemQuantityChange]
	ld [wItemQuantityChange], a
	ld a, [wPCItemQuantity]
	ld [wCurItemQuantity], a
	ld hl, wNumPCItems
	call TossItem
	predef PartyMonItemName
	ld hl, .PlayersPCWithdrewItemsText
	call MenuTextbox
	xor a
	ldh [hBGMapMode], a
	call ExitMenu
	ret

.PackFull:
	ld hl, .PlayersPCNoRoomWithdrawText
	call MenuTextboxBackup
	ret

.done
	ret

.PlayersPCHowManyWithdrawText:
	text_far _PlayersPCHowManyWithdrawText
	text_end

.PlayersPCWithdrewItemsText:
	text_far _PlayersPCWithdrewItemsText
	text_end

.PlayersPCNoRoomWithdrawText:
	text_far _PlayersPCNoRoomWithdrawText
	text_end

PlayerTossItemMenu:
	call LoadStandardMenuHeader
	farcall ClearPCItemScreen
.loop
	call PCItemsJoypad
	jr c, .quit
	ld de, wNumPCItems
	farcall TossItemFromPC
	jr .loop

.quit
	call CloseSubmenu
	xor a
	ret

PlayerDecorationMenu:
	farcall _PlayerDecorationMenu
	ld a, c
	and a
	ret z
	scf
	ret

PlayerLogOffMenu:
	xor a
	scf
	ret

PlayerDepositItemMenu:
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
	ld hl, .PlayersPCNoItemsText
	call MenuTextboxBackup
	scf
	ret

.PlayersPCNoItemsText:
	text_far _PlayersPCNoItemsText
	text_end

.TryDepositItem:
	ld a, [wSpriteUpdatesEnabled]
	push af
	ld a, FALSE
	ld [wSpriteUpdatesEnabled], a
	farcall CheckItemMenu
	ld a, [wItemAttributeValue]
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
	ld a, [wPCItemQuantityChange]
	push af
	ld a, [wPCItemQuantity]
	push af
	call .DepositItem
	pop af
	ld [wPCItemQuantity], a
	pop af
	ld [wPCItemQuantityChange], a
	ret

.DepositItem:
	farcall _CheckTossableItem
	ld a, [wItemAttributeValue]
	and a
	jr z, .AskQuantity
	ld a, 1
	ld [wItemQuantityChange], a
	jr .ContinueDeposit

.AskQuantity:
	ld hl, .PlayersPCHowManyDepositText
	call MenuTextbox
	farcall SelectQuantityToToss
	push af
	call ExitMenu
	call ExitMenu
	pop af
	jr c, .DeclinedToDeposit

.ContinueDeposit:
	ld a, [wItemQuantityChange]
	ld [wPCItemQuantityChange], a
	ld a, [wCurItemQuantity]
	ld [wPCItemQuantity], a
	ld hl, wNumPCItems
	call ReceiveItem
	jr nc, .NoRoomInPC
	ld a, [wPCItemQuantityChange]
	ld [wItemQuantityChange], a
	ld a, [wPCItemQuantity]
	ld [wCurItemQuantity], a
	ld hl, wNumItems
	call TossItem
	predef PartyMonItemName
	ld hl, .PlayersPCDepositItemsText
	call PrintText
	ret

.NoRoomInPC:
	ld hl, .PlayersPCNoRoomDepositText
	call PrintText
	ret

.DeclinedToDeposit:
	and a
	ret

.PlayersPCHowManyDepositText:
	text_far _PlayersPCHowManyDepositText
	text_end

.PlayersPCDepositItemsText:
	text_far _PlayersPCDepositItemsText
	text_end

.PlayersPCNoRoomDepositText:
	text_far _PlayersPCNoRoomDepositText
	text_end

PlayerMailBoxMenu:
	farcall _PlayerMailBoxMenu
	xor a
	ret

PCItemsJoypad:
	xor a
	ld [wSwitchItem], a
.loop
	ld a, [wSpriteUpdatesEnabled]
	push af
	ld a, FALSE
	ld [wSpriteUpdatesEnabled], a
	ld hl, .PCItemsMenuData
	call CopyMenuHeader
	hlcoord 0, 0
	ld b, 10
	ld c, 18
	call Textbox
	ld a, [wPCItemsCursor]
	ld [wMenuCursorPosition], a
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
	db 4, 8 ; rows, columns
	db SCROLLINGMENU_ITEMS_QUANTITY ; item format
	dbw 0, wNumPCItems
	dba PlaceMenuItemName
	dba PlaceMenuItemQuantity
	dba UpdateItemDescription

PC_DisplayText:
	call MenuTextbox
	call ExitMenu
	ret

PokecenterPCTurnOnText:
	text_far _PokecenterPCTurnOnText
	text_end

PokecenterPCWhoseText:
	text_far _PokecenterPCWhoseText
	text_end

PokecenterBillsPCText:
	text_far _PokecenterBillsPCText
	text_end

PokecenterPlayersPCText:
	text_far _PokecenterPlayersPCText
	text_end

PokecenterOaksPCText:
	text_far _PokecenterOaksPCText
	text_end

PokecenterPCOaksClosedText:
	text_far _PokecenterPCOaksClosedText
	text_end
