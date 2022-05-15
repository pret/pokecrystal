SplashScreen:
; Play the copyright screen and GameFreak Presents sequence.
; Return carry if user cancels animation by pressing a button.

; Reinitialize everything
	ld de, MUSIC_NONE
	call PlayMusic
	call ClearBGPalettes
	call ClearTilemap
	ld a, HIGH(vBGMap0)
	ldh [hBGMapAddress + 1], a
	xor a ; LOW(vBGMap0)
	ldh [hBGMapAddress], a
	ldh [hJoyDown], a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a
	call WaitBGMap
	ld b, SCGB_GAMEFREAK_LOGO
	call GetSGBLayout
	call SetPalettes
	ld c, 10
	call DelayFrames

; Draw copyright screen
	callfar Copyright
	call WaitBGMap
	ld c, 100
	call DelayFrames
	call ClearTilemap

; Stop here if not in GBC mode
	farcall GBCOnlyScreen

; Play GameFreak logo animation
	call GameFreakPresentsInit
.joy_loop
	call JoyTextDelay
	ldh a, [hJoyLast]
	and BUTTONS
	jr nz, .pressed_button
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .finish
	call GameFreakPresentsScene
	farcall PlaySpriteAnimations
	call DelayFrame
	jr .joy_loop

.pressed_button
	call GameFreakPresentsEnd
	scf
	ret

.finish
	call GameFreakPresentsEnd
	and a
	ret

GameFreakPresentsInit:
	ld de, GameFreakLogoGFX
	ld hl, vTiles2
	lb bc, BANK(GameFreakLogoGFX), 28
	call Get1bpp

	ldh a, [rSVBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rSVBK], a

	ld hl, GameFreakDittoGFX
	ld de, wDecompressScratch
	ld a, BANK(GameFreakDittoGFX)
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
	call InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], 160
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], 96
	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], 48
	xor a
	ld [wJumptableIndex], a
	ld [wIntroSceneFrameCounter], a
	ld [wIntroSceneTimer], a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, 1
	ldh [hBGMapMode], a
	ld a, 144
	ldh [hWY], a
	lb de, %11100100, %11100100
	call DmgToCgbObjPals
	ret

GameFreakPresentsEnd:
	farcall ClearSpriteAnims
	call ClearTilemap
	call ClearSprites
	ld c, 16
	call DelayFrames
	ret

GameFreakPresentsScene:
	jumptable .scenes, wJumptableIndex

.scenes
	dw GameFreakPresents_WaitSpriteAnim
	dw GameFreakPresents_PlaceGameFreak
	dw GameFreakPresents_PlacePresents
	dw GameFreakPresents_WaitForTimer

GameFreakPresents_NextScene:
	ld hl, wJumptableIndex
	inc [hl]
	ret

GameFreakPresents_WaitSpriteAnim:
	ret

GameFreakPresents_PlaceGameFreak:
	ld hl, wIntroSceneTimer
	ld a, [hl]
	cp 32
	jr nc, .PlaceGameFreak
	inc [hl]
	ret

.PlaceGameFreak:
	ld [hl], 0
	ld hl, .game_freak
	decoord 5, 10
	ld bc, .end - .game_freak
	call CopyBytes
	call GameFreakPresents_NextScene
	ld de, SFX_GAME_FREAK_PRESENTS
	call PlaySFX
	ret

.game_freak
	db $00, $01, $02, $03, $0d, $04, $05, $03, $01, $06
.end
	db "@"

GameFreakPresents_PlacePresents:
	ld hl, wIntroSceneTimer
	ld a, [hl]
	cp 64
	jr nc, .place_presents
	inc [hl]
	ret

.place_presents
	ld [hl], 0
	ld hl, .presents
	decoord 7, 11
	ld bc, .end - .presents
	call CopyBytes
	call GameFreakPresents_NextScene
	ret

.presents
	db $07, $08, $09, $0a, $0b, $0c
.end
	db "@"

GameFreakPresents_WaitForTimer:
	ld hl, wIntroSceneTimer
	ld a, [hl]
	cp 128
	jr nc, .finish
	inc [hl]
	ret

.finish
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

GameFreakLogoSpriteAnim:
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, .scenes
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.scenes:
	dw GameFreakLogo_Init
	dw GameFreakLogo_Bounce
	dw GameFreakLogo_Ditto
	dw GameFreakLogo_Transform
	dw GameFreakLogo_Done

GameFreakLogo_Init:
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ret

GameFreakLogo_Bounce:
; Bounce with a height of 0C, 0C / 48 times.
; By default, this is twice, with a height of 96 pixels and 48 pixels.
; Sine offset starts at 48 (32+32/2, or pi+pi/2), so it starts at the maximum
; value of the sine wave (i.e. the top of the screen).

	ld hl, SPRITEANIMSTRUCT_VAR1 ; jump height
	add hl, bc
	ld a, [hl]
	and a
	jr z, .done

; Load the sine offset, make sure it doesn't reach the negative part of the wave
	ld d, a
	ld hl, SPRITEANIMSTRUCT_VAR2 ; sine offset
	add hl, bc
	ld a, [hl]
	and $3f ; full circle = 2*pi = 2*32
	cp 32
	jr nc, .no_negative
	add 32
.no_negative

	ld e, a
	farcall BattleAnim_Sine_e ; e = d * sin(e * pi/32)
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], e

; Decrement the sine offset
	ld hl, SPRITEANIMSTRUCT_VAR2 ; sine offset
	add hl, bc
	ld a, [hl]
	dec [hl]
	and $1f ; a%32 == 0
	ret nz

; If the ditto's reached the ground, decrement the jump height and play the sfx
	ld hl, SPRITEANIMSTRUCT_VAR1 ; jump height
	add hl, bc
	ld a, [hl]
	sub 48
	ld [hl], a
	ld de, SFX_DITTO_BOUNCE
	call PlaySFX
	ret

.done
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], 0
	ld de, SFX_DITTO_POP_UP
	call PlaySFX
	ret

GameFreakLogo_Ditto:
; Wait a little, then start transforming
	ld hl, SPRITEANIMSTRUCT_VAR2 ; frame count
	add hl, bc
	ld a, [hl]
	cp 32
	jr nc, .start_transform
	inc [hl]
	ret

.start_transform
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], 0
	ld de, SFX_DITTO_TRANSFORM
	call PlaySFX
	ret

GameFreakLogo_Transform:
	ld hl, SPRITEANIMSTRUCT_VAR2 ; frame count
	add hl, bc
	ld a, [hl]
	cp 64
	jr z, .done
	inc [hl]

; Fade ditto's palettes while it's transforming
	srl a
	srl a
	ld e, a
	ld d, 0
	ld hl, GameFreakDittoPaletteFade
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
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

.done
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	call GameFreakPresents_NextScene
GameFreakLogo_Done:
	ret

GameFreakDittoPaletteFade:
INCLUDE "gfx/splash/ditto_fade.pal"

GameFreakLogoGFX:
INCBIN "gfx/splash/gamefreak_presents.1bpp"
INCBIN "gfx/splash/gamefreak_logo.1bpp"
