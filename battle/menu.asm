LoadBattleMenu: ; 24ef2
	ld hl, BattleMenuDataHeader
	call LoadMenuDataHeader
	ld a, [wd0d2]
	ld [wMenuCursorBuffer], a
	call InterpretBattleMenu
	ld a, [wMenuCursorBuffer]
	ld [wd0d2], a
	call ExitMenu
	ret
; 24f0b

SafariBattleMenu: ; 24f0b
; untranslated
	ld hl, MenuDataHeader_0x24f4e
	call LoadMenuDataHeader
	jr Function24f19
; 24f13

ContestBattleMenu: ; 24f13
	ld hl, MenuDataHeader_0x24f89
	call LoadMenuDataHeader
; 24f19

Function24f19: ; 24f19
	ld a, [wd0d2]
	ld [wMenuCursorBuffer], a
	call _2DMenu
	ld a, [wMenuCursorBuffer]
	ld [wd0d2], a
	call ExitMenu
	ret
; 24f2c

BattleMenuDataHeader: ; 24f2c
	db $40 ; flags
	db 12, 08 ; start coords
	db 17, 19 ; end coords
	dw MenuData_0x24f34
	db 1 ; default option
; 24f34

MenuData_0x24f34: ; 0x24f34
	db $81 ; flags
	dn 2, 2 ; rows, columns
	db 6 ; spacing
	dba Strings24f3d
	dbw BANK(MenuData_0x24f34), 0
; 0x24f3d

Strings24f3d: ; 0x24f3d
	db "FIGHT@"
	db "<PKMN>@"
	db "PACK@"
	db "RUN@"
; 24f4e

MenuDataHeader_0x24f4e: ; 24f4e
	db $40 ; flags
	db 12, 00 ; start coords
	db 17, 19 ; end coords
	dw MenuData_0x24f56
	db 1 ; default option
; 24f56

MenuData_0x24f56: ; 24f56
	db $81 ; flags
	dn 2, 2 ; rows, columns
	db 11 ; spacing
	dba Strings24f5f
	dba Function24f7c
; 24f5f

Strings24f5f: ; 24f5f
	db "サファりボール×  @" ; "SAFARI BALL×  @"
	db "エサをなげる@" ; "THROW BAIT"
	db "いしをなげる@" ; "THROW ROCK"
	db "にげる@" ; "RUN"
; 24f7c

Function24f7c: ; 24f7c
	hlcoord 17, 13
	ld de, wSafariBallsRemaining
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret
; 24f89

MenuDataHeader_0x24f89: ; 24f89
	db $40 ; flags
	db 12, 02 ; start coords
	db 17, 19 ; end coords
	dw MenuData_0x24f91
	db 1 ; default option
; 24f91

MenuData_0x24f91: ; 24f91
	db $81 ; flags
	dn 2, 2 ; rows, columns
	db 12 ; spacing
	dba Strings24f9a
	dba Function24fb2
; 24f9a

Strings24f9a: ; 24f9a
	db "FIGHT@"
	db "<PKMN>", "@"
	db "PARKBALL×  @"
	db "RUN@"
; 24fb2

Function24fb2: ; 24fb2
	hlcoord 13, 16
	ld de, wParkBallsRemaining
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret
; 24fbf
