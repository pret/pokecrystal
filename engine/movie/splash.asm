Copyright_GameFreakPresents:
; Play the copyright screen and GameFreak Presents sequence.
; Return carry if user cancels animation by pressing a button.

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
	callfar Copyright
	call WaitBGMap
	ld c, 100
	call DelayFrames
	call ClearTilemap
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
	call ClearTilemap
	call ClearSprites
	ld c, 16
	call DelayFrames
	ret

PlaceGameFreakPresents:
	jumptable .scenes, wJumptableIndex

.scenes
	dw GameFreakPresentsScene0
	dw GameFreakPresentsScene1
	dw GameFreakPresentsScene2
	dw GameFreakPresentsScene3

PlaceGameFreakPresents_NextScene:
	ld hl, wJumptableIndex
	inc [hl]
	ret

GameFreakPresentsScene0:
	ret

GameFreakPresentsScene1:
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
	call PlaceGameFreakPresents_NextScene
	ld de, SFX_GAME_FREAK_PRESENTS
	call PlaySFX
	ret

.GAME_FREAK:
	;  G  A  M  E   _  F  R  E  A  K
	db 0, 1, 2, 3, 13, 4, 5, 3, 1, 6
.end
	db "@"

GameFreakPresentsScene2:
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
	call PlaceGameFreakPresents_NextScene
	ret

.presents
	db 7, 8, 9, 10, 11, 12
.end
	db "@"

GameFreakPresentsScene3:
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

PlaceGameFreakLogo:
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

.asm_e47a3
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	call PlaceGameFreakPresents_NextScene
GameFreakLogoScene5:
	ret

GameFreakDittoPaletteFade:
INCLUDE "gfx/splash/ditto_fade.pal"

GameFreakLogoGFX:
INCBIN "gfx/splash/gamefreak_presents.1bpp"
INCBIN "gfx/splash/gamefreak_logo.1bpp"
