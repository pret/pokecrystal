BattleTowerRoomMenu: ; 1700b0
; special
	call InitBattleTowerChallengeRAM
	callba _BattleTowerRoomMenu
	ret
; 1700ba

BattleTowerBattle: ; 170215
	xor a
	ld [wBattleTowerBattleEnded], a
	call _BattleTowerBattle
	ret
; 17021d

InitBattleTowerChallengeRAM: ; 17021e
	xor a
	ld [wBattleTowerBattleEnded], a
	ld [wNrOfBeatenBattleTowerTrainers], a
	ld [wcf65], a
	ld [wcf66], a
	ret
; 17022c

_BattleTowerBattle: ; 17022c
.loop
	call .do_dw
	call DelayFrame
	ld a, [wBattleTowerBattleEnded]
	cp $1
	jr nz, .loop
	ret
; 17023a

.do_dw ; 17023a
	ld a, [wBattleTowerBattleEnded]
	ld e, a
	ld d, 0
	ld hl, .dw
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; 170249

.dw ; 170249
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
	callba HealParty
	call ReadBTTrainerParty

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
	ld [wNrOfBeatenBattleTowerTrainers], a
	call CloseSRAM
	ld hl, StringBuffer3
	ld a, [wNrOfBeatenBattleTowerTrainers]
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
	ld [wBattleTowerBattleEnded], a
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

BT_ChrisName: ; 170426
	db "CHRIS@"
; 17042c


CopyBTTrainer_FromBT_OT_TowBT_OTTemp: ; 1704a2
; copy the BattleTower-Trainer data that lies at 'BT_OTTrainer' to 'wBT_OTTemp'
	ld a, [rSVBK]
	push af
	ld a, $3 ; BANK(BT_OTTrainer)
	ld [rSVBK], a

	ld hl, BT_OTTrainer ; $d100
	ld de, wBT_OTTemp ; wMisc
	ld bc, BATTLE_TOWER_STRUCT_LENGTH
	call CopyBytes

	pop af
	ld [rSVBK], a

	ld a, BANK(sBattleTowerChallengeState)
	call GetSRAMBank
	ld a, BATTLETOWER_CHALLENGE_IN_PROGESS
	ld [sBattleTowerChallengeState], a
	ld hl, sNrOfBeatenBattleTowerTrainers
	inc [hl]
	call CloseSRAM
SkipBattleTowerTrainer: ; 1704c9
	ret
; 1704ca

BattleTowerAction: ; 170687
	ld a, [ScriptVar]
	ld e, a
	ld d, 0
	ld hl, .dw
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; 170696


.dw ; 170696 (5c:4696)
	dw BattleTowerAction_CheckExplanationRead ; 0x00
	dw BattleTowerAction_SetExplanationRead ; 0x01
	dw BattleTowerAction_GetChallengeState ; 0x02
	dw BattleTowerAction_SetByteToQuickSaveChallenge ; 0x03
	dw BattleTowerAction_SetByteToCancelChallenge ; 0x04
	dw SaveBattleTowerLevelGroup ; 0x07
	dw LoadBattleTowerLevelGroup ; 0x08
	dw BattleTower_CheckSaveFileExistsAndIsYours ; 0x09
	dw Function1708b1 ; 0x0a
	dw ResetBattleTowerTrainersSRAM ; 0x1a
	dw BattleTower_GiveReward ; 0x1b
	dw Function17071b ; 0x1c
	dw Function170729 ; 0x1d
	dw BattleTower_RandomlyChooseReward ; 0x1e
	dw BattleTower_SaveOptions ; 0x1f


; Reset the save memory for BattleTower-Trainers (Counter and all 7 TrainerBytes)
ResetBattleTowerTrainersSRAM: ; 1706d6 (5c:46d6) BattleTowerAction $1a
	ld a, BANK(sBTTrainers)
	call GetSRAMBank

	ld a, $ff
	ld hl, sBTTrainers
	ld bc, BATTLETOWER_NROFTRAINERS
	call ByteFill

	xor a
	ld [sNrOfBeatenBattleTowerTrainers], a

	call CloseSRAM

	ret

BattleTower_GiveReward: ; 1706ee (5c:46ee) BattleTowerAction $1b
	ld a, BANK(sBattleTowerReward)
	call GetSRAMBank

	ld a, [sBattleTowerReward]
	call CloseSRAM
	ld [ScriptVar], a
	ld hl, NumItems
	ld a, [hli]
	cp MAX_ITEMS
	ret c
	ld b, MAX_ITEMS
	ld a, [ScriptVar]
	ld c, a
