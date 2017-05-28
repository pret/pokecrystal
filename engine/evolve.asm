EvolvePokemon: ; 421d8
	ld hl, EvolvableFlags
	xor a
	ld [hl], a
	ld a, [CurPartyMon]
	ld c, a
	ld b, SET_FLAG
	call EvoFlagAction
EvolveAfterBattle: ; 421e6
	xor a
	ld [wMonTriedToEvolve], a
	dec a
	ld [CurPartyMon], a
	push hl
	push bc
	push de
	ld hl, PartyCount

	push hl

EvolveAfterBattle_MasterLoop
	ld hl, CurPartyMon
	inc [hl]

	pop hl

	inc hl
	ld a, [hl]
	cp $ff
	jp z, .ReturnToMap

	ld [wEvolutionOldSpecies], a

	push hl
	ld a, [CurPartyMon]
	ld c, a
	ld hl, EvolvableFlags
	ld b, CHECK_FLAG
	call EvoFlagAction
	ld a, c
	and a
	jp z, EvolveAfterBattle_MasterLoop

	ld a, [wEvolutionOldSpecies]
	dec a
	ld b, 0
	ld c, a
	ld hl, EvosAttacksPointers
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a

	push hl
	xor a
	ld [MonType], a
	predef CopyPkmnToTempMon
	pop hl

.loop
	ld a, [hli]
	and a
	jr z, EvolveAfterBattle_MasterLoop

	ld b, a

	cp EVOLVE_TRADE
	jr z, .trade

	ld a, [wLinkMode]
	and a
	jp nz, .dont_evolve_2

	ld a, b
	cp EVOLVE_ITEM
	jp z, .item

	ld a, [wForceEvolution]
	and a
	jp nz, .dont_evolve_2

	ld a, b
	cp EVOLVE_LEVEL
	jp z, .level

	cp EVOLVE_HAPPINESS
	jr z, .happiness


; EVOLVE_STAT
	ld a, [TempMonLevel]
	cp [hl]
	jp c, .dont_evolve_1

	call IsMonHoldingEverstone
	jp z, .dont_evolve_1

	push hl
	ld de, TempMonAttack
	ld hl, TempMonDefense
	ld c, 2
	call StringCmp
	ld a, ATK_EQ_DEF
	jr z, .got_tyrogue_evo
	ld a, ATK_LT_DEF
	jr c, .got_tyrogue_evo
	ld a, ATK_GT_DEF
.got_tyrogue_evo
	pop hl

	inc hl
	cp [hl]
	jp nz, .dont_evolve_2

	inc hl
	jr .proceed


.happiness
	ld a, [TempMonHappiness]
	cp 220
	jp c, .dont_evolve_2

	call IsMonHoldingEverstone
	jp z, .dont_evolve_2

	ld a, [hli]
	cp TR_ANYTIME
	jr z, .proceed
	cp TR_MORNDAY
	jr z, .happiness_daylight

; TR_NITE
	ld a, [TimeOfDay]
	cp NITE
	jp nz, .dont_evolve_3
	jr .proceed

.happiness_daylight
	ld a, [TimeOfDay]
	cp NITE
	jp z, .dont_evolve_3
	jr .proceed


.trade
	ld a, [wLinkMode]
	and a
	jp z, .dont_evolve_2

	call IsMonHoldingEverstone
	jp z, .dont_evolve_2

	ld a, [hli]
	ld b, a
	inc a
	jr z, .proceed

	ld a, [wLinkMode]
	cp LINK_TIMECAPSULE
	jp z, .dont_evolve_3

	ld a, [TempMonItem]
	cp b
	jp nz, .dont_evolve_3

	xor a
	ld [TempMonItem], a
	jr .proceed


.item
	ld a, [hli]
	ld b, a
	ld a, [CurItem]
	cp b
	jp nz, .dont_evolve_3

	ld a, [wForceEvolution]
	and a
	jp z, .dont_evolve_3
	ld a, [wLinkMode]
	and a
	jp nz, .dont_evolve_3
	jr .proceed


.level
	ld a, [hli]
	ld b, a
	ld a, [TempMonLevel]
	cp b
	jp c, .dont_evolve_3
	call IsMonHoldingEverstone
	jp z, .dont_evolve_3

