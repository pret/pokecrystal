	const_def
	const MARTTEXT_HOW_MANY
	const MARTTEXT_COSTS_THIS_MUCH
	const MARTTEXT_NOT_ENOUGH_MONEY
	const MARTTEXT_BAG_FULL
	const MARTTEXT_HERE_YOU_GO
	const MARTTEXT_SOLD_OUT

OpenMartDialog::
	call GetMart
	ld a, c
	ld [wMartType], a
	call LoadMartPointer
	ld a, [wMartType]
	ld hl, .dialogs
	rst JumpTable
	ret

.dialogs
	dw MartDialog
	dw HerbShop
	dw BargainShop
	dw Pharmacist
	dw RooftopSale

MartDialog:
	ld a, MARTTYPE_STANDARD
	ld [wMartType], a
	xor a ; STANDARDMART_HOWMAYIHELPYOU
	ld [wMartJumptableIndex], a
	call StandardMart
	ret

HerbShop:
	call FarReadMart
	call LoadStandardMenuHeader
	ld hl, HerbShopLadyIntroText
	call MartTextbox
	call BuyMenu
	ld hl, HerbalLadyComeAgainText
	call MartTextbox
	ret

BargainShop:
	ld b, BANK(BargainShopData)
	ld de, BargainShopData
	call LoadMartPointer
	call ReadMart
	call LoadStandardMenuHeader
	ld hl, BargainShopIntroText
	call MartTextbox
	call BuyMenu
	ld hl, wBargainShopFlags
	ld a, [hli]
	or [hl]
	jr z, .skip_set
	ld hl, wDailyFlags1
	set DAILYFLAGS1_GOLDENROD_UNDERGROUND_BARGAIN_F, [hl]

.skip_set
	ld hl, BargainShopComeAgainText
	call MartTextbox
	ret

Pharmacist:
	call FarReadMart
	call LoadStandardMenuHeader
	ld hl, PharmacyIntroText
	call MartTextbox
	call BuyMenu
	ld hl, PharmacyComeAgainText
	call MartTextbox
	ret

RooftopSale:
	ld b, BANK(RooftopSaleMart1)
	ld de, RooftopSaleMart1
	ld hl, wStatusFlags
	bit STATUSFLAGS_HALL_OF_FAME_F, [hl]
	jr z, .ok
	ld b, BANK(RooftopSaleMart2)
	ld de, RooftopSaleMart2

.ok
	call LoadMartPointer
	call ReadMart
	call LoadStandardMenuHeader
	ld hl, MartWelcomeText
	call MartTextbox
	call BuyMenu
	ld hl, MartComeAgainText
	call MartTextbox
	ret

INCLUDE "data/items/rooftop_sale.asm"

LoadMartPointer:
	ld a, b
	ld [wMartPointerBank], a
	ld a, e
	ld [wMartPointer], a
	ld a, d
	ld [wMartPointer + 1], a
	ld hl, wCurMartCount
	assert wCurMartCount + 1 == wCurMartItems
	xor a
	ld bc, 16
	call ByteFill
	xor a ; STANDARDMART_HOWMAYIHELPYOU
	ld [wMartJumptableIndex], a
	ld [wBargainShopFlags], a
	ld [wFacingDirection], a
	ret

GetMart:
	ld a, e
	cp NUM_MARTS
	jr c, .IsAMart
	ld b, BANK(DefaultMart)
	ld de, DefaultMart
	ret

.IsAMart:
	ld hl, Marts
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld b, BANK(Marts)
	ret

; StandardMart.MartFunctions indexes
	const_def
	const STANDARDMART_HOWMAYIHELPYOU ; 0
	const STANDARDMART_TOPMENU        ; 1
	const STANDARDMART_BUY            ; 2
	const STANDARDMART_SELL           ; 3
	const STANDARDMART_QUIT           ; 4
	const STANDARDMART_ANYTHINGELSE   ; 5

DEF STANDARDMART_EXIT EQU -1

StandardMart:
.loop
	ld a, [wMartJumptableIndex]
	ld hl, .MartFunctions
	rst JumpTable
	ld [wMartJumptableIndex], a
	cp STANDARDMART_EXIT
	jr nz, .loop
	ret

