	const_def
	const MARTTEXT_HOW_MANY
	const MARTTEXT_COSTS_THIS_MUCH
	const MARTTEXT_NOT_ENOUGH_MONEY
	const MARTTEXT_BAG_FULL
	const MARTTEXT_HERE_YOU_GO
	const MARTTEXT_SOLD_OUT

OpenMartDialog:: ; 15a45
	call GetMart
	ld a, c
	ld [EngineBuffer1], a
	call LoadMartPointer
	ld a, [EngineBuffer1]
	ld hl, .dialogs
	rst JumpTable
	ret
; 15a57

.dialogs
	dw MartDialog
	dw HerbShop
	dw BargainShop
	dw Pharmacist
	dw RooftopSale
; 15a61

MartDialog: ; 15a61
	ld a, 0
	ld [EngineBuffer1], a
	xor a
	ld [EngineBuffer5], a
	call StandardMart
	ret
; 15a6e

HerbShop: ; 15a6e
	call FarReadMart
	call LoadStandardMenuDataHeader
	ld hl, Text_HerbShop_Intro
	call MartTextBox
	call BuyMenu
	ld hl, Text_HerbShop_ComeAgain
	call MartTextBox
	ret
; 15a84

BargainShop: ; 15a84
	ld b, BANK(BargainShopData)
	ld de, BargainShopData
	call LoadMartPointer
	call ReadMart
	call LoadStandardMenuDataHeader
	ld hl, Text_BargainShop_Intro
	call MartTextBox
	call BuyMenu
	ld hl, wBargainShopFlags
	ld a, [hli]
	or [hl]
	jr z, .skip_set
	ld hl, DailyFlags
	set 6, [hl]

.skip_set
	ld hl, Text_BargainShop_ComeAgain
	call MartTextBox
	ret
; 15aae

Pharmacist: ; 15aae
	call FarReadMart
	call LoadStandardMenuDataHeader
	ld hl, Text_Pharmacist_Intro
	call MartTextBox
	call BuyMenu
	ld hl, Text_Pharmacist_ComeAgain
	call MartTextBox
	ret
; 15ac4

RooftopSale: ; 15ac4
	ld b, BANK(RooftopSaleData1)
	ld de, RooftopSaleData1
	ld hl, StatusFlags
	bit 6, [hl] ; hall of fame
	jr z, .ok
	ld b, BANK(RooftopSaleData2)
	ld de, RooftopSaleData2

.ok
	call LoadMartPointer
	call ReadMart
	call LoadStandardMenuDataHeader
	ld hl, Text_Mart_HowMayIHelpYou
	call MartTextBox
	call BuyMenu
	ld hl, Text_Mart_ComeAgain
	call MartTextBox
	ret
; 15aee

RooftopSaleData1: ; 15aee
	db 5
	dbw POKE_BALL,     150
	dbw GREAT_BALL,    500
	dbw SUPER_POTION,  500
	dbw FULL_HEAL,     500
	dbw REVIVE,       1200
	db -1
RooftopSaleData2: ; 15aff
	db 5
	dbw HYPER_POTION, 1000
	dbw FULL_RESTORE, 2000
	dbw FULL_HEAL,     500
	dbw ULTRA_BALL,   1000
	dbw PROTEIN,      7800
	db -1
; 15b10

LoadMartPointer: ; 15b10
	ld a, b
	ld [MartPointerBank], a
	ld a, e
	ld [MartPointer], a
	ld a, d
	ld [MartPointer + 1], a
	ld hl, CurMart
	xor a
	ld bc, 16
	call ByteFill
	xor a
	ld [EngineBuffer5], a
	ld [wBargainShopFlags], a
	ld [FacingDirection], a
	ret
; 15b31

GetMart: ; 15b31
	ld a, e
	cp (MartsEnd - Marts) / 2
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
; 15b47

StandardMart: ; 15b47
.loop
	ld a, [EngineBuffer5]
	ld hl, .MartFunctions
	rst JumpTable
	ld [EngineBuffer5], a
	cp $ff
	jr nz, .loop
	ret

.MartFunctions:
	dw .HowMayIHelpYou
	dw .TopMenu
	dw .Buy
	dw .Sell
	dw .Quit
	dw .AnythingElse
; 15b62

.HowMayIHelpYou: ; 15b62
	call LoadStandardMenuDataHeader
	ld hl, Text_Mart_HowMayIHelpYou
	call PrintText
	ld a, $1 ; top menu
	ret
; 15b6e

.TopMenu: ; 15b6e
	ld hl, MenuDataHeader_BuySell
	call CopyMenuDataHeader
	call VerticalMenu
	jr c, .quit
	ld a, [wMenuCursorY]
	cp $1
	jr z, .buy
	cp $2
	jr z, .sell
