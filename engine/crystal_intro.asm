Functione455c: ; e455c
	hlcoord 1, 1
	ld de, SCREEN_WIDTH
	ld c, $10
.asm_e4564
	ld [hl], $7f
	add hl, de
	dec c
	jr nz, .asm_e4564
	hlcoord 1, 2
	ld bc, $28
	ld a, [wJumptableIndex]
	call AddNTimes
	ld [hl], $ed
	ret
; e4579


Functione4579: ; e4579
	ld de, MUSIC_NONE
	call PlayMusic
	call ClearBGPalettes
	call ClearTileMap
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	xor a
	ld [hBGMapAddress], a
	ld [hJoyDown], a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $90
	ld [hWY], a
	call WaitBGMap
	ld b, SCGB_19
	call GetSGBLayout
	call SetPalettes
	ld c, 10
	call DelayFrames
	callab Copyright
	call WaitBGMap
	ld c, 100
	call DelayFrames
	call ClearTileMap
	callba GBCOnlyScreen
	call Functione45e8
.joy_loop
	call JoyTextDelay
	ld a, [hJoyLast]
	and BUTTONS
	jr nz, .pressed_button
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .finish
	call PlaceGameFreakPresents
	callba Function8cf69
	call DelayFrame
	jr .joy_loop

.pressed_button
	call Functione465e
	scf
	ret

.finish
	call Functione465e
	and a
	ret
; e45e8

Functione45e8: ; e45e8
	ld de, GameFreakLogo
	ld hl, VTiles2
	lb bc, BANK(GameFreakLogo), $1c
	call Get1bpp

	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a

	ld hl, IntroLogoGFX
	ld de, w6_d000
	ld a, BANK(IntroLogoGFX)
	call FarDecompress

	ld hl, VTiles0
	ld de, w6_d000
	lb bc, 1, 8 tiles
	call Request2bpp

	ld hl, VTiles1
	ld de, w6_d000 + $80 tiles
	lb bc, 1, 8 tiles
	call Request2bpp

	pop af
	ld [rSVBK], a

	callba Function8cf53
	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_03
	call _InitSpriteAnimStruct
	ld hl, $7
	add hl, bc
	ld [hl], $a0
	ld hl, $c
	add hl, bc
	ld [hl], $60
	ld hl, $d
	add hl, bc
	ld [hl], $30
	xor a
	ld [wJumptableIndex], a
	ld [wcf64], a
	ld [wcf65], a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $1
	ld [hBGMapMode], a
	ld a, $90
	ld [hWY], a
	ld de, $e4e4
	call DmgToCgbObjPals
	ret
; e465e

Functione465e: ; e465e
	callba Function8cf53
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
	ld hl, .jumptable
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; e467f

.jumptable: ; e467f
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
	ld hl, wcf65
	ld a, [hl]
	cp $20
	jr nc, .PlaceGameFreak
	inc [hl]
	ret

.PlaceGameFreak
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

.GAME_FREAK
	;  G  A  M  E   _  F  R  E  A  K
	db 0, 1, 2, 3, 13, 4, 5, 3, 1, 6
.end
	db "@"
; e46ba

PlaceGameFreakPresents_2: ; e46ba
	ld hl, wcf65
	ld a, [hl]
	cp $40
	jr nc, .place_presents
	inc [hl]
	ret

.place_presents
	ld [hl], 0
	ld hl, .presents
	decoord 7,11
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
	ld hl, wcf65
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
	ld hl, $b
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, GameFreakLogoScenes
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

GameFreakLogoScenes: ; e46fd (39:46fd)
	dw GameFreakLogoScene1
	dw GameFreakLogoScene2
	dw GameFreakLogoScene3
	dw GameFreakLogoScene4
	dw GameFreakLogoScene5


GameFreakLogoScene1: ; e4707 (39:4707)
	ld hl, $b
	add hl, bc
	inc [hl]
	ret

GameFreakLogoScene2: ; e470d (39:470d)
	ld hl, $c
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_e4747
	ld d, a
	ld hl, $d
	add hl, bc
	ld a, [hl]
	and $3f
	cp $20
	jr nc, .asm_e4723
	add $20
