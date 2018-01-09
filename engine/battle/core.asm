; Core components of the battle engine.
BattleCore:
DoBattle: ; 3c000
	xor a
	ld [wBattleParticipantsNotFainted], a
	ld [wBattleParticipantsIncludingFainted], a
	ld [wPlayerAction], a
	ld [BattleEnded], a
	inc a
	ld [wBattleHasJustStarted], a
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
	call CheckIfCurPartyMonIsFitToFight
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
	ld a, 9
	call SlideBattlePicOut
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
	jp BattleTurn

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
	jr z, .print_text

	ld a, [wBattleResult]
	and $c0
	ld [wBattleResult], a
	ld hl, BattleText_EnemyFled
	call CheckMobileBattleError
	jr nc, .print_text

	ld hl, wcd2a
	bit 4, [hl]
	jr nz, .skip_text

	ld hl, BattleText_LinkErrorBattleCanceled

.print_text
	call StdBattleTextBox

.skip_text
	call StopDangerSound
	call CheckMobileBattleError
	jr c, .skip_sfx

	ld de, SFX_RUN
	call PlaySFX

.skip_sfx
	call SetPlayerTurn
	ld a, 1
	ld [BattleEnded], a
	ret
; 3c12f

BattleTurn: ; 3c12f
.loop
	call MobileFn_3c1bf
	call CheckContestBattleOver
	jp c, .quit

	xor a
	ld [wPlayerIsSwitching], a
	ld [wEnemyIsSwitching], a
	ld [wBattleHasJustStarted], a
	ld [wPlayerJustGotFrozen], a
	ld [wEnemyJustGotFrozen], a
	ld [CurDamage], a
	ld [CurDamage + 1], a

	call HandleBerserkGene
	call UpdateBattleMonInParty
	farcall AIChooseMove

	call IsMobileBattle
	jr nz, .not_disconnected
	farcall Function100da5
	farcall StartMobileInactivityTimer
	farcall Function100dd8
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

.CheckEnemyFirst:
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

.NoMoreFaintingConditions:
	call HandleLeftovers
	call HandleMysteryberry
	call HanleDefrost
	call HandleSafeguard
	call HandleScreens
	call HandleStatBoostingHeldItems
	call HandleHealingItems
	call UpdateBattleMonInParty
	call LoadTileMapToTempTileMap
	jp HandleEncore
; 3c23c

CheckFaint_PlayerThenEnemy: ; 3c23c
	call HasPlayerFainted
	jr nz, .PlayerNotFainted
	call HandlePlayerMonFaint
	ld a, [BattleEnded]
	and a
	jr nz, .BattleIsOver

.PlayerNotFainted:
	call HasEnemyFainted
	jr nz, .BattleContinues
	call HandleEnemyMonFaint
	ld a, [BattleEnded]
	and a
	jr nz, .BattleIsOver

.BattleContinues:
	and a
	ret

.BattleIsOver:
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

.EnemyNotFainted:
	call HasPlayerFainted
	jr nz, .BattleContinues
	call HandlePlayerMonFaint
	ld a, [BattleEnded]
	and a
	jr nz, .BattleIsOver

.BattleContinues:
	and a
	ret

.BattleIsOver:
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
	callfar GetUserItem
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
	farcall BattleCommand_AttackUp2
	pop af
	pop hl
	ld [hl], a
	call GetItemName
	ld hl, BattleText_UsersStringBuffer1Activated
	call StdBattleTextBox
	callfar BattleCommand_StatUpMessage
	pop af
	bit SUBSTATUS_CONFUSED, a
	ret nz
	xor a
	ld [wNumHits], a
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
	ld a, [wPlayerAction]
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
	callfar AI_Switch
	call SetEnemyTurn
	call SpikesDamage
	jp .enemy_first

.use_move
	ld a, [wPlayerAction]
	and a
	jp nz, .player_first
	call CompareMovePriority
	jr z, .equal_priority
	jp c, .player_first ; player goes first
	jp .enemy_first

.equal_priority
	call SetPlayerTurn
	callfar GetUserItem
	push bc
	callfar GetOpponentItem
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

.enemy_first ; 3c3f3
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
	ld a, [wPlayerAction]
	cp $2
	jr z, .reset_rage
	and a
	jr nz, .reset_bide
	ld a, [PlayerSubStatus3]
	and 1 << SUBSTATUS_BIDE
	jr nz, .locked_in
	xor a
	ld [wMoveSelectionMenuType], a
	inc a ; POUND
	ld [FXAnimID], a
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
	callfar UpdateMoveData
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

HandleEncore: ; 3c4df
	ld a, [hLinkPlayerNumber]
	cp $1
	jr z, .player_1
	call .do_player
	jr .do_enemy

.player_1
	call .do_enemy
.do_player
	ld hl, PlayerSubStatus5
	bit SUBSTATUS_ENCORED, [hl]
	ret z
	ld a, [PlayerEncoreCount]
	dec a
	ld [PlayerEncoreCount], a
	jr z, .end_player_encore
	ld hl, BattleMonPP
	ld a, [CurMoveNum]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	and $3f
	ret nz

.end_player_encore
	ld hl, PlayerSubStatus5
	res SUBSTATUS_ENCORED, [hl]
	call SetEnemyTurn
	ld hl, BattleText_TargetsEncoreEnded
	jp StdBattleTextBox

.do_enemy
	ld hl, EnemySubStatus5
	bit SUBSTATUS_ENCORED, [hl]
	ret z
	ld a, [EnemyEncoreCount]
	dec a
	ld [EnemyEncoreCount], a
	jr z, .end_enemy_encore
	ld hl, EnemyMonPP
	ld a, [CurEnemyMoveNum]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	and $3f
	ret nz

.end_enemy_encore
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

.Stay:
	and a
	ret

.Flee:
	scf
	ret
; 3c59a

INCLUDE "data/wild/flee_mons.asm"

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

	; Vital Throw goes last.
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

	ld a, BASE_PRIORITY
	ret

.done
	ld a, [hl]
	ret
; 3c5df

INCLUDE "data/moves/effects_priorities.asm"

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
	callfar AI_SwitchOrTryItem
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
	ld [wPlayerAction], a
	ret
; 3c664

Battle_PlayerFirst: ; 3c664
	xor a
	ld [wEnemyGoesFirst], a
	call SetEnemyTurn
	callfar AI_SwitchOrTryItem
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
	ld [wPlayerAction], a
	ret
; 3c6cf

PlayerTurn_EndOpponentProtectEndureDestinyBond: ; 3c6cf
	call SetPlayerTurn
	call EndUserDestinyBond
	callfar DoPlayerTurn
	jp EndOpponentProtectEndureDestinyBond
; 3c6de

EnemyTurn_EndOpponentProtectEndureDestinyBond: ; 3c6de
	call SetEnemyTurn
	call EndUserDestinyBond
	callfar DoEnemyTurn
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
	ld [wNumHits], a
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
	ld [wNumHits], a
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
	ld [wNumHits], a
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
	ld [wNumHits], a
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

.EnemyFirst:
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
	jr nz, .kill_enemy
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

.kill_enemy
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

.EnemyFirst:
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
	ld [FXAnimID], a
	call GetMoveName
	dec [hl]
	jr z, .release_from_bounds

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	jr nz, .skip_anim

	call SwitchTurnCore
	xor a
	ld [wNumHits], a
	ld [FXAnimID + 1], a
	predef PlayBattleAnim
	call SwitchTurnCore

.skip_anim
	call GetSixteenthMaxHP
	call SubtractHPFromUser
	ld hl, BattleText_UsersHurtByStringBuffer1
	jr .print_text

.release_from_bounds
	ld hl, BattleText_UserWasReleasedFromStringBuffer1

.print_text
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

.DoEnemyFirst:
	call SetEnemyTurn
	call .do_it
	call SetPlayerTurn
.do_it

	callfar GetUserItem
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
	ld hl, BattleText_TargetRecoveredWithItem
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

.DoEnemyFirst:
	call SetEnemyTurn
	call .do_it
	call SetPlayerTurn

.do_it
	callfar GetUserItem
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
	ld de, wWildMonPP
	ld hl, wWildMonMoves
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
	callfar GetUserItem
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

	ld hl, BattleText_TargetWasHitByFutureSight
	call StdBattleTextBox

	ld a, BATTLE_VARS_MOVE
	call GetBattleVarAddr
	push af
	ld a, FUTURE_SIGHT
	ld [hl], a

	callfar UpdateMoveData
	xor a
	ld [AttackMissed], a
	ld [AlreadyDisobeyed], a
	ld a, 10
	ld [TypeModifier], a
	callfar DoMove
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
	jr z, .wild
	ld a, [CurOTMon]
	ld hl, OTPartyMon1Status
	call GetPartyLocation
	ld [hl], 0
.wild

	call UpdateBattleHuds
	call SetPlayerTurn
	ld hl, DefrostedOpponentText
	jp StdBattleTextBox
; 3cafb

HandleSafeguard: ; 3cafb
	ld a, [hLinkPlayerNumber]
	cp $1
	jr z, .player1
	call .CheckPlayer
	jr .CheckEnemy

.player1
	call .CheckEnemy
.CheckPlayer:
	ld a, [PlayerScreens]
	bit SCREENS_SAFEGUARD, a
	ret z
	ld hl, PlayerSafeguardCount
	dec [hl]
	ret nz
	res SCREENS_SAFEGUARD, a
	ld [PlayerScreens], a
	xor a
	jr .print

.CheckEnemy:
	ld a, [EnemyScreens]
	bit SCREENS_SAFEGUARD, a
	ret z
	ld hl, EnemySafeguardCount
	dec [hl]
	ret nz
	res SCREENS_SAFEGUARD, a
	ld [EnemyScreens], a
	ld a, $1

.print
	ld [hBattleTurn], a
	ld hl, BattleText_SafeguardFaded
	jp StdBattleTextBox

HandleScreens: ; 3cb36
	ld a, [hLinkPlayerNumber]
	cp 1
	jr z, .Both
	call .CheckPlayer
	jr .CheckEnemy

.Both:
	call .CheckEnemy

.CheckPlayer:
	call SetPlayerTurn
	ld de, .Your
	call .Copy
	ld hl, PlayerScreens
	ld de, PlayerLightScreenCount
	jr .TickScreens

.CheckEnemy:
	call SetEnemyTurn
	ld de, .Enemy
	call .Copy
	ld hl, EnemyScreens
	ld de, EnemyLightScreenCount

.TickScreens:
	bit SCREENS_LIGHT_SCREEN, [hl]
	call nz, .LightScreenTick
	bit SCREENS_REFLECT, [hl]
	call nz, .ReflectTick
	ret

.Copy:
	ld hl, StringBuffer1
	jp CopyName2
; 3cb75

.Your:
	db "Your@"
.Enemy:
	db "Enemy@"
; 3cb80

.LightScreenTick: ; 3cb80
	ld a, [de]
	dec a
	ld [de], a
	ret nz
	res SCREENS_LIGHT_SCREEN, [hl]
	push hl
	push de
	ld hl, BattleText_PkmnLightScreenFell
	call StdBattleTextBox
	pop de
	pop hl
	ret
; 3cb91

.ReflectTick: ; 3cb91
	inc de
	ld a, [de]
	dec a
	ld [de], a
	ret nz
	res SCREENS_REFLECT, [hl]
	ld hl, BattleText_PkmnReflectFaded
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

.SandstormDamage:
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
	ld [wNumHits], a
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

.PrintWeatherMessage:
	ld a, [Weather]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp StdBattleTextBox
; 3cc2d

.WeatherMessages:
	dw BattleText_RainContinuesToFall
	dw BattleText_TheSunlightIsStrong
	dw BattleText_TheSandstormRages
.WeatherEndedMessages:
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
	ld [Buffer3], a
	sub c
	ld [hld], a
	ld [Buffer5], a
	ld a, [hl]
	ld [Buffer4], a
	sbc b
	ld [hl], a
	ld [Buffer6], a
	ret nc

	ld a, [Buffer3]
	ld c, a
	ld a, [Buffer4]
	ld b, a
	xor a
	ld [hli], a
	ld [hl], a
	ld [Buffer5], a
	ld [Buffer6], a
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

