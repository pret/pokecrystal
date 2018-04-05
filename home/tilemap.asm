ClearBGPalettes:: ; 31f3
	call ClearPalettes
WaitBGMap:: ; 31f6
; Tell VBlank to update BG Map
	ld a, 1 ; BG Map 0 tiles
	ld [hBGMapMode], a
; Wait for it to do its magic
	ld c, 4
	call DelayFrames
	ret
; 3200

WaitBGMap2:: ; 0x3200
	ld a, [hCGB]
	and a
	jr z, .bg0

	ld a, 2
	ld [hBGMapMode], a
	ld c, 4
	call DelayFrames

.bg0
	ld a, 1
	ld [hBGMapMode], a
	ld c, 4
	call DelayFrames
	ret
; 0x3218

IsCGB:: ; 3218
	ld a, [hCGB]
	and a
	ret
; 321c

ApplyTilemap:: ; 321c
	ld a, [hCGB]
	and a
	jr z, .dmg

	ld a, [wSpriteUpdatesEnabled]
	cp 0
	jr z, .dmg

	ld a, 1
	ld [hBGMapMode], a
	jr CopyTilemapAtOnce

.dmg
; WaitBGMap
	ld a, 1
	ld [hBGMapMode], a
	ld c, 4
	call DelayFrames
	ret
; 3238

CGBOnly_CopyTilemapAtOnce:: ; 3238
	ld a, [hCGB]
	and a
	jr z, WaitBGMap

CopyTilemapAtOnce:: ; 323d
	jr .CopyTilemapAtOnce
; 323f

; unused
	farcall HDMATransferAttrMapAndTileMapToWRAMBank3
	ret
; 3246

.CopyTilemapAtOnce: ; 3246
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a

	ld a, [hMapAnims]
	push af
	xor a
	ld [hMapAnims], a

.wait
	ld a, [rLY]
	cp $7f
	jr c, .wait

	di
	ld a, BANK(vTiles3)
	ld [rVBK], a
	hlcoord 0, 0, wAttrMap
	call .StackPointerMagic
	ld a, BANK(vTiles0)
	ld [rVBK], a
	hlcoord 0, 0
	call .StackPointerMagic

.wait2
	ld a, [rLY]
	cp $7f
	jr c, .wait2
	ei

	pop af
	ld [hMapAnims], a
	pop af
	ld [hBGMapMode], a
	ret
; 327b

.StackPointerMagic: ; 327b
; Copy all tiles to vBGMap
	ld [hSPBuffer], sp
	ld sp, hl
	ld a, [hBGMapAddress + 1]
	ld h, a
	ld l, 0
	ld a, SCREEN_HEIGHT
	ld [hTilesPerCycle], a
	ld b, 1 << 1 ; not in v/hblank
	ld c, LOW(rSTAT)

.loop
rept SCREEN_WIDTH / 2
	pop de
; if in v/hblank, wait until not in v/hblank
.loop\@
	ld a, [$ff00+c]
	and b
	jr nz, .loop\@
; load BGMap0
	ld [hl], e
	inc l
	ld [hl], d
	inc l
endr

	ld de, BG_MAP_WIDTH - SCREEN_WIDTH
	add hl, de
	ld a, [hTilesPerCycle]
	dec a
	ld [hTilesPerCycle], a
	jr nz, .loop

	ld a, [hSPBuffer]
	ld l, a
	ld a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	ret
; 32f9

SetPalettes:: ; 32f9
; Inits the Palettes
; depending on the system the monochromes palettes or color palettes
	ld a, [hCGB]
	and a
	jr nz, .SetPalettesForGameBoyColor
	ld a, %11100100
	ld [rBGP], a
	ld a, %11010000
	ld [rOBP0], a
	ld [rOBP1], a
	ret

.SetPalettesForGameBoyColor:
	push de
	ld a, %11100100
	call DmgToCgbBGPals
	lb de, %11100100, %11100100
	call DmgToCgbObjPals
	pop de
	ret
; 3317

ClearPalettes:: ; 3317
; Make all palettes white

; CGB: make all the palette colors white
	ld a, [hCGB]
	and a
	jr nz, .cgb

; DMG: just change palettes to 0 (white)
	xor a
	ld [rBGP], a
	ld [rOBP0], a
	ld [rOBP1], a
	ret

.cgb
	ld a, [rSVBK]
	push af

	ld a, BANK(wBGPals2)
	ld [rSVBK], a

; Fill wBGPals2 and wOBPals2 with $ffff (white)
	ld hl, wBGPals2
	ld bc, 16 palettes
	ld a, $ff
	call ByteFill

	pop af
	ld [rSVBK], a

; Request palette update
	ld a, 1
	ld [hCGBPalUpdate], a
	ret
; 333e

GetMemSGBLayout:: ; 333e
	ld b, SCGB_RAM
GetSGBLayout:: ; 3340
; load sgb packets unless dmg

	ld a, [hCGB]
	and a
	jr nz, .sgb

	ld a, [hSGB]
	and a
	ret z

.sgb
	predef_jump LoadSGBLayout
; 334e
