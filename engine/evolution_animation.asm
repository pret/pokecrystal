EvolutionAnimation: ; 4e5e1
	push hl
	push de
	push bc
	ld a, [CurSpecies]
	push af
	ld a, [rOBP0]
	push af
	ld a, [BaseDexNo]
	push af

	call _EvolutionAnimation

	pop af
	ld [BaseDexNo], a
	pop af
	ld [rOBP0], a
	pop af
	ld [CurSpecies], a
	pop bc
	pop de
	pop hl

	ld a, [wd1ed]
	and a
	ret z

	scf
	ret
; 4e607

_EvolutionAnimation: ; 4e607
	ld a, $e4
	ld [rOBP0], a

	ld de, MUSIC_NONE
	call PlayMusic

	callba Function8cf53

	ld de, EvolutionGFX
	ld hl, VTiles0
	lb bc, BANK(EvolutionGFX), 8
	call Request2bpp

	xor a
	ld [Danger], a
	call WaitBGMap
	xor a
	ld [hBGMapMode], a
	ld a, [Buffer1]
	ld [PlayerHPPal], a

	ld c, $0
	call Function4e703
	ld a, [Buffer1]
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	call Function4e708

	ld de, VTiles2
	ld hl, VTiles2 tile $31
	ld bc, $31
	call Request2bpp

	ld a, $31
	ld [wd1ec], a
	call Evolution_FlashFrontpics
	ld a, [Buffer2]
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	call Function4e711
	ld a, [Buffer1]
	ld [CurPartySpecies], a
	ld [CurSpecies], a

	ld a, $1
	ld [hBGMapMode], a
	call Function4e794
	jr c, .skip_cry

	ld a, [Buffer1]
	call PlayCry

.skip_cry
	ld de, MUSIC_EVOLUTION
	call PlayMusic

	ld c, 80
	call DelayFrames

	ld c, $1
	call Function4e703
	call Function4e726
	jr c, .pressed_b

	ld a, $cf
	ld [wd1ec], a

	call Evolution_FlashFrontpics
	xor a
	ld [wd1ed], a

	ld a, [Buffer2]
	ld [PlayerHPPal], a

	ld c, $0
	call Function4e703
	call Function4e7a6
	callba Function8cf53
	call Function4e794
	jr c, .asm_4e6de

	ld a, [wc2c6]
	push af
	ld a, $1
	ld [wc2c6], a
	ld a, [CurPartySpecies]
	push af

	ld a, [PlayerHPPal]
	ld [CurPartySpecies], a
	hlcoord 7, 2
	ld d, $0
	ld e, ANIM_MON_EVOLVE
	predef AnimateFrontpic

	pop af
	ld [CurPartySpecies], a
	pop af
	ld [wc2c6], a
	ret

.asm_4e6de
	ret

.pressed_b
	ld a, $1
	ld [wd1ed], a

	ld a, [Buffer1]
	ld [PlayerHPPal], a

	ld c, $0
	call Function4e703
	call Function4e7a6
	callba Function8cf53
	call Function4e794
	ret c

	ld a, [PlayerHPPal]
	call PlayCry
	ret
; 4e703

Function4e703: ; 4e703
	ld b, $b
	jp GetSGBLayout
; 4e708

Function4e708: ; 4e708
	call GetBaseData
	hlcoord 7, 2
	jp PrepMonFrontpic
; 4e711

Function4e711: ; 4e711
	call GetBaseData
	ld a, $1
	ld [wc2c6], a
	ld de, VTiles2
	predef Function5108b
	xor a
	ld [wc2c6], a
	ret
; 4e726

Function4e726: ; 4e726
	call ClearJoypad
	lb bc, 1, 14
.loop
	push bc
	call Evolution_CheckPressedB
	pop bc
	jr c, .pressed_b
	push bc
	call Evolution_NextFrame
	pop bc
	inc b
rept 2
	dec c
endr
	jr nz, .loop
	and a
	ret

.pressed_b
	scf
	ret
; 4e741

Evolution_NextFrame: ; 4e741
.loop
	ld a, -49
	ld [wd1ec], a
	call Evolution_FlashFrontpics
	ld a, 49
	ld [wd1ec], a
	call Evolution_FlashFrontpics
	dec b
	jr nz, .loop
	ret
; 4e755

Evolution_FlashFrontpics: ; 4e755
	push bc
	xor a
	ld [hBGMapMode], a
	hlcoord 7, 2
	lb bc, 7, 7
	ld de, $d
.loop1
	push bc