.quit
	ld a, $4 ;  Come again!
	ret
.buy
	ld a, $2 ; buy
	ret
.sell
	ld a, $3 ; sell
	ret
; 15b8d

.Buy: ; 15b8d
	call ExitMenu
	call FarReadMart
	call BuyMenu
	and a
	ld a, $5 ; Anything else?
	ret
; 15b9a

.Sell: ; 15b9a
	call ExitMenu
	call SellMenu
	ld a, $5 ; Anything else?
	ret
; 15ba3

.Quit: ; 15ba3
	call ExitMenu
	ld hl, Text_Mart_ComeAgain
	call MartTextBox
	ld a, $ff ; exit
	ret
; 15baf

.AnythingElse: ; 15baf
	call LoadStandardMenuDataHeader
	ld hl, Text_Mart_AnythingElse
	call PrintText
	ld a, $1 ; top menu
	ret
; 15bbb

FarReadMart: ; 15bbb
	ld hl, MartPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, CurMart
.CopyMart:
	ld a, [MartPointerBank]
	call GetFarByte
	ld [de], a
	inc hl
	inc de
	cp -1
	jr nz, .CopyMart
	ld hl, wMartItem1BCD
	ld de, CurMart + 1
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
; 15be5

GetMartItemPrice: ; 15be5
; Return the price of item a in BCD at hl and in tiles at StringBuffer1.
	push hl
	ld [CurItem], a
	callba GetItemPrice
	pop hl

GetMartPrice: ; 15bf0
; Return price de in BCD at hl and in tiles at StringBuffer1.
	push hl
	ld a, d
	ld [StringBuffer2], a
	ld a, e
	ld [StringBuffer2 + 1], a
	ld hl, StringBuffer1
	ld de, StringBuffer2
	lb bc, PRINTNUM_LEADINGZEROS | 2, 6 ; 6 digits
	call PrintNum
	pop hl

	ld de, StringBuffer1
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
; 15c1a

.CharToNybble: ; 15c1a
	ld a, [de]
	inc de
	cp " "
	jr nz, .not_space
	ld a, "0"

.not_space
	sub "0"
	ret
; 15c25

ReadMart: ; 15c25
; Load the mart pointer.  Mart data is local (no need for bank).
	ld hl, MartPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
; set hl to the first item
	inc hl
	ld bc, wMartItem1BCD
	ld de, CurMart + 1
.loop
; copy the item to CurMart + (ItemIndex)
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
	ld [CurMart], a
	ret
; 15c51

BargainShopData: ; 15c51
	db 5
	dbw NUGGET,     4500
	dbw PEARL,       650
	dbw BIG_PEARL,  3500
	dbw STARDUST,    900
	dbw STAR_PIECE, 4600
	db -1
; 15c62


BuyMenu: ; 15c62
	call FadeToMenu
	callba BlankScreen
	xor a
	ld [wd045 + 1], a
	ld a, 1
	ld [wd045], a
.loop
	call BuyMenuLoop ; menu loop
	jr nc, .loop
	call CloseSubmenu
	ret
; 15c7d

LoadBuyMenuText: ; 15c7d
; load text from a nested table
; which table is in EngineBuffer1
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
; 15c91

MartAskPurchaseQuantity: ; 15c91
	call GetMartDialogGroup ; gets a pointer from GetMartDialogGroup.MartTextFunctionPointers
	inc hl
	inc hl
	ld a, [hl]
	and a
	jp z, StandardMartAskPurchaseQuantity
	cp 1
	jp z, BargainShopAskPurchaseQuantity
	jp RooftopSaleAskPurchaseQuantity
; 15ca3

GetMartDialogGroup: ; 15ca3
	ld a, [EngineBuffer1]
	ld e, a
	ld d, 0
	ld hl, .MartTextFunctionPointers
	add hl, de
	add hl, de
	add hl, de
	ret
; 15cb0

.MartTextFunctionPointers: ; 15cb0
	dwb .StandardMartPointers, 0
	dwb .HerbShopPointers, 0
	dwb .BargainShopPointers, 1
	dwb .PharmacyPointers, 0
	dwb .StandardMartPointers, 2
; 15cbf

.StandardMartPointers: ; 15cbf
	dw Text_Mart_HowMany
	dw Text_Mart_CostsThisMuch
	dw Text_Mart_InsufficientFunds
	dw Text_Mart_BagFull
	dw Text_Mart_HereYouGo
	dw BuyMenuLoop

