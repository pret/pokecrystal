Special_AskRememberPassword: ; 4ae12
	call .DoMenu
	ld a, $0
	jr c, .okay
	ld a, $1

.okay
	ld [wScriptVar], a
	ret

.DoMenu: ; 4ae1f
	lb bc, 14, 7
	push bc
	ld hl, YesNoMenuDataHeader
	call CopyMenuDataHeader
	pop bc
	ld a, b
	ld [wMenuBorderLeftCoord], a
	add $5
	ld [wMenuBorderRightCoord], a
	ld a, c
	ld [wMenuBorderTopCoord], a
	add $4
	ld [wMenuBorderBottomCoord], a
	call PushWindow
	call VerticalMenu
	push af
	ld c, 15
	call DelayFrames
	call Buena_ExitMenu
	pop af
	jr c, .refused
	ld a, [wMenuCursorY]
	cp $2
	jr z, .refused
	and a
	ret

.refused
	ld a, $2
	ld [wMenuCursorY], a
	scf
	ret

Buena_ExitMenu: ; 4ae5e
	ld a, [hOAMUpdate]
	push af
	call ExitMenu
	call UpdateSprites
	xor a
	ld [hOAMUpdate], a
	call DelayFrame
	ld a, $1
	ld [hOAMUpdate], a
	call ApplyTilemap
	pop af
	ld [hOAMUpdate], a
	ret
