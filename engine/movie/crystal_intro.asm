Copyright_GFPresents:
	ld de, MUSIC_NONE
	call PlayMusic
	call ClearBGPalettes
	call ClearTileMap
	ld a, HIGH(vBGMap0)
	ldh [hBGMapAddress + 1], a
	xor a ; LOW(vBGMap0)
	ldh [hBGMapAddress], a
	ldh [hJoyDown], a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, $90
	ldh [hWY], a
	call WaitBGMap
	ld b, SCGB_GAMEFREAK_LOGO
	call GetSGBLayout
	call SetPalettes
	ld c, 10
	call DelayFrames
	callfar Copyright
	call WaitBGMap
	ld c, 100
	call DelayFrames
	call ClearTileMap
	farcall GBCOnlyScreen
	call .GetGFLogoGFX
.joy_loop
	call JoyTextDelay
	ldh a, [hJoyLast]
	and BUTTONS
	jr nz, .pressed_button
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .finish
	call PlaceGameFreakPresents
	farcall PlaySpriteAnimations
	call DelayFrame
	jr .joy_loop

.pressed_button
	call .StopGamefreakAnim
	scf
	ret

.finish
	call .StopGamefreakAnim
	and a
	ret

.GetGFLogoGFX:
	ld de, GameFreakLogo
	ld hl, vTiles2
	lb bc, BANK(GameFreakLogo), 28
	call Get1bpp

	ldh a, [rSVBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rSVBK], a

	ld hl, IntroLogoGFX
	ld de, wDecompressScratch
	ld a, BANK(IntroLogoGFX)
	call FarDecompress

	ld hl, vTiles0
	ld de, wDecompressScratch
	lb bc, 1, 8 tiles
	call Request2bpp

	ld hl, vTiles1
	ld de, wDecompressScratch + $80 tiles
	lb bc, 1, 8 tiles
	call Request2bpp

	pop af
	ldh [rSVBK], a

	farcall ClearSpriteAnims
	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_GAMEFREAK_LOGO
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], $a0
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $60
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $30
	xor a
	ld [wJumptableIndex], a
	ld [wIntroSceneFrameCounter], a
	ld [wIntroSceneTimer], a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, $1
	ldh [hBGMapMode], a
	ld a, $90
	ldh [hWY], a
	lb de, %11100100, %11100100
	call DmgToCgbObjPals
	ret

.StopGamefreakAnim:
	farcall ClearSpriteAnims
	call ClearTileMap
	call ClearSprites
	ld c, 16
	call DelayFrames
	ret

PlaceGameFreakPresents:
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, .dw
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.dw
	dw PlaceGameFreakPresents_0
	dw PlaceGameFreakPresents_1
	dw PlaceGameFreakPresents_2
	dw PlaceGameFreakPresents_3

PlaceGameFreakPresents_AdvanceIndex:
	ld hl, wJumptableIndex
	inc [hl]
	ret

PlaceGameFreakPresents_0:
	ret

PlaceGameFreakPresents_1:
	ld hl, wIntroSceneTimer
	ld a, [hl]
	cp $20
	jr nc, .PlaceGameFreak
	inc [hl]
	ret

.PlaceGameFreak:
	ld [hl], 0
	ld hl, .GAME_FREAK
	decoord 5, 10
	ld bc, .end - .GAME_FREAK
	call CopyBytes
	call PlaceGameFreakPresents_AdvanceIndex
	ld de, SFX_GAME_FREAK_PRESENTS
	call PlaySFX
	ret

.GAME_FREAK:
	;  G  A  M  E   _  F  R  E  A  K
	db 0, 1, 2, 3, 13, 4, 5, 3, 1, 6
.end
	db "@"

PlaceGameFreakPresents_2:
	ld hl, wIntroSceneTimer
	ld a, [hl]
	cp $40
	jr nc, .place_presents
	inc [hl]
	ret

.place_presents
	ld [hl], 0
	ld hl, .presents
	decoord 7, 11
	ld bc, .end - .presents
	call CopyBytes
	call PlaceGameFreakPresents_AdvanceIndex
	ret

