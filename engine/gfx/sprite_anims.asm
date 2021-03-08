DoAnimFrame:
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
; entries correspond to SPRITE_ANIM_SEQ_* constants (see constants/sprite_anim_constants.asm)
	table_width 2, DoAnimFrame.Jumptable
	dw AnimSeq_Null
	dw AnimSeq_PartyMon
	dw AnimSeq_PartyMonSwitch
	dw AnimSeq_PartyMonSelected
	dw AnimSeq_GSTitleTrail
	dw AnimSeq_NamingScreenCursor
	dw AnimSeq_GameFreakLogo
	dw AnimSeq_GSGameFreakLogoStar
	dw AnimSeq_GSGameFreakLogoSparkle
	dw AnimSeq_SlotsGolem
	dw AnimSeq_SlotsChansey
	dw AnimSeq_SlotsChanseyEgg
	dw AnimSeq_MailCursor
	dw AnimSeq_UnusedCursor
	dw AnimSeq_MemoryGameCursor
	dw AnimSeq_PokegearArrow
	dw AnimSeq_TradePokeBall
	dw AnimSeq_TradeTubeBulge
	dw AnimSeq_TrademonInTube
	dw AnimSeq_RevealNewMon
	dw AnimSeq_RadioTuningKnob
	dw AnimSeq_CutLeaves
	dw AnimSeq_FlyFrom
	dw AnimSeq_FlyLeaf
	dw AnimSeq_FlyTo
	dw AnimSeq_GSIntroHoOhLugia
	dw AnimSeq_EZChatCursor
	dw AnimSeq_MobileTradeSentPulse
	dw AnimSeq_MobileTradeOTPulse
	dw AnimSeq_IntroSuicune
	dw AnimSeq_IntroPichuWooper
	dw AnimSeq_Celebi
	dw AnimSeq_IntroUnown
	dw AnimSeq_IntroUnownF
	dw AnimSeq_IntroSuicuneAway
	assert_table_length NUM_SPRITE_ANIM_SEQS

AnimSeq_Null:
	ret

AnimSeq_PartyMon:
	ld a, [wMenuCursorY]

	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	cp [hl]
	jr z, AnimSeq_PartyMonSwitch

	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], 8 * 2

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], 0
	ret

AnimSeq_PartyMonSwitch:
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], 8 * 3

	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	ld d, a
	inc [hl]
	and $f
	ret nz

	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld e, [hl]

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, d
	and $10 ; bit 4
	jr z, .load_zero
	ld a, e
	and a
	jr z, .load_minus_two
	cp $1
	jr z, .load_minus_one
.load_zero
	xor a
	ld [hl], a
	ret

.load_minus_one
	ld a, -1
	ld [hl], a
	ret

.load_minus_two
	ld a, -2
	ld [hl], a
	ret

AnimSeq_PartyMonSelected:
	ld a, [wMenuCursorY]

	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	cp [hl]
	jr z, .three_offset_right

	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], 8 * 2
	ret

.three_offset_right
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], 8 * 3
	ret

AnimSeq_GSTitleTrail:
	call AnimSeqs_AnonJumptable
	jp hl
.anon_dw
	dw .zero
	dw .one

.zero
	call AnimSeqs_IncAnonJumptableIndex

	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	ld a, [hl]

	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	and $3
	ld [hl], a
	inc [hl]
	swap a

	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], a

.one
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $a4
	jr nc, .delete

	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	add 4

	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	inc [hl]

	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	sla a
	sla a

	ld d, 2
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	add 3
	ld [hl], a
	call AnimSeqs_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.delete
	call DeinitializeSprite
	ret

AnimSeq_GSIntroHoOhLugia:
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	ld d, 2
	call AnimSeqs_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

AnimSeq_NamingScreenCursor:
	callfar NamingScreen_AnimateCursor
	ret

AnimSeq_MailCursor:
	callfar ComposeMail_AnimateCursor
	ret

