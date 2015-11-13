BattleTowerBattle: ; 170215
	xor a
	ld [wcf63], a
	call _BattleTowerBattle
	ret
; 17021d

EmptySpecial_17021d: ; 17021d
	ret
; 17021e

Function17021e: ; 17021e
	xor a
	ld [wcf63], a
	ld [wcf64], a
	ld [wcf65], a
	ld [wcf66], a
	ret
; 17022c

_BattleTowerBattle: ; 17022c
.loop
	call .do_jumptable
	call DelayFrame
	ld a, [wcf63]
	cp $1
	jr nz, .loop
	ret
; 17023a

.do_jumptable: ; 17023a
	ld a, [wcf63]
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
; 170249

.jumptable: ; 170249
	dw RunBattleTowerTrainer
	dw SkipBattleTowerTrainer
; 17024d

RunBattleTowerTrainer: ; 17024d
	ld a, [Options]
	push af
	ld hl, Options
	set BATTLE_SHIFT, [hl] ; SET MODE

	ld a, [InBattleTowerBattle]
	push af
	or $1
	ld [InBattleTowerBattle], a

	xor a
	ld [wLinkMode], a
	callba Mobile_HealParty
	callba HealParty
	call ReadBTTrainerParty
	call Clears5_a89a
	predef StartBattle
	callba LoadPokemonData
	callba HealParty
	ld a, [wBattleResult]
	ld [ScriptVar], a
	and a
	jr nz, .lost
	ld a, BANK(sNrOfBeatenBattleTowerTrainers)
	call GetSRAMBank
	ld a, [sNrOfBeatenBattleTowerTrainers]
	ld [wNrOfBeatenBattleTowerTrainers], a ; wcf64
	call CloseSRAM
	ld hl, StringBuffer3
	ld a, [wNrOfBeatenBattleTowerTrainers] ; wcf64
	add "1"
	ld [hli], a
	ld a, "@"
	ld [hl], a

.lost
	pop af
	ld [InBattleTowerBattle], a
	pop af
	ld [Options], a
	ld a, $1
	ld [wcf63], a
	ret


ReadBTTrainerParty: ; 1702b7
; Initialise the BattleTower-Trainer and his Pkmn
	call CopyBTTrainer_FromBT_OT_TowBT_OTTemp

; Check the nicknames for illegal characters, and replace bad nicknames
; with their species names.
	ld de, wBT_OTTempPkmn1Name ; $c643
	ld c, PKMN_NAME_LENGTH
	callba CheckStringForErrors
	jr nc, .skip_mon_1

	ld a, [wBT_OTTempPkmn1]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld l, e
	ld h, d
	ld de, wBT_OTTempPkmn1Name ; $c643
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes

.skip_mon_1
	ld de, wBT_OTTempPkmn2Name ; $c67e
	ld c, PKMN_NAME_LENGTH
	callba CheckStringForErrors
	jr nc, .skip_mon_2
	ld a, [wBT_OTTempPkmn2] ; [$c64e]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld l, e
	ld h, d
	ld de, wBT_OTTempPkmn2Name ; $c67e
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes

.skip_mon_2
	ld de, wBT_OTTempPkmn3Name ; $c686 + 51 = $c6b9
	ld c, PKMN_NAME_LENGTH
	callba CheckStringForErrors
	jr nc, .skip_mon_3
	ld a, [wBT_OTTempPkmn3] ; [$c689]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld l, e
	ld h, d
	ld de, wBT_OTTempPkmn3Name ; $c686 + 51 = $c6b9
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes

.skip_mon_3
; Add the terminator character to each of these names
	ld a, "@"
	ld [wBT_OTTempPkmn1NameEnd - 1], a ; $c64d
	ld [wBT_OTTempPkmn2NameEnd - 1], a ; $c688
	ld [wBT_OTTempPkmn3NameEnd - 1], a ; $c68a + 57 = $c6c3
; Fix errors in the movesets
	call CheckBTMonMovesForErrors
; Repair the trainer name if needed, then copy it to OTPlayerName
	ld de, wBT_OTTempName
	ld c, NAME_LENGTH - 1
	callba CheckStringForErrors
	jr nc, .trainer_name_okay
	ld hl, BT_ChrisName
	jr .done_trainer_name

.trainer_name_okay
	ld hl, wBT_OTTempName ; 0xc608

.done_trainer_name
	ld de, OTPlayerName
	ld bc, NAME_LENGTH - 1
	call CopyBytes
	ld a, "@"
	ld [de], a

	ld hl, wBT_OTTempTrainerClass
	ld a, [hli]
	ld [OtherTrainerClass], a
	ld a, OTPartyMonNicknames % $100
	ld [BGMapBuffer], a
	ld a, OTPartyMonNicknames / $100
	ld [BGMapBuffer + 1], a

	; Copy Pkmn into Memory from the address in hl
	ld de, OTPartyMon1Species
	ld bc, OTPartyCount
	ld a, BATTLETOWER_NROFPKMNS		; Number of Pkmn the BattleTower-Trainer has
	ld [bc], a
	inc bc
