Copyright_GFPresents: ; e4579
	ld de, MUSIC_NONE
	call PlayMusic
	call ClearBGPalettes
	call ClearTileMap
	ld a, HIGH(vBGMap0)
	ld [hBGMapAddress + 1], a
	xor a ; LOW(vBGMap0)
	ld [hBGMapAddress], a
	ld [hJoyDown], a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $90
	ld [hWY], a
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
	ld a, [hJoyLast]
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
; e45e8

.GetGFLogoGFX: ; e45e8
	ld de, GameFreakLogo
	ld hl, vTiles2
	lb bc, BANK(GameFreakLogo), $1c
	call Get1bpp

	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a

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
	ld [rSVBK], a

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
	ld [hSCX], a
	ld [hSCY], a
	ld a, $1
	ld [hBGMapMode], a
	ld a, $90
	ld [hWY], a
	lb de, %11100100, %11100100
	call DmgToCgbObjPals
	ret
; e465e

.StopGamefreakAnim: ; e465e
	farcall ClearSpriteAnims
	call ClearTileMap
	call ClearSprites
	ld c, 16
	call DelayFrames
	ret
; e4670

PlaceGameFreakPresents: ; e4670
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
; e467f

.dw ; e467f
	dw PlaceGameFreakPresents_0
	dw PlaceGameFreakPresents_1
	dw PlaceGameFreakPresents_2
	dw PlaceGameFreakPresents_3
; e4687

PlaceGameFreakPresents_AdvanceIndex: ; e4687
	ld hl, wJumptableIndex
	inc [hl]
	ret
; e468c

PlaceGameFreakPresents_0: ; e468c
	ret
; e468d

PlaceGameFreakPresents_1: ; e468d
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
; e46af

.GAME_FREAK:
	;  G  A  M  E   _  F  R  E  A  K
	db 0, 1, 2, 3, 13, 4, 5, 3, 1, 6
.end
	db "@"
; e46ba

PlaceGameFreakPresents_2: ; e46ba
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
; e46d6

.presents
	db 7, 8, 9, 10, 11, 12
.end
	db "@"
; e46dd

PlaceGameFreakPresents_3: ; e46dd
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
; e46ed


GameFreakLogoJumper: ; e46ed (39:46ed)
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

GameFreakLogoScenes: ; e46fd (39:46fd)
	dw GameFreakLogoScene1
	dw GameFreakLogoScene2
	dw GameFreakLogoScene3
	dw GameFreakLogoScene4
	dw GameFreakLogoScene5

GameFreakLogoScene1: ; e4707 (39:4707)
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ret

GameFreakLogoScene2: ; e470d (39:470d)
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

GameFreakLogoScene3: ; e4759 (39:4759)
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

GameFreakLogoScene4: ; e4776 (39:4776)
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
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld a, [hli]
	ld [wOBPals2 + 12], a
	ld a, [hli]
	ld [wOBPals2 + 13], a
	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	ret

.asm_e47a3
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	call PlaceGameFreakPresents_AdvanceIndex
GameFreakLogoScene5: ; e47ab (39:47ab)
	ret
; e47ac (39:47ac)

GameFreakLogoPalettes: ; e47ac
INCLUDE "gfx/intro/gamefreak_logo.pal"
; e47cc

GameFreakLogo: ; e47cc
INCBIN "gfx/splash/logo1.1bpp"
INCBIN "gfx/splash/logo2.1bpp"
; e48ac

CrystalIntro: ; e48ac
	ld a, [rSVBK]
	push af
	ld a, 5
	ld [rSVBK], a
	ld a, [hInMenu]
	push af
	ld a, [hVBlank]
	push af
	call .InitRAMAddrs
.loop ; e48bc
	call JoyTextDelay
	ld a, [hJoyLast]
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
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	pop af
	ld [hVBlank], a
	pop af
	ld [hInMenu], a
	pop af
	ld [rSVBK], a
	ret
; e4901

.InitRAMAddrs: ; e4901
	xor a
	ld [hVBlank], a
	ld a, $1
	ld [hInMenu], a
	xor a
	ld [hMapAnims], a
	ld [wJumptableIndex], a
	ret
; e490f

IntroSceneJumper: ; e490f
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
; e491e

