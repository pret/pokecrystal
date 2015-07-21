_TitleScreen: ; 10ed67

	call WhiteBGMap
	call ClearSprites
	call ClearTileMap
	
; Turn BG Map update off
	xor a
	ld [hBGMapMode], a
	
; Reset timing variables
	ld hl, wcf63
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
	ld hl, VBGMap0
	ld bc, $0280
	xor a
	call ByteFill
	

; Fill tile palettes:

; BG Map 1:

; line 0 (copyright)
	ld hl, VBGMap1
	ld bc, $0020 ; one row
	ld a, 7 ; palette
	call ByteFill


; BG Map 0:

; Apply logo gradient:

; lines 3-4
	ld hl, $9860 ; (0,3)
	ld bc, $0040 ; 2 rows
	ld a, 2
	call ByteFill
; line 5
	ld hl, $98a0 ; (0,5)
	ld bc, $0020 ; 1 row
	ld a, 3
	call ByteFill
; line 6
	ld hl, $98c0 ; (0,6)
	ld bc, $0020 ; 1 row
	ld a, 4
	call ByteFill
; line 7
	ld hl, $98e0 ; (0,7)
	ld bc, $0020 ; 1 row
	ld a, 5
	call ByteFill
; lines 8-9
	ld hl, $9900 ; (0,8)
	ld bc, $0040 ; 2 rows
	ld a, 6
	call ByteFill
	

; 'CRYSTAL VERSION'
	ld hl, $9925 ; (5,9)
	ld bc, $000b ; length of version text
	ld a, 1
	call ByteFill
	
; Suicune gfx
	ld hl, $9980 ; (0,12)
	ld bc, $00c0 ; the rest of the screen
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
	ld hl, VBGMap0
	ld bc, $0800
	ld a, $7f
	call ByteFill
	
; Draw Pokemon logo
	hlcoord 0, 3
	lb bc, 7, 20
	ld d, $80
	ld e, $14
	call DrawTitleGraphic
	
; Draw copyright text
	ld hl, $9c03 ; BGMap1(3,0)
	lb bc, 1, 13
	ld d, $c
	ld e, $10
	call DrawTitleGraphic
	
; Initialize running Suicune?
	ld d, $0
	call Function10eed2
	
; Initialize background crystal
	call Function10ef06
	
; Save WRAM bank
	ld a, [rSVBK]
	push af
; WRAM bank 5
	ld a, 5
	ld [rSVBK], a
	
; Update palette colors
	ld hl, TitleScreenPalettes
	ld de, Unkn1Pals
	ld bc, $0080
	call CopyBytes
	
	ld hl, TitleScreenPalettes
	ld de, BGPals
	ld bc, $0080
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
	ld a, rSCX - rJOYP
	ld [hLCDStatCustom], a
	
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
	ld [DefaultFlypoint], a
	
; Play starting sound effect
	call SFXChannelsOff
	ld de, SFX_TITLE_SCREEN_ENTRANCE
	call PlaySFX
	
	ret
; 10eea7

Function10eea7: ; 10eea7
	ld hl, DefaultFlypoint
	ld a, [hl]
	ld c, a
	inc [hl]
	and $7
	ret nz
	ld a, c
	and $18
	sla a
	swap a
	ld e, a
	ld d, $0
	ld hl, Unknown_10eece
	add hl, de
	ld d, [hl]
	xor a
	ld [hBGMapMode], a
	call Function10eed2
	ld a, $1
	ld [hBGMapMode], a
	ld a, $3
	ld [hBGMapThird], a
	ret
; 10eece

Unknown_10eece: ; 10eece
	db $80, $88, $00, $08
; 10eed2


Function10eed2: ; 10eed2
	hlcoord 6, 12
	ld b, $6
.asm_10eed7
	ld c, $8
.asm_10eed9
	ld a, d
	ld [hli], a
	inc d
	dec c
	jr nz, .asm_10eed9
	ld a, $c
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, $8
	add d
	ld d, a
	dec b
	jr nz, .asm_10eed7
	ret
; 10eeef

DrawTitleGraphic: ; 10eeef
; input:
;   hl: draw location
;   b: height
;   c: width
;   d: tile to start drawing from
;   e: number of tiles to advance for each row
.asm_10eeef
	push de
	push bc
	push hl
.asm_10eef2
	ld a, d
	ld [hli], a
	inc d
	dec c
	jr nz, .asm_10eef2
	pop hl
	ld bc, $0014
	add hl, bc
	pop bc
	pop de
	ld a, e
	add d
	ld d, a
	dec b
	jr nz, .asm_10eeef
	ret
; 10ef06

Function10ef06: ; 10ef06
	ld hl, Sprites
	ld d, $de
	ld e, $0
	ld c, $5
.asm_10ef0f
	push bc
	call Function10ef1c
	pop bc
	ld a, $10
	add d
	ld d, a
	dec c
	jr nz, .asm_10ef0f
	ret
; 10ef1c

Function10ef1c: ; 10ef1c
	ld c, $6
	ld b, $40
.asm_10ef20
	ld a, d
	ld [hli], a
	ld a, b
	ld [hli], a
	add $8
	ld b, a
	ld a, e
	ld [hli], a
rept 2
	inc e
endr
	ld a, $80
	ld [hli], a
	dec c
	jr nz, .asm_10ef20
	ret
; 10ef32


AnimateTitleCrystal: ; 10ef32
; Move the title screen crystal downward until it's fully visible

; Stop at y=6
; y is really from the bottom of the sprite, which is two tiles high
	ld hl, Sprites
	ld a, [hl]
	cp 6 + 16
	ret z
	
; Move all 30 parts of the crystal down by 2
	ld c, 30
.loop
	ld a, [hl]
	add 2
	ld [hli], a
rept 3
	inc hl
endr
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