.otpartymon_loop
	push af
	ld a, [hl]
	ld [bc], a
	inc bc
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	push de
	ld a, [BGMapBuffer]
	ld e, a
	ld a, [BGMapBuffer + 1]
	ld d, a
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	ld a, e
	ld [BGMapBuffer], a
	ld a, d
	ld [BGMapBuffer + 1], a
	pop de
	pop bc
	pop af
	dec a
	and a
	jr nz, .otpartymon_loop
	ld a, -1
	ld [bc], a
	ret
; 170394

ValidateBTParty: ; 170394
; Check for and fix errors in party data
	ld hl, wBT_OTTempPkmn1Species
	ld d, BATTLETOWER_NROFPKMNS
.pkmn_loop
	push de
	push hl
	ld b, h
	ld c, l
	ld a, [hl]
	and a
idx = $ff
rept ($ff +- NUM_POKEMON)
	jr z, .invalid
	cp idx
idx = idx +- 1
endr
	jr nz, .valid

.invalid
	ld a, SMEARGLE
	ld [hl], a

.valid
	ld [CurSpecies], a
	call GetBaseData
	ld a, $5
	call GetSRAMBank
	ld a, [$b2fb] ; s5_b2fb ; max level?
	call CloseSRAM
	ld e, a
	ld hl, MON_LEVEL
	add hl, bc
	ld a, [hl]
	cp MIN_LEVEL
	ld a, MIN_LEVEL
	jr c, .load
	ld a, [hl]
	cp e
	jr c, .dont_load
	ld a, e

.load
	ld [hl], a

.dont_load
	ld [CurPartyLevel], a
	ld hl, MON_MOVES
	add hl, bc
	ld d, NUM_MOVES - 1
	ld a, [hli]
	and a
	jr z, .not_move
	cp NUM_ATTACKS + 1
	jr nc, .not_move
	jr .valid_move

.not_move
	dec hl
	ld a, POUND
	ld [hli], a
	xor a
rept 2
	ld [hli], a
endr
	ld [hl], a
	jr .done_moves

.valid_move
	ld a, [hl]
	cp NUM_ATTACKS + 1
	jr c, .next
	ld [hl], $0

.next
	inc hl
	dec d
	jr nz, .valid_move

.done_moves
	ld hl, MON_MAXHP
	add hl, bc
	ld d, h
	ld e, l
	push hl
	push de
	ld hl, MON_EXP + 2
	add hl, bc
	ld b, $1
	predef CalcPkmnStats
	pop de
	pop hl
rept 2
	dec de
endr
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	pop hl
	ld bc, PARTYMON_STRUCT_LENGTH + PKMN_NAME_LENGTH
	add hl, bc
	pop de
	dec d
	jp nz, .pkmn_loop
	ret
; 170426

BT_ChrisName: ; 170426
	db "CHRIS@"
; 17042c

Function17042c: ; 17042c
	ld hl, BT_TrainerTextIndex + $be
	ld a, 7
.loop
	push af
	push hl
	ld c, 18
.loop2
	ld a, [hli]
	ld b, a
	ld a, [hli]
	and a
	jr z, .skip
	cp $f
	jr nc, .exit_inner_loop
	push hl
	ld hl, Unknown_170470
	dec a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	pop hl
	cp b
	jr c, .exit_inner_loop
	jr z, .exit_inner_loop
	jr .asm_170456

.skip
	ld a, b
	cp $fc
	jr nc, .exit_inner_loop

.asm_170456
	dec c
	jr nz, .loop2
	jr .dont_copy

.exit_inner_loop
	pop de
	push de
	ld hl, Unknown_17047e
	ld bc, BATTLETOWER_TRAINERDATALENGTH
	call CopyBytes

.dont_copy
	pop hl
	ld de, $00e0
	add hl, de
	pop af
	dec a
	jr nz, .loop
	ret
; 170470

Unknown_170470:
	db $12, $24, $45, $45, $42, $42, $45, $42, $27, $27, $45, $27, $42, $24

Unknown_17047e:
	db $03, $04, $05, $08
	db $03, $05, $0e, $06
	db $03, $02, $00, $00
	db $39, $07, $07, $04
	db $00, $05, $04, $07
	db $01, $05, $00, $00
	db $0f, $05, $14, $07
	db $05, $05, $11, $0c
	db $0c, $06, $06, $04


CopyBTTrainer_FromBT_OT_TowBT_OTTemp: ; 1704a2
; copy the BattleTower-Trainer data that lies at 'BT_OTTrainer' to 'wBT_OTTemp'
	ld a, [rSVBK]
	push af
	ld a, $3 ; BANK(BT_OTTrainer)
	ld [rSVBK], a

	ld hl, BT_OTTrainer ; $d100
	ld de, wBT_OTTemp ; $c608
	ld bc, BATTLE_TOWER_STRUCT_LENGTH
	call CopyBytes

	pop af
	ld [rSVBK], a

	ld a, BANK(s1_be45)
	call GetSRAMBank
	ld a, $2
	ld [s1_be45], a
	ld hl, sNrOfBeatenBattleTowerTrainers
	inc [hl]
	call CloseSRAM
SkipBattleTowerTrainer: ; 1704c9
	ret
; 1704ca
