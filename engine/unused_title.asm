UnusedTitleScreen: ; 10c000

	call ClearBGPalettes
	call ClearTileMap
	call DisableLCD

; Turn BG Map update off
	xor a
	ld [hBGMapMode], a

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
	ld bc, 32 * 32
.copy
	ld a, 0
	ld [rVBK], a
	ld a, [hli]
	ld [de], a
	ld a, 1
	ld [rVBK], a
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .copy

	ld hl, UnusedTitleFG_OAM
	ld de, Sprites
	ld bc, $a0
	call CopyBytes

	call EnableLCD
	ld a, [rLCDC]
	set rLCDC_SPRITES_ENABLE, a
	set rLCDC_SPRITE_SIZE, a
	ld [rLCDC], a

	call DelayFrame

	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a

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
	ld [rSVBK], a

	ld a, $1
	ld [hCGBPalUpdate], a

	ld de, MUSIC_TITLE
	call PlayMusic

	ret
; 10c0b1

UnusedTitleBG_GFX: ; 10c0b1
INCBIN "gfx/title/old_bg.2bpp"
; 10d0b1

UnusedTitleBG_Tilemap: ; 10d0b1
; 32x32 (alternating tiles and attributes)
INCBIN "gfx/title/old_bg.tilemap"
; 10d8b1

UnusedTitleBG_Palettes: ; 10d8b1
INCLUDE "gfx/title/old_bg.pal"
; 10dab1

UnusedTitleFG_GFX: ; 10dab1
INCBIN "gfx/title/old_fg.2bpp"
; 10eab1

UnusedTitleFG_Palettes: ; 10eab1
INCLUDE "gfx/title/old_fg.pal"
; 10ecb1

UnusedTitleFG_OAM: ; 10ecb1
	dsprite  3,  0,  7,  0, $00, 1
	dsprite  3,  0,  8,  0, $02, 1
	dsprite  3,  0,  9,  0, $04, 1
	dsprite  3,  0, 10,  0, $06, 1
	dsprite  3,  0, 11,  0, $08, 1
	dsprite  3,  0, 12,  0, $0a, 1
	dsprite  3,  0, 13,  0, $0c, 1
	dsprite  3,  0, 14,  0, $0e, 1
	dsprite  5,  0,  7,  0, $10, 0
	dsprite  5,  0,  8,  0, $12, 0
	dsprite  5,  0,  9,  0, $14, 0
	dsprite  5,  0, 10,  0, $16, 0
	dsprite  5,  0, 11,  0, $18, 0
	dsprite  5,  0, 12,  0, $1a, 0
	dsprite  5,  0, 13,  0, $1c, 0
	dsprite  5,  0, 14,  0, $1e, 0
	dsprite  7,  0,  7,  0, $20, 0
	dsprite  7,  0,  8,  0, $22, 0
	dsprite  7,  0,  9,  0, $24, 0
	dsprite  7,  0, 10,  0, $26, 0
	dsprite  7,  0, 11,  0, $28, 0
	dsprite  7,  0, 12,  0, $2a, 0
	dsprite  7,  0, 13,  0, $2c, 0
	dsprite  7,  0, 14,  0, $2e, 0
	dsprite  9,  0,  7,  0, $30, 2
	dsprite  9,  0,  8,  0, $32, 2
	dsprite  9,  0,  9,  0, $34, 2
	dsprite  9,  0, 10,  0, $36, 2
	dsprite  9,  0, 11,  0, $38, 2
	dsprite  9,  0, 12,  0, $3a, 2
	dsprite  9,  0, 13,  0, $3c, 2
	dsprite  9,  0, 14,  0, $3e, 2
	dsprite 11,  0,  7,  0, $40, 1
	dsprite 11,  0,  8,  0, $42, 1
	dsprite 11,  0,  9,  0, $44, 1
	dsprite 11,  0, 10,  0, $46, 1
	dsprite 11,  0, 11,  0, $48, 1
	dsprite 11,  0, 12,  0, $4a, 1
	dsprite 11,  0, 13,  0, $4c, 1
	dsprite 11,  0, 14,  0, $4e, 1
; 10ed51

Function10ed51: ; 10ed51
	call _TitleScreen
.loop
	call JoyTextDelay
	ld a, [hJoyLast]
	ld b, a
	and 1
	jr nz, .done
	call SuicuneFrameIterator
	call DelayFrame
	jr .loop
.done
	ret
; 10ed67
