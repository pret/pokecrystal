Kurt_PrintTextWhichApricorn: ; 88000
	ld hl, .Text
	call PrintText
	ret
; 88007

.Text: ; 0x88007
	; Which APRICORN should I use?
	text_jump UnknownText_0x1bc06b
	db "@"
; 0x8800c

Kurt_PrintTextHowMany: ; 8800c
	ld hl, .Text
	call PrintText
	ret
; 88013

.Text: ; 0x88013
	; How many should I make?
	text_jump UnknownText_0x1bc089
	db "@"
; 0x88018

Special_SelectApricornForKurt: ; 88018
	call LoadStandardMenuDataHeader
	ld c, $1
	xor a
	ld [wMenuScrollPosition], a
	ld [wKurtApricornQuantity], a
.loop
	push bc
	call Kurt_PrintTextWhichApricorn
	pop bc
	ld a, c
	ld [MenuSelection], a
	call Kurt_SelectApricorn
	ld a, c
	ld [ScriptVar], a
	and a
	jr z, .done
	ld [CurItem], a
	ld a, [wMenuCursorY]
	ld c, a
	push bc
	call Kurt_PrintTextHowMany
	call Kurt_SelectQuantity
	pop bc
	jr nc, .loop
	ld a, [wItemQuantityChangeBuffer]
	ld [wKurtApricornQuantity], a
	call Kurt_GiveUpSelectedQuantityOfSelectedApricorn

.done
	call Call_ExitMenu
	ret
; 88055

Kurt_SelectApricorn: ; 88055
	callba FindApricornsInBag
	jr c, .nope
	ld hl, .MenuDataHeader
	call CopyMenuDataHeader
	ld a, [MenuSelection]
	ld [wMenuCursorBuffer], a
	xor a
	ld [hBGMapMode], a
	call InitScrollingMenu
	call UpdateSprites
	call ScrollingMenu
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .nope
	ld a, [MenuSelection]
	cp -1
	jr nz, .done

.nope
	xor a

.done
	ld c, a
	ret
; 88086

.MenuDataHeader: ; 0x88086
	db $40 ; flags
	db 01, 01 ; start coords
	db 10, 13 ; end coords
	dw .MenuData2
	db 1 ; default option
; 0x8808e

	db 0

.MenuData2: ; 0x8808f
	db $10 ; flags
	db 4, 7
	db 1
	dbw 0, Buffer1
	dba .Name
	dba .Quantity
	dba NULL

.Name: ; 8809f
	ld a, [MenuSelection]
	and a
	ret z
	callba PlaceMenuItemName
	ret
; 880ab

.Quantity: ; 880ab
	ld a, [MenuSelection]
	ld [CurItem], a
	call Kurt_GetQuantityOfApricorn
	ret z
	ld a, [wItemQuantityChangeBuffer]
	ld [MenuSelectionQuantity], a
	callba PlaceMenuItemQuantity
	ret
; 880c2

Kurt_SelectQuantity: ; 880c2
	ld a, [CurItem]
	ld [MenuSelection], a
	call Kurt_GetQuantityOfApricorn
	jr z, .done
	ld a, [wItemQuantityChangeBuffer]
	ld [wItemQuantityBuffer], a
	ld a, $1
	ld [wItemQuantityChangeBuffer], a
	ld hl, .MenuDataHeader
	call LoadMenuDataHeader
.loop
	xor a
	ld [hBGMapMode], a
	call MenuBox
	call UpdateSprites
	call .PlaceApricornName
	call PlaceApricornQuantity
	call ApplyTilemap
	callba Kurt_SelectQuantity_InterpretJoypad
	jr nc, .loop

	push bc
	call PlayClickSFX
	pop bc
	ld a, b
	cp -1
	jr z, .done
	ld a, [wItemQuantityChangeBuffer]
	ld [wItemQuantityChangeBuffer], a ; What is the point of this operation?
	scf

.done
	call CloseWindow
	ret
; 8810d

.MenuDataHeader: ; 0x8810d
	db $40 ; flags
	db 09, 06 ; start coords
	db 12, 19 ; end coords

	db 0, 0, -1, 0 ; XXX

.PlaceApricornName: ; 88116
	call MenuBoxCoord2Tile
	ld de, SCREEN_WIDTH + 1
	add hl, de
	ld d, h
	ld e, l
	callba PlaceMenuItemName
	ret
; 88126

PlaceApricornQuantity: ; 88126
	call MenuBoxCoord2Tile
	ld de, 2 * SCREEN_WIDTH + 10
	add hl, de
	ld [hl], "×"
	inc hl
	ld de, wItemQuantityChangeBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	jp PrintNum
