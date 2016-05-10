SelectQuantityToToss: ; 24fbf
	ld hl, TossItem_MenuDataHeader
	call LoadMenuDataHeader
	call Toss_Sell_Loop
	ret
; 24fc9

SelectQuantityToBuy: ; 24fc9
	callba GetItemPrice
RooftopSale_SelectQuantityToBuy: ; 24fcf
	ld a, d
	ld [Buffer1], a
	ld a, e
	ld [Buffer2], a
	ld hl, BuyItem_MenuDataHeader
	call LoadMenuDataHeader
	call Toss_Sell_Loop
	ret
; 24fe1

SelectQuantityToSell: ; 24fe1
	callba GetItemPrice
	ld a, d
	ld [Buffer1], a
	ld a, e
	ld [Buffer2], a
	ld hl, SellItem_MenuDataHeader
	call LoadMenuDataHeader
	call Toss_Sell_Loop
	ret
; 24ff9

Toss_Sell_Loop: ; 24ff9
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
; 2500e

BuySellToss_InterpretJoypad: ; 2500e
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
; 25072

BuySellToss_UpdateQuantityDisplay: ; 25072
	call MenuBox
	call MenuBoxCoord2Tile
	ld de, SCREEN_WIDTH + 1
	add hl, de
	ld [hl], "×"
	inc hl
	ld de, wItemQuantityChangeBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ld a, [wMenuData2Pointer]
	ld e, a
	ld a, [wMenuData2Pointer + 1]
	ld d, a
	ld a, [wMenuDataBank]
	call FarCall_de
	ret
; 25097

ret_25097: ; 25097
	ret
; 25098

DisplayPurchasePrice: ; 25098
	call BuySell_MultiplyPrice
	call BuySell_DisplaySubtotal
	ret
; 2509f

DisplaySellingPrice: ; 2509f
	call BuySell_MultiplyPrice
	call Sell_HalvePrice
	call BuySell_DisplaySubtotal
	ret
; 250a9

BuySell_MultiplyPrice: ; 250a9
	xor a
	ld [hMultiplicand + 0], a
	ld a, [Buffer1]
	ld [hMultiplicand + 1], a
	ld a, [Buffer2]
	ld [hMultiplicand + 2], a
	ld a, [wItemQuantityChangeBuffer]
	ld [hMultiplier], a
	push hl
	call Multiply
	pop hl
	ret
; 250c1

Sell_HalvePrice: ; 250c1
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
; 250d1

BuySell_DisplaySubtotal: ; 250d1
	push hl
	ld hl, hMoneyTemp
	ld a, [hProduct + 1]
	ld [hli], a
	ld a, [hProduct + 2]
	ld [hli], a
	ld a, [hProduct + 3]
	ld [hl], a
	pop hl
	inc hl
	ld de, hMoneyTemp
	lb bc, PRINTNUM_MONEY | 3, 6
	call PrintNum
	call WaitBGMap
	ret
; 250ed

TossItem_MenuDataHeader: ; 0x250ed
	db $40 ; flags
	db 09, 15 ; start coords
	db 11, 19 ; end coords
	dw ret_25097
	db 0 ; default option
; 0x250f5

BuyItem_MenuDataHeader: ; 0x250f5
	db $40 ; flags
	db 15, 07 ; start coords
	db 17, 19 ; end coords
	dw DisplayPurchasePrice
	db -1 ; default option
; 0x250fd

SellItem_MenuDataHeader: ; 0x250fd
	db $40 ; flags
	db 15, 07 ; start coords
	db 17, 19 ; end coords
	dw DisplaySellingPrice
	db 0 ; default option
; 0x25105
