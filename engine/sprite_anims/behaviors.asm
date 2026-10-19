SpriteAnim_RunBehavior:
	ld hl, SPRITEANIMSTRUCT_BEHAVIOR_ID
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

.Jumptable: const_def
MACRO spriteanim_behavior
	const \1
	export \1
	dw \2
ENDM
	spriteanim_behavior SPRANIM_BEHAVIOR_NULL,                      SpriteAnimBehavior_Null
	spriteanim_behavior SPRANIM_BEHAVIOR_PARTY_MON,                 SpriteAnimBehavior_PartyMon
	spriteanim_behavior SPRANIM_BEHAVIOR_PARTY_MON_SWITCH,          SpriteAnimBehavior_PartyMonSwitch
	spriteanim_behavior SPRANIM_BEHAVIOR_PARTY_MON_SELECTED,        SpriteAnimBehavior_PartyMonSelected
	spriteanim_behavior SPRANIM_BEHAVIOR_GS_TITLE_TRAIL,            SpriteAnimBehavior_GSTitleTrail
	spriteanim_behavior SPRANIM_BEHAVIOR_NAMING_SCREEN_CURSOR,      SpriteAnimBehavior_NamingScreenCursor
	spriteanim_behavior SPRANIM_BEHAVIOR_GAMEFREAK_LOGO,            SpriteAnimBehavior_GameFreakLogo
	spriteanim_behavior SPRANIM_BEHAVIOR_GS_GAMEFREAK_LOGO_STAR,    SpriteAnimBehavior_GSGameFreakLogoStar
	spriteanim_behavior SPRANIM_BEHAVIOR_GS_GAMEFREAK_LOGO_SPARKLE, SpriteAnimBehavior_GSGameFreakLogoSparkle
	spriteanim_behavior SPRANIM_BEHAVIOR_SLOTS_GOLEM,               SpriteAnimBehavior_SlotsGolem
	spriteanim_behavior SPRANIM_BEHAVIOR_SLOTS_CHANSEY,             SpriteAnimBehavior_SlotsChansey
	spriteanim_behavior SPRANIM_BEHAVIOR_SLOTS_EGG,                 SpriteAnimBehavior_SlotsChanseyEgg
	spriteanim_behavior SPRANIM_BEHAVIOR_MAIL_CURSOR,               SpriteAnimBehavior_MailCursor
	spriteanim_behavior SPRANIM_BEHAVIOR_UNUSED_CURSOR,             SpriteAnimBehavior_UnusedCursor
	spriteanim_behavior SPRANIM_BEHAVIOR_MEMORY_GAME_CURSOR,        SpriteAnimBehavior_MemoryGameCursor
	spriteanim_behavior SPRANIM_BEHAVIOR_POKEGEAR_ARROW,            SpriteAnimBehavior_PokegearArrow
	spriteanim_behavior SPRANIM_BEHAVIOR_TRADE_POKE_BALL,           SpriteAnimBehavior_TradePokeBall
	spriteanim_behavior SPRANIM_BEHAVIOR_TRADE_TUBE_BULGE,          SpriteAnimBehavior_TradeTubeBulge
	spriteanim_behavior SPRANIM_BEHAVIOR_TRADEMON_IN_TUBE,          SpriteAnimBehavior_TrademonInTube
	spriteanim_behavior SPRANIM_BEHAVIOR_REVEAL_NEW_MON,            SpriteAnimBehavior_RevealNewMon
	spriteanim_behavior SPRANIM_BEHAVIOR_RADIO_TUNING_KNOB,         SpriteAnimBehavior_RadioTuningKnob
	spriteanim_behavior SPRANIM_BEHAVIOR_CUT_LEAVES,                SpriteAnimBehavior_CutLeaves
	spriteanim_behavior SPRANIM_BEHAVIOR_FLY_FROM,                  SpriteAnimBehavior_FlyFrom
	spriteanim_behavior SPRANIM_BEHAVIOR_FLY_LEAF,                  SpriteAnimBehavior_FlyLeaf
	spriteanim_behavior SPRANIM_BEHAVIOR_FLY_TO,                    SpriteAnimBehavior_FlyTo
	spriteanim_behavior SPRANIM_BEHAVIOR_GS_INTRO_HO_OH_LUGIA,      SpriteAnimBehavior_GSIntroHoOhLugia
	spriteanim_behavior SPRANIM_BEHAVIOR_EZCHAT_CURSOR,             SpriteAnimBehavior_EZChatCursor
	spriteanim_behavior SPRANIM_BEHAVIOR_MOBILE_TRADE_SENT_PULSE,   SpriteAnimBehavior_MobileTradeSentPulse
	spriteanim_behavior SPRANIM_BEHAVIOR_MOBILE_TRADE_OT_PULSE,     SpriteAnimBehavior_MobileTradeOTPulse
	spriteanim_behavior SPRANIM_BEHAVIOR_INTRO_SUICUNE,             SpriteAnimBehavior_IntroSuicune
	spriteanim_behavior SPRANIM_BEHAVIOR_INTRO_PICHU_WOOPER,        SpriteAnimBehavior_IntroPichuWooper
	spriteanim_behavior SPRANIM_BEHAVIOR_CELEBI,                    SpriteAnimBehavior_Celebi
	spriteanim_behavior SPRANIM_BEHAVIOR_INTRO_UNOWN,               SpriteAnimBehavior_IntroUnown
	spriteanim_behavior SPRANIM_BEHAVIOR_INTRO_UNOWN_F,             SpriteAnimBehavior_IntroUnownF
	spriteanim_behavior SPRANIM_BEHAVIOR_INTRO_SUICUNE_AWAY,        SpriteAnimBehavior_IntroSuicuneAway