.presents
	db 7, 8, 9, 10, 11, 12
.end
	db "@"

PlaceGameFreakPresents_3:
	ld hl, wIntroSceneTimer
	ld a, [hl]
	cp $80
	jr nc, .finish
	inc [hl]
	ret

.finish
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

GameFreakLogoJumper:
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, GameFreakLogoScenes
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

GameFreakLogoScenes:
	dw GameFreakLogoScene1
	dw GameFreakLogoScene2
	dw GameFreakLogoScene3
	dw GameFreakLogoScene4
	dw GameFreakLogoScene5

GameFreakLogoScene1:
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ret

GameFreakLogoScene2:
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_e4747
	ld d, a
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	and %111111
	cp %100000
	jr nc, .asm_e4723
	add %100000
.asm_e4723
	ld e, a
	farcall BattleAnim_Sine_e
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], e
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	dec [hl]
	and $1f
	ret nz
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	sub $30
	ld [hl], a
	ld de, SFX_DITTO_BOUNCE
	call PlaySFX
	ret

.asm_e4747
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $0
	ld de, SFX_DITTO_POP_UP
	call PlaySFX
	ret

GameFreakLogoScene3:
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	cp $20
	jr nc, .asm_e4764
	inc [hl]
	ret

.asm_e4764
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $0
	ld de, SFX_DITTO_TRANSFORM
	call PlaySFX
	ret

GameFreakLogoScene4:
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	cp $40
	jr z, .asm_e47a3
	inc [hl]
	srl a
	srl a
	ld e, a
	ld d, $0
	ld hl, GameFreakLogoPalettes
	add hl, de
	add hl, de
	ldh a, [rSVBK]
	push af
	ld a, BANK(wOBPals2)
	ldh [rSVBK], a
	ld a, [hli]
	ld [wOBPals2 + 12], a
	ld a, [hli]
	ld [wOBPals2 + 13], a
	pop af
	ldh [rSVBK], a
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

.asm_e47a3
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	call PlaceGameFreakPresents_AdvanceIndex
GameFreakLogoScene5:
	ret

GameFreakLogoPalettes:
INCLUDE "gfx/intro/gamefreak_logo.pal"

GameFreakLogo:
INCBIN "gfx/splash/logo1.1bpp"
INCBIN "gfx/splash/logo2.1bpp"

CrystalIntro:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wGBCPalettes)
	ldh [rSVBK], a
	ldh a, [hInMenu]
	push af
	ldh a, [hVBlank]
	push af
	call .InitRAMAddrs
.loop
	call JoyTextDelay
	ldh a, [hJoyLast]
	and BUTTONS
	jr nz, .ShutOffMusic
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done
	call IntroSceneJumper
	farcall PlaySpriteAnimations
	call DelayFrame
	jp .loop

.ShutOffMusic:
	ld de, MUSIC_NONE
	call PlayMusic

.done
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, $7
	ldh [hWX], a
	ld a, $90
	ldh [hWY], a
	pop af
	ldh [hVBlank], a
	pop af
	ldh [hInMenu], a
	pop af
	ldh [rSVBK], a
	ret

.InitRAMAddrs:
	xor a
	ldh [hVBlank], a
	ld a, $1
	ldh [hInMenu], a
	xor a
	ldh [hMapAnims], a
	ld [wJumptableIndex], a
	ret

IntroSceneJumper:
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, IntroScenes
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

IntroScenes:
	dw IntroScene28

NextIntroScene:
	ld hl, wJumptableIndex
	inc [hl]
	ret

IntroScene28:
; Cut out when the music ends, and lead into the title screen.
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	cp $18
	jr z, .clear
	cp $8
	ret nz

	ld de, SFX_INTRO_WHOOSH
	call PlaySFX
	ret

.clear
	call ClearBGPalettes
	ret

.done
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

Intro_Scene24_ApplyPaletteFade:
; load the (a)th palette from .FadePals to all wBGPals2
	ld hl, .FadePals
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a

	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals2)
	ldh [rSVBK], a
	ld de, wBGPals2
	ld b, 8 ; number of BG pals
