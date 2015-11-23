SpecialBuenasPassword: ; 8af6b
	xor a
	ld [wcf76], a
	ld hl, .MenuDataHeader
	call CopyMenuDataHeader
	ld a, [wBuenasPassword]
	ld c, a
	callba GetBuenasPassword
	ld a, [wMenuBorderLeftCoord]
	add c
	add $2
	ld [wMenuBorderRightCoord], a
	call BackUpTiles
	call DoNthMenu ; menu
	callba Buena_ExitMenu
	ld b, $0
	ld a, [MenuSelection]
	ld c, a
	ld a, [wBuenasPassword]
	and $3
	cp c
	jr nz, .wrong
	ld b, $1

.wrong
	ld a, b
	ld [ScriptVar], a
	ret
; 8afa9

.MenuDataHeader: ; 0x8afa9
	db $40 ; flags
	db 00, 00 ; start coords
	db 07, 10 ; end coords
	dw .MenuData2
	db 1 ; default option
; 0x8afb1

	db 0

.MenuData2: ; 0x8afb2
	db $81 ; flags
	db 0 ; items
	dw .PasswordIndices
	dw .PlacePasswordChoices
; 0x8afb4

.PasswordIndices: ; 8afb8
	db 3
	db 0, 1, 2
	db -1

.PlacePasswordChoices: ; 8afbd
	push de
	ld a, [wBuenasPassword]
	and $f0
	ld c, a
	ld a, [MenuSelection]
	add c
	ld c, a
	callba GetBuenasPassword
	pop hl
	call PlaceString
	ret
; 8afd4

SpecialBuenaPrize: ; 8afd4
	xor a
	ld [wMenuScrollPosition], a
	ld a, $1
	ld [MenuSelection], a
	call Function8b0d6
	call Function8b090
	ld hl, .Text_AskWhichPrize
	call PrintText
	jr .okay

.loop
	ld hl, .Text_AskWhichPrize
	call BuenaPrintText

.okay
	call DelayFrame
	call UpdateSprites
	call Function8b097
	call Function8b0e2
	jr z, .done
	ld [wcf75], a
	call Buena_getprize
	ld a, [hl]
	ld [wd265], a
	call GetItemName
	ld hl, .Text_IsThatRight
	call BuenaPrintText
	call YesNoBox
	jr c, .loop

	ld a, [wcf75]
	call Buena_getprize
	inc hl
	ld a, [hld]
	ld c, a
	ld a, [wBlueCardBalance]
	cp c
	jr c, .InsufficientBalance

	ld a, [hli]
	push hl
	ld [CurItem], a
	ld a, $1
	ld [wItemQuantityChangeBuffer], a
	ld hl, NumItems
	call ReceiveItem
	pop hl
	jr nc, .BagFull
	ld a, [hl]
	ld c, a
	ld a, [wBlueCardBalance]
	sub c
	ld [wBlueCardBalance], a
	call Function8b097
	jr .Purchase

.InsufficientBalance
	ld hl, .Text_NotEnoughPoints
	jr .print

.BagFull
	ld hl, .Text_NoRoom
	jr .print

.Purchase
	ld de, SFX_TRANSACTION
	call PlaySFX
	ld hl, .Text_HereYouGo

.print
	call BuenaPrintText
	jr .loop

.done
	call WriteBackup
	call WriteBackup
	ld hl, .Text_PleaseComeBackAgain
	call PrintText
	call JoyWaitAorB
	call PlayClickSFX
	ret
; 8b072

.Text_AskWhichPrize: ; 0x8b072
	; Which prize would you like?
	text_jump UnknownText_0x1c589f
	db "@"
; 0x8b077

.Text_IsThatRight: ; 0x8b077
	; ? Is that right?
	text_jump UnknownText_0x1c58bc
	db "@"
; 0x8b07c

.Text_HereYouGo	; Here you go!
	text_jump UnknownText_0x1c58d1
	db "@"
; 0x8b081