IntroScenes: ; e491e (39:491e)
	dw IntroScene1
	dw IntroScene2
	dw IntroScene3
	dw IntroScene4
	dw IntroScene5
	dw IntroScene6
	dw IntroScene7
	dw IntroScene8
	dw IntroScene9
	dw IntroScene10
	dw IntroScene11
	dw IntroScene12
	dw IntroScene13
	dw IntroScene14
	dw IntroScene15
	dw IntroScene16
	dw IntroScene17
	dw IntroScene18
	dw IntroScene19
	dw IntroScene20
	dw IntroScene21
	dw IntroScene22
	dw IntroScene23
	dw IntroScene24
	dw IntroScene25
	dw IntroScene26
	dw IntroScene27
	dw IntroScene28

NextIntroScene: ; e4956 (39:4956)
	ld hl, wJumptableIndex
	inc [hl]
	ret

IntroScene1: ; e495b (39:495b)
; Setup the next scene.
	call Intro_ClearBGPals
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap001
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, $0
	ld [rVBK], a
	ld hl, IntroUnownsGFX
	ld de, vTiles2 tile $00
	call Intro_DecompressRequest2bpp_128Tiles
	ld hl, IntroPulseGFX
	ld de, vTiles0 tile $00
	call Intro_DecompressRequest2bpp_128Tiles
	ld hl, IntroTilemap002
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_365ad
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes
	ld hl, Palette_365ad
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes
	pop af
	ld [rSVBK], a
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	farcall ClearSpriteAnims
	call Intro_SetCGBPalUpdate
	xor a
	ld [wIntroSceneFrameCounter], a
	ld [wIntroSceneTimer], a
	call NextIntroScene
	ret

IntroScene2: ; e49d6 (39:49d6)
; First Unown (A) fades in, pulses, then fades out.
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	inc [hl]
	cp $80
	jr nc, .endscene
	cp $60
	jr nz, .DontPlaySound
	push af
	depixel 11, 11
	call CrystalIntro_InitUnownAnim
	ld de, SFX_INTRO_UNOWN_1
	call PlaySFX
	pop af
.DontPlaySound:
	ld [wIntroSceneTimer], a
	xor a
	call CrystalIntro_UnownFade
	ret
.endscene
	call NextIntroScene
	ret

IntroScene3: ; e49fd (39:49fd)
; More setup. Transition to the outdoor scene.
	call Intro_ClearBGPals
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap003
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, $0
	ld [rVBK], a
	ld hl, IntroBackgroundGFX
	ld de, vTiles2 tile $00
	call Intro_DecompressRequest2bpp_128Tiles
	ld hl, IntroTilemap004
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_e5edd
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes
	ld hl, Palette_e5edd
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes
	pop af
	ld [rSVBK], a
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	call Intro_ResetLYOverrides
	call Intro_SetCGBPalUpdate
	xor a
	ld [wIntroSceneFrameCounter], a
	call NextIntroScene
	ret

IntroScene4: ; e4a69 (39:4a69)
; Scroll the outdoor panorama for a bit.
	call Intro_PerspectiveScrollBG
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	cp $80
	jr z, .endscene
	inc [hl]
	ret

.endscene
	call NextIntroScene
	ret

IntroScene5: ; e4a7a (39:4a7a)
; Go back to the Unown.
	call Intro_ClearBGPals
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld [hLCDCPointer], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap005
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, $0
	ld [rVBK], a
	ld hl, IntroUnownsGFX
	ld de, vTiles2 tile $00
	call Intro_DecompressRequest2bpp_128Tiles
	ld hl, IntroPulseGFX
	ld de, vTiles0 tile $00
	call Intro_DecompressRequest2bpp_128Tiles
	ld hl, IntroTilemap006
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_365ad
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes
	ld hl, Palette_365ad
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes
	pop af
	ld [rSVBK], a
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	farcall ClearSpriteAnims
	call Intro_SetCGBPalUpdate
	xor a
	ld [wIntroSceneFrameCounter], a
	ld [wIntroSceneTimer], a
	call NextIntroScene
	ret

IntroScene6: ; e4af7 (39:4af7)
; Two more Unown (I, H) fade in.
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	inc [hl]
	cp $80
	jr nc, .endscene
	cp $60
	jr z, .SecondUnown
	cp $40
	jr nc, .StopUnown
	cp $20
	jr z, .FirstUnown
	jr .NoUnown

.FirstUnown:
	push af
	depixel 7, 15
	call CrystalIntro_InitUnownAnim
	ld de, SFX_INTRO_UNOWN_2
	call PlaySFX
	pop af
