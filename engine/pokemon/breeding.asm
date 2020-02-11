CheckBreedmonCompatibility:
	call .CheckBreedingGroupCompatibility
	ld c, $0
	jp nc, .done
	ld a, [wBreedMon1Species]
	ld [wCurPartySpecies], a
	ld a, [wBreedMon1DVs]
	ld [wTempMonDVs], a
	ld a, [wBreedMon1DVs + 1]
	ld [wTempMonDVs + 1], a
	ld a, TEMPMON
	ld [wMonType], a
	predef GetGender
	jr c, .genderless
	ld b, $1
	jr nz, .breedmon2
	inc b

.breedmon2
	push bc
	ld a, [wBreedMon2Species]
	ld [wCurPartySpecies], a
	ld a, [wBreedMon2DVs]
	ld [wTempMonDVs], a
	ld a, [wBreedMon2DVs + 1]
	ld [wTempMonDVs + 1], a
	ld a, TEMPMON
	ld [wMonType], a
	predef GetGender
	pop bc
	jr c, .genderless
	ld a, $1
	jr nz, .compare_gender
	inc a

.compare_gender
	cp b
	jr nz, .compute

.genderless
	ld c, $0
	ld a, [wBreedMon1Species]
	cp DITTO
	jr z, .ditto1
	ld a, [wBreedMon2Species]
	cp DITTO
	jr nz, .done
	jr .compute

.ditto1
	ld a, [wBreedMon2Species]
	cp DITTO
	jr z, .done

.compute
	call .CheckDVs
	ld c, 255
	jp z, .done
	ld a, [wBreedMon2Species]
	ld b, a
	ld a, [wBreedMon1Species]
	cp b
	ld c, 254
	jr z, .compare_ids
	ld c, 128
.compare_ids
	; Speed up
	ld a, [wBreedMon1ID]
	ld b, a
	ld a, [wBreedMon2ID]
	cp b
	jr nz, .done
	ld a, [wBreedMon1ID + 1]
	ld b, a
	ld a, [wBreedMon2ID + 1]
	cp b
	jr nz, .done
	ld a, c
	sub 77
	ld c, a

.done
	ld a, c
	ld [wBreedingCompatibility], a
	ret

.CheckDVs:
; If Defense DVs match and the lower 3 bits of the Special DVs match,
; avoid breeding
	ld a, [wBreedMon1DVs]
	and %1111
	ld b, a
	ld a, [wBreedMon2DVs]
	and %1111
	cp b
	ret nz
	ld a, [wBreedMon1DVs + 1]
	and %111
	ld b, a
	ld a, [wBreedMon2DVs + 1]
	and %111
	cp b
	ret

.CheckBreedingGroupCompatibility:
; If either mon is in the No Eggs group,
; they are not compatible.
	ld a, [wBreedMon2Species]
	ld [wCurSpecies], a
	call GetBaseData
	ld a, [wBaseEggGroups]
	cp EGG_NONE * $11
	jr z, .Incompatible

	ld a, [wBreedMon1Species]
	ld [wCurSpecies], a
	call GetBaseData
	ld a, [wBaseEggGroups]
	cp EGG_NONE * $11
	jr z, .Incompatible

; Ditto is automatically compatible with everything.
; If not Ditto, load the breeding groups into b/c and d/e.
	ld a, [wBreedMon2Species]
	cp DITTO
	jr z, .Compatible
	ld [wCurSpecies], a
	call GetBaseData
	ld a, [wBaseEggGroups]
	push af
	and $f
	ld b, a
	pop af
	and $f0
	swap a
	ld c, a

	ld a, [wBreedMon1Species]
	cp DITTO
	jr z, .Compatible
	ld [wCurSpecies], a
	push bc
	call GetBaseData
	pop bc
	ld a, [wBaseEggGroups]
	push af
	and $f
	ld d, a
	pop af
	and $f0
	swap a
	ld e, a

	ld a, d
	cp b
	jr z, .Compatible
	cp c
	jr z, .Compatible

	ld a, e
	cp b
	jr z, .Compatible
	cp c
	jr z, .Compatible

.Incompatible:
	and a
	ret

.Compatible:
	scf
	ret

DoEggStep::
	ld de, wPartySpecies
	ld hl, wPartyMon1Happiness
	ld c, 0
.loop
	ld a, [de]
	inc de
	cp -1
	ret z
	cp EGG
	jr nz, .next
	dec [hl]
	jr nz, .next
	ld a, 1
	and a
	ret

