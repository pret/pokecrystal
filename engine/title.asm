_TitleScreen: ; 10ed67

	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap

; Turn BG Map update off
	xor a
	ld [hBGMapMode], a

; Reset timing variables
	ld hl, wJumptableIndex
	ld [hli], a ; cf63 ; Scene?
	ld [hli], a ; cf64
	ld [hli], a ; cf65 ; Timer lo
	ld [hl], a  ; cf66 ; Timer hi

; Turn LCD off
	call DisableLCD


; VRAM bank 1
	ld a, 1
	ld [rVBK], a


; Decompress running Suicune gfx
	ld hl, TitleSuicuneGFX
	ld de, VTiles1
	call Decompress


; Clear screen palettes
	hlbgcoord 0, 0
	ld bc, 20 bgrows
	xor a
	call ByteFill


; Fill tile palettes:

; BG Map 1:

; line 0 (copyright)
	hlbgcoord 0, 0, VBGMap1
	ld bc, 1 bgrows
	ld a, 7 ; palette
	call ByteFill


; BG Map 0:

; Apply logo gradient:

; lines 3-4
	hlbgcoord 0, 3
	ld bc, 2 bgrows
	ld a, 2
	call ByteFill
; line 5
	hlbgcoord 0, 5
	ld bc, 1 bgrows
	ld a, 3
	call ByteFill
; line 6
	hlbgcoord 0, 6
	ld bc, 1 bgrows
	ld a, 4
	call ByteFill
; line 7
	hlbgcoord 0, 7
	ld bc, 1 bgrows
	ld a, 5
	call ByteFill
; lines 8-9
	hlbgcoord 0, 8
	ld bc, 2 bgrows
	ld a, 6
	call ByteFill


; 'CRYSTAL VERSION'
	hlbgcoord 5, 9
	ld bc, NAME_LENGTH ; length of version text
	ld a, 1
	call ByteFill

; Suicune gfx
	hlbgcoord 0, 12
	ld bc, 6 bgrows ; the rest of the screen
	ld a, 8
	call ByteFill


; Back to VRAM bank 0
	ld a, $0
	ld [rVBK], a


; Decompress logo
	ld hl, TitleLogoGFX
	ld de, VTiles1
	call Decompress

; Decompress background crystal
	ld hl, TitleCrystalGFX
	ld de, VTiles0
	call Decompress


; Clear screen tiles
	hlbgcoord 0, 0
	ld bc, 64 bgrows
	ld a, " "
	call ByteFill

; Draw Pokemon logo
	hlcoord 0, 3
	lb bc, 7, 20
	ld d, $80
	ld e, $14
	call DrawTitleGraphic

; Draw copyright text
	hlbgcoord 3, 0, VBGMap1
	lb bc, 1, 13
	ld d, $c
	ld e, $10
	call DrawTitleGraphic

; Initialize running Suicune?
	ld d, $0
	call LoadSuicuneFrame

; Initialize background crystal
	call InitializeBackground

; Save WRAM bank
	ld a, [rSVBK]
	push af
; WRAM bank 5
	ld a, 5
	ld [rSVBK], a

; Update palette colors
	ld hl, TitleScreenPalettes
	ld de, UnknBGPals
	ld bc, 4 * 32
	call CopyBytes

	ld hl, TitleScreenPalettes
	ld de, BGPals
	ld bc, 4 * 32
	call CopyBytes

; Restore WRAM bank
	pop af
	ld [rSVBK], a


; LY/SCX trickery starts here

	ld a, [rSVBK]
	push af
	ld a, 5 ; BANK(LYOverrides)
	ld [rSVBK], a

; Make alternating lines come in from opposite sides

; ( This part is actually totally pointless, you can't
;   see anything until these values are overwritten!  )

	ld b, 80 / 2 ; alternate for 80 lines
	ld hl, LYOverrides
.loop
; $00 is the middle position
	ld [hl], +112 ; coming from the left
	inc hl
	ld [hl], -112 ; coming from the right
	inc hl
	dec b
	jr nz, .loop

; Make sure the rest of the buffer is empty
	ld hl, LYOverrides + 80
	xor a
	ld bc, LYOverridesEnd - (LYOverrides + 80)
	call ByteFill

; Let LCD Stat know we're messing around with SCX
	ld a, rSCX - $ff00
	ld [hLCDCPointer], a

	pop af
	ld [rSVBK], a


; Reset audio
	call ChannelsOff
	call EnableLCD

; Set sprite size to 8x16
	ld a, [rLCDC]
	set 2, a
	ld [rLCDC], a

	ld a, +112
	ld [hSCX], a
	ld a, 8
	ld [hSCY], a
	ld a, 7
	ld [hWX], a
	ld a, -112
	ld [hWY], a

	ld a, $1
	ld [hCGBPalUpdate], a

