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

	ld a, [Buffer4]
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
	call .GetSGBLayout
	ld a, [Buffer1]
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	call .PlaceFrontpic

	ld de, VTiles2
	ld hl, VTiles2 tile $31
	ld bc, $31
	call Request2bpp

	ld a, $31
	ld [wd1ec], a
	call .ReplaceFrontpic
	ld a, [Buffer2]
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	call .LoadFrontpic
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
	call .GetSGBLayout
	call .AnimationSequence
	jr c, .cancel_evo

	ld a, -7 * 7
	ld [wd1ec], a

	call .ReplaceFrontpic
	xor a
	ld [Buffer4], a

	ld a, [Buffer2]
	ld [PlayerHPPal], a

	ld c, $0
	call .GetSGBLayout
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

.cancel_evo
	ld a, $1
	ld [Buffer4], a

	ld a, [Buffer1]
	ld [PlayerHPPal], a

	ld c, $0
	call .GetSGBLayout
	call Function4e7a6
	callba Function8cf53
	call Function4e794
	ret c

	ld a, [PlayerHPPal]
	call PlayCry
	ret
; 4e703

.GetSGBLayout: ; 4e703
	ld b, SCGB_0B
	jp GetSGBLayout
; 4e708

.PlaceFrontpic: ; 4e708
	call GetBaseData
	hlcoord 7, 2
	jp PrepMonFrontpic
; 4e711

.LoadFrontpic: ; 4e711
	call GetBaseData
	ld a, $1
	ld [wc2c6], a
	ld de, VTiles2
	predef FrontpicPredef
	xor a
	ld [wc2c6], a
	ret
; 4e726

.AnimationSequence: ; 4e726
	call ClearJoypad
	lb bc, 1, 2 * 7 ; flash b times, wait c frames in between
.loop
	push bc
	call .WaitFrames_CheckPressedB
	pop bc
	jr c, .exit_sequence
	push bc
	call .Flash
	pop bc
	inc b
rept 2
	dec c
endr
	jr nz, .loop
	and a
	ret

.exit_sequence
	scf
	ret
; 4e741

.Flash: ; 4e741
	ld a, -7 * 7 ; new stage
	ld [wd1ec], a
	call .ReplaceFrontpic
	ld a, 7 * 7 ; previous stage
	ld [wd1ec], a
	call .ReplaceFrontpic
	dec b
	jr nz, .Flash
	ret
; 4e755

.ReplaceFrontpic: ; 4e755
	push bc
	xor a
	ld [hBGMapMode], a
	hlcoord 7, 2
	lb bc, 7, 7
	ld de, SCREEN_WIDTH - 7
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

.WaitFrames_CheckPressedB: ; 4e779
	call DelayFrame
	push bc
	call JoyTextDelay
	ld a, [hJoyDown]
	pop bc
	and B_BUTTON
	jr nz, .pressed_b
.loop3
	dec c
	jr nz, .WaitFrames_CheckPressedB
	and a
	ret

.pressed_b
	ld a, [wForceEvolution]
	and a
	jr nz, .loop3
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
	ld a, [Buffer4]
	and a
	ret nz
	ld de, SFX_EVOLVED
	call PlaySFX
	ld hl, wJumptableIndex
	ld a, [hl]
	push af
	ld [hl], $0
.loop
	call Function4e7cf
	jr nc, .done
	call Function4e80c
	jr .loop

.done
	ld c, 32
.loop2
	call Function4e80c
	dec c
	jr nz, .loop2
	pop af
	ld [wJumptableIndex], a
	ret
; 4e7cf

Function4e7cf: ; 4e7cf
	ld hl, wJumptableIndex
	ld a, [hl]
	cp 32
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
	depixel 9, 11
	ld a, SPRITE_ANIM_INDEX_13
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
	callab PlaySpriteAnimations
	; a = (([hVBlankCounter] + 4) / 2) % NUM_PALETTES
	ld a, [hVBlankCounter]
	and $e
	srl a
rept 2
	inc a
endr
	and $7
	ld b, a
	ld hl, Sprites + 3 ; attributes
	ld c, 40
.loop
	ld a, [hl]
	or b
	ld [hli], a
rept 3
	inc hl
endr
	dec c
	jr nz, .loop
	pop bc
	call DelayFrame
	ret
; 4e831


EvolutionGFX:
INCBIN "gfx/evo/bubble_large.2bpp"
INCBIN "gfx/evo/bubble.2bpp"
