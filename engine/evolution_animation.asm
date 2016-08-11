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

	call .EvolutionAnimation

	pop af
	ld [BaseDexNo], a
	pop af
	ld [rOBP0], a
	pop af
	ld [CurSpecies], a
	pop bc
	pop de
	pop hl

	ld a, [wEvolutionCanceled]
	and a
	ret z

	scf
	ret
; 4e607

.EvolutionAnimation: ; 4e607
	ld a, %11100100
	ld [rOBP0], a

	ld de, MUSIC_NONE
	call PlayMusic

	callba ClearSpriteAnims

	ld de, .GFX
	ld hl, VTiles0
	lb bc, BANK(.GFX), 8
	call Request2bpp

	xor a
	ld [Danger], a
	call WaitBGMap
	xor a
	ld [hBGMapMode], a
	ld a, [wEvolutionOldSpecies]
	ld [PlayerHPPal], a

	ld c, $0
	call .GetSGBLayout
	ld a, [wEvolutionOldSpecies]
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	call .PlaceFrontpic

	ld de, VTiles2
	ld hl, VTiles2 tile $31
	ld bc, 7 * 7
	call Request2bpp

	ld a, 7 * 7
	ld [wEvolutionPicOffset], a
	call .ReplaceFrontpic
	ld a, [wEvolutionNewSpecies]
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	call .LoadFrontpic
	ld a, [wEvolutionOldSpecies]
	ld [CurPartySpecies], a
	ld [CurSpecies], a

	ld a, $1
	ld [hBGMapMode], a
	call .check_statused
	jr c, .skip_cry

	ld a, [wEvolutionOldSpecies]
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
	ld [wEvolutionPicOffset], a
	call .ReplaceFrontpic
	xor a
	ld [wEvolutionCanceled], a

	ld a, [wEvolutionNewSpecies]
	ld [PlayerHPPal], a

	ld c, $0
	call .GetSGBLayout
	call .PlayEvolvedSFX
	callba ClearSpriteAnims
	call .check_statused
	jr c, .no_anim

	ld a, [wBoxAlignment]
	push af
	ld a, $1
	ld [wBoxAlignment], a
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
	ld [wBoxAlignment], a
	ret

.no_anim
	ret

.cancel_evo
	ld a, $1
	ld [wEvolutionCanceled], a

	ld a, [wEvolutionOldSpecies]
	ld [PlayerHPPal], a

	ld c, $0
	call .GetSGBLayout
	call .PlayEvolvedSFX
	callba ClearSpriteAnims
	call .check_statused
	ret c

	ld a, [PlayerHPPal]
	call PlayCry
	ret
; 4e703

.GetSGBLayout: ; 4e703
	ld b, SCGB_EVOLUTION
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
	ld [wBoxAlignment], a
	ld de, VTiles2
	predef FrontpicPredef
	xor a
	ld [wBoxAlignment], a
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
	dec c
	dec c
	jr nz, .loop
	and a
	ret

.exit_sequence
	scf
	ret
; 4e741

.Flash: ; 4e741
	ld a, -7 * 7 ; new stage
	ld [wEvolutionPicOffset], a
	call .ReplaceFrontpic
	ld a, 7 * 7 ; previous stage
	ld [wEvolutionPicOffset], a
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
	ld a, [wEvolutionPicOffset]
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

.check_statused ; 4e794
	ld a, [CurPartyMon]
	ld hl, PartyMon1Species
	call GetPartyLocation
	ld b, h
	ld c, l
	callba CheckFaintedFrzSlp
	ret
; 4e7a6

.PlayEvolvedSFX: ; 4e7a6
	ld a, [wEvolutionCanceled]
	and a
	ret nz
	ld de, SFX_EVOLVED
	call PlaySFX
	ld hl, wJumptableIndex
	ld a, [hl]
	push af
	ld [hl], $0
.loop4
	call .balls_of_light
	jr nc, .done
	call .AnimateBallsOfLight
	jr .loop4

.done
	ld c, 32
.loop5
	call .AnimateBallsOfLight
	dec c
	jr nz, .loop5
	pop af
	ld [wJumptableIndex], a
	ret
; 4e7cf

.balls_of_light ; 4e7cf
	ld hl, wJumptableIndex
	ld a, [hl]
	cp 32
	ret nc
	ld d, a
	inc [hl]
	and $1
	jr nz, .done_balls
	ld e, $0
	call .GenerateBallOfLight
	ld e, $10
	call .GenerateBallOfLight

.done_balls
	scf
	ret
; 4e7e8

.GenerateBallOfLight: ; 4e7e8
	push de
	depixel 9, 11
	ld a, SPRITE_ANIM_INDEX_13
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld a, [wJumptableIndex]
	and %1110
	sla a
	pop de
	add e
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $0
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $10
	ret
; 4e80c

.AnimateBallsOfLight: ; 4e80c
	push bc
	callab PlaySpriteAnimations
	; a = (([hVBlankCounter] + 4) / 2) % NUM_PALETTES
	ld a, [hVBlankCounter]
	and %1110
	srl a
	inc a
	inc a
	and $7
	ld b, a
	ld hl, Sprites + 3 ; attributes
	ld c, 40
.loop6
	ld a, [hl]
	or b
	ld [hli], a
	inc hl
	inc hl
	inc hl
	dec c
	jr nz, .loop6
	pop bc
	call DelayFrame
	ret
; 4e831


.GFX:
INCBIN "gfx/evo/bubble_large.2bpp"
INCBIN "gfx/evo/bubble.2bpp"