.loop
	ld a, [hli]
	cp c
	jr nz, .next
	ld a, [hl]
	cp 95
	ret c
.next
	inc hl
	dec b
	jr nz, .loop
	ld a, POTION
	ld [ScriptVar], a
	ret

Function17071b: ; 17071b (5c:471b) BattleTowerAction $1c
	ld a, BANK(sBattleTowerChallengeState)
	call GetSRAMBank
	ld a, BATTLETOWER_WON_CHALLENGE
	ld [sBattleTowerChallengeState], a
	call CloseSRAM
	ret

Function170729: ; 170729 (5c:4729) BattleTowerAction $1d
	ld a, BANK(sBattleTowerChallengeState)
	call GetSRAMBank
	ld a, BATTLETOWER_RECEIVED_REWARD
	ld [sBattleTowerChallengeState], a
	call CloseSRAM
	ret

BattleTower_SaveOptions: ; 170737 (5c:4737) BattleTowerAction $1f
	callba SaveOptions
	ret

BattleTower_RandomlyChooseReward: ; 17073e (5c:473e) BattleTowerAction $1e
; Generate a random stat boosting item.
.loop
	call Random
	ld a, [hRandomAdd]
	and $7
	cp 6
	jr c, .okay
	sub 6
.okay
	add HP_UP
	cp LUCKY_PUNCH
	jr z, .loop
	push af
	ld a, BANK(sBattleTowerReward)
	call GetSRAMBank
	pop af
	ld [sBattleTowerReward], a
	call CloseSRAM
	ret

BattleTowerAction_CheckExplanationRead: ; 17075f (5c:475f) BattleTowerAction $00
	call BattleTower_CheckSaveFileExistsAndIsYours
	ld a, [ScriptVar]
	and a
	ret z

	ld a, BANK(s1_be4f)
	call GetSRAMBank
	ld a, [s1_be4f]
	and $2
	ld [ScriptVar], a
	call CloseSRAM
	ret

BattleTowerAction_GetChallengeState: ; 170778 (5c:4778) BattleTowerAction $02
	ld hl, sBattleTowerChallengeState
	ld a, BANK(sBattleTowerChallengeState)
	call GetSRAMBank
	ld a, [hl]
	ld [ScriptVar], a
	call CloseSRAM
	ret

BattleTowerAction_SetExplanationRead: ; 170788 (5c:4788) BattleTowerAction $01
	ld a, BANK(s1_be4f)
	call GetSRAMBank
	ld a, [s1_be4f]
	or $2
	ld [s1_be4f], a
	call CloseSRAM
	ret

BattleTowerAction_SetByteToQuickSaveChallenge: ; 170799 (5c:4799) BattleTowerAction $03
	ld c, BATTLETOWER_SAVED_AND_LEFT
	jr asm_17079f

BattleTowerAction_SetByteToCancelChallenge: ; 17079d (5c:479d) BattleTowerAction $04
	ld c, BATTLETOWER_NO_CHALLENGE
asm_17079f: ; 17079f (5c:479f)
	ld a, BANK(sBattleTowerChallengeState)
	call GetSRAMBank
	ld a, c
	ld [sBattleTowerChallengeState], a
	call CloseSRAM
	ret

SaveBattleTowerLevelGroup: ; 170868 (5c:4868) BattleTowerAction $07
	ld a, BANK(sBTChoiceOfLevelGroup)
	call GetSRAMBank
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
	ld a, [wBTChoiceOfLvlGroup]
	ld [sBTChoiceOfLevelGroup], a
	pop af
	ld [rSVBK], a
	call CloseSRAM
	ret

LoadBattleTowerLevelGroup: ; 170881 (5c:4881) BattleTowerAction $08 ; Load level group choice
	ld a, BANK(sBTChoiceOfLevelGroup)
	call GetSRAMBank
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
	ld a, [sBTChoiceOfLevelGroup]
	ld [wBTChoiceOfLvlGroup], a
	pop af
	ld [rSVBK], a
	call CloseSRAM
	ret

BattleTower_CheckSaveFileExistsAndIsYours: ; 17089a BattleTowerAction $09
	ld a, [wSaveFileExists]
	and a
	jr z, .nope
	callba CompareLoadedAndSavedPlayerID
	jr z, .yes
	xor a
	jr .nope