GetHalfHP: ; 3ccc2
; unreferenced
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
	ld [wWhichHPBar], a
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
	ld [wWhichMonFaintedFirst], a
	call UpdateBattleStateAndExperienceAfterEnemyFaint
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
	ld [wPlayerAction], a
	call HandleEnemySwitch
	jp z, WildFled_EnemyFled_LinkBattleCanceled
	jr DoubleSwitch

.player_mon_not_fainted
	ld a, $1
	ld [wPlayerAction], a
	call HandleEnemySwitch
	jp z, WildFled_EnemyFled_LinkBattleCanceled
	xor a
	ld [wPlayerAction], a
	ret
; 3cdca

DoubleSwitch: ; 3cdca
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
	ld [wPlayerAction], a
	ret
; 3ce01

UpdateBattleStateAndExperienceAfterEnemyFaint: ; 3ce01
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
	ld [wDanger], a

.trainer
	ld hl, BattleMonHP
	ld a, [hli]
	or [hl]
	jr nz, .player_mon_did_not_faint
	ld a, [wWhichMonFaintedFirst]
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
	call IsAnyMonHoldingExpShare
	jr z, .skip_exp
	ld hl, EnemyMonBaseStats
	ld b, EnemyMonEnd - EnemyMonBaseStats
.loop
	srl [hl]
	inc hl
	dec b
	jr nz, .loop

.skip_exp
	ld hl, EnemyMonBaseStats
	ld de, wBackupEnemyMonBaseStats
	ld bc, EnemyMonEnd - EnemyMonBaseStats
	call CopyBytes
	xor a
	ld [wGivingExperienceToExpShareHolders], a
	call GiveExperiencePoints
	call IsAnyMonHoldingExpShare
	ret z

	ld a, [wBattleParticipantsNotFainted]
	push af
	ld a, d
	ld [wBattleParticipantsNotFainted], a
	ld hl, wBackupEnemyMonBaseStats
	ld de, EnemyMonBaseStats
	ld bc, EnemyMonEnd - EnemyMonBaseStats
	call CopyBytes
	ld a, $1
	ld [wGivingExperienceToExpShareHolders], a
	call GiveExperiencePoints
	pop af
	ld [wBattleParticipantsNotFainted], a
	ret
; 3ceaa

IsAnyMonHoldingExpShare: ; 3ceaa
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

HandleEnemySwitch: ; 3cf4a
	ld hl, EnemyHPPal
	ld e, HP_BAR_LENGTH_PX
	call UpdateHPPal
	call WaitBGMap
	farcall EnemySwitch_TrainerHud
	ld a, [wLinkMode]
	and a
	jr z, .not_linked

	call LinkBattleSendReceiveAction
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
	jr nz, .set
	call EnemySwitch
	jr .done_switch

.set
	call EnemySwitch_SetMode
.done_switch
	call ResetBattleParticipants
	call SetEnemyTurn
	call SpikesDamage
	xor a
	ld [wEnemyMoveStruct + MOVE_ANIM], a
	ld [wPlayerAction], a
	inc a
	ret
; 3cfa4

WinTrainerBattle: ; 3cfa4
; Player won the battle
	call StopDangerSound
	ld a, $1
	ld [wDanger], a
	ld [BattleEnded], a
	ld a, [wLinkMode]
	and a
	ld a, b
	call z, PlayVictoryMusic
	callfar Battle_GetTrainerName
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

	call BattleWinSlideInEnemyTrainerFrontpic
	ld c, 40
	call DelayFrames
	ld a, [BattleType]
	cp BATTLETYPE_CANLOSE
	jr nz, .skip_heal
	predef HealParty
.skip_heal
	ld a, [wMonStatusFlags]
	bit 0, a
	jr nz, .skip_win_loss_text
	call PrintWinLossText

.skip_win_loss_text
	jp .GiveMoney

.mobile
	call BattleWinSlideInEnemyTrainerFrontpic
	ld c, 40
	call DelayFrames
	ld c, $4 ; win
	farcall Mobile_PrintOpponentBattleMessage
	ret

.battle_tower
	call BattleWinSlideInEnemyTrainerFrontpic
	ld c, 40
	call DelayFrames
	call EmptyBattleTextBox
	ld c, $3
	farcall BattleTowerText
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

.GiveMoney:
	ld a, [wAmuletCoin]
	and a
	call nz, .DoubleReward
	call .CheckMaxedOutMomMoney
	push af
	ld a, $0
	jr nc, .okay
	ld a, [wMomSavingMoney]
	and $7
	cp $3
	jr nz, .okay
	inc a

.okay
	ld b, a
	ld c, $4
.loop
	ld a, b
	and a
	jr z, .loop2
	call .SendMoneyToMom
	dec c
	dec b
	jr .loop

.loop2
	ld a, c
	and a
	jr z, .done
	call .AddMoneyToWallet
	dec c
	jr .loop2

.done
	call .DoubleReward
	call .DoubleReward
	pop af
	jr nc, .KeepItAll
	ld a, [wMomSavingMoney]
	and $7
	jr z, .KeepItAll
	ld hl, .SentToMomTexts
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp StdBattleTextBox

.KeepItAll:
	ld hl, GotMoneyForWinningText
	jp StdBattleTextBox
; 3d081

.SendMoneyToMom: ; 3d081
	push bc
	ld hl, wBattleReward + 2
	ld de, wMomsMoney + 2
	call AddBattleMoneyToAccount
	pop bc
	ret
; 3d08d

.AddMoneyToWallet: ; 3d08d
	push bc
	ld hl, wBattleReward + 2
	ld de, Money + 2
	call AddBattleMoneyToAccount
	pop bc
	ret
; 3d099

.DoubleReward: ; 3d099
	ld hl, wBattleReward + 2
	sla [hl]
	dec hl
	rl [hl]
	dec hl
	rl [hl]
	ret nc
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret
; 3d0ab

.SentToMomTexts: ; 3d0ab
	dw SentSomeToMomText
	dw SentHalfToMomText
	dw SentAllToMomText
; 3d0b1

.CheckMaxedOutMomMoney: ; 3d0b1
	ld hl, wMomsMoney + 2
	ld a, [hld]
	cp LOW(MAX_MONEY)
	ld a, [hld]
	sbc HIGH(MAX_MONEY) ; mid
	ld a, [hl]
	sbc HIGH(MAX_MONEY >> 8)
	ret
; 3d0be

AddBattleMoneyToAccount: ; 3d0be
	ld c, $3
	and a
	push de
	push hl
	push bc
	ld b, h
	ld c, l
	farcall TrainerRankings_AddToBattlePayouts
	pop bc
	pop hl
.loop
	ld a, [de]
	adc [hl]
	ld [de], a
	dec de
	dec hl
	dec c
	jr nz, .loop
	pop hl
	ld a, [hld]
	cp LOW(MAX_MONEY)
	ld a, [hld]
	sbc HIGH(MAX_MONEY) ; mid
	ld a, [hl]
	sbc HIGH(MAX_MONEY >> 8)
	ret c
	ld [hl], HIGH(MAX_MONEY >> 8)
	inc hl
	ld [hl], HIGH(MAX_MONEY) ; mid
	inc hl
	ld [hl], LOW(MAX_MONEY)
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
	call IsAnyMonHoldingExpShare
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
	call IsGymLeader
	jr c, .play_music
	ld de, MUSIC_TRAINER_VICTORY

.play_music
	call PlayMusic

.lost
	pop de
	ret
; 3d123

IsKantoGymLeader: ; 0x3d123
	ld hl, KantoGymLeaders
	jr IsGymLeaderCommon

IsGymLeader: ; 0x3d128
	ld hl, GymLeaders
IsGymLeaderCommon:
	push de
	ld a, [OtherTrainerClass]
	ld de, $1
	call IsInArray
	pop de
	ret
; 0x3d137

INCLUDE "data/trainers/leaders.asm"

HandlePlayerMonFaint: ; 3d14e
	call FaintYourPokemon
	ld hl, EnemyMonHP
	ld a, [hli]
	or [hl]
	call z, FaintEnemyPokemon
	ld a, $1
	ld [wWhichMonFaintedFirst], a
	call PlayerMonFaintHappinessMod
	call CheckPlayerPartyForFitPkmn
	ld a, d
	and a
	jp z, LostBattle
	ld hl, EnemyMonHP
	ld a, [hli]
	or [hl]
	jr nz, .notfainted
	call UpdateBattleStateAndExperienceAfterEnemyFaint
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
	ld [wPlayerAction], a
	call HandleEnemySwitch
	jp z, WildFled_EnemyFled_LinkBattleCanceled
	jp DoubleSwitch
; 3d1aa

PlayerMonFaintHappinessMod: ; 3d1aa
	ld a, [CurBattleMon]
	ld c, a
	ld hl, wBattleParticipantsNotFainted
	ld b, RESET_FLAG
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
	callfar ChangeHappiness
	ld a, [wBattleResult]
	and %11000000
	add $1
	ld [wBattleResult], a
	ld a, [wWhichMonFaintedFirst]
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
	ld a, [wMenuCursorY]
	jr c, .pressed_b
	and a
	ret

.pressed_b
	ld a, [wMenuCursorY]
	cp $1 ; YES
	jr z, .loop
	ld hl, PartyMon1Speed
	ld de, EnemyMonSpeed
	jp TryToRunAwayFromBattle
; 3d227

ForcePlayerMonChoice: ; 3d227
	call EmptyBattleTextBox
	call LoadStandardMenuDataHeader
	call SetUpBattlePartyMenu_NoLoop
	call ForcePickPartyMonInBattle
	ld a, [wLinkMode]
	and a
	jr z, .skip_link
	ld a, $1
	ld [wPlayerAction], a
	call LinkBattleSendReceiveAction

.skip_link
	xor a
	ld [wPlayerAction], a
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
	call GetMemSGBLayout
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
	call CloseWindow
	call GetMemSGBLayout
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

SetUpBattlePartyMenu_NoLoop: ; 3d2f7
	call ClearBGPalettes
SetUpBattlePartyMenu: ; switch to fullscreen menu?
	farcall LoadPartyMenuGFX
	farcall InitPartyMenuWithCancel
	farcall InitPartyMenuBGPal7
	farcall InitPartyMenuGFX
	ret
; 3d313

JumpToPartyMenuAndPrintText: ; 3d313
	farcall WritePartyMenuTilemap
	farcall PrintPartyMenuText
	call WaitBGMap
	call SetPalettes
	call DelayFrame
	ret
; 3d329

SelectBattleMon: ; 3d329
	call IsMobileBattle
	jr z, .mobile
	farcall PartyMenuSelect
	ret

.mobile
	farcall Mobile_PartyMenuSelect
	ret
; 3d33c

PickPartyMonInBattle: ; 3d33c
.loop
	ld a, PARTYMENUACTION_SWITCH ; Which PKMN?
	ld [PartyMenuActionText], a
	call JumpToPartyMenuAndPrintText
	call SelectBattleMon
	ret c
	call CheckIfCurPartyMonIsFitToFight
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
	call BattleWinSlideInEnemyTrainerFrontpic

	ld c, 40
	call DelayFrames

	ld a, [wMonStatusFlags]
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
	call BattleWinSlideInEnemyTrainerFrontpic

	ld c, 40
	call DelayFrames

	call EmptyBattleTextBox
	ld c, 2
	farcall BattleTowerText
	call WaitPressAorB_BlinkCursor
	call ClearTileMap
	call ClearBGPalettes
	ret

.not_canlose
	ld a, [wLinkMode]
	and a
	jr nz, .LostLinkBattle

; Greyscale
	ld b, SCGB_BATTLE_GRAYSCALE
	call GetSGBLayout
	call SetPalettes
	jr .end

.LostLinkBattle:
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
	call BattleWinSlideInEnemyTrainerFrontpic

	ld c, 40
	call DelayFrames

	ld c, $3 ; lost
	farcall Mobile_PrintOpponentBattleMessage
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

.OuterLoop:
	push bc
	push de
	push hl
	ld b, 6

.InnerLoop:
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

.Spaces:
	db "       @"
; 3d490

SlideBattlePicOut: ; 3d490
	ld [hMapObjectIndexBuffer], a
	ld c, a
.loop
	push bc
	push hl
	ld b, $7
.loop2
	push hl
	call .DoFrame
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .loop2
	ld c, 2
	call DelayFrames
	pop hl
	pop bc
	dec c
	jr nz, .loop
	ret
; 3d4ae