.asm_e4723
	ld e, a
	callba Functionce765
	ld hl, $7
	add hl, bc
	ld [hl], e
	ld hl, $d
	add hl, bc
	ld a, [hl]
	dec [hl]
	and $1f
	ret nz
	ld hl, $c
	add hl, bc
	ld a, [hl]
	sub $30
	ld [hl], a
	ld de, SFX_DITTO_BOUNCE
	call PlaySFX
	ret
.asm_e4747
	ld hl, $b
	add hl, bc
	inc [hl]
	ld hl, $d
	add hl, bc
	ld [hl], $0
	ld de, SFX_DITTO_POP_UP
	call PlaySFX
	ret

GameFreakLogoScene3: ; e4759 (39:4759)
	ld hl, $d
	add hl, bc
	ld a, [hl]
	cp $20
	jr nc, .asm_e4764
	inc [hl]
	ret
.asm_e4764
	ld hl, $b
	add hl, bc
	inc [hl]
	ld hl, $d
	add hl, bc
	ld [hl], $0
	ld de, SFX_DITTO_TRANSFORM
	call PlaySFX
	ret

GameFreakLogoScene4: ; e4776 (39:4776)
	ld hl, $d
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
rept 2
	add hl, de
endr
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld a, [hli]
	ld [OBPals + 12], a
	ld a, [hli]
	ld [OBPals + 13], a
	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
.asm_e47a3
	ld hl, $b
	add hl, bc
	inc [hl]
	call PlaceGameFreakPresents_AdvanceIndex

GameFreakLogoScene5: ; e47ab (39:47ab)
	ret
; e47ac (39:47ac)

GameFreakLogoPalettes: ; e47ac
; Ditto's color as it turns into the Game Freak logo.
; Fade from pink to orange.
; One color per step.
	RGB 23, 12, 28
	RGB 23, 12, 27
	RGB 23, 13, 26
	RGB 23, 13, 24
	RGB 24, 14, 22
	RGB 24, 14, 20
	RGB 24, 15, 18
	RGB 24, 15, 16
	RGB 25, 16, 14
	RGB 25, 16, 12
	RGB 25, 17, 10
	RGB 25, 17, 08
	RGB 26, 18, 06
	RGB 26, 18, 04
	RGB 26, 19, 02
	RGB 26, 19, 00
;' e47cc

GameFreakLogo: ; e47cc
INCBIN "gfx/splash/logo.1bpp"
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
	call Functione4901
.loop: ; e48bc
	call JoyTextDelay
	ld a, [hJoyLast]
	and BUTTONS
	jr nz, .ShutOffMusic
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done
	call IntroSceneJumper
	callba Function8cf69
	call DelayFrame
	jp .loop

.ShutOffMusic
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

Functione4901: ; e4901
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
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
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
	call Functione54a3
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap001
	debgcoord 0, 0
	call Functione54fa
	ld a, $0
	ld [rVBK], a
	ld hl, IntroUnownsGFX
	ld de, VTiles2 tile $00
	call Functione54c2
	ld hl, IntroPulseGFX
	ld de, VTiles0 tile $00
	call Functione54c2
	ld hl, IntroTilemap002
	debgcoord 0, 0
	call Functione54fa
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_365ad
	ld de, wMapPals
	ld bc, $80
	call CopyBytes
	ld hl, Palette_365ad
	ld de, BGPals
	ld bc, $80
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
	callba Function8cf53
	call Functione549e
	xor a
	ld [wIntroSceneFrameCounter], a
	ld [wcf65], a
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
	ld de, $5858
	call Functione51dc
	ld de, SFX_INTRO_UNOWN_1
	call PlaySFX
	pop af
.DontPlaySound
	ld [wcf65], a
	xor a
	call Functione5223
	ret
.endscene
	call NextIntroScene
	ret

IntroScene3: ; e49fd (39:49fd)
; More setup. Transition to the outdoor scene.
	call Functione54a3
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap003
	debgcoord 0, 0
	call Functione54fa
	ld a, $0
	ld [rVBK], a
	ld hl, IntroBackgroundGFX
	ld de, VTiles2 tile $00
	call Functione54c2
	ld hl, IntroTilemap004
	debgcoord 0, 0
	call Functione54fa
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_e5edd
	ld de, wMapPals
	ld bc, $80
	call CopyBytes
	ld hl, Palette_e5edd
	ld de, BGPals
	ld bc, $80
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
	call Functione5516
	call Functione549e
	xor a
	ld [wIntroSceneFrameCounter], a
	call NextIntroScene
	ret