.HerbShopPointers: ; 15ccb
	dw Text_HerbShop_HowMany
	dw Text_HerbShop_CostsThisMuch
	dw Text_HerbShop_InsufficientFunds
	dw Text_HerbShop_BagFull
	dw Text_HerbShop_HereYouGo
	dw BuyMenuLoop

.BargainShopPointers: ; 15cd7
	dw BuyMenuLoop
	dw Text_BargainShop_CostsThisMuch
	dw Text_BargainShop_InsufficientFunds
	dw Text_BargainShop_BagFull
	dw Text_BargainShop_HereYouGo
	dw Text_BargainShop_SoldOut

.PharmacyPointers: ; 15ce3
	dw Text_Pharmacy_HowMany
	dw Text_Pharmacy_CostsThisMuch
	dw Text_Pharmacy_InsufficientFunds
	dw Text_Pharmacy_BagFull
	dw Text_Pharmacy_HereYouGo
	dw BuyMenuLoop
; 15cef


BuyMenuLoop: ; 15cef
	callba PlaceMoneyTopRight
	call UpdateSprites
	ld hl, MenuDataHeader_Buy
	call CopyMenuDataHeader
	ld a, [wd045]
	ld [wMenuCursorBuffer], a
	ld a, [wd045 + 1]
	ld [wMenuScrollPosition], a
	call ScrollingMenu
	ld a, [wMenuScrollPosition]
	ld [wd045 + 1], a
	ld a, [wMenuCursorY]
	ld [wd045], a
	call SpeechTextBox
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
	ld de, Money
	ld bc, hMoneyTemp
	ld a, $3 ; useless load
	call CompareMoney
	jr c, .insufficient_funds
	ld hl, NumItems
	call ReceiveItem
	jr nc, .insufficient_bag_space
	ld a, [wMartItemID]
	ld e, a
	ld d, $0
	ld b, SET_FLAG
	ld hl, wBargainShopFlags
	call FlagAction
	call PlayTransactionSound
	ld de, Money
	ld bc, hMoneyTemp
	call TakeMoney
	ld a, MARTTEXT_HERE_YOU_GO
	call LoadBuyMenuText
	call JoyWaitAorB

.cancel
	call SpeechTextBox
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
; 15d83

StandardMartAskPurchaseQuantity:
	ld a, 99
	ld [wItemQuantityBuffer], a
	ld a, MARTTEXT_HOW_MANY
	call LoadBuyMenuText
	callba SelectQuantityToBuy
	call ExitMenu
	ret
; 15d97

MartConfirmPurchase: ; 15d97
	predef PartyMonItemName
	ld a, MARTTEXT_COSTS_THIS_MUCH
	call LoadBuyMenuText
	call YesNoBox
	ret
; 15da5

BargainShopAskPurchaseQuantity:
	ld a, 1
	ld [wItemQuantityChangeBuffer], a
	ld a, [wMartItemID]
	ld e, a
	ld d, $0
	ld b, CHECK_FLAG
	ld hl, wBargainShopFlags
	call FlagAction
	ld a, c
	and a
	jr nz, .SoldOut
	ld a, [wMartItemID]
	ld e, a
	ld d, $0
	ld hl, MartPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	add hl, de
	add hl, de
	add hl, de
	inc hl
	ld a, [hli]
	ld [hMoneyTemp + 2], a
	ld a, [hl]
	ld [hMoneyTemp + 1], a
	xor a
	ld [hMoneyTemp], a
	and a
	ret

.SoldOut:
	ld a, MARTTEXT_SOLD_OUT
	call LoadBuyMenuText
	call JoyWaitAorB
	scf
	ret
; 15de2

RooftopSaleAskPurchaseQuantity:
	ld a, MARTTEXT_HOW_MANY
	call LoadBuyMenuText
	call .GetSalePrice
	ld a, 99
	ld [wItemQuantityBuffer], a
	callba RooftopSale_SelectQuantityToBuy
	call ExitMenu
	ret
; 15df9

.GetSalePrice: ; 15df9
	ld a, [wMartItemID]
	ld e, a
	ld d, 0
	ld hl, MartPointer
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
; 15e0e


Text_Mart_HowMany: ; 0x15e0e
	; How many?
	text_jump UnknownText_0x1c4bfd
	db "@"
; 0x15e13

Text_Mart_CostsThisMuch: ; 0x15e13
	; @ (S) will be ¥@ .
	text_jump UnknownText_0x1c4c08
	db "@"
; 0x15e18

MenuDataHeader_Buy: ; 0x15e18
	db $40 ; flags
	db 03, 01 ; start coords
	db 11, 19 ; end coords
	dw .menudata2
	db 1 ; default option
