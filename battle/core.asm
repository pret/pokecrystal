BattleCore:

; Core components of the battle engine.


SendOutFirstMons: ; 3c000
	xor a
	ld [wBattleParticipantsNotFainted], a
	ld [wc6fc], a
	ld [wd0ec], a
	ld [BattleEnded], a
	inc a
	ld [wd264], a
	ld hl, OTPartyMon1HP
	ld bc, PARTYMON_STRUCT_LENGTH - 1
	ld d, BATTLEACTION_SWITCH1 - 1
.loop
	inc d
	ld a, [hli]
	or [hl]
	jr nz, .alive
	add hl, bc
	jr .loop

.alive
	ld a, d
	ld [wBattleAction], a
	ld a, [wLinkMode]
	and a
	jr z, .not_linked

	ld a, [hLinkPlayerNumber]
	cp $2
	jr z, .player_2

.not_linked
	ld a, [wBattleMode]
	dec a
	jr z, .wild
	xor a
	ld [wEnemySwitchMonIndex], a
	call NewEnemyMonStatus
	call ResetEnemyStatLevels
	call BreakAttraction
	call EnemySwitch

.wild
	ld c, 40
	call DelayFrames

.player_2
	call LoadTileMapToTempTileMap
	call CheckPlayerPartyForFitPkmn
	ld a, d
	and a
	jp z, LostBattle
	call Call_LoadTempTileMapToTileMap
	ld a, [BattleType]
	cp BATTLETYPE_DEBUG
	jp z, .tutorial_debug
	cp BATTLETYPE_TUTORIAL
	jp z, .tutorial_debug
	xor a
	ld [CurPartyMon], a
.loop2
	call CheckIfPartyHasPkmnToBattleWith
	jr nz, .alive2
	ld hl, CurPartyMon
	inc [hl]
	jr .loop2

.alive2
	ld a, [CurBattleMon]
	ld [LastPlayerMon], a
	ld a, [CurPartyMon]
	ld [CurBattleMon], a
	inc a
	ld hl, PartySpecies - 1
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld [CurPartySpecies], a
	ld [TempBattleMonSpecies], a
	hlcoord 1, 5
	ld a, $9
	call Function3d490
	call LoadTileMapToTempTileMap
	call ResetBattleParticipants
	call InitBattleMon
	call ResetPlayerStatLevels
	call SendOutPkmnText
	call NewBattleMonStatus
	call BreakAttraction
	call SendOutPlayerMon
	call EmptyBattleTextBox
	call LoadTileMapToTempTileMap
	call SetPlayerTurn
	call SpikesDamage
	ld a, [wLinkMode]
	and a
	jr z, .not_linked_2
	ld a, [hLinkPlayerNumber]
	cp $2
	jr nz, .not_linked_2
	xor a
	ld [wEnemySwitchMonIndex], a
	call NewEnemyMonStatus
	call ResetEnemyStatLevels
	call BreakAttraction
	call EnemySwitch
	call SetEnemyTurn
	call SpikesDamage

.not_linked_2
	jp Function3c12f

.tutorial_debug
	jp BattleMenu
; 3c0e5



WildFled_EnemyFled_LinkBattleCanceled: ; 3c0e5
	call Call_LoadTempTileMapToTileMap
	ld a, [wBattleResult]
	and $c0
	add $2
	ld [wBattleResult], a
	ld a, [wLinkMode]
	and a
	ld hl, BattleText_WildFled
	jr z, .asm_3c115

	ld a, [wBattleResult]
	and $c0
	ld [wBattleResult], a
	ld hl, BattleText_EnemyFled
	call CheckMobileBattleError
	jr nc, .asm_3c115

	ld hl, wcd2a
	bit 4, [hl]
	jr nz, .asm_3c118

	ld hl, BattleText_LinkErrorBattleCanceled

.asm_3c115
	call StdBattleTextBox

.asm_3c118
	call StopDangerSound
	call CheckMobileBattleError
	jr c, .asm_3c126

	ld de, SFX_RUN
	call PlaySFX

.asm_3c126
	call SetPlayerTurn
	ld a, 1
	ld [BattleEnded], a
	ret
; 3c12f


Function3c12f: ; 3c12f
.loop
	call MobileFn_3c1bf
	call CheckContestBattleOver
	jp c, .quit

	xor a
	ld [wPlayerIsSwitching], a
	ld [wEnemyIsSwitching], a
	ld [wd264], a
	ld [wPlayerJustGotFrozen], a
	ld [wEnemyJustGotFrozen], a
	ld [CurDamage], a
	ld [CurDamage + 1], a

	call HandleBerserkGene
	call UpdateBattleMonInParty
	callba AIChooseMove

	call IsMobileBattle
	jr nz, .not_disconnected
	callba Function100da5
	callba Function100641
	callba Function100dd8
	jp c, .quit
.not_disconnected

	call CheckPlayerLockedIn
	jr c, .skip_iteration
.loop1
	call BattleMenu
	jr c, .quit
	ld a, [BattleEnded]
	and a
	jr nz, .quit
	ld a, [wForcedSwitch] ; roared/whirlwinded/teleported
	and a
	jr nz, .quit
.skip_iteration
	call ParsePlayerAction
	jr nz, .loop1

	call EnemyTriesToFlee
	jr c, .quit

	call DetermineMoveOrder
	jr c, .false
	call Battle_EnemyFirst
	jr .proceed
.false
	call Battle_PlayerFirst
.proceed
	call CheckMobileBattleError
	jr c, .quit

	ld a, [wForcedSwitch]
	and a
	jr nz, .quit

	ld a, [BattleEnded]
	and a
	jr nz, .quit

	call HandleBetweenTurnEffects
	ld a, [BattleEnded]
	and a
	jr nz, .quit
	jp .loop

.quit
	ret
; 3c1bf

MobileFn_3c1bf: mobile
	ld a, $5
	call GetSRAMBank
	ld hl, $a89b ; s5_a89b
	inc [hl]
	jr nz, .finish
	dec hl
	inc [hl]
	jr nz, .finish
	dec [hl]
	inc hl
	dec [hl]

.finish
	call CloseSRAM
	ret
; 3c1d6


HandleBetweenTurnEffects: ; 3c1d6
	ld a, [hLinkPlayerNumber]
	cp $1
	jr z, .CheckEnemyFirst
	call CheckFaint_PlayerThenEnemy
	ret c
	call HandleFutureSight
	call CheckFaint_PlayerThenEnemy
	ret c
	call HandleWeather
	call CheckFaint_PlayerThenEnemy
	ret c
	call HandleWrap
	call CheckFaint_PlayerThenEnemy
	ret c
	call HandlePerishSong
	call CheckFaint_PlayerThenEnemy
	ret c
	jr .NoMoreFaintingConditions

.CheckEnemyFirst
	call CheckFaint_EnemyThenPlayer
	ret c
	call HandleFutureSight
	call CheckFaint_EnemyThenPlayer
	ret c
	call HandleWeather
	call CheckFaint_EnemyThenPlayer
	ret c
	call HandleWrap
	call CheckFaint_EnemyThenPlayer
	ret c
	call HandlePerishSong
	call CheckFaint_EnemyThenPlayer
	ret c

.NoMoreFaintingConditions
	call HandleLeftovers
	call HandleMysteryberry
	call HanleDefrost
	call HandleSafeguard
	call HandleScreens
	call HandleStatBoostingHeldItems
	call HandleHealingItems
	call UpdateBattleMonInParty
	call LoadTileMapToTempTileMap
	jp Function3c4df
; 3c23c

CheckFaint_PlayerThenEnemy: ; 3c23c
	call HasPlayerFainted
	jr nz, .PlayerNotFainted
	call HandlePlayerMonFaint
	ld a, [BattleEnded]
	and a
	jr nz, .BattleIsOver

.PlayerNotFainted
	call HasEnemyFainted
	jr nz, .BattleContinues
	call HandleEnemyMonFaint
	ld a, [BattleEnded]
	and a
	jr nz, .BattleIsOver

.BattleContinues
	and a
	ret

.BattleIsOver
	scf
	ret
; 3c25c

CheckFaint_EnemyThenPlayer: ; 3c25c
	call HasEnemyFainted
	jr nz, .EnemyNotFainted
	call HandleEnemyMonFaint
	ld a, [BattleEnded]
	and a
	jr nz, .BattleIsOver

.EnemyNotFainted
	call HasPlayerFainted
	jr nz, .BattleContinues
	call HandlePlayerMonFaint
	ld a, [BattleEnded]
	and a
	jr nz, .BattleIsOver

.BattleContinues
	and a
	ret

.BattleIsOver
	scf
	ret
; 3c27c

HandleBerserkGene: ; 3c27c
	ld a, [hLinkPlayerNumber]
	cp $1
	jr z, .reverse

	call .player
	jr .enemy

.reverse
	call .enemy
;	jr .player

.player
	call SetPlayerTurn
	ld de, PartyMon1Item
	ld a, [CurBattleMon]
	ld b, a
	jr .go

.enemy
	call SetEnemyTurn
	ld de, OTPartyMon1Item
	ld a, [CurOTMon]
	ld b, a
;	jr .go

.go
	push de
	push bc
	callab GetUserItem
	ld a, [hl]
	ld [wd265], a
	sub BERSERK_GENE
	pop bc
	pop de
	ret nz

	ld [hl], a

	ld h, d
	ld l, e
	ld a, b
	call GetPartyLocation
	xor a
	ld [hl], a
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	push af
	set SUBSTATUS_CONFUSED, [hl]
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarAddr
	push hl
	push af
	xor a
	ld [hl], a
	ld [AttackMissed], a
	ld [EffectFailed], a
	callba BattleCommand_AttackUp2
	pop af
	pop hl
	ld [hl], a
	call GetItemName
	ld hl, BattleText_UsersStringBuffer1Activated
	call StdBattleTextBox
	callab BattleCommand_StatUpMessage
	pop af
	bit SUBSTATUS_CONFUSED, a
	ret nz
	xor a
	ld [wcfca], a
	ld de, ANIM_CONFUSED
	call Call_PlayBattleAnim_OnlyIfVisible
	call SwitchTurnCore
	ld hl, BecameConfusedText
	jp StdBattleTextBox
; 3c300

EnemyTriesToFlee: ; 3c300
	ld a, [wLinkMode]
	and a
	jr z, .not_linked
	ld a, [wBattleAction]
	cp BATTLEACTION_FORFEIT
	jr z, .forfeit

.not_linked
	and a
	ret

.forfeit
	call WildFled_EnemyFled_LinkBattleCanceled
	scf
	ret
; 3c314

DetermineMoveOrder: ; 3c314
	ld a, [wLinkMode]
	and a
	jr z, .use_move
	ld a, [wBattleAction]
	cp BATTLEACTION_E
	jr z, .use_move
	cp BATTLEACTION_D
	jr z, .use_move
	sub BATTLEACTION_SWITCH1
	jr c, .use_move
	ld a, [wd0ec]
	cp $2
	jr nz, .switch
	ld a, [hLinkPlayerNumber]
	cp $2
	jr z, .player_2

	call BattleRandom
	cp 1 + (50 percent)
	jp c, .player_first
	jp .enemy_first

.player_2
	call BattleRandom
	cp 1 + (50 percent)
	jp c, .enemy_first
	jp .player_first

.switch
	callab AI_Switch
	call SetEnemyTurn
	call SpikesDamage
	jp .enemy_first

.use_move
	ld a, [wd0ec]
	and a
	jp nz, .player_first
	call CompareMovePriority
	jr z, .equal_priority
	jp c, .player_first ; player goes first
	jp .enemy_first

.equal_priority
	call SetPlayerTurn
	callab GetUserItem
	push bc
	callab GetOpponentItem
	pop de
	ld a, d
	cp HELD_QUICK_CLAW
	jr nz, .player_no_quick_claw
	ld a, b
	cp HELD_QUICK_CLAW
	jr z, .both_have_quick_claw
	call BattleRandom
	cp e
	jr nc, .speed_check
	jp .player_first

.player_no_quick_claw
	ld a, b
	cp HELD_QUICK_CLAW
	jr nz, .speed_check
	call BattleRandom
	cp c
	jr nc, .speed_check
	jp .enemy_first

.both_have_quick_claw
	ld a, [hLinkPlayerNumber]
	cp $2
	jr z, .player_2b
	call BattleRandom
	cp c
	jp c, .enemy_first
	call BattleRandom
	cp e
	jp c, .player_first
	jr .speed_check

.player_2b
	call BattleRandom
	cp e
	jp c, .player_first
	call BattleRandom
	cp c
	jp c, .enemy_first
	jr .speed_check

.speed_check
	ld de, BattleMonSpeed
	ld hl, EnemyMonSpeed
	ld c, 2
	call StringCmp
	jr z, .speed_tie
	jp nc, .player_first
	jp .enemy_first

.speed_tie
	ld a, [hLinkPlayerNumber]
	cp $2
	jr z, .player_2c
	call BattleRandom
	cp 1 + (50 percent)
	jp c, .player_first
	jp .enemy_first

.player_2c
	call BattleRandom
	cp 1 + (50 percent)
	jp c, .enemy_first
.player_first
	scf
	ret
; 3c3f3

.enemy_first: ; 3c3f3
	and a
	ret
; 3c3f5

CheckContestBattleOver: ; 3c3f5
	ld a, [BattleType]
	cp BATTLETYPE_CONTEST
	jr nz, .contest_not_over
	ld a, [wParkBallsRemaining]
	and a
	jr nz, .contest_not_over
	ld a, [wBattleResult]
	and $c0
	add $2
	ld [wBattleResult], a
	scf
	ret

.contest_not_over
	and a
	ret
; 3c410

CheckPlayerLockedIn: ; 3c410
	ld a, [PlayerSubStatus4]
	and 1 << SUBSTATUS_RECHARGE
	jp nz, .quit

	ld hl, EnemySubStatus3
	res SUBSTATUS_FLINCHED, [hl]
	ld hl, PlayerSubStatus3
	res SUBSTATUS_FLINCHED, [hl]

	ld a, [hl]
	and 1 << SUBSTATUS_CHARGED | 1 << SUBSTATUS_RAMPAGE
	jp nz, .quit

	ld hl, PlayerSubStatus1
	bit SUBSTATUS_ROLLOUT, [hl]
	jp nz, .quit

	and a
	ret

.quit
	scf
	ret
; 3c434

ParsePlayerAction: ; 3c434
	call CheckPlayerLockedIn
	jp c, .locked_in
	ld hl, PlayerSubStatus5
	bit SUBSTATUS_ENCORED, [hl]
	jr z, .not_encored
	ld a, [LastPlayerMove]
	ld [CurPlayerMove], a
	jr .encored

.not_encored
	ld a, [wd0ec]
	cp $2
	jr z, .reset_rage
	and a
	jr nz, .reset_bide
	ld a, [PlayerSubStatus3]
	and 1 << SUBSTATUS_BIDE
	jr nz, .locked_in
	xor a
	ld [wd235], a
	inc a ; POUND
	ld [FXAnimIDLo], a
	call MoveSelectionScreen
	push af
	call Call_LoadTempTileMapToTileMap
	call UpdateBattleHuds
	ld a, [CurPlayerMove]
	cp STRUGGLE
	jr z, .struggle
	call PlayClickSFX

.struggle
	ld a, $1
	ld [hBGMapMode], a
	pop af
	ret nz

.encored
	call SetPlayerTurn
	callab UpdateMoveData
	xor a
	ld [wPlayerCharging], a
	ld a, [wPlayerMoveStruct + MOVE_EFFECT]
	cp EFFECT_FURY_CUTTER
	jr z, .continue_fury_cutter
	xor a
	ld [PlayerFuryCutterCount], a

.continue_fury_cutter
	ld a, [wPlayerMoveStruct + MOVE_EFFECT]
	cp EFFECT_RAGE
	jr z, .continue_rage
	ld hl, PlayerSubStatus4
	res SUBSTATUS_RAGE, [hl]
	xor a
	ld [wPlayerRageCounter], a

.continue_rage
	ld a, [wPlayerMoveStruct + MOVE_EFFECT]
	cp EFFECT_PROTECT
	jr z, .continue_protect
	cp EFFECT_ENDURE
	jr z, .continue_protect
	xor a
	ld [PlayerProtectCount], a
	jr .continue_protect

.reset_bide
	ld hl, PlayerSubStatus3
	res SUBSTATUS_BIDE, [hl]

.locked_in
	xor a
	ld [PlayerFuryCutterCount], a
	ld [PlayerProtectCount], a
	ld [wPlayerRageCounter], a
	ld hl, PlayerSubStatus4
	res SUBSTATUS_RAGE, [hl]

.continue_protect
	call ParseEnemyAction
	xor a
	ret

.reset_rage
	xor a
	ld [PlayerFuryCutterCount], a
	ld [PlayerProtectCount], a
	ld [wPlayerRageCounter], a
	ld hl, PlayerSubStatus4
	res SUBSTATUS_RAGE, [hl]
	xor a
	ret
; 3c4df

Function3c4df: ; 3c4df
	ld a, [hLinkPlayerNumber]
	cp $1
	jr z, .asm_3c4ea
	call .asm_3c4ed
	jr .asm_3c518

.asm_3c4ea
	call .asm_3c518
.asm_3c4ed
	ld hl, PlayerSubStatus5
	bit SUBSTATUS_ENCORED, [hl]
	ret z
	ld a, [PlayerEncoreCount]
	dec a
	ld [PlayerEncoreCount], a
	jr z, .asm_3c50a
	ld hl, BattleMonPP
	ld a, [CurMoveNum]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	and $3f
	ret nz

.asm_3c50a
	ld hl, PlayerSubStatus5
	res SUBSTATUS_ENCORED, [hl]
	call SetEnemyTurn
	ld hl, BattleText_TargetsEncoreEnded
	jp StdBattleTextBox

.asm_3c518
	ld hl, EnemySubStatus5
	bit SUBSTATUS_ENCORED, [hl]
	ret z
	ld a, [EnemyEncoreCount]
	dec a
	ld [EnemyEncoreCount], a
	jr z, .asm_3c535
	ld hl, EnemyMonPP
	ld a, [CurEnemyMoveNum]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	and $3f
	ret nz

.asm_3c535
	ld hl, EnemySubStatus5
	res SUBSTATUS_ENCORED, [hl]
	call SetPlayerTurn
	ld hl, BattleText_TargetsEncoreEnded
	jp StdBattleTextBox
; 3c543


TryEnemyFlee: ; 3c543
	ld a, [wBattleMode]
	dec a
	jr nz, .Stay

	ld a, [PlayerSubStatus5]
	bit SUBSTATUS_CANT_RUN, a
	jr nz, .Stay

	ld a, [wEnemyWrapCount]
	and a
	jr nz, .Stay

	ld a, [EnemyMonStatus]
	and 1 << FRZ | SLP
	jr nz, .Stay

	ld a, [TempEnemyMonSpecies]
	ld de, 1
	ld hl, AlwaysFleeMons
	call IsInArray
	jr c, .Flee

	call BattleRandom
	ld b, a
	cp 1 + (50 percent)
	jr nc, .Stay

	push bc
	ld a, [TempEnemyMonSpecies]
	ld de, 1
	ld hl, OftenFleeMons
	call IsInArray
	pop bc
	jr c, .Flee

	ld a, b
	cp 1 + (10 percent)
	jr nc, .Stay

	ld a, [TempEnemyMonSpecies]
	ld de, 1
	ld hl, SometimesFleeMons
	call IsInArray
	jr c, .Flee

.Stay
	and a
	ret

.Flee
	scf
	ret
; 3c59a

FleeMons:

SometimesFleeMons: ; 3c59a
	db MAGNEMITE
	db GRIMER
	db TANGELA
	db MR__MIME
	db EEVEE
	db PORYGON
	db DRATINI
	db DRAGONAIR
	db TOGETIC
	db UMBREON
	db UNOWN
	db SNUBBULL
	db HERACROSS
	db -1

OftenFleeMons: ; 3c5a8
	db CUBONE
	db ARTICUNO
	db ZAPDOS
	db MOLTRES
	db QUAGSIRE
	db DELIBIRD
	db PHANPY
	db TEDDIURSA
	db -1

AlwaysFleeMons: ; 3c5b1
	db RAIKOU
	db ENTEI
;	db SUICUNE
	db -1
; 3c5b4


CompareMovePriority: ; 3c5b4
; Compare the priority of the player and enemy's moves.
; Return carry if the player goes first, or z if they match.

	ld a, [CurPlayerMove]
	call GetMovePriority
	ld b, a
	push bc
	ld a, [CurEnemyMove]
	call GetMovePriority
	pop bc
	cp b
	ret
; 3c5c5

GetMovePriority: ; 3c5c5
; Return the priority (0-3) of move a.

	ld b, a

	; Vital throw goes last.
	cp VITAL_THROW
	ld a, 0
	ret z

	call GetMoveEffect
	ld hl, MoveEffectPriorities
.loop
	ld a, [hli]
	cp b
	jr z, .done
	inc hl
	cp -1
	jr nz, .loop

	ld a, 1
	ret

.done
	ld a, [hl]
	ret
; 3c5df

MoveEffectPriorities: ; 3c5df
	db EFFECT_PROTECT,      3
	db EFFECT_ENDURE,       3
	db EFFECT_PRIORITY_HIT, 2
	db EFFECT_WHIRLWIND,    0
	db EFFECT_COUNTER,      0
	db EFFECT_MIRROR_COAT,  0
	db -1
; 3c5ec


GetMoveEffect: ; 3c5ec
	ld a, b
	dec a
	ld hl, Moves + MOVE_EFFECT
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	ld b, a
	ret
; 3c5fe


Battle_EnemyFirst: ; 3c5fe
	call LoadTileMapToTempTileMap
	call TryEnemyFlee
	jp c, WildFled_EnemyFled_LinkBattleCanceled
	call SetEnemyTurn
	ld a, $1
	ld [wEnemyGoesFirst], a
	callab AI_SwitchOrTryItem
	jr c, .switch_item
	call EnemyTurn_EndOpponentProtectEndureDestinyBond
	call CheckMobileBattleError
	ret c
	ld a, [wForcedSwitch]
	and a
	ret nz
	call HasPlayerFainted
	jp z, HandlePlayerMonFaint
	call HasEnemyFainted
	jp z, HandleEnemyMonFaint

.switch_item
	call SetEnemyTurn
	call ResidualDamage
	jp z, HandleEnemyMonFaint
	call RefreshBattleHuds
	call PlayerTurn_EndOpponentProtectEndureDestinyBond
	call CheckMobileBattleError
	ret c
	ld a, [wForcedSwitch]
	and a
	ret nz
	call HasEnemyFainted
	jp z, HandleEnemyMonFaint
	call HasPlayerFainted
	jp z, HandlePlayerMonFaint
	call SetPlayerTurn
	call ResidualDamage
	jp z, HandlePlayerMonFaint
	call RefreshBattleHuds
	xor a
	ld [wd0ec], a
	ret
; 3c664

Battle_PlayerFirst: ; 3c664
	xor a
	ld [wEnemyGoesFirst], a
	call SetEnemyTurn
	callab AI_SwitchOrTryItem
	push af
	call PlayerTurn_EndOpponentProtectEndureDestinyBond
	pop bc
	ld a, [wForcedSwitch]
	and a
	ret nz
	call CheckMobileBattleError
	ret c
	call HasEnemyFainted
	jp z, HandleEnemyMonFaint
	call HasPlayerFainted
	jp z, HandlePlayerMonFaint
	push bc
	call SetPlayerTurn
	call ResidualDamage
	pop bc
	jp z, HandlePlayerMonFaint
	push bc
	call RefreshBattleHuds
	pop af
	jr c, .switched_or_used_item
	call LoadTileMapToTempTileMap
	call TryEnemyFlee
	jp c, WildFled_EnemyFled_LinkBattleCanceled
	call EnemyTurn_EndOpponentProtectEndureDestinyBond
	call CheckMobileBattleError
	ret c
	ld a, [wForcedSwitch]
	and a
	ret nz
	call HasPlayerFainted
	jp z, HandlePlayerMonFaint
	call HasEnemyFainted
	jp z, HandleEnemyMonFaint

.switched_or_used_item
	call SetEnemyTurn
	call ResidualDamage
	jp z, HandleEnemyMonFaint
	call RefreshBattleHuds
	xor a
	ld [wd0ec], a
	ret
; 3c6cf

PlayerTurn_EndOpponentProtectEndureDestinyBond: ; 3c6cf
	call SetPlayerTurn
	call EndUserDestinyBond
	callab DoPlayerTurn
	jp EndOpponentProtectEndureDestinyBond
; 3c6de

EnemyTurn_EndOpponentProtectEndureDestinyBond: ; 3c6de
	call SetEnemyTurn
	call EndUserDestinyBond
	callab DoEnemyTurn
	jp EndOpponentProtectEndureDestinyBond
; 3c6ed

EndOpponentProtectEndureDestinyBond: ; 3c6ed
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVarAddr
	res SUBSTATUS_PROTECT, [hl]
	res SUBSTATUS_ENDURE, [hl]
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	res SUBSTATUS_DESTINY_BOND, [hl]
	ret
; 3c6fe

EndUserDestinyBond: ; 3c6fe
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	res SUBSTATUS_DESTINY_BOND, [hl]
	ret
; 3c706

HasUserFainted: ; 3c706
	ld a, [hBattleTurn]
	and a
	jr z, HasPlayerFainted
HasEnemyFainted: ; 3c70b
	ld hl, EnemyMonHP
	jr CheckIfHPIsZero

HasPlayerFainted: ; 3c710
	ld hl, BattleMonHP

CheckIfHPIsZero: ; 3c713
	ld a, [hli]
	or [hl]
	ret
; 3c716

ResidualDamage: ; 3c716
; Return z if the user fainted before
; or as a result of residual damage.
; For Sandstorm damage, see HandleWeather.

	call HasUserFainted
	ret z

	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and 1 << PSN | 1 << BRN
	jr z, .did_psn_brn

	ld hl, HurtByPoisonText
	ld de, ANIM_PSN
	and 1 << BRN
	jr z, .got_anim
	ld hl, HurtByBurnText
	ld de, ANIM_BRN
.got_anim

	push de
	call StdBattleTextBox
	pop de

	xor a
	ld [wcfca], a
	call Call_PlayBattleAnim_OnlyIfVisible
	call GetEighthMaxHP
	ld de, PlayerToxicCount
	ld a, [hBattleTurn]
	and a
	jr z, .check_toxic
	ld de, EnemyToxicCount
.check_toxic

	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVar
	bit SUBSTATUS_TOXIC, a
	jr z, .did_toxic
	call GetSixteenthMaxHP
	ld a, [de]
	inc a
	ld [de], a
	ld hl, 0
.add
	add hl, bc
	dec a
	jr nz, .add
	ld b, h
	ld c, l
.did_toxic

	call SubtractHPFromUser
.did_psn_brn

	call HasUserFainted
	jp z, .fainted

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	bit SUBSTATUS_LEECH_SEED, [hl]
	jr z, .not_seeded

	call SwitchTurnCore
	xor a
	ld [wcfca], a
	ld de, ANIM_SAP
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	call z, Call_PlayBattleAnim_OnlyIfVisible
	call SwitchTurnCore

	call GetEighthMaxHP
	call SubtractHPFromUser
	ld a, $1
	ld [hBGMapMode], a
	call RestoreHP
	ld hl, LeechSeedSapsText
	call StdBattleTextBox