IntroScene4: ; e4a69 (39:4a69)
; Scroll the outdoor panorama for a bit.
	call Functione552f
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
	call Functione54a3
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld [hLCDStatCustom], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap005
	debgcoord 0, 0
	call Functione54fa
	ld a, $0
	ld [rVBK], a
	ld hl, IntroUnownsGFX
	ld de, VTiles2 tile $00
	call Functione54c2
	ld hl, IntroPulseGFX
	ld de, VTiles0 tile $00
	call Functione54c2
	ld hl, IntroTilemap006
	debgcoord 0, 0
	call Functione54fa
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_365ad
	ld de, wMapPals
	ld bc, $80
	call CopyBytes
	ld hl, Palette_365ad
	ld de, BGPals
	ld bc, $80
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
	callba Function8cf53
	call Functione549e
	xor a
	ld [wcf64], a
	ld [wcf65], a
	call NextIntroScene
	ret

IntroScene6: ; e4af7 (39:4af7)
; Two more Unown (I, H) fade in.
	ld hl, wcf64
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
.FirstUnown
	push af
	ld de, $3878
	call Functione51dc
	ld de, SFX_INTRO_UNOWN_2
	call PlaySFX
	pop af
.NoUnown
	ld [wcf65], a
	xor a
	call Functione5223
	ret
.SecondUnown
	push af
	ld de, $7030
	call Functione51dc
	ld de, SFX_INTRO_UNOWN_1
	call PlaySFX
	pop af
.StopUnown
	ld [wcf65], a
	ld a, $1
	call Functione5223
	ret
.endscene
	call NextIntroScene
	ret

IntroScene7: ; e4b3f (39:4b3f)
; Back to the outdoor scene.
	call Functione54a3
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap003
	debgcoord 0, 0
	call Functione54fa
	ld hl, IntroPichuWooperGFX
	ld de, VTiles0 tile $00
	call Functione54c2
	ld a, $0
	ld [rVBK], a
	ld hl, IntroSuicuneRunGFX
	ld de, VTiles0 tile $00
	call Functione54de
	ld hl, IntroBackgroundGFX
	ld de, VTiles2 tile $00
	call Functione54c2
	ld hl, IntroTilemap004
	debgcoord 0, 0
	call Functione54fa
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_e5edd
	ld de, wMapPals
	ld bc, $80
	call CopyBytes
	ld hl, Palette_e5edd
	ld de, BGPals
	ld bc, $80
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
	call Functione5516
	callba Function8cf53
	depixel 13, 27, 4, 0
	ld a, SPRITE_ANIM_INDEX_26
	call _InitSpriteAnimStruct
	ld a, $f0
	ld [wc3c0], a
	call Functione549e
	xor a
	ld [wIntroSceneFrameCounter], a
	ld [wcf65], a
	call NextIntroScene
	ret

IntroScene8: ; e4bd3 (39:4bd3)
; Scroll the scene, then show Suicune running across the screen.
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	inc [hl]
	cp $40
	jr z, .asm_e4be2
	jr nc, .asm_e4be8
	call Functione552f
	ret
.asm_e4be2
	ld de, SFX_INTRO_SUICUNE_3
	call PlaySFX
.asm_e4be8
	ld a, [wc3c0]
	and a
	jr z, .asm_e4bf4
	sub $8
	ld [wc3c0], a
	ret
.asm_e4bf4
	ld de, SFX_INTRO_SUICUNE_2
	call PlaySFX
	callba Function8d03d
	call NextIntroScene
	ret