export DEF NUM_SPRANIM_BEHAVIORS EQU const_value

SpriteAnimBehavior_Null:
	ret

SpriteAnimBehavior_PartyMon:
	ld a, [wMenuCursorY]

	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	cp [hl]
	jr z, SpriteAnimBehavior_PartyMonSwitch

	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], 8 * 2

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], 0
	ret

SpriteAnimBehavior_PartyMonSwitch:
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], 8 * 3

	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	ld d, a
	inc [hl]
	and $f
	ret nz

	ld hl, SPRITEANIMSTRUCT_VAR3
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

SpriteAnimBehavior_PartyMonSelected:
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

SpriteAnimBehavior_GSTitleTrail:
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

	ld hl, SPRITEANIMSTRUCT_VAR3
	add hl, bc
	and $3
	ld [hl], a
	inc [hl]
	swap a

	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], a

.one
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $a4
	jr nc, .delete

	ld hl, SPRITEANIMSTRUCT_VAR3
	add hl, bc
	add 4

	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	inc [hl]

	ld hl, SPRITEANIMSTRUCT_VAR3
	add hl, bc
	ld a, [hl]
	sla a
	sla a

	ld d, 2
	ld hl, SPRITEANIMSTRUCT_VAR2
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

SpriteAnimBehavior_GSIntroHoOhLugia:
	ld hl, SPRITEANIMSTRUCT_VAR2
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

SpriteAnimBehavior_NamingScreenCursor:
	callfar NamingScreen_AnimateCursor
	ret

SpriteAnimBehavior_MailCursor:
	callfar ComposeMail_AnimateCursor
	ret

SpriteAnimBehavior_GameFreakLogo:
	callfar GameFreakLogoSpriteAnim
	ret

SpriteAnimBehavior_GSGameFreakLogoStar:
	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	and a
	jr z, .delete

	dec [hl]
	dec [hl]
	ld d, a
	and $1f
	jr nz, .stay
	ld hl, SPRITEANIMSTRUCT_VAR3
	add hl, bc
	dec [hl]

.stay
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

	ld hl, SPRITEANIMSTRUCT_VAR3
	add hl, bc
	ld a, [hl]

	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	add [hl]
	ld [hl], a
	ret

.delete
	ld a, 1
	ld [wIntroSceneFrameCounter], a
	call DeinitializeSprite
	ret

SpriteAnimBehavior_GSGameFreakLogoSparkle:
	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hli]
	or [hl]
	jr z, .delete

	ld hl, SPRITEANIMSTRUCT_VAR5
	add hl, bc
	ld d, [hl]

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

	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]

	ld hl, SPRITEANIMSTRUCT_VAR4
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h

	ld hl, SPRITEANIMSTRUCT_VAR4
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d

	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, -$10
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
	xor $20
	ld [hl], a
	ret

.delete
	call DeinitializeSprite
	ret

SpriteAnimBehavior_SlotsGolem:
	callfar Slots_AnimateGolem
	ret

SpriteAnimBehavior_SlotsChansey:
	callfar Slots_AnimateChansey
	ld hl, wSlotsDelay
	ld a, [hl]
	cp $2
	ret nz
	ld [hl], $3
	ld a, SPRANIM_CELSET_SLOTS_CHANSEY_2
	call _ReinitSpriteAnimFrame
	ret

SpriteAnimBehavior_SlotsChanseyEgg:
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	dec [hl]
	ld e, a
	and $1
	jr z, .move_vertical

	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp 15 * TILE_WIDTH
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

SpriteAnimBehavior_UnusedCursor:
	callfar UnusedCursor_InterpretJoypad_AnimateCursor
	ret

SpriteAnimBehavior_PokegearArrow:
	callfar AnimatePokegearModeIndicatorArrow
	ret

SpriteAnimBehavior_MemoryGameCursor:
	callfar MemoryGame_InterpretJoypad_AnimateCursor
	ret

