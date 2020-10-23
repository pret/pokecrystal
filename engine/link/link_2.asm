LinkMonStatsScreen:
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
	farcall LoadTradeScreenBorderGFX
	farcall Link_WaitBGMap
	farcall InitTradeSpeciesList
	farcall SetTradeRoomBGPals
	call WaitBGMap2
	ret

Link_WaitBGMap:
	call WaitBGMap
	call WaitBGMap2
	ret

LinkTextbox2:
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

.PlaceBorder:
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
	ld a, $79
	ld [hli], a
	ld a, " "
	call .PlaceRow
	ld [hl], $7a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .loop

	ld a, $7b
	ld [hli], a
	ld a, $7c
	call .PlaceRow
	ld [hl], $7d
	ret

.PlaceRow:
	ld d, c
.row_loop
	ld [hli], a
	dec d
	jr nz, .row_loop
	ret