.MartFunctions:
; entries correspond to STANDARDMART_* constants
	dw .HowMayIHelpYou
	dw .TopMenu
	dw .Buy
	dw .Sell
	dw .Quit
	dw .AnythingElse

.HowMayIHelpYou:
	call LoadStandardMenuHeader
	ld hl, MartWelcomeText
	call PrintText
	ld a, STANDARDMART_TOPMENU
	ret

.TopMenu:
	ld hl, MenuHeader_BuySell
	call CopyMenuHeader
	call VerticalMenu
	jr c, .quit
	ld a, [wMenuCursorY]
	cp $1
	jr z, .buy
	cp $2
	jr z, .sell
.quit
	ld a, STANDARDMART_QUIT
	ret
.buy
	ld a, STANDARDMART_BUY
	ret
.sell
	ld a, STANDARDMART_SELL
	ret

.Buy:
	call ExitMenu
	call FarReadMart
	call BuyMenu
	and a
	ld a, STANDARDMART_ANYTHINGELSE
	ret

.Sell:
	call ExitMenu
	call SellMenu
	ld a, STANDARDMART_ANYTHINGELSE
	ret

.Quit:
	call ExitMenu
	ld hl, MartComeAgainText
	call MartTextbox
	ld a, STANDARDMART_EXIT
	ret

.AnythingElse:
	call LoadStandardMenuHeader
	ld hl, MartAskMoreText
	call PrintText
	ld a, STANDARDMART_TOPMENU
	ret

FarReadMart:
	ld hl, wMartPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wCurMartCount
.CopyMart:
	ld a, [wMartPointerBank]
	call GetFarByte
	ld [de], a
	inc hl
	inc de
	cp -1
	jr nz, .CopyMart
	ld hl, wMartItem1BCD
	ld de, wCurMartItems
.ReadMartItem:
	ld a, [de]
	inc de
	cp -1
	jr z, .done
	push de
	call GetMartItemPrice
	pop de
	jr .ReadMartItem

.done
	ret

GetMartItemPrice:
; Return the price of item a in BCD at hl and in tiles at wStringBuffer1.
	push hl
	ld [wCurItem], a
	farcall GetItemPrice
	pop hl

GetMartPrice:
; Return price de in BCD at hl and in tiles at wStringBuffer1.
	push hl
	ld a, d
	ld [wStringBuffer2], a
	ld a, e
	ld [wStringBuffer2 + 1], a
	ld hl, wStringBuffer1
	ld de, wStringBuffer2
	lb bc, PRINTNUM_LEADINGZEROS | 2, 6 ; 6 digits
	call PrintNum
	pop hl

	ld de, wStringBuffer1
	ld c, 6 / 2 ; 6 digits
.loop
	call .CharToNybble
	swap a
	ld b, a
	call .CharToNybble
	or b
	ld [hli], a
	dec c
	jr nz, .loop
	ret

.CharToNybble:
	ld a, [de]
	inc de
	cp " "
	jr nz, .not_space
	ld a, "0"

.not_space
	sub "0"
	ret

ReadMart:
; Load the mart pointer.  Mart data is local (no need for bank).
	ld hl, wMartPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
; set hl to the first item
	inc hl
	ld bc, wMartItem1BCD
	ld de, wCurMartItems
.loop
; copy the items to wCurMartItems
	ld a, [hli]
	ld [de], a
	inc de
; -1 is the terminator
	cp -1
	jr z, .done

	push de
; copy the price to de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
; convert the price to 3-byte BCD at [bc]
	push hl
	ld h, b
	ld l, c
	call GetMartPrice
	ld b, h
	ld c, l
	pop hl

	pop de
	jr .loop

.done
	pop hl
	ld a, [hl]
	ld [wCurMartCount], a
	ret

INCLUDE "data/items/bargain_shop.asm"

BuyMenu:
	call FadeToMenu
	farcall BlankScreen
	xor a
	ld [wMenuScrollPositionBackup], a
	ld a, 1
	ld [wMenuCursorPositionBackup], a