.yes
	ld a, $1

.nope
	ld [ScriptVar], a
	ret
; 1708b1


Function1708b1: ; 1708b1 (5c:48b1) BattleTowerAction $0a
	xor a
	ld [MusicFade], a
	call MaxVolume
	ret

Function170923: ; 170923
	ld a, $5
	call GetSRAMBank
	xor a
	ld [$aa48], a
	ld [$aa47], a
	ld hl, $aa5d
	ld bc, $0011
	call ByteFill
	call CloseSRAM
	ret
; 17093c


Function_LoadOpponentTrainerAndPokemonsWithOTSprite: ; 0x170b44
	callba Function_LoadOpponentTrainerAndPokemons
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
	ld hl, BT_OTTrainerClass
	ld a, [hl]
	dec a
	ld c, a
	ld b, $0
	pop af
	ld [rSVBK], a
	ld hl, .Sprites
	add hl, bc
	ld a, [hl]
	ld [wBTTempOTSprite], a

; Load sprite of the opponent trainer
; because s/he is chosen randomly and appears out of nowhere
	ld a, [ScriptVar]
	dec a
	sla a
	ld e, a
	sla a
	sla a
	sla a
	ld c, a
	ld b, 0
	ld d, 0
	ld hl, MapObjects
	add hl, bc
	inc hl
	ld a, [wBTTempOTSprite]
	ld [hl], a
	ld hl, UsedSprites
	add hl, de
	ld [hli], a
	ld [hUsedSpriteIndex], a
	ld a, [hl]
	ld [hUsedSpriteTile], a
	callba GetUsedSprite
	ret
; 170b90

.Sprites:
	db SPRITE_FALKNER
	db SPRITE_WHITNEY
	db SPRITE_BUGSY
	db SPRITE_MORTY
	db SPRITE_PRYCE
	db SPRITE_JASMINE
	db SPRITE_CHUCK
	db SPRITE_CLAIR
	db SPRITE_SILVER
	db SPRITE_OAK
	db SPRITE_WILL
	db SPRITE_CHRIS
	db SPRITE_BRUNO
	db SPRITE_KAREN
	db SPRITE_KOGA
	db SPRITE_LANCE
	db SPRITE_BROCK
	db SPRITE_MISTY
	db SPRITE_SURGE
	db SPRITE_SCIENTIST
	db SPRITE_ERIKA
	db SPRITE_YOUNGSTER
	db SPRITE_YOUNGSTER
	db SPRITE_YOUNGSTER
	db SPRITE_LASS
	db SPRITE_JANINE
	db SPRITE_COOLTRAINER_M
	db SPRITE_COOLTRAINER_F
	db SPRITE_BUENA
	db SPRITE_SUPER_NERD
	db SPRITE_ROCKET
	db SPRITE_GENTLEMAN
	db SPRITE_BUENA
	db SPRITE_TEACHER
	db SPRITE_SABRINA
	db SPRITE_BUG_CATCHER
	db SPRITE_FISHER
	db SPRITE_SUPER_NERD
	db SPRITE_COOLTRAINER_F
	db SPRITE_SAILOR
	db SPRITE_SUPER_NERD
	db SPRITE_BLUE
	db SPRITE_ROCKER
	db SPRITE_POKEFAN_M
	db SPRITE_BIKER
	db SPRITE_BLAINE
	db SPRITE_PHARMACIST
	db SPRITE_FISHER
	db SPRITE_SUPER_NERD
	db SPRITE_BLACK_BELT
	db SPRITE_ROCKET
	db SPRITE_YOUNGSTER
	db SPRITE_LASS
	db SPRITE_YOUNGSTER
	db SPRITE_ROCKET_GIRL
	db SPRITE_SAGE
	db SPRITE_GRANNY
	db SPRITE_ROCKER
	db SPRITE_POKEFAN_M
	db SPRITE_KIMONO_GIRL
	db SPRITE_TWIN
	db SPRITE_POKEFAN_F
	db SPRITE_RED
	db SPRITE_BLUE
	db SPRITE_OFFICER
	db SPRITE_ROCKET_GIRL

SpecialCheckForBattleTowerRules: ; 170bd3
	callba CheckForBattleTowerRules
	jr c, .asm_170bde
	xor a
	jr .asm_170be0

.asm_170bde
	ld a, $1

.asm_170be0
	ld [ScriptVar], a
	ret
; 170be4