AnimSeq_GameFreakLogo:
	callfar GameFreakLogoSpriteAnim
	ret

AnimSeq_GSGameFreakLogoStar:
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .delete

	dec [hl]
	dec [hl]
	ld d, a
	and $1f
	jr nz, .stay
	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	dec [hl]

.stay
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld a, [hl]
	push af
	push de
	call AnimSeqs_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call AnimSeqs_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	add [hl]
	ld [hl], a
	ret

.delete
	ld a, 1
	ld [wIntroSceneFrameCounter], a
	call DeinitializeSprite
	ret

AnimSeq_GSGameFreakLogoSparkle:
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hli]
	or [hl]
	jr z, .delete

	ld hl, SPRITEANIMSTRUCT_VAR4
	add hl, bc
	ld d, [hl]

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld a, [hl]
	push af
	push de
	call AnimSeqs_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call AnimSeqs_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]

	ld hl, SPRITEANIMSTRUCT_VAR3
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h

	ld hl, SPRITEANIMSTRUCT_VAR3
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d

	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, -$10
	add hl, de
	ld e, l
	ld d, h

	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld a, [hl]
	xor $20
	ld [hl], a
	ret

.delete
	call DeinitializeSprite
	ret

AnimSeq_SlotsGolem:
	callfar Slots_AnimateGolem
	ret

AnimSeq_SlotsChansey:
	callfar Slots_AnimateChansey
	ld hl, wSlotsDelay
	ld a, [hl]
	cp $2
	ret nz
	ld [hl], $3
	ld a, SPRITE_ANIM_FRAMESET_SLOTS_CHANSEY_2
	call _ReinitSpriteAnimFrame
	ret

AnimSeq_SlotsChanseyEgg:
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld a, [hl]
	dec [hl]
	ld e, a
	and $1
	jr z, .move_vertical

	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp 15 * 8
	jr c, .move_right
	call DeinitializeSprite
	ld a, $4
	ld [wSlotsDelay], a
	ld de, SFX_PLACE_PUZZLE_PIECE_DOWN
	call PlaySFX
	ret

.move_right
	inc [hl]
.move_vertical
	ld a, e
	ld d, 32
	call AnimSeqs_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

AnimSeq_UnusedCursor:
	callfar UnusedCursor_InterpretJoypad_AnimateCursor
	ret

AnimSeq_PokegearArrow:
	callfar AnimatePokegearModeIndicatorArrow
	ret

AnimSeq_MemoryGameCursor:
	callfar MemoryGame_InterpretJoypad_AnimateCursor
	ret

AnimSeq_TradePokeBall:
	call AnimSeqs_AnonJumptable
	jp hl
.anon_dw
	dw .zero
	dw .one
	dw .two
	dw .three
	dw .four
	dw .delete

.zero
	ld a, SPRITE_ANIM_FRAMESET_TRADE_POKE_BALL_WOBBLE
	call _ReinitSpriteAnimFrame

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], 2 ; .two

	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $20
	ret

.two
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .next
	dec [hl]
	ret

.next
	call AnimSeqs_IncAnonJumptableIndex

	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $40

.three
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	cp 48
	jr c, .done
	dec [hl]
	ld d, 40
	call AnimSeqs_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.done
	ld de, SFX_GOT_SAFARI_BALLS
	call PlaySFX
	jr .delete

.one
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], $4

	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $30

	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], $24
	ret

.four
	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	and a
	jr z, .done2

	ld d, a
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	call Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $3f
	ret nz

	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $20

	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	sub $c
	ld [hl], a
	ld de, SFX_SWITCH_POKEMON
	call PlaySFX
	ret

.done2
	xor a

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	call AnimSeqs_IncAnonJumptableIndex
	ret

.delete
	call DeinitializeSprite
	ret

AnimSeq_TradeTubeBulge:
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	cp $b0
	jr nc, .delete
	and $3
	ret nz
	ld de, SFX_POKEBALLS_PLACED_ON_TABLE
	call PlaySFX
	ret