.NoUnown:
	ld [wIntroSceneTimer], a
	xor a
	call CrystalIntro_UnownFade
	ret

.SecondUnown:
	push af
	depixel 14, 6
	call CrystalIntro_InitUnownAnim
	ld de, SFX_INTRO_UNOWN_1
	call PlaySFX
	pop af
.StopUnown:
	ld [wIntroSceneTimer], a
	ld a, $1
	call CrystalIntro_UnownFade
	ret

.endscene
	call NextIntroScene
	ret

IntroScene7: ; e4b3f (39:4b3f)
; Back to the outdoor scene.
	call Intro_ClearBGPals
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a

	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap003
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles

	ld hl, IntroPichuWooperGFX
	ld de, vTiles0 tile $00
	call Intro_DecompressRequest2bpp_128Tiles

	ld a, $0
	ld [rVBK], a
	ld hl, IntroSuicuneRunGFX
	ld de, vTiles0 tile $00
	call Intro_DecompressRequest2bpp_255Tiles

	ld hl, IntroBackgroundGFX
	ld de, vTiles2 tile $00
	call Intro_DecompressRequest2bpp_128Tiles

	ld hl, IntroTilemap004
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles

	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a

	ld hl, Palette_e5edd
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes

	ld hl, Palette_e5edd
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes

	pop af
	ld [rSVBK], a

	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	call Intro_ResetLYOverrides
	farcall ClearSpriteAnims
	depixel 13, 27, 4, 0
	ld a, SPRITE_ANIM_INDEX_INTRO_SUICUNE
	call _InitSpriteAnimStruct
	ld a, $f0
	ld [wGlobalAnimXOffset], a
	call Intro_SetCGBPalUpdate
	xor a
	ld [wIntroSceneFrameCounter], a
	ld [wIntroSceneTimer], a
	call NextIntroScene
	ret

IntroScene8: ; e4bd3 (39:4bd3)
; Scroll the scene, then show Suicune running across the screen.
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	inc [hl]
	cp $40
	jr z, .suicune_sound
	jr nc, .animate_suicune
	call Intro_PerspectiveScrollBG
	ret

.suicune_sound
	ld de, SFX_INTRO_SUICUNE_3
	call PlaySFX
.animate_suicune
	ld a, [wGlobalAnimXOffset]
	and a
	jr z, .finish
	sub $8
	ld [wGlobalAnimXOffset], a
	ret

.finish
	ld de, SFX_INTRO_SUICUNE_2
	call PlaySFX
	farcall DeinitializeAllSprites
	call NextIntroScene
	ret