.Text_NotEnoughPoints: ; 0x8b081
	; You don't have enough points.
	text_jump UnknownText_0x1c58e0
	db "@"
; 0x8b086

.Text_NoRoom: ; 0x8b086
	; You have no room for it.
	text_jump UnknownText_0x1c58ff
	db "@"
; 0x8b08b

.Text_PleaseComeBackAgain: ; 0x8b08b
	; Oh. Please come back again!
	text_jump UnknownText_0x1c591a
	db "@"
; 0x8b090

Function8b090: ; 8b090
	ld hl, MenuDataHeader_0x8b0d1
	call LoadMenuDataHeader
	ret
; 8b097

Function8b097: ; 8b097
	ld de, wBlueCardBalance
	call Function8b09e
	ret
; 8b09e

Function8b09e: ; 8b09e
	push de
	xor a
	ld [hBGMapMode], a
	ld hl, MenuDataHeader_0x8b0d1
	call CopyMenuDataHeader
	call MenuBox
	call UpdateSprites
	call MenuBoxCoord2Tile
	ld bc, $0015
	add hl, bc
	ld de, .Points_string
	call PlaceString
	ld h, b
	ld l, c
	inc hl
	ld a, $7f
	ld [hli], a
	ld [hld], a
	pop de
	lb bc, 1, 2
	call PrintNum
	ret
; 8b0ca

.Points_string:
	db "Points@"
; 8b0d1

MenuDataHeader_0x8b0d1: ; 0x8b0d1
	db $40 ; flags
	db 11, 00 ; start coords
	db 13, 11 ; end coords
; 8b0d6

Function8b0d6: ; 8b0d6
	ld hl, .menudataheader
	call LoadMenuDataHeader
	ret
; 8b0dd

.menudataheader: ; 0x8b0dd
	db $40 ; flags
	db 00, 00 ; start coords
	db 11, 17 ; end coords
; 8b0e2

Function8b0e2: ; 8b0e2
	ld hl, .MenuDataHeader
	call CopyMenuDataHeader
	ld a, [MenuSelection]
	ld [wMenuCursorBuffer], a
	xor a
	ld [wcf76], a
	ld [hBGMapMode], a
	call InitScrollingMenu
	call UpdateSprites
	call HandleScrollingMenu
	ld a, [MenuSelection]
	ld c, a
	ld a, [MenuSelection2]
	ld [MenuSelection], a
	ld a, [wcf73]
	cp $2
	jr z, .asm_8b111
	ld a, c
	and a
	ret nz

.asm_8b111
	xor a
	ret
; 8b113

.MenuDataHeader: ; 0x8b113
	db $40 ; flags
	db 01, 01 ; start coords
	db 09, 16 ; end coords
	dw .MenuData2
	db 1 ; default option
; 0x8b11b

	db 0

.MenuData2: ; 0x8b11c
	db $10 ; flags
	db 4 ; items
	db $d, $1
	dba .indices
	dba .prizeitem
	dba .prizepoints
; 8b129

.indices: ; 8b129
	db 9
	db 1, 2, 3, 4, 5, 6, 7, 8, 9
	db -1
; 8b134

.prizeitem: ; 8b134
	ld a, [MenuSelection]
	call Buena_getprize
	ld a, [hl]
	push de
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	pop hl
	call PlaceString
	ret
; 8b147

.prizepoints: ; 8b147
	ld a, [MenuSelection]
	call Buena_getprize
	inc hl
	ld a, [hl]
	ld c, "0"
	add c
	ld [de], a
	ret
; 8b154

Buena_getprize: ; 8b154
	dec a
	ld hl, .prizes
	ld b, 0
	ld c, a
rept 2
	add hl, bc
endr
	ret
; 8b15e

.prizes: ; 8b15e
	db ULTRA_BALL,   2
	db FULL_RESTORE, 2
	db NUGGET,       3
	db RARE_CANDY,   3
	db PROTEIN,      5
	db IRON,         5
	db CARBOS,       5
	db CALCIUM,      5
	db HP_UP,        5
; 8b170