.loop
	call BuyMenuLoop ; menu loop
	jr nc, .loop
	call CloseSubmenu
	ret

LoadBuyMenuText:
; load text from a nested table
; which table is in wMartType
; which entry is in register a
	push af
	call GetMartDialogGroup ; gets a pointer from GetMartDialogGroup.MartTextFunctionPointers
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	ret

MartAskPurchaseQuantity:
	call GetMartDialogGroup ; gets a pointer from GetMartDialogGroup.MartTextFunctionPointers
	inc hl
	inc hl
	ld a, [hl]
	and a
	jp z, StandardMartAskPurchaseQuantity
	cp 1
	jp z, BargainShopAskPurchaseQuantity
	jp RooftopSaleAskPurchaseQuantity

GetMartDialogGroup:
	ld a, [wMartType]
	ld e, a
	ld d, 0
	ld hl, .MartTextFunctionPointers
	add hl, de
	add hl, de
	add hl, de
	ret

.MartTextFunctionPointers:
	dwb .StandardMartPointers, 0
	dwb .HerbShopPointers, 0
	dwb .BargainShopPointers, 1
	dwb .PharmacyPointers, 0
	dwb .StandardMartPointers, 2

.StandardMartPointers:
	dw MartHowManyText
	dw MartFinalPriceText
	dw MartNoMoneyText
	dw MartPackFullText
	dw MartThanksText
	dw BuyMenuLoop

.HerbShopPointers:
	dw HerbalLadyHowManyText
	dw HerbalLadyFinalPriceText
	dw HerbalLadyNoMoneyText
	dw HerbalLadyPackFullText
	dw HerbalLadyThanksText
	dw BuyMenuLoop

.BargainShopPointers:
	dw BuyMenuLoop
	dw BargainShopFinalPriceText
	dw BargainShopNoFundsText
	dw BargainShopPackFullText
	dw BargainShopThanksText
	dw BargainShopSoldOutText

.PharmacyPointers:
	dw PharmacyHowManyText
	dw PharmacyFinalPriceText
	dw PharmacyNoMoneyText
	dw PharmacyPackFullText
	dw PharmacyThanksText
	dw BuyMenuLoop

BuyMenuLoop:
	farcall PlaceMoneyTopRight
	call UpdateSprites
	ld hl, MenuHeader_Buy
	call CopyMenuHeader
	ld a, [wMenuCursorPositionBackup]
	ld [wMenuCursorPosition], a
	ld a, [wMenuScrollPositionBackup]
	ld [wMenuScrollPosition], a
	call ScrollingMenu
	ld a, [wMenuScrollPosition]
	ld [wMenuScrollPositionBackup], a
	ld a, [wMenuCursorY]
	ld [wMenuCursorPositionBackup], a
	call SpeechTextbox
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .set_carry
	cp A_BUTTON
	jr z, .useless_pointer

.useless_pointer
	call MartAskPurchaseQuantity
	jr c, .cancel
	call MartConfirmPurchase
	jr c, .cancel
	ld de, wMoney
	ld bc, hMoneyTemp
	ld a, 3 ; useless load
	call CompareMoney
	jr c, .insufficient_funds
	ld hl, wNumItems
	call ReceiveItem
	jr nc, .insufficient_bag_space
	ld a, [wMartItemID]
	ld e, a
	ld d, 0
	ld b, SET_FLAG
	ld hl, wBargainShopFlags
	call FlagAction
	call PlayTransactionSound
	ld de, wMoney
	ld bc, hMoneyTemp
	call TakeMoney
	ld a, MARTTEXT_HERE_YOU_GO
	call LoadBuyMenuText
	call JoyWaitAorB

.cancel
	call SpeechTextbox
	and a
	ret

.set_carry
	scf
	ret

.insufficient_bag_space
	ld a, MARTTEXT_BAG_FULL
	call LoadBuyMenuText
	call JoyWaitAorB
	and a
	ret

.insufficient_funds
	ld a, MARTTEXT_NOT_ENOUGH_MONEY
	call LoadBuyMenuText
	call JoyWaitAorB
	and a
	ret