.not_seeded

	call HasUserFainted
	jr z, .fainted

	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	bit SUBSTATUS_NIGHTMARE, [hl]
	jr z, .not_nightmare
	xor a
	ld [wcfca], a
	ld de, ANIM_IN_NIGHTMARE
	call Call_PlayBattleAnim_OnlyIfVisible
	call GetQuarterMaxHP
	call SubtractHPFromUser
	ld hl, HasANightmareText
	call StdBattleTextBox
.not_nightmare

	call HasUserFainted
	jr z, .fainted

	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	bit SUBSTATUS_CURSE, [hl]
	jr z, .not_cursed

	xor a
	ld [wcfca], a
	ld de, ANIM_IN_NIGHTMARE
	call Call_PlayBattleAnim_OnlyIfVisible
	call GetQuarterMaxHP
	call SubtractHPFromUser
	ld hl, HurtByCurseText
	call StdBattleTextBox

.not_cursed
	ld hl, BattleMonHP
	ld a, [hBattleTurn]
	and a
	jr z, .check_fainted
	ld hl, EnemyMonHP

.check_fainted
	ld a, [hli]
	or [hl]
	ret nz

.fainted
	call RefreshBattleHuds
	ld c, 20
	call DelayFrames
	xor a
	ret
; 3c801

HandlePerishSong: ; 3c801
	ld a, [hLinkPlayerNumber]
	cp $1
	jr z, .EnemyFirst
	call SetPlayerTurn
	call .do_it
	call SetEnemyTurn
	jp .do_it

.EnemyFirst
	call SetEnemyTurn
	call .do_it
	call SetPlayerTurn

.do_it
	ld hl, PlayerPerishCount
	ld a, [hBattleTurn]
	and a
	jr z, .got_count
	ld hl, EnemyPerishCount

.got_count
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVar
	bit SUBSTATUS_PERISH, a
	ret z
	dec [hl]
	ld a, [hl]
	ld [wd265], a
	push af
	ld hl, PerishCountText
	call StdBattleTextBox
	pop af
	ret nz
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	res SUBSTATUS_PERISH, [hl]
	ld a, [hBattleTurn]
	and a
	jr nz, .asm_3c85c
	ld hl, BattleMonHP
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, PartyMon1HP
	ld a, [CurBattleMon]
	call GetPartyLocation
	xor a
	ld [hli], a
	ld [hl], a
	ret

.asm_3c85c
	ld hl, EnemyMonHP
	xor a
	ld [hli], a
	ld [hl], a
	ld a, [wBattleMode]
	dec a
	ret z
	ld hl, OTPartyMon1HP
	ld a, [CurOTMon]
	call GetPartyLocation
	xor a
	ld [hli], a
	ld [hl], a
	ret
; 3c874

HandleWrap: ; 3c874
	ld a, [hLinkPlayerNumber]
	cp $1
	jr z, .EnemyFirst
	call SetPlayerTurn
	call .do_it
	call SetEnemyTurn
	jp .do_it

.EnemyFirst
	call SetEnemyTurn
	call .do_it
	call SetPlayerTurn

.do_it
	ld hl, wPlayerWrapCount
	ld de, wPlayerTrappingMove
	ld a, [hBattleTurn]
	and a
	jr z, .got_addrs
	ld hl, wEnemyWrapCount
	ld de, wEnemyTrappingMove

.got_addrs
	ld a, [hl]
	and a
	ret z

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret nz

	ld a, [de]
	ld [wd265], a
	ld [FXAnimIDLo], a
	call GetMoveName
	dec [hl]
	jr z, .release_from_bounds

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	jr nz, .skip_anim

	call SwitchTurnCore
	xor a
	ld [wcfca], a
	ld [FXAnimIDHi], a
	predef PlayBattleAnim
	call SwitchTurnCore

.skip_anim
	call GetSixteenthMaxHP
	call SubtractHPFromUser
	ld hl, BattleText_UsersHurtByStringBuffer1
	jr .asm_3c8e1

.release_from_bounds
	ld hl, BattleText_UserWasReleasedFromStringBuffer1

.asm_3c8e1
	jp StdBattleTextBox
; 3c8e4

SwitchTurnCore: ; 3c8e4
	ld a, [hBattleTurn]
	xor 1
	ld [hBattleTurn], a
	ret
; 3c8eb

HandleLeftovers: ; 3c8eb
	ld a, [hLinkPlayerNumber]
	cp $1
	jr z, .DoEnemyFirst
	call SetPlayerTurn
	call .do_it
	call SetEnemyTurn
	jp .do_it

.DoEnemyFirst
	call SetEnemyTurn
	call .do_it
	call SetPlayerTurn
.do_it

	callab GetUserItem
	ld a, [hl]
	ld [wd265], a
	call GetItemName
	ld a, b
	cp HELD_LEFTOVERS
	ret nz

	ld hl, BattleMonHP
	ld a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, EnemyMonHP

.got_hp
; Don't restore if we're already at max HP
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	cp b
	jr nz, .restore
	ld a, [hl]
	cp c
	ret z

.restore
	call GetSixteenthMaxHP
	call SwitchTurnCore
	call RestoreHP
	ld hl, BattleText_0x80880
	jp StdBattleTextBox
; 3c93c

HandleMysteryberry: ; 3c93c
	ld a, [hLinkPlayerNumber]
	cp $1
	jr z, .DoEnemyFirst
	call SetPlayerTurn
	call .do_it
	call SetEnemyTurn
	jp .do_it

.DoEnemyFirst
	call SetEnemyTurn
	call .do_it
	call SetPlayerTurn

.do_it
	callab GetUserItem
	ld a, b
	cp HELD_RESTORE_PP
	jr nz, .quit
	ld hl, PartyMon1PP
	ld a, [CurBattleMon]
	call GetPartyLocation
	ld d, h
	ld e, l
	ld hl, PartyMon1Moves
	ld a, [CurBattleMon]
	call GetPartyLocation
	ld a, [hBattleTurn]
	and a
	jr z, .wild
	ld de, wc739
	ld hl, wc735
	ld a, [wBattleMode]
	dec a
	jr z, .wild
	ld hl, OTPartyMon1PP
	ld a, [CurOTMon]
	call GetPartyLocation
	ld d, h
	ld e, l
	ld hl, OTPartyMon1Moves
	ld a, [CurOTMon]
	call GetPartyLocation

.wild
	ld c, $0
.loop
	ld a, [hl]
	and a
	jr z, .quit
	ld a, [de]
	and $3f
	jr z, .restore
	inc hl
	inc de
	inc c
	ld a, c
	cp NUM_MOVES
	jr nz, .loop

.quit
	ret

.restore
	; lousy hack
	ld a, [hl]
	cp SKETCH
	ld b, 1
	jr z, .sketch
	ld b, 5
.sketch
	ld a, [de]
	add b
	ld [de], a
	push bc
	push bc
	ld a, [hl]
	ld [wd265], a
	ld de, BattleMonMoves - 1
	ld hl, BattleMonPP
	ld a, [hBattleTurn]
	and a
	jr z, .player_pp
	ld de, EnemyMonMoves - 1
	ld hl, EnemyMonPP
.player_pp
	inc de
	pop bc
	ld b, 0
	add hl, bc
	push hl
	ld h, d
	ld l, e
	add hl, bc
	pop de
	pop bc

	ld a, [wd265]
	cp [hl]
	jr nz, .skip_checks
	ld a, [hBattleTurn]
	and a
	ld a, [PlayerSubStatus5]
	jr z, .check_transform
	ld a, [EnemySubStatus5]
.check_transform
	bit SUBSTATUS_TRANSFORMED, a
	jr nz, .skip_checks
	ld a, [de]
	add b
	ld [de], a
.skip_checks
	callab GetUserItem
	ld a, [hl]
	ld [wd265], a
	xor a
	ld [hl], a
	call GetPartymonItem
	ld a, [hBattleTurn]
	and a
	jr z, .consume_item
	ld a, [wBattleMode]
	dec a
	jr z, .skip_consumption
	call GetOTPartymonItem

.consume_item
	xor a
	ld [hl], a

.skip_consumption
	call GetItemName
	call SwitchTurnCore
	call ItemRecoveryAnim
	call SwitchTurnCore
	ld hl, BattleText_UserRecoveredPPUsing
	jp StdBattleTextBox
; 3ca26

HandleFutureSight: ; 3ca26
	ld a, [hLinkPlayerNumber]
	cp $1
	jr z, .enemy_first
	call SetPlayerTurn
	call .do_it
	call SetEnemyTurn
	jp .do_it

.enemy_first
	call SetEnemyTurn
	call .do_it
	call SetPlayerTurn

.do_it
	ld hl, wPlayerFutureSightCount
	ld a, [hBattleTurn]
	and a
	jr z, .okay
	ld hl, wEnemyFutureSightCount

.okay
	ld a, [hl]
	and a
	ret z
	dec a
	ld [hl], a
	cp $1
	ret nz

	ld hl, BattleText_0x808b6
	call StdBattleTextBox

	ld a, BATTLE_VARS_MOVE
	call GetBattleVarAddr
	push af
	ld a, FUTURE_SIGHT
	ld [hl], a

	callab UpdateMoveData
	xor a
	ld [AttackMissed], a
	ld [AlreadyDisobeyed], a
	ld a, 10
	ld [TypeModifier], a
	callab DoMove
	xor a
	ld [CurDamage], a
	ld [CurDamage + 1], a

	ld a, BATTLE_VARS_MOVE
	call GetBattleVarAddr
	pop af
	ld [hl], a

	call UpdateBattleMonInParty
	jp UpdateEnemyMonInParty
; 3ca8f

HanleDefrost: ; 3ca8f
	ld a, [hLinkPlayerNumber]
	cp $1
	jr z, .enemy_first
	call .do_player_turn
	jr .do_enemy_turn

.enemy_first
	call .do_enemy_turn
.do_player_turn
	ld a, [BattleMonStatus]
	bit FRZ, a
	ret z

	ld a, [wPlayerJustGotFrozen]
	and a
	ret nz

	call BattleRandom
	cp 10 percent
	ret nc
	xor a
	ld [BattleMonStatus], a
	ld a, [CurBattleMon]
	ld hl, PartyMon1Status
	call GetPartyLocation
	ld [hl], 0
	call UpdateBattleHuds
	call SetEnemyTurn
	ld hl, DefrostedOpponentText
	jp StdBattleTextBox

.do_enemy_turn
	ld a, [EnemyMonStatus]
	bit FRZ, a
	ret z
	ld a, [wEnemyJustGotFrozen]
	and a
	ret nz
	call BattleRandom
	cp 10 percent
	ret nc
	xor a
	ld [EnemyMonStatus], a

	ld a, [wBattleMode]
	dec a
	jr z, .asm_3caef
	ld a, [CurOTMon]
	ld hl, OTPartyMon1Status
	call GetPartyLocation
	ld [hl], 0
.asm_3caef

	call UpdateBattleHuds
	call SetPlayerTurn
	ld hl, DefrostedOpponentText
	jp StdBattleTextBox
; 3cafb

HandleSafeguard: ; 3cafb
	ld a, [hLinkPlayerNumber]
	cp $1
	jr z, .asm_3cb06
	call .asm_3cb09
	jr .asm_3cb1c

.asm_3cb06
	call .asm_3cb1c
.asm_3cb09
	ld a, [PlayerScreens]
	bit SCREENS_SAFEGUARD, a
	ret z
	ld hl, PlayerSafeguardCount
	dec [hl]
	ret nz
	res SCREENS_SAFEGUARD, a
	ld [PlayerScreens], a
	xor a
	jr .asm_3cb2e

.asm_3cb1c
	ld a, [EnemyScreens]
	bit SCREENS_SAFEGUARD, a
	ret z
	ld hl, EnemySafeguardCount
	dec [hl]
	ret nz
	res SCREENS_SAFEGUARD, a
	ld [EnemyScreens], a
	ld a, $1

.asm_3cb2e
	ld [hBattleTurn], a
	ld hl, BattleText_SafeguardFaded
	jp StdBattleTextBox


HandleScreens: ; 3cb36
	ld a, [hLinkPlayerNumber]
	cp 1
	jr z, .Both
	call .CheckPlayer
	jr .CheckEnemy

.Both
	call .CheckEnemy

.CheckPlayer
	call SetPlayerTurn
	ld de, .Your
	call .Copy
	ld hl, PlayerScreens
	ld de, PlayerLightScreenCount
	jr .FadeScreens

.CheckEnemy
	call SetEnemyTurn
	ld de, .Enemy
	call .Copy
	ld hl, EnemyScreens
	ld de, EnemyLightScreenCount

.FadeScreens
	bit SCREENS_LIGHT_SCREEN, [hl]
	call nz, FadeLightScreen
	bit SCREENS_REFLECT, [hl]
	call nz, FadeReflect
	ret

.Copy
	ld hl, StringBuffer1
	jp CopyName2
; 3cb75

.Your
	db "Your@"
.Enemy
	db "Enemy@"
; 3cb80


FadeLightScreen: ; 3cb80
	ld a, [de]
	dec a
	ld [de], a
	ret nz
	res SCREENS_LIGHT_SCREEN, [hl]
	push hl
	push de
	ld hl, BattleText_PkmnnLightScreenFell
	call StdBattleTextBox
	pop de
	pop hl
	ret
; 3cb91

FadeReflect: ; 3cb91
	inc de
	ld a, [de]
	dec a
	ld [de], a
	ret nz
	res SCREENS_REFLECT, [hl]
	ld hl, BattleText_0x80905
	jp StdBattleTextBox
; 3cb9e

HandleWeather: ; 3cb9e
	ld a, [Weather]
	cp WEATHER_NONE
	ret z

	ld hl, WeatherCount
	dec [hl]
	jr z, .ended

	ld hl, .WeatherMessages
	call .PrintWeatherMessage

	ld a, [Weather]
	cp WEATHER_SANDSTORM
	ret nz

	ld a, [hLinkPlayerNumber]
	cp 1
	jr z, .enemy_first

.player_first
	call SetPlayerTurn
	call .SandstormDamage
	call SetEnemyTurn
	jr .SandstormDamage

.enemy_first
	call SetEnemyTurn
	call .SandstormDamage
	call SetPlayerTurn

.SandstormDamage
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	bit SUBSTATUS_UNDERGROUND, a
	ret nz

	ld hl, BattleMonType1
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, EnemyMonType1
.ok
	ld a, [hli]
	cp ROCK
	ret z
	cp GROUND
	ret z
	cp STEEL
	ret z

	ld a, [hl]
	cp ROCK
	ret z
	cp GROUND
	ret z
	cp STEEL
	ret z

	call SwitchTurnCore
	xor a
	ld [wcfca], a
	ld de, ANIM_IN_SANDSTORM
	call Call_PlayBattleAnim
	call SwitchTurnCore
	call GetEighthMaxHP
	call SubtractHPFromUser

	ld hl, SandstormHitsText
	jp StdBattleTextBox

.ended
	ld hl, .WeatherEndedMessages
	call .PrintWeatherMessage
	xor a
	ld [Weather], a
	ret

.PrintWeatherMessage
	ld a, [Weather]
	dec a
	ld c, a
	ld b, 0
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp StdBattleTextBox
; 3cc2d

.WeatherMessages
	dw BattleText_RainContinuesToFall
	dw BattleText_TheSunlightIsStrong
	dw BattleText_TheSandstormRages
.WeatherEndedMessages
	dw BattleText_TheRainStopped
	dw BattleText_TheSunlightFaded
	dw BattleText_TheSandstormSubsided
; 3cc39

SubtractHPFromTarget: ; 3cc39
	call SubtractHP
	jp UpdateHPBar
; 3cc3f

SubtractHPFromUser: ; 3cc3f
; Subtract HP from Pkmn
	call SubtractHP
	jp UpdateHPBarBattleHuds
; 3cc45


SubtractHP: ; 3cc45
	ld hl, BattleMonHP
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, EnemyMonHP
.ok
	inc hl
	ld a, [hl]
	ld [wd1ec], a
	sub c
	ld [hld], a
	ld [wd1ee], a
	ld a, [hl]
	ld [wd1ed], a
	sbc b
	ld [hl], a
	ld [wd1ef], a
	ret nc

	ld a, [wd1ec]
	ld c, a
	ld a, [wd1ed]
	ld b, a
	xor a
	ld [hli], a
	ld [hl], a
	ld [wd1ee], a
	ld [wd1ef], a
	ret
; 3cc76

GetSixteenthMaxHP: ; 3cc76
	call GetQuarterMaxHP
	; quarter result
	srl c
	srl c
	; round up
	ld a, c
	and a
	jr nz, .ok
	inc c
.ok
	ret
; 3cc83


GetEighthMaxHP: ; 3cc83
; output: bc
	call GetQuarterMaxHP
; assumes nothing can have 1024 or more hp
; halve result
	srl c
; round up
	ld a, c
	and a
	jr nz, .end
	inc c
.end
	ret
; 3cc8e


GetQuarterMaxHP: ; 3cc8e
; output: bc
	call GetMaxHP

; quarter result
	srl b
	rr c
	srl b
	rr c

; assumes nothing can have 1024 or more hp
; round up
	ld a, c
	and a
	jr nz, .end
	inc c
.end
	ret
; 3cc9f


GetHalfMaxHP: ; 3cc9f
; output: bc
	call GetMaxHP

; halve result
	srl b
	rr c

; floor = 1
	ld a, c
	or b
	jr nz, .end
	inc c
.end
	ret
; 3ccac


GetMaxHP: ; 3ccac
; output: bc, Buffer1-2

	ld hl, BattleMonMaxHP
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, EnemyMonMaxHP
.ok
	ld a, [hli]
	ld [Buffer2], a
	ld b, a

	ld a, [hl]
	ld [Buffer1], a
	ld c, a
	ret
; 3ccc2

Function3ccc2: ; 3ccc2
	ld hl, BattleMonHP
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, EnemyMonHP
.ok
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	srl b
	rr c
	ld a, [hli]
	ld [Buffer2], a
	ld a, [hl]
	ld [Buffer1], a
	ret
; 3ccde

CheckUserHasEnoughHP: ; 3ccde
	ld hl, BattleMonHP + 1
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, EnemyMonHP + 1
.ok
	ld a, c
	sub [hl]
	dec hl
	ld a, b
	sbc [hl]
	ret
; 3ccef


RestoreHP ; 3ccef
	ld hl, EnemyMonMaxHP
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, BattleMonMaxHP
.ok
	ld a, [hli]
	ld [Buffer2], a
	ld a, [hld]
	ld [Buffer1], a
	dec hl
	ld a, [hl]
	ld [Buffer3], a
	add c
	ld [hld], a
	ld [Buffer5], a
	ld a, [hl]
	ld [Buffer4], a
	adc b
	ld [hli], a
	ld [Buffer6], a

	ld a, [Buffer1]
	ld c, a
	ld a, [hld]
	sub c
	ld a, [Buffer2]
	ld b, a
	ld a, [hl]
	sbc b
	jr c, .asm_3cd2d
	ld a, b
	ld [hli], a
	ld [Buffer6], a
	ld a, c
	ld [hl], a
	ld [Buffer5], a
.asm_3cd2d

	call SwitchTurnCore
	call UpdateHPBarBattleHuds
	jp SwitchTurnCore
; 3cd36

UpdateHPBarBattleHuds: ; 3cd36
	call UpdateHPBar
	jp UpdateBattleHuds
; 3cd3c

UpdateHPBar: ; 3cd3c
	hlcoord 10, 9
	ld a, [hBattleTurn]
	and a
	ld a, 1
	jr z, .ok
	hlcoord 2, 2
	xor a
.ok
	push bc
	ld [wd10a], a
	predef AnimateHPBar
	pop bc
	ret
; 3cd55

HandleEnemyMonFaint: ; 3cd55
	call FaintEnemyPokemon
	ld hl, BattleMonHP
	ld a, [hli]
	or [hl]
	call z, FaintYourPokemon
	xor a
	ld [wc6f7], a
	call Function3ce01
	call CheckPlayerPartyForFitPkmn
	ld a, d
	and a
	jp z, LostBattle

	ld hl, BattleMonHP
	ld a, [hli]
	or [hl]
	call nz, UpdatePlayerHUD

	ld a, $1
	ld [hBGMapMode], a
	ld c, 60
	call DelayFrames

	ld a, [wBattleMode]
	dec a
	jr nz, .trainer

	ld a, 1
	ld [BattleEnded], a
	ret

.trainer
	call CheckEnemyTrainerDefeated
	jp z, WinTrainerBattle

	ld hl, BattleMonHP
	ld a, [hli]
	or [hl]
	jr nz, .player_mon_not_fainted

	call AskUseNextPokemon
	jr nc, .dont_flee

	ld a, 1
	ld [BattleEnded], a
	ret

.dont_flee
	call ForcePlayerMonChoice
	call CheckMobileBattleError
	jp c, WildFled_EnemyFled_LinkBattleCanceled

	ld a, $1
	ld [wd0ec], a
	call Function3cf4a
	jp z, WildFled_EnemyFled_LinkBattleCanceled
	jr Function3cdca

.player_mon_not_fainted
	ld a, $1
	ld [wd0ec], a
	call Function3cf4a
	jp z, WildFled_EnemyFled_LinkBattleCanceled
	xor a
	ld [wd0ec], a
	ret
; 3cdca

Function3cdca: ; 3cdca
	ld a, [hLinkPlayerNumber]
	cp $1
	jr z, .player_1
	call ClearSprites
	hlcoord 1, 0
	lb bc, 4, 10
	call ClearBox
	call PlayerPartyMonEntrance
	ld a, $1
	call EnemyPartyMonEntrance
	jr .done

.player_1
	ld a, [CurPartyMon]
	push af
	ld a, $1
	call EnemyPartyMonEntrance
	call ClearSprites
	call LoadTileMapToTempTileMap
	pop af
	ld [CurPartyMon], a
	call PlayerPartyMonEntrance

.done
	xor a
	ld [wd0ec], a
	ret
; 3ce01

Function3ce01: ; 3ce01
	call UpdateBattleMonInParty
	ld a, [wBattleMode]
	dec a
	jr z, .wild
	ld a, [CurOTMon]
	ld hl, OTPartyMon1HP
	call GetPartyLocation
	xor a
	ld [hli], a
	ld [hl], a

.wild
	ld hl, PlayerSubStatus3
	res SUBSTATUS_IN_LOOP, [hl]
	xor a
	ld hl, EnemyDamageTaken
	ld [hli], a
	ld [hl], a
	call NewEnemyMonStatus
	call BreakAttraction
	ld a, [wBattleMode]
	dec a
	jr z, .wild2
	jr .trainer

.wild2
	call StopDangerSound
	ld a, $1
	ld [wc6fd], a

.trainer
	ld hl, BattleMonHP
	ld a, [hli]
	or [hl]
	jr nz, .player_mon_did_not_faint
	ld a, [wc6f7]
	and a
	jr nz, .player_mon_did_not_faint
	call PlayerMonFaintHappinessMod

.player_mon_did_not_faint
	call CheckPlayerPartyForFitPkmn
	ld a, d
	and a
	ret z
	ld a, [wBattleMode]
	dec a
	call z, PlayVictoryMusic
	call EmptyBattleTextBox
	call LoadTileMapToTempTileMap
	ld a, [wBattleResult]
	and $c0
	ld [wBattleResult], a
	call DoOthersShareExperience
	jr z, .skip_exp
	ld hl, EnemyMonBaseStats
	ld b, $7
.loop
	srl [hl]
	inc hl
	dec b
	jr nz, .loop

.skip_exp
	ld hl, EnemyMonBaseStats
	ld de, wc720
	ld bc, EnemyMonEnd - EnemyMonBaseStats
	call CopyBytes
	xor a
	ld [wc71f], a
	call GiveExperiencePoints
	call DoOthersShareExperience
	ret z

	ld a, [wBattleParticipantsNotFainted]
	push af
	ld a, d
	ld [wBattleParticipantsNotFainted], a
	ld hl, wc720
	ld de, EnemyMonBaseStats
	ld bc, EnemyMonEnd - EnemyMonBaseStats
	call CopyBytes
	ld a, $1
	ld [wc71f], a
	call GiveExperiencePoints
	pop af
	ld [wBattleParticipantsNotFainted], a
	ret
; 3ceaa

DoOthersShareExperience: ; 3ceaa
	ld a, [PartyCount]
	ld b, a
	ld hl, PartyMon1
	ld c, 1
	ld d, 0
.loop
	push hl
	push bc
	ld bc, MON_HP
	add hl, bc
	ld a, [hli]
	or [hl]
	pop bc
	pop hl
	jr z, .next

	push hl
	push bc
	ld bc, MON_ITEM
	add hl, bc
	pop bc
	ld a, [hl]
	pop hl

	cp EXP_SHARE
	jr nz, .next
	ld a, d
	or c
	ld d, a

.next
	sla c
	push de
	ld de, PARTYMON_STRUCT_LENGTH
	add hl, de
	pop de
	dec b
	jr nz, .loop

	ld a, d
	ld e, 0
	ld b, PARTY_LENGTH
.loop2
	srl a
	jr nc, .okay
	inc e

.okay
	dec b
	jr nz, .loop2
	ld a, e
	and a
	ret
; 3ceec



StopDangerSound: ; 3ceec
	xor a
	ld [Danger], a
	ret
; 3cef1

FaintYourPokemon: ; 3cef1
	call StopDangerSound
	call WaitSFX
	ld a, $f0
	ld [CryTracks], a
	ld a, [BattleMonSpecies]
	call PlayStereoCry
	call PlayerMonFaintedAnimation
	hlcoord 9, 7
	lb bc, 5, 11
	call ClearBox
	ld hl, BattleText_PkmnFainted
	jp StdBattleTextBox
; 3cf14

FaintEnemyPokemon: ; 3cf14
	call WaitSFX
	ld de, SFX_KINESIS
	call PlaySFX
	call EnemyMonFaintedAnimation
	ld de, SFX_FAINT
	call PlaySFX
	hlcoord 1, 0
	lb bc, 4, 10
	call ClearBox
	ld hl, BattleText_EnemyPkmnFainted
	jp StdBattleTextBox
; 3cf35

CheckEnemyTrainerDefeated: ; 3cf35
	ld a, [OTPartyCount]
	ld b, a
	xor a
	ld hl, OTPartyMon1HP
	ld de, PARTYMON_STRUCT_LENGTH

.loop
	or [hl]
	inc hl
	or [hl]
	dec hl
	add hl, de
	dec b
	jr nz, .loop

	and a
	ret
; 3cf4a

Function3cf4a: ; 3cf4a
	ld hl, EnemyHPPal
	ld e, HP_BAR_LENGTH_PX
	call Function3e12e
	call WaitBGMap
	callba Function2c012
	ld a, [wLinkMode]
	and a
	jr z, .not_linked

	call Function3e8e4
	ld a, [wBattleAction]
	cp BATTLEACTION_FORFEIT
	ret z

	call Call_LoadTempTileMapToTileMap