.loop1
	push hl
	ld c, 1 palettes
.loop2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop2
	pop hl
	dec b
	jr nz, .loop1
	pop af
	ldh [rSVBK], a
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

.FadePals:
INCLUDE "gfx/intro/fade.pal"

CrystalIntro_InitUnownAnim:
	push de
	ld a, SPRITE_ANIM_INDEX_INTRO_UNOWN
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $8
	ld a, SPRITE_ANIM_FRAMESET_INTRO_UNOWN_4
	call ReinitSpriteAnimFrame
	pop de

	push de
	ld a, SPRITE_ANIM_INDEX_INTRO_UNOWN
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $18
	ld a, SPRITE_ANIM_FRAMESET_INTRO_UNOWN_3
	call ReinitSpriteAnimFrame
	pop de

	push de
	ld a, SPRITE_ANIM_INDEX_INTRO_UNOWN
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $28
	ld a, SPRITE_ANIM_FRAMESET_INTRO_UNOWN_1
	call ReinitSpriteAnimFrame
	pop de

	ld a, SPRITE_ANIM_INDEX_INTRO_UNOWN
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $38
	ld a, SPRITE_ANIM_FRAMESET_INTRO_UNOWN_2
	call ReinitSpriteAnimFrame
	ret

CrystalIntro_UnownFade:
	add a
	add a
	add a
	ld e, a
	ld d, $0
	ld hl, wBGPals2
	add hl, de
	inc hl
	inc hl
	ld a, [wIntroSceneTimer]
	and %111111
	cp %011111
	jr z, .okay
	jr c, .okay
	ld c, a
	ld a, %111111
	sub c
.okay

	ld c, a
	ld b, $0
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals2)
	ldh [rSVBK], a

	push hl
	push bc
	ld hl, wBGPals2
	ld bc, 8 palettes
	xor a
	call ByteFill
	pop bc
	pop hl

	push hl
	ld hl, .BWFade
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a

	push hl
	ld hl, .BlackLBlueFade
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a

	push hl
	ld hl, .BlackBlueFade
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a

	pop af
	ldh [rSVBK], a
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

.BWFade:
; Fade between black and white.
hue = 0
rept 32
	RGB hue, hue, hue
hue = hue + 1
endr

.BlackLBlueFade:
; Fade between black and light blue.
hue = 0
rept 32
	RGB 0, hue / 2, hue
hue = hue + 1
endr

.BlackBlueFade:
; Fade between black and blue.
hue = 0
rept 32
	RGB 0, 0, hue
hue = hue + 1
endr

Intro_Scene20_AppearUnown:
; Spawn the palette for the nth Unown
	and a
	jr nz, .load_pal_2

	ld hl, .pal1
	jr .got_pointer

.load_pal_2
	ld hl, .pal2

.got_pointer
	ld a, [wIntroSceneTimer]
	and $7
	add a
	add a
	add a
	ld c, a
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals2)
	ldh [rSVBK], a

	push bc
	ld de, wBGPals2

	ld a, c
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a

	ld bc, 1 palettes
	call CopyBytes
	pop bc

	ld de, wBGPals1
	ld a, c
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a

	ld bc, 1 palettes
	call CopyBytes

	pop af
	ldh [rSVBK], a
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

.pal1
	RGB 24, 12, 09
	RGB 31, 31, 31
	RGB 12, 00, 31
	RGB 00, 00, 00

.pal2
	RGB 24, 12, 09
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31

Intro_FadeUnownWordPals:
	add a
	add a
	add a
	ld e, a
	ld d, $0
	ld hl, wBGPals2
	add hl, de
rept 4
	inc hl
endr
	ld a, [wIntroSceneTimer]
	add a
	ld c, a
	ld b, $0

	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals2)
	ldh [rSVBK], a

	push hl
	ld hl, .FastFadePalettes
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a

	push hl
	ld hl, .SlowFadePalettes
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a

	pop af
	ldh [rSVBK], a
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