.next
	push de
	ld de, PARTYMON_STRUCT_LENGTH
	add hl, de
	pop de
	jr .loop

OverworldHatchEgg::
	call RefreshScreen
	call LoadStandardMenuHeader
	call HatchEggs
	call ExitAllMenus
	call RestartMapMusic
	jp CloseText

HatchEggs:
	ld de, wPartySpecies
	ld hl, wPartyMon1Happiness
	xor a
	ld [wCurPartyMon], a

.loop
	ld a, [de]
	inc de
	cp -1
	jp z, .done
	push de
	push hl
	cp EGG
	jp nz, .next
	ld a, [hl]
	and a
	jp nz, .next
	ld [hl], $78

	push de

	farcall SetEggMonCaughtData
	farcall StubbedTrainerRankings_EggsHatched
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
	ld [wCurPartySpecies], a
	dec a
	call SetSeenAndCaughtMon

	ld a, [wCurPartySpecies]
	cp TOGEPI
	jr nz, .nottogepi
	; set the event flag for hatching togepi
	ld de, EVENT_TOGEPI_HATCHED
	ld b, SET_FLAG
	call EventFlagAction
.nottogepi

	pop de

	ld a, [wCurPartySpecies]
	dec de
	ld [de], a
	ld [wNamedObjectIndexBuffer], a
	ld [wCurSpecies], a
	call GetPokemonName
	xor a
	ld [wUnusedEggHatchFlag], a
	call GetBaseData
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	push hl
	ld bc, MON_MAXHP
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	push hl
	ld bc, MON_LEVEL
	add hl, bc
	ld a, [hl]
	ld [wCurPartyLevel], a
	pop hl
	push hl
	ld bc, MON_STATUS
	add hl, bc
	xor a
	ld [hli], a
	ld [hl], a
	pop hl
	push hl
	ld bc, MON_STAT_EXP - 1
	add hl, bc
	ld b, FALSE
	predef CalcMonStats
	pop bc
	ld hl, MON_MAXHP
	add hl, bc
	ld d, h
	ld e, l
	ld hl, MON_HP
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hl], a
	ld hl, MON_ID
	add hl, bc
	ld a, [wPlayerID]
	ld [hli], a
	ld a, [wPlayerID + 1]
	ld [hl], a
	ld a, [wCurPartyMon]
	ld hl, wPartyMonOT
	ld bc, NAME_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wPlayerName
	call CopyBytes
	ld hl, .Text_HatchEgg
	call PrintText
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	ld bc, MON_NAME_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	push de
	ld hl, .BreedAskNicknameText
	call PrintText
	call YesNoBox
	pop de
	jr c, .nonickname

	ld a, TRUE
	ld [wUnusedEggHatchFlag], a
	xor a
	ld [wMonType], a
	push de
	ld b, NAME_MON
	farcall NamingScreen
	pop hl
	ld de, wStringBuffer1
	call InitName
	jr .next

.nonickname
	ld hl, wStringBuffer1
	ld bc, MON_NAME_LENGTH
	call CopyBytes

.next
	ld hl, wCurPartyMon
	inc [hl]
	pop hl
	ld de, PARTYMON_STRUCT_LENGTH
	add hl, de
	pop de
	jp .loop

.done
	ret

.Text_HatchEgg:
	; Huh? @ @
	text_far Text_BreedHuh
	text_asm
	ld hl, wVramState
	res 0, [hl]
	push hl
	push de
	push bc
	ld a, [wCurPartySpecies]
	push af
	call EggHatch_AnimationSequence
	ld hl, .BreedClearboxText
	call PrintText
	pop af
	ld [wCurPartySpecies], a
	pop bc
	pop de
	pop hl
	ld hl, .BreedEggHatchText
	ret

.BreedClearboxText:
	text_far _BreedClearboxText
	text_end

.BreedEggHatchText:
	text_far _BreedEggHatchText
	text_end

.BreedAskNicknameText:
	text_far _BreedAskNicknameText
	text_end

InitEggMoves:
	call GetHeritableMoves
	ld d, h
	ld e, l
	ld b, NUM_MOVES
.loop
	ld a, [de]
	and a
	jr z, .done
	ld hl, wEggMonMoves
	ld c, NUM_MOVES
.next
	ld a, [de]
	cp [hl]
	jr z, .skip
	inc hl
	dec c
	jr nz, .next
	call GetEggMove
	jr nc, .skip
	call LoadEggMove

.skip
	inc de
	dec b
	jr nz, .loop

