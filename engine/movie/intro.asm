CrystalIntro:
	ldh a, [rWBK]
	push af
	ld a, BANK(wGBCPalettes)
	ldh [rWBK], a
	ldh a, [hInMenu]
	push af
	ldh a, [hVBlank]
	push af
	call .InitRAMAddrs
.loop
	call JoyTextDelay
	ldh a, [hJoyLast]
	and PAD_BUTTONS
	jr nz, .ShutOffMusic
	ld a, [wJumptableIndex]
	bit JUMPTABLE_EXIT_F, a
	jr nz, .done
	call IntroSceneJumper
	farcall PlaySpriteAnimations
	call DelayFrame
	jp .loop

.ShutOffMusic
	ld de, MUSIC_NONE
	call PlayMusic

.done
	call ClearBGPalettes
	call ClearSprites
	call ClearTilemap
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, 7
	ldh [hWX], a
	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a
	pop af
	ldh [hVBlank], a
	pop af
	ldh [hInMenu], a
	pop af
	ldh [rWBK], a
	ret

.InitRAMAddrs:
	assert VBLANK_NORMAL == 0
	xor a
	ldh [hVBlank], a
	ld a, TRUE
	ldh [hInMenu], a
	xor a
	ldh [hMapAnims], a
	ld [wJumptableIndex], a
	ret

IntroSceneJumper:
	jumptable IntroScenes, wJumptableIndex

IntroScenes:
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

NextIntroScene:
	ld hl, wJumptableIndex
	inc [hl]
	ret

IntroScene1:
; Setup the next scene.
	call Intro_ClearBGPals
	call ClearSprites
	call ClearTilemap
	xor a
	ldh [hBGMapMode], a
	ld a, $1
	ldh [rVBK], a
	ld hl, IntroUnownAAttrmap
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, $0
	ldh [rVBK], a
	ld hl, IntroUnownsGFX
	ld de, vTiles2 tile $00
	call Intro_DecompressRequest2bpp_128Tiles
	ld hl, IntroPulseGFX
	ld de, vTiles0 tile $00
	call Intro_DecompressRequest2bpp_128Tiles
	ld hl, IntroUnownATilemap
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rWBK], a
	ld hl, IntroUnownsPalette
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes
	ld hl, IntroUnownsPalette
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes
	pop af
	ldh [rWBK], a
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, 7
	ldh [hWX], a
	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a
	farcall ClearSpriteAnims
	call Intro_SetCGBPalUpdate
	xor a
	ld [wIntroSceneFrameCounter], a
	ld [wIntroSceneTimer], a
	call NextIntroScene
	ret

IntroScene2:
; First Unown (A) fades in, pulses, then fades out.
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	inc [hl]
	cp $80
	jr nc, .endscene
	cp $60
	jr nz, .nosound
	push af
	depixel 11, 11
	call CrystalIntro_InitUnownAnim
	ld de, SFX_INTRO_UNOWN_1
	call PlaySFX
	pop af
.nosound
	ld [wIntroSceneTimer], a
	xor a
	call CrystalIntro_UnownFade
	ret
.endscene
	call NextIntroScene
	ret

IntroScene3:
; More setup. Transition to the outdoor scene.
	call Intro_ClearBGPals
	call ClearSprites
	call ClearTilemap
	xor a
	ldh [hBGMapMode], a
	ld a, $1
	ldh [rVBK], a
	ld hl, IntroBackgroundAttrmap
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, $0
	ldh [rVBK], a
	ld hl, IntroBackgroundGFX
	ld de, vTiles2 tile $00
	call Intro_DecompressRequest2bpp_128Tiles
	ld hl, IntroBackgroundTilemap
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rWBK], a
	ld hl, IntroBackgroundPalette
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes
	ld hl, IntroBackgroundPalette
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes
	pop af
	ldh [rWBK], a
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, 7
	ldh [hWX], a
	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a
	call Intro_ResetLYOverrides
	call Intro_SetCGBPalUpdate
	xor a
	ld [wIntroSceneFrameCounter], a
	call NextIntroScene
	ret

IntroScene4:
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