IntroScene9: ; e4c04 (39:4c04)
; Set up the next scene (same bg).
	xor a
	ld [hLCDCPointer], a
	call ClearSprites
	hlcoord 0, 0, AttrMap
	; first 12 rows have palette 1
	ld bc, 12 * SCREEN_WIDTH
	ld a, $1
	call ByteFill
	; middle 3 rows have palette 2
	ld bc, 3 * SCREEN_WIDTH
	ld a, $2
	call ByteFill
	; last three rows have palette 3
	ld bc, 3 * SCREEN_WIDTH
	ld a, $3
	call ByteFill
	ld a, $2
	ld [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	call DelayFrame
	ld a, $c ; $980c
	ld [hBGMapAddress], a
	call DelayFrame
	call DelayFrame
	call DelayFrame
	xor a
	ld [hBGMapMode], a
	ld [hBGMapAddress], a
	ld [wGlobalAnimXOffset], a
	xor a
	ld [wIntroSceneFrameCounter], a
	call NextIntroScene
	ret

IntroScene10: ; e4c4f (39:4c4f)
; Wooper and Pichu enter.
	call Intro_RustleGrass
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	inc [hl]
	cp $c0
	jr z, .done
	cp $20
	jr z, .wooper
	cp $40
	jr z, .pichu
	ret

.pichu
	depixel 21, 16, 1, 0
	ld a, SPRITE_ANIM_INDEX_INTRO_PICHU
	call _InitSpriteAnimStruct
	ld de, SFX_INTRO_PICHU
	call PlaySFX
	ret

.wooper
	depixel 22, 6
	ld a, SPRITE_ANIM_INDEX_INTRO_WOOPER
	call _InitSpriteAnimStruct
	ld de, SFX_INTRO_PICHU
	call PlaySFX
	ret
.done
	call NextIntroScene
	ret

IntroScene11: ; e4c86 (39:4c86)
; Back to Unown again.
	call Intro_ClearBGPals
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld [hLCDCPointer], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap007
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, $0
	ld [rVBK], a
	ld hl, IntroUnownsGFX
	ld de, vTiles2 tile $00
	call Intro_DecompressRequest2bpp_128Tiles
	ld hl, IntroTilemap008
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_365ad
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes
	ld hl, Palette_365ad
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes
	pop af
	ld [rSVBK], a
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	farcall ClearSpriteAnims
	call Intro_SetCGBPalUpdate
	xor a
	ld [wIntroSceneFrameCounter], a
	ld [wIntroSceneTimer], a
	call NextIntroScene
	ret

IntroScene12: ; e4cfa (39:4cfa)
; Even more Unown.
	call .PlayUnownSound
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	inc [hl]
	cp $c0
	jr nc, .done
	cp $80
	jr nc, .second_half
; first half
	ld c, a
	and $1f
	sla a
	ld [wIntroSceneTimer], a
	ld a, c
	and $e0
	srl a
	swap a
	call CrystalIntro_UnownFade
	ret

.second_half
; double speed
	ld c, a
	and $f
	sla a
	sla a
	ld [wIntroSceneTimer], a
	ld a, c
	and $70
	or $40
	swap a
	call CrystalIntro_UnownFade
	ret

.done
	call NextIntroScene
	ret

.PlayUnownSound: ; e4d36 (39:4d36)
	ld a, [wIntroSceneFrameCounter]
	ld c, a
	ld hl, .UnownSounds
.loop
	ld a, [hli]
	cp -1
	ret z
	cp c
	jr z, .playsound
	inc hl
	inc hl
	jr .loop
.playsound
	ld a, [hli]
	ld d, [hl]
	ld e, a
	push de
	call SFXChannelsOff
	pop de
	call PlaySFX
	ret
; e4d54 (39:4d54)

.UnownSounds: ; e4d54
	dbw $00, SFX_INTRO_UNOWN_3
	dbw $20, SFX_INTRO_UNOWN_2
	dbw $40, SFX_INTRO_UNOWN_1
	dbw $60, SFX_INTRO_UNOWN_2
	dbw $80, SFX_INTRO_UNOWN_3
	dbw $90, SFX_INTRO_UNOWN_2
	dbw $a0, SFX_INTRO_UNOWN_1
	dbw $b0, SFX_INTRO_UNOWN_2
	db -1 ; e4d6d

IntroScene13: ; e4d6d (39:4d6d)
; Switch scenes again.
	call Intro_ClearBGPals
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap003
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, $0
	ld [rVBK], a
	ld hl, IntroSuicuneRunGFX
	ld de, vTiles0 tile $00
	call Intro_DecompressRequest2bpp_255Tiles
	ld hl, IntroBackgroundGFX
	ld de, vTiles2 tile $00
	call Intro_DecompressRequest2bpp_128Tiles
	ld hl, IntroTilemap004
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_e5edd
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes
	ld hl, Palette_e5edd
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes
	pop af
	ld [rSVBK], a
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	farcall ClearSpriteAnims
	depixel 13, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_INTRO_SUICUNE
	call _InitSpriteAnimStruct
	ld de, MUSIC_CRYSTAL_OPENING
	call PlayMusic
	xor a
	ld [wGlobalAnimXOffset], a
	call Intro_SetCGBPalUpdate
	xor a
	ld [wIntroSceneFrameCounter], a
	ld [wIntroSceneTimer], a
	call NextIntroScene
	ret

IntroScene14: ; e4dfa (39:4dfa)
; Suicune runs then jumps.
	ld a, [hSCX]
	sub 10
	ld [hSCX], a
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	inc [hl]
	cp $80
	jr z, .done
	cp $60
	jr z, .jump
	jr nc, .asm_e4e1a
	cp $40
	jr nc, .asm_e4e33
	ret

.jump
	ld de, SFX_INTRO_SUICUNE_4
	call PlaySFX

.asm_e4e1a
	ld a, $1
	ld [wIntroSceneTimer], a
	ld a, [wGlobalAnimXOffset]
	cp $88
	jr c, .asm_e4e2c
	sub $8
	ld [wGlobalAnimXOffset], a
	ret

.asm_e4e2c
	farcall DeinitializeAllSprites
	ret

.asm_e4e33
	ld a, [wGlobalAnimXOffset]
	sub $2
	ld [wGlobalAnimXOffset], a
	ret

.done
	call NextIntroScene
	ret

IntroScene15: ; e4e40 (39:4e40)
; Transition to a new scene.
	call Intro_ClearBGPals
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap009
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, $0
	ld [rVBK], a
	ld hl, IntroSuicuneJumpGFX
	ld de, vTiles2 tile $00
	call Intro_DecompressRequest2bpp_128Tiles
	ld hl, IntroUnownBackGFX
	ld de, vTiles0 tile $00
	call Intro_DecompressRequest2bpp_128Tiles
	ld de, IntroGrass4GFX
	ld hl, vTiles1 tile $00
	lb bc, BANK(IntroGrass4GFX), 1
	call Request2bpp
	ld hl, IntroTilemap010
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	call Intro_LoadTilemap
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_e77dd
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes
	ld hl, Palette_e77dd
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes
	pop af
	ld [rSVBK], a
	xor a
	ld [hSCX], a
	ld a, $90
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	farcall ClearSpriteAnims
	call Intro_SetCGBPalUpdate
	depixel 8, 5
	ld a, SPRITE_ANIM_INDEX_INTRO_UNOWN_F
	call _InitSpriteAnimStruct
	depixel 12, 0
	ld a, SPRITE_ANIM_INDEX_INTRO_SUICUNE_AWAY
	call _InitSpriteAnimStruct
	xor a
	ld [wIntroSceneFrameCounter], a
	ld [wIntroSceneTimer], a
	call NextIntroScene
	ret

IntroScene16: ; e4edc (39:4edc)
; Suicune shows its face. An Unown appears in front.
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	inc [hl]
	cp $80
	jr nc, .done
	call Intro_Scene16_AnimateSuicune
	ld a, [hSCY]
	and a
	ret z
	add 8
	ld [hSCY], a
	ret
.done
	call NextIntroScene
	ret

IntroScene17: ; e4ef5 (39:4ef5)
; ...
	call Intro_ClearBGPals
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap011
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, $0
	ld [rVBK], a
	ld hl, IntroSuicuneCloseGFX
	ld de, vTiles1 tile $00
	call Intro_DecompressRequest2bpp_255Tiles
	ld hl, IntroTilemap012
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_e6d6d
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes
	ld hl, Palette_e6d6d
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes
	pop af
	ld [rSVBK], a
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	farcall ClearSpriteAnims
	call Intro_SetCGBPalUpdate
	xor a
	ld [wIntroSceneFrameCounter], a
	ld [wIntroSceneTimer], a
	call NextIntroScene
	ret

IntroScene18: ; e4f67 (39:4f67)
; Suicune close up.
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	inc [hl]
	cp $60
	jr nc, .done
	ld a, [hSCX]
	cp $60
	ret z
	add 8
	ld [hSCX], a
	ret
.done
	call NextIntroScene
	ret

IntroScene19: ; e4f7e (39:4f7e)
; More setup.
	call Intro_ClearBGPals
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap013
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, $0
	ld [rVBK], a
	ld hl, IntroSuicuneBackGFX
	ld de, vTiles2 tile $00
	call Intro_DecompressRequest2bpp_128Tiles
	ld hl, IntroUnownsGFX
	ld de, vTiles1 tile $00
	call Intro_DecompressRequest2bpp_128Tiles
	ld de, IntroGrass4GFX
	ld hl, vTiles1 tile $7f
	lb bc, BANK(IntroGrass4GFX), 1
	call Request2bpp
	ld hl, IntroTilemap014
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	call Intro_LoadTilemap
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_e77dd
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes
	ld hl, Palette_e77dd
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes
	pop af
	ld [rSVBK], a
	xor a
	ld [hSCX], a
	ld a, $d8
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	farcall ClearSpriteAnims
	ld hl, wSpriteAnimDict
	xor a
	ld [hli], a
	ld [hl], $7f
	call Intro_SetCGBPalUpdate
	depixel 12, 0
	ld a, SPRITE_ANIM_INDEX_INTRO_SUICUNE_AWAY
	call _InitSpriteAnimStruct
	xor a
	ld [wIntroSceneFrameCounter], a
	ld [wIntroSceneTimer], a
	call NextIntroScene
	ret

IntroScene20: ; e5019 (39:5019)
; Suicune running away. A bunch of Unown appear.
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	inc [hl]
	cp $98
	jr nc, .finished
	cp $58
	ret nc
	cp $40
	jr nc, .AppearUnown
	cp $28
	ret nc
	ld a, [hSCY]
	inc a
	ld [hSCY], a
	ret

.AppearUnown:
	sub $18
	ld c, a
	and $3
	cp $3
	ret nz
	ld a, c
	and $1c
	srl a
	srl a
	ld [wIntroSceneTimer], a
	xor a
	call Intro_Scene20_AppearUnown
	ret
; e5049 (39:5049)
; unused
	ld a, c
	and $1c
	srl a
	srl a
	ld [wIntroSceneTimer], a
	ld a, 1
	call Intro_Scene20_AppearUnown
	ret

.finished
	call NextIntroScene
	ret

IntroScene21: ; e505d (39:505d)
; Suicune gets more distant and turns black.
	call Intro_ColoredSuicuneFrameSwap
	ld c, 3
	call DelayFrames
	xor a
	ld [hBGMapMode], a
	ld [wIntroSceneFrameCounter], a
	ld [wIntroSceneTimer], a
	call NextIntroScene
	ret

IntroScene22: ; e5072 (39:5072)
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	inc [hl]
	cp $8
	jr nc, .done
	ret
.done
	farcall DeinitializeAllSprites
	call NextIntroScene
	ret

IntroScene23: ; e5086 (39:5086)
	xor a
	ld [wIntroSceneFrameCounter], a
	call NextIntroScene
	ret

IntroScene24: ; e508e (39:508e)
; Fade to white.
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	inc [hl]
	cp $20
	jr nc, .done

	ld c, a
	and $3
	ret nz

	ld a, c
	and $1c
	sla a
	call Intro_Scene24_ApplyPaletteFade
	ret

.done
	ld a, $40
	ld [wIntroSceneFrameCounter], a
	call NextIntroScene
	ret

IntroScene25: ; e50ad (39:50ad)
; Wait around a bit.
	ld a, [wIntroSceneFrameCounter]
	dec a
	jr z, .done
	ld [wIntroSceneFrameCounter], a
	ret

.done
	call NextIntroScene
	ret

IntroScene26: ; e50bb (39:50bb)
; Load the final scene.
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap015
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, $0
	ld [rVBK], a
	ld hl, IntroCrystalUnownsGFX
	ld de, vTiles2 tile $00
	call Intro_DecompressRequest2bpp_128Tiles
	ld hl, IntroTilemap017
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_e679d
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes
	ld hl, Palette_e679d
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes
	pop af
	ld [rSVBK], a
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	farcall ClearSpriteAnims
	call Intro_SetCGBPalUpdate
	xor a
	ld [wIntroSceneFrameCounter], a
	ld [wIntroSceneTimer], a
	call NextIntroScene
	ret

IntroScene27: ; e512d (39:512d)
; Spell out C R Y S T A L with Unown.
	ld hl, wIntroSceneTimer
	inc [hl]
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	inc [hl]
	cp $80
	jr nc, .done

	ld c, a
	and $f
	ld [wIntroSceneTimer], a
	ld a, c
	and $70
	swap a
	call Intro_FadeUnownWordPals
	ret

.done
	call NextIntroScene
	ld a, $80
	ld [wIntroSceneFrameCounter], a
	ret

IntroScene28: ; e5152 (39:5152)
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

	ld de, SFX_UNKNOWN_CB
	call PlaySFX
	ret

.clear
	call ClearBGPalettes
	ret

.done
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

Intro_Scene24_ApplyPaletteFade: ; e5172 (39:5172)
; load the (a)th palette from .FadePals to all wBGPals2
	ld hl, .FadePals
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a

	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
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
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; e519c (39:519c)

.FadePals: ; e519c
INCLUDE "gfx/intro/fade.pal"
; e51dc

CrystalIntro_InitUnownAnim: ; e51dc (39:51dc)
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

CrystalIntro_UnownFade: ; e5223 (39:5223)
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
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a

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
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; e5288 (39:5288)

.BWFade: ; e5288
; Fade between black and white.
hue = 0
rept 32
	RGB hue, hue, hue
hue = hue + 1
endr
; e52c8

.BlackLBlueFade: ; e52c8
; Fade between black and light blue.
hue = 0
rept 32
	RGB 0, hue / 2, hue
hue = hue + 1
endr
; e5308

.BlackBlueFade: ; e5308
; Fade between black and blue.
hue = 0
rept 32
	RGB 0, 0, hue
hue = hue + 1
endr
; e5348

Intro_Scene20_AppearUnown: ; e5348 (39:5348)
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
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a

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
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; e538d (39:538d)

.pal1 ; e538d
	RGB 24, 12, 09
	RGB 31, 31, 31
	RGB 12, 00, 31
	RGB 00, 00, 00

; e5395

.pal2 ; e5395
	RGB 24, 12, 09
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31

; e539d

Intro_FadeUnownWordPals: ; e539d (39:539d)
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

	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a

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
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; e53db (39:53db)

.FastFadePalettes: ; e53db
hue = 31
rept 8
	RGB hue, hue, hue
hue = hue + -1
	RGB hue, hue, hue
hue = hue + -2
endr
; e53fb

.SlowFadePalettes: ; e53fb
hue = 31
rept 16
	RGB hue, hue, hue
hue = hue + -1
endr
; e541b

Intro_LoadTilemap: ; e541b (39:541b)
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a

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
	; add hl, $20 - SCREEN_WIDTH
	ld a, $20 - SCREEN_WIDTH
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	dec b
	jr nz, .row

	pop af
	ld [rSVBK], a
	ret

Intro_Scene16_AnimateSuicune: ; e5441 (39:5441)
	ld a, [wIntroSceneFrameCounter]
	and $3
	jr z, Intro_ColoredSuicuneFrameSwap
	cp $3
	jr z, .PrepareForSuicuneSwap
	ret

.PrepareForSuicuneSwap:
	xor a
	ld [hBGMapMode], a
	ret

Intro_ColoredSuicuneFrameSwap: ; e5451 (39:5451)
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
	ld [hBGMapMode], a
	ret

Intro_RustleGrass: ; e546d (39:546d)
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
	ld [Requested2bppSource], a
	ld a, [hli]
	ld [Requested2bppSource + 1], a
	ld a, LOW(vTiles2 tile $09)
	ld [Requested2bppDest], a
	ld a, HIGH(vTiles2 tile $09)
	ld [Requested2bppDest + 1], a
	ld a, 4
	ld [Requested2bppSize], a
	ret
; e5496 (39:5496)

.RustlingGrassPointers: ; e5496
	dw IntroGrass1GFX
	dw IntroGrass2GFX
	dw IntroGrass3GFX
	dw IntroGrass2GFX
; e549e

Intro_SetCGBPalUpdate: ; e549e (39:549e)
	ld a, $1
	ld [hCGBPalUpdate], a
	ret

Intro_ClearBGPals: ; e54a3 (39:54a3)
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a

	ld hl, wBGPals2
	ld bc, 16 palettes
	xor a
	call ByteFill

	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	call DelayFrame
	call DelayFrame
	ret

Intro_DecompressRequest2bpp_128Tiles: ; e54c2 (39:54c2)
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a

	push de
	ld de, wDecompressScratch
	call Decompress
	pop hl

	ld de, wDecompressScratch
	lb bc, $01, $80
	call Request2bpp

	pop af
	ld [rSVBK], a
	ret

Intro_DecompressRequest2bpp_255Tiles: ; e54de (39:54de)
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a

	push de
	ld de, wDecompressScratch
	call Decompress
	pop hl

	ld de, wDecompressScratch
	lb bc, $01, $ff
	call Request2bpp

	pop af
	ld [rSVBK], a
	ret

Intro_DecompressRequest2bpp_64Tiles: ; e54fa (39:54fa)
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a

	push de
	ld de, wDecompressScratch
	call Decompress
	pop hl

	ld de, wDecompressScratch
	lb bc, $01, $40
	call Request2bpp

	pop af
	ld [rSVBK], a
	ret

Intro_ResetLYOverrides: ; e5516 (39:5516)
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a

	ld hl, LYOverrides
	ld bc, LYOverridesEnd - LYOverrides
	xor a
	call ByteFill

	pop af
	ld [rSVBK], a
	ld a, rSCX - $ff00
	ld [hLCDCPointer], a
	ret

Intro_PerspectiveScrollBG: ; e552f (39:552f)
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	; Scroll the grass every frame.
	; Scroll the trees every other frame and at half speed.
	; This creates an illusion of perspective.
	ld a, [wIntroSceneFrameCounter]
	and $1
	jr z, .skip
	; trees in the back
	ld hl, LYOverrides
	ld a, [hl]
	inc a
	ld bc, $5f
	call ByteFill
.skip
	; grass in the front
	ld hl, LYOverrides + $5f
	ld a, [hl]
	inc a
	inc a
	ld bc, $31
	call ByteFill
	ld a, [LYOverrides + 0]
	ld [hSCX], a
	pop af
	ld [rSVBK], a
	ret

IntroSuicuneRunGFX: ; e555d
INCBIN "gfx/intro/suicune_run.2bpp.lz"
; e592d

IntroPichuWooperGFX: ; e592d
INCBIN "gfx/intro/pichu_wooper.2bpp.lz"
; e5c7d

IntroBackgroundGFX: ; e5c7d
INCBIN "gfx/intro/background.2bpp.lz"
; e5e6d

IntroTilemap004: ; e5e6d
INCBIN "gfx/intro/004.tilemap.lz"
; e5ecd

IntroTilemap003: ; e5ecd
INCBIN "gfx/intro/003.tilemap.lz"
; e5edd

Palette_e5edd: ; e5edd
INCLUDE "gfx/intro/intro_1.pal"
; e5f5d

IntroUnownsGFX: ; e5f5d
INCBIN "gfx/intro/unowns.2bpp.lz"
; e634d

IntroPulseGFX: ; e634d
INCBIN "gfx/intro/pulse.2bpp.lz"
; e63dd

IntroTilemap002: ; e63dd
INCBIN "gfx/intro/002.tilemap.lz"
; e641d

IntroTilemap001: ; e641d
INCBIN "gfx/intro/001.tilemap.lz"
; e642d

IntroTilemap006: ; e642d
INCBIN "gfx/intro/006.tilemap.lz"
; e647d

IntroTilemap005: ; e647d
INCBIN "gfx/intro/005.tilemap.lz"
; e649d

IntroTilemap008: ; e649d
INCBIN "gfx/intro/008.tilemap.lz"
; e655d

IntroTilemap007: ; e655d
INCBIN "gfx/intro/007.tilemap.lz"
; e65ad

Palette_365ad: ; e65ad
INCLUDE "gfx/intro/intro_2.pal"
; e662d

IntroCrystalUnownsGFX: ; e662d
INCBIN "gfx/intro/crystal_unowns.2bpp.lz"
; e672d

IntroTilemap017: ; e672d
INCBIN "gfx/intro/017.tilemap.lz"
; e676d

IntroTilemap015: ; e676d
INCBIN "gfx/intro/015.tilemap.lz"
; e679d

Palette_e679d: ; e679d
INCLUDE "gfx/intro/intro_3.pal"
; e681d

IntroSuicuneCloseGFX: ; e681d
INCBIN "gfx/intro/suicune_close.2bpp.lz"
; e6c3d

IntroTilemap012: ; e6c3d
INCBIN "gfx/intro/012.tilemap.lz"
; e6d0d

IntroTilemap011: ; e6d0d
INCBIN "gfx/intro/011.tilemap.lz"
; e6d6d

Palette_e6d6d: ; e6d6d
INCLUDE "gfx/intro/intro_4.pal"
; e6ded

IntroSuicuneJumpGFX: ; e6ded
INCBIN "gfx/intro/suicune_jump.2bpp.lz"
; e72ad

IntroSuicuneBackGFX: ; e72ad
INCBIN "gfx/intro/suicune_back.2bpp.lz"
; e764d

IntroTilemap010: ; e764d
INCBIN "gfx/intro/010.tilemap.lz"
; e76ad

IntroTilemap009: ; e76ad
INCBIN "gfx/intro/009.tilemap.lz"
; e76bd

IntroTilemap014: ; e76bd
INCBIN "gfx/intro/014.tilemap.lz"
; e778d

IntroTilemap013: ; e778d
INCBIN "gfx/intro/013.tilemap.lz"
; e77dd

Palette_e77dd: ; e77dd
INCLUDE "gfx/intro/intro_5.pal"

IntroUnownBackGFX: ; e785d
INCBIN "gfx/intro/unown_back.2bpp.lz"
; e799d

IntroGrass1GFX: ; e799d
INCBIN "gfx/intro/grass1.2bpp"
IntroGrass2GFX: ; e79dd
INCBIN "gfx/intro/grass2.2bpp"
IntroGrass3GFX: ; e7a1d
INCBIN "gfx/intro/grass3.2bpp"
IntroGrass4GFX: ; e7a5d
INCBIN "gfx/intro/grass4.2bpp"