IntroScene9: ; e4c04 (39:4c04)
; Set up the next scene (same bg).
	xor a
	ld [hLCDStatCustom], a
	call ClearSprites
	hlcoord 0, 0, AttrMap
	ld bc, $f0
	ld a, $1
	call ByteFill
	ld bc, $3c
	ld a, $2
	call ByteFill
	ld bc, $3c
	ld a, $3
	call ByteFill
	ld a, $2
	ld [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	call DelayFrame
	ld a, $c
	ld [hBGMapAddress], a
	call DelayFrame
	call DelayFrame
	call DelayFrame
	xor a
	ld [hBGMapMode], a
	ld [hBGMapAddress], a
	ld [wc3c0], a
	xor a
	ld [wcf64], a
	call NextIntroScene
	ret

IntroScene10: ; e4c4f (39:4c4f)
; Wooper and Pichu enter.
	call Functione546d
	ld hl, wcf64
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
	ld a, SPRITE_ANIM_INDEX_27
	call _InitSpriteAnimStruct
	ld de, SFX_INTRO_PICHU
	call PlaySFX
	ret

.wooper
	depixel 22, 6
	ld a, SPRITE_ANIM_INDEX_28
	call _InitSpriteAnimStruct
	ld de, SFX_INTRO_PICHU
	call PlaySFX
	ret
.done
	call NextIntroScene
	ret

IntroScene11: ; e4c86 (39:4c86)
; Back to Unown again.
	call Functione54a3
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld [hLCDStatCustom], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap007
	debgcoord 0, 0
	call Functione54fa
	ld a, $0
	ld [rVBK], a
	ld hl, IntroUnownsGFX
	ld de, VTiles2 tile $00
	call Functione54c2
	ld hl, IntroTilemap008
	debgcoord 0, 0
	call Functione54fa
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_365ad
	ld de, wMapPals
	ld bc, $80
	call CopyBytes
	ld hl, Palette_365ad
	ld de, BGPals
	ld bc, $80
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
	callba Function8cf53
	call Functione549e
	xor a
	ld [wIntroSceneFrameCounter], a
	ld [wcf65], a
	call NextIntroScene
	ret

IntroScene12: ; e4cfa (39:4cfa)
; Even more Unown.
	call Functione4d36
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	inc [hl]
	cp $c0
	jr nc, .asm_e4d32
	cp $80
	jr nc, .asm_e4d1d
	ld c, a
	and $1f
	sla a
	ld [wcf65], a
	ld a, c
	and $e0
	srl a
	swap a
	call Functione5223
	ret
.asm_e4d1d
	ld c, a
	and $f
	sla a
	sla a
	ld [wcf65], a
	ld a, c
	and $70
	or $40
	swap a
	call Functione5223
	ret
.asm_e4d32
	call NextIntroScene
	ret

Functione4d36: ; e4d36 (39:4d36)
	ld a, [wIntroSceneFrameCounter]
	ld c, a
	ld hl, .UnownSounds
.loop
	ld a, [hli]
	cp -1
	ret z
	cp c
	jr z, .playsound
rept 2
	inc hl
endr
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
	db $ff
; e4d6d

IntroScene13: ; e4d6d (39:4d6d)
; Switch scenes again.
	call Functione54a3
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap003
	debgcoord 0, 0
	call Functione54fa
	ld a, $0
	ld [rVBK], a
	ld hl, IntroSuicuneRunGFX
	ld de, VTiles0 tile $00
	call Functione54de
	ld hl, IntroBackgroundGFX
	ld de, VTiles2 tile $00
	call Functione54c2
	ld hl, IntroTilemap004
	debgcoord 0, 0
	call Functione54fa
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_e5edd
	ld de, wMapPals
	ld bc, $80
	call CopyBytes
	ld hl, Palette_e5edd
	ld de, BGPals
	ld bc, $80
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
	callba Function8cf53
	depixel 13, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_26
	call _InitSpriteAnimStruct
	ld de, MUSIC_CRYSTAL_OPENING
	call PlayMusic
	xor a
	ld [wc3c0], a
	call Functione549e
	xor a
	ld [wcf64], a
	ld [wcf65], a
	call NextIntroScene
	ret

IntroScene14: ; e4dfa (39:4dfa)
; Suicune runs then jumps.
	ld a, [hSCX]
	sub 10
	ld [hSCX], a
	ld hl, wcf64
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
	ld [wcf65], a
	ld a, [wc3c0]
	cp $88
	jr c, .asm_e4e2c
	sub $8
	ld [wc3c0], a
	ret

.asm_e4e2c
	callba Function8d03d
	ret

.asm_e4e33
	ld a, [wc3c0]
	sub $2
	ld [wc3c0], a
	ret

.done
	call NextIntroScene
	ret

IntroScene15: ; e4e40 (39:4e40)
; Transition to a new scene.
	call Functione54a3
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap009
	debgcoord 0, 0
	call Functione54fa
	ld a, $0
	ld [rVBK], a
	ld hl, IntroSuicuneJumpGFX
	ld de, VTiles2 tile $00
	call Functione54c2
	ld hl, IntroUnownBackGFX
	ld de, VTiles0 tile $00
	call Functione54c2
	ld de, GFX_e7a5d
	ld hl, VTiles1 tile $00
	lb bc, BANK(GFX_e7a5d), 1
	call Request2bpp
	ld hl, IntroTilemap010
	debgcoord 0, 0
	call Functione54fa
	call Functione541b
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_e77dd
	ld de, wMapPals
	ld bc, $80
	call CopyBytes
	ld hl, Palette_e77dd
	ld de, BGPals
	ld bc, $80
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
	callba Function8cf53
	call Functione549e
	depixel 8, 5
	ld a, SPRITE_ANIM_INDEX_2A
	call _InitSpriteAnimStruct
	depixel 12, 0
	ld a, SPRITE_ANIM_INDEX_2B
	call _InitSpriteAnimStruct
	xor a
	ld [wcf64], a
	ld [wcf65], a
	call NextIntroScene
	ret

IntroScene16: ; e4edc (39:4edc)
; Suicune shows its face. An Unown appears in front.
	ld hl, wcf64
	ld a, [hl]
	inc [hl]
	cp $80
	jr nc, .done
	call Functione5441
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
	call Functione54a3
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap011
	debgcoord 0, 0
	call Functione54fa
	ld a, $0
	ld [rVBK], a
	ld hl, IntroSuicuneCloseGFX
	ld de, VTiles1 tile $00
	call Functione54de
	ld hl, IntroTilemap012
	debgcoord 0, 0
	call Functione54fa
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_e6d6d
	ld de, wMapPals
	ld bc, $80
	call CopyBytes
	ld hl, Palette_e6d6d
	ld de, BGPals
	ld bc, $80
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
	callba Function8cf53
	call Functione549e
	xor a
	ld [wcf64], a
	ld [wcf65], a
	call NextIntroScene
	ret

IntroScene18: ; e4f67 (39:4f67)
; Suicune close up.
	ld hl, wcf64
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
	call Functione54a3
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap013
	debgcoord 0, 0
	call Functione54fa
	ld a, $0
	ld [rVBK], a
	ld hl, IntroSuicuneBackGFX
	ld de, VTiles2 tile $00
	call Functione54c2
	ld hl, IntroUnownsGFX
	ld de, VTiles1 tile $00
	call Functione54c2
	ld de, GFX_e7a5d
	ld hl, VTiles1 tile $7f
	lb bc, BANK(GFX_e7a5d), 1
	call Request2bpp
	ld hl, IntroTilemap014
	debgcoord 0, 0
	call Functione54fa
	call Functione541b
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_e77dd
	ld de, wMapPals
	ld bc, $80
	call CopyBytes
	ld hl, Palette_e77dd
	ld de, BGPals
	ld bc, $80
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
	callba Function8cf53
	ld hl, wc300
	xor a
	ld [hli], a
	ld [hl], $7f
	call Functione549e
	depixel 12, 0
	ld a, SPRITE_ANIM_INDEX_2B
	call _InitSpriteAnimStruct
	xor a
	ld [wcf64], a
	ld [wcf65], a
	call NextIntroScene
	ret

IntroScene20: ; e5019 (39:5019)
; Suicune running away. A bunch of Unown appear.
	ld hl, wcf64
	ld a, [hl]
	inc [hl]
	cp $98
	jr nc, .asm_e5059
	cp $58
	ret nc
	cp $40
	jr nc, .asm_e5032
	cp $28
	ret nc
	ld a, [hSCY]
	inc a
	ld [hSCY], a
	ret

.asm_e5032
	sub $18
	ld c, a
	and $3
	cp $3
	ret nz
	ld a, c
	and $1c
	srl a
	srl a
	ld [wcf65], a
	xor a
	call Functione5348
	ret
; e5049 (39:5049)

	ld a, c
	and $1c
	srl a
	srl a
	ld [wcf65], a
	ld a, 1
	call Functione5348
	ret

.asm_e5059
	call NextIntroScene
	ret

IntroScene21: ; e505d (39:505d)
; Suicune gets more distant and turns black.
	call Functione5451
	ld c, 3
	call DelayFrames
	xor a
	ld [hBGMapMode], a
	ld [wcf64], a
	ld [wcf65], a
	call NextIntroScene
	ret

IntroScene22: ; e5072 (39:5072)
	ld hl, wcf64
	ld a, [hl]
	inc [hl]
	cp $8
	jr nc, .done
	ret
.done
	callba Function8d03d
	call NextIntroScene
	ret

IntroScene23: ; e5086 (39:5086)
	xor a
	ld [wcf64], a
	call NextIntroScene
	ret

IntroScene24: ; e508e (39:508e)
; Fade to white.
	ld hl, wcf64
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
	call Functione5172
	ret

.done
	ld a, $40
	ld [wcf64], a
	call NextIntroScene
	ret

IntroScene25: ; e50ad (39:50ad)
; Wait around a bit.
	ld a, [wcf64]
	dec a
	jr z, .done
	ld [wcf64], a
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
	call Functione54fa
	ld a, $0
	ld [rVBK], a
	ld hl, IntroCrystalUnownsGFX
	ld de, VTiles2 tile $00
	call Functione54c2
	ld hl, IntroTilemap017
	debgcoord 0, 0
	call Functione54fa
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_e679d
	ld de, wMapPals
	ld bc, $80
	call CopyBytes
	ld hl, Palette_e679d
	ld de, BGPals
	ld bc, $80
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
	callba Function8cf53
	call Functione549e
	xor a
	ld [wcf64], a
	ld [wcf65], a
	call NextIntroScene
	ret

IntroScene27: ; e512d (39:512d)
; Spell out C R Y S T A L with Unown.
	ld hl, wcf65
	inc [hl]
	ld hl, wcf64
	ld a, [hl]
	inc [hl]
	cp $80
	jr nc, .done

	ld c, a
	and $f
	ld [wcf65], a
	ld a, c
	and $70
	swap a
	call Functione539d
	ret

.done
	call NextIntroScene
	ld a, $80
	ld [wcf64], a
	ret

IntroScene28: ; e5152 (39:5152)
; Cut out when the music ends, and lead into the title screen.
	ld hl, wcf64
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


Functione5172: ; e5172 (39:5172)
	ld hl, Unknown_e519c
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld de, BGPals
	ld b, $8
.asm_e5187
	push hl
	ld c, $8
.asm_e518a
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_e518a
	pop hl
	dec b
	jr nz, .asm_e5187
	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; e519c (39:519c)

Unknown_e519c: ; e519c
; Fade to white.
	RGB 24, 12, 09
	RGB 31, 31, 31
	RGB 12, 00, 31
	RGB 00, 00, 00

	RGB 31, 19, 05
	RGB 31, 31, 31
	RGB 15, 05, 31
	RGB 07, 07, 07

	RGB 31, 21, 09
	RGB 31, 31, 31
	RGB 18, 09, 31
	RGB 11, 11, 11

	RGB 31, 23, 13
	RGB 31, 31, 31
	RGB 21, 13, 31
	RGB 15, 15, 15

	RGB 31, 25, 17
	RGB 31, 31, 31
	RGB 25, 17, 31
	RGB 19, 19, 19

	RGB 31, 27, 21
	RGB 31, 31, 31
	RGB 27, 21, 31
	RGB 23, 23, 23

	RGB 31, 29, 25
	RGB 31, 31, 31
	RGB 29, 26, 31
	RGB 27, 27, 27

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
; e51dc

Functione51dc: ; e51dc (39:51dc)
	push de
	ld a, SPRITE_ANIM_INDEX_29
	call _InitSpriteAnimStruct
	ld hl, $c
	add hl, bc
	ld [hl], $8
	ld a, $3c
	call Function3b3c
	pop de

	push de
	ld a, SPRITE_ANIM_INDEX_29
	call _InitSpriteAnimStruct
	ld hl, $c
	add hl, bc
	ld [hl], $18
	ld a, $3b
	call Function3b3c
	pop de

	push de
	ld a, SPRITE_ANIM_INDEX_29
	call _InitSpriteAnimStruct
	ld hl, $c
	add hl, bc
	ld [hl], $28
	ld a, $39
	call Function3b3c
	pop de

	ld a, SPRITE_ANIM_INDEX_29
	call _InitSpriteAnimStruct
	ld hl, $c
	add hl, bc
	ld [hl], $38
	ld a, $3a
	call Function3b3c
	ret

Functione5223: ; e5223 (39:5223)
rept 3
	add a
endr
	ld e, a
	ld d, $0
	ld hl, BGPals
	add hl, de
rept 2
	inc hl
endr
	ld a, [wcf65]
	and $3f
	cp $1f
	jr z, .asm_e523e
	jr c, .asm_e523e
	ld c, a
	ld a, $3f
	sub c
.asm_e523e
	ld c, a
	ld b, $0
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	push hl
	push bc
	ld hl, BGPals
	ld bc, $40
	xor a
	call ByteFill
	pop bc
	pop hl
	push hl
	ld hl, Unknown_e5288
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	push hl
	ld hl, Unknown_e52c8
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	push hl
	ld hl, Unknown_e5308
rept 2
	add hl, bc
endr
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

Unknown_e5288: ; e5288
; Fade between black and white.
hue = 0
rept 32
	RGB hue, hue, hue
hue = hue + 1
endr
; e52c8

Unknown_e52c8: ; e52c8
; Fade between black and light blue.
hue = 0
rept 32
	RGB 0, hue / 2, hue
hue = hue + 1
endr
; e5308

Unknown_e5308: ; e5308
; Fade between black and blue.
hue = 0
rept 32
	RGB 0, 0, hue
hue = hue + 1
endr
; e5348

Functione5348: ; e5348 (39:5348)
	and a
	jr nz, .asm_e5350
	ld hl, Palette_e538d
	jr .asm_e5353
.asm_e5350
	ld hl, Palette_e5395
.asm_e5353
	ld a, [wcf65]
	and $7
rept 3
	add a
endr
	ld c, a
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	push bc
	ld de, BGPals
	ld a, c
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld bc, $8
	call CopyBytes
	pop bc
	ld de, wMapPals
	ld a, c
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld bc, $8
	call CopyBytes
	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; e538d (39:538d)

Palette_e538d: ; e538d
	RGB 24, 12, 09
	RGB 31, 31, 31
	RGB 12, 00, 31
	RGB 00, 00, 00
; e5395

Palette_e5395: ; e5395
	RGB 24, 12, 09
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
; e539d

Functione539d: ; e539d (39:539d)
rept 3
	add a
endr
	ld e, a
	ld d, $0
	ld hl, BGPals
	add hl, de
rept 4
	inc hl
endr
	ld a, [wcf65]
	add a
	ld c, a
	ld b, $0
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	push hl
	ld hl, Palette_e53db
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
	ld hl, Palette_e53fb
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

Palette_e53db: ; e53db
hue = 31
rept 8
	RGB hue, hue, hue
hue = hue + -1
	RGB hue, hue, hue
hue = hue + -2
endr
; e53fb

Palette_e53fb: ; e53fb
hue = 31
rept 16
	RGB hue, hue, hue
hue = hue + -1
endr
; e541b

Functione541b: ; e541b (39:541b)
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a
	ld hl, w6_d000
	decoord 0, 0
	ld b, SCREEN_HEIGHT
.asm_e542a
	ld c, SCREEN_WIDTH
.asm_e542c
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_e542c
	ld a, $c
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	dec b
	jr nz, .asm_e542a
	pop af
	ld [rSVBK], a
	ret

Functione5441: ; e5441 (39:5441)
	ld a, [wcf64]
	and $3
	jr z, Functione5451
	cp $3
	jr z, .asm_e544d
	ret
.asm_e544d
	xor a
	ld [hBGMapMode], a
	ret

Functione5451: ; e5451 (39:5451)
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
.asm_e5457
	ld a, [hl]
	and a
	jr z, .asm_e5462
	cp $80
	jr nc, .asm_e5462
	xor $8
	ld [hl], a
.asm_e5462
	inc hl
	dec bc
	ld a, c
	or b
	jr nz, .asm_e5457
	ld a, $1
	ld [hBGMapMode], a
	ret

Functione546d: ; e546d (39:546d)
	ld a, [wcf64]
	cp $24
	ret nc
	and $c
	srl a
	ld e, a
	ld d, $0
	ld hl, Unknown_e5496
	add hl, de
	ld a, [hli]
	ld [Requested2bppSource], a
	ld a, [hli]
	ld [Requested2bppSource + 1], a
	ld a, (VTiles2 tile $09) % $100
	ld [Requested2bppDest], a
	ld a, (VTiles2 tile $09) / $100
	ld [Requested2bppDest + 1], a
	ld a, $4
	ld [Requested2bpp], a
	ret
; e5496 (39:5496)

Unknown_e5496: ; e5496
	dw GFX_e799d
	dw GFX_e79dd
	dw GFX_e7a1d
	dw GFX_e79dd
; e549e

Functione549e: ; e549e (39:549e)
	ld a, $1
	ld [hCGBPalUpdate], a
	ret

Functione54a3: ; e54a3 (39:54a3)
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, BGPals
	ld bc, $80
	xor a
	call ByteFill
	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	call DelayFrame
	call DelayFrame
	ret

Functione54c2: ; e54c2 (39:54c2)
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a
	push de
	ld de, w6_d000
	call Decompress
	pop hl
	ld de, w6_d000
	ld bc, $180
	call Request2bpp
	pop af
	ld [rSVBK], a
	ret

Functione54de: ; e54de (39:54de)
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a
	push de
	ld de, w6_d000
	call Decompress
	pop hl
	ld de, w6_d000
	ld bc, $1ff
	call Request2bpp
	pop af
	ld [rSVBK], a
	ret

Functione54fa: ; e54fa (39:54fa)
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a
	push de
	ld de, w6_d000
	call Decompress
	pop hl
	ld de, w6_d000
	ld bc, $140
	call Request2bpp
	pop af
	ld [rSVBK], a
	ret

Functione5516: ; e5516 (39:5516)
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, LYOverrides
	ld bc, $90
	xor a
	call ByteFill
	pop af
	ld [rSVBK], a
	ld a, $43
	ld [hLCDStatCustom], a
	ret

Functione552f: ; e552f (39:552f)
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld a, [wcf64]
	and $1
	jr z, .asm_e5548
	ld hl, LYOverrides
	ld a, [hl]
	inc a
	ld bc, $5f
	call ByteFill
.asm_e5548
	ld hl, LYOverrides + $5f
	ld a, [hl]
rept 2
	inc a
endr
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
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB  0,  4,  5
	RGB  1,  8,  5
	RGB  4, 12,  9
	RGB 24, 12,  9
	RGB  0,  4,  5
	RGB  9,  6,  8
	RGB  8, 16,  5
	RGB  5, 10,  4
	RGB 31, 31, 31
	RGB  9,  6,  8
	RGB 18,  9,  9
	RGB 13,  8,  9
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB  2,  5, 22
	RGB  1,  5, 12
	RGB 31, 31, 31
	RGB 31, 10, 25
	RGB 31, 21,  0
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 21, 31
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0

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
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 10,  0, 10
	RGB 19,  0, 19
	RGB 31,  0, 31
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0

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
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0

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
	RGB 24, 12,  9
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 24, 12,  9
	RGB 31, 31, 31
	RGB  8,  9, 31
	RGB  0,  0,  0
	RGB 24, 12,  9
	RGB 12, 20, 31
	RGB 19,  8, 31
	RGB  0,  0,  0
	RGB 12, 20, 31
	RGB  8,  9, 31
	RGB 19,  8, 31
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 12, 20, 31
	RGB  8,  9, 31
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0

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
	RGB 24, 12,  9
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 24, 12,  9
	RGB 31, 31, 31
	RGB  8,  9, 31
	RGB  0,  0,  0
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 12,  0, 31
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 21,  9,  0
	RGB 21,  9,  0
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0

IntroUnownBackGFX: ; e785d
INCBIN "gfx/intro/unown_back.2bpp.lz"
; e799d

GFX_e799d: ; e799d
INCBIN "gfx/unknown/0e799d.2bpp"
GFX_e79dd: ; e79dd
INCBIN "gfx/unknown/0e79dd.2bpp"
GFX_e7a1d: ; e7a1d
INCBIN "gfx/unknown/0e7a1d.2bpp"

GFX_e7a5d: ; e7a5d
INCBIN "gfx/unknown/0e7a5d.2bpp"