.loop2
	ld a, [wd1ec]
	add [hl]
	ld [hli], a
	dec c
	jr nz, .loop2
	pop bc
	add hl, de
	dec b
	jr nz, .loop1
	ld a, $1
	ld [hBGMapMode], a
	call WaitBGMap
	pop bc
	ret
; 4e779

Evolution_CheckPressedB: ; 4e779
.loop
	call DelayFrame
	push bc
	call JoyTextDelay
	ld a, [hJoyDown]
	pop bc
	and B_BUTTON
	jr nz, .pressed_b
.loop2
	dec c
	jr nz, .loop
	and a
	ret

.pressed_b
	ld a, [wd1e9]
	and a
	jr nz, .loop2
	scf
	ret
; 4e794

Function4e794: ; 4e794
	ld a, [CurPartyMon]
	ld hl, PartyMon1Species
	call GetPartyLocation
	ld b, h
	ld c, l
	callba CheckFaintedFrzSlp
	ret
; 4e7a6

Function4e7a6: ; 4e7a6
	ld a, [wd1ed]
	and a
	ret nz
	ld de, SFX_EVOLVED
	call PlaySFX
	ld hl, wJumptableIndex
	ld a, [hl]
	push af
	ld [hl], $0
.asm_4e7b8
	call Function4e7cf
	jr nc, .asm_4e7c2
	call Function4e80c
	jr .asm_4e7b8

.asm_4e7c2
	ld c, $20
.asm_4e7c4
	call Function4e80c
	dec c
	jr nz, .asm_4e7c4
	pop af
	ld [wJumptableIndex], a
	ret
; 4e7cf

Function4e7cf: ; 4e7cf
	ld hl, wJumptableIndex
	ld a, [hl]
	cp $20
	ret nc
	ld d, a
	inc [hl]
	and $1
	jr nz, .asm_4e7e6
	ld e, $0
	call Function4e7e8
	ld e, $10
	call Function4e7e8

.asm_4e7e6
	scf
	ret
; 4e7e8

Function4e7e8: ; 4e7e8
	push de
	ld de, $4858
	ld a, $13
	call _InitSpriteAnimStruct
	ld hl, $b
	add hl, bc
	ld a, [wJumptableIndex]
	and $e
	sla a
	pop de
	add e
	ld [hl], a
	ld hl, $3
	add hl, bc
	ld [hl], $0
	ld hl, $c
	add hl, bc
	ld [hl], $10
	ret
; 4e80c

Function4e80c: ; 4e80c
	push bc
	callab Function8cf69
	ld a, [hVBlankCounter]
	and $e
	srl a
rept 2
	inc a
endr
	and $7
	ld b, a
	ld hl, Sprites + 3
	ld c, $28
.asm_4e823
	ld a, [hl]
	or b
	ld [hli], a
rept 3
	inc hl
endr
	dec c
	jr nz, .asm_4e823
	pop bc
	call DelayFrame
	ret
; 4e831


EvolutionGFX:
INCBIN "gfx/evo/bubble_large.2bpp"
INCBIN "gfx/evo/bubble.2bpp"

Function4e881: ; 4e881
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	call LoadStandardFont
	call LoadFontsBattleExtra
	hlbgcoord 0, 0
	ld bc, VBGMap1 - VBGMap0
	ld a, " "
	call ByteFill
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	call ByteFill
	xor a
	ld [hSCY], a
	ld [hSCX], a
	call EnableLCD
	ld hl, UnknownText_0x4e8bd
	call PrintText
	call Function3200
	call SetPalettes
	ret
; 4e8bd

UnknownText_0x4e8bd: ; 0x4e8bd
	; SAVING RECORD… DON'T TURN OFF!
	text_jump UnknownText_0x1bd39e
	db "@"
; 0x4e8c2


Function4e8c2: ; 4e8c2
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	call LoadStandardFont
	call LoadFontsBattleExtra
	hlbgcoord 0, 0
	ld bc, VBGMap1 - VBGMap0
	ld a, " "
	call ByteFill
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	call ByteFill
	ld hl, wd000
	ld c, $40
.asm_4e8ee
	ld a, -1
	ld [hli], a
	ld a, " "
	ld [hli], a
	dec c
	jr nz, .asm_4e8ee
	xor a
	ld [hSCY], a
	ld [hSCX], a
	call EnableLCD
	call Function3200
	call SetPalettes
	ret
; 4e906

Function4e906: ; 4e906
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a
	ld hl, w6_d000
	ld bc, w6_d400 - w6_d000
	ld a, " "
	call ByteFill
	hlbgcoord 0, 0
	ld de, w6_d000
	ld b, $0
	ld c, $40
	call Request2bpp
	pop af
	ld [rSVBK], a
	ret
; 4e929