; Update BG Map 0 (bank 0)
	ld [hBGMapMode], a

	xor a
	ld [UnknBGPals + 2], a

; Play starting sound effect
	call SFXChannelsOff
	ld de, SFX_TITLE_SCREEN_ENTRANCE
	call PlaySFX

	ret
; 10eea7

SuicuneFrameIterator: ; 10eea7
	ld hl, UnknBGPals + 2
	ld a, [hl]
	ld c, a
	inc [hl]

; Only do this once every eight frames
	and (1 << 3) - 1
	ret nz

	ld a, c
	and 3 << 3
	sla a
	swap a
	ld e, a
	ld d, $0
	ld hl, .Frames
	add hl, de
	ld d, [hl]
	xor a
	ld [hBGMapMode], a
	call LoadSuicuneFrame
	ld a, $1
	ld [hBGMapMode], a
	ld a, $3
	ld [hBGMapThird], a
	ret
; 10eece

.Frames: ; 10eece
	db $80 ; VTiles4 tile $00
	db $88 ; VTiles4 tile $08
	db $00 ; VTiles5 tile $00
	db $08 ; VTiles5 tile $08
; 10eed2


LoadSuicuneFrame: ; 10eed2
	hlcoord 6, 12
	ld b, 6
.bgrows
	ld c, 8
.col
	ld a, d
	ld [hli], a
	inc d
	dec c
	jr nz, .col
	ld a, SCREEN_WIDTH - 8
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	ld a, 8
	add d
	ld d, a
	dec b
	jr nz, .bgrows
	ret
; 10eeef

DrawTitleGraphic: ; 10eeef
; input:
;   hl: draw location
;   b: height
;   c: width
;   d: tile to start drawing from
;   e: number of tiles to advance for each bgrows
.bgrows
	push de
	push bc
	push hl
.col
	ld a, d
	ld [hli], a
	inc d
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	pop de
	ld a, e
	add d
	ld d, a
	dec b
	jr nz, .bgrows
	ret
; 10ef06

InitializeBackground: ; 10ef06
	ld hl, Sprites
	ld d, -$22
	ld e, $0
	ld c, 5
.loop
	push bc
	call .InitColumn
	pop bc
	ld a, $10
	add d
	ld d, a
	dec c
	jr nz, .loop
	ret
; 10ef1c

.InitColumn: ; 10ef1c
	ld c, $6
	ld b, $40
.loop2
	ld a, d
	ld [hli], a
	ld a, b
	ld [hli], a
	add $8
	ld b, a
	ld a, e
	ld [hli], a
	inc e
	inc e
	ld a, $80
	ld [hli], a
	dec c
	jr nz, .loop2
	ret
; 10ef32


AnimateTitleCrystal: ; 10ef32
; Move the title screen crystal downward until it's fully visible

; Stop at y=6
; y is really from the bottom of the sprite, which is two tiles high
	ld hl, Sprites
	ld a, [hl]
	cp 6 + $10
	ret z

; Move all 30 parts of the crystal down by 2
	ld c, 30
.loop
	ld a, [hl]
	add 2
	ld [hli], a
	inc hl
	inc hl
	inc hl
	dec c
	jr nz, .loop

	ret
; 10ef46

TitleSuicuneGFX: ; 10ef46
INCBIN "gfx/title/suicune.w128.2bpp.lz"
; 10f326

TitleLogoGFX: ; 10f326
INCBIN "gfx/title/logo.w160.t4.2bpp.lz"
; 10fcee

TitleCrystalGFX: ; 10fcee
INCBIN "gfx/title/crystal.w48.interleave.2bpp.lz"
; 10fede

TitleScreenPalettes:
; BG
	RGB 00, 00, 00
	RGB 19, 00, 00
	RGB 15, 08, 31
	RGB 15, 08, 31

	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 15, 16, 31
	RGB 31, 01, 13

	RGB 00, 00, 00
	RGB 07, 07, 07
	RGB 31, 31, 31
	RGB 02, 03, 30

	RGB 00, 00, 00
	RGB 13, 13, 13
	RGB 31, 31, 18
	RGB 02, 03, 30

	RGB 00, 00, 00
	RGB 19, 19, 19
	RGB 29, 28, 12
	RGB 02, 03, 30

	RGB 00, 00, 00
	RGB 25, 25, 25
	RGB 28, 25, 06
	RGB 02, 03, 30

	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 26, 21, 00
	RGB 02, 03, 30

	RGB 00, 00, 00
	RGB 11, 11, 19
	RGB 31, 31, 31
	RGB 00, 00, 00

; OBJ
	RGB 00, 00, 00
	RGB 10, 00, 15
	RGB 17, 05, 22
	RGB 19, 09, 31

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
