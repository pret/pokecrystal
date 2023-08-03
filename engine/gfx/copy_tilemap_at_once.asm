_SafeCopyTilemapAtOnce::
	ldh a, [hBGMapMode]
	push af
	ldh a, [hMapAnims]
	push af
	ldh a, [hVBlank]
	push af
	xor a
	ldh [hBGMapMode], a
	ldh [hMapAnims], a
	ld a, b
	and %11
	jr nz, .notZero
	ldh a, [hCGBPalUpdate]
	ld d, a
	ld e, 0
	jr .gotPalUpdate
.notZero
	cp 3
	jr nz, .doNotUseOldValue
	ldh a, [hCGBPalUpdate]
	ld e, a
	ld d, 0
	jr .gotPalUpdate
.doNotUseOldValue
	dec a
	call nz, SetPalettes
	lb de, 0, 1
.gotPalUpdate
	xor a
	ldh [hCGBPalUpdate], a
	ldh a, [rLY]
	cp $70
	call nc, DelayFrame ; not enough time to update music, so wait a frame
	ld a, e
	ldh [hCGBPalUpdate], a
.waitLYAndUpdateMusic
	ldh a, [rLY]
	cp $70
	jr nz, .waitLYAndUpdateMusic
	xor a
	ldh [hBGMapThird], a
	bit 2, b
	jr z, .noForceOAMUpdate
	xor a
	ldh [hOAMUpdate], a
.noForceOAMUpdate
	bit 3, b
	ld a, 3
	jr z, .gotTileCount
	ld a, 9
.gotTileCount
	ldh [hTilesPerCycle], a
	ld a, b
	and %1000
	swap a
	or 5
	ldh [hBGMapMode], a ; bit 7 = skip attr map
	ld a, 1 << 7 | 7 ; execute actual VBlank7
	ldh [hVBlank], a
	call UpdateSound
	call DelayFrame
	ld a, d
	ldh [hCGBPalUpdate], a
	pop af
	ldh [hVBlank], a
	pop af
	ldh [hMapAnims], a
	pop af
	ldh [hBGMapMode], a
	ret
_CopyTilemapAtOnce::
	ldh a, [hBGMapMode]
	push af
	ldh a, [hMapAnims]
	push af
	xor a
	ldh [hBGMapMode], a
	ldh [hMapAnims], a
	di
	hlcoord 0, 0, wAttrmap
	ld a, 1 ; VRAM1
	call CopyFullTilemapInHBlank
	hlcoord 0, 0
	xor a ; VRAM0
	call CopyFullTilemapInHBlank
	ei ; in case we've passed vblank
	pop af
	ldh [hMapAnims], a
	pop af
	ldh [hBGMapMode], a
	ret

DEF HALF_HEIGHT EQU SCREEN_HEIGHT / 2

_UpdateBGMap::
; Double-speed version of UpdateBGMap. Not in home, since only newbox needs it.
	ldh a, [hBGMapMode]
	and $7f
	ret z
; BG Map 0
	dec a ; 1
	jr z, .DoTiles
	dec a ; 2
	jr z, .DoAttributes
; BG Map 1
	ld hl, vBGMap1
	dec a
	jr z, .DoBGMap1Tiles
	dec a
	jr z, .DoBGMap1Attributes
; Update from a specific row
; does not update hBGMapHalf
	dec a
	bccoord 0, 0
	jr z, .DoCustomSourceTiles
	dec a
	ret nz
	bccoord 0, 0, wAttrmap
	ld a, 1
	ldh [rVBK], a
	call .DoCustomSourceTiles
	xor a
	ldh [rVBK], a
	ret
.DoCustomSourceTiles
	ld [hSPBuffer], sp
	xor a
	ld h, a
	ld d, a
	ldh a, [hBGMapHalf] ; multiply by 20 to get the tilemap offset
	ld l, a
	ld e, a
	add hl, hl ; hl = hl * 2
	add hl, hl ; hl = hl * 4
	add hl, de ; hl = (hl*4) + de
	add hl, hl ; hl = (5*hl)*2
	add hl, hl ; hl = (5*hl)*4
	add hl, bc
	ld sp, hl
	ldh a, [hBGMapHalf] ; multiply by 32 to get the bg map offset
	; assumes [hBGMapHalf] < 16
	swap a
	add a
	ld l, a
	ld h, 0
	ldh a, [hBGMapAddress]
	add l
	ld l, a
	ldh a, [hBGMapAddress + 1]
	adc h
	ld h, a
	ldh a, [hTilesPerCycle]
	jr .startCustomCopy
.DoAttributes
	ldh a, [hBGMapAddress + 1]
	ld h, a
	ldh a, [hBGMapAddress]
	ld l, a
.DoBGMap1Attributes
	ld a, 1
	ldh [rVBK], a
	call .CopyAttributes
	xor a
	ldh [rVBK], a
	ret
.CopyAttributes
	ld [hSPBuffer], sp
; Which half?
	ldh a, [hBGMapHalf]
	and a ; 0
	jr z, .AttributeMapTop
; bottom row
	coord sp, 0, 9, wAttrmap
	ld de, HALF_HEIGHT * BG_MAP_WIDTH
	add hl, de
; Next time: top half
	xor a
	jr .startCopy
.AttributeMapTop
	coord sp, 0, 0, wAttrmap
; Next time: bottom half
	jr .AttributeMapTopContinue
