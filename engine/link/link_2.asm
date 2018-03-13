LinkMonStatsScreen: ; 4d319
	ld a, [wMenuCursorY]
	dec a
	ld [wCurPartyMon], a
	call LowVolume
	predef StatsScreenInit
	ld a, [wCurPartyMon]
	inc a
	ld [wMenuCursorY], a
	call ClearScreen
	call ClearBGPalettes
	call MaxVolume
	farcall LoadTradeScreenBorder
	farcall Link_WaitBGMap
	farcall InitTradeSpeciesList
	farcall SetTradeRoomBGPals
	call WaitBGMap2
	ret

Link_WaitBGMap: ; 4d354
	call WaitBGMap
	call WaitBGMap2
	ret

LinkTextbox2: ; 4d35b
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
; 4d37e

.PlaceBorder: ; 4d37e
	push hl
	ld a, $76
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
	ld a, "┌"
	ld [hli], a
	ld a, " "
	call .PlaceRow
	ld [hl], "─"
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .loop

	ld a, "┐"
	ld [hli], a
	ld a, "│"
	call .PlaceRow
	ld [hl], "└"
	ret
; 4d3ab

.PlaceRow: ; 4d3ab
	ld d, c
.row_loop
	ld [hli], a
	dec d
	jr nz, .row_loop
	ret