StandardMartAskPurchaseQuantity:
	ld a, MAX_ITEM_STACK
	ld [wItemQuantity], a
	ld a, MARTTEXT_HOW_MANY
	call LoadBuyMenuText
	farcall SelectQuantityToBuy
	call ExitMenu
	ret

MartConfirmPurchase:
	predef PartyMonItemName
	ld a, MARTTEXT_COSTS_THIS_MUCH
	call LoadBuyMenuText
	call YesNoBox
	ret

BargainShopAskPurchaseQuantity:
	ld a, 1
	ld [wItemQuantityChange], a
	ld a, [wMartItemID]
	ld e, a
	ld d, 0
	ld b, CHECK_FLAG
	ld hl, wBargainShopFlags
	call FlagAction
	ld a, c
	and a
	jr nz, .SoldOut
	ld a, [wMartItemID]
	ld e, a
	ld d, 0
	ld hl, wMartPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	add hl, de
	add hl, de
	add hl, de
	inc hl
	ld a, [hli]
	ldh [hMoneyTemp + 2], a
	ld a, [hl]
	ldh [hMoneyTemp + 1], a
	xor a
	ldh [hMoneyTemp], a
	and a
	ret

.SoldOut:
	ld a, MARTTEXT_SOLD_OUT
	call LoadBuyMenuText
	call JoyWaitAorB
	scf
	ret

RooftopSaleAskPurchaseQuantity:
	ld a, MARTTEXT_HOW_MANY
	call LoadBuyMenuText
	call .GetSalePrice
	ld a, MAX_ITEM_STACK
	ld [wItemQuantity], a
	farcall RooftopSale_SelectQuantityToBuy
	call ExitMenu
	ret

.GetSalePrice:
	ld a, [wMartItemID]
	ld e, a
	ld d, 0
	ld hl, wMartPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	add hl, de
	add hl, de
	add hl, de
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ret

MartHowManyText:
	text_far _MartHowManyText
	text_end

MartFinalPriceText:
	text_far _MartFinalPriceText
	text_end

MenuHeader_Buy:
	db MENU_BACKUP_TILES ; flags
	menu_coords 1, 3, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData
	db SCROLLINGMENU_DISPLAY_ARROWS | SCROLLINGMENU_ENABLE_FUNCTION3 ; flags
	db 4, 8 ; rows, columns
	db SCROLLINGMENU_ITEMS_NORMAL ; item format
	dbw 0, wCurMartCount
	dba PlaceMenuItemName
	dba .PrintBCDPrices
	dba UpdateItemDescription

.PrintBCDPrices:
	ld a, [wScrollingMenuCursorPosition]
	ld c, a
	ld b, 0
	ld hl, wMartItem1BCD
	add hl, bc
	add hl, bc
	add hl, bc
	push de
	ld d, h
	ld e, l
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld c, PRINTNUM_LEADINGZEROS | PRINTNUM_MONEY | 3
	call PrintBCDNumber
	ret

HerbShopLadyIntroText:
	text_far _HerbShopLadyIntroText
	text_end

HerbalLadyHowManyText:
	text_far _HerbalLadyHowManyText
	text_end

HerbalLadyFinalPriceText:
	text_far _HerbalLadyFinalPriceText
	text_end

HerbalLadyThanksText:
	text_far _HerbalLadyThanksText
	text_end

HerbalLadyPackFullText:
	text_far _HerbalLadyPackFullText
	text_end

HerbalLadyNoMoneyText:
	text_far _HerbalLadyNoMoneyText
	text_end

HerbalLadyComeAgainText:
	text_far _HerbalLadyComeAgainText
	text_end

BargainShopIntroText:
	text_far _BargainShopIntroText
	text_end

BargainShopFinalPriceText:
	text_far _BargainShopFinalPriceText
	text_end

BargainShopThanksText:
	text_far _BargainShopThanksText
	text_end

BargainShopPackFullText:
	text_far _BargainShopPackFullText
	text_end

BargainShopSoldOutText:
	text_far _BargainShopSoldOutText
	text_end