.not_linked
	ld hl, BattleMonHP
	ld a, [hli]
	or [hl]
	ld a, $0
	jr nz, EnemyPartyMonEntrance
	inc a
	ret
; 3cf78

EnemyPartyMonEntrance: ; 3cf78
	push af
	xor a
	ld [wEnemySwitchMonIndex], a
	call NewEnemyMonStatus
	call ResetEnemyStatLevels
	call BreakAttraction
	pop af
	and a
	jr nz, .asm_3cf8f

	call EnemySwitch
	jr .asm_3cf92

.asm_3cf8f
	call EnemySwitch_SetMode

.asm_3cf92
	call ResetBattleParticipants
	call SetEnemyTurn
	call SpikesDamage
	xor a
	ld [wEnemyMoveStruct + MOVE_ANIM], a
	ld [wd0ec], a
	inc a
	ret
; 3cfa4

WinTrainerBattle: ; 3cfa4
; Player won the battle
	call StopDangerSound
	ld a, $1
	ld [wc6fd], a
	ld [BattleEnded], a
	ld a, [wLinkMode]
	and a
	ld a, b
	call z, PlayVictoryMusic
	callab Battle_GetTrainerName
	ld hl, BattleText_EnemyWasDefeated
	call StdBattleTextBox

	call IsMobileBattle
	jr z, .mobile
	ld a, [wLinkMode]
	and a
	ret nz

	ld a, [InBattleTowerBattle]
	bit 0, a
	jr nz, .battle_tower

	call Function3ebd8
	ld c, $28
	call DelayFrames
	ld a, [BattleType]
	cp BATTLETYPE_CANLOSE
	jr nz, .skip_heal
	predef HealParty
.skip_heal
	ld a, [wc2cc]
	bit 0, a
	jr nz, .skip_win_loss_text
	call PrintWinLossText

.skip_win_loss_text
	jp Function3d02b

.mobile
	call Function3ebd8
	ld c, 40
	call DelayFrames
	ld c, $4
	callba Function4ea0a
	ret

.battle_tower
	call Function3ebd8
	ld c, 40
	call DelayFrames
	call EmptyBattleTextBox
	ld c, $3
	callba BattleTowerText
	call WaitPressAorB_BlinkCursor
	ld hl, wPayDayMoney
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	ret nz
	call ClearTileMap
	call ClearBGPalettes
	ret
; 3d02b

Function3d02b: ; 3d02b
	ld a, [wc73d]
	and a
	call nz, Function3d099
	call Function3d0b1
	push af
	ld a, $0
	jr nc, .asm_3d044
	ld a, [wMomSavingMoney]
	and $7
	cp $3
	jr nz, .asm_3d044
	inc a

.asm_3d044
	ld b, a
	ld c, $4
.asm_3d047
	ld a, b
	and a
	jr z, .asm_3d052
	call Function3d081
	dec c
	dec b
	jr .asm_3d047

.asm_3d052
	ld a, c
	and a
	jr z, .asm_3d05c
	call Function3d08d
	dec c
	jr .asm_3d052

.asm_3d05c
	call Function3d099
	call Function3d099
	pop af
	jr nc, .KeepItAll
	ld a, [wMomSavingMoney]
	and $7
	jr z, .KeepItAll
	ld hl, SentToMomTexts
	dec a
	ld c, a
	ld b, 0
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp StdBattleTextBox

.KeepItAll
	ld hl, GotMoneyForWinningText
	jp StdBattleTextBox
; 3d081

Function3d081: ; 3d081
	push bc
	ld hl, wc688
	ld de, wMomsMoney + 2
	call Function3d0be
	pop bc
	ret
; 3d08d

Function3d08d: ; 3d08d
	push bc
	ld hl, wc688
	ld de, Money + 2
	call Function3d0be
	pop bc
	ret
; 3d099

Function3d099: ; 3d099
	ld hl, wc688
	sla [hl]
	dec hl
	rl [hl]
	dec hl
	rl [hl]
	ret nc
	ld a, $ff
rept 2
	ld [hli], a
endr
	ld [hl], a
	ret
; 3d0ab

SentToMomTexts: ; 3d0ab
	dw SentSomeToMomText
	dw SentHalfToMomText
	dw SentAllToMomText
; 3d0b1


Function3d0b1: ; 3d0b1
	ld hl, wMomsMoney + 2
	ld a, [hld]
	cp 999999 % $100
	ld a, [hld]
	sbc 999999 / $100 % $100
	ld a, [hl]
	sbc 999999 / $10000 % $100
	ret
; 3d0be

Function3d0be: ; 3d0be
	ld c, $3
	and a
	push de
	push hl
	push bc
	ld b, h
	ld c, l
	callba MobileFn_106008
	pop bc
	pop hl
.asm_3d0ce
	ld a, [de]
	adc [hl]
	ld [de], a
	dec de
	dec hl
	dec c
	jr nz, .asm_3d0ce
	pop hl
	ld a, [hld]
	cp 999999 % $100
	ld a, [hld]
	sbc 999999 / $100 % $100
	ld a, [hl]
	sbc 999999 / $10000 % $100
	ret c
	ld [hl], 999999 / $10000 % $100
	inc hl
	ld [hl], 999999 / $100 % $100
	inc hl
	ld [hl], 999999 % $100
	ret
; 3d0ea

PlayVictoryMusic: ; 3d0ea
	push de
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	ld de, MUSIC_WILD_VICTORY
	ld a, [wBattleMode]
	dec a
	jr nz, .trainer_victory
	push de
	call DoOthersShareExperience
	pop de
	jr nz, .play_music
	ld hl, wPayDayMoney
	ld a, [hli]
	or [hl]
	jr nz, .play_music
	ld a, [wBattleParticipantsNotFainted]
	and a
	jr z, .lost
	jr .play_music

.trainer_victory
	ld de, MUSIC_GYM_VICTORY
	call IsJohtoGymLeader
	jr c, .play_music
	ld de, MUSIC_TRAINER_VICTORY

.play_music
	call PlayMusic

.lost
	pop de
	ret
; 3d123



; These functions check if the current opponent is a gym leader or one of a
; few other special trainers.

; Note: KantoGymLeaders is a subset of JohtoGymLeaders. If you wish to
; differentiate between the two, call IsKantoGymLeader first.

; The Lance and Red entries are unused for music checks; those trainers are
; accounted for elsewhere.

IsKantoGymLeader: ; 0x3d123
	ld hl, KantoGymLeaders
	jr IsGymLeaderCommon

IsJohtoGymLeader: ; 0x3d128
	ld hl, JohtoGymLeaders
IsGymLeaderCommon:
	push de
	ld a, [OtherTrainerClass]
	ld de, $0001
	call IsInArray
	pop de
	ret
; 0x3d137

JohtoGymLeaders:
	db FALKNER
	db WHITNEY
	db BUGSY
	db MORTY
	db PRYCE
	db JASMINE
	db CHUCK
	db CLAIR
	db WILL
	db BRUNO
	db KAREN
	db KOGA
; fallthrough
; these two entries are unused
	db CHAMPION
	db RED
; fallthrough
KantoGymLeaders:
	db BROCK
	db MISTY
	db LT_SURGE
	db ERIKA
	db JANINE
	db SABRINA
	db BLAINE
	db BLUE
	db -1


HandlePlayerMonFaint: ; 3d14e
	call FaintYourPokemon
	ld hl, EnemyMonHP
	ld a, [hli]
	or [hl]
	call z, FaintEnemyPokemon
	ld a, $1
	ld [wc6f7], a
	call PlayerMonFaintHappinessMod
	call CheckPlayerPartyForFitPkmn
	ld a, d
	and a
	jp z, LostBattle
	ld hl, EnemyMonHP
	ld a, [hli]
	or [hl]
	jr nz, .notfainted
	call Function3ce01
	ld a, [wBattleMode]
	dec a
	jr nz, .trainer
	ld a, $1
	ld [BattleEnded], a
	ret

.trainer
	call CheckEnemyTrainerDefeated
	jp z, WinTrainerBattle

.notfainted
	call AskUseNextPokemon
	jr nc, .switch
	ld a, $1
	ld [BattleEnded], a
	ret

.switch
	call ForcePlayerMonChoice
	call CheckMobileBattleError
	jp c, WildFled_EnemyFled_LinkBattleCanceled
	ld a, c
	and a
	ret nz
	ld a, $1
	ld [wd0ec], a
	call Function3cf4a
	jp z, WildFled_EnemyFled_LinkBattleCanceled
	jp Function3cdca
; 3d1aa

PlayerMonFaintHappinessMod: ; 3d1aa
	ld a, [CurBattleMon]
	ld c, a
	ld hl, wBattleParticipantsNotFainted
	ld b, $0
	predef FlagPredef
	ld hl, EnemySubStatus3
	res SUBSTATUS_IN_LOOP, [hl]
	xor a
	ld [Danger], a
	ld hl, PlayerDamageTaken
	ld [hli], a
	ld [hl], a
	ld [BattleMonStatus], a
	call UpdateBattleMonInParty
	ld c, HAPPINESS_FAINTED
	; If TheirLevel > (YourLevel + 30), use a different parameter
	ld a, [BattleMonLevel]
	add 30
	ld b, a
	ld a, [EnemyMonLevel]
	cp b
	jr c, .got_param
	ld c, HAPPINESS_BEATENBYSTRONGFOE

.got_param
	ld a, [CurBattleMon]
	ld [CurPartyMon], a
	callab ChangeHappiness
	ld a, [wBattleResult]
	and %11000000
	add $1
	ld [wBattleResult], a
	ld a, [wc6f7]
	and a
	ret z
	ret ; ??????????
; 3d1f8

AskUseNextPokemon: ; 3d1f8
	call EmptyBattleTextBox
	call LoadTileMapToTempTileMap
; We don't need to be here if we're in a Trainer battle,
; as that decision is made for us.
	ld a, [wBattleMode]
	and a
	dec a
	ret nz

	ld hl, BattleText_UseNextMon
	call StdBattleTextBox
.loop
	lb bc, 1, 7
	call PlaceYesNoBox
	ld a, [MenuSelection2]
	jr c, .pressed_b
	and a
	ret

.pressed_b
	ld a, [MenuSelection2]
	cp $1 ; YES
	jr z, .loop
	ld hl, PartyMon1Speed
	ld de, EnemyMonSpeed
	jp TryToRunAwayFromBattle
; 3d227

ForcePlayerMonChoice: ; 3d227
	call EmptyBattleTextBox
	call LoadStandardMenuDataHeader
	call Function3d2f7
	call ForcePickPartyMonInBattle
	ld a, [wLinkMode]
	and a
	jr z, .skip_link
	ld a, $1
	ld [wd0ec], a
	call Function3e8e4

.skip_link
	xor a
	ld [wd0ec], a
	call CheckMobileBattleError
	jr c, .enemy_fainted_mobile_error
	ld hl, EnemyMonHP
	ld a, [hli]
	or [hl]
	jr nz, .send_out_pokemon

.enemy_fainted_mobile_error
	call ClearSprites
	call ClearBGPalettes
	call _LoadHPBar
	call ExitMenu
	call LoadTileMapToTempTileMap
	call WaitBGMap
	call ClearSGB
	call SetPalettes
	xor a
	ld c, a
	ret

.send_out_pokemon
	call ClearSprites
	ld a, [CurBattleMon]
	ld [LastPlayerMon], a
	ld a, [CurPartyMon]
	ld [CurBattleMon], a
	call AddBattleParticipant
	call InitBattleMon
	call ResetPlayerStatLevels
	call ClearPalettes
	call DelayFrame
	call _LoadHPBar
	call WriteBackup
	call ClearSGB
	call SetPalettes
	call SendOutPkmnText
	call NewBattleMonStatus
	call BreakAttraction
	call SendOutPlayerMon
	call EmptyBattleTextBox
	call LoadTileMapToTempTileMap
	call SetPlayerTurn
	call SpikesDamage
	ld a, $1
	and a
	ld c, a
	ret
; 3d2b3

PlayerPartyMonEntrance: ; 3d2b3
	ld a, [CurBattleMon]
	ld [LastPlayerMon], a
	ld a, [CurPartyMon]
	ld [CurBattleMon], a
	call AddBattleParticipant
	call InitBattleMon
	call ResetPlayerStatLevels
	call SendOutPkmnText
	call NewBattleMonStatus
	call BreakAttraction
	call SendOutPlayerMon
	call EmptyBattleTextBox
	call LoadTileMapToTempTileMap
	call SetPlayerTurn
	jp SpikesDamage
; 3d2e0


CheckMobileBattleError: ; 3d2e0
	ld a, [wLinkMode]
	cp LINK_MOBILE
	jr nz, .not_mobile ; It's not a mobile battle

	ld a, [wcd2b]
	and a
	jr z, .not_mobile

; We have a mobile battle and something else happened
	scf
	ret

.not_mobile
	xor a
	ret
; 3d2f1

IsMobileBattle: ; 3d2f1
	ld a, [wLinkMode]
	cp LINK_MOBILE
	ret
; 3d2f7

Function3d2f7: ; 3d2f7
	call ClearBGPalettes
Function3d2fa: ; switch to fullscreen menu?
	callba Function5004f
	callba Function50405
	callba Function8e85
	callba Function503e0
	ret
; 3d313

Function3d313: ; 3d313
	callba WritePartyMenuTilemap
	callba PrintPartyMenuText
	call WaitBGMap
	call SetPalettes
	call DelayFrame
	ret
; 3d329

Function3d329: ; 3d329
	call IsMobileBattle
	jr z, .mobile
	callba PartyMenuSelect
	ret

.mobile
	callba Function100cb5
	ret
; 3d33c

PickPartyMonInBattle: ; 3d33c
.loop
	ld a, $2 ; Which PKMN?
	ld [PartyMenuActionText], a
	call Function3d313
	call Function3d329
	ret c
	call CheckIfPartyHasPkmnToBattleWith
	jr z, .loop
	xor a
	ret
; 3d34f

SwitchMonAlreadyOut: ; 3d34f
	ld hl, CurBattleMon
	ld a, [CurPartyMon]
	cp [hl]
	jr nz, .notout

	ld hl, BattleText_PkmnIsAlreadyOut
	call StdBattleTextBox
	scf
	ret

.notout
	xor a
	ret
; 3d362

ForcePickPartyMonInBattle: ; 3d362
; Can't back out.

.pick
	call PickPartyMonInBattle
	ret nc
	call CheckMobileBattleError
	ret c

	ld de, SFX_WRONG
	call PlaySFX
	call WaitSFX
	jr .pick
; 3d375


PickSwitchMonInBattle: ; 3d375
.pick
	call PickPartyMonInBattle
	ret c
	call SwitchMonAlreadyOut
	jr c, .pick
	xor a
	ret
; 3d380

ForcePickSwitchMonInBattle: ; 3d380
; Can't back out.

.pick
	call ForcePickPartyMonInBattle
	call CheckMobileBattleError
	ret c
	call SwitchMonAlreadyOut
	jr c, .pick

	xor a
	ret
; 3d38e


LostBattle: ; 3d38e
	ld a, 1
	ld [BattleEnded], a

	ld a, [InBattleTowerBattle]
	bit 0, a
	jr nz, .battle_tower

	ld a, [BattleType]
	cp BATTLETYPE_CANLOSE
	jr nz, .not_canlose

; Remove the enemy from the screen.
	hlcoord 0, 0
	lb bc, 8, 21
	call ClearBox
	call Function3ebd8

	ld c, 40
	call DelayFrames

	ld a, [wc2cc]
	bit 0, a
	jr nz, .skip_win_loss_text
	call PrintWinLossText
.skip_win_loss_text
	ret

.battle_tower
; Remove the enemy from the screen.
	hlcoord 0, 0
	lb bc, 8, 21
	call ClearBox
	call Function3ebd8

	ld c, 40
	call DelayFrames

	call EmptyBattleTextBox
	ld c, 2
	callba BattleTowerText
	call WaitPressAorB_BlinkCursor
	call ClearTileMap
	call ClearBGPalettes
	ret

.not_canlose
	ld a, [wLinkMode]
	and a
	jr nz, .LostLinkBattle

; Greyscale
	ld b, 0
	call GetSGBLayout
	call SetPalettes
	jr .end

.LostLinkBattle
	call UpdateEnemyMonInParty
	call CheckEnemyTrainerDefeated
	jr nz, .not_tied
	ld hl, TiedAgainstText
	ld a, [wBattleResult]
	and $c0
	add 2
	ld [wBattleResult], a
	jr .text

.not_tied
	ld hl, LostAgainstText
	call IsMobileBattle
	jr z, .mobile

.text
	call StdBattleTextBox

.end
	scf
	ret

.mobile
; Remove the enemy from the screen.
	hlcoord 0, 0
	lb bc, 8, 21
	call ClearBox
	call Function3ebd8

	ld c, 40
	call DelayFrames

	ld c, $3
	callba Function4ea0a
	scf
	ret
; 3d432


EnemyMonFaintedAnimation: ; 3d432
	hlcoord 12, 5
	decoord 12, 6
	jp MonFaintedAnimation
; 3d43b

PlayerMonFaintedAnimation: ; 3d43b
	hlcoord 1, 10
	decoord 1, 11
	jp MonFaintedAnimation
; 3d444

MonFaintedAnimation: ; 3d444
	ld a, [wcfbe]
	push af
	set 6, a
	ld [wcfbe], a
	ld b, 7

.OuterLoop
	push bc
	push de
	push hl
	ld b, 6

.InnerLoop
	push bc
	push hl
	push de
	ld bc, 7
	call CopyBytes
	pop de
	pop hl
	ld bc, -SCREEN_WIDTH
	add hl, bc
	push hl
	ld h, d
	ld l, e
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	pop bc
	dec b
	jr nz, .InnerLoop

	ld bc, 20
	add hl, bc
	ld de, .Spaces
	call PlaceString
	ld c, 2
	call DelayFrames
	pop hl
	pop de
	pop bc
	dec b
	jr nz, .OuterLoop

	pop af
	ld [wcfbe], a
	ret
; 3d488

.Spaces
	db "       @"
; 3d490


Function3d490: ; 3d490
	ld [hMapObjectIndexBuffer], a
	ld c, a
.asm_3d493
	push bc
	push hl
	ld b, $7
.asm_3d497
	push hl
	call Function3d4ae
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .asm_3d497
	ld c, 2
	call DelayFrames
	pop hl
	pop bc
	dec c
	jr nz, .asm_3d493
	ret
; 3d4ae

Function3d4ae: ; 3d4ae
	ld a, [hMapObjectIndexBuffer]
	ld c, a
	cp $8
	jr nz, .back
.forward
	ld a, [hli]
	ld [hld], a
	dec hl
	dec c
	jr nz, .forward
	ret

.back
	ld a, [hld]
	ld [hli], a
	inc hl
	dec c
	jr nz, .back
	ret
; 3d4c3


ForceEnemySwitch: ; 3d4c3
	call ResetEnemyBattleVars
	ld a, [wEnemySwitchMonIndex]
	dec a
	ld b, a
	call LoadEnemyPkmnToSwitchTo
	call ClearEnemyMonBox
	call NewEnemyMonStatus
	call ResetEnemyStatLevels
	call Function_SetEnemyPkmnAndSendOutAnimation
	call BreakAttraction
	call ResetBattleParticipants
	ret
; 3d4e1


EnemySwitch: ; 3d4e1
	call CheckWhetherToAskSwitch
	jr nc, EnemySwitch_SetMode
	; Shift Mode
	call ResetEnemyBattleVars
	call CheckWhetherSwitchmonIsPredetermined
	jr c, .skip
	call FindPkmnInOTPartyToSwitchIntoBattle
.skip
	; 'b' contains the PartyNr of the Pkmn the AI will switch to
	call LoadEnemyPkmnToSwitchTo
	call OfferSwitch
	push af
	call ClearEnemyMonBox
	call Function_BattleTextEnemySentOut
	call Function_SetEnemyPkmnAndSendOutAnimation
	pop af
	ret c
	; If we're here, then we're switching too
	xor a
	ld [wBattleParticipantsNotFainted], a
	ld [wc6fc], a
	ld [wd0ec], a
	inc a
	ld [wEnemyIsSwitching], a
	call LoadTileMapToTempTileMap
	jp PlayerSwitch
; 3d517

EnemySwitch_SetMode: ; 3d517
	call ResetEnemyBattleVars
	call CheckWhetherSwitchmonIsPredetermined
	jr c, .skip
	call FindPkmnInOTPartyToSwitchIntoBattle
.skip
	; 'b' contains the PartyNr of the Pkmn the AI will switch to
	call LoadEnemyPkmnToSwitchTo
	ld a, 1
	ld [wEnemyIsSwitching], a
	call ClearEnemyMonBox
	call Function_BattleTextEnemySentOut
	jp Function_SetEnemyPkmnAndSendOutAnimation
; 3d533

CheckWhetherSwitchmonIsPredetermined: ; 3d533
; returns carry if: ???
	ld a, [wLinkMode]
	and a
	jr z, .not_linked

	ld a, [wBattleAction]
	sub BATTLEACTION_SWITCH1
	ld b, a
	jr .return_carry

.not_linked
	ld a, [wEnemySwitchMonIndex]
	and a
	jr z, .check_wd264

	dec a
	ld b, a
	jr .return_carry

.check_wd264
	ld a, [wd264]
	and a
	ld b, $0
	jr nz, .return_carry

	and a
	ret

.return_carry
	scf
	ret
; 3d557

ResetEnemyBattleVars: ; 3d557
; and draw empty TextBox
	xor a
	ld [LastEnemyCounterMove], a
	ld [LastPlayerCounterMove], a
	ld [LastEnemyMove], a
	ld [CurEnemyMove], a
	dec a
	ld [wc6e6], a
	xor a
	ld [wPlayerWrapCount], a
	hlcoord 18, 0
	ld a, $8
	call Function3d490
	call EmptyBattleTextBox
	jp LoadStandardMenuDataHeader
; 3d57a

ResetBattleParticipants: ; 3d57a
	xor a
	ld [wBattleParticipantsNotFainted], a
	ld [wc6fc], a
AddBattleParticipant: ; 3d581
	ld a, [CurBattleMon]
	ld c, a
	ld hl, wBattleParticipantsNotFainted
	ld b, SET_FLAG
	push bc
	predef FlagPredef
	pop bc
	ld hl, wc6fc
	predef_jump FlagPredef
; 3d599

FindPkmnInOTPartyToSwitchIntoBattle: ; 3d599
	ld b, $ff
	ld a, $1
	ld [Buffer1], a
	ld [Buffer2], a
.asm_3d5a3
	ld hl, Buffer1
	sla [hl]
	inc hl
	sla [hl]
	inc b
	ld a, [OTPartyCount]
	cp b
	jp z, Function3d672
	ld a, [CurOTMon]
	cp b
	jr z, .asm_3d5d0
	ld hl, OTPartyMon1HP
	push bc
	ld a, b
	call GetPartyLocation
	ld a, [hli]
	ld c, a
	ld a, [hl]
	or c
	pop bc
	jr z, .asm_3d5d0
	call LookUpTheEffectivenessOfEveryMove
	call IsThePlayerPkmnTypesEffectiveAgainstOTPkmn
	jr .asm_3d5a3

.asm_3d5d0
	ld hl, Buffer2
	set 0, [hl]
	jr .asm_3d5a3
; 3d5d7

LookUpTheEffectivenessOfEveryMove: ; 3d5d7
	push bc
	ld hl, OTPartyMon1Moves
	ld a, b
	call GetPartyLocation
	pop bc
	ld e, NUM_MOVES + 1
.loop
	dec e
	jr z, .done
	ld a, [hli]
	and a
	jr z, .done
	push hl
	push de
	push bc
	dec a
	ld hl, Moves
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld de, wEnemyMoveStruct
	ld a, BANK(Moves)
	call FarCopyBytes
	call SetEnemyTurn
	callab BattleCheckTypeMatchup
	pop bc
	pop de
	pop hl
	ld a, [wd265] ; Get The Effectiveness Modifier
	cp 10 + 1 ; 1.0 + 0.1
	jr c, .loop
	ld hl, Buffer1
	set 0, [hl]
	ret
.done
	ret
; 3d618

IsThePlayerPkmnTypesEffectiveAgainstOTPkmn: ; 3d618
; Calculates the effectiveness of the types of the PlayerPkmn
; against the OTPkmn
	push bc
	ld hl, OTPartyCount
	ld a, b
	inc a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	dec a
	ld hl, BaseData + 7 ; type
	ld bc, $20
	call AddNTimes
	ld de, EnemyMonType
	ld bc, 2
	ld a, BANK(BaseData)
	call FarCopyBytes
	ld a, [BattleMonType1]
	ld [wPlayerMoveStruct + MOVE_TYPE], a
	call SetPlayerTurn
	callab BattleCheckTypeMatchup
	ld a, [wd265]
	cp 10 + 1 ; 1.0 + 0.1
	jr nc, .asm_3d663
	ld a, [BattleMonType2]
	ld [wPlayerMoveStruct + MOVE_TYPE], a
	callab BattleCheckTypeMatchup
	ld a, [wd265]
	cp 10 + 1 ; 1.0 + 0.1
	jr nc, .asm_3d663
	pop bc
	ret

.asm_3d663
	pop bc
	ld hl, Buffer1
	bit 0, [hl]
	jr nz, .asm_3d66f
	inc hl
	set 0, [hl]
	ret

.asm_3d66f
	res 0, [hl]
	ret
; 3d672

Function3d672: ; 3d672
.asm_3d672
	ld hl, Buffer1
	sla [hl]
	inc hl
	sla [hl]
	jr nc, .asm_3d672
	ld a, [OTPartyCount]
	ld b, a
	ld c, [hl]
.asm_3d681
	sla c
	jr nc, .asm_3d68a
	dec b
	jr z, .asm_3d6a7
	jr .asm_3d681

.asm_3d68a
	ld a, [Buffer1]
	and a
	jr z, .asm_3d69a
	ld b, $ff
	ld c, a
.asm_3d693
	inc b
	sla c
	jr nc, .asm_3d693
	jr .asm_3d6c9

.asm_3d69a
	ld b, $ff
	ld a, [Buffer2]
	ld c, a
.asm_3d6a0
	inc b
	sla c
	jr c, .asm_3d6a0
	jr .asm_3d6c9

.asm_3d6a7
	ld a, [OTPartyCount]
	ld b, a
	call BattleRandom
	and $7
	cp b
	jr nc, .asm_3d6a7
	ld b, a
	ld a, [CurOTMon]
	cp b
	jr z, .asm_3d6a7
	ld hl, OTPartyMon1HP
	push bc
	ld a, b
	call GetPartyLocation
	pop bc
	ld a, [hli]
	ld c, a
	ld a, [hl]
	or c
	jr z, .asm_3d6a7

.asm_3d6c9
	ret
; 3d6ca