.proceed
	ld a, [TempMonLevel]
	ld [CurPartyLevel], a
	ld a, $1
	ld [wMonTriedToEvolve], a

	push hl

	ld a, [hl]
	ld [wEvolutionNewSpecies], a
	ld a, [CurPartyMon]
	ld hl, PartyMonNicknames
	call GetNick
	call CopyName1
	ld hl, Text_WhatEvolving
	call PrintText

	ld c, 50
	call DelayFrames

	xor a
	ld [hBGMapMode], a
	hlcoord 0, 0
	lb bc, 12, 20
	call ClearBox

	ld a, $1
	ld [hBGMapMode], a
	call ClearSprites

	callba EvolutionAnimation

	push af
	call ClearSprites
	pop af
	jp c, CancelEvolution

	ld hl, Text_CongratulationsYourPokemon
	call PrintText

	pop hl

	ld a, [hl]
	ld [CurSpecies], a
	ld [TempMonSpecies], a
	ld [wEvolutionNewSpecies], a
	ld [wd265], a
	call GetPokemonName

	push hl
	ld hl, Text_EvolvedIntoPKMN
	call PrintTextBoxText
	callba TrainerRankings_MonsEvolved

	ld de, MUSIC_NONE
	call PlayMusic
	ld de, SFX_CAUGHT_MON
	call PlaySFX
	call WaitSFX

	ld c, 40
	call DelayFrames

	call ClearTileMap
	call UpdateSpeciesNameIfNotNicknamed
	call GetBaseData

	ld hl, TempMonExp + 2
	ld de, TempMonMaxHP
	ld b, $1
	predef CalcPkmnStats

	ld a, [CurPartyMon]
	ld hl, PartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld e, l
	ld d, h
	ld bc, MON_MAXHP
	add hl, bc
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, TempMonMaxHP + 1
	ld a, [hld]
	sub c
	ld c, a
	ld a, [hl]
	sbc b
	ld b, a
	ld hl, TempMonHP + 1
	ld a, [hl]
	add c
	ld [hld], a
	ld a, [hl]
	adc b
	ld [hl], a

	ld hl, TempMonSpecies
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes

	ld a, [CurSpecies]
	ld [wd265], a
	xor a
	ld [MonType], a
	call LearnLevelMoves
	ld a, [wd265]
	dec a
	call SetSeenAndCaughtMon

	ld a, [wd265]
	cp UNOWN
	jr nz, .skip_unown

	ld hl, TempMonDVs
	predef GetUnownLetter
	callab UpdateUnownDex

.skip_unown
	pop de
	pop hl
	ld a, [TempMonSpecies]
	ld [hl], a
	push hl
	ld l, e
	ld h, d
	jp EvolveAfterBattle_MasterLoop
; 423f8

.dont_evolve_1
	inc hl
.dont_evolve_2
	inc hl
.dont_evolve_3
	inc hl
	jp .loop

; XXX
	pop hl
.ReturnToMap:
	pop de
	pop bc
	pop hl
	ld a, [wLinkMode]
	and a
	ret nz
	ld a, [wBattleMode]
	and a
	ret nz
	ld a, [wMonTriedToEvolve]
	and a
	call nz, RestartMapMusic
	ret
; 42414

UpdateSpeciesNameIfNotNicknamed: ; 42414
	ld a, [CurSpecies]
	push af
	ld a, [BaseDexNo]
	ld [wd265], a
	call GetPokemonName
	pop af
	ld [CurSpecies], a
	ld hl, StringBuffer1
	ld de, StringBuffer2
.loop
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	ret nz
	cp "@"
	jr nz, .loop

	ld a, [CurPartyMon]
	ld bc, PKMN_NAME_LENGTH
	ld hl, PartyMonNicknames
	call AddNTimes
	push hl
	ld a, [CurSpecies]
	ld [wd265], a
	call GetPokemonName
	ld hl, StringBuffer1
	pop de
	ld bc, PKMN_NAME_LENGTH
	jp CopyBytes
; 42454

CancelEvolution: ; 42454
	ld hl, Text_StoppedEvolving
	call PrintText
	call ClearTileMap
	pop hl
	jp EvolveAfterBattle_MasterLoop
; 42461

IsMonHoldingEverstone: ; 42461
	push hl
	ld a, [CurPartyMon]
	ld hl, PartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
	cp EVERSTONE
	pop hl
	ret
; 42473

Text_CongratulationsYourPokemon: ; 0x42473
	; Congratulations! Your @ @
	text_jump UnknownText_0x1c4b92
	db "@"
; 0x42478

Text_EvolvedIntoPKMN: ; 0x42478
	; evolved into @ !
	text_jump UnknownText_0x1c4baf
	db "@"
; 0x4247d

Text_StoppedEvolving: ; 0x4247d
	; Huh? @ stopped evolving!
	text_jump UnknownText_0x1c4bc5
	db "@"
; 0x42482

Text_WhatEvolving: ; 0x42482
	; What? @ is evolving!
	text_jump UnknownText_0x1c4be3
	db "@"