IntroScene5:
; Go back to the Unown.
	call Intro_ClearBGPals
	call ClearSprites
	call ClearTilemap
	xor a
	ldh [hBGMapMode], a
	ldh [hLCDCPointer], a
	ld a, $1
	ldh [rVBK], a
	ld hl, IntroUnownHIAttrmap
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, $0
	ldh [rVBK], a
	ld hl, IntroUnownsGFX
	ld de, vTiles2 tile $00
	call Intro_DecompressRequest2bpp_128Tiles
	ld hl, IntroPulseGFX
	ld de, vTiles0 tile $00
	call Intro_DecompressRequest2bpp_128Tiles
	ld hl, IntroUnownHITilemap
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rWBK], a
	ld hl, IntroUnownsPalette
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes
	ld hl, IntroUnownsPalette
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes
	pop af
	ldh [rWBK], a
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, 7
	ldh [hWX], a
	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a
	farcall ClearSpriteAnims
	call Intro_SetCGBPalUpdate
	xor a
	ld [wIntroSceneFrameCounter], a
	ld [wIntroSceneTimer], a
	call NextIntroScene
	ret

IntroScene6:
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

IntroScene7:
; Back to the outdoor scene.
	call Intro_ClearBGPals
	call ClearSprites
	call ClearTilemap
	xor a
	ldh [hBGMapMode], a

	ld a, $1
	ldh [rVBK], a
	ld hl, IntroBackgroundAttrmap
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles

	ld hl, IntroPichuWooperGFX
	ld de, vTiles0 tile $00
	call Intro_DecompressRequest2bpp_128Tiles

	ld a, $0
	ldh [rVBK], a
	ld hl, IntroSuicuneRunGFX
	ld de, vTiles0 tile $00
	call Intro_DecompressRequest2bpp_255Tiles

	ld hl, IntroBackgroundGFX
	ld de, vTiles2 tile $00
	call Intro_DecompressRequest2bpp_128Tiles

	ld hl, IntroBackgroundTilemap
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles

	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rWBK], a

	ld hl, IntroBackgroundPalette
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes

	ld hl, IntroBackgroundPalette
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes

	pop af
	ldh [rWBK], a

	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, 7
	ldh [hWX], a
	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a
	call Intro_ResetLYOverrides
	farcall ClearSpriteAnims
	depixel 13, 27, 4, 0
	ld a, SPRITE_ANIM_OBJ_INTRO_SUICUNE
	call InitSpriteAnimStruct
	ld a, $f0
	ld [wGlobalAnimXOffset], a
	call Intro_SetCGBPalUpdate
	xor a
	ld [wIntroSceneFrameCounter], a
	ld [wIntroSceneTimer], a
	call NextIntroScene
	ret

IntroScene8:
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

IntroScene9:
; Set up the next scene (same bg).
	xor a
	ldh [hLCDCPointer], a
	call ClearSprites
	hlcoord 0, 0, wAttrmap
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
	ldh [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	call DelayFrame
	ld a, LOW(vBGMap0 + $c) ; $c
	ldh [hBGMapAddress], a
	call DelayFrame
	call DelayFrame
	call DelayFrame
	xor a
	ldh [hBGMapMode], a
	ldh [hBGMapAddress], a
	ld [wGlobalAnimXOffset], a
	xor a
	ld [wIntroSceneFrameCounter], a
	call NextIntroScene
	ret

IntroScene10:
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
	ld a, SPRITE_ANIM_OBJ_INTRO_PICHU
	call InitSpriteAnimStruct
	ld de, SFX_INTRO_PICHU
	call PlaySFX
	ret

.wooper
	depixel 22, 6
	ld a, SPRITE_ANIM_OBJ_INTRO_WOOPER
	call InitSpriteAnimStruct
	ld de, SFX_INTRO_PICHU
	call PlaySFX
	ret
.done
	call NextIntroScene
	ret

IntroScene11:
; Back to Unown again.
	call Intro_ClearBGPals
	call ClearSprites
	call ClearTilemap
	xor a
	ldh [hBGMapMode], a
	ldh [hLCDCPointer], a
	ld a, $1
	ldh [rVBK], a
	ld hl, IntroUnownsAttrmap
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, $0
	ldh [rVBK], a
	ld hl, IntroUnownsGFX
	ld de, vTiles2 tile $00
	call Intro_DecompressRequest2bpp_128Tiles
	ld hl, IntroUnownsTilemap
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rWBK], a
	ld hl, IntroUnownsPalette
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes
	ld hl, IntroUnownsPalette
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes
	pop af
	ldh [rWBK], a
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, 7
	ldh [hWX], a
	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a
	farcall ClearSpriteAnims
	call Intro_SetCGBPalUpdate
	xor a
	ld [wIntroSceneFrameCounter], a
	ld [wIntroSceneTimer], a
	call NextIntroScene
	ret

IntroScene12:
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

.PlayUnownSound:
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