.FastFadePalettes:
hue = 31
rept 8
	RGB hue, hue, hue
hue = hue + -1
	RGB hue, hue, hue
hue = hue + -2
endr

.SlowFadePalettes:
hue = 31
rept 16
	RGB hue, hue, hue
hue = hue + -1
endr

Intro_LoadTilemap:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rSVBK], a

	ld hl, wDecompressScratch
	decoord 0, 0
	ld b, SCREEN_HEIGHT
.row
	ld c, SCREEN_WIDTH
.col
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .col
	ld a, BG_MAP_WIDTH - SCREEN_WIDTH
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	dec b
	jr nz, .row

	pop af
	ldh [rSVBK], a
	ret

Intro_Scene16_AnimateSuicune:
	ld a, [wIntroSceneFrameCounter]
	and $3
	jr z, Intro_ColoredSuicuneFrameSwap
	cp $3
	jr z, .PrepareForSuicuneSwap
	ret

.PrepareForSuicuneSwap:
	xor a
	ldh [hBGMapMode], a
	ret

Intro_ColoredSuicuneFrameSwap:
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
.loop
	ld a, [hl]
	and a
	jr z, .skip
	cp $80
	jr nc, .skip
	xor $8
	ld [hl], a
.skip
	inc hl
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ld a, $1
	ldh [hBGMapMode], a
	ret

Intro_RustleGrass:
	ld a, [wIntroSceneFrameCounter]
	cp 36
	ret nc
	and $c
	srl a
	ld e, a
	ld d, $0
	ld hl, .RustlingGrassPointers
	add hl, de
	ld a, [hli]
	ld [wRequested2bppSource], a
	ld a, [hli]
	ld [wRequested2bppSource + 1], a
	ld a, LOW(vTiles2 tile $09)
	ld [wRequested2bppDest], a
	ld a, HIGH(vTiles2 tile $09)
	ld [wRequested2bppDest + 1], a
	ld a, 4
	ld [wRequested2bppSize], a
	ret

.RustlingGrassPointers:
	dw IntroGrass1GFX
	dw IntroGrass2GFX
	dw IntroGrass3GFX
	dw IntroGrass2GFX

Intro_SetCGBPalUpdate:
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

Intro_ClearBGPals:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals2)
	ldh [rSVBK], a

	ld hl, wBGPals2
	ld bc, 16 palettes
	xor a
	call ByteFill

	pop af
	ldh [rSVBK], a
	ld a, $1
	ldh [hCGBPalUpdate], a
	call DelayFrame
	call DelayFrame
	ret

Intro_DecompressRequest2bpp_128Tiles:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rSVBK], a

	push de
	ld de, wDecompressScratch
	call Decompress
	pop hl

	ld de, wDecompressScratch
	lb bc, $01, $80
	call Request2bpp

	pop af
	ldh [rSVBK], a
	ret

Intro_DecompressRequest2bpp_255Tiles:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rSVBK], a

	push de
	ld de, wDecompressScratch
	call Decompress
	pop hl

	ld de, wDecompressScratch
	lb bc, $01, $ff
	call Request2bpp

	pop af
	ldh [rSVBK], a
	ret

Intro_DecompressRequest2bpp_64Tiles:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rSVBK], a

	push de
	ld de, wDecompressScratch
	call Decompress
	pop hl

	ld de, wDecompressScratch
	lb bc, $01, $40
	call Request2bpp

	pop af
	ldh [rSVBK], a
	ret

Intro_ResetLYOverrides:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wLYOverrides)
	ldh [rSVBK], a

	ld hl, wLYOverrides
	ld bc, wLYOverridesEnd - wLYOverrides
	xor a
	call ByteFill

	pop af
	ldh [rSVBK], a
	ld a, LOW(rSCX)
	ldh [hLCDCPointer], a
	ret

Intro_PerspectiveScrollBG:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wLYOverrides)
	ldh [rSVBK], a
	; Scroll the grass every frame.
	; Scroll the trees every other frame and at half speed.
	; This creates an illusion of perspective.
	ld a, [wIntroSceneFrameCounter]
	and $1
	jr z, .skip
	; trees in the back
	ld hl, wLYOverrides
	ld a, [hl]
	inc a
	ld bc, $5f
	call ByteFill