LoadEnemyPkmnToSwitchTo: ; 3d6ca
	; 'b' contains the PartyNr of the Pkmn the AI will switch to
	ld a, b
	ld [CurPartyMon], a
	ld hl, OTPartyMon1Level
	call GetPartyLocation
	ld a, [hl]
	ld [CurPartyLevel], a
	ld a, [CurPartyMon]
	inc a
	ld hl, OTPartyCount
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld [TempEnemyMonSpecies], a
	ld [CurPartySpecies], a
	call LoadEnemyMon

	ld a, [CurPartySpecies]
	cp UNOWN
	jr nz, .skip_unown
	ld a, [wdef4]
	and a
	jr nz, .skip_unown
	ld hl, EnemyMonDVs
	predef GetUnownLetter
	ld a, [UnownLetter]
	ld [wdef4], a
.skip_unown

	ld hl, EnemyMonHP
	ld a, [hli]
	ld [wEnemyHPAtTimeOfPlayerSwitch], a
	ld a, [hl]
	ld [wEnemyHPAtTimeOfPlayerSwitch + 1], a
	ret
; 3d714

CheckWhetherToAskSwitch: ; 3d714
	ld a, [wd264]
	dec a
	jp z, .return_nc
	ld a, [PartyCount]
	dec a
	jp z, .return_nc
	ld a, [wLinkMode]
	and a
	jp nz, .return_nc
	ld a, [Options]
	bit BATTLE_SHIFT, a
	jr nz, .return_nc
	ld a, [CurPartyMon]
	push af
	ld a, [CurBattleMon]
	ld [CurPartyMon], a
	callba CheckCurPartyMonFainted
	pop bc
	ld a, b
	ld [CurPartyMon], a
	jr c, .return_nc
	scf
	ret

.return_nc
	and a
	ret
; 3d74b

OfferSwitch: ; 3d74b
	ld a, [CurPartyMon]
	push af
	callab Battle_GetTrainerName
	ld hl, BattleText_EnemyIsAboutToUseWillPlayerChangePkmn
	call StdBattleTextBox
	lb bc, 1, 7
	call PlaceYesNoBox
	ld a, [MenuSelection2]
	dec a
	jr nz, .said_no
	call Function3d2f7
	call PickSwitchMonInBattle
	jr c, .canceled_switch
	ld a, [CurBattleMon]
	ld [LastPlayerMon], a
	ld a, [CurPartyMon]
	ld [CurBattleMon], a
	call ClearPalettes
	call DelayFrame
	call _LoadHPBar
	pop af
	ld [CurPartyMon], a
	xor a
	ld [CurEnemyMove], a
	ld [CurPlayerMove], a
	and a
	ret

.canceled_switch
	call ClearPalettes
	call DelayFrame
	call _LoadHPBar

.said_no
	pop af
	ld [CurPartyMon], a
	scf
	ret
; 3d7a0

ClearEnemyMonBox: ; 3d7a0
	xor a
	ld [hBGMapMode], a
	call ExitMenu
	call ClearSprites
	hlcoord 1, 0
	lb bc, 4, 10
	call ClearBox
	call WaitBGMap
	jp FinishBattleAnim
; 3d7b8

Function_BattleTextEnemySentOut: ; 3d7b8
	callab Battle_GetTrainerName
	ld hl, BattleText_EnemySentOut
	call StdBattleTextBox
	jp WaitBGMap
; 3d7c7

Function_SetEnemyPkmnAndSendOutAnimation: ; 3d7c7
	ld a, [TempEnemyMonSpecies]
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	call GetBaseData
	ld a, OTPARTYMON
	ld [MonType], a
	predef CopyPkmnToTempMon
	call GetMonFrontpic

	xor a
	ld [wcfca], a
	ld [wKickCounter], a
	call SetEnemyTurn
	ld de, ANIM_SEND_OUT_MON
	call Call_PlayBattleAnim

	call BattleCheckEnemyShininess
	jr nc, .not_shiny
	ld a, 1 ; shiny anim
	ld [wKickCounter], a
	ld de, ANIM_SEND_OUT_MON
	call Call_PlayBattleAnim
.not_shiny

	ld bc, TempMonSpecies
	callba CheckFaintedFrzSlp
	jr c, .skip_cry
	callba CheckBattleScene
	jr c, .cry_no_anim
	hlcoord 12, 0
	ld d, $0
	ld e, ANIM_MON_SLOW
	predef AnimateFrontpic
	jr .skip_cry

.cry_no_anim
	ld a, $f
	ld [CryTracks], a
	ld a, [TempEnemyMonSpecies]
	call PlayStereoCry

.skip_cry
	call UpdateEnemyHUD
	ld a, $1
	ld [hBGMapMode], a
	ret
; 3d834

NewEnemyMonStatus: ; 3d834
	xor a
	ld [LastEnemyCounterMove], a
	ld [LastPlayerCounterMove], a
	ld [LastEnemyMove], a
	ld hl, EnemySubStatus1
rept 4
	ld [hli], a
endr
	ld [hl], a
	ld [EnemyDisableCount], a
	ld [EnemyFuryCutterCount], a
	ld [EnemyProtectCount], a
	ld [wEnemyRageCounter], a
	ld [EnemyDisabledMove], a
	ld [wEnemyMinimized], a
	ld [wPlayerWrapCount], a
	ld [wEnemyWrapCount], a
	ld [EnemyTurnsTaken], a
	ld hl, PlayerSubStatus5
	res SUBSTATUS_CANT_RUN, [hl]
	ret
; 3d867

ResetEnemyStatLevels: ; 3d867
	ld a, BASE_STAT_LEVEL
	ld b, NUM_LEVEL_STATS
	ld hl, EnemyStatLevels
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret
; 3d873

CheckPlayerPartyForFitPkmn: ; 3d873
; Has the player any Pkmn in his Party that can fight?
	ld a, [PartyCount]
	ld e, a
	xor a
	ld hl, PartyMon1HP
	ld bc, PartyMon2 - (PartyMon1 + 1)
.asm_3d87e
	or [hl]
	inc hl
	or [hl]
	add hl, bc
	dec e
	jr nz, .asm_3d87e
	ld d, a
	ret
; 3d887


CheckIfPartyHasPkmnToBattleWith: ; 3d887
	ld a, [CurPartyMon]
	ld hl, PartyMon1HP
	call GetPartyLocation
	ld a, [hli]
	or [hl]
	ret nz

	ld a, [wd264]
	and a
	jr nz, .asm_3d8b1
	ld hl, PartySpecies
	ld a, [CurPartyMon]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	cp EGG
	ld hl, BattleText_AnEGGCantBattle
	jr z, .asm_3d8ae

	ld hl, BattleText_TheresNoWillToBattle

.asm_3d8ae
	call StdBattleTextBox

.asm_3d8b1
	xor a
	ret
; 3d8b3


TryToRunAwayFromBattle: ; 3d8b3
; Run away from battle, with or without item
	ld a, [BattleType]
	cp BATTLETYPE_DEBUG
	jp z, .can_escape
	cp BATTLETYPE_CONTEST
	jp z, .can_escape
	cp BATTLETYPE_TRAP
	jp z, .cant_escape
	cp BATTLETYPE_CELEBI
	jp z, .cant_escape
	cp BATTLETYPE_SHINY
	jp z, .cant_escape
	cp BATTLETYPE_SUICUNE
	jp z, .cant_escape

	ld a, [wLinkMode]
	and a
	jp nz, .can_escape

	ld a, [wBattleMode]
	dec a
	jp nz, .cant_run_from_trainer

	ld a, [EnemySubStatus5]
	bit SUBSTATUS_CANT_RUN, a
	jp nz, .cant_escape

	ld a, [wPlayerWrapCount]
	and a
	jp nz, .cant_escape

	push hl
	push de
	ld a, [BattleMonItem]
	ld [wd265], a
	ld b, a
	callab GetItemHeldEffect
	ld a, b
	cp HELD_ESCAPE
	pop de
	pop hl
	jr nz, .no_flee_item

	call SetPlayerTurn
	call GetItemName
	ld hl, BattleText_UserFledUsingAStringBuffer1
	call StdBattleTextBox
	jp .can_escape

.no_flee_item
	ld a, [wd267]
	inc a
	ld [wd267], a
	ld a, [hli]
	ld [hStringCmpString2 + 0], a
	ld a, [hl]
	ld [hStringCmpString2 + 1], a
	ld a, [de]
	inc de
	ld [hStringCmpString1 + 0], a
	ld a, [de]
	ld [hStringCmpString1 + 1], a
	call Call_LoadTempTileMapToTileMap
	ld de, hStringCmpString2
	ld hl, hStringCmpString1
	ld c, $2
	call StringCmp
	jr nc, .can_escape

	xor a
	ld [hMultiplicand], a
	ld a, $20
	ld [hMultiplier], a
	call Multiply
	ld a, [hProduct + 2]
	ld [hDividend + 0], a
	ld a, [hProduct + 3]
	ld [hDividend + 1], a
	ld a, [hStringCmpString1 + 0]
	ld b, a
	ld a, [hStringCmpString1 + 1]
	srl b
	rr a
	srl b
	rr a
	and a
	jr z, .can_escape
	ld [hDivisor], a
	ld b, $2
	call Divide
	ld a, [hQuotient + 1]
	and a
	jr nz, .can_escape
	ld a, [wd267]
	ld c, a
.loop
	dec c
	jr z, .cant_escape_2
	ld b, $1e
	ld a, [hQuotient + 2]
	add b
	ld [hQuotient + 2], a
	jr c, .can_escape
	jr .loop

.cant_escape_2
	call BattleRandom
	ld b, a
	ld a, [hQuotient + 2]
	cp b
	jr nc, .can_escape
	ld a, $1
	ld [wd0ec], a
	ld hl, BattleText_CantEscape2
	jr .print_inescapable_text

.cant_escape
	ld hl, BattleText_CantEscape
	jr .print_inescapable_text

.cant_run_from_trainer
	ld hl, BattleText_TheresNoEscapeFromTrainerBattle

.print_inescapable_text
	call StdBattleTextBox
	ld a, $1
	ld [wd266], a
	call LoadTileMapToTempTileMap
	and a
	ret

.can_escape
	ld a, [wLinkMode]
	and a
	ld a, DRAW
	jr z, .fled
	call LoadTileMapToTempTileMap
	xor a
	ld [wd0ec], a
	ld a, $f
	ld [CurMoveNum], a
	xor a
	ld [CurPlayerMove], a
	call Function3e8e4
	call Call_LoadTempTileMapToTileMap
	call CheckMobileBattleError
	jr c, .mobile

	; Got away safely
	ld a, [wBattleAction]
	cp BATTLEACTION_FORFEIT
	ld a, DRAW
	jr z, .fled
	dec a
.fled
	ld b, a
	ld a, [wBattleResult]
	and $c0
	add b
	ld [wBattleResult], a
	call StopDangerSound
	push de
	ld de, SFX_RUN
	call WaitPlaySFX
	pop de
	call WaitSFX
	ld hl, BattleText_GotAwaySafely
	call StdBattleTextBox
	call WaitSFX
	call LoadTileMapToTempTileMap
	scf
	ret

.mobile
	call StopDangerSound
	ld hl, wcd2a
	bit 4, [hl]
	jr nz, .skip_link_error
	ld hl, BattleText_LinkErrorBattleCanceled
	call StdBattleTextBox

.skip_link_error
	call WaitSFX
	call LoadTileMapToTempTileMap
	scf
	ret
; 3da0d


InitBattleMon: ; 3da0d
	ld a, MON_SPECIES
	call GetPartyParamLocation
	ld de, BattleMonSpecies
	ld bc, MON_ID
	call CopyBytes
	ld bc, MON_DVS - MON_ID
	add hl, bc
	ld de, BattleMonDVs
	ld bc, MON_PKRUS - MON_DVS
	call CopyBytes
rept 3
	inc hl
endr
	ld de, BattleMonLevel
	ld bc, PARTYMON_STRUCT_LENGTH - MON_LEVEL
	call CopyBytes
	ld a, [BattleMonSpecies]
	ld [TempBattleMonSpecies], a
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	call GetBaseData
	ld a, [BaseType1]
	ld [BattleMonType1], a
	ld a, [BaseType2]
	ld [BattleMonType2], a
	ld hl, PartyMonNicknames
	ld a, [CurBattleMon]
	call SkipNames
	ld de, BattleMonNick
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	ld hl, BattleMonAttack
	ld de, PlayerStats
	ld bc, PARTYMON_STRUCT_LENGTH - MON_ATK
	call CopyBytes
	call ApplyStatusEffectOnPlayerStats
	call BadgeStatBoosts
	ret
; 3da74

BattleCheckPlayerShininess: ; 3da74
	call GetPartyMonDVs
	jr BattleCheckShininess

BattleCheckEnemyShininess: ; 3da79
	call GetEnemyMonDVs

BattleCheckShininess: ; 3da7c
	ld b, h
	ld c, l
	callab CheckShininess
	ret
; 3da85