.UnownSounds:
	dbw $00, SFX_INTRO_UNOWN_3
	dbw $20, SFX_INTRO_UNOWN_2
	dbw $40, SFX_INTRO_UNOWN_1
	dbw $60, SFX_INTRO_UNOWN_2
	dbw $80, SFX_INTRO_UNOWN_3
	dbw $90, SFX_INTRO_UNOWN_2
	dbw $a0, SFX_INTRO_UNOWN_1
	dbw $b0, SFX_INTRO_UNOWN_2
	db -1

IntroScene13:
; Switch scenes again.
	call Intro_ClearBGPals
	call ClearSprites
	call ClearTilemap
	xor a
	ldh [hBGMapMode], a
	ld a, $1
	ldh [rVBK], a
	ld hl, IntroBackgroundAttrmap
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, $0
	ldh [rVBK], a
	ld hl, IntroSuicuneRunGFX
	ld de, vTiles0 tile $00
	call Intro_DecompressRequest2bpp_255Tiles
	ld hl, IntroBackgroundGFX
	ld de, vTiles2 tile $00
	call Intro_DecompressRequest2bpp_128Tiles
	ld hl, IntroBackgroundTilemap
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rWBK], a
	ld hl, IntroBackgroundPalette
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes
	ld hl, IntroBackgroundPalette
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes
	pop af
	ldh [rWBK], a
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, 7
	ldh [hWX], a
	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a
	farcall ClearSpriteAnims
	depixel 13, 11, 4, 0
	ld a, SPRITE_ANIM_OBJ_INTRO_SUICUNE
	call InitSpriteAnimStruct
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

IntroScene14:
; Suicune runs then jumps.
	ldh a, [hSCX]
	sub 10
	ldh [hSCX], a
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	inc [hl]
	cp $80
	jr z, .done
	cp $60
	jr z, .jump
	jr nc, .run_after_jump
	cp $40
	jr nc, .run
	ret

.jump
	ld de, SFX_INTRO_SUICUNE_4
	call PlaySFX

.run_after_jump
	ld a, $1
	ld [wIntroSceneTimer], a
	ld a, [wGlobalAnimXOffset]
	cp $88
	jr c, .disappear
	sub $8
	ld [wGlobalAnimXOffset], a
	ret

.disappear
	farcall DeinitializeAllSprites
	ret

.run
	ld a, [wGlobalAnimXOffset]
	sub $2
	ld [wGlobalAnimXOffset], a
	ret

.done
	call NextIntroScene
	ret

IntroScene15:
; Transition to a new scene.
	call Intro_ClearBGPals
	call ClearSprites
	call ClearTilemap
	xor a
	ldh [hBGMapMode], a
	ld a, $1
	ldh [rVBK], a
	ld hl, IntroSuicuneJumpAttrmap
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, $0
	ldh [rVBK], a
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
	ld hl, IntroSuicuneJumpTilemap
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	call Intro_LoadTilemap
	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rWBK], a
	ld hl, IntroSuicunePalette
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes
	ld hl, IntroSuicunePalette
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes
	pop af
	ldh [rWBK], a
	xor a
	ldh [hSCX], a
	ld a, SCREEN_HEIGHT_PX
	ldh [hSCY], a
	ld a, 7
	ldh [hWX], a
	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a
	farcall ClearSpriteAnims
	call Intro_SetCGBPalUpdate
	depixel 8, 5
	ld a, SPRITE_ANIM_OBJ_INTRO_UNOWN_F
	call InitSpriteAnimStruct
	depixel 12, 0
	ld a, SPRITE_ANIM_OBJ_INTRO_SUICUNE_AWAY
	call InitSpriteAnimStruct
	xor a
	ld [wIntroSceneFrameCounter], a
	ld [wIntroSceneTimer], a
	call NextIntroScene
	ret

IntroScene16:
; Suicune shows its face. An Unown appears in front.
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	inc [hl]
	cp $80
	jr nc, .done
	call Intro_Scene16_AnimateSuicune
	ldh a, [hSCY]
	and a
	ret z
	add 8
	ldh [hSCY], a
	ret
.done
	call NextIntroScene
	ret