.DoFrame: ; 3d4ae
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
	ld [wBattleParticipantsIncludingFainted], a
	ld [wPlayerAction], a
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
	jr z, .check_wBattleHasJustStarted

	dec a
	ld b, a
	jr .return_carry

.check_wBattleHasJustStarted
	ld a, [wBattleHasJustStarted]
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
	ld [LastPlayerCounterMove], a
	ld [LastEnemyCounterMove], a
	ld [LastEnemyMove], a
	ld [CurEnemyMove], a
	dec a
	ld [wEnemyItemState], a
	xor a
	ld [wPlayerWrapCount], a
	hlcoord 18, 0
	ld a, 8
	call SlideBattlePicOut
	call EmptyBattleTextBox
	jp LoadStandardMenuDataHeader
; 3d57a

ResetBattleParticipants: ; 3d57a
	xor a
	ld [wBattleParticipantsNotFainted], a
	ld [wBattleParticipantsIncludingFainted], a
AddBattleParticipant: ; 3d581
	ld a, [CurBattleMon]
	ld c, a
	ld hl, wBattleParticipantsNotFainted
	ld b, SET_FLAG
	push bc
	predef FlagPredef
	pop bc
	ld hl, wBattleParticipantsIncludingFainted
	predef_jump FlagPredef
; 3d599

FindPkmnInOTPartyToSwitchIntoBattle: ; 3d599
	ld b, $ff
	ld a, $1
	ld [Buffer1], a
	ld [Buffer2], a
.loop
	ld hl, Buffer1
	sla [hl]
	inc hl
	sla [hl]
	inc b
	ld a, [OTPartyCount]
	cp b
	jp z, ScoreMonTypeMatchups
	ld a, [CurOTMon]
	cp b
	jr z, .discourage
	ld hl, OTPartyMon1HP
	push bc
	ld a, b
	call GetPartyLocation
	ld a, [hli]
	ld c, a
	ld a, [hl]
	or c
	pop bc
	jr z, .discourage
	call LookUpTheEffectivenessOfEveryMove
	call IsThePlayerPkmnTypesEffectiveAgainstOTPkmn
	jr .loop

.discourage
	ld hl, Buffer2
	set 0, [hl]
	jr .loop
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
	callfar BattleCheckTypeMatchup
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
	ld hl, BaseData + BASE_TYPES
	ld bc, BASE_DATA_SIZE
	call AddNTimes
	ld de, EnemyMonType
	ld bc, BASE_CATCH_RATE - BASE_TYPES
	ld a, BANK(BaseData)
	call FarCopyBytes
	ld a, [BattleMonType1]
	ld [wPlayerMoveStruct + MOVE_TYPE], a
	call SetPlayerTurn
	callfar BattleCheckTypeMatchup
	ld a, [wd265]
	cp 10 + 1 ; 1.0 + 0.1
	jr nc, .super_effective
	ld a, [BattleMonType2]
	ld [wPlayerMoveStruct + MOVE_TYPE], a
	callfar BattleCheckTypeMatchup
	ld a, [wd265]
	cp 10 + 1 ; 1.0 + 0.1
	jr nc, .super_effective
	pop bc
	ret

.super_effective
	pop bc
	ld hl, Buffer1
	bit 0, [hl]
	jr nz, .reset
	inc hl
	set 0, [hl]
	ret

.reset
	res 0, [hl]
	ret
; 3d672

ScoreMonTypeMatchups: ; 3d672
.loop1
	ld hl, Buffer1
	sla [hl]
	inc hl
	sla [hl]
	jr nc, .loop1
	ld a, [OTPartyCount]
	ld b, a
	ld c, [hl]
.loop2
	sla c
	jr nc, .okay
	dec b
	jr z, .loop5
	jr .loop2

.okay
	ld a, [Buffer1]
	and a
	jr z, .okay2
	ld b, $ff
	ld c, a
.loop3
	inc b
	sla c
	jr nc, .loop3
	jr .quit

.okay2
	ld b, $ff
	ld a, [Buffer2]
	ld c, a
.loop4
	inc b
	sla c
	jr c, .loop4
	jr .quit

.loop5
	ld a, [OTPartyCount]
	ld b, a
	call BattleRandom
	and $7
	cp b
	jr nc, .loop5
	ld b, a
	ld a, [CurOTMon]
	cp b
	jr z, .loop5
	ld hl, OTPartyMon1HP
	push bc
	ld a, b
	call GetPartyLocation
	pop bc
	ld a, [hli]
	ld c, a
	ld a, [hl]
	or c
	jr z, .loop5

.quit
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
	ld a, [wFirstUnownSeen]
	and a
	jr nz, .skip_unown
	ld hl, EnemyMonDVs
	predef GetUnownLetter
	ld a, [UnownLetter]
	ld [wFirstUnownSeen], a
.skip_unown

	ld hl, EnemyMonHP
	ld a, [hli]
	ld [wEnemyHPAtTimeOfPlayerSwitch], a
	ld a, [hl]
	ld [wEnemyHPAtTimeOfPlayerSwitch + 1], a
	ret
; 3d714

CheckWhetherToAskSwitch: ; 3d714
	ld a, [wBattleHasJustStarted]
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
	farcall CheckCurPartyMonFainted
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
	callfar Battle_GetTrainerName
	ld hl, BattleText_EnemyIsAboutToUseWillPlayerChangePkmn
	call StdBattleTextBox
	lb bc, 1, 7
	call PlaceYesNoBox
	ld a, [wMenuCursorY]
	dec a
	jr nz, .said_no
	call SetUpBattlePartyMenu_NoLoop
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
	callfar Battle_GetTrainerName
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
	call GetEnemyMonFrontpic

	xor a
	ld [wNumHits], a
	ld [wBattleAnimParam], a
	call SetEnemyTurn
	ld de, ANIM_SEND_OUT_MON
	call Call_PlayBattleAnim

	call BattleCheckEnemyShininess
	jr nc, .not_shiny
	ld a, 1 ; shiny anim
	ld [wBattleAnimParam], a
	ld de, ANIM_SEND_OUT_MON
	call Call_PlayBattleAnim
.not_shiny

	ld bc, TempMonSpecies
	farcall CheckFaintedFrzSlp
	jr c, .skip_cry
	farcall CheckBattleScene
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
	ld [LastPlayerCounterMove], a
	ld [LastEnemyCounterMove], a
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
.loop
	or [hl]
	inc hl
	or [hl]
	add hl, bc
	dec e
	jr nz, .loop
	ld d, a
	ret
; 3d887

CheckIfCurPartyMonIsFitToFight: ; 3d887
	ld a, [CurPartyMon]
	ld hl, PartyMon1HP
	call GetPartyLocation
	ld a, [hli]
	or [hl]
	ret nz

	ld a, [wBattleHasJustStarted]
	and a
	jr nz, .finish_fail
	ld hl, PartySpecies
	ld a, [CurPartyMon]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	cp EGG
	ld hl, BattleText_AnEGGCantBattle
	jr z, .print_textbox

	ld hl, BattleText_TheresNoWillToBattle

.print_textbox
	call StdBattleTextBox

.finish_fail
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
	callfar GetItemHeldEffect
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
	ld a, [wNumFleeAttempts]
	inc a
	ld [wNumFleeAttempts], a
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
	ld b, 2
	call Divide
	ld a, [hQuotient + 1]
	and a
	jr nz, .can_escape
	ld a, [wNumFleeAttempts]
	ld c, a
.loop
	dec c
	jr z, .cant_escape_2
	ld b, 30
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
	ld [wPlayerAction], a
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
	ld [wFailedToFlee], a
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
	ld [wPlayerAction], a
	ld a, $f
	ld [CurMoveNum], a
	xor a
	ld [CurPlayerMove], a
	call LinkBattleSendReceiveAction
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
	inc hl
	inc hl
	inc hl
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
	callfar CheckShininess
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
	ld hl, wEnemyBackupDVs
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

InitEnemyMon: ; 3dabd
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
	inc hl
	inc hl
	inc hl
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
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .loop
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
	call GetBattleMonBackpic
	xor a
	ld [hGraphicStartTile], a
	ld [wBattleMenuCursorBuffer], a
	ld [CurMoveNum], a
	ld [TypeModifier], a
	ld [wPlayerMoveStruct + MOVE_ANIM], a
	ld [LastPlayerCounterMove], a
	ld [LastEnemyCounterMove], a
	ld [LastPlayerMove], a
	call CheckAmuletCoin
	call FinishBattleAnim
	xor a
	ld [wEnemyWrapCount], a
	call SetPlayerTurn
	xor a
	ld [wNumHits], a
	ld [wBattleAnimParam], a
	ld de, ANIM_SEND_OUT_MON
	call Call_PlayBattleAnim
	call BattleCheckPlayerShininess
	jr nc, .not_shiny
	ld a, 1
	ld [wBattleAnimParam], a
	ld de, ANIM_SEND_OUT_MON
	call Call_PlayBattleAnim

.not_shiny
	ld a, MON_SPECIES
	call GetPartyParamLocation
	ld b, h
	ld c, l
	farcall CheckFaintedFrzSlp
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
	ld [LastPlayerCounterMove], a
	ld [LastEnemyCounterMove], a
	ld [LastPlayerMove], a
	ld hl, PlayerSubStatus1
rept 4
	ld [hli], a
endr
	ld [hl], a
	ld hl, PlayerUsedMoves
	ld [hli], a
	ld [hli], a
	ld [hli], a
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
	jp hl
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
	ld a, [LastPlayerMon]
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

RecallPlayerMon: ; 3dce6
	ld a, [hBattleTurn]
	push af
	xor a
	ld [hBattleTurn], a
	ld [wNumHits], a
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
	call UseConfusionHealingItem
	call SetEnemyTurn
	call HandleHPHealingItem
	call UseHeldStatusHealingItem
	jp UseConfusionHealingItem

.player_1
	call SetEnemyTurn
	call HandleHPHealingItem
	call UseHeldStatusHealingItem
	call UseConfusionHealingItem
	call SetPlayerTurn
	call HandleHPHealingItem
	call UseHeldStatusHealingItem
	jp UseConfusionHealingItem
; 3dd2f

HandleHPHealingItem: ; 3dd2f
	callfar GetOpponentItem
	ld a, b
	cp HELD_BERRY
	ret nz
	ld de, EnemyMonHP + 1
	ld hl, EnemyMonMaxHP
	ld a, [hBattleTurn]
	and a
	jr z, .go
	ld de, BattleMonHP + 1
	ld hl, BattleMonMaxHP

.go
; If, and only if, Pokemon's HP is less than half max, use the item.
; Store current HP in Buffer 3/4
	push bc
	ld a, [de]
	ld [Buffer3], a
	add a
	ld c, a
	dec de
	ld a, [de]
	inc de
	ld [Buffer4], a
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
	; store max HP in Buffer1/2
	ld a, [hli]
	ld [Buffer2], a
	ld a, [hl]
	ld [Buffer1], a
	ld a, [de]
	add c
	ld [Buffer5], a
	ld c, a
	dec de
	ld a, [de]
	adc $0
	ld [Buffer6], a
	ld b, a
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	jr nc, .okay
	ld a, [hli]
	ld [Buffer6], a
	ld a, [hl]
	ld [Buffer5], a

.okay
	ld a, [Buffer6]
	ld [de], a
	inc de
	ld a, [Buffer5]
	ld [de], a
	ld a, [hBattleTurn]
	ld [wWhichHPBar], a
	and a
	hlcoord 2, 2
	jr z, .got_hp_bar_coords
	hlcoord 10, 9

.got_hp_bar_coords
	ld [wWhichHPBar], a
	predef AnimateHPBar
UseOpponentItem:
	call RefreshBattleHuds
	callfar GetOpponentItem
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	callfar ConsumeHeldItem
	ld hl, RecoveredUsingText
	jp StdBattleTextBox
; 3ddc8

ItemRecoveryAnim: ; 3ddc8
	push hl
	push de
	push bc
	call EmptyBattleTextBox
	ld a, RECOVER
	ld [FXAnimID], a
	call SwitchTurnCore
	xor a
	ld [wNumHits], a
	ld [FXAnimID + 1], a
	predef PlayBattleAnim
	call SwitchTurnCore
	pop bc
	pop de
	pop hl
	ret
; 3dde9

UseHeldStatusHealingItem: ; 3dde9
	callfar GetOpponentItem
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