SpriteAnimBehavior_TradePokeBall:
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
	ld a, SPRANIM_CELSET_TRADE_POKE_BALL_WOBBLE
	call _ReinitSpriteAnimFrame

	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], 2 ; .two

	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], $20
	ret

.two
	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	and a
	jr z, .next
	dec [hl]
	ret

.next
	call AnimSeqs_IncAnonJumptableIndex

	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], $40

.three
	ld hl, SPRITEANIMSTRUCT_VAR2
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
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $4

	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], $30

	ld hl, SPRITEANIMSTRUCT_VAR3
	add hl, bc
	ld [hl], $24
	ret

.four
	ld hl, SPRITEANIMSTRUCT_VAR3
	add hl, bc
	ld a, [hl]
	and a
	jr z, .done2

	ld d, a
	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	call Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $3f
	ret nz

	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], $20

	ld hl, SPRITEANIMSTRUCT_VAR3
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

SpriteAnimBehavior_TradeTubeBulge:
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

SpriteAnimBehavior_TrademonInTube:
	callfar TradeAnim_AnimateTrademonInTube
	ret

SpriteAnimBehavior_RevealNewMon:
	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	cp $80
	jr nc, .finish_EggShell
	ld d, a
	add 8
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_VAR1
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

SpriteAnimBehavior_RadioTuningKnob:
	callfar AnimateTuningKnob
	ret

SpriteAnimBehavior_CutLeaves:
	ld hl, SPRITEANIMSTRUCT_VAR3
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $80
	add hl, de
	ld e, l
	ld d, h

	ld hl, SPRITEANIMSTRUCT_VAR3
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d

	ld hl, SPRITEANIMSTRUCT_VAR2
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

SpriteAnimBehavior_FlyFrom:
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	and a
	ret z

	ld hl, SPRITEANIMSTRUCT_VAR3
	add hl, bc
	ld a, [hl]
	inc [hl]
	cp $40
	ret c

	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	dec [hl]

	ld hl, SPRITEANIMSTRUCT_VAR5
	add hl, bc
	ld a, [hl]
	ld d, a
	cp $40
	jr nc, .skip
	add 8
	ld [hl], a
.skip
	ld hl, SPRITEANIMSTRUCT_VAR4
	add hl, bc
	ld a, [hl]
	inc [hl]
	call AnimSeqs_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

SpriteAnimBehavior_FlyLeaf:
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp -9 * TILE_WIDTH
	jr nc, .delete_leaf
	inc [hl]
	inc [hl]

	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]

	ld d, $40
	ld hl, SPRITEANIMSTRUCT_VAR2
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

SpriteAnimBehavior_FlyTo:
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp 10 * TILE_WIDTH + 4
	ret z

	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	inc [hl]
	inc [hl]

	ld hl, SPRITEANIMSTRUCT_VAR5
	add hl, bc
	ld a, [hl]
	ld d, a
	and a
	jr z, .stay
	sub $2
	ld [hl], a
.stay
	ld hl, SPRITEANIMSTRUCT_VAR4
	add hl, bc
	ld a, [hl]
	inc [hl]
	call AnimSeqs_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

SpriteAnimBehavior_MobileTradeSentPulse:
	farcall MobileTradeAnim_AnimateSentPulse
	ret

SpriteAnimBehavior_MobileTradeOTPulse:
	farcall MobileTradeAnim_AnimateOTPulse
	ret

SpriteAnimBehavior_IntroSuicune:
	ld a, [wIntroSceneTimer]
	and a
	jr nz, .continue
	ret

.continue
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], $0

	ld hl, SPRITEANIMSTRUCT_VAR3
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
	ld a, SPRANIM_CELSET_INTRO_SUICUNE_2
	call _ReinitSpriteAnimFrame
	ret

SpriteAnimBehavior_IntroPichuWooper:
	ld hl, SPRITEANIMSTRUCT_VAR2
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

SpriteAnimBehavior_IntroUnown:
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld d, [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	ld hl, SPRITEANIMSTRUCT_VAR2
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

SpriteAnimBehavior_IntroUnownF:
	ld a, [wSlotsDelay]
	cp $40
	ret nz
	ld a, SPRANIM_CELSET_INTRO_UNOWN_F_2
	call _ReinitSpriteAnimFrame
	ret

SpriteAnimBehavior_IntroSuicuneAway:
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	add 16
	ld [hl], a
	ret

SpriteAnimBehavior_EZChatCursor:
	farcall AnimateEZChatCursor
	ret

SpriteAnimBehavior_Celebi:
	farcall UpdateCelebiPosition
	ret

AnimSeqs_AnonJumptable:
	ld hl, sp+0
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de

	ld hl, SPRITEANIMSTRUCT_VAR1
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
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	inc [hl]
	ret

AnimSeqs_Sine:
	call Sprites_Sine
	ret

AnimSeqs_Cosine:
	call Sprites_Cosine
	ret