.done
	ret

GetEggMove:
	push bc
	ld a, [wEggMonSpecies]
	dec a
	ld c, a
	ld b, 0
	ld hl, EggMovePointers
	add hl, bc
	add hl, bc
	ld a, BANK(EggMovePointers)
	call GetFarHalfword
.loop
	ld a, BANK("Egg Moves")
	call GetFarByte
	cp -1
	jr z, .reached_end
	ld b, a
	ld a, [de]
	cp b
	jr z, .done_carry
	inc hl
	jr .loop

.reached_end
	call GetBreedmonMovePointer
	ld b, NUM_MOVES
.loop2
	ld a, [de]
	cp [hl]
	jr z, .found_eggmove
	inc hl
	dec b
	jr z, .inherit_tmhm
	jr .loop2

.found_eggmove
	ld a, [wEggMonSpecies]
	dec a
	ld c, a
	ld b, 0
	ld hl, EvosAttacksPointers
	add hl, bc
	add hl, bc
	ld a, BANK(EvosAttacksPointers)
	call GetFarHalfword
.loop3
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	inc hl
	and a
	jr nz, .loop3
.loop4
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	and a
	jr z, .inherit_tmhm
	inc hl
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	ld b, a
	ld a, [de]
	cp b
	jr z, .done_carry
	inc hl
	jr .loop4

.inherit_tmhm
	ld hl, TMHMMoves
.loop5
	ld a, BANK(TMHMMoves)
	call GetFarByte
	inc hl
	and a
	jr z, .done
	ld b, a
	ld a, [de]
	cp b
	jr nz, .loop5
	ld [wPutativeTMHMMove], a
	predef CanLearnTMHMMove
	ld a, c
	and a
	jr z, .done

.done_carry
	pop bc
	scf
	ret

.done
	pop bc
	and a
	ret

LoadEggMove:
	push de
	push bc
	ld a, [de]
	ld b, a
	ld hl, wEggMonMoves
	ld c, NUM_MOVES
.loop
	ld a, [hli]
	and a
	jr z, .done
	dec c
	jr nz, .loop
	ld de, wEggMonMoves
	ld hl, wEggMonMoves + 1
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a

.done
	dec hl
	ld [hl], b
	ld hl, wEggMonMoves
	ld de, wEggMonPP
	predef FillPP
	pop bc
	pop de
	ret

GetHeritableMoves:
	ld hl, wBreedMon2Moves
	ld a, [wBreedMon1Species]
	cp DITTO
	jr z, .ditto1
	ld a, [wBreedMon2Species]
	cp DITTO
	jr z, .ditto2
	ld a, [wBreedMotherOrNonDitto]
	and a
	ret z
	ld hl, wBreedMon1Moves
	ret

.ditto1
	ld a, [wCurPartySpecies]
	push af
	ld a, [wBreedMon2Species]
	ld [wCurPartySpecies], a
	ld a, [wBreedMon2DVs]
	ld [wTempMonDVs], a
	ld a, [wBreedMon2DVs + 1]
	ld [wTempMonDVs + 1], a
	ld a, TEMPMON
	ld [wMonType], a
	predef GetGender
	jr c, .inherit_mon2_moves
	jr nz, .inherit_mon2_moves
	jr .inherit_mon1_moves

.ditto2
	ld a, [wCurPartySpecies]
	push af
	ld a, [wBreedMon1Species]
	ld [wCurPartySpecies], a
	ld a, [wBreedMon1DVs]
	ld [wTempMonDVs], a
	ld a, [wBreedMon1DVs + 1]
	ld [wTempMonDVs + 1], a
	ld a, TEMPMON
	ld [wMonType], a
	predef GetGender
	jr c, .inherit_mon1_moves
	jr nz, .inherit_mon1_moves

.inherit_mon2_moves
	ld hl, wBreedMon2Moves
	pop af
	ld [wCurPartySpecies], a
	ret

.inherit_mon1_moves
	ld hl, wBreedMon1Moves
	pop af
	ld [wCurPartySpecies], a
	ret

GetBreedmonMovePointer:
	ld hl, wBreedMon1Moves
	ld a, [wBreedMon1Species]
	cp DITTO
	ret z
	ld a, [wBreedMon2Species]
	cp DITTO
	jr z, .ditto
	ld a, [wBreedMotherOrNonDitto]
	and a
	ret z

.ditto
	ld hl, wBreedMon2Moves
	ret

