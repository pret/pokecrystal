LinkCommsBorderGFX:
INCBIN "gfx/trade/border_tiles.2bpp"
; 16d421

__LoadTradeScreenBorder: ; 16d421
	ld de, LinkCommsBorderGFX
	ld hl, vTiles2
	lb bc, BANK(LinkCommsBorderGFX), 70
	call Get2bpp
	ret
; 16d42e

Function16d42e: ; 16d42e
	ld hl, Tilemap_16d465
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyBytes
	ret
; 16d43b

Function16d43b: ; 16d43b
	call LoadStandardMenuDataHeader
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	farcall __LoadTradeScreenBorder ; useless to farcall
	farcall Function16d42e ; useless to farcall
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetPalettes
	call WaitBGMap
	call JoyWaitAorB
	call Call_ExitMenu
	ret
; 16d465

Tilemap_16d465:
INCBIN "gfx/trade/border_mobile_fullscreen.tilemap"

Tilemap_16d5cd:
INCBIN "gfx/trade/border_cable_top.tilemap"

Tilemap_16d5f5:
INCBIN "gfx/trade/border_cable_bottom.tilemap"

_LinkTextbox: ; 16d61d
	ld h, d
	ld l, e
	push bc
	push hl
	call .PlaceBorder
	pop hl
	pop bc

	ld de, wAttrMap - wTileMap
	add hl, de
	inc b
	inc b
	inc c
	inc c
	ld a, PAL_BG_TEXT
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	pop bc
	dec b
	jr nz, .row
	ret
; 16d640

.PlaceBorder ; 16d640
	push hl
	ld a, $30
	ld [hli], a
	inc a
	call .PlaceRow
	inc a
	ld [hl], a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
.loop
	push hl
	ld a, $33
	ld [hli], a
	ld a, " "
	call .PlaceRow
	ld [hl], $34
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .loop

	ld a, $35
	ld [hli], a
	ld a, $36
	call .PlaceRow
	ld [hl], $37
	ret
; 16d66d

.PlaceRow ; 16d66d
	ld d, c
.row_loop
	ld [hli], a
	dec d
	jr nz, .row_loop
	ret
; 16d673

InitTradeSpeciesList: ; 16d673
	call _LoadTradeScreenBorder
	call Function16d6ae
	farcall InitMG_Mobile_LinkTradePalMap
	farcall PlaceTradePartnerNamesAndParty
	hlcoord 10, 17
	ld de, .CANCEL
	call PlaceString
	ret
; 16d68f

.CANCEL: ; 16d68f
	db "CANCEL@"
; 16d696

_LoadTradeScreenBorder: ; 16d696
	call __LoadTradeScreenBorder
	ret
; 16d69a


LinkComms_LoadPleaseWaitTextboxBorderGFX: ; 16d69a
	ld de, LinkCommsBorderGFX + $30 tiles
	ld hl, vTiles2 tile $76
	lb bc, BANK(LinkCommsBorderGFX), 8
	call Get2bpp
	ret
; 16d6a7

LoadTradeRoomBGPals_: ; 16d6a7
	farcall LoadTradeRoomBGPals
	ret
; 16d6ae

Function16d6ae: ; 16d6ae
	call Function16d42e
	ld hl, Tilemap_16d5cd
	decoord 0, 0
	ld bc, 2 * SCREEN_WIDTH
	call CopyBytes
	ld hl, Tilemap_16d5f5
	decoord 0, 16
	ld bc, 2 * SCREEN_WIDTH
	call CopyBytes
	ret
; 16d6ca

LinkTextbox: ; 16d6ca
	call _LinkTextbox
	ret
; 16d6ce

Function16d6ce: ; 16d6ce
	call LoadStandardMenuDataHeader
	call Function16d6e1
	farcall WaitLinkTransfer
	call Call_ExitMenu
	call WaitBGMap2
	ret
; 16d6e1