IntroScene17:
; ...
	call Intro_ClearBGPals
	call ClearSprites
	call ClearTilemap
	xor a
	ldh [hBGMapMode], a
	ld a, $1
	ldh [rVBK], a
	ld hl, IntroSuicuneCloseAttrmap
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, $0
	ldh [rVBK], a
	ld hl, IntroSuicuneCloseGFX
	ld de, vTiles1 tile $00
	call Intro_DecompressRequest2bpp_255Tiles
	ld hl, IntroSuicuneCloseTilemap
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rWBK], a
	ld hl, IntroSuicuneClosePalette
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes
	ld hl, IntroSuicuneClosePalette
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes
	pop af
	ldh [rWBK], a
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, 7
	ldh [hWX], a
	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a
	farcall ClearSpriteAnims
	call Intro_SetCGBPalUpdate
	xor a
	ld [wIntroSceneFrameCounter], a
	ld [wIntroSceneTimer], a
	call NextIntroScene
	ret

IntroScene18:
; Suicune close up.
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	inc [hl]
	cp $60
	jr nc, .done
	ldh a, [hSCX]
	cp $60
	ret z
	add 8
	ldh [hSCX], a
	ret
.done
	call NextIntroScene
	ret

IntroScene19:
; More setup.
	call Intro_ClearBGPals
	call ClearSprites
	call ClearTilemap
	xor a
	ldh [hBGMapMode], a
	ld a, $1
	ldh [rVBK], a
	ld hl, IntroSuicuneBackAttrmap
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, $0
	ldh [rVBK], a
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
	ld hl, IntroSuicuneBackTilemap
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	call Intro_LoadTilemap
	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rWBK], a
	ld hl, IntroSuicunePalette
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes
	ld hl, IntroSuicunePalette
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes
	pop af
	ldh [rWBK], a
	xor a
	ldh [hSCX], a
	ld a, -5 * TILE_WIDTH
	ldh [hSCY], a
	ld a, 7
	ldh [hWX], a
	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a
	farcall ClearSpriteAnims
	ld hl, wSpriteAnimDict
	xor a ; SPRITE_ANIM_DICT_DEFAULT
	ld [hli], a
	ld [hl], $7f
	call Intro_SetCGBPalUpdate
	depixel 12, 0
	ld a, SPRITE_ANIM_OBJ_INTRO_SUICUNE_AWAY
	call InitSpriteAnimStruct
	xor a
	ld [wIntroSceneFrameCounter], a
	ld [wIntroSceneTimer], a
	call NextIntroScene
	ret

IntroScene20:
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
	ldh a, [hSCY]
	inc a
	ldh [hSCY], a
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

.AppearUnownPal2: ; unreferenced
	ld a, c
	and $1c
	srl a
	srl a
	ld [wIntroSceneTimer], a
	ld a, 1
	call Intro_Scene20_AppearUnown
	ret

.finished:
	call NextIntroScene
	ret

IntroScene21:
; Suicune gets more distant and turns black.
	call Intro_ColoredSuicuneFrameSwap
	ld c, 3
	call DelayFrames
	xor a
	ldh [hBGMapMode], a
	ld [wIntroSceneFrameCounter], a
	ld [wIntroSceneTimer], a
	call NextIntroScene
	ret

IntroScene22:
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

IntroScene23:
	xor a
	ld [wIntroSceneFrameCounter], a
	call NextIntroScene
	ret

IntroScene24:
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

IntroScene25:
; Wait around a bit.
	ld a, [wIntroSceneFrameCounter]
	dec a
	jr z, .done
	ld [wIntroSceneFrameCounter], a
	ret

.done
	call NextIntroScene
	ret

IntroScene26:
; Load the final scene.
	call ClearBGPalettes
	call ClearSprites
	call ClearTilemap
	xor a
	ldh [hBGMapMode], a
	ld a, $1
	ldh [rVBK], a
	ld hl, IntroCrystalUnownsAttrmap
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, $0
	ldh [rVBK], a
	ld hl, IntroCrystalUnownsGFX
	ld de, vTiles2 tile $00
	call Intro_DecompressRequest2bpp_128Tiles
	ld hl, IntroCrystalUnownsTilemap
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rWBK], a
	ld hl, IntroCrystalUnownsPalette
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes
	ld hl, IntroCrystalUnownsPalette
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes
	pop af
	ldh [rWBK], a
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, 7
	ldh [hWX], a
	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a
	farcall ClearSpriteAnims
	call Intro_SetCGBPalUpdate
	xor a
	ld [wIntroSceneFrameCounter], a
	ld [wIntroSceneTimer], a
	call NextIntroScene
	ret

IntroScene27:
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
	set JUMPTABLE_EXIT_F, [hl]
	ret

Intro_Scene24_ApplyPaletteFade:
; load the (a)th palette from .FadePals to all wBGPals2
	ld hl, .FadePals
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a

	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals2)
	ldh [rWBK], a
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
	ldh [rWBK], a
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