GetEggFrontpic:
	push de
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	call GetBaseData
	ld hl, wBattleMonDVs
	predef GetUnownLetter
	pop de
	predef_jump GetMonFrontpic

GetHatchlingFrontpic:
	push de
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	call GetBaseData
	ld hl, wBattleMonDVs
	predef GetUnownLetter
	pop de
	predef_jump GetAnimatedFrontpic

Hatch_UpdateFrontpicBGMapCenter:
	push af
	call WaitTop
	push hl
	push bc
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	pop bc
	pop hl
	ld a, b
	ldh [hBGMapAddress + 1], a
	ld a, c
	ldh [hGraphicStartTile], a
	lb bc, 7, 7
	predef PlaceGraphic
	pop af
	call Hatch_LoadFrontpicPal
	call SetPalettes
	jp WaitBGMap

EggHatch_DoAnimFrame:
	push hl
	push de
	push bc
	callfar PlaySpriteAnimations
	call DelayFrame
	pop bc
	pop de
	pop hl
	ret

EggHatch_AnimationSequence:
	ld a, [wNamedObjectIndexBuffer]
	ld [wJumptableIndex], a
	ld a, [wCurSpecies]
	push af
	ld de, MUSIC_NONE
	call PlayMusic
	farcall BlankScreen
	call DisableLCD
	ld hl, EggHatchGFX
	ld de, vTiles0 tile $00
	ld bc, 2 tiles
	ld a, BANK(EggHatchGFX)
	call FarCopyBytes
	farcall ClearSpriteAnims
	ld de, vTiles2 tile $00
	ld a, [wJumptableIndex]
	call GetHatchlingFrontpic
	ld de, vTiles2 tile $31
	ld a, EGG
	call GetEggFrontpic
	ld de, MUSIC_EVOLUTION
	call PlayMusic
	call EnableLCD
	hlcoord 7, 4
	ld b, HIGH(vBGMap0)
	ld c, $31 ; Egg tiles start here
	ld a, EGG
	call Hatch_UpdateFrontpicBGMapCenter
	ld c, 80
	call DelayFrames
	xor a
	ld [wFrameCounter], a
	ldh a, [hSCX]
	ld b, a
.outerloop
	ld hl, wFrameCounter
	ld a, [hl]
	inc [hl]
	cp 8
	jr nc, .done
	ld e, [hl]
.loop
; wobble e times
	ld a, 2
	ldh [hSCX], a
	ld a, -2
	ld [wGlobalAnimXOffset], a
	call EggHatch_DoAnimFrame
	ld c, 2
	call DelayFrames
	ld a, -2
	ldh [hSCX], a
	ld a, 2
	ld [wGlobalAnimXOffset], a
	call EggHatch_DoAnimFrame
	ld c, 2
	call DelayFrames
	dec e
	jr nz, .loop
	ld c, 16
	call DelayFrames
	call EggHatch_CrackShell
	jr .outerloop

.done
	ld de, SFX_EGG_HATCH
	call PlaySFX
	xor a
	ldh [hSCX], a
	ld [wGlobalAnimXOffset], a
	call ClearSprites
	call Hatch_InitShellFragments
	hlcoord 6, 3
	ld b, HIGH(vBGMap0)
	ld c, $00 ; Hatchling tiles start here
	ld a, [wJumptableIndex]
	call Hatch_UpdateFrontpicBGMapCenter
	call Hatch_ShellFragmentLoop
	call WaitSFX
	ld a, [wJumptableIndex]
	ld [wCurPartySpecies], a
	hlcoord 6, 3
	ld d, $0
	ld e, ANIM_MON_HATCH
	predef AnimateFrontpic
	pop af
	ld [wCurSpecies], a
	ret

Hatch_LoadFrontpicPal:
	ld [wPlayerHPPal], a
	ld b, SCGB_EVOLUTION
	ld c, $0
	jp GetSGBLayout

EggHatch_CrackShell:
	ld a, [wFrameCounter]
	dec a
	and $7
	cp $7
	ret z
	srl a
	ret nc
	swap a
	srl a
	add 9 * 8 + 4
	ld d, a
	ld e, 11 * 8
	ld a, SPRITE_ANIM_INDEX_EGG_CRACK
	call InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $0
	ld de, SFX_EGG_CRACK
	jp PlaySFX

EggHatchGFX:
INCBIN "gfx/evo/egg_hatch.2bpp"

Hatch_InitShellFragments:
	farcall ClearSpriteAnims
	ld hl, .SpriteData
