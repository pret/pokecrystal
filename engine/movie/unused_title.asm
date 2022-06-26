UnusedTitleScreen: ; unreferenced
	call ClearBGPalettes
	call ClearTilemap
	call DisableLCD

; Turn BG Map update off
	xor a
	ldh [hBGMapMode], a

; Reset timing variables
	ld hl, wJumptableIndex
	ld [hli], a ; wJumptableIndex
	ld [hli], a ; wIntroSceneFrameCounter
	ld [hli], a ; wTitleScreenTimer
	ld [hl], a  ; wTitleScreenTimer + 1

	ld hl, UnusedTitleBG_GFX
	ld de, vTiles2
	ld bc, vBGMap0 - vTiles2
	call CopyBytes

	ld hl, UnusedTitleBG_GFX + $80 tiles
	ld de, vTiles1
	ld bc, vTiles2 - vTiles1
	call CopyBytes

	ld hl, UnusedTitleFG_GFX
	ld de, vTiles0
	ld bc, vTiles1 - vTiles0
	call CopyBytes

	ld hl, UnusedTitleBG_Tilemap
	debgcoord 0, 0
	ld bc, BG_MAP_WIDTH * BG_MAP_HEIGHT
.copy
	ld a, 0
	ldh [rVBK], a
	ld a, [hli]
	ld [de], a
	ld a, 1
	ldh [rVBK], a
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .copy

	ld hl, UnusedTitleFG_OAM
	ld de, wShadowOAMSprite00
	ld bc, SPRITEOAMSTRUCT_LENGTH * NUM_SPRITE_OAM_STRUCTS
	call CopyBytes

	call EnableLCD
	ldh a, [rLCDC]
	set rLCDC_SPRITES_ENABLE, a
	set rLCDC_SPRITE_SIZE, a
	ldh [rLCDC], a

	call DelayFrame

	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

	ld hl, UnusedTitleBG_Palettes
	ld de, wBGPals1
	ld bc, 8 palettes
	call CopyBytes

	ld hl, UnusedTitleFG_Palettes
	ld de, wOBPals1
	ld bc, 8 palettes
	call CopyBytes

	ld hl, UnusedTitleBG_Palettes
	ld de, wBGPals2
	ld bc, 8 palettes
	call CopyBytes

	ld hl, UnusedTitleFG_Palettes
	ld de, wOBPals2
	ld bc, 8 palettes
	call CopyBytes

	pop af
	ldh [rSVBK], a

	ld a, TRUE
	ldh [hCGBPalUpdate], a

	ld de, MUSIC_TITLE
	call PlayMusic

	ret

UnusedTitleBG_GFX:
INCBIN "gfx/title/old_bg.2bpp"

UnusedTitleBG_Tilemap:
; 32x32 (alternating tiles and attributes)
INCBIN "gfx/title/old_bg.tilemap"

UnusedTitleBG_Palettes:
INCLUDE "gfx/title/old_bg.pal"

UnusedTitleFG_GFX:
INCBIN "gfx/title/old_fg.2bpp"

UnusedTitleFG_Palettes:
INCLUDE "gfx/title/old_fg.pal"

UnusedTitleFG_OAM:
	dbsprite  7,  3,  0,  0, $00, 1
	dbsprite  8,  3,  0,  0, $02, 1
	dbsprite  9,  3,  0,  0, $04, 1
	dbsprite 10,  3,  0,  0, $06, 1
	dbsprite 11,  3,  0,  0, $08, 1
	dbsprite 12,  3,  0,  0, $0a, 1
	dbsprite 13,  3,  0,  0, $0c, 1
	dbsprite 14,  3,  0,  0, $0e, 1
	dbsprite  7,  5,  0,  0, $10, 0
	dbsprite  8,  5,  0,  0, $12, 0
	dbsprite  9,  5,  0,  0, $14, 0
	dbsprite 10,  5,  0,  0, $16, 0
	dbsprite 11,  5,  0,  0, $18, 0
	dbsprite 12,  5,  0,  0, $1a, 0
	dbsprite 13,  5,  0,  0, $1c, 0
	dbsprite 14,  5,  0,  0, $1e, 0
	dbsprite  7,  7,  0,  0, $20, 0
	dbsprite  8,  7,  0,  0, $22, 0
	dbsprite  9,  7,  0,  0, $24, 0
	dbsprite 10,  7,  0,  0, $26, 0
	dbsprite 11,  7,  0,  0, $28, 0
	dbsprite 12,  7,  0,  0, $2a, 0
	dbsprite 13,  7,  0,  0, $2c, 0
	dbsprite 14,  7,  0,  0, $2e, 0
	dbsprite  7,  9,  0,  0, $30, 2
	dbsprite  8,  9,  0,  0, $32, 2
	dbsprite  9,  9,  0,  0, $34, 2
	dbsprite 10,  9,  0,  0, $36, 2
	dbsprite 11,  9,  0,  0, $38, 2
	dbsprite 12,  9,  0,  0, $3a, 2
	dbsprite 13,  9,  0,  0, $3c, 2
	dbsprite 14,  9,  0,  0, $3e, 2
	dbsprite  7, 11,  0,  0, $40, 1
	dbsprite  8, 11,  0,  0, $42, 1
	dbsprite  9, 11,  0,  0, $44, 1
	dbsprite 10, 11,  0,  0, $46, 1
	dbsprite 11, 11,  0,  0, $48, 1
	dbsprite 12, 11,  0,  0, $4a, 1
	dbsprite 13, 11,  0,  0, $4c, 1
	dbsprite 14, 11,  0,  0, $4e, 1

TestCrystalTitleScreen: ; unreferenced
; Runs the title screen until A is pressed.
; Possibly used for testing.
	call _TitleScreen
.loop
	call JoyTextDelay
	ldh a, [hJoyLast]
	ld b, a
	and A_BUTTON
	jr nz, .done
	call SuicuneFrameIterator
	call DelayFrame
	jr .loop
.done
	ret
