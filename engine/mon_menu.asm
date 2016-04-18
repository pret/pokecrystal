MonMenuOptionStrings: ; 24caf
	db "STATS@"
	db "SWITCH@"
	db "ITEM@"
	db "CANCEL@"
	db "MOVE@"
	db "MAIL@"
	db "ERROR!@"
; 24cd9

MonMenuOptions: ; 24cd9

; Moves
	db MONMENU_FIELD_MOVE, MONMENU_CUT,        CUT
	db MONMENU_FIELD_MOVE, MONMENU_FLY,        FLY
	db MONMENU_FIELD_MOVE, MONMENU_SURF,       SURF
	db MONMENU_FIELD_MOVE, MONMENU_STRENGTH,   STRENGTH
	db MONMENU_FIELD_MOVE, MONMENU_FLASH,      FLASH
	db MONMENU_FIELD_MOVE, MONMENU_WATERFALL,  WATERFALL
	db MONMENU_FIELD_MOVE, MONMENU_WHIRLPOOL,  WHIRLPOOL
	db MONMENU_FIELD_MOVE, MONMENU_DIG,        DIG
	db MONMENU_FIELD_MOVE, MONMENU_TELEPORT,   TELEPORT
	db MONMENU_FIELD_MOVE, MONMENU_SOFTBOILED, SOFTBOILED
	db MONMENU_FIELD_MOVE, MONMENU_HEADBUTT,   HEADBUTT
	db MONMENU_FIELD_MOVE, MONMENU_ROCKSMASH,  ROCK_SMASH
	db MONMENU_FIELD_MOVE, MONMENU_MILKDRINK,  MILK_DRINK
	db MONMENU_FIELD_MOVE, MONMENU_SWEETSCENT, SWEET_SCENT

; Options
	db MONMENU_MENUOPTION, MONMENU_STATS,      1 ; STATS
	db MONMENU_MENUOPTION, MONMENU_SWITCH,     2 ; SWITCH
	db MONMENU_MENUOPTION, MONMENU_ITEM,       3 ; ITEM
	db MONMENU_MENUOPTION, MONMENU_CANCEL,     4 ; CANCEL
	db MONMENU_MENUOPTION, MONMENU_MOVE,       5 ; MOVE
	db MONMENU_MENUOPTION, MONMENU_MAIL,       6 ; MAIL
	db MONMENU_MENUOPTION, MONMENU_ERROR,      7 ; ERROR!

	db -1
; 24d19

MonSubmenu: ; 24d19
	xor a
	ld [hBGMapMode], a
	call GetMonSubmenuItems
	callba FreezeMonIcons
	ld hl, .MenuDataHeader
	call LoadMenuDataHeader
	call .GetTopCoord
	call PopulateMonMenu

	ld a, 1
	ld [hBGMapMode], a
	call MonMenuLoop
	ld [MenuSelection], a

	call ExitMenu
	ret
; 24d3f

.MenuDataHeader: ; 24d3f
	db $40 ; tile backup
	db 00, 06 ; start coords
	db 17, 19 ; end coords
	dw 0
	db 1 ; default option
; 24d47

.GetTopCoord: ; 24d47
; TopCoord = 1 + BottomCoord - 2 * (NumSubmenuItems + 1)
	ld a, [Buffer1]
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
	ld a, $a0 ; flags
	ld [wMenuData2Flags], a
	ld a, [Buffer1] ; items
	ld [wMenuData2Items], a
	call InitVerticalMenuCursor
	ld hl, w2DMenuFlags1
	set 6, [hl]
	call StaticMenuJoypad
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	ld a, [hJoyPressed]
	bit 0, a ; A
	jr nz, .select
	bit 1, a ; B
	jr nz, .cancel
	jr .loop

.cancel
	ld a, MONMENU_CANCEL ; CANCEL
	ret

.select
	ld a, [wMenuCursorY]
	dec a
	ld c, a
	ld b, 0
	ld hl, Buffer2
	add hl, bc
	ld a, [hl]
	ret
; 24d91

PopulateMonMenu: ; 24d91
	call MenuBoxCoord2Tile
	ld bc, $2a ; 42
	add hl, bc
	ld de, Buffer2
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
	ld bc, $28 ; 40
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
	cp 1
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
	ld a, [CurPartySpecies]
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
	ld a, MONMENU_STATS
	call AddMonMenuItem
	ld a, MONMENU_SWITCH
	call AddMonMenuItem
	ld a, MONMENU_MOVE
	call AddMonMenuItem
	ld a, [wLinkMode]
	and a
	jr nz, .skip2
	push hl
	ld a, MON_ITEM
	call GetPartyParamLocation
	ld d, [hl]
	callba ItemIsMail
	pop hl
	ld a, MONMENU_MAIL
	jr c, .ok
	ld a, MONMENU_ITEM

.ok
	call AddMonMenuItem

.skip2
	ld a, [Buffer1]
	cp NUM_MON_SUBMENU_ITEMS
	jr z, .ok2
	ld a, MONMENU_CANCEL
	call AddMonMenuItem

.ok2
	call TerminateMonSubmenu
	ret

.egg
	ld a, MONMENU_STATS
	call AddMonMenuItem
	ld a, MONMENU_SWITCH
	call AddMonMenuItem
	ld a, MONMENU_CANCEL
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
	ld [Buffer1], a
	ld hl, Buffer2
	ld bc, NUM_MON_SUBMENU_ITEMS + 1
	call ByteFill
	ret
; 24e76

TerminateMonSubmenu: ; 24e76
	ld a, [Buffer1]
	ld e, a
	ld d, $0
	ld hl, Buffer2
	add hl, de
	ld [hl], -1
	ret
; 24e83

AddMonMenuItem: ; 24e83
	push hl
	push de
	push af
	ld a, [Buffer1]
	ld e, a
	inc a
	ld [Buffer1], a
	ld d, $0
	ld hl, Buffer2
	add hl, de
	pop af
	ld [hl], a
	pop de
	pop hl
	ret
; 24e99

BattleMonMenu: ; 24e99
	ld hl, MenuDataHeader_0x24ed4
	call CopyMenuDataHeader
	xor a
	ld [hBGMapMode], a
	call MenuBox
	call UpdateSprites
	call PlaceVerticalMenuItems
	call WaitBGMap
	call CopyMenuData2
	ld a, [wMenuData2Flags]
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

MenuDataHeader_0x24ed4: ; 24ed4
	db $00 ; flags
	db 11, 11 ; start coords
	db 17, 19 ; end coords
	dw MenuData2_0x24edc
	db 1 ; default option
; 24edc

MenuData2_0x24edc: ; 24edc
	db $c0 ; flags
	db 3 ; items
	db "SWITCH@"
	db "STATS@"
	db "CANCEL@"
; 24ef2
