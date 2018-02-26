INCLUDE "data/mon_menu.asm"

MonSubmenu: ; 24d19
	xor a
	ld [hBGMapMode], a
	call GetMonSubmenuItems
	farcall FreezeMonIcons
	ld hl, .MenuHeader
	call LoadMenuHeader
	call .GetTopCoord
	call PopulateMonMenu

	ld a, 1
	ld [hBGMapMode], a
	call MonMenuLoop
	ld [wMenuSelection], a

	call ExitMenu
	ret
; 24d3f

.MenuHeader: ; 24d3f
	db MENU_BACKUP_TILES ; flags
	menu_coords 6, 0, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw 0
	db 1 ; default option
; 24d47

.GetTopCoord: ; 24d47
; TopCoord = 1 + BottomCoord - 2 * (NumSubmenuItems + 1)
	ld a, [wBuffer1]
	inc a
	add a
	ld b, a
	ld a, [wMenuBorderBottomCoord]
	sub b
	inc a
	ld [wMenuBorderTopCoord], a
	call MenuBox
	ret
; 24d59

MonMenuLoop: ; 24d59
.loop
	ld a, MENU_UNUSED_3 | MENU_BACKUP_TILES_2 ; flags
	ld [wMenuDataFlags], a
	ld a, [wBuffer1] ; items
	ld [wMenuDataItems], a
	call InitVerticalMenuCursor
	ld hl, w2DMenuFlags1
	set 6, [hl]
	call StaticMenuJoypad
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	ld a, [hJoyPressed]
	bit A_BUTTON_F, a
	jr nz, .select
	bit B_BUTTON_F, a
	jr nz, .cancel
	jr .loop

.cancel
	ld a, MONMENUITEM_CANCEL
	ret

.select
	ld a, [wMenuCursorY]
	dec a
	ld c, a
	ld b, 0
	ld hl, wBuffer2
	add hl, bc
	ld a, [hl]
	ret
; 24d91

PopulateMonMenu: ; 24d91
	call MenuBoxCoord2Tile
	ld bc, 2 * SCREEN_WIDTH + 2
	add hl, bc
	ld de, wBuffer2
.loop
	ld a, [de]
	inc de
	cp -1
	ret z
	push de
	push hl
	call GetMonMenuString
	pop hl
	call PlaceString
	ld bc, 2 * SCREEN_WIDTH
	add hl, bc
	pop de
	jr .loop
; 24db0

GetMonMenuString: ; 24db0
	ld hl, MonMenuOptions + 1
	ld de, 3
	call IsInArray
	dec hl
	ld a, [hli]
	cp MONMENU_MENUOPTION
	jr z, .NotMove
	inc hl
	ld a, [hl]
	ld [wd265], a
	call GetMoveName
	ret

.NotMove:
	inc hl
	ld a, [hl]
	dec a
	ld hl, MonMenuOptionStrings
	call GetNthString
	ld d, h
	ld e, l
	ret
; 24dd4

GetMonSubmenuItems: ; 24dd4
	call ResetMonSubmenu
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg
	ld a, [wLinkMode]
	and a
	jr nz, .skip_moves
	ld a, MON_MOVES
	call GetPartyParamLocation
	ld d, h
	ld e, l
	ld c, NUM_MOVES
.loop
	push bc
	push de
	ld a, [de]
	and a
	jr z, .next
	push hl
	call IsFieldMove
	pop hl
	jr nc, .next
	call AddMonMenuItem

.next
	pop de
	inc de
	pop bc
	dec c
	jr nz, .loop

.skip_moves
	ld a, MONMENUITEM_STATS
	call AddMonMenuItem
	ld a, MONMENUITEM_SWITCH
	call AddMonMenuItem
	ld a, MONMENUITEM_MOVE
	call AddMonMenuItem
	ld a, [wLinkMode]
	and a
	jr nz, .skip2
	push hl
	ld a, MON_ITEM
	call GetPartyParamLocation
	ld d, [hl]
	farcall ItemIsMail
	pop hl
	ld a, MONMENUITEM_MAIL
	jr c, .ok
	ld a, MONMENUITEM_ITEM

.ok
	call AddMonMenuItem

.skip2
	ld a, [wBuffer1]
	cp NUM_MONMENU_ITEMS
	jr z, .ok2
	ld a, MONMENUITEM_CANCEL
	call AddMonMenuItem

.ok2
	call TerminateMonSubmenu
	ret

.egg
	ld a, MONMENUITEM_STATS
	call AddMonMenuItem
	ld a, MONMENUITEM_SWITCH
	call AddMonMenuItem
	ld a, MONMENUITEM_CANCEL
	call AddMonMenuItem
	call TerminateMonSubmenu
	ret
; 24e52

IsFieldMove: ; 24e52
	ld b, a
	ld hl, MonMenuOptions
.next
	ld a, [hli]
	cp -1
	jr z, .nope
	cp MONMENU_MENUOPTION
	jr z, .nope
	ld d, [hl]
	inc hl
	ld a, [hli]
	cp b
	jr nz, .next
	ld a, d
	scf

.nope
	ret
; 24e68

ResetMonSubmenu: ; 24e68
	xor a
	ld [wBuffer1], a
	ld hl, wBuffer2
	ld bc, NUM_MONMENU_ITEMS + 1
	call ByteFill
	ret
; 24e76

TerminateMonSubmenu: ; 24e76
	ld a, [wBuffer1]
	ld e, a
	ld d, 0
	ld hl, wBuffer2
	add hl, de
	ld [hl], -1
	ret
; 24e83

AddMonMenuItem: ; 24e83
	push hl
	push de
	push af
	ld a, [wBuffer1]
	ld e, a
	inc a
	ld [wBuffer1], a
	ld d, 0
	ld hl, wBuffer2
	add hl, de
	pop af
	ld [hl], a
	pop de
	pop hl
	ret
; 24e99

BattleMonMenu: ; 24e99
	ld hl, MenuHeader_0x24ed4
	call CopyMenuHeader
	xor a
	ld [hBGMapMode], a
	call MenuBox
	call UpdateSprites
	call PlaceVerticalMenuItems
	call WaitBGMap
	call CopyMenuData
	ld a, [wMenuDataFlags]
	bit 7, a
	jr z, .set_carry
	call InitVerticalMenuCursor
	ld hl, w2DMenuFlags1
	set 6, [hl]
	call StaticMenuJoypad
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	ld a, [hJoyPressed]
	bit B_BUTTON_F, a
	jr z, .clear_carry
	ret z

.set_carry
	scf
	ret

.clear_carry
	and a
	ret
; 24ed4

MenuHeader_0x24ed4: ; 24ed4
	db 0 ; flags
	menu_coords 11, 11, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw MenuData_0x24edc
	db 1 ; default option
; 24edc

MenuData_0x24edc: ; 24edc
	db STATICMENU_CURSOR | STATICMENU_NO_TOP_SPACING ; flags
	db 3 ; items
	db "SWITCH@"
	db "STATS@"
	db "CANCEL@"
; 24ef2
