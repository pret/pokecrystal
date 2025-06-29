ScrollingMenu::
	call CopyMenuData
	ldh a, [hROMBank]
	push af

	ld a, BANK(_ScrollingMenu) ; aka BANK(_InitScrollingMenu)
	rst Bankswitch

	call _InitScrollingMenu
	call .UpdatePalettes
	call _ScrollingMenu

	pop af
	rst Bankswitch

	ld a, [wMenuJoypad]
	ret

.UpdatePalettes:
	ld hl, wStateFlags
	bit SPRITE_UPDATES_DISABLED_F, [hl]
	jp nz, UpdateTimePals
	jp SetDefaultBGPAndOBP

InitScrollingMenu::
	ld a, [wMenuBorderTopCoord]
	dec a
	ld b, a
	ld a, [wMenuBorderBottomCoord]
	sub b
	ld d, a
	ld a, [wMenuBorderLeftCoord]
	dec a
	ld c, a
	ld a, [wMenuBorderRightCoord]
	sub c
	ld e, a
	push de
	call Coord2Tile
	pop bc
	jp Textbox

JoyTextDelay_ForcehJoyDown::
	call DelayFrame

	ldh a, [hInMenu]
	push af
	ld a, $1
	ldh [hInMenu], a
	call JoyTextDelay
	pop af
	ldh [hInMenu], a

	ldh a, [hJoyLast]
	and PAD_CTRL_PAD
	ld c, a
	ldh a, [hJoyPressed]
	and PAD_BUTTONS
	or c
	ld c, a
	ret