.delete
	call DeinitializeSprite
	ret

AnimSeq_TrademonInTube:
	callfar TradeAnim_AnimateTrademonInTube
	ret

AnimSeq_RevealNewMon:
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	cp $80
	jr nc, .finish_EggShell
	ld d, a
	add 8
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld a, [hl]
	xor $20
	ld [hl], a

	push af
	push de
	call AnimSeqs_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a

	pop de
	pop af
	call AnimSeqs_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.finish_EggShell
	call DeinitializeSprite
	ret

AnimSeq_RadioTuningKnob:
	callfar AnimateTuningKnob
	ret

AnimSeq_CutLeaves:
	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $80
	add hl, de
	ld e, l
	ld d, h

	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d

	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	push af
	push de
	call AnimSeqs_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call AnimSeqs_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

AnimSeq_FlyFrom:
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	and a
	ret z

	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	inc [hl]
	cp $40
	ret c

	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	dec [hl]

	ld hl, SPRITEANIMSTRUCT_VAR4
	add hl, bc
	ld a, [hl]
	ld d, a
	cp $40
	jr nc, .skip
	add 8
	ld [hl], a
.skip
	ld hl, SPRITEANIMSTRUCT_VAR3
	add hl, bc
	ld a, [hl]
	inc [hl]
	call AnimSeqs_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

AnimSeq_FlyLeaf:
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp -9 * 8
	jr nc, .delete_leaf
	inc [hl]
	inc [hl]

	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]

	ld d, $40
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	inc [hl]
	call AnimSeqs_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.delete_leaf
	call DeinitializeSprite
	ret

AnimSeq_FlyTo:
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp 10 * 8 + 4
	ret z

	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	inc [hl]
	inc [hl]

	ld hl, SPRITEANIMSTRUCT_VAR4
	add hl, bc
	ld a, [hl]
	ld d, a
	and a
	jr z, .stay
	sub $2
	ld [hl], a
.stay
	ld hl, SPRITEANIMSTRUCT_VAR3
	add hl, bc
	ld a, [hl]
	inc [hl]
	call AnimSeqs_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

AnimSeq_MobileTradeSentPulse:
	farcall MobileTradeAnim_AnimateSentPulse
	ret

AnimSeq_MobileTradeOTPulse:
	farcall MobileTradeAnim_AnimateOTPulse
	ret

AnimSeq_IntroSuicune:
	ld a, [wIntroSceneTimer]
	and a
	jr nz, .continue
	ret

.continue
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], $0

	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	add 2
	ld [hl], a
	xor $ff
	inc a
	ld d, 32
	call AnimSeqs_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld a, SPRITE_ANIM_FRAMESET_INTRO_SUICUNE_2
	call _ReinitSpriteAnimFrame
	ret

AnimSeq_IntroPichuWooper:
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	cp 20
	jr nc, .done
	add 2
	ld [hl], a
	xor $ff
	inc a
	ld d, 32
	call AnimSeqs_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
.done
	ret

AnimSeq_IntroUnown:
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld d, [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	push af
	push de
	call AnimSeqs_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call AnimSeqs_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

AnimSeq_IntroUnownF:
	ld a, [wSlotsDelay]
	cp $40
	ret nz
	ld a, SPRITE_ANIM_FRAMESET_INTRO_UNOWN_F_2
	call _ReinitSpriteAnimFrame
	ret

AnimSeq_IntroSuicuneAway:
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	add 16
	ld [hl], a
	ret

AnimSeq_EZChatCursor:
	farcall AnimateEZChatCursor
	ret

AnimSeq_Celebi:
	farcall UpdateCelebiPosition
	ret

AnimSeqs_AnonJumptable:
	ld hl, sp+0
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld l, [hl]
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

AnimSeqs_IncAnonJumptableIndex:
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ret

AnimSeqs_Sine:
	call Sprites_Sine
	ret

AnimSeqs_Cosine:
	call Sprites_Cosine
	ret