.DoTiles
	ldh a, [hBGMapAddress + 1]
	ld h, a
	ldh a, [hBGMapAddress]
	ld l, a
.DoBGMap1Tiles
	ld [hSPBuffer], sp
; Which half?
	ldh a, [hBGMapHalf]
	and a ; 0
	jr z, .TileMapTop
; bottom row
	coord sp, 0, 9
	ld de, HALF_HEIGHT * BG_MAP_WIDTH
	add hl, de
; Next time: top half
	xor a
	jr .startCopy
.TileMapTop
	coord sp, 0, 0
; Next time: bottom half
.AttributeMapTopContinue
	inc a
.startCopy
; Which half to update next time
	ldh [hBGMapHalf], a
; Rows of tiles in a half
	ld a, SCREEN_HEIGHT / 2
.startCustomCopy
; Difference between wTilemap and vBGMap
	ld bc, BG_MAP_WIDTH - (SCREEN_WIDTH - 1)
.row
; Copy a row of 20 tiles
rept (SCREEN_WIDTH / 2) - 1
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
endr
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	add hl, bc
	dec a
	jr nz, .row
	ld sp, hSPBuffer
	pop hl
	ld sp, hl
	ret
VBlankSafeCopyTilemapAtOnce::
	ldh a, [hSCX]
	ldh [rSCX], a
	ldh a, [hSCY]
	ldh [rSCY], a
	ldh a, [hWY]
	ldh [rWY], a
	ldh a, [hWX]
	ldh [rWX], a
	call UpdateCGBPals
; values for the bg map update part should already be loaded
	call _UpdateBGMap
; specify the values for attr map update
	ldh a, [hBGMapMode]
	bit 7, a
	jr nz, .skipAttr
	ld a, 6
	ldh [hBGMapMode], a
	call _UpdateBGMap
.skipAttr
	call hTransferShadowOAM
	ldh a, [hBGMapMode]
	bit 7, a
	jr z, .attrAndBGCopy
; if we only need to update tiles, copy the remaining half in hblank
	hlcoord 0, 9
	ld de, BG_MAP_WIDTH * 9
	ld b, 9
	jr CopyTilemapInHBlank
.attrAndBGCopy
; now copy both tile and attr map, of alternating groups of 5/5/4
	hlcoord 0, 3, wAttrmap
	ld de, BG_MAP_WIDTH * 3
	call Copy5RowsOfTilemapInHBlank_VBK1
	hlcoord 0, 3
	ld de, BG_MAP_WIDTH * 3
	call Copy5RowsOfTilemapInHBlank_VBK0
	hlcoord 0, 8, wAttrmap
	ld de, BG_MAP_WIDTH * 8
	call Copy5RowsOfTilemapInHBlank_VBK1
	hlcoord 0, 8
	ld de, BG_MAP_WIDTH * 8
	call Copy5RowsOfTilemapInHBlank_VBK0
	hlcoord 0, 13, wAttrmap
	ld de, BG_MAP_WIDTH * 13
	call Copy5RowsOfTilemapInHBlank_VBK1
	hlcoord 0, 13
	ld de, BG_MAP_WIDTH * 13
; fallthrough
Copy5RowsOfTilemapInHBlank_VBK0:
	xor a
	ldh [rVBK], a
	jr Copy5RowsOfTilemapInHBlank
CopyFullTilemapInHBlank:
	ldh [rVBK], a
	ld de, 0
	ld b, SCREEN_HEIGHT
	jr CopyTilemapInHBlank
Copy5RowsOfTilemapInHBlank_VBK1:
	ld a, 1
	ldh [rVBK], a
; fallthrough
Copy5RowsOfTilemapInHBlank:
	ld b, 5
; fallthrough
CopyTilemapInHBlank:
; Copy all tiles to vBGMap
	ld [hSPBuffer], sp
	ld sp, hl
	ldh a, [hBGMapAddress + 1]
	ld h, a
	ldh a, [hBGMapAddress]
	ld l, a
	add hl, de
	ld a, b
.loop
	ldh [hTilesPerCycle], a
; if in v/hblank, wait until not in v/hblank
	pop bc
	pop de
	ldh a, [rLY]
	cp $90
	jr nc, .inVBlank1
.waitnohbl1
	ldh a, [rSTAT]
	and rSTAT_MODE_2 ; wait until mode 2-3
	jr z, .waitnohbl1
.waithbl1
	ldh a, [rSTAT]
	and rSTAT_MODE_2 ; wait until mode 0-1
	jr nz, .waithbl1
; load BGMap0
.inVBlank1
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	pop de
	ld a, e
	ld [hli], a
	ld [hl], d
	inc hl
	pop bc
	pop de
	ldh a, [rLY]
	cp $90
	jr nc, .inVBlank2
.waitnohbl2
	ldh a, [rSTAT]
	and rSTAT_MODE_2 ; wait until mode 2-3
	jr z, .waitnohbl2
.waithbl2
	ldh a, [rSTAT]
	and rSTAT_MODE_2 ; wait until mode 0-1
	jr nz, .waithbl2
; load BGMap0
.inVBlank2
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	pop de
	ld a, e
	ld [hli], a
	ld [hl], d
	ld de, BG_MAP_WIDTH - (SCREEN_WIDTH - 1)
	add hl, de
	ldh a, [hTilesPerCycle]
	dec a
	jr nz, .loop
	ld sp, hSPBuffer
	pop hl
	ld sp, hl
	ret