.loop
	ld a, [hli]
	cp -1
	jr z, .done
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	push hl
	push bc

	ld a, SPRITE_ANIM_INDEX_EGG_HATCH
	call InitSpriteAnimStruct

	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $0

	pop de
	ld a, e
	ld hl, SPRITEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	add [hl]
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], d

	pop hl
	jr .loop
.done
	ld de, SFX_EGG_HATCH
	call PlaySFX
	call EggHatch_DoAnimFrame
	ret

shell_fragment: MACRO
; y tile, y pxl, x tile, x pxl, frameset offset, ???
	db (\1 * 8) % $100 + \2, (\3 * 8) % $100 + \4, \5 - SPRITE_ANIM_FRAMESET_EGG_HATCH_1, \6
ENDM

.SpriteData:
	shell_fragment 10, 4,  9, 0, SPRITE_ANIM_FRAMESET_EGG_HATCH_1, $3c
	shell_fragment 11, 4,  9, 0, SPRITE_ANIM_FRAMESET_EGG_HATCH_2, $04
	shell_fragment 10, 4, 10, 0, SPRITE_ANIM_FRAMESET_EGG_HATCH_1, $30
	shell_fragment 11, 4, 10, 0, SPRITE_ANIM_FRAMESET_EGG_HATCH_2, $10
	shell_fragment 10, 4, 11, 0, SPRITE_ANIM_FRAMESET_EGG_HATCH_3, $24
	shell_fragment 11, 4, 11, 0, SPRITE_ANIM_FRAMESET_EGG_HATCH_4, $1c
	shell_fragment 10, 0,  9, 4, SPRITE_ANIM_FRAMESET_EGG_HATCH_1, $36
	shell_fragment 12, 0,  9, 4, SPRITE_ANIM_FRAMESET_EGG_HATCH_2, $0a
	shell_fragment 10, 0, 10, 4, SPRITE_ANIM_FRAMESET_EGG_HATCH_3, $2a
	shell_fragment 12, 0, 10, 4, SPRITE_ANIM_FRAMESET_EGG_HATCH_4, $16
	db -1

Hatch_ShellFragmentLoop:
	ld c, 129
.loop
	call EggHatch_DoAnimFrame
	dec c
	jr nz, .loop
	ret

DayCareMon1:
	ld hl, LeftWithDayCareManText
	call PrintText
	ld a, [wBreedMon1Species]
	call PlayMonCry
	ld a, [wDayCareLady]
	bit DAYCARELADY_HAS_MON_F, a
	jr z, DayCareMonCursor
	call PromptButton
	ld hl, wBreedMon2Nick
	call DayCareMonCompatibilityText
	jp PrintText

DayCareMon2:
	ld hl, LeftWithDayCareLadyText
	call PrintText
	ld a, [wBreedMon2Species]
	call PlayMonCry
	ld a, [wDayCareMan]
	bit DAYCAREMAN_HAS_MON_F, a
	jr z, DayCareMonCursor
	call PromptButton
	ld hl, wBreedMon1Nick
	call DayCareMonCompatibilityText
	jp PrintText

DayCareMonCursor:
	jp WaitPressAorB_BlinkCursor

LeftWithDayCareLadyText:
	text_far _LeftWithDayCareLadyText
	text_end

LeftWithDayCareManText:
	text_far _LeftWithDayCareManText
	text_end

DayCareMonCompatibilityText:
	push bc
	ld de, wStringBuffer1
	ld bc, NAME_LENGTH
	call CopyBytes
	call CheckBreedmonCompatibility
	pop bc
	ld a, [wBreedingCompatibility]
	ld hl, .BreedBrimmingWithEnergyText
	cp -1
	jr z, .done
	ld hl, .BreedNoInterestText
	and a
	jr z, .done
	ld hl, .BreedAppearsToCareForText
	cp 230
	jr nc, .done
	cp 70
	ld hl, .BreedFriendlyText
	jr nc, .done
	ld hl, .BreedShowsInterestText

.done
	ret

.BreedBrimmingWithEnergyText:
	text_far _BreedBrimmingWithEnergyText
	text_end

.BreedNoInterestText:
	text_far _BreedNoInterestText
	text_end

.BreedAppearsToCareForText:
	text_far _BreedAppearsToCareForText
	text_end

.BreedFriendlyText:
	text_far _BreedFriendlyText
	text_end

.BreedShowsInterestText:
	text_far _BreedShowsInterestText
	text_end

Unreferenced_DayCareMonPrintEmptyString:
	ld hl, .string
	ret

.string
	db "@"