.Statuses: ; 3de44
	db HELD_HEAL_POISON,   1 << PSN
	db HELD_HEAL_FREEZE,   1 << FRZ
	db HELD_HEAL_BURN,     1 << BRN
	db HELD_HEAL_SLEEP,    SLP
	db HELD_HEAL_PARALYZE, 1 << PAR
	db HELD_HEAL_STATUS,   ALL_STATUS
	db $ff
; 3de51

UseConfusionHealingItem: ; 3de51
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	bit SUBSTATUS_CONFUSED, a
	ret z
	callfar GetOpponentItem
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
	ld hl, BattleText_ItemHealedConfusion
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
	call .DoPlayer
	jp .DoEnemy

.player_1
	call .DoEnemy
	jp .DoPlayer
; 3dea9

.DoPlayer: ; 3dea9
	call GetPartymonItem
	ld a, $0
	jp .HandleItem
; 3deb1

.DoEnemy: ; 3deb1
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
	callfar GetItemHeldEffect
	ld hl, .StatUpItems
.loop
	ld a, [hli]
	cp $ff
	jr z, .finish
	inc hl
	inc hl
	cp b
	jr nz, .loop
	pop bc
	ld a, [bc]
	ld [wd265], a
	push bc
	dec hl
	dec hl
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
	callfar BattleCommand_StatUpMessage
	ret

.finish
	pop bc
	pop de
	ret
; 3defc

.StatUpItems:
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

	farcall DrawPlayerHUDBorder

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
	jp UpdateHPPal
; 3df9e

CheckDanger: ; 3df9e
	ld hl, BattleMonHP
	ld a, [hli]
	or [hl]
	jr z, .no_danger
	ld a, [wDanger]
	and a
	jr nz, .done
	ld a, [PlayerHPPal]
	cp HP_RED
	jr z, .danger

.no_danger
	ld hl, Danger
	res DANGER_ON_F, [hl]
	jr .done

.danger
	ld hl, Danger
	set DANGER_ON_F, [hl]

.done
	ret
; 3dfbf

PrintPlayerHUD: ; 3dfbf
	ld de, BattleMonNick
	hlcoord 10, 7
	call ret_3e138
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
	ld bc, $11
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

	ld a, TEMPMON
	ld [MonType], a
	callfar GetGender
	ld a, " "
	jr c, .got_gender_char
	ld a, "♂"
	jr nz, .got_gender_char
	ld a, "♀"

.got_gender_char
	hlcoord 17, 8
	ld [hl], a
	hlcoord 14, 8
	push af ; back up gender
	push hl
	ld de, BattleMonStatus
	predef PlaceNonFaintStatus
	pop hl
	pop bc
	ret nz
	ld a, b
	cp " "
	jr nz, .copy_level ; male or female
	dec hl ; genderless

.copy_level
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

	farcall DrawEnemyHUDBorder

	ld a, [TempEnemyMonSpecies]
	ld [CurSpecies], a
	ld [CurPartySpecies], a
	call GetBaseData
	ld de, EnemyMonNick
	hlcoord 1, 0
	call ret_3e138
	call PlaceString
	ld h, b
	ld l, c
	dec hl

	ld hl, EnemyMonDVs
	ld de, TempMonDVs
	ld a, [EnemySubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	jr z, .ok
	ld hl, wEnemyBackupDVs
.ok
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a

	ld a, TEMPMON
	ld [MonType], a
	callfar GetGender
	ld a, " "
	jr c, .got_gender
	ld a, "♂"
	jr nz, .got_gender
	ld a, "♀"

.got_gender
	hlcoord 9, 1
	ld [hl], a

	hlcoord 6, 1
	push af
	push hl
	ld de, EnemyMonStatus
	predef PlaceNonFaintStatus
	pop hl
	pop bc
	jr nz, .skip_level
	ld a, b
	cp " "
	jr nz, .print_level
	dec hl
.print_level
	ld a, [EnemyMonLevel]
	ld [TempMonLevel], a
	call PrintLevel
.skip_level

	ld hl, EnemyMonHP
	ld a, [hli]
	ld [hMultiplicand + 1], a
	ld a, [hld]
	ld [hMultiplicand + 2], a
	or [hl]
	jr nz, .not_fainted

	ld c, a
	ld e, a
	ld d, HP_BAR_LENGTH
	jp .draw_bar

.not_fainted
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
	jr z, .less_than_256_max
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

.less_than_256_max
	ld a, [hProduct + 2]
	ld [hDividend + 0], a
	ld a, [hProduct + 3]
	ld [hDividend + 1], a
	ld a, 2
	ld b, a
	call Divide
	ld a, [hQuotient + 2]
	ld e, a
	ld a, HP_BAR_LENGTH
	ld d, a
	ld c, a

.draw_bar
	xor a
	ld [wWhichHPBar], a
	hlcoord 2, 2
	ld b, 0
	call DrawBattleHPBar
	ret
; 3e127

UpdateEnemyHPPal: ; 3e127
	ld hl, EnemyHPPal
	call UpdateHPPal
	ret
; 3e12e

UpdateHPPal: ; 3e12e
	ld b, [hl]
	call SetHPPal
	ld a, [hl]
	cp b
	ret z
	jp FinishBattleAnim
; 3e138

ret_3e138: ; 3e138
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
	farcall ContestBattleMenu
	jr .next
.not_contest

	; Auto input: choose "ITEM"
	ld a, [InputType]
	or a
	jr z, .skip_dude_pack_select
	farcall _DudeAutoInput_DownA
.skip_dude_pack_select
	call LoadBattleMenu2
	ret c

.next
	ld a, $1
	ld [hBGMapMode], a
	ld a, [wBattleMenuCursorBuffer]
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
	ld [wNumFleeAttempts], a
	call Call_LoadTempTileMapToTileMap
	and a
	ret
; 3e19b

LoadBattleMenu2: ; 3e19b
	call IsMobileBattle
	jr z, .mobile

	farcall LoadBattleMenu
	and a
	ret

.mobile
	farcall Function100b12
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
	jp nz, .ItemsCantBeUsed

	ld a, [InBattleTowerBattle]
	and a
	jp nz, .ItemsCantBeUsed

	call LoadStandardMenuDataHeader

	ld a, [BattleType]
	cp BATTLETYPE_TUTORIAL
	jr z, .tutorial
	cp BATTLETYPE_CONTEST
	jr z, .contest

	farcall BattlePack
	ld a, [wPlayerAction]
	and a
	jr z, .didnt_use_item
	jr .got_item

.tutorial
	farcall TutorialPack
	ld a, POKE_BALL
	ld [CurItem], a
	call DoItemEffect
	jr .got_item

.contest
	ld a, PARK_BALL
	ld [CurItem], a
	call DoItemEffect

.got_item
	call .UseItem
	ret

.didnt_use_item
	call ClearPalettes
	call DelayFrame
	call _LoadBattleFontsHPBar
	call GetBattleMonBackpic
	call GetEnemyMonFrontpic
	call ExitMenu
	call WaitBGMap
	call FinishBattleAnim
	call LoadTileMapToTempTileMap
	jp BattleMenu
; 3e22b

.ItemsCantBeUsed: ; 3e22b
	ld hl, BattleText_ItemsCantBeUsedHere
	call StdBattleTextBox
	jp BattleMenu
; 3e234

.UseItem: ; 3e234
	ld a, [wWildMon]
	and a
	jr nz, .run
	callfar CheckItemPocket
	ld a, [wItemAttributeParamBuffer]
	cp BALL
	jr z, .ball
	call ClearBGPalettes

.ball
	xor a
	ld [hBGMapMode], a
	call _LoadBattleFontsHPBar
	call ClearSprites
	ld a, [BattleType]
	cp BATTLETYPE_TUTORIAL
	jr z, .tutorial2
	call GetBattleMonBackpic

.tutorial2
	call GetEnemyMonFrontpic
	ld a, $1
	ld [wMenuCursorY], a
	call ExitMenu
	call UpdateBattleHUDs
	call WaitBGMap
	call LoadTileMapToTempTileMap
	call ClearWindowData
	call FinishBattleAnim
	and a
	ret

.run
	xor a
	ld [wWildMon], a
	ld a, [wBattleResult]
	and $c0
	ld [wBattleResult], a
	call ClearWindowData
	call SetPalettes
	scf
	ret
; 3e28d

BattleMenu_PKMN: ; 3e28d
	call LoadStandardMenuDataHeader
BattleMenuPKMN_ReturnFromStats:
	call ExitMenu
	call LoadStandardMenuDataHeader
	call ClearBGPalettes
BattleMenuPKMN_Loop:
	call SetUpBattlePartyMenu
	xor a
	ld [PartyMenuActionText], a
	call JumpToPartyMenuAndPrintText
	call SelectBattleMon
	jr c, .Cancel
.loop
	farcall FreezeMonIcons
	call .GetMenu
	jr c, .PressedB
	call PlaceHollowCursor
	ld a, [wMenuCursorY]
	cp $1 ; SWITCH
	jp z, TryPlayerSwitch
	cp $2 ; STATS
	jr z, .Stats
	cp $3 ; CANCEL
	jr z, .Cancel
	jr .loop

.PressedB:
	call CheckMobileBattleError
	jr c, .Cancel
	jr BattleMenuPKMN_Loop

.Stats:
	call Battle_StatsScreen
	call CheckMobileBattleError
	jr c, .Cancel
	jp BattleMenuPKMN_ReturnFromStats

.Cancel:
	call ClearSprites
	call ClearPalettes
	call DelayFrame
	call _LoadHPBar
	call CloseWindow
	call LoadTileMapToTempTileMap
	call GetMemSGBLayout
	call SetPalettes
	jp BattleMenu
; 3e2f5

.GetMenu: ; 3e2f5
	call IsMobileBattle
	jr z, .mobile
	farcall BattleMonMenu
	ret

.mobile
	farcall MobileBattleMonMenu
	ret
; 3e308

Battle_StatsScreen: ; 3e308
	call DisableLCD

	ld hl, vTiles2 tile $31
	ld de, vTiles0
	ld bc, $11 tiles
	call CopyBytes

	ld hl, vTiles2
	ld de, vTiles0 tile $11
	ld bc, $31 tiles
	call CopyBytes

	call EnableLCD

	call ClearSprites
	call LowVolume
	xor a ; PARTYMON
	ld [MonType], a
	farcall BattleStatsScreenInit
	call MaxVolume

	call DisableLCD

	ld hl, vTiles0
	ld de, vTiles2 tile $31
	ld bc, $11 tiles
	call CopyBytes

	ld hl, vTiles0 tile $11
	ld de, vTiles2
	ld bc, $31 tiles
	call CopyBytes

	call EnableLCD
	ret
; 3e358

TryPlayerSwitch: ; 3e358
	ld a, [CurBattleMon]
	ld d, a
	ld a, [CurPartyMon]
	cp d
	jr nz, .check_trapped
	ld hl, BattleText_PkmnIsAlreadyOut
	call StdBattleTextBox
	jp BattleMenuPKMN_Loop

.check_trapped
	ld a, [wPlayerWrapCount]
	and a
	jr nz, .trapped
	ld a, [EnemySubStatus5]
	bit SUBSTATUS_CANT_RUN, a
	jr z, .try_switch

.trapped
	ld hl, BattleText_PkmnCantBeRecalled
	call StdBattleTextBox
	jp BattleMenuPKMN_Loop

.try_switch
	call CheckIfCurPartyMonIsFitToFight
	jp z, BattleMenuPKMN_Loop
	ld a, [CurBattleMon]
	ld [LastPlayerMon], a
	ld a, $2
	ld [wPlayerAction], a
	call ClearPalettes
	call DelayFrame
	call ClearSprites
	call _LoadHPBar
	call CloseWindow
	call GetMemSGBLayout
	call SetPalettes
	ld a, [CurPartyMon]
	ld [CurBattleMon], a
PlayerSwitch: ; 3e3ad
	ld a, 1
	ld [wPlayerIsSwitching], a
	ld a, [wLinkMode]
	and a
	jr z, .not_linked
	call LoadStandardMenuDataHeader
	call LinkBattleSendReceiveAction
	call CloseWindow

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
	callfar AI_Switch
	call SetEnemyTurn
	jp SpikesDamage
; 3e40b

BattleMonEntrance: ; 3e40b
	call WithdrawPkmnText

	ld c, 50
	call DelayFrames

	ld hl, PlayerSubStatus4
	res SUBSTATUS_RAGE, [hl]

	call SetEnemyTurn
	call PursuitSwitch
	jr c, .ok
	call RecallPlayerMon
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
	ld [wMenuCursorY], a
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
	ld [wMenuCursorY], a
	ld hl, BattleMonSpeed
	ld de, EnemyMonSpeed
	call TryToRunAwayFromBattle
	ld a, $0
	ld [wFailedToFlee], a
	ret c
	ld a, [wPlayerAction]
	and a
	ret nz
	jp BattleMenu
; 3e4a8

CheckAmuletCoin: ; 3e4a8
	ld a, [BattleMonItem]
	ld b, a
	callfar GetItemHeldEffect
	ld a, b
	cp HELD_AMULET_COIN
	ret nz
	ld a, 1
	ld [wAmuletCoin], a
	ret
; 3e4bc

MoveSelectionScreen: ; 3e4bc
	call IsMobileBattle
	jr nz, .not_mobile
	farcall MobileMoveSelectionScreen
	ret

.not_mobile
	ld hl, EnemyMonMoves
	ld a, [wMoveSelectionMenuType]
	dec a
	jr z, .got_menu_type
	dec a
	jr z, .ether_elixer_menu
	call CheckPlayerHasUsableMoves
	ret z ; use Struggle
	ld hl, BattleMonMoves
	jr .got_menu_type

.ether_elixer_menu
	ld a, MON_MOVES
	call GetPartyParamLocation

.got_menu_type
	ld de, wListMoves_MoveIndicesBuffer
	ld bc, NUM_MOVES
	call CopyBytes
	xor a
	ld [hBGMapMode], a

	hlcoord 4, 17 - NUM_MOVES - 1
	ld b, 4
	ld c, 14
	ld a, [wMoveSelectionMenuType]
	cp $2
	jr nz, .got_dims
	hlcoord 4, 17 - NUM_MOVES - 1 - 4
	ld b, 4
	ld c, 14
.got_dims
	call TextBox

	hlcoord 6, 17 - NUM_MOVES
	ld a, [wMoveSelectionMenuType]
	cp $2
	jr nz, .got_start_coord
	hlcoord 6, 17 - NUM_MOVES - 4
.got_start_coord
	ld a, SCREEN_WIDTH
	ld [Buffer1], a
	predef ListMoves

	ld b, 5
	ld a, [wMoveSelectionMenuType]
	cp $2
	ld a, 17 - NUM_MOVES
	jr nz, .got_default_coord
	ld b, 5
	ld a, 17 - NUM_MOVES - 4

.got_default_coord
	ld [w2DMenuCursorInitY], a
	ld a, b
	ld [w2DMenuCursorInitX], a
	ld a, [wMoveSelectionMenuType]
	cp $1
	jr z, .skip_inc
	ld a, [CurMoveNum]
	inc a

.skip_inc
	ld [wMenuCursorY], a
	ld a, $1
	ld [wMenuCursorX], a
	ld a, [wNumMoves]
	inc a
	ld [w2DMenuNumRows], a
	ld a, $1
	ld [w2DMenuNumCols], a
	ld c, $2c
	ld a, [wMoveSelectionMenuType]
	dec a
	ld b, D_DOWN | D_UP | A_BUTTON
	jr z, .okay
	dec a
	ld b, D_DOWN | D_UP | A_BUTTON | B_BUTTON
	jr z, .okay
	ld a, [wLinkMode]
	and a
	jr nz, .okay
	ld b, D_DOWN | D_UP | A_BUTTON | B_BUTTON | SELECT

.okay
	ld a, b
	ld [wMenuJoypadFilter], a
	ld a, c
	ld [w2DMenuFlags1], a
	xor a
	ld [w2DMenuFlags2], a
	ld a, $10
	ld [w2DMenuCursorOffsets], a
.menu_loop
	ld a, [wMoveSelectionMenuType]
	and a
	jr z, .battle_player_moves
	dec a
	jr nz, .interpret_joypad
	hlcoord 11, 14
	ld de, .string_3e61c
	call PlaceString
	jr .interpret_joypad

.battle_player_moves
	call MoveInfoBox
	ld a, [wMoveSwapBuffer]
	and a
	jr z, .interpret_joypad
	hlcoord 5, 13
	ld bc, SCREEN_WIDTH
	dec a
	call AddNTimes
	ld [hl], "▷"

.interpret_joypad
	ld a, $1
	ld [hBGMapMode], a
	call ScrollingMenuJoypad
	bit D_UP_F, a
	jp nz, .pressed_up
	bit D_DOWN_F, a
	jp nz, .pressed_down
	bit SELECT_F, a
	jp nz, .pressed_select
	bit B_BUTTON_F, a
	; A button
	push af

	xor a
	ld [wMoveSwapBuffer], a
	ld a, [wMenuCursorY]
	dec a
	ld [wMenuCursorY], a
	ld b, a
	ld a, [wMoveSelectionMenuType]
	dec a
	jr nz, .not_enemy_moves_process_b

	pop af
	ret

.not_enemy_moves_process_b
	dec a
	ld a, b
	ld [CurMoveNum], a
	jr nz, .use_move

	pop af
	ret

.use_move
	pop af
	ret nz

	ld hl, BattleMonPP
	ld a, [wMenuCursorY]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	and $3f
	jr z, .no_pp_left
	ld a, [PlayerDisableCount]
	swap a
	and $f
	dec a
	cp c
	jr z, .move_disabled
	ld a, [wUnusedPlayerLockedMove]
	and a
	jr nz, .skip2
	ld a, [wMenuCursorY]
	ld hl, BattleMonMoves
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]