.skip
	; grass in the front
	ld hl, wLYOverrides + $5f
	ld a, [hl]
	inc a
	inc a
	ld bc, $31
	call ByteFill
	ld a, [wLYOverrides + 0]
	ldh [hSCX], a
	pop af
	ldh [rSVBK], a
	ret

IntroSuicuneRunGFX:
INCBIN "gfx/intro/suicune_run.2bpp.lz"

IntroPichuWooperGFX:
INCBIN "gfx/intro/pichu_wooper.2bpp.lz"

IntroBackgroundGFX:
INCBIN "gfx/intro/background.2bpp.lz"

IntroBackgroundTilemap:
INCBIN "gfx/intro/background.tilemap.lz"

IntroBackgroundAttrmap:
INCBIN "gfx/intro/background.attrmap.lz"

IntroBackgroundPalette:
INCLUDE "gfx/intro/background.pal"

IntroUnownsGFX:
INCBIN "gfx/intro/unowns.2bpp.lz"

IntroPulseGFX:
INCBIN "gfx/intro/pulse.2bpp.lz"

IntroUnownATilemap:
INCBIN "gfx/intro/unown_a.tilemap.lz"

IntroUnownAAttrmap:
INCBIN "gfx/intro/unown_a.attrmap.lz"

IntroUnownHITilemap:
INCBIN "gfx/intro/unown_hi.tilemap.lz"

IntroUnownHIAttrmap:
INCBIN "gfx/intro/unown_hi.attrmap.lz"

IntroUnownsTilemap:
INCBIN "gfx/intro/unowns.tilemap.lz"

IntroUnownsAttrmap:
INCBIN "gfx/intro/unowns.attrmap.lz"

IntroUnownsPalette:
INCLUDE "gfx/intro/unowns.pal"

IntroCrystalUnownsGFX:
INCBIN "gfx/intro/crystal_unowns.2bpp.lz"

IntroCrystalUnownsTilemap:
INCBIN "gfx/intro/crystal_unowns.tilemap.lz"

IntroCrystalUnownsAttrmap:
INCBIN "gfx/intro/crystal_unowns.attrmap.lz"

IntroCrystalUnownsPalette:
INCLUDE "gfx/intro/crystal_unowns.pal"

IntroSuicuneCloseGFX:
INCBIN "gfx/intro/suicune_close.2bpp.lz"

IntroSuicuneCloseTilemap:
INCBIN "gfx/intro/suicune_close.tilemap.lz"

IntroSuicuneCloseAttrmap:
INCBIN "gfx/intro/suicune_close.attrmap.lz"

IntroSuicuneClosePalette:
INCLUDE "gfx/intro/suicune_close.pal"

IntroSuicuneJumpGFX:
INCBIN "gfx/intro/suicune_jump.2bpp.lz"

IntroSuicuneBackGFX:
INCBIN "gfx/intro/suicune_back.2bpp.lz"

IntroSuicuneJumpTilemap:
INCBIN "gfx/intro/suicune_jump.tilemap.lz"

IntroSuicuneJumpAttrmap:
INCBIN "gfx/intro/suicune_jump.attrmap.lz"

IntroSuicuneBackTilemap:
INCBIN "gfx/intro/suicune_back.tilemap.lz"

IntroSuicuneBackAttrmap:
INCBIN "gfx/intro/suicune_back.attrmap.lz"

IntroSuicunePalette:
INCLUDE "gfx/intro/suicune.pal"

IntroUnownBackGFX:
INCBIN "gfx/intro/unown_back.2bpp.lz"

IntroGrass1GFX:
INCBIN "gfx/intro/grass1.2bpp"
IntroGrass2GFX:
INCBIN "gfx/intro/grass2.2bpp"
IntroGrass3GFX:
INCBIN "gfx/intro/grass3.2bpp"
IntroGrass4GFX:
INCBIN "gfx/intro/grass4.2bpp"
