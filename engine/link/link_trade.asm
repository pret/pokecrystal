LinkCommsBorderGFX:
INCBIN "gfx/trade/border_tiles.2bpp"

__LoadTradeScreenBorderGFX:
	ld de, LinkCommsBorderGFX
	ld hl, vTiles2
	lb bc, BANK(LinkCommsBorderGFX), 70
	call Get2bpp
	ret

LoadMobileTradeBorderTilemap:
	ld hl, MobileTradeBorderTilemap
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyBytes
	ret

TestMobileTradeBorderTilemap: ; unreferenced
; Loads the mobile trade border graphics and tilemap,
; with a placeholder SCGB_DIPLOMA layout, and exits
; after pressing A or B. Possibly used for testing.
	call LoadStandardMenuHeader
	call ClearBGPalettes
	call ClearTilemap
	call ClearSprites
	farcall __LoadTradeScreenBorderGFX ; useless to farcall
	farcall LoadMobileTradeBorderTilemap ; useless to farcall
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetPalettes
	call WaitBGMap
	call JoyWaitAorB
	call Call_ExitMenu
	ret

MobileTradeBorderTilemap:
INCBIN "gfx/trade/border_mobile.tilemap"

CableTradeBorderTopTilemap:
INCBIN "gfx/trade/border_cable_top.tilemap"

CableTradeBorderBottomTilemap:
INCBIN "gfx/trade/border_cable_bottom.tilemap"

_LinkTextbox:
	ld h, d
	ld l, e
	push bc
	push hl
	call .PlaceBorder
	pop hl
	pop bc

	ld de, wAttrmap - wTilemap
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

.PlaceBorder
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

.PlaceRow
	ld d, c
.row_loop
	ld [hli], a
	dec d
	jr nz, .row_loop
	ret

InitTradeSpeciesList:
	call _LoadTradeScreenBorderGFX
	call LoadCableTradeBorderTilemap
	farcall InitMG_Mobile_LinkTradePalMap
	farcall PlaceTradePartnerNamesAndParty
	hlcoord 10, 17
	ld de, .CancelString
	call PlaceString
	ret

.CancelString:
	db "CANCEL@"

_LoadTradeScreenBorderGFX:
	call __LoadTradeScreenBorderGFX
	ret

LinkComms_LoadPleaseWaitTextboxBorderGFX:
	ld de, LinkCommsBorderGFX + $30 tiles
	ld hl, vTiles2 tile $76
	lb bc, BANK(LinkCommsBorderGFX), 8
	call Get2bpp
	ret

LoadTradeRoomBGPals:
	farcall _LoadTradeRoomBGPals
	ret

LoadCableTradeBorderTilemap:
	call LoadMobileTradeBorderTilemap
	ld hl, CableTradeBorderTopTilemap
	decoord 0, 0
	ld bc, 2 * SCREEN_WIDTH
	call CopyBytes
	ld hl, CableTradeBorderBottomTilemap
	decoord 0, 16
	ld bc, 2 * SCREEN_WIDTH
	call CopyBytes
	ret

LinkTextbox:
	call _LinkTextbox
	ret

PrintWaitingTextAndSyncAndExchangeNybble:
	call LoadStandardMenuHeader
	call .PrintWaitingText
	farcall WaitLinkTransfer
	call Call_ExitMenu
	call WaitBGMap2
	ret

.PrintWaitingText:
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

.Waiting:
	db "WAITING..!@"

LinkTradeMenu:
	call .MenuAction
	call .GetJoypad
	ret

.GetJoypad:
	push bc
	push af
	ldh a, [hJoyLast]
	and D_PAD
	ld b, a
	ldh a, [hJoyPressed]
	and BUTTONS
	or b
	ld b, a
	pop af
	ld a, b
	pop bc
	ld d, a
	ret

.MenuAction:
	ld hl, w2DMenuFlags2
	res 7, [hl]
	ldh a, [hBGMapMode]
	push af
	call .loop
	pop af
	ldh [hBGMapMode], a
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

.UpdateBGMapAndOAM:
	ldh a, [hOAMUpdate]
	push af
	ld a, $1
	ldh [hOAMUpdate], a
	call WaitBGMap
	pop af
	ldh [hOAMUpdate], a
	xor a
	ldh [hBGMapMode], a
	ret

.loop2
	call UpdateTimeAndPals
	call .TryAnims
	ret c
	ld a, [w2DMenuFlags1]
	bit 7, a
	jr z, .loop2
	and a
	ret

.UpdateCursor:
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

.TryAnims:
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