.skip2
	ld [CurPlayerMove], a
	xor a
	ret

.move_disabled
	ld hl, BattleText_TheMoveIsDisabled
	jr .place_textbox_start_over

.no_pp_left
	ld hl, BattleText_TheresNoPPLeftForThisMove

.place_textbox_start_over
	call StdBattleTextBox
	call Call_LoadTempTileMapToTileMap
	jp MoveSelectionScreen
; 3e61c

.string_3e61c ; 3e61c
	db "@"
; 3e61d

.pressed_up
	ld a, [wMenuCursorY]
	and a
	jp nz, .menu_loop
	ld a, [wNumMoves]
	inc a
	ld [wMenuCursorY], a
	jp .menu_loop
; 3e62e

.pressed_down ; 3e62e
	ld a, [wMenuCursorY]
	ld b, a
	ld a, [wNumMoves]
	inc a
	inc a
	cp b
	jp nz, .menu_loop
	ld a, $1
	ld [wMenuCursorY], a
	jp .menu_loop
; 3e643

.pressed_select ; 3e643
	ld a, [wMoveSwapBuffer]
	and a
	jr z, .start_swap
	ld hl, BattleMonMoves
	call .swap_bytes
	ld hl, BattleMonPP
	call .swap_bytes
	ld hl, PlayerDisableCount
	ld a, [hl]
	swap a
	and $f
	ld b, a
	ld a, [wMenuCursorY]
	cp b
	jr nz, .not_swapping_disabled_move
	ld a, [hl]
	and $f
	ld b, a
	ld a, [wMoveSwapBuffer]
	swap a
	add b
	ld [hl], a
	jr .swap_moves_in_party_struct

.not_swapping_disabled_move
	ld a, [wMoveSwapBuffer]
	cp b
	jr nz, .swap_moves_in_party_struct
	ld a, [hl]
	and $f
	ld b, a
	ld a, [wMenuCursorY]
	swap a
	add b
	ld [hl], a