GetPartyMonDVs: ; 3da85
	ld hl, BattleMonDVs
	ld a, [PlayerSubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	ret z
	ld hl, PartyMon1DVs
	ld a, [CurBattleMon]
	jp GetPartyLocation
; 3da97

GetEnemyMonDVs: ; 3da97
	ld hl, EnemyMonDVs
	ld a, [EnemySubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	ret z
	ld hl, wc6f2
	ld a, [wBattleMode]
	dec a
	ret z
	ld hl, OTPartyMon1DVs
	ld a, [CurOTMon]
	jp GetPartyLocation
; 3dab1

ResetPlayerStatLevels: ; 3dab1
	ld a, BASE_STAT_LEVEL
	ld b, NUM_LEVEL_STATS
	ld hl, PlayerStatLevels
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret
; 3dabd


Function3dabd: ; 3dabd
	ld a, [CurPartyMon]
	ld hl, OTPartyMon1Species
	call GetPartyLocation
	ld de, EnemyMonSpecies
	ld bc, MON_ID
	call CopyBytes
	ld bc, MON_DVS - MON_ID
	add hl, bc
	ld de, EnemyMonDVs
	ld bc, MON_PKRUS - MON_DVS
	call CopyBytes
rept 3
	inc hl
endr
	ld de, EnemyMonLevel
	ld bc, PARTYMON_STRUCT_LENGTH - MON_LEVEL
	call CopyBytes
	ld a, [EnemyMonSpecies]
	ld [CurSpecies], a
	call GetBaseData
	ld hl, OTPartyMonNicknames
	ld a, [CurPartyMon]
	call SkipNames
	ld de, EnemyMonNick
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	ld hl, EnemyMonAttack
	ld de, EnemyStats
	ld bc, PARTYMON_STRUCT_LENGTH - MON_ATK
	call CopyBytes
	call ApplyStatusEffectOnEnemyStats
	ld hl, BaseType1
	ld de, EnemyMonType1
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld hl, BaseStats
	ld de, EnemyMonBaseStats
	ld b, 5
.asm_3db25
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_3db25
	ld a, [CurPartyMon]
	ld [CurOTMon], a
	ret
; 3db32


SwitchPlayerMon: ; 3db32
	call ClearSprites
	ld a, [CurBattleMon]
	ld [LastPlayerMon], a
	ld a, [CurPartyMon]
	ld [CurBattleMon], a
	call AddBattleParticipant
	call InitBattleMon
	call ResetPlayerStatLevels
	call NewBattleMonStatus
	call BreakAttraction
	call SendOutPlayerMon
	call EmptyBattleTextBox
	call LoadTileMapToTempTileMap
	ld hl, EnemyMonHP
	ld a, [hli]
	or [hl]
	ret
; 3db5f


SendOutPlayerMon: ; 3db5f
	ld hl, BattleMonDVs
	predef GetUnownLetter
	hlcoord 1, 5
	ld b, 7
	ld c, 8
	call ClearBox
	call WaitBGMap
	xor a
	ld [hBGMapMode], a
	call GetMonBackpic
	xor a
	ld [hFillBox], a
	ld [wd0d2], a
	ld [CurMoveNum], a
	ld [TypeModifier], a
	ld [wPlayerMoveStruct + MOVE_ANIM], a
	ld [LastEnemyCounterMove], a
	ld [LastPlayerCounterMove], a
	ld [LastPlayerMove], a
	call CheckAmuletCoin
	call FinishBattleAnim
	xor a
	ld [wEnemyWrapCount], a
	call SetPlayerTurn
	xor a
	ld [wcfca], a
	ld [wKickCounter], a
	ld de, ANIM_SEND_OUT_MON
	call Call_PlayBattleAnim
	call BattleCheckPlayerShininess
	jr nc, .not_shiny
	ld a, $1
	ld [wKickCounter], a
	ld de, ANIM_SEND_OUT_MON
	call Call_PlayBattleAnim

.not_shiny
	ld a, MON_SPECIES
	call GetPartyParamLocation
	ld b, h
	ld c, l
	callba CheckFaintedFrzSlp
	jr c, .statused
	ld a, $f0
	ld [CryTracks], a
	ld a, [CurPartySpecies]
	call PlayStereoCry

.statused
	call UpdatePlayerHUD
	ld a, $1
	ld [hBGMapMode], a
	ret
; 3dbde

NewBattleMonStatus: ; 3dbde
	xor a
	ld [LastEnemyCounterMove], a
	ld [LastPlayerCounterMove], a
	ld [LastPlayerMove], a
	ld hl, PlayerSubStatus1
rept 4
	ld [hli], a
endr
	ld [hl], a
	ld hl, PlayerUsedMoves
rept 3
	ld [hli], a
endr
	ld [hl], a
	ld [PlayerDisableCount], a
	ld [PlayerFuryCutterCount], a
	ld [PlayerProtectCount], a
	ld [wPlayerRageCounter], a
	ld [DisabledMove], a
	ld [wPlayerMinimized], a
	ld [wEnemyWrapCount], a
	ld [wPlayerWrapCount], a
	ld [PlayerTurnsTaken], a
	ld hl, EnemySubStatus5
	res SUBSTATUS_CANT_RUN, [hl]
	ret
; 3dc18

BreakAttraction: ; 3dc18
	ld hl, PlayerSubStatus1
	res SUBSTATUS_IN_LOVE, [hl]
	ld hl, EnemySubStatus1
	res SUBSTATUS_IN_LOVE, [hl]
	ret
; 3dc23

SpikesDamage: ; 3dc23
	ld hl, PlayerScreens
	ld de, BattleMonType
	ld bc, UpdatePlayerHUD
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, EnemyScreens
	ld de, EnemyMonType
	ld bc, UpdateEnemyHUD
.ok

	bit SCREENS_SPIKES, [hl]
	ret z

	; Flying-types aren't affected by Spikes.
	ld a, [de]
	cp FLYING
	ret z
	inc de
	ld a, [de]
	cp FLYING
	ret z

	push bc

	ld hl, BattleText_UserHurtBySpikes ; "hurt by SPIKES!"
	call StdBattleTextBox

	call GetEighthMaxHP
	call SubtractHPFromTarget

	pop hl
	call .hl

	jp WaitBGMap

.hl
	jp [hl]
; 3dc5b

PursuitSwitch: ; 3dc5b
	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld b, a
	call GetMoveEffect
	ld a, b
	cp EFFECT_PURSUIT
	jr nz, .done

	ld a, [CurBattleMon]
	push af

	ld hl, DoPlayerTurn
	ld a, [hBattleTurn]
	and a
	jr z, .do_turn
	ld hl, DoEnemyTurn
	ld a, [LastPlayerMon]
	ld [CurBattleMon], a
.do_turn
	ld a, BANK(DoPlayerTurn)
	rst FarCall

	ld a, BATTLE_VARS_MOVE
	call GetBattleVarAddr
	ld a, $ff
	ld [hl], a

	pop af
	ld [CurBattleMon], a

	ld a, [hBattleTurn]
	and a
	jr z, .check_enemy_fainted

	ld a, [LastPlayerMon]
	call UpdateBattleMon
	ld hl, BattleMonHP
	ld a, [hli]
	or [hl]
	jr nz, .done

	ld a, $f0
	ld [CryTracks], a
	ld a, [BattleMonSpecies]
	call PlayStereoCry
	ld a, [wc71a]
	ld c, a
	ld hl, wBattleParticipantsNotFainted
	ld b, RESET_FLAG
	predef FlagPredef
	call PlayerMonFaintedAnimation
	ld hl, BattleText_PkmnFainted
	jr .done_fainted

.check_enemy_fainted
	ld hl, EnemyMonHP
	ld a, [hli]
	or [hl]
	jr nz, .done

	ld de, SFX_KINESIS
	call PlaySFX
	call WaitSFX
	ld de, SFX_FAINT
	call PlaySFX
	call WaitSFX
	call EnemyMonFaintedAnimation
	ld hl, BattleText_EnemyPkmnFainted

.done_fainted
	call StdBattleTextBox
	scf
	ret

.done
	and a
	ret
; 3dce6

Function3dce6: ; 3dce6
	ld a, [hBattleTurn]
	push af
	xor a
	ld [hBattleTurn], a
	ld [wcfca], a
	ld de, ANIM_RETURN_MON
	call Call_PlayBattleAnim
	pop af
	ld [hBattleTurn], a
	ret
; 3dcf9

HandleHealingItems: ; 3dcf9
	ld a, [hLinkPlayerNumber]
	cp $1
	jr z, .player_1
	call SetPlayerTurn
	call HandleHPHealingItem
	call UseHeldStatusHealingItem
	call HandleStatusHealingItem
	call SetEnemyTurn
	call HandleHPHealingItem
	call UseHeldStatusHealingItem
	jp HandleStatusHealingItem

.player_1
	call SetEnemyTurn
	call HandleHPHealingItem
	call UseHeldStatusHealingItem
	call HandleStatusHealingItem
	call SetPlayerTurn
	call HandleHPHealingItem
	call UseHeldStatusHealingItem
	jp HandleStatusHealingItem
; 3dd2f

HandleHPHealingItem: ; 3dd2f
	callab GetOpponentItem
	ld a, b
	cp $1
	ret nz
	ld de, EnemyMonHP + 1
	ld hl, EnemyMonMaxHP
	ld a, [hBattleTurn]
	and a
	jr z, .go
	ld de, BattleMonHP + 1
	ld hl, BattleMonMaxHP

.go
	push bc
	ld a, [de]
	ld [wd1ec], a
	add a
	ld c, a
	dec de
	ld a, [de]
	inc de
	ld [wd1ed], a
	adc a
	ld b, a
	ld a, b
	cp [hl]
	ld a, c
	pop bc
	jr z, .equal
	jr c, .less
	ret

.equal
	inc hl
	cp [hl]
	dec hl
	ret nc

.less
	call ItemRecoveryAnim
	ld a, [hli]
	ld [Buffer2], a
	ld a, [hl]
	ld [Buffer1], a
	ld a, [de]
	add c
	ld [wd1ee], a
	ld c, a
	dec de
	ld a, [de]
	adc $0
	ld [wd1ef], a
	ld b, a
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	jr nc, .okay
	ld a, [hli]
	ld [wd1ef], a
	ld a, [hl]
	ld [wd1ee], a

.okay
	ld a, [wd1ef]
	ld [de], a
	inc de
	ld a, [wd1ee]
	ld [de], a
	ld a, [hBattleTurn]
	ld [wd10a], a
	and a
	hlcoord 2, 2
	jr z, .got_hp_bar_coords
	hlcoord 10, 9

.got_hp_bar_coords
	ld [wd10a], a
	predef AnimateHPBar
UseOpponentItem:
	call RefreshBattleHuds
	callab GetOpponentItem
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	callab ConsumeHeldItem
	ld hl, RecoveredUsingText
	jp StdBattleTextBox
; 3ddc8


ItemRecoveryAnim: ; 3ddc8
	push hl
	push de
	push bc
	call EmptyBattleTextBox
	ld a, RECOVER
	ld [FXAnimIDLo], a
	call SwitchTurnCore
	xor a
	ld [wcfca], a
	ld [FXAnimIDHi], a
	predef PlayBattleAnim
	call SwitchTurnCore
	pop bc
	pop de
	pop hl
	ret
; 3dde9

UseHeldStatusHealingItem: ; 3dde9
	callab GetOpponentItem
	ld hl, .Statuses
.loop
	ld a, [hli]
	cp $ff
	ret z
	inc hl
	cp b
	jr nz, .loop
	dec hl
	ld b, [hl]
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and b
	ret z
	xor a
	ld [hl], a
	push bc
	call UpdateOpponentInParty
	pop bc
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	and [hl]
	res SUBSTATUS_TOXIC, [hl]
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVarAddr
	and [hl]
	res SUBSTATUS_NIGHTMARE, [hl]
	ld a, b
	cp ALL_STATUS
	jr nz, .skip_confuse
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVarAddr
	res SUBSTATUS_CONFUSED, [hl]

.skip_confuse
	ld hl, CalcEnemyStats
	ld a, [hBattleTurn]
	and a
	jr z, .got_pointer
	ld hl, CalcPlayerStats

.got_pointer
	call SwitchTurnCore
	ld a, BANK(CalcEnemyStats)
	rst FarCall
	call SwitchTurnCore
	call ItemRecoveryAnim
	call UseOpponentItem
	ld a, $1
	and a
	ret
; 3de44

.Statuses ; 3de44
	db HELD_HEAL_POISON, 1 << PSN
	db HELD_HEAL_FREEZE, 1 << FRZ
	db HELD_HEAL_BURN, 1 << BRN
	db HELD_HEAL_SLEEP, SLP
	db HELD_HEAL_PARALYZE, 1 << PAR
	db HELD_HEAL_STATUS, ALL_STATUS
	db $ff
; 3de51


HandleStatusHealingItem: ; 3de51
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	bit SUBSTATUS_CONFUSED, a
	ret z
	callab GetOpponentItem
	ld a, b
	cp HELD_HEAL_CONFUSION
	jr z, .heal_status
	cp HELD_HEAL_STATUS
	ret nz

.heal_status
	ld a, [hl]
	ld [wd265], a
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVarAddr
	res SUBSTATUS_CONFUSED, [hl]
	call GetItemName
	call ItemRecoveryAnim
	ld hl, BattleText_0x80dab
	call StdBattleTextBox
	ld a, [hBattleTurn]
	and a
	jr nz, .do_partymon
	call GetOTPartymonItem
	xor a
	ld [bc], a
	ld a, [wBattleMode]
	dec a
	ret z
	ld [hl], $0
	ret

.do_partymon
	call GetPartymonItem
	xor a
	ld [bc], a
	ld [hl], a
	ret
; 3de97

HandleStatBoostingHeldItems: ; 3de97
; The effects handled here are not used in-game.
	ld a, [hLinkPlayerNumber]
	cp $1
	jr z, .player_1
	call .DoEnemy
	jp .DoPlayer

.player_1
	call .DoPlayer
	jp .DoEnemy
; 3dea9

.DoEnemy: ; 3dea9
	call GetPartymonItem
	ld a, $0
	jp .HandleItem
; 3deb1

.DoPlayer: ; 3deb1
	call GetOTPartymonItem
	ld a, $1
.HandleItem: ; 3deb6
	ld [hBattleTurn], a
	ld d, h
	ld e, l
	push de
	push bc
	ld a, [bc]
	ld b, a
	callab GetItemHeldEffect
	ld hl, .StatUpItems
.loop
	ld a, [hli]
	cp $ff
	jr z, .finish
rept 2
	inc hl
endr
	cp b
	jr nz, .loop
	pop bc
	ld a, [bc]
	ld [wd265], a
	push bc
rept 2
	dec hl
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, BANK(BattleCommand_AttackUp)
	rst FarCall
	pop bc
	pop de
	ld a, [FailedMessage]
	and a
	ret nz
	xor a
	ld [bc], a
	ld [de], a
	call GetItemName
	ld hl, BattleText_UsersStringBuffer1Activated
	call StdBattleTextBox
	callab BattleCommand_StatUpMessage
	ret

.finish
	pop bc
	pop de
	ret
; 3defc

.StatUpItems
	dbw HELD_ATTACK_UP,     BattleCommand_AttackUp
	dbw HELD_DEFENSE_UP,    BattleCommand_DefenseUp
	dbw HELD_SPEED_UP,      BattleCommand_SpeedUp
	dbw HELD_SP_ATTACK_UP,  BattleCommand_SpecialAttackUp
	dbw HELD_SP_DEFENSE_UP, BattleCommand_SpecialDefenseUp
	dbw HELD_ACCURACY_UP,   BattleCommand_AccuracyUp
	dbw HELD_EVASION_UP,    BattleCommand_EvasionUp
	db $ff
; 3df12


GetPartymonItem: ; 3df12
	ld hl, PartyMon1Item
	ld a, [CurBattleMon]
	call GetPartyLocation
	ld bc, BattleMonItem
	ret
; 3df1f

GetOTPartymonItem: ; 3df1f
	ld hl, OTPartyMon1Item
	ld a, [CurOTMon]
	call GetPartyLocation
	ld bc, EnemyMonItem
	ret
; 3df2c

UpdateBattleHUDs: ; 3df2c
	push hl
	push de
	push bc
	call DrawPlayerHUD
	ld hl, PlayerHPPal
	call SetHPPal
	call CheckDanger
	call DrawEnemyHUD
	ld hl, EnemyHPPal
	call SetHPPal
	pop bc
	pop de
	pop hl
	ret
; 3df48



UpdatePlayerHUD:: ; 3df48
	push hl
	push de
	push bc
	call DrawPlayerHUD
	call UpdatePlayerHPPal
	call CheckDanger
	pop bc
	pop de
	pop hl
	ret
; 3df58

DrawPlayerHUD: ; 3df58
	xor a
	ld [hBGMapMode], a

	; Clear the area
	hlcoord 9, 7
	lb bc, 5, 11
	call ClearBox

	callba DrawPlayerExpBar

	hlcoord 18, 9
	ld [hl], $73 ; vertical bar
	call PrintPlayerHUD

	; HP bar
	hlcoord 10, 9
	ld b, 1
	xor a ; PARTYMON
	ld [MonType], a
	predef DrawPlayerHP

	; Exp bar
	push de
	ld a, [CurBattleMon]
	ld hl, PartyMon1Exp + 2
	call GetPartyLocation
	ld d, h
	ld e, l

	hlcoord 10, 11
	ld a, [TempMonLevel]
	ld b, a
	call FillInExpBar
	pop de
	ret
; 3df98

UpdatePlayerHPPal: ; 3df98
	ld hl, PlayerHPPal
	jp Function3e12e
; 3df9e

CheckDanger: ; 3df9e
	ld hl, BattleMonHP
	ld a, [hli]
	or [hl]
	jr z, .no_danger
	ld a, [wc6fd]
	and a
	jr nz, .done
	ld a, [PlayerHPPal]
	cp HP_RED
	jr z, .danger

.no_danger
	ld hl, Danger
	res 7, [hl]
	jr .done

.danger
	ld hl, Danger
	set 7, [hl]

.done
	ret
; 3dfbf

PrintPlayerHUD: ; 3dfbf
	ld de, BattleMonNick
	hlcoord 10, 7
	call Function3e138
	call PlaceString

	push bc

	ld a, [CurBattleMon]
	ld hl, PartyMon1DVs
	call GetPartyLocation
	ld de, TempMonDVs
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld hl, BattleMonLevel
	ld de, TempMonLevel
	ld bc, $0011
	call CopyBytes
	ld a, [CurBattleMon]
	ld hl, PartyMon1Species
	call GetPartyLocation
	ld a, [hl]
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	call GetBaseData

	pop hl
	dec hl

	ld a, BREEDMON
	ld [MonType], a
	callab GetGender
	ld a, " "
	jr c, .asm_3e013
	ld a, "♂"
	jr nz, .asm_3e013
	ld a, "♀"

.asm_3e013
	hlcoord 17, 8
	ld [hl], a
	hlcoord 14, 8
	push af
	push hl
	ld de, BattleMonStatus
	predef PlaceNonFaintStatus
	pop hl
	pop bc
	ret nz
	ld a, b
	cp " "
	jr nz, .asm_3e02d
	dec hl

.asm_3e02d
	ld a, [BattleMonLevel]
	ld [TempMonLevel], a
	jp PrintLevel
; 3e036

UpdateEnemyHUD:: ; 3e036
	push hl
	push de
	push bc
	call DrawEnemyHUD
	call UpdateEnemyHPPal
	pop bc
	pop de
	pop hl
	ret
; 3e043

DrawEnemyHUD: ; 3e043
	xor a
	ld [hBGMapMode], a

	hlcoord 1, 0
	lb bc, 4, 11
	call ClearBox

	callba Function2c0c5

	ld a, [TempEnemyMonSpecies]
	ld [CurSpecies], a
	ld [CurPartySpecies], a
	call GetBaseData
	ld de, EnemyMonNick
	hlcoord 1, 0
	call Function3e138
	call PlaceString
	ld h, b
	ld l, c
	dec hl

	ld hl, EnemyMonDVs
	ld de, TempMonDVs
	ld a, [EnemySubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	jr z, .ok
	ld hl, wc6f2
.ok
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a

	ld a, BREEDMON
	ld [MonType], a
	callab GetGender
	ld a, " "
	jr c, .asm_3e09a
	ld a, "♂"
	jr nz, .asm_3e09a
	ld a, "♀"

.asm_3e09a
	hlcoord 9, 1
	ld [hl], a

	hlcoord 6, 1
	push af
	push hl
	ld de, EnemyMonStatus
	predef PlaceNonFaintStatus
	pop hl
	pop bc
	jr nz, .asm_3e0be
	ld a, b
	cp " "
	jr nz, .asm_3e0b5
	dec hl
.asm_3e0b5
	ld a, [EnemyMonLevel]
	ld [TempMonLevel], a
	call PrintLevel
.asm_3e0be

	ld hl, EnemyMonHP
	ld a, [hli]
	ld [hMultiplicand + 1], a
	ld a, [hld]
	ld [hMultiplicand + 2], a
	or [hl]
	jr nz, .asm_3e0d1

	ld c, a
	ld e, a
	ld d, HP_BAR_LENGTH
	jp .asm_3e11a

.asm_3e0d1
	xor a
	ld [hMultiplicand], a
	ld a, HP_BAR_LENGTH_PX
	ld [hMultiplier], a
	call Multiply
	ld hl, EnemyMonMaxHP
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld [hMultiplier], a
	ld a, b
	and a
	jr z, .asm_3e105
	ld a, [hMultiplier]
	srl b
	rr a
	srl b
	rr a
	ld [hDivisor], a
	ld a, [hProduct + 2]
	ld b, a
	srl b
	ld a, [hProduct + 3]
	rr a
	srl b
	rr a
	ld [hProduct + 3], a
	ld a, b
	ld [hProduct + 2], a

.asm_3e105
	ld a, [hProduct + 2]
	ld [hDividend + 0], a
	ld a, [hProduct + 3]
	ld [hDividend + 1], a
	ld a, $2
	ld b, a
	call Divide
	ld a, [hQuotient + 2]
	ld e, a
	ld a, HP_BAR_LENGTH
	ld d, a
	ld c, a

.asm_3e11a
	xor a
	ld [wd10a], a
	hlcoord 2, 2
	ld b, 0
	call DrawBattleHPBar
	ret
; 3e127

UpdateEnemyHPPal: ; 3e127
	ld hl, EnemyHPPal
	call Function3e12e
	ret
; 3e12e

Function3e12e: ; 3e12e
	ld b, [hl]
	call SetHPPal
	ld a, [hl]
	cp b
	ret z
	jp FinishBattleAnim
; 3e138

Function3e138: ; 3e138
	ret
; 3e139

BattleMenu: ; 3e139
	xor a
	ld [hBGMapMode], a
	call LoadTempTileMapToTileMap

	ld a, [BattleType]
	cp BATTLETYPE_DEBUG
	jr z, .ok
	cp BATTLETYPE_TUTORIAL
	jr z, .ok
	call EmptyBattleTextBox
	call UpdateBattleHuds
	call EmptyBattleTextBox
	call LoadTileMapToTempTileMap
.ok

.loop
	ld a, [BattleType]
	cp BATTLETYPE_CONTEST
	jr nz, .not_contest
	callba ContestBattleMenu
	jr .next
.not_contest

	; Auto input: choose "ITEM"
	ld a, [InputType]
	or a
	jr z, .skip_dude_pack_select
	callba _DudeAutoInput_DownA
.skip_dude_pack_select

	call LoadBattleMenu2
	ret c

.next
	ld a, $1
	ld [hBGMapMode], a
	ld a, [wd0d2]
	cp $1
	jp z, BattleMenu_Fight
	cp $3
	jp z, BattleMenu_Pack
	cp $2
	jp z, BattleMenu_PKMN
	cp $4
	jp z, BattleMenu_Run
	jr .loop
; 3e192

BattleMenu_Fight: ; 3e192
	xor a
	ld [wd267], a
	call Call_LoadTempTileMapToTileMap
	and a
	ret
; 3e19b

LoadBattleMenu2: ; 3e19b
	call IsMobileBattle
	jr z, .mobile

	callba LoadBattleMenu
	and a
	ret

.mobile
	callba Function100b12
	ld a, [wcd2b]
	and a
	ret z

	ld hl, wcd2a
	bit 4, [hl]
	jr nz, .error
	ld hl, BattleText_LinkErrorBattleCanceled
	call StdBattleTextBox
	ld c, 60
	call DelayFrames
.error
	scf
	ret
; 3e1c7

BattleMenu_Pack: ; 3e1c7
	ld a, [wLinkMode]
	and a
	jp nz, ItemsCantBeUsed

	ld a, [InBattleTowerBattle]
	and a
	jp nz, ItemsCantBeUsed

	call LoadStandardMenuDataHeader

	ld a, [BattleType]
	cp BATTLETYPE_TUTORIAL
	jr z, .tutorial
	cp BATTLETYPE_CONTEST
	jr z, .contest

	callba BattlePack
	ld a, [wd0ec]
	and a
	jr z, .didnt_use_item
	jr .got_item

.tutorial
	callba Function107bb
	ld a, POKE_BALL
	ld [CurItem], a
	call DoItemEffect
	jr .got_item

.contest
	ld a, PARK_BALL
	ld [CurItem], a
	call DoItemEffect

.got_item
	call Function3e234
	ret

.didnt_use_item
	call ClearPalettes
	call DelayFrame
	call _LoadBattleFontsHPBar
	call GetMonBackpic
	call GetMonFrontpic
	call ExitMenu
	call WaitBGMap
	call FinishBattleAnim
	call LoadTileMapToTempTileMap
	jp BattleMenu
; 3e22b

ItemsCantBeUsed: ; 3e22b
	ld hl, BattleText_ItemsCantBeUsedHere
	call StdBattleTextBox
	jp BattleMenu
; 3e234

Function3e234: ; 3e234
	ld a, [wc64e]
	and a
	jr nz, .asm_3e279
	callab CheckItemPocket
	ld a, [wItemAttributeParamBuffer]
	cp $3
	jr z, .asm_3e24a
	call ClearBGPalettes

.asm_3e24a
	xor a
	ld [hBGMapMode], a
	call _LoadBattleFontsHPBar
	call ClearSprites
	ld a, [BattleType]
	cp BATTLETYPE_TUTORIAL
	jr z, .asm_3e25d
	call GetMonBackpic

.asm_3e25d
	call GetMonFrontpic
	ld a, $1
	ld [MenuSelection2], a
	call ExitMenu
	call UpdateBattleHUDs
	call WaitBGMap
	call LoadTileMapToTempTileMap
	call ResetTextRelatedRAM
	call FinishBattleAnim
	and a
	ret

.asm_3e279
	xor a
	ld [wc64e], a
	ld a, [wBattleResult]
	and $c0
	ld [wBattleResult], a
	call ResetTextRelatedRAM
	call SetPalettes
	scf
	ret
; 3e28d

BattleMenu_PKMN: ; 3e28d
	call LoadStandardMenuDataHeader
Function3e290:
	call ExitMenu
	call LoadStandardMenuDataHeader
	call ClearBGPalettes
Function3e299:
	call Function3d2fa
	xor a
	ld [PartyMenuActionText], a
	call Function3d313
	call Function3d329
	jr c, .asm_3e2da
.asm_3e2a8
	callba Function8ea4a
	call Function3e2f5
	jr c, .asm_3e2c8
	call Function1bee
	ld a, [MenuSelection2]
	cp $1
	jp z, Function3e358
	cp $2
	jr z, .asm_3e2cf
	cp $3
	jr z, .asm_3e2da
	jr .asm_3e2a8

.asm_3e2c8
	call CheckMobileBattleError
	jr c, .asm_3e2da
	jr Function3e299

.asm_3e2cf
	call Function3e308
	call CheckMobileBattleError
	jr c, .asm_3e2da
	jp Function3e290

.asm_3e2da
	call ClearSprites
	call ClearPalettes
	call DelayFrame
	call _LoadHPBar
	call WriteBackup
	call LoadTileMapToTempTileMap
	call ClearSGB
	call SetPalettes
	jp BattleMenu
; 3e2f5

Function3e2f5: ; 3e2f5
	call IsMobileBattle
	jr z, .asm_3e301
	callba Function24e99
	ret

.asm_3e301
	callba Function100d22
	ret
; 3e308

Function3e308: ; 3e308
	call DisableLCD
	ld hl, VTiles2 tile $31
	ld de, VTiles0
	ld bc, $0110
	call CopyBytes
	ld hl, VTiles2
	ld de, VTiles0 tile $11
	ld bc, $0310
	call CopyBytes
	call EnableLCD
	call ClearSprites
	call LowVolume
	xor a ; PARTYMON
	ld [MonType], a
	callba Function4dc7b
	call MaxVolume
	call DisableLCD
	ld hl, VTiles0
	ld de, VTiles2 tile $31
	ld bc, $0110
	call CopyBytes
	ld hl, VTiles0 tile $11
	ld de, VTiles2
	ld bc, $0310
	call CopyBytes
	call EnableLCD
	ret
; 3e358


Function3e358: ; 3e358
	ld a, [CurBattleMon]
	ld d, a
	ld a, [CurPartyMon]
	cp d
	jr nz, .asm_3e36b
	ld hl, BattleText_PkmnIsAlreadyOut
	call StdBattleTextBox
	jp Function3e299

.asm_3e36b
	ld a, [wPlayerWrapCount]
	and a
	jr nz, .asm_3e378
	ld a, [EnemySubStatus5]
	bit SUBSTATUS_CANT_RUN, a
	jr z, .asm_3e381

.asm_3e378
	ld hl, BattleText_PkmnCantBeRecalled
	call StdBattleTextBox
	jp Function3e299

.asm_3e381
	call CheckIfPartyHasPkmnToBattleWith
	jp z, Function3e299
	ld a, [CurBattleMon]
	ld [LastPlayerMon], a
	ld a, $2
	ld [wd0ec], a
	call ClearPalettes
	call DelayFrame
	call ClearSprites
	call _LoadHPBar
	call WriteBackup
	call ClearSGB
	call SetPalettes
	ld a, [CurPartyMon]
	ld [CurBattleMon], a
	; fallthrough
; 3e3ad

PlayerSwitch: ; 3e3ad
	ld a, 1
	ld [wPlayerIsSwitching], a
	ld a, [wLinkMode]
	and a
	jr z, .not_linked
	call LoadStandardMenuDataHeader
	call Function3e8e4
	call WriteBackup

.not_linked
	call ParseEnemyAction
	ld a, [wLinkMode]
	and a
	jr nz, .linked

.switch
	call BattleMonEntrance
	and a
	ret

.linked
	ld a, [wBattleAction]
	cp BATTLEACTION_E
	jp z, .switch
	cp BATTLEACTION_D
	jp z, .switch
	cp BATTLEACTION_SWITCH1
	jp c, .switch
	cp BATTLEACTION_FORFEIT
	jr nz, .dont_run
	call WildFled_EnemyFled_LinkBattleCanceled
	ret

.dont_run
	ld a, [hLinkPlayerNumber]
	cp $1
	jr z, .player_1
	call BattleMonEntrance
	call EnemyMonEntrance
	and a
	ret

.player_1
	call EnemyMonEntrance
	call BattleMonEntrance
	and a
	ret
; 3e3ff

EnemyMonEntrance: ; 3e3ff
	callab AI_Switch
	call SetEnemyTurn
	jp SpikesDamage
; 3e40b

BattleMonEntrance: ; 3e40b
	call BattleMonNickComma_TextBox

	ld c, 50
	call DelayFrames

	ld hl, PlayerSubStatus4
	res SUBSTATUS_RAGE, [hl]

	call SetEnemyTurn
	call PursuitSwitch
	jr c, .ok
	call Function3dce6
.ok

	hlcoord 9, 7
	lb bc, 5, 11
	call ClearBox

	ld a, [CurBattleMon]
	ld [CurPartyMon], a
	call AddBattleParticipant
	call InitBattleMon
	call ResetPlayerStatLevels
	call SendOutPkmnText
	call NewBattleMonStatus
	call BreakAttraction
	call SendOutPlayerMon
	call EmptyBattleTextBox
	call LoadTileMapToTempTileMap
	call SetPlayerTurn
	call SpikesDamage
	ld a, $2
	ld [MenuSelection2], a
	ret
; 3e459

PassedBattleMonEntrance: ; 3e459
	ld c, 50
	call DelayFrames

	hlcoord 9, 7
	lb bc, 5, 11
	call ClearBox

	ld a, [CurPartyMon]
	ld [CurBattleMon], a
	call AddBattleParticipant
	call InitBattleMon
	xor a
	ld [wd265], a
	call ApplyStatLevelMultiplierOnAllStats
	call SendOutPlayerMon
	call EmptyBattleTextBox
	call LoadTileMapToTempTileMap
	call SetPlayerTurn
	jp SpikesDamage
; 3e489


BattleMenu_Run: ; 3e489
	call Call_LoadTempTileMapToTileMap
	ld a, $3
	ld [MenuSelection2], a
	ld hl, BattleMonSpeed
	ld de, EnemyMonSpeed
	call TryToRunAwayFromBattle
	ld a, $0
	ld [wd266], a
	ret c
	ld a, [wd0ec]
	and a
	ret nz
	jp BattleMenu
; 3e4a8


CheckAmuletCoin: ; 3e4a8
	ld a, [BattleMonItem]
	ld b, a
	callab GetItemHeldEffect
	ld a, b
	cp HELD_AMULET_COIN
	ret nz
	ld a, 1
	ld [wc73d], a
	ret
; 3e4bc

MoveSelectionScreen: ; 3e4bc
	call IsMobileBattle
	jr nz, .asm_3e4c8
	callba Function100b9f
	ret

.asm_3e4c8
	ld hl, EnemyMonMoves
	ld a, [wd235]
	dec a
	jr z, .asm_3e4e2
	dec a
	jr z, .asm_3e4dd
	call Function3e786
	ret z
	ld hl, BattleMonMoves
	jr .asm_3e4e2

.asm_3e4dd
	ld a, MON_MOVES
	call GetPartyParamLocation

.asm_3e4e2
	ld de, wListMoves_MoveIndicesBuffer
	ld bc, NUM_MOVES
	call CopyBytes
	xor a
	ld [hBGMapMode], a

	hlcoord 4, 17 - NUM_MOVES - 1
	ld b, 4
	ld c, 14
	ld a, [wd235]
	cp $2
	jr nz, .asm_3e503
	hlcoord 4, 17 - NUM_MOVES - 1 - 4
	ld b, 4
	ld c, 14
.asm_3e503
	call TextBox

	hlcoord 6, 17 - NUM_MOVES
	ld a, [wd235]
	cp $2
	jr nz, .asm_3e513
	hlcoord 6, 17 - NUM_MOVES - 4
.asm_3e513
	ld a, SCREEN_WIDTH
	ld [Buffer1], a
	predef ListMoves

	ld b, 5
	ld a, [wd235]
	cp $2
	ld a, 17 - NUM_MOVES
	jr nz, .asm_3e52c
	ld b, 5
	ld a, 17 - NUM_MOVES - 4

.asm_3e52c
	ld [wcfa1], a
	ld a, b
	ld [wcfa2], a
	ld a, [wd235]
	cp $1
	jr z, .asm_3e53e
	ld a, [CurMoveNum]
	inc a

.asm_3e53e
	ld [MenuSelection2], a
	ld a, $1
	ld [wcfaa], a
	ld a, [wd0eb]
	inc a
	ld [wcfa3], a
	ld a, $1
	ld [wcfa4], a
	ld c, $2c
	ld a, [wd235]
	dec a
	ld b, $c1
	jr z, .asm_3e569
	dec a
	ld b, $c3
	jr z, .asm_3e569
	ld a, [wLinkMode]
	and a
	jr nz, .asm_3e569
	ld b, $c7

.asm_3e569
	ld a, b
	ld [wcfa8], a
	ld a, c
	ld [wcfa5], a
	xor a
	ld [wcfa6], a
	ld a, $10
	ld [wcfa7], a
.asm_3e57a
	ld a, [wd235]
	and a
	jr z, .asm_3e58e
	dec a
	jr nz, .asm_3e5a3
	hlcoord 11, 14
	ld de, .string_3e61c
	call PlaceString
	jr .asm_3e5a3

.asm_3e58e
	call MoveInfoBox
	ld a, [wd0e3]
	and a
	jr z, .asm_3e5a3
	hlcoord 5, 13
	ld bc, SCREEN_WIDTH
	dec a
	call AddNTimes
	ld [hl], "▷"

.asm_3e5a3
	ld a, $1
	ld [hBGMapMode], a
	call Function1bd3
	bit 6, a ; D_UP
	jp nz, .asm_3e61d
	bit 7, a ; D_DOWN
	jp nz, .asm_3e62e
	bit 2, a ; B_BUTTON
	jp nz, .asm_3e643
	bit 1, a ; A_BUTTON
	push af

	xor a
	ld [wd0e3], a
	ld a, [MenuSelection2]
	dec a
	ld [MenuSelection2], a
	ld b, a
	ld a, [wd235]
	dec a
	jr nz, .asm_3e5d0

	pop af
	ret

.asm_3e5d0
	dec a
	ld a, b
	ld [CurMoveNum], a
	jr nz, .asm_3e5d9

	pop af
	ret

.asm_3e5d9
	pop af
	ret nz

	ld hl, BattleMonPP
	ld a, [MenuSelection2]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	and $3f
	jr z, .asm_3e610
	ld a, [PlayerDisableCount]
	swap a
	and $f
	dec a
	cp c
	jr z, .asm_3e60b
	ld a, [wc6e1]
	and a
	jr nz, .asm_3e606
	ld a, [MenuSelection2]
	ld hl, BattleMonMoves
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]

.asm_3e606
	ld [CurPlayerMove], a
	xor a
	ret

.asm_3e60b
	ld hl, BattleText_TheMoveIsDisabled
	jr .asm_3e613

.asm_3e610
	ld hl, BattleText_TheresNoPPLeftForThisMove

.asm_3e613
	call StdBattleTextBox
	call Call_LoadTempTileMapToTileMap
	jp MoveSelectionScreen
; 3e61c

.string_3e61c ; 3e61c
	db "@"
; 3e61d

.asm_3e61d
	ld a, [MenuSelection2]
	and a
	jp nz, .asm_3e57a
	ld a, [wd0eb]
	inc a
	ld [MenuSelection2], a
	jp .asm_3e57a
; 3e62e

.asm_3e62e ; 3e62e
	ld a, [MenuSelection2]
	ld b, a
	ld a, [wd0eb]
rept 2
	inc a
endr
	cp b
	jp nz, .asm_3e57a
	ld a, $1
	ld [MenuSelection2], a
	jp .asm_3e57a
; 3e643

.asm_3e643 ; 3e643
	ld a, [wd0e3]
	and a
	jr z, .asm_3e6bf
	ld hl, BattleMonMoves
	call .asm_3e6a5
	ld hl, BattleMonPP
	call .asm_3e6a5
	ld hl, PlayerDisableCount
	ld a, [hl]
	swap a
	and $f
	ld b, a
	ld a, [MenuSelection2]
	cp b
	jr nz, .asm_3e671
	ld a, [hl]
	and $f
	ld b, a
	ld a, [wd0e3]
	swap a
	add b
	ld [hl], a
	jr .asm_3e682

.asm_3e671
	ld a, [wd0e3]
	cp b
	jr nz, .asm_3e682
	ld a, [hl]
	and $f
	ld b, a
	ld a, [MenuSelection2]
	swap a
	add b
	ld [hl], a

.asm_3e682
	ld a, [PlayerSubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	jr nz, .asm_3e69e
	ld hl, PartyMon1Moves
	ld a, [CurBattleMon]
	call GetPartyLocation
	push hl
	call .asm_3e6a5
	pop hl
	ld bc, MON_PP - MON_MOVES
	add hl, bc
	call .asm_3e6a5

.asm_3e69e
	xor a
	ld [wd0e3], a
	jp MoveSelectionScreen

.asm_3e6a5
	push hl
	ld a, [wd0e3]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld a, [MenuSelection2]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [de]
	ld b, [hl]
	ld [hl], a
	ld a, b
	ld [de], a
	ret

.asm_3e6bf
	ld a, [MenuSelection2]
	ld [wd0e3], a
	jp MoveSelectionScreen
; 3e6c8

MoveInfoBox: ; 3e6c8
	xor a
	ld [hBGMapMode], a

	hlcoord 0, 8
	ld b, 3
	ld c, 9
	call TextBox
	call MobileTextBorder

	ld a, [PlayerDisableCount]
	and a
	jr z, .asm_3e6f4

	swap a
	and $f
	ld b, a
	ld a, [MenuSelection2]
	cp b
	jr nz, .asm_3e6f4

	hlcoord 1, 10
	ld de, .Disabled
	call PlaceString
	jr .done

.asm_3e6f4
	ld hl, MenuSelection2
	dec [hl]
	call SetPlayerTurn
	ld hl, BattleMonMoves
	ld a, [MenuSelection2]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld [CurPlayerMove], a

	ld a, [CurBattleMon]
	ld [CurPartyMon], a
	ld a, WILDMON
	ld [MonType], a
	callab GetMaxPPOfMove

	ld hl, MenuSelection2
	ld c, [hl]
	inc [hl]
	ld b, 0
	ld hl, BattleMonPP
	add hl, bc
	ld a, [hl]
	and $3f
	ld [StringBuffer1], a
	call Function3e75f

	hlcoord 1, 9
	ld de, .Type
	call PlaceString

	hlcoord 7, 11
	ld [hl], "/"

	callab UpdateMoveData
	ld a, [wPlayerMoveStruct + MOVE_ANIM]
	ld b, a
	hlcoord 2, 10
	predef PrintMoveType

.done
	ret
; 3e74f

.Disabled
	db "Disabled!@"
.Type
	db "TYPE/@"
; 3e75f


Function3e75f: ; 3e75f
	hlcoord 5, 11
	ld a, [wLinkMode] ; What's the point of this check?
	cp LINK_MOBILE
	jr c, .ok
	hlcoord 5, 11
.ok
	push hl
	ld de, StringBuffer1
	lb bc, 1, 2
	call PrintNum
	pop hl
rept 2
	inc hl
endr
	ld [hl], "/"
	inc hl
	ld de, wNamedObjectIndexBuffer
	lb bc, 1, 2
	call PrintNum
	ret
; 3e786

Function3e786: ; 3e786
	ld a, STRUGGLE
	ld [CurPlayerMove], a
	ld a, [PlayerDisableCount]
	and a
	ld hl, BattleMonPP
	jr nz, .asm_3e79f

	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	inc hl
	or [hl]
	and $3f
	ret nz
	jr .asm_3e7b4

.asm_3e79f
	swap a
	and $f
	ld b, a
	ld d, $5
	xor a
.asm_3e7a7
	dec d
	jr z, .asm_3e7b2
	ld c, [hl]
	inc hl
	dec b
	jr z, .asm_3e7a7
	or c
	jr .asm_3e7a7

.asm_3e7b2
	and a
	ret nz

.asm_3e7b4
	ld hl, BattleText_PkmnHasNoMovesLeft
	call StdBattleTextBox
	ld c, 60
	call DelayFrames
	xor a
	ret
; 3e7c1



ParseEnemyAction: ; 3e7c1
	ld a, [wEnemyIsSwitching]
	and a
	ret nz
	ld a, [wLinkMode]
	and a
	jr z, .not_linked
	call EmptyBattleTextBox
	call LoadTileMapToTempTileMap
	ld a, [wd0ec]
	and a
	call z, Function3e8e4
	call Call_LoadTempTileMapToTileMap
	ld a, [wBattleAction]
	cp BATTLEACTION_E
	jp z, .struggle
	cp BATTLEACTION_D
	jp z, .battle_action_d
	cp BATTLEACTION_SWITCH1
	jp nc, ResetVarsForSubstatusRage
	ld [CurEnemyMoveNum], a
	ld c, a
	ld a, [EnemySubStatus1]
	bit SUBSTATUS_ROLLOUT, a
	jp nz, .skip_load
	ld a, [EnemySubStatus3]
	and 1 << SUBSTATUS_CHARGED | 1 << SUBSTATUS_RAMPAGE | 1 << SUBSTATUS_BIDE
	jp nz, .skip_load

	ld hl, EnemySubStatus5
	bit SUBSTATUS_ENCORED, [hl]
	ld a, [LastEnemyMove]
	jp nz, .finish
	ld hl, EnemyMonMoves
	ld b, 0
	add hl, bc
	ld a, [hl]
	jp .finish

.not_linked
	ld hl, EnemySubStatus5
	bit SUBSTATUS_ENCORED, [hl]
	jr z, .skip_encore
	ld a, [LastEnemyMove]
	jp .finish

.skip_encore
	call CheckSubstatus_RechargeChargedRampageBideRollout
	jp nz, ResetVarsForSubstatusRage
	jr .continue

.battle_action_d
	ld a, $ff
	jr .finish

.continue
	ld hl, EnemyMonMoves
	ld de, EnemyMonPP
	ld b, NUM_MOVES
.loop
	ld a, [hl]
	and a
	jp z, .struggle
	ld a, [EnemyDisabledMove]
	cp [hl]
	jr z, .disabled
	ld a, [de]
	and $3f
	jr nz, .enough_pp

.disabled
	inc hl
	inc de
	dec b
	jr nz, .loop
	jr .struggle

.enough_pp
	ld a, [wBattleMode]
	dec a
	jr nz, .skip_load
; wild
.loop2
	ld hl, EnemyMonMoves
	call BattleRandom
	and 3 ; TODO factor in NUM_MOVES
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [EnemyDisableCount]
	swap a
	and $f
	dec a
	cp c
	jr z, .loop2
	ld a, [hl]
	and a
	jr z, .loop2
	ld hl, EnemyMonPP
	add hl, bc
	ld b, a
	ld a, [hl]
	and $3f
	jr z, .loop2
	ld a, c
	ld [CurEnemyMoveNum], a
	ld a, b

.finish
	ld [CurEnemyMove], a

.skip_load
	call SetEnemyTurn
	callab UpdateMoveData
	call CheckSubstatus_RechargeChargedRampageBideRollout
	jr nz, .raging
	xor a
	ld [wEnemyCharging], a

.raging
	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	cp EFFECT_FURY_CUTTER
	jr z, .fury_cutter
	xor a
	ld [EnemyFuryCutterCount], a

.fury_cutter
	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	cp EFFECT_RAGE
	jr z, .no_rage
	ld hl, EnemySubStatus4
	res SUBSTATUS_RAGE, [hl]
	xor a
	ld [wEnemyRageCounter], a

.no_rage
	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	cp EFFECT_PROTECT
	ret z
	cp EFFECT_ENDURE
	ret z
	xor a
	ld [EnemyProtectCount], a
	ret

.struggle
	ld a, STRUGGLE
	jr .finish
; 3e8c1

ResetVarsForSubstatusRage: ; 3e8c1
	xor a
	ld [EnemyFuryCutterCount], a
	ld [EnemyProtectCount], a
	ld [wEnemyRageCounter], a
	ld hl, EnemySubStatus4
	res SUBSTATUS_RAGE, [hl]
	ret
; 3e8d1

CheckSubstatus_RechargeChargedRampageBideRollout: ; 3e8d1
	ld a, [EnemySubStatus4]
	and 1 << SUBSTATUS_RECHARGE
	ret nz

	ld hl, EnemySubStatus3
	ld a, [hl]
	and 1 << SUBSTATUS_CHARGED | 1 << SUBSTATUS_RAMPAGE | 1 << SUBSTATUS_BIDE
	ret nz

	ld hl, EnemySubStatus1
	bit SUBSTATUS_ROLLOUT, [hl]
	ret
; 3e8e4

Function3e8e4: ; 3e8e4
	callba Function100a09
	ret
; 3e8eb


LoadEnemyMon: ; 3e8eb
; Initialize enemy monster parameters
; To do this we pull the species from TempEnemyMonSpecies

; Notes:
;   BattleRandom is used to ensure sync between Game Boys

; Clear the whole EnemyMon struct
	xor a
	ld hl, EnemyMonSpecies
	ld bc, EnemyMonEnd - EnemyMon
	call ByteFill

; We don't need to be here if we're in a link battle
	ld a, [wLinkMode]
	and a
	jp nz, Function3dabd

; and also not in a BattleTower-Battle
	ld a, [InBattleTowerBattle] ; ????
	bit 0, a
	jp nz, Function3dabd

; Make sure everything knows what species we're working with
	ld a, [TempEnemyMonSpecies]
	ld [EnemyMonSpecies], a
	ld [CurSpecies], a
	ld [CurPartySpecies], a

; Grab the BaseData for this species
	call GetBaseData


; Let's get the item:

; Is the item predetermined?
	ld a, [wBattleMode]
	dec a
	jr z, .WildItem

; If we're in a trainer battle, the item is in the party struct
	ld a, [CurPartyMon]
	ld hl, OTPartyMon1Item
	call GetPartyLocation ; bc = PartyMon[CurPartyMon] - PartyMons
	ld a, [hl]
	jr .UpdateItem


.WildItem
; In a wild battle, we pull from the item slots in BaseData

; Force Item1
; Used for Ho-Oh, Lugia and Snorlax encounters
	ld a, [BattleType]
	cp BATTLETYPE_FORCEITEM
	ld a, [BaseItems]
	jr z, .UpdateItem

; Failing that, it's all up to chance
;  Effective chances:
;    75% None
;    23% Item1
;     2% Item2

; 25% chance of getting an item
	call BattleRandom
	cp a, 1 + (75 percent)
	ld a, NO_ITEM
	jr c, .UpdateItem

; From there, an 8% chance for Item2
	call BattleRandom
	cp a, 8 percent ; 8% of 25% = 2% Item2
	ld a, [BaseItems]
	jr nc, .UpdateItem
	ld a, [BaseItems+1]


.UpdateItem
	ld [EnemyMonItem], a


; Initialize DVs

; If we're in a trainer battle, DVs are predetermined
	ld a, [wBattleMode]
	and a
	jr z, .InitDVs

	ld a, [EnemySubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	jr z, .InitDVs

; Unknown
	ld hl, wc6f2
	ld de, EnemyMonDVs
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	jp .Happiness


.InitDVs

; Trainer DVs

; All trainers have preset DVs, determined by class
; See GetTrainerDVs for more on that
	callba GetTrainerDVs
; These are the DVs we'll use if we're actually in a trainer battle
	ld a, [wBattleMode]
	dec a
	jr nz, .UpdateDVs


; Wild DVs
; Here's where the fun starts

; Roaming monsters (Entei, Raikou) work differently
; They have their own structs, which are shorter than normal
	ld a, [BattleType]
	cp a, BATTLETYPE_ROAMING
	jr nz, .NotRoaming

; Grab HP
	call GetRoamMonHP
	ld a, [hl]
; Check if the HP has been initialized
	and a
; We'll do something with the result in a minute
	push af

; Grab DVs
	call GetRoamMonDVs
	inc hl
	ld a, [hld]
	ld c, a
	ld b, [hl]

; Get back the result of our check
	pop af
; If the RoamMon struct has already been initialized, we're done
	jr nz, .UpdateDVs

; If it hasn't, we need to initialize the DVs
; (HP is initialized at the end of the battle)
	call GetRoamMonDVs
	inc hl
	call BattleRandom
	ld [hld], a
	ld c, a
	call BattleRandom
	ld [hl], a
	ld b, a
; We're done with DVs
	jr .UpdateDVs


.NotRoaming
; Register a contains BattleType

; Forced shiny battle type
; Used by Red Gyarados at Lake of Rage
	cp a, BATTLETYPE_SHINY
	jr nz, .GenerateDVs

	ld b, ATKDEFDV_SHINY ; $ea
	ld c, SPDSPCDV_SHINY ; $aa
	jr .UpdateDVs

.GenerateDVs
; Generate new random DVs
	call BattleRandom
	ld b, a
	call BattleRandom
	ld c, a

.UpdateDVs
; Input DVs in register bc
	ld hl, EnemyMonDVs
	ld a, b
	ld [hli], a
	ld [hl], c


; We've still got more to do if we're dealing with a wild monster
	ld a, [wBattleMode]
	dec a
	jr nz, .Happiness


; Species-specfic:


; Unown
	ld a, [TempEnemyMonSpecies]
	cp a, UNOWN
	jr nz, .Magikarp

; Get letter based on DVs
	ld hl, EnemyMonDVs
	predef GetUnownLetter
; Can't use any letters that haven't been unlocked
; If combined with forced shiny battletype, causes an infinite loop
	call CheckUnownLetter
	jr c, .GenerateDVs ; try again


.Magikarp
; Skimming this part recommended

	ld a, [TempEnemyMonSpecies]
	cp a, MAGIKARP
	jr nz, .Happiness

; Get Magikarp's length
	ld de, EnemyMonDVs
	ld bc, PlayerID
	callab CalcMagikarpLength

; We're clear if the length is < 1536
	ld a, [MagikarpLength]
	cp a, $06 ; $600 = 1536
	jr nz, .CheckMagikarpArea

; 5% chance of skipping size checks
	call Random
	cp a, $0c ; / $100
	jr c, .CheckMagikarpArea
; Try again if > 1614
	ld a, [MagikarpLength + 1]
	cp a, $50
	jr nc, .GenerateDVs

; 20% chance of skipping this check
	call Random
	cp a, $32 ; / $100
	jr c, .CheckMagikarpArea
; Try again if > 1598
	ld a, [MagikarpLength + 1]
	cp a, $40
	jr nc, .GenerateDVs

.CheckMagikarpArea
; The z checks are supposed to be nz
; Instead, all maps in GROUP_LAKE_OF_RAGE (mahogany area)
; and routes 20 and 44 are treated as Lake of Rage

; This also means Lake of Rage Magikarp can be smaller than ones
; caught elsewhere rather than the other way around

; Intended behavior enforces a minimum size at Lake of Rage
; The real behavior prevents size flooring in the Lake of Rage area
	ld a, [MapGroup]
	cp a, GROUP_LAKE_OF_RAGE
	jr z, .Happiness
	ld a, [MapNumber]
	cp a, MAP_LAKE_OF_RAGE
	jr z, .Happiness
; 40% chance of not flooring
	call Random
	cp a, $64 ; / $100
	jr c, .Happiness
; Floor at length 1024
	ld a, [MagikarpLength]
	cp a, 1024 >> 8
	jr c, .GenerateDVs ; try again


; Finally done with DVs

.Happiness
; Set happiness
	ld a, BASE_HAPPINESS
	ld [EnemyMonHappiness], a
; Set level
	ld a, [CurPartyLevel]
	ld [EnemyMonLevel], a
; Fill stats
	ld de, EnemyMonMaxHP
	ld b, $00
	ld hl, LinkBattleRNs + 7 ; ?
	predef CalcPkmnStats

; If we're in a trainer battle,
; get the rest of the parameters from the party struct
	ld a, [wBattleMode]
	cp a, TRAINER_BATTLE
	jr z, .OpponentParty

; If we're in a wild battle, check wild-specific stuff
	and a
	jr z, .TreeMon

	ld a, [EnemySubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	jp nz, .Moves

.TreeMon
; If we're headbutting trees, some monsters enter battle asleep
	call CheckSleepingTreeMon
	ld a, SLP ; Asleep for 7 turns
	jr c, .UpdateStatus
; Otherwise, no status
	xor a

.UpdateStatus
	ld hl, EnemyMonStatus
	ld [hli], a

; Unused byte
	xor a
	ld [hli], a

; Full HP...
	ld a, [EnemyMonMaxHP]
	ld [hli], a
	ld a, [EnemyMonMaxHP + 1]
	ld [hl], a

; ...unless it's a RoamMon
	ld a, [BattleType]
	cp a, BATTLETYPE_ROAMING
	jr nz, .Moves

; Grab HP
	call GetRoamMonHP
	ld a, [hl]
; Check if it's been initialized again
	and a
	jr z, .InitRoamHP
; Update from the struct if it has
	ld a, [hl]
	ld [EnemyMonHP + 1], a
	jr .Moves

.InitRoamHP
; HP only uses the lo byte in the RoamMon struct since
; Raikou/Entei/Suicune will have < 256 hp at level 40
	ld a, [EnemyMonHP + 1]
	ld [hl], a
	jr .Moves


.OpponentParty
; Get HP from the party struct
	ld hl, (OTPartyMon1HP + 1)
	ld a, [CurPartyMon]
	call GetPartyLocation
	ld a, [hld]
	ld [EnemyMonHP + 1], a
	ld a, [hld]
	ld [EnemyMonHP], a

; Make sure everything knows which monster the opponent is using
	ld a, [CurPartyMon]
	ld [CurOTMon], a

; Get status from the party struct
	dec hl
	ld a, [hl] ; OTPartyMonStatus
	ld [EnemyMonStatus], a


.Moves
	ld hl, BaseType1
	ld de, EnemyMonType1
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a

; Get moves
	ld de, EnemyMonMoves
; Are we in a trainer battle?
	ld a, [wBattleMode]
	cp a, TRAINER_BATTLE
	jr nz, .WildMoves
; Then copy moves from the party struct
	ld hl, OTPartyMon1Moves
	ld a, [CurPartyMon]
	call GetPartyLocation
	ld bc, NUM_MOVES
	call CopyBytes
	jr .PP

.WildMoves
; Clear EnemyMonMoves
	xor a
	ld h, d
	ld l, e
rept 3
	ld [hli], a
endr
	ld [hl], a
; Make sure the predef knows this isn't a partymon
	ld [MagikarpLength], a
; Fill moves based on level
	predef FillMoves

.PP
; Trainer battle?
	ld a, [wBattleMode]
	cp a, TRAINER_BATTLE
	jr z, .TrainerPP

; Fill wild PP
	ld hl, EnemyMonMoves
	ld de, EnemyMonPP
	predef FillPP
	jr .Finish

.TrainerPP
; Copy PP from the party struct
	ld hl, OTPartyMon1PP
	ld a, [CurPartyMon]
	call GetPartyLocation
	ld de, EnemyMonPP
	ld bc, NUM_MOVES
	call CopyBytes

.Finish
; Only the first five base stats are copied...
	ld hl, BaseStats
	ld de, EnemyMonBaseStats
	ld b, BaseSpecialDefense - BaseStats
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .loop

	ld a, [BaseCatchRate]
	ld [de], a
	inc de

	ld a, [BaseExp]
	ld [de], a

	ld a, [TempEnemyMonSpecies]
	ld [wd265], a

	call GetPokemonName

; Did we catch it?
	ld a, [wBattleMode]
	and a
	ret z

; Update enemy nick
	ld hl, StringBuffer1
	ld de, EnemyMonNick
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes

; Caught this mon
	ld a, [TempEnemyMonSpecies]
	dec a
	ld c, a
	ld b, 1 ; set
	ld hl, PokedexSeen
	predef FlagPredef

	ld hl, EnemyMonStats
	ld de, EnemyStats
	ld bc, EnemyMonStatsEnd - EnemyMonStats
	call CopyBytes

	ret
; 3eb38


CheckSleepingTreeMon: ; 3eb38
; Return carry if species is in the list
; for the current time of day

; Don't do anything if this isn't a tree encounter
	ld a, [BattleType]
	cp a, BATTLETYPE_TREE
	jr nz, .NotSleeping

; Get list for the time of day
	ld hl, .Morn
	ld a, [TimeOfDay]
	cp a, DAY
	jr c, .Check
	ld hl, .Day
	jr z, .Check
	ld hl, .Nite

.Check
	ld a, [TempEnemyMonSpecies]
	ld de, 1 ; length of species id
	call IsInArray
; If it's a match, the opponent is asleep
	ret c

.NotSleeping
	and a
	ret

.Nite
	db CATERPIE
	db METAPOD
	db BUTTERFREE
	db WEEDLE
	db KAKUNA
	db BEEDRILL
	db SPEAROW
	db EKANS
	db EXEGGCUTE
	db LEDYBA
	db AIPOM
	db -1 ; end

.Day
	db VENONAT
	db HOOTHOOT
	db NOCTOWL
	db SPINARAK
	db HERACROSS
	db -1 ; end

.Morn
	db VENONAT
	db HOOTHOOT
	db NOCTOWL
	db SPINARAK
	db HERACROSS
	db -1 ; end
; 3eb75


CheckUnownLetter: ; 3eb75
; Return carry if the Unown letter hasn't been unlocked yet

	ld a, [UnlockedUnowns]
	ld c, a
	ld de, 0

.loop

; Don't check this set unless it's been unlocked
	srl c
	jr nc, .next

; Is our letter in the set?
	ld hl, .LetterSets
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	push de
	ld a, [UnownLetter]
	ld de, 1
	push bc
	call IsInArray
	pop bc
	pop de

	jr c, .match

.next
; Make sure we haven't gone past the end of the table
rept 2
	inc e
endr
	ld a, e
	cp a, .Set1 - .LetterSets
	jr c, .loop

; Hasn't been unlocked, or the letter is invalid
	scf
	ret

.match
; Valid letter
	and a
	ret

.LetterSets
	dw .Set1
	dw .Set2
	dw .Set3
	dw .Set4

.Set1
	;  A   B   C   D   E   F   G   H   I   J   K
	db 01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, $ff
.Set2
	;  L   M   N   O   P   Q   R
	db 12, 13, 14, 15, 16, 17, 18, $ff
.Set3
	;  S   T   U   V   W
	db 19, 20, 21, 22, 23, $ff
.Set4
	;  X   Y   Z
	db 24, 25, 26, $ff

; 3ebc7


Function3ebc7: ; 3ebc7
	push bc
	ld a, [BattleMonLevel]
	ld b, a
	ld a, [EnemyMonLevel]
	ld [BattleMonLevel], a
	ld a, b
	ld [EnemyMonLevel], a
	pop bc
	ret
; 3ebd8

Function3ebd8: ; 3ebd8
	xor a
	ld [TempEnemyMonSpecies], a
	call FinishBattleAnim
	ld a, [OtherTrainerClass]
	ld [TrainerClass], a
	ld de, VTiles2
	callab GetTrainerPic
	hlcoord 19, 0
	ld c, $0

.outer_loop
	inc c
	ld a, c
	cp $7
	ret z
	xor a
	ld [hBGMapMode], a
	ld [hBGMapThird], a
	ld d, $0
	push bc
	push hl

.inner_loop
	call Function3ec1a
	inc hl
	ld a, $7
	add d
	ld d, a
	dec c
	jr nz, .inner_loop

	ld a, $1
	ld [hBGMapMode], a
	ld c, $4
	call DelayFrames
	pop hl
	pop bc
	dec hl
	jr .outer_loop
; 3ec1a

Function3ec1a: ; 3ec1a
	push hl
	push de
	push bc
	ld e, $7

.loop
	ld [hl], d
	ld bc, SCREEN_WIDTH
	add hl, bc
	inc d
	dec e
	jr nz, .loop

	pop bc
	pop de
	pop hl
	ret
; 3ec2c


ApplyStatusEffectOnPlayerStats: ; 3ec2c
	ld a, 1
	jr ApplyStatusEffectOnStats
; 3ec30

ApplyStatusEffectOnEnemyStats: ; 3ec30
	xor a
; 3ec31

ApplyStatusEffectOnStats: ; 3ec31
	ld [hBattleTurn], a
	call ApplyPrzEffectOnSpeed
	jp ApplyBrnEffectOnAttack
; 3ec39

ApplyPrzEffectOnSpeed: ; 3ec39
	ld a, [hBattleTurn]
	and a
	jr z, .enemy
	ld a, [BattleMonStatus]
	and 1 << PAR
	ret z
	ld hl, BattleMonSpeed + 1
	ld a, [hld]
	ld b, a
	ld a, [hl]
	srl a
	rr b
	srl a
	rr b
	ld [hli], a
	or b
	jr nz, .player_ok
	ld b, $1

.player_ok
	ld [hl], b
	ret

.enemy
	ld a, [EnemyMonStatus]
	and 1 << PAR
	ret z
	ld hl, EnemyMonSpeed + 1
	ld a, [hld]
	ld b, a
	ld a, [hl]
	srl a
	rr b
	srl a
	rr b
	ld [hli], a
	or b
	jr nz, .enemy_ok
	ld b, $1

.enemy_ok
	ld [hl], b
	ret
; 3ec76

ApplyBrnEffectOnAttack: ; 3ec76
	ld a, [hBattleTurn]
	and a
	jr z, .enemy
	ld a, [BattleMonStatus]
	and 1 << BRN
	ret z
	ld hl, BattleMonAttack + 1
	ld a, [hld]
	ld b, a
	ld a, [hl]
	srl a
	rr b
	ld [hli], a
	or b
	jr nz, .player_ok
	ld b, $1

.player_ok
	ld [hl], b
	ret

.enemy
	ld a, [EnemyMonStatus]
	and 1 << BRN
	ret z
	ld hl, EnemyMonAttack + 1
	ld a, [hld]
	ld b, a
	ld a, [hl]
	srl a
	rr b
	ld [hli], a
	or b
	jr nz, .enemy_ok
	ld b, $1

.enemy_ok
	ld [hl], b
	ret
; 3ecab

ApplyStatLevelMultiplierOnAllStats: ; 3ecab
; Apply StatLevelMultipliers on all 5 Stats
	ld c, 0
.stat_loop
	call ApplyStatLevelMultiplier
	inc c
	ld a, c
	cp 5
	jr nz, .stat_loop
	ret
; 3ecb7

ApplyStatLevelMultiplier: ; 3ecb7
	push bc
	push bc
	ld a, [wd265]
	and a
	ld a, c
	ld hl, BattleMonAttack
	ld de, PlayerStats
	ld bc, PlayerAtkLevel
	jr z, .got_pointers
	ld hl, EnemyMonAttack
	ld de, EnemyStats
	ld bc, EnemyAtkLevel

.got_pointers
	add c
	ld c, a
	jr nc, .okay
	inc b
.okay
	ld a, [bc]
	pop bc
	ld b, a
	push bc
	sla c
	ld b, 0
	add hl, bc
	ld a, c
	add e
	ld e, a
	jr nc, .okay2
	inc d
.okay2
	pop bc
	push hl
	ld hl, .StatLevelMultipliers
	dec b
	sla b
	ld c, b
	ld b, 0
	add hl, bc
	xor a
	ld [hMultiplicand + 0], a
	ld a, [de]
	ld [hMultiplicand + 1], a
	inc de
	ld a, [de]
	ld [hMultiplicand + 2], a
	ld a, [hli]
	ld [hMultiplier], a
	call Multiply
	ld a, [hl]
	ld [hDivisor], a
	ld b, $4
	call Divide
	pop hl

; Cap at 999.
	ld a, [hQuotient + 2]
	sub 999 % $100
	ld a, [hQuotient + 1]
	sbc 999 / $100
	jp c, .okay3

	ld a, 999 / $100
	ld [hQuotient + 1], a
	ld a, 999 % $100
	ld [hQuotient + 2], a

.okay3
	ld a, [hQuotient + 1]
	ld [hli], a
	ld b, a
	ld a, [hQuotient + 2]
	ld [hl], a
	or b
	jr nz, .okay4
	inc [hl]

.okay4
	pop bc
	ret
; 3ed2b

.StatLevelMultipliers
;	      /
	db 25, 100 ; 25%
	db 28, 100 ; 28%
	db 33, 100 ; 33%
	db 40, 100 ; 40%
	db 50, 100 ; 50%
	db 66, 100 ; 66%

	db  1,  1 ; 100%

	db 15, 10 ; 150%
	db  2,  1 ; 200%
	db 25, 10 ; 250%
	db  3,  1 ; 300%
	db 35, 10 ; 350%
	db  4,  1 ; 400%
; 3ed45


BadgeStatBoosts: ; 3ed45
; Raise BattleMon stats depending on which badges have been obtained.

; Every other badge boosts a stat, starting from the first.

; 	ZephyrBadge:  Attack
; 	PlainBadge:   Speed
; 	MineralBadge: Defense
; 	GlacierBadge: Special Attack
; 	RisingBadge:  Special Defense

; The boosted stats are in order, except PlainBadge and MineralBadge's boosts are swapped.

	ld a, [wLinkMode]
	and a
	ret nz

	ld a, [InBattleTowerBattle]
	and a
	ret nz

	ld a, [JohtoBadges]

; Swap badges 3 (PlainBadge) and 5 (MineralBadge).
	ld d, a
	and (1 << PLAINBADGE)
rept 2
	add a
endr
	ld b, a
	ld a, d
	and (1 << MINERALBADGE)
	rrca
	rrca
	ld c, a
	ld a, d
	and ((1 << ZEPHYRBADGE) | (1 << HIVEBADGE) | (1 << FOGBADGE) | (1 << STORMBADGE) | (1 << GLACIERBADGE) | (1 << RISINGBADGE))
	or b
	or c
	ld b, a

	ld hl, BattleMonAttack
	ld c, 4
.CheckBadge
	ld a, b
	srl b
	call c, BoostStat
rept 2
	inc hl
endr
; Check every other badge.
	srl b
	dec c
	jr nz, .CheckBadge
; And the last one (RisingBadge) too.
	srl a
	call c, BoostStat
	ret
; 3ed7c


BoostStat: ; 3ed7c
; Raise stat at hl by 1/8.

	ld a, [hli]
	ld d, a
	ld e, [hl]
	srl d
	rr e
	srl d
	rr e
	srl d
	rr e
	ld a, [hl]
	add e
	ld [hld], a
	ld a, [hl]
	adc d
	ld [hli], a

; Cap at 999.
	ld a, [hld]
	sub 999 % $100
	ld a, [hl]
	sbc 999 / $100
	ret c
	ld a, 999 / $100
	ld [hli], a
	ld a, 999 % $100
	ld [hld], a
	ret
; 3ed9f


_LoadBattleFontsHPBar: ; 3ed9f
	callab LoadBattleFontsHPBar
	ret
; 3eda6

_LoadHPBar: ; 3eda6
	callab LoadHPBar
	ret
; 3edad


LoadHPExpBarGFX: ; unreferenced
	ld de, EnemyHPBarBorderGFX
	ld hl, VTiles2 tile $6c
	lb bc, BANK(EnemyHPBarBorderGFX), 4
	call Get1bpp
	ld de, HPExpBarBorderGFX
	ld hl, VTiles2 tile $73
	lb bc, BANK(HPExpBarBorderGFX), 6
	call Get1bpp
	ld de, ExpBarGFX
	ld hl, VTiles2 tile $55
	lb bc, BANK(ExpBarGFX), 8
	jp Get2bpp
; 3edd1


EmptyBattleTextBox: ; 3edd1
	ld hl, .empty
	jp BattleTextBox
.empty
	db "@"
; 3edd8


_BattleRandom:: ; 3edd8
; If the normal RNG is used in a link battle it'll desync.
; To circumvent this a shared PRNG is used instead.

; But if we're in a non-link battle we're safe to use it
	ld a, [wLinkMode]
	and a
	jp z, Random

; The PRNG operates in streams of 10 values.

; Which value are we trying to pull?
	push hl
	push bc
	ld a, [LinkBattleRNCount]
	ld c, a
	ld b, 0
	ld hl, LinkBattleRNs
	add hl, bc
	inc a
	ld [LinkBattleRNCount], a

; If we haven't hit the end yet, we're good
	cp 10 - 1 ; Exclude last value. See the closing comment
	ld a, [hl]
	pop bc
	pop hl
	ret c

; If we have, we have to generate new pseudorandom data
; Instead of having multiple PRNGs, ten seeds are used
	push hl
	push bc
	push af

; Reset count to 0
	xor a
	ld [LinkBattleRNCount], a
	ld hl, LinkBattleRNs
	ld b, 10 ; number of seeds

; Generate next number in the sequence for each seed
; The algorithm takes the form *5 + 1 % 256
.loop
	; get last #
	ld a, [hl]

	; a * 5 + 1
	ld c, a
rept 2
	add a
endr
	add c
	inc a

	; update #
	ld [hli], a
	dec b
	jr nz, .loop

; This has the side effect of pulling the last value first,
; then wrapping around. As a result, when we check to see if
; we've reached the end, we check the one before it.

	pop af
	pop bc
	pop hl
	ret
; 3ee0f


Call_PlayBattleAnim_OnlyIfVisible: ; 3ee0f
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret nz
; 3ee17

Call_PlayBattleAnim: ; 3ee17
	ld a, e
	ld [FXAnimIDLo], a
	ld a, d
	ld [FXAnimIDHi], a
	call WaitBGMap
	predef_jump PlayBattleAnim
; 3ee27

FinishBattleAnim: ; 3ee27
	push af
	push bc
	push de
	push hl
	ld b, $1
	call GetSGBLayout
	call SetPalettes
	call DelayFrame
	pop hl
	pop de
	pop bc
	pop af
	ret
; 3ee3b


GiveExperiencePoints: ; 3ee3b
; Give experience.
; Don't give experience if linked or in the Battle Tower.
	ld a, [wLinkMode]
	and a
	ret nz

	ld a, [InBattleTowerBattle]
	bit 0, a
	ret nz

	call Function3f0d4
	xor a
	ld [CurPartyMon], a
	ld bc, PartyMon1Species

.loop
	ld hl, MON_HP
	add hl, bc
	ld a, [hli]
	or [hl]
	jp z, .skip_stats ; fainted

	push bc
	ld hl, wBattleParticipantsNotFainted
	ld a, [CurPartyMon]
	ld c, a
	ld b, CHECK_FLAG
	ld d, $0
	predef FlagPredef
	ld a, c
	and a
	pop bc
	jp z, .skip_stats
	ld hl, MON_STAT_EXP + 1
	add hl, bc
	ld d, h
	ld e, l
	ld hl, EnemyMonBaseStats - 1
	push bc
	ld c, $5
.loop1
	inc hl
	ld a, [de]
	add [hl]
	ld [de], a
	jr nc, .okay1
	dec de
	ld a, [de]
	inc a
	jr z, .next
	ld [de], a
	inc de

.okay1
	push hl
	push bc
	ld a, MON_PKRUS
	call GetPartyParamLocation
	ld a, [hl]
	and a
	pop bc
	pop hl
	jr z, .skip
	ld a, [de]
	add [hl]
	ld [de], a
	jr nc, .skip
	dec de
	ld a, [de]
	inc a
	jr z, .next
	ld [de], a
	inc de
	jr .skip

.next
	ld a, $ff
	ld [de], a
	inc de
	ld [de], a

.skip
rept 2
	inc de
endr
	dec c
	jr nz, .loop1
	xor a
	ld [hMultiplicand + 0], a
	ld [hMultiplicand + 1], a
	ld a, [EnemyMonBaseExp]
	ld [hMultiplicand + 2], a
	ld a, [EnemyMonLevel]
	ld [hMultiplier], a
	call Multiply
	ld a, 7
	ld [hDivisor], a
	ld b, 4
	call Divide
	pop bc
	ld hl, MON_ID
	add hl, bc
	ld a, [PlayerID]
	cp [hl]
	jr nz, .boosted
	inc hl
	ld a, [PlayerID + 1]
	cp [hl]
	ld a, $0
	jr z, .no_boost

.boosted
	call BoostExp
	ld a, $1

.no_boost
	ld [StringBuffer2 + 2], a
	ld a, [wBattleMode]
	dec a
	call nz, BoostExp
	push bc
	ld a, MON_ITEM
	call GetPartyParamLocation
	ld a, [hl]
	cp LUCKY_EGG
	call z, BoostExp
	ld a, [hQuotient + 2]
	ld [StringBuffer2 + 1], a
	ld a, [hQuotient + 1]
	ld [StringBuffer2], a
	ld a, [CurPartyMon]
	ld hl, PartyMonNicknames
	call GetNick
	ld hl, Text_PkmnGainedExpPoint
	call BattleTextBox
	ld a, [StringBuffer2 + 1]
	ld [hQuotient + 2], a
	ld a, [StringBuffer2]
	ld [hQuotient + 1], a
	pop bc
	call Function3f136
	push bc
	call LoadTileMapToTempTileMap
	pop bc
	ld hl, MON_EXP + 2
	add hl, bc
	ld d, [hl]
	ld a, [hQuotient + 2]
	add d
	ld [hld], a
	ld d, [hl]
	ld a, [hQuotient + 1]
	adc d
	ld [hl], a
	jr nc, .skip2
	dec hl
	inc [hl]
	jr nz, .skip2
	ld a, $ff
rept 2
	ld [hli], a
endr
	ld [hl], a

.skip2
	ld a, [CurPartyMon]
	ld e, a
	ld d, $0
	ld hl, PartySpecies
	add hl, de
	ld a, [hl]
	ld [CurSpecies], a
	call GetBaseData
	push bc
	ld d, MAX_LEVEL
	callab CalcExpAtLevel
	pop bc
	ld hl, MON_EXP + 2
	add hl, bc
	push bc
	ld a, [hQuotient]
	ld b, a
	ld a, [hQuotient + 1]
	ld c, a
	ld a, [hQuotient + 2]
	ld d, a
	ld a, [hld]
	sub d
	ld a, [hld]
	sbc c
	ld a, [hl]
	sbc b
	jr c, .max_exp
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, d
	ld [hld], a

.max_exp
	xor a ; PARTYMON
	ld [MonType], a
	predef CopyPkmnToTempMon
	callab CalcLevel
	pop bc
	ld hl, MON_LEVEL
	add hl, bc
	ld a, [hl]
	cp MAX_LEVEL
	jp nc, .skip_stats
	cp d
	jp z, .skip_stats
; <NICKNAME> grew to level ##!
	ld [wc719], a
	ld a, [CurPartyLevel]
	push af
	ld a, d
	ld [CurPartyLevel], a
	ld [hl], a
	ld hl, MON_SPECIES
	add hl, bc
	ld a, [hl]
	ld [CurSpecies], a
	ld [wd265], a
	call GetBaseData
	ld hl, MON_MAXHP + 1
	add hl, bc
	ld a, [hld]
	ld e, a
	ld d, [hl]
	push de
	ld hl, MON_MAXHP
	add hl, bc
	ld d, h
	ld e, l
	ld hl, MON_EXP + 2
	add hl, bc
	push bc
	ld b, $1
	predef CalcPkmnStats
	pop bc
	pop de
	ld hl, MON_MAXHP + 1
	add hl, bc
	ld a, [hld]
	sub e
	ld e, a
	ld a, [hl]
	sbc d
	ld d, a
	dec hl
	ld a, [hl]
	add e
	ld [hld], a
	ld a, [hl]
	adc d
	ld [hl], a
	ld a, [CurBattleMon]
	ld d, a
	ld a, [CurPartyMon]
	cp d
	jr nz, .skip_animation
	ld de, BattleMonHP
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld de, BattleMonMaxHP
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH - MON_MAXHP
	call CopyBytes
	pop bc
	ld hl, MON_LEVEL
	add hl, bc
	ld a, [hl]
	ld [BattleMonLevel], a
	ld a, [PlayerSubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	jr nz, .transformed
	ld hl, MON_ATK
	add hl, bc
	ld de, PlayerStats
	ld bc, PARTYMON_STRUCT_LENGTH - MON_ATK
	call CopyBytes

.transformed
	xor a
	ld [wd265], a
	call ApplyStatLevelMultiplierOnAllStats
	callab ApplyStatusEffectOnPlayerStats
	callab BadgeStatBoosts
	callab UpdatePlayerHUD
	call EmptyBattleTextBox
	call LoadTileMapToTempTileMap
	ld a, $1
	ld [hBGMapMode], a

.skip_animation
	callba LevelUpHappinessMod
	ld a, [CurBattleMon]
	ld b, a
	ld a, [CurPartyMon]
	cp b
	jr z, .skip_animation2
	ld de, SFX_HIT_END_OF_EXP_BAR
	call PlaySFX
	call WaitSFX
	ld hl, BattleText_StringBuffer1GrewToLevel
	call StdBattleTextBox
	call LoadTileMapToTempTileMap

.skip_animation2
	xor a ; PARTYMON
	ld [MonType], a
	predef CopyPkmnToTempMon
	hlcoord 9, 0
	ld b, $a
	ld c, $9
	call TextBox
	hlcoord 11, 1
	ld bc, $0004
	predef PrintTempMonStats
	ld c, $1e
	call DelayFrames
	call WaitPressAorB_BlinkCursor
	call Call_LoadTempTileMapToTileMap
	xor a ; PARTYMON
	ld [MonType], a
	ld a, [CurSpecies]
	ld [wd265], a
	ld a, [CurPartyLevel]
	push af
	ld c, a
	ld a, [wc719]
	ld b, a

.level_loop
	inc b
	ld a, b
	ld [CurPartyLevel], a
	push bc
	predef LearnLevelMoves
	pop bc
	ld a, b
	cp c
	jr nz, .level_loop
	pop af
	ld [CurPartyLevel], a
	ld hl, EvolvableFlags
	ld a, [CurPartyMon]
	ld c, a
	ld b, $1
	predef FlagPredef
	pop af
	ld [CurPartyLevel], a

.skip_stats
	ld a, [PartyCount]
	ld b, a
	ld a, [CurPartyMon]
	inc a
	cp b
	jr z, .done
	ld [CurPartyMon], a
	ld a, MON_SPECIES
	call GetPartyParamLocation
	ld b, h
	ld c, l
	jp .loop

.done
	jp ResetBattleParticipants
; 3f0d4

Function3f0d4: ; 3f0d4
	ld a, [wBattleParticipantsNotFainted]
	ld b, a
	ld c, $6
	ld d, $0
.asm_3f0dc
	xor a
	srl b
	adc d
	ld d, a
	dec c
	jr nz, .asm_3f0dc
	cp $2
	ret c
	ld [wd265], a
	ld hl, EnemyMonBaseStats
	ld c, $7
.asm_3f0ef
	xor a
	ld [hDividend + 0], a
	ld a, [hl]
	ld [hDividend + 1], a
	ld a, [wd265]
	ld [hDivisor], a
	ld b, $2
	call Divide
	ld a, [hQuotient + 2]
	ld [hli], a
	dec c
	jr nz, .asm_3f0ef
	ret
; 3f106

BoostExp: ; 3f106
; Multiply experience by 1.5x
	push bc
; load experience value
	ld a, [hProduct + 2]
	ld b, a
	ld a, [hProduct + 3]
	ld c, a
; halve it
	srl b
	rr c
; add it back to the whole exp value
	add c
	ld [hProduct + 3], a
	ld a, [hProduct + 2]
	adc b
	ld [hProduct + 2], a
	pop bc
	ret
; 3f11b

Text_PkmnGainedExpPoint: ; 3f11b
	text_jump Text_Gained
	start_asm
	ld hl, TextJump_StringBuffer2ExpPoints
	ld a, [StringBuffer2 + 2] ; IsTradedMon
	and a
	ret z

	ld hl, TextJump_ABoostedStringBuffer2ExpPoints
	ret
; 3f12c

TextJump_ABoostedStringBuffer2ExpPoints: ; 3f12c
	text_jump Text_ABoostedStringBuffer2ExpPoints
	db "@"
; 3f131

TextJump_StringBuffer2ExpPoints: ; 3f131
	text_jump Text_StringBuffer2ExpPoints
	db "@"
; 3f136


Function3f136: ; 3f136
	push bc

	ld hl, CurPartyMon
	ld a, [CurBattleMon]
	cp [hl]
	jp nz, .finish

	ld a, [BattleMonLevel]
	cp MAX_LEVEL
	jp nc, .finish

	ld a, [hProduct + 3]
	ld [wd004], a
	push af
	ld a, [hProduct + 2]
	ld [wd003], a
	push af
	xor a
	ld [wd002], a
	xor a ; PARTYMON
	ld [MonType], a
	predef CopyPkmnToTempMon
	ld a, [TempMonLevel]
	ld b, a
	ld e, a
	push de
	ld de, TempMonExp + 2
	call CalcExpBar
	push bc
	ld hl, TempMonExp + 2
	ld a, [wd004]
	add [hl]
	ld [hld], a
	ld a, [wd003]
	adc [hl]
	ld [hld], a
	jr nc, .asm_3f186
	inc [hl]
	jr nz, .asm_3f186
	ld a, $ff
rept 2
	ld [hli], a
endr
	ld [hl], a

.asm_3f186
	ld d, MAX_LEVEL
	callab CalcExpAtLevel
	ld a, [hProduct + 1]
	ld b, a
	ld a, [hProduct + 2]
	ld c, a
	ld a, [hProduct + 3]
	ld d, a
	ld hl, TempMonExp + 2
	ld a, [hld]
	sub d
	ld a, [hld]
	sbc c
	ld a, [hl]
	sbc b
	jr c, .asm_3f1a8
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, d
	ld [hld], a

.asm_3f1a8
	callab CalcLevel
	ld a, d
	pop bc
	pop de
	ld d, a
	cp e
	jr nc, .asm_3f1b7
	ld a, e
	ld d, a

.asm_3f1b7
	ld a, e
	cp MAX_LEVEL
	jr nc, .asm_3f1ff
	cp d
	jr z, .asm_3f1ff
	inc a
	ld [TempMonLevel], a
	ld [CurPartyLevel], a
	ld [BattleMonLevel], a
	push de
	call Function3f21b
	ld c, $40
	call Function3f22c
	call PrintPlayerHUD
	ld hl, BattleMonNick
	ld de, StringBuffer1
	ld bc, $000b
	call CopyBytes
	call Function3dfe
	ld de, SFX_HIT_END_OF_EXP_BAR
	call PlaySFX
	callba Function8e79d
	call WaitSFX
	ld hl, BattleText_StringBuffer1GrewToLevel
	call StdBattleTextBox
	pop de
	inc e
	ld b, $0
	jr .asm_3f1b7

.asm_3f1ff
	push bc
	ld b, d
	ld de, TempMonExp + 2
	call CalcExpBar
	ld a, b
	pop bc
	ld c, a
	call Function3f21b
	call Function3f22c
	call Function3dfe
	pop af
	ld [hProduct + 2], a
	pop af
	ld [hProduct + 3], a

.finish
	pop bc
	ret
; 3f21b

Function3f21b: ; 3f21b
	push bc
	call WaitSFX
	ld de, SFX_EXP_BAR
	call PlaySFX
	ld c, 10
	call DelayFrames
	pop bc
	ret
; 3f22c

Function3f22c: ; 3f22c
	ld d, $3
	dec b
.asm_3f22f
	inc b
	push bc
	push de
	hlcoord 17, 11
	call PlaceExpBar
	pop de
	ld a, $1
	ld [hBGMapMode], a
	ld c, d
	call DelayFrames
	xor a
	ld [hBGMapMode], a
	pop bc
	ld a, c
	cp b
	jr z, .asm_3f268
	inc b
	push bc
	push de
	hlcoord 17, 11
	call PlaceExpBar
	pop de
	ld a, $1
	ld [hBGMapMode], a
	ld c, d
	call DelayFrames
	xor a
	ld [hBGMapMode], a
	dec d
	jr nz, .asm_3f263
	ld d, $1

.asm_3f263
	pop bc
	ld a, c
	cp b
	jr nz, .asm_3f22f

.asm_3f268
	ld a, $1
	ld [hBGMapMode], a
	ret



SendOutPkmnText: ; 3f26d
	ld a, [wLinkMode]
	and a
	jr z, .not_linked

	ld hl, JumpText_GoPkmn ; If we're in a LinkBattle print just "Go <PlayerMon>"

	ld a, [wd264] ; unless this (unidentified) variable is set
	and a
	jr nz, .skip_to_textbox

.not_linked
; Depending on the HP of the enemy Pkmn, the game prints a different text
	ld hl, EnemyMonHP
	ld a, [hli]
	or [hl]
	ld hl, JumpText_GoPkmn
	jr z, .skip_to_textbox

	; compute enemy helth remaining as a percentage
	xor a
	ld [hMultiplicand + 0], a
	ld hl, EnemyMonHP
	ld a, [hli]
	ld [wEnemyHPAtTimeOfPlayerSwitch], a
	ld [hMultiplicand + 1], a
	ld a, [hl]
	ld [wEnemyHPAtTimeOfPlayerSwitch + 1], a
	ld [hMultiplicand + 2], a
	ld a, 25
	ld [hMultiplier], a
	call Multiply
	ld hl, EnemyMonMaxHP
	ld a, [hli]
	ld b, [hl]
	srl a
	rr b
	srl a
	rr b
	ld a, b
	ld b, 4
	ld [hDivisor], a
	call Divide

	ld a, [hQuotient + 2]
	ld hl, JumpText_GoPkmn
	cp 70
	jr nc, .skip_to_textbox

	ld hl, JumpText_DoItPkmn
	cp 40
	jr nc, .skip_to_textbox

	ld hl, JumpText_GoForItPkmn
	cp 10
	jr nc, .skip_to_textbox

	ld hl, JumpText_YourFoesWeakGetmPkmn
.skip_to_textbox
	jp BattleTextBox
; 3f2d1


JumpText_GoPkmn: ; 3f2d1
	text_jump Text_GoPkmn
	start_asm
	jr Function_TextJump_BattleMonNick01
; 3f2d6

JumpText_DoItPkmn: ; 3f2d8
	text_jump Text_DoItPkmn
	start_asm
	jr Function_TextJump_BattleMonNick01
; 3f2dd

JumpText_GoForItPkmn: ; 3f2df
	text_jump Text_GoForItPkmn
	start_asm
	jr Function_TextJump_BattleMonNick01
; 3f2e4

JumpText_YourFoesWeakGetmPkmn: ; 3f2e6
	text_jump Text_YourFoesWeakGetmPkmn
	start_asm
; 3f2eb

Function_TextJump_BattleMonNick01: ; 3f2eb
	ld hl, TextJump_BattleMonNick01
	ret
; 3f2ef

TextJump_BattleMonNick01: ; 3f2ef
	text_jump Text_BattleMonNick01
	db "@"
; 3f2f4


BattleMonNickComma_TextBox: ; 3f2f4
	ld hl, TextJump_BattleMonNickComma
	jp BattleTextBox
; 3f2fa

TextJump_BattleMonNickComma: ; 3f2fa
	text_jump Text_BattleMonNickComma
	start_asm
; 3f2ff

WithdrawPkmnText: ; 3f2ff
; Print text to withdraw Pkmn
; depending on HP the message is different
	push de
	push bc
	ld hl, EnemyMonHP + 1
	ld de, wEnemyHPAtTimeOfPlayerSwitch + 1
	ld b, [hl]
	dec hl
	ld a, [de]
	sub b
	ld [hMultiplicand + 2], a
	dec de
	ld b, [hl]
	ld a, [de]
	sbc b
	ld [hMultiplicand + 1], a
	ld a, 25
	ld [hMultiplier], a
	call Multiply
	ld hl, EnemyMonMaxHP
	ld a, [hli]
	ld b, [hl]
	srl a
	rr b
	srl a
	rr b
	ld a, b
	ld b, 4
	ld [hDivisor], a
	call Divide
	pop bc
	pop de
	ld a, [hQuotient + 2]
	ld hl, TextJump_ThatsEnoughComeBack
	and a
	ret z

	ld hl, TextJump_ComeBack
	cp 30
	ret c

	ld hl, TextJump_OKComeBack
	cp 70
	ret c

	ld hl, TextJump_GoodComeBack
	ret
; 3f348

TextJump_ThatsEnoughComeBack: ; 3f348
	text_jump Text_ThatsEnoughComeBack
	db "@"
; 3f34d

TextJump_OKComeBack: ; 3f34d
	text_jump Text_OKComeBack
	db "@"
; 3f352

TextJump_GoodComeBack: ; 3f352
	text_jump Text_GoodComeBack
	db "@"
; 3f357

Function_TextJump_ComeBack: ; 3f357
; this function doesn't seem to be used
	ld hl, TextJump_ComeBack
	ret
; 3f35b

TextJump_ComeBack: ; 3f35b
	text_jump Text_ComeBack
	db "@"
; 3f360


HandleSafariAngerEatingStatus: ; unreferenced
	ld hl, wSafariMonEating
	ld a, [hl]
	and a
	jr z, .angry
	dec [hl]
	ld hl, BattleText_WildPkmnIsEating
	jr .finish

.angry
	dec hl ; wSafariMonAngerCount
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ld hl, BattleText_WildPkmnIsAngry
	jr nz, .finish
	push hl
	ld a, [EnemyMonSpecies]
	ld [CurSpecies], a
	call GetBaseData
	ld a, [BaseCatchRate]
	ld [EnemyMonCatchRate], a
	pop hl

.finish
	push hl
	call Call_LoadTempTileMapToTileMap
	pop hl
	jp StdBattleTextBox
; 3f390


FillInExpBar: ; 3f390
	push hl
	call CalcExpBar
	pop hl
	ld de, 7
	add hl, de
	jp PlaceExpBar
; 3f39c

CalcExpBar: ; 3f39c
; Calculate the percent exp between this level and the next
; Level in b
	push de
	ld d, b
	push de
	callab CalcExpAtLevel
	pop de
; exp at current level gets pushed to the stack
	ld hl, hMultiplicand
	ld a, [hli]
	push af
	ld a, [hli]
	push af
	ld a, [hl]
	push af
; next level
	inc d
	callab CalcExpAtLevel
; back up the next level exp, and subtract the two levels
	ld hl, hMultiplicand + 2
	ld a, [hl]
	ld [hMathBuffer + 2], a
	pop bc
	sub b
	ld [hld], a
	ld a, [hl]
	ld [hMathBuffer + 1], a
	pop bc
	sbc b
	ld [hld], a
	ld a, [hl]
	ld [hMathBuffer], a
	pop bc
	sbc b
	ld [hl], a
	pop de

	ld hl, hMultiplicand + 1
	ld a, [hli]
	push af
	ld a, [hl]
	push af

; get the amount of exp remaining to the next level
	ld a, [de]
	dec de
	ld c, a
	ld a, [hMathBuffer + 2]
	sub c
	ld [hld], a
	ld a, [de]
	dec de
	ld b, a
	ld a, [hMathBuffer + 1]
	sbc b
	ld [hld], a
	ld a, [de]
	ld c, a
	ld a, [hMathBuffer]
	sbc c
	ld [hld], a
	xor a
	ld [hl], a
; multiply by 64
	ld a, $40
	ld [hMultiplier], a
	call Multiply
	pop af
	ld c, a
	pop af
	ld b, a
.loop
	ld a, b
	and a
	jr z, .done
	srl b
	rr c
	ld hl, hProduct
	srl [hl]
	inc hl
	rr [hl]
	inc hl
	rr [hl]
	inc hl
	rr [hl]
	jr .loop

.done
	ld a, c
	ld [hDivisor], a
	ld b, 4
	call Divide
	ld a, [hQuotient + 2]
	ld b, a
	ld a, $40
	sub b
	ld b, a
	ret
; 3f41c

PlaceExpBar: ; 3f41c
	ld c, $8 ; number of tiles
.loop1
	ld a, b
	sub $8
	jr c, .next
	ld b, a
	ld a, $6a ; full bar
	ld [hld], a
	dec c
	jr z, .finish
	jr .loop1

.next
	add $8
	jr z, .loop2
	add $54 ; tile to the left of small exp bar tile
	jr .skip

.loop2
	ld a, $62 ; empty bar

.skip
	ld [hld], a
	ld a, $62 ; empty bar
	dec c
	jr nz, .loop2

.finish
	ret
; 3f43d

GetMonBackpic: ; 3f43d
	ld a, [PlayerSubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	ld hl, BattleAnimCmd_RaiseSub
	jr nz, GetBackpic_DoAnim ; substitute

Function3f447: ; 3f447
	ld a, [wPlayerMinimized]
	and a
	ld hl, BattleAnimCmd_MinimizeOpp
	jr nz, GetBackpic_DoAnim
	ld a, [CurPartySpecies]
	push af
	ld a, [BattleMonSpecies]
	ld [CurPartySpecies], a
	ld hl, BattleMonDVs
	predef GetUnownLetter
	ld de, VTiles2 tile $31
	predef GetBackpic
	pop af
	ld [CurPartySpecies], a
	ret
; 3f46f

GetBackpic_DoAnim: ; 3f46f
	ld a, [hBattleTurn]
	push af
	xor a
	ld [hBattleTurn], a
	ld a, BANK(BattleAnimCommands)
	rst FarCall
	pop af
	ld [hBattleTurn], a
	ret
; 3f47c

GetMonFrontpic: ; 3f47c
	ld a, [EnemySubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	ld hl, BattleAnimCmd_RaiseSub
	jr nz, GetFrontpic_DoAnim

Function3f486: ; 3f486
	ld a, [wEnemyMinimized]
	and a
	ld hl, BattleAnimCmd_MinimizeOpp
	jr nz, GetFrontpic_DoAnim

	ld a, [CurPartySpecies]
	push af
	ld a, [EnemyMonSpecies]
	ld [CurSpecies], a
	ld [CurPartySpecies], a
	call GetBaseData
	ld hl, EnemyMonDVs
	predef GetUnownLetter
	ld de, VTiles2
	predef Function5108b
	pop af
	ld [CurPartySpecies], a
	ret
; 3f4b4

GetFrontpic_DoAnim: ; 3f4b4
	ld a, [hBattleTurn]
	push af
	call SetEnemyTurn
	ld a, BANK(BattleAnimCommands)
	rst FarCall
	pop af
	ld [hBattleTurn], a
	ret
; 3f4c1


StartBattle: ; 3f4c1
; This check prevents you from entering a battle without any Pokemon.
; Those using walk-through-walls to bypass getting a Pokemon experience
; the effects of this check.
	ld a, [PartyCount]
	and a
	ret z

	ld a, [TimeOfDayPal]
	push af
	call BattleIntro
	call SendOutFirstMons
	call ExitBattle
	pop af
	ld [TimeOfDayPal], a
	scf
	ret
; 3f4d9


_SendOutFirstMons: ; 3f4d9
; unreferenced
	call SendOutFirstMons
	ret
; 3f4dd


BattleIntro: ; 3f4dd
	callba MobileFn_106050 ; mobile
	call LoadTrainerOrWildMonPic
	xor a
	ld [TempBattleMonSpecies], a
	ld [wd0d2], a
	xor a
	ld [hMapAnims], a
	callba PlayBattleMusic
	callba ShowLinkBattleParticipants
	callba FindFirstAliveMon
	call DisableSpriteUpdates
	callba ClearBattleRAM
	call InitEnemy
	call BackUpVBGMap2
	ld b, $0
	call GetSGBLayout
	ld hl, rLCDC
	res 6, [hl]
	call InitBattleDisplay
	call BattleStartMessage
	ld hl, rLCDC
	set 6, [hl]
	xor a
	ld [hBGMapMode], a
	call EmptyBattleTextBox
	hlcoord 9, 7
	lb bc, 5, 11
	call ClearBox
	hlcoord 1, 0
	lb bc, 4, 10
	call ClearBox
	call ClearSprites
	ld a, [wBattleMode]
	cp $1
	call z, UpdateEnemyHUD
	ld a, $1
	ld [hBGMapMode], a
	ret
; 3f54e

LoadTrainerOrWildMonPic: ; 3f54e
	ld a, [OtherTrainerClass]
	and a
	jr nz, .Trainer
	ld a, [TempWildMonSpecies]
	ld [CurPartySpecies], a

.Trainer
	ld [TempEnemyMonSpecies], a
	ret
; 3f55e

InitEnemy: ; 3f55e
	ld a, [OtherTrainerClass]
	and a
	jp nz, InitEnemyTrainer ; trainer
	jp InitEnemyWildmon ; wild
; 3f568

BackUpVBGMap2: ; 3f568
	ld a, [rSVBK]
	push af
	ld a, $6 ; BANK(w6_d000)
	ld [rSVBK], a
	ld hl, w6_d000
	ld bc, $40 tiles ; VBGMap3 - VBGMap2
	ld a, $2
	call ByteFill
	ld a, [rVBK]
	push af
	ld a, $1
	ld [rVBK], a
	ld de, w6_d000
	ld hl, VBGMap0 ; VBGMap2
	lb bc, BANK(BackUpVBGMap2), $40
	call Request2bpp
	pop af
	ld [rVBK], a
	pop af
	ld [rSVBK], a
	ret
; 3f594

InitEnemyTrainer: ; 3f594
	ld [TrainerClass], a
	callba MobileFn_10606a
	xor a
	ld [TempEnemyMonSpecies], a
	callab Function3957b
	callab ReadTrainerParty

	ld a, [TrainerClass]
	cp RIVAL1
	jr nz, .ok
	xor a
	ld [OTPartyMon1Item], a
.ok

	ld de, VTiles2
	callab GetTrainerPic
	xor a
	ld [hFillBox], a
	dec a
	ld [wc6e6], a
	hlcoord 12, 0
	lb bc, 7, 7
	predef FillBox
	ld a, -1
	ld [CurOTMon], a
	ld a, TRAINER_BATTLE
	ld [wBattleMode], a

	call IsJohtoGymLeader
	jr nc, .done
	xor a
	ld [CurPartyMon], a
	ld a, [PartyCount]
	ld b, a
.partyloop
	push bc
	ld a, MON_HP
	call GetPartyParamLocation
	ld a, [hli]
	or [hl]
	jr z, .skipfaintedmon
	ld c, HAPPINESS_GYMBATTLE
	callab ChangeHappiness
.skipfaintedmon
	pop bc
	dec b
	jr z, .done
	ld hl, CurPartyMon
	inc [hl]
	jr .partyloop
.done
	ret
; 3f607

InitEnemyWildmon: ; 3f607
	ld a, $1
	ld [wBattleMode], a
	callba MobileFn_10605d
	call LoadEnemyMon
	ld hl, EnemyMonMoves
	ld de, wc735
	ld bc, NUM_MOVES
	call CopyBytes
	ld hl, EnemyMonPP
	ld de, wc739
	ld bc, NUM_MOVES
	call CopyBytes
	ld hl, EnemyMonDVs
	predef GetUnownLetter
	ld a, [CurPartySpecies]
	cp UNOWN
	jr nz, .skip_unown
	ld a, [wdef4]
	and a
	jr nz, .skip_unown
	ld a, [UnownLetter]
	ld [wdef4], a
.skip_unown
	ld de, VTiles2
	predef Function5108b
	xor a
	ld [TrainerClass], a
	ld [hFillBox], a
	hlcoord 12, 0
	lb bc, 7, 7
	predef FillBox
	ret
; 3f662

Function3f662: ; 3f662
	ld hl, EnemyMonMoves
	ld de, wListMoves_MoveIndicesBuffer
	ld b, NUM_MOVES
.loop
	ld a, [de]
	inc de
	ld [hli], a
	and a
	jr z, .clearpp

	push bc
	push hl

	push hl
	dec a
	ld hl, Moves + MOVE_PP
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	pop hl

	ld bc, EnemyMonPP - (EnemyMonMoves + 1)
	add hl, bc
	ld [hl], a

	pop hl
	pop bc

	dec b
	jr nz, .loop
	ret

.clear
	xor a
	ld [hli], a

.clearpp
	push bc
	push hl
	ld bc, EnemyMonPP - (EnemyMonMoves + 1)
	add hl, bc
	xor a
	ld [hl], a
	pop hl
	pop bc
	dec b
	jr nz, .clear
	ret
; 3f69e


ExitBattle: ; 3f69e
	call Function3f6a5
	call CleanUpBattleRAM
	ret
; 3f6a5

Function3f6a5: ; 3f6a5
	ld a, [wLinkMode]
	and a
	jr z, .not_linked
	call ShowLinkBattleParticipantsAfterEnd
	ld c, 150
	call DelayFrames
	call Function3f77c
	ret

.not_linked
	ld a, [wBattleResult]
	and $f
	ret nz
	call CheckPayDay
	xor a
	ld [wd1e9], a
	predef Function421e6
	callba Function2ed44
	ret
; 3f6d0

CleanUpBattleRAM: ; 3f6d0
	call Function3f998
	xor a
	ld [Danger], a
	ld [wBattleMode], a
	ld [BattleType], a
	ld [AttackMissed], a
	ld [TempWildMonSpecies], a
	ld [OtherTrainerClass], a
	ld [wd266], a
	ld [wd267], a
	ld [wForcedSwitch], a
	ld [wd0d8], a
	ld [wKeyItemsPocketCursor], a
	ld [wItemsPocketCursor], a
	ld [wd0d2], a
	ld [CurMoveNum], a
	ld [wBallsPocketCursor], a
	ld [wd0d6], a
	ld [wd0e4], a
	ld [wd0e0], a
	ld [wd0df], a
	ld [wd0e1], a
	ld hl, PlayerSubStatus1
	ld b, $18
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	call WaitSFX
	ret
; 3f71d

CheckPayDay: ; 3f71d
	ld hl, wPayDayMoney
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	ret z
	ld a, [wc73d]
	and a
	jr z, .okay
	ld hl, wPayDayMoney + 2
	sla [hl]
	dec hl
	rl [hl]
	dec hl
	rl [hl]
	jr nc, .okay
	ld a, $ff
rept 2
	ld [hli], a
endr
	ld [hl], a

.okay
	ld hl, wPayDayMoney + 2
	ld de, Money + 2
	call Function3d0be
	ld hl, BattleText_PlayerPickuedUpPayDayMoney
	call StdBattleTextBox
	ld a, [InBattleTowerBattle]
	bit 0, a
	ret z
	call ClearTileMap
	call ClearBGPalettes
	ret
; 3f759

ShowLinkBattleParticipantsAfterEnd: ; 3f759
	callba MobileFn_1060df
	callba BackupMobileEventIndex
	ld a, [CurOTMon]
	ld hl, OTPartyMon1Status
	call GetPartyLocation
	ld a, [EnemyMonStatus]
	ld [hl], a
	call ClearTileMap
	callba _ShowLinkBattleParticipants
	ret
; 3f77c

Function3f77c: ; 3f77c
	callba CheckMobileBattleError
	jp c, .Mobile_InvalidBattle
	call IsMobileBattle2
	jr nz, .proceed

	ld hl, wcd2a
	bit 4, [hl]
	jr z, .proceed

	callba DetermineLinkBattleResult

.proceed
	ld a, [wBattleResult]
	and $f
	cp $1
	jr c, .victory
	jr z, .loss
	callba MobileFn_SaveBattleResult_Draw
	ld de, .Draw
	jr .store_result

.victory
	callba MobileFn_SaveBattleResult_Win
	ld de, .Win
	jr .store_result

.loss
	callba MobileFn_SaveBattleResult_Lose
	ld de, .Lose
	jr .store_result

.store_result
	hlcoord 6, 8
	call PlaceString
	callba BackupMobileEventIndex
	ld c, 200
	call DelayFrames

	ld a, BANK(sLinkBattleStats)
	call GetSRAMBank

	call Function3fa42
	call Function3f85f

	call CloseSRAM

	call IsMobileBattle2
	jr z, .mobile
	call WaitPressAorB_BlinkCursor
	call ClearTileMap
	ret

.mobile
	ld c, 200
	call DelayFrames
	call ClearTileMap
	ret
; 3f7f7

.Win
	db "YOU WIN@"
.Lose
	db "YOU LOSE@"
.Draw
	db "  DRAW@"
; 3f80f


.Mobile_InvalidBattle: ; 3f80f
	hlcoord 6, 8
	ld de, .Invalid
	call PlaceString
	ld c, 200
	call DelayFrames
	call ClearTileMap
	ret
; 3f821

.Invalid
	db "INVALID BATTLE@"
; 3f830


IsMobileBattle2: ; 3f830
	ld a, [wLinkMode]
	cp LINK_MOBILE
	ret
; 3f836


Function3f836: ; 3f836
	ld a, BANK(sLinkBattleStats)
	call GetSRAMBank

	call Function3f85f

	call CloseSRAM
	hlcoord 0, 0, AttrMap
	xor a
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	call Function3200
	ld b, $8
	call GetSGBLayout
	call SetPalettes
	ld c, $8
	call DelayFrames
	call WaitPressAorB_BlinkCursor
	ret
; 3f85f


Function3f85f: ; 3f85f
	call ClearTileMap
	call ClearSprites
	call .asm_3f8e0
	hlcoord 0, 8
	ld b, $5
	ld de, sLinkBattleStats + $8
.asm_3f870
	push bc
	push hl
	push de
	ld a, [de]
	and a
	jr z, .asm_3f8c9
	ld a, [wSavedAtLeastOnce]
	and a
	jr z, .asm_3f8c9
	push hl
	push hl
	ld h, d
	ld l, e
	ld de, wd002
	ld bc, $000a
	call CopyBytes
	ld a, $50
	ld [de], a
	inc de
	ld bc, $0006
	call CopyBytes
	ld de, wd002
	pop hl
	call PlaceString
	pop hl
	ld de, $001a
	add hl, de
	push hl
	ld de, wd00d
	lb bc, 2, 4
	call PrintNum
	pop hl
	ld de, $0005
	add hl, de
	push hl
	ld de, wd00f
	lb bc, 2, 4
	call PrintNum
	pop hl
	ld de, $0005
	add hl, de
	ld de, wd011
	lb bc, 2, 4
	call PrintNum
	jr .asm_3f8cf

.asm_3f8c9
	ld de, .Format
	call PlaceString

.asm_3f8cf
	pop hl
	ld bc, $0012
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld bc, $0028
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_3f870
	ret

.asm_3f8e0
	hlcoord 1, 0
	ld de, .Record
	call PlaceString

	hlcoord 0, 6
	ld de, .Result
	call PlaceString

	hlcoord 0, 2
	ld de, .Total
	call PlaceString

	hlcoord 6, 4
	ld de, sLinkBattleWins
	call .asm_3f92b
	jr c, .asm_3f92a

	lb bc, 2, 4
	call PrintNum

	hlcoord 11, 4
	ld de, sLinkBattleLosses
	call .asm_3f92b

	lb bc, 2, 4
	call PrintNum

	hlcoord 16, 4
	ld de, sLinkBattleDraws
	call .asm_3f92b

	lb bc, 2, 4
	call PrintNum

.asm_3f92a
	ret

.asm_3f92b
	ld a, [wSavedAtLeastOnce]
	and a
	ret nz
	ld de, .Scores
	call PlaceString
	scf
	ret
; 3f938

.Scores
	db "   0    0    0@"
; 3f947

.Format ; 3f947
	db "  ---  <LNBRK>         -    -    -@"
.Record ; 3f964
	db "<PLAYER>'s RECORD@"
.Result ; 3f96e
	db "RESULT WIN LOSE DRAW@"
.Total ; 3f983
	db "TOTAL  WIN LOSE DRAW@"
; 3f998


Function3f998: ; 3f998
	ld a, [BattleType]
	cp BATTLETYPE_ROAMING
	jr nz, .asm_3f9c4
	ld a, [wBattleResult]
	and $f
	jr z, .asm_3f9af
	call GetRoamMonHP
	ld a, [EnemyMonHP + 1]
	ld [hl], a
	jr .asm_3f9ca

.asm_3f9af
	call GetRoamMonHP
	ld [hl], $0
	call GetRoamMonMapGroup
	ld [hl], $ff
	call GetRoamMonMapNumber
	ld [hl], $ff
	call GetRoamMonSpecies
	ld [hl], $0
	ret

.asm_3f9c4
	call BattleRandom
	and $f
	ret nz

.asm_3f9ca
	callab UpdateRoamMons
	ret
; 3f9d1

GetRoamMonMapGroup: ; 3f9d1
	ld a, [TempEnemyMonSpecies]
	ld b, a
	ld a, [wRoamMon1Species]
	cp b
	ld hl, wRoamMon1MapGroup
	ret z
	ld a, [wRoamMon2Species]
	cp b
	ld hl, wRoamMon2MapGroup
	ret z
	ld hl, wRoamMon3MapGroup
	ret
; 3f9e9

GetRoamMonMapNumber: ; 3f9e9
	ld a, [TempEnemyMonSpecies]
	ld b, a
	ld a, [wRoamMon1Species]
	cp b
	ld hl, wRoamMon1MapNumber
	ret z
	ld a, [wRoamMon2Species]
	cp b
	ld hl, wRoamMon2MapNumber
	ret z
	ld hl, wRoamMon3MapNumber
	ret
; 3fa01

GetRoamMonHP: ; 3fa01
; output: hl = wRoamMonHP
	ld a, [TempEnemyMonSpecies]
	ld b, a
	ld a, [wRoamMon1Species]
	cp b
	ld hl, wRoamMon1HP
	ret z
	ld a, [wRoamMon2Species]
	cp b
	ld hl, wRoamMon2HP
	ret z
	ld hl, wRoamMon3HP
	ret
; 3fa19

GetRoamMonDVs: ; 3fa19
; output: hl = wRoamMonDVs
	ld a, [TempEnemyMonSpecies]
	ld b, a
	ld a, [wRoamMon1Species]
	cp b
	ld hl, wRoamMon1DVs
	ret z
	ld a, [wRoamMon2Species]
	cp b
	ld hl, wRoamMon2DVs
	ret z
	ld hl, wRoamMon3DVs
	ret
; 3fa31

GetRoamMonSpecies: ; 3fa31
	ld a, [TempEnemyMonSpecies]
	ld hl, wRoamMon1Species
	cp [hl]
	ret z
	ld hl, wRoamMon2Species
	cp [hl]
	ret z
	ld hl, wRoamMon3Species
	ret
; 3fa42


Function3fa42: ; 3fa42
	ld hl, wd276
	ld de, StringBuffer1
	ld bc, 2
	call CopyBytes
	ld hl, wd26b
	ld bc, 10
	call CopyBytes
	ld hl, s1_b254
	call Function3faa0
	ld hl, s1_b266
	ld d, 5
.loop
	push hl
rept 2
	inc hl
endr
	ld a, [hl]
rept 2
	dec hl
endr
	and a
	jr z, .copy
	push de
	ld bc, 12
	ld de, StringBuffer1
	call CompareLong
	pop de
	pop hl
	jr c, .done
	ld bc, 18
	add hl, bc
	dec d
	jr nz, .loop
	ld bc, -18
	add hl, bc
	push hl

.copy
	ld d, h
	ld e, l
	ld hl, StringBuffer1
	ld bc, 12
	call CopyBytes
	ld b, 6
	xor a
.loop2
	ld [de], a
	inc de
	dec b
	jr nz, .loop2
	pop hl

.done
	call Function3faa0
	call Function3fac8
	ret
; 3faa0

Function3faa0: ; 3faa0
	ld a, [wBattleResult]
	and $f
	cp $1
	ld bc, 13
	jr c, .okay
	ld bc, 15
	jr z, .okay
	ld bc, 17

.okay
	add hl, bc
	call Function3fabe
	ret nc
	inc [hl]
	ret nz
	dec hl
	inc [hl]
	ret
; 3fabe

Function3fabe: ; 3fabe
	dec hl
	ld a, [hl]
	inc hl
	cp $27
	ret c
	ld a, [hl]
	cp $f
	ret
; 3fac8

Function3fac8: ; 3fac8
	ld b, $5
	ld hl, s1_b277
	ld de, wd002
.loop
	push bc
	push de
	push hl
	call Function3fb54
	pop hl
	ld a, e
	pop de
	ld [de], a
	inc de
	ld a, b
	ld [de], a
	inc de
	ld a, c
	ld [de], a
	inc de
	ld bc, 18
	add hl, bc
	pop bc
	dec b
	jr nz, .loop
	ld b, $0
	ld c, $1
.loop2
	ld a, b
rept 2
	add b
endr
	ld e, a
	ld d, $0
	ld hl, wd002
	add hl, de
	push hl
	ld a, c
rept 2
	add c
endr
	ld e, a
	ld d, $0
	ld hl, wd002
	add hl, de
	ld d, h
	ld e, l
	pop hl
	push bc
	ld c, $3
	call StringCmp
	pop bc
	jr z, .equal
	jr nc, .done

.equal
	inc c
	ld a, c
	cp $5
	jr nz, .loop2
	inc b
	ld c, b
	inc c
	ld a, b
	cp $4
	jr nz, .loop2
	ret

.done
	push bc
	ld a, b
	ld bc, 18
	ld hl, s1_b266
	call AddNTimes
	push hl
	ld de, wd002
	ld bc, 18
	call CopyBytes
	pop hl
	pop bc
	push hl
	ld a, c
	ld bc, 18
	ld hl, s1_b266
	call AddNTimes
	pop de
	push hl
	ld bc, 18
	call CopyBytes
	ld hl, wd002
	ld bc, 18
	pop de
	call CopyBytes
	ret
; 3fb54

Function3fb54: ; 3fb54
	ld e, $0
	ld a, [hld]
	ld c, a
	ld a, [hld]
	ld b, a
	ld a, [hld]
	add c
	ld c, a
	ld a, [hld]
	adc b
	ld b, a
	jr nc, .okay
	inc e

.okay
	ld a, [hld]
	add c
	ld c, a
	ld a, [hl]
	adc b
	ld b, a
	ret nc
	inc e
	ret
; 3fb6c

InitBattleDisplay: ; 3fb6c
	call .InitBackPic
	hlcoord 0, 12
	ld b, 4
	ld c, 18
	call TextBox
	callba MobileTextBorder
	hlcoord 1, 5
	lb bc, 3, 7
	call ClearBox
	call LoadStandardFont
	call _LoadBattleFontsHPBar
	call .BlankBGMap
	xor a
	ld [hMapAnims], a
	ld [hSCY], a
	ld a, $90
	ld [hWY], a
	ld [rWY], a
	call WaitBGMap
	xor a
	ld [hBGMapMode], a
	callba SlideBattlePics
	ld a, $1
	ld [hBGMapMode], a
	ld a, $31
	ld [hFillBox], a
	hlcoord 2, 6
	lb bc, 6, 6
	predef FillBox
	xor a
	ld [hWY], a
	ld [rWY], a
	call WaitBGMap
	call HideSprites
	ld b, $1
	call GetSGBLayout
	call SetPalettes
	ld a, $90
	ld [hWY], a
	xor a
	ld [hSCX], a
	ret
; 3fbd6

.BlankBGMap: ; 3fbd6
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a

	ld hl, w6_d000
	ld bc, w6_d400 - w6_d000
	ld a, " "
	call ByteFill

	ld de, w6_d000
	ld hl, VBGMap0
	lb bc, BANK(.BlankBGMap), $40
	call Request2bpp

	pop af
	ld [rSVBK], a
	ret
; 3fbf8

.InitBackPic: ; 3fbf8
	call GetTrainerBackpic
	call CopyBackpic
	ret
; 3fbff


GetTrainerBackpic: ; 3fbff
; Load the player character's backpic (6x6) into VRAM starting from $9310.

; Special exception for Dude.
	ld b, BANK(DudeBackpic)
	ld hl, DudeBackpic
	ld a, [BattleType]
	cp BATTLETYPE_TUTORIAL
	jr z, .Decompress

; What gender are we?
	ld a, [wPlayerSpriteSetupFlags]
	bit 2, a
	jr nz, .Chris
	ld a, [PlayerGender]
	bit 0, a
	jr z, .Chris

; It's a girl.
	callba GetKrisBackpic
	ret

.Chris
; It's a boy.
	ld b, BANK(ChrisBackpic)
	ld hl, ChrisBackpic

.Decompress
	ld de, VTiles2 tile $31
	ld c, $31
	predef DecompressPredef
	ret
; 3fc30


CopyBackpic: ; 3fc30
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a
	ld hl, VTiles0
	ld de, VTiles2 tile $31
	ld a, [hROMBank]
	ld b, a
	ld c, $31
	call Get2bpp
	pop af
	ld [rSVBK], a
	call Function3fc5b
	ld a, $31
	ld [hFillBox], a
	hlcoord 2, 6
	lb bc, 6, 6
	predef FillBox
	ret
; 3fc5b

Function3fc5b: ; 3fc5b
	ld hl, Sprites
	xor a
	ld [hMapObjectIndexBuffer], a
	ld b, $6
	ld e, $a8
.outer_loop
	ld c, $3
	ld d, $40
.inner_loop
	ld [hl], d
	inc hl
	ld [hl], e
	inc hl
	ld a, [hMapObjectIndexBuffer]
	ld [hli], a
	inc a
	ld [hMapObjectIndexBuffer], a
	ld a, $1
	ld [hli], a
	ld a, d
	add $8
	ld d, a
	dec c
	jr nz, .inner_loop
	ld a, [hMapObjectIndexBuffer]
	add $3
	ld [hMapObjectIndexBuffer], a
	ld a, e
	add $8
	ld e, a
	dec b
	jr nz, .outer_loop
	ret
; 3fc8b


BattleStartMessage: ; 3fc8b
	ld a, [wBattleMode]
	dec a
	jr z, .wild

	ld de, SFX_SHINE
	call PlaySFX
	call WaitSFX

	ld c, 20
	call DelayFrames

	callba Battle_GetTrainerName

	ld hl, WantsToBattleText
	jr .PlaceBattleStartText

.wild
	call BattleCheckEnemyShininess
	jr nc, .not_shiny

	xor a
	ld [wcfca], a
	ld a, 1
	ld [hBattleTurn], a
	ld a, 1
	ld [wKickCounter], a
	ld de, ANIM_SEND_OUT_MON
	call Call_PlayBattleAnim

.not_shiny
	callba CheckSleepingTreeMon
	jr c, .skip_cry

	callba CheckBattleScene
	jr c, .cry_no_anim

	hlcoord 12, 0
	ld d, $0
	ld e, ANIM_MON_NORMAL
	predef AnimateFrontpic
	jr .skip_cry

.cry_no_anim
	ld a, $0f
	ld [CryTracks], a
	ld a, [TempEnemyMonSpecies]
	call PlayStereoCry

.skip_cry
	ld a, [BattleType]
	cp BATTLETYPE_FISH
	jr nz, .NotFishing

	callba MobileFn_106086

	ld hl, HookedPokemonAttackedText
	jr .PlaceBattleStartText

.NotFishing
	ld hl, PokemonFellFromTreeText
	cp BATTLETYPE_TREE
	jr z, .PlaceBattleStartText
	ld hl, WildCelebiAppearedText
	cp BATTLETYPE_CELEBI
	jr z, .PlaceBattleStartText
	ld hl, WildPokemonAppearedText

.PlaceBattleStartText
	push hl
	callba Function2c000
	pop hl
	call StdBattleTextBox

	call IsMobileBattle2
	ret nz

	ld c, $2
	callba Function4ea0a

	ret
; 3fd26