; 88139

Kurt_GetQuantityOfApricorn: ; 88139
	push bc
	ld hl, NumItems
	ld a, [CurItem]
	ld c, a
	ld b, $0
.loop
	inc hl
	ld a, [hli]
	cp -1
	jr z, .done
	cp c
	jr nz, .loop
	ld a, [hl]
	add b
	ld b, a
	jr nc, .loop
	ld b, -1

.done
	ld a, b
	sub 99
	jr c, .done2
	ld b, 99

.done2
	ld a, b
	ld [wItemQuantityChangeBuffer], a
	and a
	pop bc
	ret
; 88161

Kurt_GiveUpSelectedQuantityOfSelectedApricorn: ; 88161
; Get the quantity of Apricorns of type [CurItem]
; in the bag. Compatible with multiple stacks.

; Initialize the search.
	push de
	push bc
	ld hl, NumItems
	ld a, [CurItem]
	ld c, a
	ld e, $0
	xor a
	ld [CurItemQuantity], a
	ld a, -1
	ld [wApricorns], a

; Search for [CurItem] in the bag.
.loop1
; Increase the total count.
	ld a, [CurItemQuantity]
	inc a
	ld [CurItemQuantity], a
; Get the index of the next item.
	inc hl
	ld a, [hli]
; If we've reached the end of the pocket, break.
	cp -1
	jr z, .okay1
; If we haven't found what we're looking for, continue.
	cp c
	jr nz, .loop1
; Increment the result counter and store the bag index of the match.
	ld d, $0
	push hl
	ld hl, wApricorns
	add hl, de
	inc e
	ld a, [CurItemQuantity]
	dec a
	ld [hli], a
	ld a, -1
	ld [hl], a
	pop hl
	jr .loop1

.okay1
; How many stacks have we found?
	ld a, e
	and a
	jr z, .done
	dec a
	jr z, .OnlyOne
	ld hl, wApricorns

.loop2
	ld a, [hl]
	ld c, a
	push hl
.loop3
	inc hl
	ld a, [hl]
	cp -1
	jr z, .okay2
	ld b, a
	ld a, c
	call Kurt_GetAddressOfApricornQuantity
	ld e, a
	ld a, b
	call Kurt_GetAddressOfApricornQuantity
	sub e
	jr z, .equal
	jr c, .less
	jr .loop3

.equal
	ld a, c
	sub b
	jr nc, .loop3

.less
	ld a, c
	ld c, b
	ld [hl], a
	ld a, c
	pop hl
	ld [hl], a
	push hl
	jr .loop3

.okay2
	pop hl
	inc hl
	ld a, [hl]
	cp -1
	jr nz, .loop2

.OnlyOne:
	ld hl, wApricorns
.loop4
	ld a, [hl]
	cp -1
	jr z, .done
	push hl
	ld [CurItemQuantity], a
	call Kurt_GetRidOfItem
	pop hl
	ld a, [wItemQuantityChangeBuffer]
	and a
	jr z, .done
	push hl
	ld a, [hli]
	ld c, a
.loop5
	ld a, [hli]
	cp -1
	jr z, .okay3
	cp c
	jr c, .loop5
	dec a
	dec hl
	ld [hli], a
	jr .loop5

.okay3
	pop hl
	inc hl
	jr .loop4

.done
	ld a, [wItemQuantityChangeBuffer]
	and a
	pop bc
	pop de
	ret
; 88201

Kurt_GetAddressOfApricornQuantity: ; 88201
	push hl
	push bc
	ld hl, NumItems
	inc hl
	ld c, a
	ld b, $0
	add hl, bc
	add hl, bc
	inc hl
	ld a, [hl]
	pop bc
	pop hl
	ret
; 88211

Kurt_GetRidOfItem: ; 88211
	push bc
	ld hl, NumItems
	ld a, [CurItemQuantity]
	ld c, a
	ld b, $0
	inc hl
	add hl, bc
	add hl, bc
	ld a, [CurItem]
	ld c, a
	ld a, [hli]
	cp -1
	jr z, .done
	cp c
	jr nz, .done
	ld a, [wItemQuantityChangeBuffer]
	ld c, a
	ld a, [hl]
	sub c
	ld b, c
	jr nc, .okay
	add c
	ld b, a

.okay
	push bc
	ld hl, NumItems
	ld a, b
	ld [wItemQuantityChangeBuffer], a
	call TossItem
	pop bc
	ld a, c
	sub b

.done
	ld [wItemQuantityChangeBuffer], a
	pop bc
	ret
; 88248