Function16d6e1: ; 16d6e1
	hlcoord 4, 10
	ld b, 1
	ld c, 10
	predef LinkTextboxAtHL
	hlcoord 5, 11
	ld de, .Waiting
	call PlaceString
	call WaitBGMap
	call WaitBGMap2
	ld c, 50
	jp DelayFrames
; 16d701

.Waiting: ; 16d701
	db "WAITING..!@"
; 16d70c

LinkTradeMenu: ; 16d70c
	call .MenuAction
	call .GetJoypad
	ret
; 16d713

.GetJoypad: ; 16d713
	push bc
	push af
	ld a, [hJoyLast]
	and D_PAD
	ld b, a
	ld a, [hJoyPressed]
	and BUTTONS
	or b
	ld b, a
	pop af
	ld a, b
	pop bc
	ld d, a
	ret
; 16d725

.MenuAction: ; 16d725
	ld hl, w2DMenuFlags2
	res 7, [hl]
	ld a, [hBGMapMode]
	push af
	call .loop
	pop af
	ld [hBGMapMode], a
	ret

.loop
	call .UpdateCursor
	call .UpdateBGMapAndOAM
	call .loop2
	jr nc, .done
	farcall _2DMenuInterpretJoypad
	jr c, .done
	ld a, [w2DMenuFlags1]
	bit 7, a
	jr nz, .done
	call .GetJoypad
	ld b, a
	ld a, [wMenuJoypadFilter]
	and b
	jr z, .loop

.done
	ret
; 16d759

.UpdateBGMapAndOAM: ; 16d759
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a
	call WaitBGMap
	pop af
	ld [hOAMUpdate], a
	xor a
	ld [hBGMapMode], a
	ret

.loop2
	call RTC
	call .TryAnims
	ret c
	ld a, [w2DMenuFlags1]
	bit 7, a
	jr z, .loop2
	and a
	ret
; 16d77a

.UpdateCursor: ; 16d77a
	ld hl, wCursorCurrentTile
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	cp $1f
	jr nz, .not_currently_selected
	ld a, [wCursorOffCharacter]
	ld [hl], a
	push hl
	push bc
	ld bc, MON_NAME_LENGTH
	add hl, bc
	ld [hl], a
	pop bc
	pop hl

.not_currently_selected
	ld a, [w2DMenuCursorInitY]
	ld b, a
	ld a, [w2DMenuCursorInitX]
	ld c, a
	call Coord2Tile
	ld a, [w2DMenuCursorOffsets]
	swap a
	and $f
	ld c, a
	ld a, [wMenuCursorY]
	ld b, a
	xor a
	dec b
	jr z, .skip
.loop3
	add c
	dec b
	jr nz, .loop3

.skip
	ld c, SCREEN_WIDTH
	call AddNTimes
	ld a, [w2DMenuCursorOffsets]
	and $f
	ld c, a
	ld a, [wMenuCursorX]
	ld b, a
	xor a
	dec b
	jr z, .skip2
.loop4
	add c
	dec b
	jr nz, .loop4

.skip2
	ld c, a
	add hl, bc
	ld a, [hl]
	cp $1f
	jr z, .cursor_already_there
	ld [wCursorOffCharacter], a
	ld [hl], $1f
	push hl
	push bc
	ld bc, MON_NAME_LENGTH
	add hl, bc
	ld [hl], $1f
	pop bc
	pop hl
.cursor_already_there
	ld a, l
	ld [wCursorCurrentTile], a
	ld a, h
	ld [wCursorCurrentTile + 1], a
	ret
; 16d7e7

.TryAnims: ; 16d7e7
	ld a, [w2DMenuFlags1]
	bit 6, a
	jr z, .skip_anims
	farcall PlaySpriteAnimationsAndDelayFrame
.skip_anims
	call JoyTextDelay
	call .GetJoypad
	and a
	ret z
	scf
	ret
; 16d7fe