.swap_moves_in_party_struct
; Fixes the COOLTRAINER glitch
	ld a, [PlayerSubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	jr nz, .transformed
	ld hl, PartyMon1Moves
	ld a, [CurBattleMon]
	call GetPartyLocation
	push hl
	call .swap_bytes
	pop hl
	ld bc, MON_PP - MON_MOVES
	add hl, bc
	call .swap_bytes

.transformed
	xor a
	ld [wMoveSwapBuffer], a
	jp MoveSelectionScreen

.swap_bytes
	push hl
	ld a, [wMoveSwapBuffer]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld a, [wMenuCursorY]
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

.start_swap
	ld a, [wMenuCursorY]
	ld [wMoveSwapBuffer], a
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
	jr z, .not_disabled

	swap a
	and $f
	ld b, a
	ld a, [wMenuCursorY]
	cp b
	jr nz, .not_disabled

	hlcoord 1, 10
	ld de, .Disabled
	call PlaceString
	jr .done

.not_disabled
	ld hl, wMenuCursorY
	dec [hl]
	call SetPlayerTurn
	ld hl, BattleMonMoves
	ld a, [wMenuCursorY]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld [CurPlayerMove], a

	ld a, [CurBattleMon]
	ld [CurPartyMon], a
	ld a, WILDMON
	ld [MonType], a
	callfar GetMaxPPOfMove

	ld hl, wMenuCursorY
	ld c, [hl]
	inc [hl]
	ld b, 0
	ld hl, BattleMonPP
	add hl, bc
	ld a, [hl]
	and $3f
	ld [StringBuffer1], a
	call .PrintPP

	hlcoord 1, 9
	ld de, .Type
	call PlaceString

	hlcoord 7, 11
	ld [hl], "/"

	callfar UpdateMoveData
	ld a, [wPlayerMoveStruct + MOVE_ANIM]
	ld b, a
	hlcoord 2, 10
	predef PrintMoveType

.done
	ret
; 3e74f

.Disabled:
	db "Disabled!@"
.Type:
	db "TYPE/@"
; 3e75f

.PrintPP: ; 3e75f
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
	inc hl
	inc hl
	ld [hl], "/"
	inc hl
	ld de, wNamedObjectIndexBuffer
	lb bc, 1, 2
	call PrintNum
	ret
; 3e786

CheckPlayerHasUsableMoves: ; 3e786
	ld a, STRUGGLE
	ld [CurPlayerMove], a
	ld a, [PlayerDisableCount]
	and a
	ld hl, BattleMonPP
	jr nz, .disabled

	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	inc hl
	or [hl]
	and $3f
	ret nz
	jr .force_struggle

.disabled
	swap a
	and $f
	ld b, a
	ld d, NUM_MOVES + 1
	xor a
.loop
	dec d
	jr z, .done
	ld c, [hl]
	inc hl
	dec b
	jr z, .loop
	or c
	jr .loop

.done
	; Bug: this will result in a move with PP Up confusing the game.
	; Replace with "and $3f" to fix.
	and a
	ret nz

.force_struggle
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
	ld a, [wPlayerAction]
	and a
	call z, LinkBattleSendReceiveAction
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
	call CheckEnemyLockedIn
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
	callfar UpdateMoveData
	call CheckEnemyLockedIn
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

CheckEnemyLockedIn: ; 3e8d1
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

LinkBattleSendReceiveAction: ; 3e8e4
	farcall _LinkBattleSendReceiveAction
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
	jp nz, InitEnemyMon

; and also not in a BattleTower-Battle
	ld a, [InBattleTowerBattle] ; ????
	bit 0, a
	jp nz, InitEnemyMon

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

.WildItem:
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
	cp 1 + (75 percent)
	ld a, NO_ITEM
	jr c, .UpdateItem

; From there, an 8% chance for Item2
	call BattleRandom
	cp 8 percent ; 8% of 25% = 2% Item2
	ld a, [BaseItems]
	jr nc, .UpdateItem
	ld a, [BaseItems+1]

.UpdateItem:
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
	ld hl, wEnemyBackupDVs
	ld de, EnemyMonDVs
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	jp .Happiness

.InitDVs:

; Trainer DVs

; All trainers have preset DVs, determined by class
; See GetTrainerDVs for more on that
	farcall GetTrainerDVs
; These are the DVs we'll use if we're actually in a trainer battle
	ld a, [wBattleMode]
	dec a
	jr nz, .UpdateDVs

; Wild DVs
; Here's where the fun starts

; Roaming monsters (Entei, Raikou) work differently
; They have their own structs, which are shorter than normal
	ld a, [BattleType]
	cp BATTLETYPE_ROAMING
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

.NotRoaming:
; Register a contains BattleType

; Forced shiny battle type
; Used by Red Gyarados at Lake of Rage
	cp BATTLETYPE_SHINY
	jr nz, .GenerateDVs

	ld b, ATKDEFDV_SHINY ; $ea
	ld c, SPDSPCDV_SHINY ; $aa
	jr .UpdateDVs

.GenerateDVs:
; Generate new random DVs
	call BattleRandom
	ld b, a
	call BattleRandom
	ld c, a

.UpdateDVs:
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
	cp UNOWN
	jr nz, .Magikarp

; Get letter based on DVs
	ld hl, EnemyMonDVs
	predef GetUnownLetter
; Can't use any letters that haven't been unlocked
; If combined with forced shiny battletype, causes an infinite loop
	call CheckUnownLetter
	jr c, .GenerateDVs ; try again

.Magikarp:
; These filters are untranslated.
; They expect at wMagikarpLength a 2-byte value in mm,
; but the value is in feet and inches (one byte each).

; The first filter is supposed to make very large Magikarp even rarer,
; by targeting those 1600 mm (= 5'3") or larger.
; After the conversion to feet, it is unable to target any,
; since the largest possible Magikarp is 5'3", and $0503 = 1283 mm.
	ld a, [TempEnemyMonSpecies]
	cp MAGIKARP
	jr nz, .Happiness

; Get Magikarp's length
	ld de, EnemyMonDVs
	ld bc, PlayerID
	callfar CalcMagikarpLength

; No reason to keep going if length > 1536 mm (i.e. if HIGH(length) > 6 feet)
	ld a, [wMagikarpLength]
	cp HIGH(1536) ; should be "cp 5", since 1536 mm = 5'0", but HIGH(1536) = 6
	jr nz, .CheckMagikarpArea

; 5% chance of skipping both size checks
	call Random
	cp 5 percent
	jr c, .CheckMagikarpArea
; Try again if length >= 1616 mm (i.e. if LOW(length) >= 3 inches)
	ld a, [wMagikarpLength + 1]
	cp LOW(1616) ; should be "cp 3", since 1616 mm = 5'3", but LOW(1616) = 80
	jr nc, .GenerateDVs

; 20% chance of skipping this check
	call Random
	cp 20 percent - 1
	jr c, .CheckMagikarpArea
; Try again if length >= 1600 mm (i.e. if LOW(length) >= 2 inches)
	ld a, [wMagikarpLength + 1]
	cp LOW(1600) ; should be "cp 2", since 1600 mm = 5'2", but LOW(1600) = 64
	jr nc, .GenerateDVs

.CheckMagikarpArea:
; The "jr z" checks are supposed to be "jr nz".

; Instead, all maps in GROUP_LAKE_OF_RAGE (Mahogany area)
; and Routes 20 and 44 are treated as Lake of Rage.

; This also means Lake of Rage Magikarp can be smaller than ones
; caught elsewhere rather than the other way around.

; Intended behavior enforces a minimum size at Lake of Rage.
; The real behavior prevents a minimum size in the Lake of Rage area.

; Moreover, due to the check not being translated to feet+inches, all Magikarp
; smaller than 4'0" may be caught by the filter, a lot more than intended.
	ld a, [MapGroup]
	cp GROUP_LAKE_OF_RAGE
	jr z, .Happiness
	ld a, [MapNumber]
	cp MAP_LAKE_OF_RAGE
	jr z, .Happiness
; 40% chance of not flooring
	call Random
	cp 40 percent - 2
	jr c, .Happiness
; Try again if length < 1024 mm (i.e. if HIGH(length) < 3 feet)
	ld a, [wMagikarpLength]
	cp HIGH(1024) ; should be "cp 3", since 1024 mm = 3'4", but HIGH(1024) = 4
	jr c, .GenerateDVs ; try again

; Finally done with DVs

.Happiness:
; Set happiness
	ld a, BASE_HAPPINESS
	ld [EnemyMonHappiness], a
; Set level
	ld a, [CurPartyLevel]
	ld [EnemyMonLevel], a
; Fill stats
	ld de, EnemyMonMaxHP
	ld b, FALSE
	ld hl, EnemyMonDVs - (MON_DVS - MON_STAT_EXP + 1) ; LinkBattleRNs + 7 ; ?
	predef CalcPkmnStats

; If we're in a trainer battle,
; get the rest of the parameters from the party struct
	ld a, [wBattleMode]
	cp TRAINER_BATTLE
	jr z, .OpponentParty

; If we're in a wild battle, check wild-specific stuff
	and a
	jr z, .TreeMon

	ld a, [EnemySubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	jp nz, .Moves

.TreeMon:
; If we're headbutting trees, some monsters enter battle asleep
	call CheckSleepingTreeMon
	ld a, TREEMON_SLEEP_TURNS
	jr c, .UpdateStatus
; Otherwise, no status
	xor a

.UpdateStatus:
	ld hl, EnemyMonStatus
	ld [hli], a

; Unused byte
	xor a
	ld [hli], a

; Full HP..
	ld a, [EnemyMonMaxHP]
	ld [hli], a
	ld a, [EnemyMonMaxHP + 1]
	ld [hl], a

; ..unless it's a RoamMon
	ld a, [BattleType]
	cp BATTLETYPE_ROAMING
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

.InitRoamHP:
; HP only uses the lo byte in the RoamMon struct since
; Raikou/Entei/Suicune will have < 256 hp at level 40
	ld a, [EnemyMonHP + 1]
	ld [hl], a
	jr .Moves

.OpponentParty:
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

.Moves:
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
	cp TRAINER_BATTLE
	jr nz, .WildMoves
; Then copy moves from the party struct
	ld hl, OTPartyMon1Moves
	ld a, [CurPartyMon]
	call GetPartyLocation
	ld bc, NUM_MOVES
	call CopyBytes
	jr .PP

.WildMoves:
; Clear EnemyMonMoves
	xor a
	ld h, d
	ld l, e
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
; Make sure the predef knows this isn't a partymon
	ld [wEvolutionOldSpecies], a
; Fill moves based on level
	predef FillMoves

.PP:
; Trainer battle?
	ld a, [wBattleMode]
	cp TRAINER_BATTLE
	jr z, .TrainerPP

; Fill wild PP
	ld hl, EnemyMonMoves
	ld de, EnemyMonPP
	predef FillPP
	jr .Finish

.TrainerPP:
; Copy PP from the party struct
	ld hl, OTPartyMon1PP
	ld a, [CurPartyMon]
	call GetPartyLocation
	ld de, EnemyMonPP
	ld bc, NUM_MOVES
	call CopyBytes

.Finish:
; Only the first five base stats are copied..
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

; Saw this mon
	ld a, [TempEnemyMonSpecies]
	dec a
	ld c, a
	ld b, SET_FLAG
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
	cp BATTLETYPE_TREE
	jr nz, .NotSleeping

; Get list for the time of day
	ld hl, AsleepTreeMonsMorn
	ld a, [TimeOfDay]
	cp DAY_F
	jr c, .Check
	ld hl, AsleepTreeMonsDay
	jr z, .Check
	ld hl, AsleepTreeMonsNite

.Check:
	ld a, [TempEnemyMonSpecies]
	ld de, 1 ; length of species id
	call IsInArray
; If it's a match, the opponent is asleep
	ret c

.NotSleeping:
	and a
	ret

INCLUDE "data/wild/treemons_asleep.asm"

CheckUnownLetter: ; 3eb75
; Return carry if the Unown letter hasn't been unlocked yet

	ld a, [wUnlockedUnowns]
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
	inc e
	inc e
	ld a, e
	cp .Set1 - .LetterSets
	jr c, .loop

; Hasn't been unlocked, or the letter is invalid
	scf
	ret

.match
; Valid letter
	and a
	ret

.LetterSets:
	dw .Set1
	dw .Set2
	dw .Set3
	dw .Set4

.Set1:
	;  A   B   C   D   E   F   G   H   I   J   K
	db 01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, $ff
.Set2:
	;  L   M   N   O   P   Q   R
	db 12, 13, 14, 15, 16, 17, 18, $ff
.Set3:
	;  S   T   U   V   W
	db 19, 20, 21, 22, 23, $ff
.Set4:
	;  X   Y   Z
	db 24, 25, 26, $ff

; 3ebc7

SwapBattlerLevels: ; 3ebc7
; unreferenced
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

BattleWinSlideInEnemyTrainerFrontpic: ; 3ebd8
	xor a
	ld [TempEnemyMonSpecies], a
	call FinishBattleAnim
	ld a, [OtherTrainerClass]
	ld [TrainerClass], a
	ld de, vTiles2
	callfar GetTrainerPic
	hlcoord 19, 0
	ld c, 0

.outer_loop
	inc c
	ld a, c
	cp 7
	ret z
	xor a
	ld [hBGMapMode], a
	ld [hBGMapThird], a
	ld d, $0
	push bc
	push hl

.inner_loop
	call .CopyColumn
	inc hl
	ld a, 7
	add d
	ld d, a
	dec c
	jr nz, .inner_loop

	ld a, $1
	ld [hBGMapMode], a
	ld c, 4
	call DelayFrames
	pop hl
	pop bc
	dec hl
	jr .outer_loop
; 3ec1a

.CopyColumn: ; 3ec1a
	push hl
	push de
	push bc
	ld e, 7

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
	ld b, $1 ; min speed

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
	ld b, $1 ; min speed

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
	ld b, $1 ; min attack

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
	ld b, $1 ; min attack

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
	sub LOW(MAX_STAT_VALUE)
	ld a, [hQuotient + 1]
	sbc HIGH(MAX_STAT_VALUE)
	jp c, .okay3

	ld a, HIGH(MAX_STAT_VALUE)
	ld [hQuotient + 1], a
	ld a, LOW(MAX_STAT_VALUE)
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

.StatLevelMultipliers:
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

	ld a, [wJohtoBadges]

; Swap badges 3 (PlainBadge) and 5 (MineralBadge).
	ld d, a
	and (1 << PLAINBADGE)
	add a
	add a
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
.CheckBadge:
	ld a, b
	srl b
	call c, BoostStat
	inc hl
	inc hl
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
	sub LOW(MAX_STAT_VALUE)
	ld a, [hl]
	sbc HIGH(MAX_STAT_VALUE)
	ret c
	ld a, HIGH(MAX_STAT_VALUE)
	ld [hli], a
	ld a, LOW(MAX_STAT_VALUE)
	ld [hld], a
	ret
; 3ed9f

_LoadBattleFontsHPBar: ; 3ed9f
	callfar LoadBattleFontsHPBar
	ret
; 3eda6

_LoadHPBar: ; 3eda6
	callfar LoadHPBar
	ret
; 3edad

LoadHPExpBarGFX: ; unreferenced
	ld de, EnemyHPBarBorderGFX
	ld hl, vTiles2 tile $6c
	lb bc, BANK(EnemyHPBarBorderGFX), 4
	call Get1bpp
	ld de, HPExpBarBorderGFX
	ld hl, vTiles2 tile $73
	lb bc, BANK(HPExpBarBorderGFX), 6
	call Get1bpp
	ld de, ExpBarGFX
	ld hl, vTiles2 tile $55
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
; a[n+1] = (a[n] * 5 + 1) % 256
.loop
	; get last #
	ld a, [hl]

	; a * 5 + 1
	ld c, a
	add a
	add a
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
	ld [FXAnimID], a
	ld a, d
	ld [FXAnimID + 1], a
	call WaitBGMap
	predef_jump PlayBattleAnim
; 3ee27

FinishBattleAnim: ; 3ee27
	push af
	push bc
	push de
	push hl
	ld b, SCGB_BATTLE_COLORS
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

	call .EvenlyDivideExpAmongParticipants
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

; give stat exp
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
	inc de
	inc de
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
; Boost Experience for traded Pokemon
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
; Boost experience for a Trainer Battle
	ld [StringBuffer2 + 2], a
	ld a, [wBattleMode]
	dec a
	call nz, BoostExp
; Boost experience for Lucky Egg
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
	call AnimateExpBar
	push bc
	call LoadTileMapToTempTileMap
	pop bc
	ld hl, MON_STAT_EXP - 1
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
	ld [hli], a
	ld [hli], a
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
	callfar CalcExpAtLevel
	pop bc
	ld hl, MON_STAT_EXP - 1
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
	jr c, .not_max_exp
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, d
	ld [hld], a

.not_max_exp
	xor a ; PARTYMON
	ld [MonType], a
	predef CopyPkmnToTempMon
	callfar CalcLevel
	pop bc
	ld hl, MON_LEVEL
	add hl, bc
	ld a, [hl]
	cp MAX_LEVEL
	jp nc, .skip_stats
	cp d
	jp z, .skip_stats
; <NICKNAME> grew to level ##!
	ld [wTempLevel], a
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
	ld hl, MON_STAT_EXP - 1
	add hl, bc
	push bc
	ld b, TRUE
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
	callfar ApplyStatusEffectOnPlayerStats
	callfar BadgeStatBoosts
	callfar UpdatePlayerHUD
	call EmptyBattleTextBox
	call LoadTileMapToTempTileMap
	ld a, $1
	ld [hBGMapMode], a

.skip_animation
	farcall LevelUpHappinessMod
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
	ld bc, 4
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
	ld a, [wTempLevel]
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
	ld b, SET_FLAG
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

.EvenlyDivideExpAmongParticipants:
; count number of battle participants
	ld a, [wBattleParticipantsNotFainted]
	ld b, a
	ld c, PARTY_LENGTH
	ld d, 0
.count_loop
	xor a
	srl b
	adc d
	ld d, a
	dec c
	jr nz, .count_loop
	cp 2
	ret c

	ld [wd265], a
	ld hl, EnemyMonBaseStats
	ld c, EnemyMonEnd - EnemyMonBaseStats
.count_loop2
	xor a
	ld [hDividend + 0], a
	ld a, [hl]
	ld [hDividend + 1], a
	ld a, [wd265]
	ld [hDivisor], a
	ld b, 2
	call Divide
	ld a, [hQuotient + 2]
	ld [hli], a
	dec c
	jr nz, .count_loop2
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

AnimateExpBar: ; 3f136
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
	jr nc, .NoOverflow
	inc [hl]
	jr nz, .NoOverflow
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ld [hl], a

.NoOverflow:
	ld d, MAX_LEVEL
	callfar CalcExpAtLevel
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
	jr c, .AlreadyAtMaxExp
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, d
	ld [hld], a

.AlreadyAtMaxExp:
	callfar CalcLevel
	ld a, d
	pop bc
	pop de
	ld d, a
	cp e
	jr nc, .LoopLevels
	ld a, e
	ld d, a

.LoopLevels:
	ld a, e
	cp MAX_LEVEL
	jr nc, .FinishExpBar
	cp d
	jr z, .FinishExpBar
	inc a
	ld [TempMonLevel], a
	ld [CurPartyLevel], a
	ld [BattleMonLevel], a
	push de
	call .PlayExpBarSound
	ld c, $40
	call .LoopBarAnimation
	call PrintPlayerHUD
	ld hl, BattleMonNick
	ld de, StringBuffer1
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	call TerminateExpBarSound
	ld de, SFX_HIT_END_OF_EXP_BAR
	call PlaySFX
	farcall AnimateEndOfExpBar
	call WaitSFX
	ld hl, BattleText_StringBuffer1GrewToLevel
	call StdBattleTextBox
	pop de
	inc e
	ld b, $0
	jr .LoopLevels

.FinishExpBar:
	push bc
	ld b, d
	ld de, TempMonExp + 2
	call CalcExpBar
	ld a, b
	pop bc
	ld c, a
	call .PlayExpBarSound
	call .LoopBarAnimation
	call TerminateExpBarSound
	pop af
	ld [hProduct + 2], a
	pop af
	ld [hProduct + 3], a

.finish
	pop bc
	ret

.PlayExpBarSound:
	push bc
	call WaitSFX
	ld de, SFX_EXP_BAR
	call PlaySFX
	ld c, 10
	call DelayFrames
	pop bc
	ret

.LoopBarAnimation:
	ld d, 3
	dec b
.anim_loop
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
	jr z, .end_animation
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
	jr nz, .min_number_of_frames
	ld d, 1
.min_number_of_frames
	pop bc
	ld a, c
	cp b
	jr nz, .anim_loop
.end_animation
	ld a, $1
	ld [hBGMapMode], a
	ret

SendOutPkmnText: ; 3f26d
	ld a, [wLinkMode]
	and a
	jr z, .not_linked

	ld hl, JumpText_GoPkmn ; If we're in a LinkBattle print just "Go <PlayerMon>"

	ld a, [wBattleHasJustStarted] ; unless this (unidentified) variable is set
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
Function_TextJump_BattleMonNick01: ; 3f2eb
	ld hl, TextJump_BattleMonNick01
	ret
; 3f2ef

TextJump_BattleMonNick01: ; 3f2ef
	text_jump Text_BattleMonNick01
	db "@"
; 3f2f4

WithdrawPkmnText: ; 3f2f4
	ld hl, .WithdrawPkmnText
	jp BattleTextBox

.WithdrawPkmnText:
	text_jump Text_BattleMonNickComma
	start_asm
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

UnusedFunction_TextJump_ComeBack: ; 3f357
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
	callfar CalcExpAtLevel
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
	callfar CalcExpAtLevel
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

GetBattleMonBackpic: ; 3f43d
	ld a, [PlayerSubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	ld hl, BattleAnimCmd_RaiseSub
	jr nz, GetBattleMonBackpic_DoAnim ; substitute

DropPlayerSub: ; 3f447
	ld a, [wPlayerMinimized]
	and a
	ld hl, BattleAnimCmd_MinimizeOpp
	jr nz, GetBattleMonBackpic_DoAnim
	ld a, [CurPartySpecies]
	push af
	ld a, [BattleMonSpecies]
	ld [CurPartySpecies], a
	ld hl, BattleMonDVs
	predef GetUnownLetter
	ld de, vTiles2 tile $31
	predef GetMonBackpic
	pop af
	ld [CurPartySpecies], a
	ret
; 3f46f

GetBattleMonBackpic_DoAnim: ; 3f46f
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

GetEnemyMonFrontpic: ; 3f47c
	ld a, [EnemySubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	ld hl, BattleAnimCmd_RaiseSub
	jr nz, GetEnemyMonFrontpic_DoAnim

DropEnemySub: ; 3f486
	ld a, [wEnemyMinimized]
	and a
	ld hl, BattleAnimCmd_MinimizeOpp
	jr nz, GetEnemyMonFrontpic_DoAnim

	ld a, [CurPartySpecies]
	push af
	ld a, [EnemyMonSpecies]
	ld [CurSpecies], a
	ld [CurPartySpecies], a
	call GetBaseData
	ld hl, EnemyMonDVs
	predef GetUnownLetter
	ld de, vTiles2
	predef GetAnimatedFrontpicPredef
	pop af
	ld [CurPartySpecies], a
	ret
; 3f4b4

GetEnemyMonFrontpic_DoAnim: ; 3f4b4
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
	call DoBattle
	call ExitBattle
	pop af
	ld [TimeOfDayPal], a
	scf
	ret
; 3f4d9

_DoBattle: ; 3f4d9
; unreferenced
	call DoBattle
	ret
; 3f4dd

BattleIntro: ; 3f4dd
	farcall TrainerRankings_Battles ; mobile
	call LoadTrainerOrWildMonPic
	xor a
	ld [TempBattleMonSpecies], a
	ld [wBattleMenuCursorBuffer], a
	xor a
	ld [hMapAnims], a
	farcall PlayBattleMusic
	farcall ShowLinkBattleParticipants
	farcall FindFirstAliveMonAndStartBattle
	call DisableSpriteUpdates
	farcall ClearBattleRAM
	call InitEnemy
	call BackUpBGMap2
	ld b, SCGB_BATTLE_GRAYSCALE
	call GetSGBLayout
	ld hl, rLCDC
	res rLCDC_WINDOW_TILEMAP, [hl] ; select 9800-9BFF
	call InitBattleDisplay
	call BattleStartMessage
	ld hl, rLCDC
	set rLCDC_WINDOW_TILEMAP, [hl] ; select 9C00-9FFF
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
	cp WILD_BATTLE
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

.Trainer:
	ld [TempEnemyMonSpecies], a
	ret
; 3f55e

InitEnemy: ; 3f55e
	ld a, [OtherTrainerClass]
	and a
	jp nz, InitEnemyTrainer ; trainer
	jp InitEnemyWildmon ; wild
; 3f568

BackUpBGMap2: ; 3f568
	ld a, [rSVBK]
	push af
	ld a, $6 ; BANK(wDecompressScratch)
	ld [rSVBK], a
	ld hl, wDecompressScratch
	ld bc, $40 tiles ; vBGMap3 - vBGMap2
	ld a, $2
	call ByteFill
	ld a, [rVBK]
	push af
	ld a, $1
	ld [rVBK], a
	ld de, wDecompressScratch
	hlbgcoord 0, 0 ; vBGMap2
	lb bc, BANK(BackUpBGMap2), $40
	call Request2bpp
	pop af
	ld [rVBK], a
	pop af
	ld [rSVBK], a
	ret
; 3f594

InitEnemyTrainer: ; 3f594
	ld [TrainerClass], a
	farcall TrainerRankings_TrainerBattles
	xor a
	ld [TempEnemyMonSpecies], a
	callfar GetTrainerAttributes
	callfar ReadTrainerParty

	ld a, [TrainerClass]
	cp RIVAL1
	jr nz, .ok
	xor a
	ld [OTPartyMon1Item], a
.ok

	ld de, vTiles2
	callfar GetTrainerPic
	xor a
	ld [hGraphicStartTile], a
	dec a
	ld [wEnemyItemState], a
	hlcoord 12, 0
	lb bc, 7, 7
	predef PlaceGraphic
	ld a, -1
	ld [CurOTMon], a
	ld a, TRAINER_BATTLE
	ld [wBattleMode], a

	call IsGymLeader
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
	callfar ChangeHappiness
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
	ld a, WILD_BATTLE
	ld [wBattleMode], a
	farcall TrainerRankings_WildBattles
	call LoadEnemyMon
	ld hl, EnemyMonMoves
	ld de, wWildMonMoves
	ld bc, NUM_MOVES
	call CopyBytes
	ld hl, EnemyMonPP
	ld de, wWildMonPP
	ld bc, NUM_MOVES
	call CopyBytes
	ld hl, EnemyMonDVs
	predef GetUnownLetter
	ld a, [CurPartySpecies]
	cp UNOWN
	jr nz, .skip_unown
	ld a, [wFirstUnownSeen]
	and a
	jr nz, .skip_unown
	ld a, [UnownLetter]
	ld [wFirstUnownSeen], a
.skip_unown
	ld de, vTiles2
	predef GetAnimatedFrontpicPredef
	xor a
	ld [TrainerClass], a
	ld [hGraphicStartTile], a
	hlcoord 12, 0
	lb bc, 7, 7
	predef PlaceGraphic
	ret
; 3f662

Function3f662: ; 3f662
; XXX
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
	call .HandleEndOfBattle
	call CleanUpBattleRAM
	ret
; 3f6a5

.HandleEndOfBattle: ; 3f6a5
	ld a, [wLinkMode]
	and a
	jr z, .not_linked
	call ShowLinkBattleParticipantsAfterEnd
	ld c, 150
	call DelayFrames
	call DisplayLinkBattleResult
	ret

.not_linked
	ld a, [wBattleResult]
	and $f
	ret nz
	call CheckPayDay
	xor a
	ld [wForceEvolution], a
	predef EvolveAfterBattle
	farcall GivePokerusAndConvertBerries
	ret
; 3f6d0

CleanUpBattleRAM: ; 3f6d0
	call BattleEnd_HandleRoamMons
	xor a
	ld [Danger], a
	ld [wBattleMode], a
	ld [BattleType], a
	ld [AttackMissed], a
	ld [TempWildMonSpecies], a
	ld [OtherTrainerClass], a
	ld [wFailedToFlee], a
	ld [wNumFleeAttempts], a
	ld [wForcedSwitch], a
	ld [wPartyMenuCursor], a
	ld [wKeyItemsPocketCursor], a
	ld [wItemsPocketCursor], a
	ld [wBattleMenuCursorBuffer], a
	ld [CurMoveNum], a
	ld [wBallsPocketCursor], a
	ld [wLastPocket], a
	ld [wMenuScrollPosition], a
	ld [wKeyItemsPocketScrollPosition], a
	ld [wItemsPocketScrollPosition], a
	ld [wBallsPocketScrollPosition], a
	ld hl, PlayerSubStatus1
	ld b, EnemyFuryCutterCount - PlayerSubStatus1
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
	ld a, [wAmuletCoin]
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
	ld [hli], a
	ld [hli], a
	ld [hl], a

.okay
	ld hl, wPayDayMoney + 2
	ld de, Money + 2
	call AddBattleMoneyToAccount
	ld hl, BattleText_PlayerPickedUpPayDayMoney
	call StdBattleTextBox
	ld a, [InBattleTowerBattle]
	bit 0, a
	ret z
	call ClearTileMap
	call ClearBGPalettes
	ret
; 3f759

ShowLinkBattleParticipantsAfterEnd: ; 3f759
	farcall TrainerRankings_LinkBattles
	farcall BackupMobileEventIndex
	ld a, [CurOTMon]
	ld hl, OTPartyMon1Status
	call GetPartyLocation
	ld a, [EnemyMonStatus]
	ld [hl], a
	call ClearTileMap
	farcall _ShowLinkBattleParticipants
	ret
; 3f77c

DisplayLinkBattleResult: ; 3f77c
	farcall CheckMobileBattleError
	jp c, .Mobile_InvalidBattle
	call IsMobileBattle2
	jr nz, .proceed

	ld hl, wcd2a
	bit 4, [hl]
	jr z, .proceed

	farcall DetermineLinkBattleResult

.proceed
	ld a, [wBattleResult]
	and $f
	cp $1
	jr c, .victory
	jr z, .loss
	farcall TrainerRankings_ColosseumDraws
	ld de, .Draw
	jr .store_result

.victory
	farcall TrainerRankings_ColosseumWins
	ld de, .Win
	jr .store_result

.loss
	farcall TrainerRankings_ColosseumLosses
	ld de, .Lose
	jr .store_result

.store_result
	hlcoord 6, 8
	call PlaceString
	farcall BackupMobileEventIndex
	ld c, 200
	call DelayFrames

	ld a, BANK(sLinkBattleStats)
	call GetSRAMBank

	call AddLastMobileBattleToLinkRecord
	call ReadAndPrintLinkBattleRecord

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

.Win:
	db "YOU WIN@"
.Lose:
	db "YOU LOSE@"
.Draw:
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

.Invalid:
	db "INVALID BATTLE@"
; 3f830

IsMobileBattle2: ; 3f830
	ld a, [wLinkMode]
	cp LINK_MOBILE
	ret
; 3f836

DisplayLinkRecord: ; 3f836
	ld a, BANK(sLinkBattleStats)
	call GetSRAMBank

	call ReadAndPrintLinkBattleRecord

	call CloseSRAM
	hlcoord 0, 0, AttrMap
	xor a
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	call WaitBGMap2
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetPalettes
	ld c, 8
	call DelayFrames
	call WaitPressAorB_BlinkCursor
	ret
; 3f85f

ReadAndPrintLinkBattleRecord: ; 3f85f
	call ClearTileMap
	call ClearSprites
	call .PrintBattleRecord
	hlcoord 0, 8
	ld b, 5
	ld de, sLinkBattleRecord + 2
.loop
	push bc
	push hl
	push de
	ld a, [de]
	and a
	jr z, .PrintFormatString
	ld a, [wSavedAtLeastOnce]
	and a
	jr z, .PrintFormatString
	push hl
	push hl
	ld h, d
	ld l, e
	ld de, wd002
	ld bc, 10
	call CopyBytes
	ld a, "@"
	ld [de], a
	inc de
	ld bc, 6
	call CopyBytes
	ld de, wd002
	pop hl
	call PlaceString
	pop hl
	ld de, 26
	add hl, de
	push hl
	ld de, wd00d
	lb bc, 2, 4
	call PrintNum
	pop hl
	ld de, 5
	add hl, de
	push hl
	ld de, wd00f
	lb bc, 2, 4
	call PrintNum
	pop hl
	ld de, 5
	add hl, de
	ld de, wd011
	lb bc, 2, 4
	call PrintNum
	jr .next

.PrintFormatString:
	ld de, .Format
	call PlaceString
.next
	pop hl
	ld bc, 18
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld bc, 2 * SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .loop
	ret

.PrintBattleRecord:
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
	call .PrintZerosIfNoSaveFileExists
	jr c, .quit

	lb bc, 2, 4
	call PrintNum

	hlcoord 11, 4
	ld de, sLinkBattleLosses
	call .PrintZerosIfNoSaveFileExists

	lb bc, 2, 4
	call PrintNum

	hlcoord 16, 4
	ld de, sLinkBattleDraws
	call .PrintZerosIfNoSaveFileExists

	lb bc, 2, 4
	call PrintNum

.quit
	ret

.PrintZerosIfNoSaveFileExists:
	ld a, [wSavedAtLeastOnce]
	and a
	ret nz
	ld de, .Scores
	call PlaceString
	scf
	ret
; 3f938

.Scores:
	db "   0    0    0@"
; 3f947

.Format: ; 3f947
	db "  ---  <LNBRK>"
	db "         -    -    -@"
.Record: ; 3f964
	db "<PLAYER>'s RECORD@"
.Result: ; 3f96e
	db "RESULT WIN LOSE DRAW@"
.Total: ; 3f983
	db "TOTAL  WIN LOSE DRAW@"
; 3f998

BattleEnd_HandleRoamMons: ; 3f998
	ld a, [BattleType]
	cp BATTLETYPE_ROAMING
	jr nz, .not_roaming
	ld a, [wBattleResult]
	and $f
	jr z, .caught_or_defeated_roam_mon
	call GetRoamMonHP
	ld a, [EnemyMonHP + 1]
	ld [hl], a
	jr .update_roam_mons

.caught_or_defeated_roam_mon
	call GetRoamMonHP
	ld [hl], $0
	call GetRoamMonMapGroup
	ld [hl], $ff
	call GetRoamMonMapNumber
	ld [hl], $ff
	call GetRoamMonSpecies
	ld [hl], $0
	ret

.not_roaming
	call BattleRandom
	and $f
	ret nz

.update_roam_mons
	callfar UpdateRoamMons
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

AddLastMobileBattleToLinkRecord: ; 3fa42
	ld hl, OTPlayerID
	ld de, StringBuffer1
	ld bc, 2
	call CopyBytes
	ld hl, OTPlayerName
	ld bc, NAME_LENGTH - 1
	call CopyBytes
	ld hl, sLinkBattleResults
	call .StoreResult
	ld hl, sLinkBattleRecord
	ld d, 5
.loop
	push hl
	inc hl
	inc hl
	ld a, [hl]
	dec hl
	dec hl
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
	call .StoreResult
	call .FindOpponentAndAppendRecord
	ret
; 3faa0
.StoreResult: ; 3faa0
	ld a, [wBattleResult]
	and $f
	cp $1
	ld bc, sLinkBattleWins + 1 - sLinkBattleResults
	jr c, .okay
	ld bc, sLinkBattleLosses + 1 - sLinkBattleResults
	jr z, .okay
	ld bc, sLinkBattleDraws + 1 - sLinkBattleResults
.okay
	add hl, bc
	call .CheckOverflow
	ret nc
	inc [hl]
	ret nz
	dec hl
	inc [hl]
	ret
; 3fabe

.CheckOverflow: ; 3fabe
	dec hl
	ld a, [hl]
	inc hl
	cp HIGH(MAX_LINK_RECORD)
	ret c
	ld a, [hl]
	cp LOW(MAX_LINK_RECORD)
	ret
; 3fac8

.FindOpponentAndAppendRecord: ; 3fac8
	ld b, 5
	ld hl, sLinkBattleRecord + 17
	ld de, wd002
.loop3
	push bc
	push de
	push hl
	call .LoadPointer
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
	jr nz, .loop3
	ld b, $0
	ld c, $1
.loop4
	ld a, b
	add b
	add b
	ld e, a
	ld d, $0
	ld hl, wd002
	add hl, de
	push hl
	ld a, c
	add c
	add c
	ld e, a
	ld d, $0
	ld hl, wd002
	add hl, de
	ld d, h
	ld e, l
	pop hl
	push bc
	ld c, 3
	call StringCmp
	pop bc
	jr z, .equal
	jr nc, .done2

.equal
	inc c
	ld a, c
	cp $5
	jr nz, .loop4
	inc b
	ld c, b
	inc c
	ld a, b
	cp $4
	jr nz, .loop4
	ret

.done2
	push bc
	ld a, b
	ld bc, 18
	ld hl, sLinkBattleRecord
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
	ld hl, sLinkBattleRecord
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

.LoadPointer: ; 3fb54
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
	jr nc, .okay2
	inc e

.okay2
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
	farcall MobileTextBorder
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
	farcall BattleIntroSlidingPics
	ld a, $1
	ld [hBGMapMode], a
	ld a, $31
	ld [hGraphicStartTile], a
	hlcoord 2, 6
	lb bc, 6, 6
	predef PlaceGraphic
	xor a
	ld [hWY], a
	ld [rWY], a
	call WaitBGMap
	call HideSprites
	ld b, SCGB_BATTLE_COLORS
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

	ld hl, wDecompressScratch
	ld bc, wScratchAttrMap - wDecompressScratch
	ld a, " "
	call ByteFill

	ld de, wDecompressScratch
	hlbgcoord 0, 0
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
; Load the player character's backpic (6x6) into VRAM starting from vTiles2 tile $31.

; Special exception for Dude.
	ld b, BANK(DudeBackpic)
	ld hl, DudeBackpic
	ld a, [BattleType]
	cp BATTLETYPE_TUTORIAL
	jr z, .Decompress

; What gender are we?
	ld a, [wPlayerSpriteSetupFlags]
	bit 2, a ; transformed to male
	jr nz, .Chris
	ld a, [wPlayerGender]
	bit 0, a
	jr z, .Chris

; It's a girl.
	farcall GetKrisBackpic
	ret

.Chris:
; It's a boy.
	ld b, BANK(ChrisBackpic)
	ld hl, ChrisBackpic

.Decompress:
	ld de, vTiles2 tile $31
	ld c, $31
	predef DecompressPredef
	ret
; 3fc30

CopyBackpic: ; 3fc30
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a
	ld hl, vTiles0
	ld de, vTiles2 tile $31
	ld a, [hROMBank]
	ld b, a
	ld c, $31
	call Get2bpp
	pop af
	ld [rSVBK], a
	call .LoadTrainerBackpicAsOAM
	ld a, $31
	ld [hGraphicStartTile], a
	hlcoord 2, 6
	lb bc, 6, 6
	predef PlaceGraphic
	ret
; 3fc5b

.LoadTrainerBackpicAsOAM: ; 3fc5b
	ld hl, Sprites
	xor a
	ld [hMapObjectIndexBuffer], a
	ld b, $6
	ld e, 21 * 8
.outer_loop
	ld c, $3
	ld d, 8 * 8
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

	farcall Battle_GetTrainerName

	ld hl, WantsToBattleText
	jr .PlaceBattleStartText

.wild
	call BattleCheckEnemyShininess
	jr nc, .not_shiny

	xor a
	ld [wNumHits], a
	ld a, 1
	ld [hBattleTurn], a
	ld a, 1
	ld [wBattleAnimParam], a
	ld de, ANIM_SEND_OUT_MON
	call Call_PlayBattleAnim

.not_shiny
	farcall CheckSleepingTreeMon
	jr c, .skip_cry

	farcall CheckBattleScene
	jr c, .cry_no_anim

	hlcoord 12, 0
	ld d, $0
	ld e, ANIM_MON_NORMAL
	predef AnimateFrontpic
	jr .skip_cry ; cry is played during the animation

.cry_no_anim
	ld a, $0f
	ld [CryTracks], a
	ld a, [TempEnemyMonSpecies]
	call PlayStereoCry

.skip_cry
	ld a, [BattleType]
	cp BATTLETYPE_FISH
	jr nz, .NotFishing

	farcall TrainerRankings_HookedEncounters

	ld hl, HookedPokemonAttackedText
	jr .PlaceBattleStartText

.NotFishing:
	ld hl, PokemonFellFromTreeText
	cp BATTLETYPE_TREE
	jr z, .PlaceBattleStartText
	ld hl, WildCelebiAppearedText
	cp BATTLETYPE_CELEBI
	jr z, .PlaceBattleStartText
	ld hl, WildPokemonAppearedText

.PlaceBattleStartText:
	push hl
	farcall BattleStart_TrainerHuds
	pop hl
	call StdBattleTextBox

	call IsMobileBattle2
	ret nz

	ld c, $2 ; start
	farcall Mobile_PrintOpponentBattleMessage

	ret
; 3fd26