.FadePals:
INCLUDE "gfx/intro/fade.pal"

CrystalIntro_InitUnownAnim:
	push de
	ld a, SPRITE_ANIM_OBJ_INTRO_UNOWN
	call InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $8
	ld a, SPRITE_ANIM_FRAMESET_INTRO_UNOWN_4
	call ReinitSpriteAnimFrame
	pop de

	push de
	ld a, SPRITE_ANIM_OBJ_INTRO_UNOWN
	call InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $18
	ld a, SPRITE_ANIM_FRAMESET_INTRO_UNOWN_3
	call ReinitSpriteAnimFrame
	pop de

	push de
	ld a, SPRITE_ANIM_OBJ_INTRO_UNOWN
	call InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $28
	ld a, SPRITE_ANIM_FRAMESET_INTRO_UNOWN_1
	call ReinitSpriteAnimFrame
	pop de

	ld a, SPRITE_ANIM_OBJ_INTRO_UNOWN
	call InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_VAR1
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
	ld d, 0
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
	ld b, 0
	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals2)
	ldh [rWBK], a

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
	ldh [rWBK], a
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

.BWFade:
; Fade between black and white.
for hue, 32
	RGB hue, hue, hue
endr

.BlackLBlueFade:
; Fade between black and light blue.
for hue, 32
	RGB 0, hue / 2, hue
endr

.BlackBlueFade:
; Fade between black and blue.
for hue, 32
	RGB 0, 0, hue
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
	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals2)
	ldh [rWBK], a

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
	ldh [rWBK], a
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

.pal1:
INCLUDE "gfx/intro/unown_1.pal"

.pal2:
INCLUDE "gfx/intro/unown_2.pal"

Intro_FadeUnownWordPals:
	add a
	add a
	add a
	ld e, a
	ld d, 0
	ld hl, wBGPals2
	add hl, de
rept 4
	inc hl
endr
	ld a, [wIntroSceneTimer]
	add a
	ld c, a
	ld b, 0

	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals2)
	ldh [rWBK], a

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
	ldh [rWBK], a
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

.FastFadePalettes:
DEF hue = 31
rept 8
	RGB hue, hue, hue
	DEF hue -= 1
	RGB hue, hue, hue
	DEF hue -= 2
endr

.SlowFadePalettes:
DEF hue = 31
rept 16
	RGB hue, hue, hue
	DEF hue -= 1
endr

Intro_LoadTilemap:
	ldh a, [rWBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rWBK], a

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
	ld a, TILEMAP_WIDTH - SCREEN_WIDTH
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	dec b
	jr nz, .row

	pop af
	ldh [rWBK], a
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
	ld bc, SCREEN_AREA
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
	ld d, 0
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
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

Intro_ClearBGPals:
	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals2)
	ldh [rWBK], a

	ld hl, wBGPals2
	ld bc, 16 palettes
	xor a
	call ByteFill

	pop af
	ldh [rWBK], a
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	call DelayFrame
	call DelayFrame
	ret

Intro_DecompressRequest2bpp_128Tiles:
	ldh a, [rWBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rWBK], a

	push de
	ld de, wDecompressScratch
	call Decompress
	pop hl

	ld de, wDecompressScratch
	lb bc, $01, $80
	call Request2bpp

	pop af
	ldh [rWBK], a
	ret

Intro_DecompressRequest2bpp_255Tiles:
	ldh a, [rWBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rWBK], a

	push de
	ld de, wDecompressScratch
	call Decompress
	pop hl

	ld de, wDecompressScratch
	lb bc, $01, $ff
	call Request2bpp

	pop af
	ldh [rWBK], a
	ret

Intro_DecompressRequest2bpp_64Tiles:
	ldh a, [rWBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rWBK], a

	push de
	ld de, wDecompressScratch
	call Decompress
	pop hl

	ld de, wDecompressScratch
	lb bc, $01, $40
	call Request2bpp

	pop af
	ldh [rWBK], a
	ret

Intro_ResetLYOverrides:
	ldh a, [rWBK]
	push af
	ld a, BANK(wLYOverrides)
	ldh [rWBK], a

	ld hl, wLYOverrides
	ld bc, wLYOverridesEnd - wLYOverrides
	xor a
	call ByteFill

	pop af
	ldh [rWBK], a
	ld a, LOW(rSCX)
	ldh [hLCDCPointer], a
	ret

Intro_PerspectiveScrollBG:
	ldh a, [rWBK]
	push af
	ld a, BANK(wLYOverrides)
	ldh [rWBK], a
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
	ldh [rWBK], a
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
