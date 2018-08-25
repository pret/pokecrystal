SelectQuantityToToss:
	ld hl, TossItem_MenuHeader
	call LoadMenuHeader
	call Toss_Sell_Loop
	ret

SelectQuantityToBuy:
	farcall GetItemPrice
RooftopSale_SelectQuantityToBuy:
	ld a, d
	ld [wBuffer1], a
	ld a, e
	ld [wBuffer2], a
	ld hl, BuyItem_MenuHeader
	call LoadMenuHeader
	call Toss_Sell_Loop
	ret

SelectQuantityToSell:
	farcall GetItemPrice
	ld a, d
	ld [wBuffer1], a
	ld a, e
	ld [wBuffer2], a
	ld hl, SellItem_MenuHeader
	call LoadMenuHeader
	call Toss_Sell_Loop
	ret

Toss_Sell_Loop:
	ld a, 1
	ld [wItemQuantityChangeBuffer], a
.loop
	call BuySellToss_UpdateQuantityDisplay ; update display
	call BuySellToss_InterpretJoypad       ; joy action
	jr nc, .loop
	cp -1
	jr nz, .nope ; pressed B
	scf
	ret

.nope
	and a
	ret

BuySellToss_InterpretJoypad:
	call JoyTextDelay_ForcehJoyDown ; get joypad
	bit B_BUTTON_F, c
	jr nz, .b
	bit A_BUTTON_F, c
	jr nz, .a
	bit D_DOWN_F, c
	jr nz, .down
	bit D_UP_F, c
	jr nz, .up
	bit D_LEFT_F, c
	jr nz, .left
	bit D_RIGHT_F, c
	jr nz, .right
	and a
	ret

.b
	ld a, -1
	scf
	ret

.a
	ld a, 0
	scf
	ret

.down
	ld hl, wItemQuantityChangeBuffer
	dec [hl]
	jr nz, .finish_down
	ld a, [wItemQuantityBuffer]
	ld [hl], a

.finish_down
	and a
	ret

.up
	ld hl, wItemQuantityChangeBuffer
	inc [hl]
	ld a, [wItemQuantityBuffer]
	cp [hl]
	jr nc, .finish_up
	ld [hl], 1

.finish_up
	and a
	ret

.left
	ld a, [wItemQuantityChangeBuffer]
	sub 10
	jr c, .load_1
	jr z, .load_1
	jr .finish_left

.load_1
	ld a, 1

.finish_left
	ld [wItemQuantityChangeBuffer], a
	and a
	ret

.right
	ld a, [wItemQuantityChangeBuffer]
	add 10
	ld b, a
	ld a, [wItemQuantityBuffer]
	cp b
	jr nc, .finish_right
	ld b, a

.finish_right
	ld a, b
	ld [wItemQuantityChangeBuffer], a
	and a
	ret

BuySellToss_UpdateQuantityDisplay:
	call MenuBox
	call MenuBoxCoord2Tile
	ld de, SCREEN_WIDTH + 1
	add hl, de
	ld [hl], "×"
	inc hl
	ld de, wItemQuantityChangeBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ld a, [wMenuDataPointer]
	ld e, a
	ld a, [wMenuDataPointer + 1]
	ld d, a
	ld a, [wMenuDataBank]
	call FarCall_de
	ret

ret_25097:
	ret

DisplayPurchasePrice:
	call BuySell_MultiplyPrice
	call BuySell_DisplaySubtotal
	ret

DisplaySellingPrice:
	call BuySell_MultiplyPrice
	call Sell_HalvePrice
	call BuySell_DisplaySubtotal
	ret

BuySell_MultiplyPrice:
	xor a
	ldh [hMultiplicand + 0], a
	ld a, [wBuffer1]
	ldh [hMultiplicand + 1], a
	ld a, [wBuffer2]
	ldh [hMultiplicand + 2], a
	ld a, [wItemQuantityChangeBuffer]
	ldh [hMultiplier], a
	push hl
	call Multiply
	pop hl
	ret

Sell_HalvePrice:
	push hl
	ld hl, hProduct + 1
	ld a, [hl]
	srl a
	ld [hli], a
	ld a, [hl]
	rra
	ld [hli], a
	ld a, [hl]
	rra
	ld [hl], a
	pop hl
	ret

BuySell_DisplaySubtotal:
	push hl
	ld hl, hMoneyTemp
	ldh a, [hProduct + 1]
	ld [hli], a
	ldh a, [hProduct + 2]
	ld [hli], a
	ldh a, [hProduct + 3]
	ld [hl], a
	pop hl
	inc hl
	ld de, hMoneyTemp
	lb bc, PRINTNUM_MONEY | 3, 6
	call PrintNum
	call WaitBGMap
	ret

TossItem_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 15, 9, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw ret_25097
	db 0 ; default option

BuyItem_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 7, 15, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw DisplayPurchasePrice
	db -1 ; default option

SellItem_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 7, 15, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw DisplaySellingPrice
	db 0 ; default option