; 0x42487


LearnLevelMoves: ; 42487
	ld a, [wd265]
	ld [CurPartySpecies], a
	dec a
	ld b, 0
	ld c, a
	ld hl, EvosAttacksPointers
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a

.skip_evos
	ld a, [hli]
	and a
	jr nz, .skip_evos

.find_move
	ld a, [hli]
	and a
	jr z, .done

	ld b, a
	ld a, [CurPartyLevel]
	cp b
	ld a, [hli]
	jr nz, .find_move

	push hl
	ld d, a
	ld hl, PartyMon1Moves
	ld a, [CurPartyMon]
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes

	ld b, NUM_MOVES
.check_move
	ld a, [hli]
	cp d
	jr z, .has_move
	dec b
	jr nz, .check_move
	jr .learn
.has_move

	pop hl
	jr .find_move

.learn
	ld a, d
	ld [wPutativeTMHMMove], a
	ld [wd265], a
	call GetMoveName
	call CopyName1
	predef LearnMove
	pop hl
	jr .find_move

.done
	ld a, [CurPartySpecies]
	ld [wd265], a
	ret
; 424e1


FillMoves: ; 424e1
; Fill in moves at de for CurPartySpecies at CurPartyLevel

	push hl
	push de
	push bc
	ld hl, EvosAttacksPointers
	ld b, 0
	ld a, [CurPartySpecies]
	dec a
	add a
	rl b
	ld c, a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
.GoToAttacks:
	ld a, [hli]
	and a
	jr nz, .GoToAttacks
	jr .GetLevel

.NextMove:
	pop de
.GetMove:
	inc hl
.GetLevel:
	ld a, [hli]
	and a
	jp z, .done
	ld b, a
	ld a, [CurPartyLevel]
	cp b
	jp c, .done
	ld a, [wEvolutionOldSpecies]
	and a
	jr z, .CheckMove
	ld a, [wd002]
	cp b
	jr nc, .GetMove

.CheckMove:
	push de
	ld c, NUM_MOVES
.CheckRepeat:
	ld a, [de]
	inc de
	cp [hl]
	jr z, .NextMove
	dec c
	jr nz, .CheckRepeat
	pop de
	push de
	ld c, NUM_MOVES
.CheckSlot:
	ld a, [de]
	and a
	jr z, .LearnMove
	inc de
	dec c
	jr nz, .CheckSlot
	pop de
	push de
	push hl
	ld h, d
	ld l, e
	call ShiftMoves
	ld a, [wEvolutionOldSpecies]
	and a
	jr z, .ShiftedMove
	push de
	ld bc, PartyMon1PP - (PartyMon1Moves + NUM_MOVES - 1)
	add hl, bc
	ld d, h
	ld e, l
	call ShiftMoves
	pop de

.ShiftedMove:
	pop hl

.LearnMove:
	ld a, [hl]
	ld [de], a
	ld a, [wEvolutionOldSpecies]
	and a
	jr z, .NextMove
	push hl
	ld a, [hl]
	ld hl, MON_PP - MON_MOVES
	add hl, de
	push hl
	dec a
	ld hl, Moves + MOVE_PP
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	pop hl
	ld [hl], a
	pop hl
	jr .NextMove

.done
	pop bc
	pop de
	pop hl
	ret
; 4256e

ShiftMoves: ; 4256e
	ld c, NUM_MOVES - 1
.loop
	inc de
	ld a, [de]
	ld [hli], a
	dec c
	jr nz, .loop
	ret
; 42577


EvoFlagAction: ; 42577
	push de
	ld d, $0
	predef FlagPredef
	pop de
	ret
; 42581

GetPreEvolution: ; 42581
; Find the first mon to evolve into CurPartySpecies.

; Return carry and the new species in CurPartySpecies
; if a pre-evolution is found.

	ld c, 0
.loop ; For each Pokemon...
	ld hl, EvosAttacksPointers
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
.loop2 ; For each evolution...
	ld a, [hli]
	and a
	jr z, .no_evolve ; If we jump, this Pokemon does not evolve into CurPartySpecies.
	cp EVOLVE_STAT ; This evolution type has the extra parameter of stat comparison.
	jr nz, .not_tyrogue
	inc hl

.not_tyrogue
	inc hl
	ld a, [CurPartySpecies]
	cp [hl]
	jr z, .found_preevo
	inc hl
	ld a, [hl]
	and a
	jr nz, .loop2

.no_evolve
	inc c
	ld a, c
	cp NUM_POKEMON
	jr c, .loop
	and a
	ret

.found_preevo
	inc c
	ld a, c
	ld [CurPartySpecies], a
	scf
	ret
; 425b1