; 0x15e20

.menudata2 ; 0x15e20
	db $30 ; pointers
	db 4, 8 ; rows, columns
	db 1 ; horizontal spacing
	dbw 0, CurMart
	dba PlaceMenuItemName
	dba .PrintBCDPrices
	dba UpdateItemDescription
; 15e30

.PrintBCDPrices: ; 15e30
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
; 15e4a (5:5e4a)

Text_HerbShop_Intro: ; 0x15e4a
	; Hello, dear. I sell inexpensive herbal medicine. They're good, but a trifle bitter. Your #MON may not like them. Hehehehe…
	text_jump UnknownText_0x1c4c28
	db "@"
; 0x15e4f

Text_HerbShop_HowMany: ; 0x15e4f
	; How many?
	text_jump UnknownText_0x1c4ca3
	db "@"
; 0x15e54

Text_HerbShop_CostsThisMuch: ; 0x15e54
	; @ (S) will be ¥@ .
	text_jump UnknownText_0x1c4cae
	db "@"
; 0x15e59

Text_HerbShop_HereYouGo: ; 0x15e59
	; Thank you, dear. Hehehehe…
	text_jump UnknownText_0x1c4cce
	db "@"
; 0x15e5e

Text_HerbShop_BagFull: ; 0x15e5e
	; Oh? Your PACK is full, dear.
	text_jump UnknownText_0x1c4cea
	db "@"
; 0x15e63

Text_HerbShop_InsufficientFunds: ; 0x15e63
	; Hehehe… You don't have the money.
	text_jump UnknownText_0x1c4d08
	db "@"
; 0x15e68

Text_HerbShop_ComeAgain: ; 0x15e68
	; Come again, dear. Hehehehe…
	text_jump UnknownText_0x1c4d2a
	db "@"
; 0x15e6d

Text_BargainShop_Intro: ; 0x15e6d
	; Hiya! Care to see some bargains? I sell rare items that nobody else carries--but only one of each item.
	text_jump UnknownText_0x1c4d47
	db "@"
; 0x15e72

Text_BargainShop_CostsThisMuch: ; 0x15e72
	; costs ¥@ . Want it?
	text_jump UnknownText_0x1c4db0
	db "@"
; 0x15e77

Text_BargainShop_HereYouGo: ; 0x15e77
	; Thanks.
	text_jump UnknownText_0x1c4dcd
	db "@"
; 0x15e7c

Text_BargainShop_BagFull: ; 0x15e7c
	; Uh-oh, your PACK is chock-full.
	text_jump UnknownText_0x1c4dd6
	db "@"
; 0x15e81

Text_BargainShop_SoldOut: ; 0x15e81
	; You bought that already. I'm all sold out of it.
	text_jump UnknownText_0x1c4df7
	db "@"
; 0x15e86

Text_BargainShop_InsufficientFunds: ; 0x15e86
	; Uh-oh, you're short on funds.
	text_jump UnknownText_0x1c4e28
	db "@"
; 0x15e8b

Text_BargainShop_ComeAgain: ; 0x15e8b
	; Come by again sometime.
	text_jump UnknownText_0x1c4e46
	db "@"
; 0x15e90

Text_Pharmacist_Intro: ; 0x15e90
	; What's up? Need some medicine?
	text_jump UnknownText_0x1c4e5f
	db "@"
; 0x15e95

Text_Pharmacy_HowMany: ; 0x15e95
	; How many?
	text_jump UnknownText_0x1c4e7e
	db "@"
; 0x15e9a

Text_Pharmacy_CostsThisMuch: ; 0x15e9a
	; @ (S) will cost ¥@ .
	text_jump UnknownText_0x1c4e89
	db "@"
; 0x15e9f

Text_Pharmacy_HereYouGo: ; 0x15e9f
	; Thanks much!
	text_jump UnknownText_0x1c4eab
	db "@"
; 0x15ea4

Text_Pharmacy_BagFull: ; 0x15ea4
	; You don't have any more space.
	text_jump UnknownText_0x1c4eb9
	db "@"
; 0x15ea9

Text_Pharmacy_InsufficientFunds: ; 0x15ea9
	; Huh? That's not enough money.
	text_jump UnknownText_0x1c4ed8
	db "@"
; 0x15eae

Text_Pharmacist_ComeAgain: ; 0x15eae
	; All right. See you around.
	text_jump UnknownText_0x1c4ef6
	db "@"
; 0x15eb3


SellMenu: ; 15eb3
	call DisableSpriteUpdates
	callba DepositSellInitPackBuffers
.loop
	callba DepositSellPack
	ld a, [wcf66]
	and a
	jp z, .quit
	call .TryToSellItem
	jr .loop