BargainShopNoFundsText:
	text_far _BargainShopNoFundsText
	text_end

BargainShopComeAgainText:
	text_far _BargainShopComeAgainText
	text_end

PharmacyIntroText:
	text_far _PharmacyIntroText
	text_end

PharmacyHowManyText:
	text_far _PharmacyHowManyText
	text_end

PharmacyFinalPriceText:
	text_far _PharmacyFinalPriceText
	text_end

PharmacyThanksText:
	text_far _PharmacyThanksText
	text_end

PharmacyPackFullText:
	text_far _PharmacyPackFullText
	text_end

PharmacyNoMoneyText:
	text_far _PharmacyNoMoneyText
	text_end

PharmacyComeAgainText:
	text_far _PharmacyComeAgainText
	text_end

SellMenu:
	call DisableSpriteUpdates
	farcall DepositSellInitPackBuffers
.loop
	farcall DepositSellPack
	ld a, [wPackUsedItem]
	and a
	jp z, .quit
	call .TryToSellItem
	jr .loop

.quit
	call ReturnToMapWithSpeechTextbox
	and a
	ret

.NothingToSell: ; unreferenced
	ld hl, .NothingToSellText
	call MenuTextboxBackup
	and a
	ret

.NothingToSellText:
	text_far _NothingToSellText
	text_end

.TryToSellItem:
	farcall CheckItemMenu
	ld a, [wItemAttributeValue]
	ld hl, .dw
	rst JumpTable
	ret

.dw
	dw .try_sell
	dw .cant_buy
	dw .cant_buy
	dw .cant_buy
	dw .try_sell
	dw .try_sell
	dw .try_sell

.cant_buy
	ret

.try_sell
	farcall _CheckTossableItem
	ld a, [wItemAttributeValue]
	and a
	jr z, .okay_to_sell
	ld hl, MartCantBuyText
	call PrintText
	and a
	ret

.okay_to_sell
	ld hl, MartSellHowManyText
	call PrintText
	farcall PlaceMoneyAtTopLeftOfTextbox
	farcall SelectQuantityToSell
	call ExitMenu
	jr c, .declined
	hlcoord 1, 14
	lb bc, 3, 18
	call ClearBox
	ld hl, MartSellPriceText
	call PrintTextboxText
	call YesNoBox
	jr c, .declined
	ld de, wMoney
	ld bc, hMoneyTemp
	call GiveMoney
	ld a, [wMartItemID]
	ld hl, wNumItems
	call TossItem
	predef PartyMonItemName
	hlcoord 1, 14
	lb bc, 3, 18
	call ClearBox
	ld hl, MartBoughtText
	call PrintTextboxText
	call PlayTransactionSound
	farcall PlaceMoneyBottomLeft
	call JoyWaitAorB

.declined
	call ExitMenu
	and a
	ret

MartSellHowManyText:
	text_far _MartSellHowManyText
	text_end

MartSellPriceText:
	text_far _MartSellPriceText
	text_end

UnusedDummyString: ; unreferenced
	db "！ダミー！@" ; "!Dummy!"

MartWelcomeText:
	text_far _MartWelcomeText
	text_end

MenuHeader_BuySell:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 7, 8
	dw .MenuData
	db 1 ; default option

.MenuData
	db STATICMENU_CURSOR ; strings
	db 3 ; items
	db "BUY@"
	db "SELL@"
	db "QUIT@"

MartThanksText:
	text_far _MartThanksText
	text_end

MartNoMoneyText:
	text_far _MartNoMoneyText
	text_end

MartPackFullText:
	text_far _MartPackFullText
	text_end

MartCantBuyText:
	text_far _MartCantBuyText
	text_end

MartComeAgainText:
	text_far _MartComeAgainText
	text_end

MartAskMoreText:
	text_far _MartAskMoreText
	text_end

MartBoughtText:
	text_far _MartBoughtText
	text_end

PlayTransactionSound:
	call WaitSFX
	ld de, SFX_TRANSACTION
	call PlaySFX
	ret

MartTextbox:
	call MenuTextbox
	call JoyWaitAorB
	call ExitMenu
	ret