.quit
	call ReturnToMapWithSpeechTextbox
	and a
	ret
; 15ed3

.NothingToSell: ; unreferenced
	ld hl, .NothingToSellText
	call MenuTextBoxBackup
	and a
	ret
; 15edb

.NothingToSellText: ; 0x15edb
	; You don't have anything to sell.
	text_jump UnknownText_0x1c4f12
	db "@"
; 0x15ee0


.TryToSellItem: ; 15ee0
	callba CheckItemMenu
	ld a, [wItemAttributeParamBuffer]
	ld hl, .dw
	rst JumpTable
	ret
; 15eee

.dw ; 15eee
	dw .try_sell
	dw .cant_buy
	dw .cant_buy
	dw .cant_buy
	dw .try_sell
	dw .try_sell
	dw .try_sell
; 15efc

.cant_buy ; 15efc
	ret
; 15efd


.try_sell ; 15efd
	callba _CheckTossableItem
	ld a, [wItemAttributeParamBuffer]
	and a
	jr z, .okay_to_sell
	ld hl, TextMart_CantBuyFromYou
	call PrintText
	and a
	ret

.okay_to_sell
	ld hl, Text_Mart_SellHowMany
	call PrintText
	callba PlaceMoneyAtTopLeftOfTextbox
	callba SelectQuantityToSell
	call ExitMenu
	jr c, .declined
	hlcoord 1, 14
	lb bc, 3, 18
	call ClearBox
	ld hl, Text_Mart_ICanPayThisMuch
	call PrintTextBoxText
	call YesNoBox
	jr c, .declined
	ld de, Money
	ld bc, hMoneyTemp
	call GiveMoney
	ld a, [wMartItemID]
	ld hl, NumItems
	call TossItem
	predef PartyMonItemName
	hlcoord 1, 14
	lb bc, 3, 18
	call ClearBox
	ld hl, Text_Mart_SoldForAmount
	call PrintTextBoxText
	call PlayTransactionSound
	callba PlaceMoneyBottomLeft
	call JoyWaitAorB

.declined
	call ExitMenu
	and a
	ret
; 15f73

Text_Mart_SellHowMany: ; 0x15f73
	; How many?
	text_jump UnknownText_0x1c4f33
	db "@"
; 0x15f78

Text_Mart_ICanPayThisMuch: ; 0x15f78
	; I can pay you ¥@ . Is that OK?
	text_jump UnknownText_0x1c4f3e
	db "@"
; 0x15f7d

DummyString ; 15f7d
	db "!ダミー!@"

Text_Mart_HowMayIHelpYou: ; 0x15f83
	; Welcome! How may I help you?
	text_jump UnknownText_0x1c4f62
	db "@"
; 0x15f88

MenuDataHeader_BuySell: ; 0x15f88
	db $40 ; flags
	db 00, 00 ; start coords
	db 08, 07 ; end coords
	dw .menudata2
	db 1 ; default option
; 0x15f90

.menudata2 ; 0x15f90
	db $80 ; strings
	db 3 ; items
	db "BUY@"
	db "SELL@"
	db "QUIT@"
; 0x15f96

Text_Mart_HereYouGo: ; 0x15fa0
	; Here you are. Thank you!
	text_jump UnknownText_0x1c4f80
	db "@"
; 0x15fa5

Text_Mart_InsufficientFunds: ; 0x15fa5
	; You don't have enough money.
	text_jump UnknownText_0x1c4f9a
	db "@"
; 0x15faa

Text_Mart_BagFull: ; 0x15faa
	; You can't carry any more items.
	text_jump UnknownText_0x1c4fb7
	db "@"
; 0x15faf

TextMart_CantBuyFromYou: ; 0x15faf
	; Sorry, I can't buy that from you.
	text_jump UnknownText_0x1c4fd7
	db "@"
; 0x15fb4

Text_Mart_ComeAgain: ; 0x15fb4
	; Please come again!
	text_jump UnknownText_0x1c4ff9
	db "@"
; 0x15fb9

Text_Mart_AnythingElse: ; 0x15fb9
	text_jump UnknownText_0x1c500d
	db "@"
; 0x15fbe

Text_Mart_SoldForAmount: ; 0x15fbe
	text_jump UnknownText_0x1c502e
	db "@"
; 0x15fc3

PlayTransactionSound: ; 15fc3
	call WaitSFX
	ld de, SFX_TRANSACTION
	call PlaySFX
	ret
; 15fcd

MartTextBox: ; 15fcd
	call MenuTextBox
	call JoyWaitAorB
	call ExitMenu
	ret
; 15fd7
