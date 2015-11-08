DoPlayerTurn: ; 34000
	call SetPlayerTurn

	ld a, [wd0ec]
	and a
	ret nz

	jr DoTurn
; 3400a


DoEnemyTurn: ; 3400a
	call SetEnemyTurn

	ld a, [wLinkMode]
	and a
	jr z, DoTurn

	ld a, [wBattleAction]
	cp BATTLEACTION_E
	jr z, DoTurn
	cp BATTLEACTION_SWITCH1
	ret nc

	; fallthrough
; 3401d


DoTurn: ; 3401d
; Read in and execute the user's move effects for this turn.

	xor a
	ld [wc6b4], a

	; Effect command checkturn is called for every move.
	call CheckTurn

	ld a, [wc6b4]
	and a
	ret nz

	call UpdateMoveData
; 3402c


DoMove: ; 3402c
; Get the user's move effect.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	ld c, a
	ld b, 0
	ld hl, MoveEffectsPointers
rept 2
	add hl, bc
endr
	ld a, BANK(MoveEffectsPointers)
	call GetFarHalfword

	ld de, BattleScriptBuffer

.GetMoveEffect
	ld a, BANK(MoveEffects)
	call GetFarByte
	inc hl
	ld [de], a
	inc de
	cp $ff
	jr nz, .GetMoveEffect

; Start at the first command.
	ld hl, BattleScriptBuffer
	ld a, l
	ld [BattleScriptBufferLoc], a
	ld a, h
	ld [BattleScriptBufferLoc + 1], a

.ReadMoveEffectCommand

; ld a, [BattleScriptBufferLoc++]
	ld a, [BattleScriptBufferLoc]
	ld l, a
	ld a, [BattleScriptBufferLoc + 1]
	ld h, a

	ld a, [hli]

	push af
	ld a, l
	ld [BattleScriptBufferLoc], a
	ld a, h
	ld [BattleScriptBufferLoc + 1], a
	pop af

; endturn_command (-2) is used to terminate branches without ending the read cycle.
	cp endturn_command
	ret nc

; The rest of the commands (01-af) are read from BattleCommandPointers.
	push bc
	dec a
	ld c, a
	ld b, 0
	ld hl, BattleCommandPointers
rept 2
	add hl, bc
endr
	pop bc

	ld a, BANK(BattleCommandPointers)
	call GetFarHalfword

	call .DoMoveEffectCommand

	jr .ReadMoveEffectCommand

.DoMoveEffectCommand
	jp [hl]
; 34084


CheckTurn:
BattleCommand_CheckTurn: ; 34084
; checkturn

; Repurposed as hardcoded turn handling. Useless as a command.

; Move $ff immediately ends the turn.
	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	inc a
	jp z, Function34385

	xor a
	ld [AttackMissed], a
	ld [EffectFailed], a
	ld [wKickCounter], a
	ld [AlreadyDisobeyed], a
	ld [AlreadyFailed], a
	ld [wc73e], a

	ld a, 10 ; 1.0
	ld [TypeModifier], a

	ld a, [hBattleTurn]
	and a
	jp nz, CheckEnemyTurn


CheckPlayerTurn:

	ld hl, PlayerSubStatus4
	bit SUBSTATUS_RECHARGE, [hl]
	jr z, .no_recharge

	res SUBSTATUS_RECHARGE, [hl]
	ld hl, MustRechargeText
	call StdBattleTextBox
	call CantMove
	jp Function34385

.no_recharge


	ld hl, BattleMonStatus
	ld a, [hl]
	and SLP
	jr z, .not_asleep

	dec a
	ld [BattleMonStatus], a
	and SLP
	jr z, .woke_up

	xor a
	ld [wcfca], a
	ld de, ANIM_SLP
	call FarPlayBattleAnimation
	jr .fast_asleep

.woke_up
	ld hl, WokeUpText
	call StdBattleTextBox
	call CantMove
	call UpdateBattleMonInParty
	ld hl, UpdatePlayerHUD
	call CallBattleCore
	ld a, $1
	ld [$ffd4], a
	ld hl, PlayerSubStatus1
	res SUBSTATUS_NIGHTMARE, [hl]
	jr .not_asleep

.fast_asleep
	ld hl, FastAsleepText
	call StdBattleTextBox

	; Snore and Sleep Talk bypass sleep.
	ld a, [CurPlayerMove]
	cp SNORE
	jr z, .not_asleep
	cp SLEEP_TALK
	jr z, .not_asleep

	call CantMove
	jp Function34385

.not_asleep


	ld hl, BattleMonStatus
	bit FRZ, [hl]
	jr z, .not_frozen

	; Flame Wheel and Sacred Fire thaw the user.
	ld a, [CurPlayerMove]
	cp FLAME_WHEEL
	jr z, .not_frozen
	cp SACRED_FIRE
	jr z, .not_frozen

	ld hl, FrozenSolidText
	call StdBattleTextBox

	call CantMove
	jp Function34385

.not_frozen


	ld hl, PlayerSubStatus3
	bit SUBSTATUS_FLINCHED, [hl]
	jr z, .not_flinched

	res SUBSTATUS_FLINCHED, [hl]
	ld hl, FlinchedText
	call StdBattleTextBox

	call CantMove
	jp Function34385

.not_flinched


	ld hl, PlayerDisableCount
	ld a, [hl]
	and a
	jr z, .not_disabled

	dec a
	ld [hl], a
	and $f
	jr nz, .not_disabled

	ld [hl], a
	ld [DisabledMove], a
	ld hl, DisabledNoMoreText
	call StdBattleTextBox

.not_disabled


	ld a, [PlayerSubStatus3]
	add a
	jr nc, .not_confused
	ld hl, PlayerConfuseCount
	dec [hl]
	jr nz, .confused

	ld hl, PlayerSubStatus3
	res SUBSTATUS_CONFUSED, [hl]
	ld hl, ConfusedNoMoreText
	call StdBattleTextBox
	jr .not_confused

.confused
	ld hl, IsConfusedText
	call StdBattleTextBox
	xor a
	ld [wcfca], a
	ld de, ANIM_CONFUSED
	call FarPlayBattleAnimation

	; 50% chance of hitting itself
	call BattleRandom
	cp $80
	jr nc, .not_confused

	; clear confusion-dependent substatus
	ld hl, PlayerSubStatus3
	ld a, [hl]
	and 1 << SUBSTATUS_CONFUSED
	ld [hl], a

	call HitConfusion
	call CantMove
	jp Function34385

.not_confused


	ld a, [PlayerSubStatus1]
	add a ; bit SUBSTATUS_ATTRACT
	jr nc, .not_infatuated

	ld hl, InLoveWithText
	call StdBattleTextBox
	xor a
	ld [wcfca], a
	ld de, ANIM_IN_LOVE
	call FarPlayBattleAnimation

	; 50% chance of infatuation
	call BattleRandom
	cp $80
	jr c, .not_infatuated

	ld hl, InfatuationText
	call StdBattleTextBox
	call CantMove
	jp Function34385

.not_infatuated


	; We can't disable a move that doesn't exist.
	ld a, [DisabledMove]
	and a
	jr z, .no_disabled_move

	; Are we using the disabled move?
	ld hl, CurPlayerMove
	cp [hl]
	jr nz, .no_disabled_move

	call MoveDisabled
	call CantMove
	jp Function34385

.no_disabled_move


	ld hl, BattleMonStatus
	bit PAR, [hl]
	ret z

	; 25% chance to be fully paralyzed
	call BattleRandom
	cp $3f
	ret nc

	ld hl, FullyParalyzedText
	call StdBattleTextBox
	call CantMove
	jp Function34385
; 341f0


CantMove: ; 341f0
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	res SUBSTATUS_ROLLOUT, [hl]

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	ld a, [hl]
	and $ff ^ (1<<SUBSTATUS_BIDE + 1<<SUBSTATUS_RAMPAGE + 1<<SUBSTATUS_CHARGED)
	ld [hl], a

	call ResetFuryCutterCount

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	cp FLY
	jr z, .fly_dig

	cp DIG
	ret nz

.fly_dig
	res SUBSTATUS_UNDERGROUND, [hl]
	res SUBSTATUS_FLYING, [hl]
	jp Function37ece
; 34216



OpponentCantMove: ; 34216
	call BattleCommand_SwitchTurn
	call CantMove
	jp BattleCommand_SwitchTurn
; 3421f



CheckEnemyTurn: ; 3421f

	ld hl, EnemySubStatus4
	bit SUBSTATUS_RECHARGE, [hl]
	jr z, .no_recharge

	res SUBSTATUS_RECHARGE, [hl]
	ld hl, MustRechargeText
	call StdBattleTextBox
	call CantMove
	jp Function34385

.no_recharge


	ld hl, EnemyMonStatus
	ld a, [hl]
	and SLP
	jr z, .not_asleep

	dec a
	ld [EnemyMonStatus], a
	and a
	jr z, .woke_up

	ld hl, FastAsleepText
	call StdBattleTextBox
	xor a
	ld [wcfca], a
	ld de, ANIM_SLP
	call FarPlayBattleAnimation
	jr .fast_asleep

.woke_up
	ld hl, WokeUpText
	call StdBattleTextBox
	call CantMove
	call UpdateEnemyMonInParty
	ld hl, UpdateEnemyHUD
	call CallBattleCore
	ld a, $1
	ld [$ffd4], a
	ld hl, EnemySubStatus1
	res SUBSTATUS_NIGHTMARE, [hl]
	jr .not_asleep

.fast_asleep
	; Snore and Sleep Talk bypass sleep.
	ld a, [CurEnemyMove]
	cp SNORE
	jr z, .not_asleep
	cp SLEEP_TALK
	jr z, .not_asleep
	call CantMove
	jp Function34385

.not_asleep


	ld hl, EnemyMonStatus
	bit FRZ, [hl]
	jr z, .not_frozen
	ld a, [CurEnemyMove]
	cp FLAME_WHEEL
	jr z, .not_frozen
	cp SACRED_FIRE
	jr z, .not_frozen

	ld hl, FrozenSolidText
	call StdBattleTextBox
	call CantMove
	jp Function34385

.not_frozen


	ld hl, EnemySubStatus3
	bit SUBSTATUS_FLINCHED, [hl]
	jr z, .not_flinched

	res SUBSTATUS_FLINCHED, [hl]
	ld hl, FlinchedText
	call StdBattleTextBox

	call CantMove
	jp Function34385

.not_flinched


	ld hl, EnemyDisableCount
	ld a, [hl]
	and a
	jr z, .not_disabled

	dec a
	ld [hl], a
	and $f
	jr nz, .not_disabled

	ld [hl], a
	ld [EnemyDisabledMove], a

	ld hl, DisabledNoMoreText
	call StdBattleTextBox

.not_disabled


	ld a, [EnemySubStatus3]
	add a ; bit SUBSTATUS_CONFUSED
	jr nc, .not_confused

	ld hl, EnemyConfuseCount
	dec [hl]
	jr nz, .confused

	ld hl, EnemySubStatus3
	res SUBSTATUS_CONFUSED, [hl]
	ld hl, ConfusedNoMoreText
	call StdBattleTextBox
	jr .not_confused


.confused
	ld hl, IsConfusedText
	call StdBattleTextBox

	xor a
	ld [wcfca], a
	ld de, ANIM_CONFUSED
	call FarPlayBattleAnimation

	; 50% chance of hitting itself
	call BattleRandom
	cp $80
	jr nc, .not_confused

	; clear confusion-dependent substatus
	ld hl, EnemySubStatus3
	ld a, [hl]
	and 1 << SUBSTATUS_CONFUSED
	ld [hl], a

	ld hl, HurtItselfText
	call StdBattleTextBox
	call Function355dd
	call BattleCommand_DamageCalc
	call BattleCommand_LowerSub
	xor a
	ld [wcfca], a

	; Flicker the monster pic unless flying or underground.
	ld de, ANIM_HIT_CONFUSION
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	call z, PlayFXAnimID

	ld c, $1
	call Function35d1c
	call BattleCommand_RaiseSub
	call CantMove
	jp Function34385

.not_confused


	ld a, [EnemySubStatus1]
	add a ; bit SUBSTATUS_ATTRACT
	jr nc, .not_infatuated

	ld hl, InLoveWithText
	call StdBattleTextBox
	xor a
	ld [wcfca], a
	ld de, ANIM_IN_LOVE
	call FarPlayBattleAnimation

	; 50% chance of infatuation
	call BattleRandom
	cp $80
	jr c, .not_infatuated

	ld hl, InfatuationText
	call StdBattleTextBox
	call CantMove
	jp Function34385

.not_infatuated


	; We can't disable a move that doesn't exist.
	ld a, [EnemyDisabledMove]
	and a
	jr z, .no_disabled_move

	; Are we using the disabled move?
	ld hl, CurEnemyMove
	cp [hl]
	jr nz, .no_disabled_move

	call MoveDisabled

	call CantMove
	jp Function34385

.no_disabled_move


	ld hl, EnemyMonStatus
	bit PAR, [hl]
	ret z

	; 25% chance to be fully paralyzed
	call BattleRandom
	cp $3f
	ret nc

	ld hl, FullyParalyzedText
	call StdBattleTextBox
	call CantMove

	; fallthrough
; 34385


Function34385: ; 34385
	ld a, $1
	ld [wc6b4], a
	jp ResetDamage
; 3438d


MoveDisabled: ; 3438d

	; Make sure any charged moves fail
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	res SUBSTATUS_CHARGED, [hl]

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld [wNamedObjectIndexBuffer], a
	call GetMoveName

	ld hl, DisabledMoveText
	jp StdBattleTextBox
; 343a5


HitConfusion: ; 343a5

	ld hl, HurtItselfText
	call StdBattleTextBox

	xor a
	ld [CriticalHit], a

	call Function355dd
	call BattleCommand_DamageCalc
	call BattleCommand_LowerSub

	xor a
	ld [wcfca], a

	; Flicker the monster pic unless flying or underground.
	ld de, ANIM_HIT_CONFUSION
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	call z, PlayFXAnimID

	ld hl, UpdatePlayerHUD
	call CallBattleCore
	ld a, $1
	ld [$ffd4], a
	ld c, $1
	call Function35d7e
	jp BattleCommand_RaiseSub
; 343db


BattleCommand_CheckObedience: ; 343db
; checkobedience

	; Enemy can't disobey
	ld a, [hBattleTurn]
	and a
	ret nz

	call Function34548
	ret nz

	; If we've already checked this turn
	ld a, [AlreadyDisobeyed]
	and a
	ret nz

	xor a
	ld [AlreadyDisobeyed], a

	; No obedience in link battles
	; (since no handling exists for enemy)
	ld a, [wLinkMode]
	and a
	ret nz

	ld a, [InBattleTowerBattle]
	and a
	ret nz

	; If the monster's id doesn't match the player's,
	; some conditions need to be met.
	ld a, MON_ID
	call BattlePartyAttr

	ld a, [PlayerID]
	cp [hl]
	jr nz, .obeylevel
	inc hl
	ld a, [PlayerID + 1]
	cp [hl]
	ret z


.obeylevel
	; The maximum obedience level is constrained by owned badges:
	ld hl, JohtoBadges

	; risingbadge
	bit RISINGBADGE, [hl]
	ld a, MAX_LEVEL + 1
	jr nz, .getlevel

	; stormbadge
	bit STORMBADGE, [hl]
	ld a, 70
	jr nz, .getlevel

	; fogbadge
	bit FOGBADGE, [hl]
	ld a, 50
	jr nz, .getlevel

	; hivebadge
	bit HIVEBADGE, [hl]
	ld a, 30
	jr nz, .getlevel

	; no badges
	ld a, 10


.getlevel
; c = obedience level
; d = monster level
; b = c + d

	ld b, a
	ld c, a

	ld a, [BattleMonLevel]
	ld d, a

	add b
	ld b, a

; No overflow (this should never happen)
	jr nc, .checklevel
	ld b, $ff


.checklevel
; If the monster's level is lower than the obedience level, it will obey.
	ld a, c
	cp d
	ret nc


; Random number from 0 to obedience level + monster level
.rand1
	call BattleRandom
	swap a
	cp b
	jr nc, .rand1

; The higher above the obedience level the monster is,
; the more likely it is to disobey.
	cp c
	ret c

; Sleep-only moves have separate handling, and a higher chance of
; being ignored. Lazy monsters like their sleep.
	call IgnoreSleepOnly
	ret c


; Another random number from 0 to obedience level + monster level
.rand2
	call BattleRandom
	cp b
	jr nc, .rand2

; A second chance.
	cp c
	jr c, .UseInstead


; No hope of using a move now.

; b = number of levels the monster is above the obedience level
	ld a, d
	sub c
	ld b, a

; The chance of napping is the difference out of 256.
	call BattleRandom
	swap a
	sub b
	jr c, .Nap

; The chance of not hitting itself is the same.
	cp b
	jr nc, .DoNothing

	ld hl, WontObeyText
	call StdBattleTextBox
	call HitConfusion
	jp .asm_3450c


.Nap
	call BattleRandom
	add a
	swap a
	and SLP
	jr z, .Nap

	ld [BattleMonStatus], a

	ld hl, BeganToNapText
	jr .Print


.DoNothing
	call BattleRandom
	and 3

	ld hl, LoafingAroundText
	and a
	jr z, .Print

	ld hl, WontObeyText
	dec a
	jr z, .Print

	ld hl, TurnedAwayText
	dec a
	jr z, .Print

	ld hl, IgnoredOrdersText

.Print
	call StdBattleTextBox
	jp .asm_3450c


.UseInstead

; Can't use another move if the monster only has one!
	ld a, [BattleMonMoves + 1]
	and a
	jr z, .DoNothing

; Don't bother trying to handle Disable.
	ld a, [DisabledMove]
	and a
	jr nz, .DoNothing


	ld hl, BattleMonPP
	ld de, BattleMonMoves
	ld b, 0
	ld c, NUM_MOVES

.GetTotalPP
	ld a, [hli]
	and $3f ; exclude pp up
	add b
	ld b, a

	dec c
	jr z, .CheckMovePP

; Stop at undefined moves.
	inc de
	ld a, [de]
	and a
	jr nz, .GetTotalPP


.CheckMovePP
	ld hl, BattleMonPP
	ld a, [CurMoveNum]
	ld e, a
	ld d, 0
	add hl, de

; Can't use another move if only one move has PP.
	ld a, [hl]
	and $3f
	cp b
	jr z, .DoNothing


; Make sure we can actually use the move once we get there.
	ld a, 1
	ld [AlreadyDisobeyed], a

	ld a, [wcfa3]
	ld b, a

; Save the move we originally picked for afterward.
	ld a, [CurMoveNum]
	ld c, a
	push af


.RandomMove
	call BattleRandom
	and 3 ; TODO NUM_MOVES

	cp b
	jr nc, .RandomMove

; Not the move we were trying to use.
	cp c
	jr z, .RandomMove

; Make sure it has PP.
	ld [CurMoveNum], a
	ld hl, BattleMonPP
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	and $3f
	jr z, .RandomMove


; Use it.
	ld a, [CurMoveNum]
	ld c, a
	ld b, 0
	ld hl, BattleMonMoves
	add hl, bc
	ld a, [hl]
	ld [CurPlayerMove], a

	call SetPlayerTurn
	call UpdateMoveData
	call DoMove


; Restore original move choice.
	pop af
	ld [CurMoveNum], a


.asm_3450c
	xor a
	ld [LastPlayerMove], a
	ld [LastEnemyCounterMove], a

	; Break Encore too.
	ld hl, PlayerSubStatus5
	res SUBSTATUS_ENCORED, [hl]
	xor a
	ld [PlayerEncoreCount], a

	jp EndMoveEffect
; 3451f


IgnoreSleepOnly: ; 3451f

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar

	cp SNORE
	jr z, .CheckSleep
	cp SLEEP_TALK
	jr z, .CheckSleep
	and a
	ret

.CheckSleep
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP
	ret z

; 'ignored orders…sleeping!'
	ld hl, IgnoredSleepingText
	call StdBattleTextBox

	call EndMoveEffect

	scf
	ret
; 34541


BattleCommand_UsedMoveText: ; 34541
; usedmovetext
	callba DisplayUsedMoveText
	ret
; 34548


Function34548: ; 34548

	ld a, [hBattleTurn]
	and a
	ld a, [wPlayerCharging] ; player
	jr z, .end
	ld a, [wEnemyCharging] ; enemy
.end
	and a
	ret
; 34555


BattleCommand_DoTurn: ; 34555
	call Function34548
	ret nz

	ld hl, BattleMonPP
	ld de, PlayerSubStatus3
	ld bc, PlayerTurnsTaken

	ld a, [hBattleTurn]
	and a
	jr z, .proceed

	ld hl, EnemyMonPP
	ld de, EnemySubStatus3
	ld bc, EnemyTurnsTaken

.proceed

; If we've gotten this far, this counts as a turn.
	ld a, [bc]
	inc a
	ld [bc], a

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	cp STRUGGLE
	ret z

	ld a, [de]
	and 1 << SUBSTATUS_IN_LOOP | 1 << SUBSTATUS_RAMPAGE | 1 << SUBSTATUS_BIDE
	ret nz

	call .consume_pp
	ld a, b
	and a
	jp nz, EndMoveEffect

	; SubStatus5
rept 2
	inc de
endr

	ld a, [de]
	bit SUBSTATUS_TRANSFORMED, a
	ret nz

	ld a, [hBattleTurn]
	and a

	ld hl, PartyMon1PP
	ld a, [CurBattleMon]
	jr z, .player

; skip this part entirely if wildbattle
	ld a, [wBattleMode]
	dec a
	jr z, .wild

	ld hl, OTPartyMon1PP
	ld a, [CurOTMon]

.player
	call GetPartyLocation
	push hl
	call Function3460b
	pop hl
	ret c

.consume_pp
	ld a, [hBattleTurn]
	and a
	ld a, [CurMoveNum]
	jr z, .okay
	ld a, [CurEnemyMoveNum]

.okay
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	and $3f
	jr z, .asm_345e3
	dec [hl]
	ld b, 0
	ret

.wild
	ld hl, EnemyMonMoves
	ld a, [CurEnemyMoveNum]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	cp MIMIC
	jr z, .mimic
	ld hl, wCaughtMonMoves
	add hl, bc
	ld a, [hl]
	cp MIMIC
	ret z

.mimic
	ld hl, wCaughtMonPP
	call .consume_pp
	ret

.asm_345e3
	call BattleCommand_MoveDelay
; get move effect
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
; continuous?
	ld hl, .continuousmoves
	ld de, 1
	call IsInArray

; 'has no pp left for [move]'
	ld hl, HasNoPPLeftText
	jr c, .print
; 'but no pp is left for the move'
	ld hl, NoPPLeftText
.print
	call StdBattleTextBox
	ld b, 1
	ret
; 34602

.continuousmoves ; 34602
	db EFFECT_RAZOR_WIND
	db EFFECT_SKY_ATTACK
	db EFFECT_SKULL_BASH
	db EFFECT_SOLARBEAM
	db EFFECT_FLY
	db EFFECT_ROLLOUT
	db EFFECT_BIDE
	db EFFECT_RAMPAGE
	db $ff
; 3460b

Function3460b: ; 3460b
	ld a, [hBattleTurn]
	and a
	ld a, [CurMoveNum]
	jr z, .player
	ld a, [CurEnemyMoveNum]

.player
	ld c, a
	ld a, 2
	call UserPartyAttr

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	cp MIMIC
	jr z, .asm_3462f

	ld b, 0
	add hl, bc
	ld a, [hl]
	cp MIMIC
	jr nz, .asm_3462f

	scf
	ret

.asm_3462f
	and a
	ret
; 34631


BattleCommand_Critical: ; 34631
; critical

; Determine whether this attack's hit will be critical.

	xor a
	ld [CriticalHit], a

	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVar
	and a
	ret z

	ld a, [hBattleTurn]
	and a
	ld hl, EnemyMonItem
	ld a, [EnemyMonSpecies]
	jr nz, .Item
	ld hl, BattleMonItem
	ld a, [BattleMonSpecies]

.Item
	ld c, 0

	cp CHANSEY
	jr nz, .Farfetchd
	ld a, [hl]
	cp LUCKY_PUNCH
	jr nz, .FocusEnergy

; +2 critical level
	ld c, 2
	jr .Tally

.Farfetchd
	cp FARFETCH_D
	jr nz, .FocusEnergy
	ld a, [hl]
	cp STICK
	jr nz, .FocusEnergy

; +2 critical level
	ld c, 2
	jr .Tally

.FocusEnergy
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_FOCUS_ENERGY, a
	jr z, .CheckCritical

; +1 critical level
	inc c

.CheckCritical
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld de, 1
	ld hl, .Criticals
	push bc
	call IsInArray
	pop bc
	jr nc, .ScopeLens

; +2 critical level
rept 2
	inc c
endr

.ScopeLens
	push bc
	call GetUserItem
	ld a, b
	cp HELD_CRITICAL_UP ; Increased critical chance. Only Scope Lens has this.
	pop bc
	jr nz, .Tally

; +1 critical level
	inc c

.Tally
	ld hl, .Chances
	ld b, 0
	add hl, bc
	call BattleRandom
	cp [hl]
	ret nc
	ld a, 1
	ld [CriticalHit], a
	ret

.Criticals
	db KARATE_CHOP, RAZOR_WIND, RAZOR_LEAF, CRABHAMMER, SLASH, AEROBLAST, CROSS_CHOP, $ff
.Chances
	; 6.25% 12.1% 24.6% 33.2% 49.6% 49.6% 49.6%
	db $11,  $20,  $40,  $55,  $80,  $80,  $80
	;   0     1     2     3     4     5     6
; 346b2


BattleCommand_TripleKick: ; 346b2
; triplekick

	ld a, [wKickCounter]
	ld b, a
	inc b
	ld hl, CurDamage + 1
	ld a, [hld]
	ld e, a
	ld a, [hli]
	ld d, a
.next_kick
	dec b
	ret z
	ld a, [hl]
	add e
	ld [hld], a
	ld a, [hl]
	adc d
	ld [hli], a

; No overflow.
	jr nc, .next_kick
	ld a, $ff
	ld [hld], a
	ld [hl], a
	ret
; 346cd


BattleCommand_KickCounter: ; 346cd
; kickcounter

	ld hl, wKickCounter
	inc [hl]
	ret
; 346d2


BattleCommand_Stab: ; 346d2
; STAB = Same Type Attack Bonus
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	cp STRUGGLE
	ret z

	ld hl, BattleMonType1
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, EnemyMonType1
	ld a, [hli]
	ld d, a
	ld e, [hl]

	ld a, [hBattleTurn]
	and a
	jr z, .go ; Who Attacks and who Defends

	ld hl, EnemyMonType1
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, BattleMonType1
	ld a, [hli]
	ld d, a
	ld e, [hl]

.go
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	ld [wTypeMatchup], a

	push hl
	push de
	push bc
	callba DoWeatherModifiers
	pop bc
	pop de
	pop hl

	push de
	push bc
	callba DoBadgeTypeBoosts
	pop bc
	pop de

	ld a, [wTypeMatchup]
	cp b
	jr z, .stab
	cp c
	jr z, .stab

	jr .SkipStab

.stab
	ld hl, CurDamage + 1
	ld a, [hld]
	ld h, [hl]
	ld l, a

	ld b, h
	ld c, l
	srl b
	rr c
	add hl, bc

	ld a, h
	ld [CurDamage], a
	ld a, l
	ld [CurDamage + 1], a

	ld hl, TypeModifier
	set 7, [hl]

.SkipStab
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	ld b, a
	ld hl, TypeMatchup

.TypesLoop
	ld a, [hli]

	cp $ff
	jr z, .end

	; foresight
	cp $fe
	jr nz, .SkipForesightCheck
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_IDENTIFIED, a
	jr nz, .end

	jr .TypesLoop

.SkipForesightCheck
	cp b
	jr nz, .SkipType
	ld a, [hl]
	cp d
	jr z, .GotMatchup
	cp e
	jr z, .GotMatchup
	jr .SkipType

.GotMatchup
	push hl
	push bc
	inc hl
	ld a, [TypeModifier]
	and %10000000
	ld b, a
; If the target is immune to the move, treat it as a miss and calculate the damage as 0
	ld a, [hl]
	and a
	jr nz, .NotImmune
	inc a
	ld [AttackMissed], a
	xor a
.NotImmune
	ld [hMultiplier], a
	add b
	ld [TypeModifier], a

	xor a
	ld [hMultiplicand + 0], a

	ld hl, CurDamage
	ld a, [hli]
	ld [hMultiplicand + 1], a
	ld a, [hld]
	ld [hMultiplicand + 2], a

	call Multiply

	ld a, [hProduct + 1]
	ld b, a
	ld a, [hProduct + 2]
	or b
	ld b, a
	ld a, [hProduct + 3]
	or b
	jr z, .ok ; This is a very convoluted way to get back that we've essentially dealt no damage.

; Take the product and divide it by 10.
	ld a, 10
	ld [hDivisor], a
	ld b, 4
	call Divide
	ld a, [hQuotient + 1]
	ld b, a
	ld a, [hQuotient + 2]
	or b
	jr nz, .ok

	ld a, 1
	ld [hMultiplicand + 2], a

.ok
	ld a, [hMultiplicand + 1]
	ld [hli], a
	ld a, [hMultiplicand + 2]
	ld [hl], a
	pop bc
	pop hl

.SkipType
rept 2
	inc hl
endr
	jr .TypesLoop

.end
	call BattleCheckTypeMatchup
	ld a, [wTypeMatchup]
	ld b, a
	ld a, [TypeModifier]
	and %10000000
	or b
	ld [TypeModifier], a
	ret
; 347c8


BattleCheckTypeMatchup: ; 347c8
	ld hl, EnemyMonType1
	ld a, [hBattleTurn]
	and a
	jr z, CheckTypeMatchup
	ld hl, BattleMonType1

	; fallthrough
; 347d3


CheckTypeMatchup: ; 347d3
	push hl
	push de
	push bc
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	ld d, a
	ld b, [hl]
	inc hl
	ld c, [hl]
	ld a, 10 ; 1.0
	ld [wTypeMatchup], a
	ld hl, TypeMatchup
.TypesLoop
	ld a, [hli]
	cp $ff
	jr z, .End
	cp $fe
	jr nz, .Next
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_IDENTIFIED, a
	jr nz, .End
	jr .TypesLoop
.Next
	cp d
	jr nz, .Nope
	ld a, [hli]
	cp b
	jr z, .Yup
	cp c
	jr z, .Yup
	jr .Nope2
.Nope
	inc hl
.Nope2
	inc hl
	jr .TypesLoop
.Yup
	xor a
	ld [hDividend + 0], a
	ld [hMultiplicand + 0], a
	ld [hMultiplicand + 1], a
	ld a, [hli]
	ld [hMultiplicand + 2], a
	ld a, [wTypeMatchup]
	ld [hMultiplier], a
	call Multiply
	ld a, 10
	ld [hDivisor], a
	push bc
	ld b, 4
	call Divide
	pop bc
	ld a, [hQuotient + 2]
	ld [wTypeMatchup], a
	jr .TypesLoop

.End
	pop bc
	pop de
	pop hl
	ret
; 34833


BattleCommand_ResetTypeMatchup: ; 34833
; Reset the type matchup multiplier to 1.0, if the type matchup is not 0.
; If there is immunity in play, the move automatically misses.
	call BattleCheckTypeMatchup
	ld a, [wTypeMatchup]
	and a
	ld a, 10 ; 1.0
	jr nz, .reset
	call ResetDamage
	xor a
	ld [TypeModifier], a
	inc a
	ld [AttackMissed], a
	ret

.reset
	ld [wTypeMatchup], a
	ret
; 3484e

INCLUDE "battle/ai/switch.asm"

TypeMatchup: ; 34bb1
INCLUDE "battle/type_matchup.asm"
; 34cfd


BattleCommand_DamageVariation: ; 34cfd
; damagevariation

; Modify the damage spread between 85% and 100%.

; Because of the method of division the probability distribution
; is not consistent. This makes the highest damage multipliers
; rarer than normal.


; No point in reducing 1 or 0 damage.
	ld hl, CurDamage
	ld a, [hli]
	and a
	jr nz, .go
	ld a, [hl]
	cp 2
	ret c

.go
; Start with the maximum damage.
	xor a
	ld [hMultiplicand + 0], a
	dec hl
	ld a, [hli]
	ld [hMultiplicand + 1], a
	ld a, [hl]
	ld [hMultiplicand + 2], a

; Multiply by 85-100%...
.loop
	call BattleRandom
	rrca
	cp $d9 ; 85%
	jr c, .loop

	ld [hMultiplier], a
	call Multiply

; ...divide by 100%...
	ld a, $ff ; 100%
	ld [hDivisor], a
	ld b, $4
	call Divide

; ...to get .85-1.00x damage.
	ld a, [hQuotient + 1]
	ld hl, CurDamage
	ld [hli], a
	ld a, [hQuotient + 2]
	ld [hl], a
	ret
; 34d32


BattleCommand_CheckHit: ; 34d32
; checkhit

	call .DreamEater
	jp z, .Miss

	call .Protect
	jp nz, .Miss

	call .DrainSub
	jp z, .Miss

	call .LockOn
	ret nz

	call .FlyDigMoves
	jp nz, .Miss

	call .ThunderRain
	ret z

	call .XAccuracy
	ret nz

	; Perfect-accuracy moves
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_ALWAYS_HIT
	ret z

	call .StatModifiers

	ld a, [wPlayerMoveStruct + MOVE_ACC]
	ld b, a
	ld a, [hBattleTurn]
	and a
	jr z, .BrightPowder
	ld a, [wEnemyMoveStruct + MOVE_ACC]
	ld b, a

.BrightPowder
	push bc
	call GetOpponentItem
	ld a, b
	cp HELD_BRIGHTPOWDER
	ld a, c ; % miss
	pop bc
	jr nz, .asm_34d81

	ld c, a
	ld a, b
	sub c
	ld b, a
	jr nc, .asm_34d81
	ld b, 0

.asm_34d81
	ld a, b
	cp $ff
	jr z, .Hit

	call BattleRandom
	cp b
	jr nc, .Miss

.Hit
	ret


.Miss
; Keep the damage value intact if we're using (Hi) Jump Kick.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_JUMP_KICK
	jr z, .Missed
	call ResetDamage

.Missed
	ld a, 1
	ld [AttackMissed], a
	ret


.DreamEater
; Return z if we're trying to eat the dream of
; a monster that isn't sleeping.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_DREAM_EATER
	ret nz

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and SLP
	ret


.Protect
; Return nz if the opponent is protected.
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_PROTECT, a
	ret z

	ld c, 40
	call DelayFrames

; 'protecting itself!'
	ld hl, ProtectingItselfText
	call StdBattleTextBox

	ld c, 40
	call DelayFrames

	ld a, 1
	and a
	ret


.LockOn
; Return nz if we are locked-on and aren't trying to use Earthquake,
; Fissure or Magnitude on a monster that is flying.
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_LOCK_ON, [hl]
	res SUBSTATUS_LOCK_ON, [hl]
	ret z

	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	bit SUBSTATUS_FLYING, a
	jr z, .LockedOn

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar

	cp EARTHQUAKE
	ret z
	cp FISSURE
	ret z
	cp MAGNITUDE
	ret z

.LockedOn
	ld a, 1
	and a
	ret


.DrainSub
; Return z if using an HP drain move on a substitute.
	call CheckSubstituteOpp
	jr z, .asm_34e00

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar

	cp EFFECT_LEECH_HIT
	ret z
	cp EFFECT_DREAM_EATER
	ret z

.asm_34e00
	ld a, 1
	and a
	ret


.FlyDigMoves
; Check for moves that can hit underground/flying opponents.
; Return z if the current move can hit the opponent.

	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret z

	bit SUBSTATUS_FLYING, a
	jr z, .DigMoves

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar

	cp GUST
	ret z
	cp WHIRLWIND
	ret z
	cp THUNDER
	ret z
	cp TWISTER
	ret

.DigMoves
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar

	cp EARTHQUAKE
	ret z
	cp FISSURE
	ret z
	cp MAGNITUDE
	ret


.ThunderRain
; Return z if the current move always hits in rain, and it is raining.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_THUNDER
	ret nz

	ld a, [Weather]
	cp WEATHER_RAIN
	ret


.XAccuracy
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_X_ACCURACY, a
	ret


.StatModifiers

	ld a, [hBattleTurn]
	and a

	ld hl, wPlayerMoveStruct + MOVE_ACC
	ld a, [PlayerAccLevel]
	ld b, a
	ld a, [EnemyEvaLevel]
	ld c, a

	jr z, .asm_34e60

	ld hl, wEnemyMoveStruct + MOVE_ACC
	ld a, [EnemyAccLevel]
	ld b, a
	ld a, [PlayerEvaLevel]
	ld c, a

.asm_34e60
	cp b
	jr c, .asm_34e6b

	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_IDENTIFIED, a
	ret nz

.asm_34e6b
	ld a, $e
	sub c
	ld c, a
	xor a
	ld [hMultiplicand + 0], a
	ld [hMultiplicand + 1], a
	ld a, [hl]
	ld [hMultiplicand + 2], a
	push hl
	ld d, $2

.asm_34e7a
	push bc
	ld hl, .AccProb
	dec b
	sla b
	ld c, b
	ld b, 0
	add hl, bc
	pop bc
	ld a, [hli]
	ld [hMultiplier], a
	call Multiply
	ld a, [hl]
	ld [hDivisor], a
	ld b, $4
	call Divide
	ld a, [hQuotient + 2]
	ld b, a
	ld a, [hQuotient + 1]
	or b
	jr nz, .asm_34ea2
	ld [$ffb5], a
	ld a, $1
	ld [$ffb6], a

.asm_34ea2
	ld b, c
	dec d
	jr nz, .asm_34e7a

	ld a, [$ffb5]
	and a
	ld a, [$ffb6]
	jr z, .asm_34eaf
	ld a, $ff

.asm_34eaf
	pop hl
	ld [hl], a
	ret

.AccProb
	db  33, 100 ;  33% -6
	db  36, 100 ;  36% -5
	db  43, 100 ;  43% -4
	db  50, 100 ;  50% -3
	db  60, 100 ;  60% -2
	db  75, 100 ;  75% -1
	db   1,   1 ; 100%  0
	db 133, 100 ; 133% +1
	db 166, 100 ; 166% +2
	db   2,   1 ; 200% +3
	db 233, 100 ; 233% +4
	db 133,  50 ; 266% +5
	db   3,   1 ; 300% +6

; 34ecc


BattleCommand_EffectChance: ; 34ecc
; effectchance

	xor a
	ld [EffectFailed], a
	call CheckSubstituteOpp
	jr nz, .failed

	push hl
	ld hl, wPlayerMoveStruct + MOVE_CHANCE
	ld a, [hBattleTurn]
	and a
	jr z, .asm_34ee1
	ld hl, wEnemyMoveStruct + MOVE_CHANCE
.asm_34ee1

	call BattleRandom
	cp [hl]
	pop hl
	ret c

.failed
	ld a, 1
	ld [EffectFailed], a
	and a
	ret
; 34eee


BattleCommand_LowerSub: ; 34eee
; lowersub

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret z

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	bit SUBSTATUS_CHARGED, a
	jr nz, .already_charged

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_RAZOR_WIND
	jr z, .charge_turn
	cp EFFECT_SKY_ATTACK
	jr z, .charge_turn
	cp EFFECT_SKULL_BASH
	jr z, .charge_turn
	cp EFFECT_SOLARBEAM
	jr z, .charge_turn
	cp EFFECT_FLY
	jr z, .charge_turn

.already_charged
	call .Rampage
	jr z, .charge_turn

	call Function34548
	ret nz

.charge_turn
	call _CheckBattleScene
	jr c, .skip_anims

	xor a
	ld [wcfca], a
	ld [FXAnimIDHi], a
	inc a
	ld [wKickCounter], a
	ld a, SUBSTITUTE
	jp PlayMoveAnim_KeepHiID

.skip_anims
	call BattleCommand_LowerSubNoAnim
	jp BattleCommand_MoveDelay

.Rampage
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_ROLLOUT
	jr z, .rollout_rampage
	cp EFFECT_RAMPAGE
	jr z, .rollout_rampage

	ld a, 1
	and a
	ret

.rollout_rampage
	ld a, [wc73e]
	and a
	ld a, 0
	ld [wc73e], a
	ret
; 34f57


BattleCommand_HitTarget: ; 34f57
; hittarget
	call BattleCommand_LowerSub
	call BattleCommand_HitTargetNoSub
	jp BattleCommand_RaiseSub
; 34f60


BattleCommand_HitTargetNoSub: ; 34f60
	ld a, [AttackMissed]
	and a
	jp nz, BattleCommand_MoveDelay

	ld a, [hBattleTurn]
	and a
	ld de, PlayerRolloutCount
	ld a, 1
	jr z, .got_rollout_count
	ld de, EnemyRolloutCount
	ld a, 4

.got_rollout_count
	ld [wcfca], a
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_MULTI_HIT
	jr z, .multihit
	cp EFFECT_CONVERSION
	jr z, .conversion
	cp EFFECT_DOUBLE_HIT
	jr z, .doublehit
	cp EFFECT_TWINEEDLE
	jr z, .twineedle
	cp EFFECT_TRIPLE_KICK
	jr z, .triplekick
	xor a
	ld [wKickCounter], a

.triplekick

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld e, a
	ld d, 0
	call PlayFXAnimID

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	cp FLY
	jr z, .fly_dig
	cp DIG
	ret nz

.fly_dig
; clear sprite
	jp Function37ec7
.multihit
.conversion
.doublehit
.twineedle
	ld a, [wKickCounter]
	and 1
	xor 1
	ld [wKickCounter], a
	ld a, [de]
	cp $1
	push af
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld e, a
	ld d, 0
	pop af
	jp z, PlayFXAnimID
	xor a
	ld [wcfca], a
	jp PlayFXAnimID
; 34fd1


BattleCommand_StatUpAnim: ; 34fd1
	ld a, [AttackMissed]
	and a
	jp nz, BattleCommand_MoveDelay

	xor a
	jr BattleCommand_StatUpDownAnim
; 34fdb


BattleCommand_StatDownAnim: ; 34fdb
	ld a, [AttackMissed]
	and a
	jp nz, BattleCommand_MoveDelay

	ld a, [hBattleTurn]
	and a
	ld a, 2
	jr z, BattleCommand_StatUpDownAnim
	ld a, 5

	; fallthrough
; 34feb


BattleCommand_StatUpDownAnim: ; 34feb
	ld [wcfca], a
	xor a
	ld [wKickCounter], a
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld e, a
	ld d, 0
	jp PlayFXAnimID
; 34ffd


BattleCommand_SwitchTurn: ; 34ffd
; switchturn

	ld a, [hBattleTurn]
	xor 1
	ld [hBattleTurn], a
	ret
; 35004


BattleCommand_RaiseSub: ; 35004
; raisesub

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret z

	call _CheckBattleScene
	jp c, BattleCommand_RaiseSubNoAnim

	xor a
	ld [wcfca], a
	ld [FXAnimIDHi], a
	ld a, $2
	ld [wKickCounter], a
	ld a, SUBSTITUTE
	jp PlayMoveAnim_KeepHiID
; 35023


BattleCommand_ResultText: ; 35023
; resulttext
	ld a, [AttackMissed]
	and a
	ret z

	call Function350e4
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarAddr

	cp FLY
	jr z, .asm_3504f
	cp DIG
	jr z, .asm_3504f

; Move effect:
	inc hl
	ld a, [hl]

	cp EFFECT_MULTI_HIT
	jr z, .asm_35049
	cp EFFECT_DOUBLE_HIT
	jr z, .asm_35049
	cp EFFECT_TWINEEDLE
	jr z, .asm_35049
	jp EndMoveEffect

.asm_35049
	call BattleCommand_RaiseSub
	jp EndMoveEffect

.asm_3504f
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	res SUBSTATUS_UNDERGROUND, [hl]
	res SUBSTATUS_FLYING, [hl]
	call Function37ece
	jp EndMoveEffect
; 3505e


BattleCommand_CheckFaint: ; 3505e
; checkfaint

	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_ENDURE, a
	jr z, .asm_35072
	call BattleCommand_FalseSwipe
	ld b, $0
	jr nc, .asm_3508b
	ld b, $1
	jr .asm_3508b

.asm_35072
	call GetOpponentItem
	ld a, b
	cp HELD_FOCUS_BAND
	ld b, $0
	jr nz, .asm_3508b
	call BattleRandom
	cp c
	jr nc, .asm_3508b
	call BattleCommand_FalseSwipe
	ld b, $0
	jr nc, .asm_3508b
	ld b, $2
.asm_3508b
	push bc
	call .asm_50bb
	ld c, $0
	ld a, [hBattleTurn]
	and a
	jr nz, .asm_3509b
	call Function35d1c
	jr .asm_3509e

.asm_3509b
	call Function35d7e

.asm_3509e
	pop bc
	ld a, b
	and a
	ret z
	dec a
	jr nz, .asm_350ab
	ld hl, EnduredText
	jp StdBattleTextBox

.asm_350ab
	call GetOpponentItem
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName

	ld hl, HungOnText
	jp StdBattleTextBox

.asm_50bb
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret nz

	ld de, PlayerDamageTaken + 1
	ld a, [hBattleTurn]
	and a
	jr nz, .asm_350ce
	ld de, EnemyDamageTaken + 1

.asm_350ce
	ld a, [CurDamage + 1]
	ld b, a
	ld a, [de]
	add b
	ld [de], a
	dec de
	ld a, [CurDamage]
	ld b, a
	ld a, [de]
	adc b
	ld [de], a
	ret nc
	ld a, $ff
	ld [de], a
	inc de
	ld [de], a
	ret
; 350e4


Function350e4: ; 350e4
	ld hl, DoesntAffectText
	ld de, DoesntAffectText
	ld a, [TypeModifier]
	and $7f
	jr z, .asm_35110
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_FUTURE_SIGHT
	ld hl, ButItFailedText
	ld de, ItFailedText
	jr z, .asm_35110
	ld hl, AttackMissedText
	ld de, AttackMissed2Text
	ld a, [CriticalHit]
	cp $ff
	jr nz, .asm_35110
	ld hl, UnaffectedText
.asm_35110
	call Function35157
	xor a
	ld [CriticalHit], a

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_JUMP_KICK
	ret nz
	ld a, [TypeModifier]
	and $7f
	ret z
	ld hl, CurDamage
	ld a, [hli]
	ld b, [hl]
	rept 3
	srl a
	rr b
	endr
	ld [hl], b
	dec hl
	ld [hli], a
	or b
	jr nz, .asm_3513e
	inc a
	ld [hl], a
.asm_3513e
	ld hl, CrashedText
	call StdBattleTextBox
	ld a, $1
	ld [wKickCounter], a
	call PlayPlayerMoveAnim_ClearHiID
	ld c, $1
	ld a, [hBattleTurn]
	and a
	jp nz, Function35d1c
	jp Function35d7e

Function35157: ; 35157
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_PROTECT, a
	jr z, .asm_35162
	ld h, d
	ld l, e
.asm_35162
	jp StdBattleTextBox
; 35165


BattleCommanda5: ; 35165
	ld a, [AttackMissed]
	and a
	ret z

	ld a, [TypeModifier]
	and $7f
	jp z, PrintDoesntAffect
	jp PrintButItFailed
; 35175


BattleCommand_CriticalText: ; 35175
; criticaltext
; Prints the message for critical hits or one-hit KOs.

; If there is no message to be printed, wait 20 frames.
	ld a, [CriticalHit]
	and a
	jr z, .wait

	dec a
	add a
	ld hl, .texts
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call StdBattleTextBox

	xor a
	ld [CriticalHit], a

.wait
	ld c, 20
	jp DelayFrames

.texts
	dw CriticalHitText
	dw OneHitKOText
; 35197


BattleCommand_StartLoop: ; 35197
; startloop

	ld hl, PlayerRolloutCount
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, EnemyRolloutCount
.ok
	xor a
	ld [hl], a
	ret
; 351a5


BattleCommand_SuperEffectiveLoopText: ; 351a5
; supereffectivelooptext

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	bit SUBSTATUS_IN_LOOP, a
	ret nz

	; fallthrough
; 351ad


BattleCommand_SuperEffectiveText: ; 351ad
; supereffectivetext

	ld a, [TypeModifier]
	and $7f
	cp 10 ; 1.0
	ret z
	ld hl, SuperEffectiveText
	jr nc, .print
	ld hl, NotVeryEffectiveText
.print
	jp StdBattleTextBox
; 351c0


BattleCommand_CheckDestinyBond: ; 351c0
; checkdestinybond

; Faint the user if it fainted an opponent using Destiny Bond.

	ld hl, EnemyMonHP
	ld a, [hBattleTurn]
	and a
	jr z, .asm_351cb
	ld hl, BattleMonHP

.asm_351cb
	ld a, [hli]
	or [hl]
	ret nz

	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVar
	bit SUBSTATUS_DESTINY_BOND, a
	jr z, .asm_35231

	ld hl, TookDownWithItText
	call StdBattleTextBox

	ld a, [hBattleTurn]
	and a
	ld hl, EnemyMonMaxHP + 1
	bccoord 2, 2 ; hp bar
	ld a, 0
	jr nz, .asm_351f2
	ld hl, BattleMonMaxHP + 1
	bccoord 10, 9 ; hp bar
	ld a, 1

.asm_351f2
	ld [wd10a], a
	ld a, [hld]
	ld [Buffer1], a
	ld a, [hld]
	ld [Buffer2], a
	ld a, [hl]
	ld [Buffer3], a
	xor a
	ld [hld], a
	ld a, [hl]
	ld [Buffer4], a
	xor a
	ld [hl], a
	ld [Buffer5], a
	ld [Buffer6], a
	ld h, b
	ld l, c
	predef AnimateHPBar
	call RefreshBattleHuds

	call BattleCommand_SwitchTurn
	xor a
	ld [wcfca], a
	ld [FXAnimIDHi], a
	inc a
	ld [wKickCounter], a
	ld a, DESTINY_BOND
	call PlayMoveAnim_KeepHiID
	call BattleCommand_SwitchTurn

	jr .asm_3524d ; 3522f $1c

.asm_35231
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_MULTI_HIT
	jr z, .asm_3524a
	cp EFFECT_DOUBLE_HIT
	jr z, .asm_3524a
	cp EFFECT_TWINEEDLE
	jr z, .asm_3524a
	cp EFFECT_TRIPLE_KICK
	jr z, .asm_3524a
	cp EFFECT_BEAT_UP
	jr nz, .asm_3524d

.asm_3524a
	call BattleCommand_RaiseSub

.asm_3524d
	jp EndMoveEffect
; 35250


BattleCommand_BuildOpponentRage: ; 35250
; buildopponentrage

	jp .start
.start
	ld a, [AttackMissed]
	and a
	ret nz

	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_RAGE, a
	ret z

	ld de, wEnemyRageCounter
	ld a, [hBattleTurn]
	and a
	jr z, .player
	ld de, wPlayerRageCounter
.player
	ld a, [de]
	inc a
	ret z
	ld [de], a

	call BattleCommand_SwitchTurn
	ld hl, RageBuildingText
	call StdBattleTextBox
	jp BattleCommand_SwitchTurn
; 3527b


BattleCommand_RageDamage: ; 3527b
; ragedamage

	ld a, [CurDamage]
	ld h, a
	ld b, a
	ld a, [CurDamage + 1]
	ld l, a
	ld c, a
	ld a, [hBattleTurn]
	and a
	ld a, [wPlayerRageCounter]
	jr z, .asm_35290
	ld a, [wEnemyRageCounter]
.asm_35290
	and a
	jr z, .asm_3529a
	dec a
	add hl, bc
	jr nc, .asm_35290
	ld hl, $ffff
.asm_3529a
	ld a, h
	ld [CurDamage], a
	ld a, l
	ld [CurDamage + 1], a
	ret
; 352a3


EndMoveEffect: ; 352a3
	ld a, [BattleScriptBufferLoc]
	ld l, a
	ld a, [BattleScriptBufferLoc + 1]
	ld h, a
	ld a, $ff
rept 2
	ld [hli], a
endr
	ld [hl], a
	ret
; 352b1


DittoMetalPowder: ; 352b1
	ld a, MON_SPECIES
	call BattlePartyAttr
	ld a, [hBattleTurn]
	and a
	ld a, [hl]
	jr nz, .Ditto
	ld a, [TempEnemyMonSpecies]

.Ditto
	cp DITTO
	ret nz

	push bc
	call GetOpponentItem
	ld a, [hl]
	cp METAL_POWDER
	pop bc
	ret nz

	ld a, c
	srl a
	add c
	ld c, a
	ret nc

	srl b
	ld a, b
	and a
	jr nz, .asm_352d8
	inc b
.asm_352d8
	scf
	rr c
	ret
; 352dc


BattleCommand_DamageStats: ; 352dc
; damagestats

	ld a, [hBattleTurn]
	and a
	jp nz, EnemyAttackDamage

	; fallthrough
; 352e2


PlayerAttackDamage: ; 352e2
; Return move power d, player level e, enemy defense c and player attack b.

	call ResetDamage

	ld hl, wPlayerMoveStruct + MOVE_POWER
	ld a, [hli]
	and a
	ld d, a
	ret z

	ld a, [hl]
	cp SPECIAL
	jr nc, .special

.physical
	ld hl, EnemyMonDefense
	ld a, [hli]
	ld b, a
	ld c, [hl]

	ld a, [EnemyScreens]
	bit SCREENS_REFLECT, a
	jr z, .physicalcrit
	sla c
	rl b

.physicalcrit
	ld hl, BattleMonAttack
	call GetDamageStatsCritical
	jr c, .thickclub

	ld hl, EnemyStats + 2
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, PlayerStats
	jr .thickclub

.special
	ld hl, EnemyMonSpclDef
	ld a, [hli]
	ld b, a
	ld c, [hl]

	ld a, [EnemyScreens]
	bit SCREENS_LIGHT_SCREEN, a
	jr z, .specialcrit
	sla c
	rl b

.specialcrit
	ld hl, BattleMonSpclAtk
	call GetDamageStatsCritical
	jr c, .lightball

	ld hl, EnemyStats + SP_DEFENSE * 2
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, PlayerStats + SP_ATTACK * 2

.lightball
; Note: Returns player special attack at hl in hl.
	call LightBallBoost
	jr .done

.thickclub
; Note: Returns player attack at hl in hl.
	call ThickClubBoost

.done
	call Function3534d

	ld a, [BattleMonLevel]
	ld e, a
	call DittoMetalPowder

	ld a, 1
	and a
	ret
; 3534d


Function3534d: ; 3534d
; Truncate 16-bit values hl and bc to 8-bit values b and c respectively.
; b = hl, c = bc

	ld a, h
	or b
	jr z, .asm_3536b

	srl b
	rr c
	srl b
	rr c

	ld a, c
	or b
	jr nz, .asm_3535e
	inc c

.asm_3535e
	srl h
	rr l
	srl h
	rr l

	ld a, l
	or h
	jr nz, .asm_3536b
	inc l

.asm_3536b
	ld a, [wLinkMode]
	cp 3
	jr z, .done

	ld a, h
	or b
	jr nz, Function3534d

.done
	ld b, l
	ret
; 35378


GetDamageStatsCritical: ; 35378
; Return carry if non-critical.

	ld a, [CriticalHit]
	and a
	scf
	ret z

	; fallthrough
; 3537e


GetDamageStats: ; 3537e
; Return the attacker's offensive stat and the defender's defensive
; stat based on whether the attacking type is physical or special.

	push hl
	push bc
	ld a, [hBattleTurn]
	and a
	jr nz, .enemy
	ld a, [wPlayerMoveStruct + MOVE_TYPE]
	cp SPECIAL
; special
	ld a, [PlayerSAtkLevel]
	ld b, a
	ld a, [EnemySDefLevel]
	jr nc, .end
; physical
	ld a, [PlayerAtkLevel]
	ld b, a
	ld a, [EnemyDefLevel]
	jr .end

.enemy
	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	cp SPECIAL
; special
	ld a, [EnemySAtkLevel]
	ld b, a
	ld a, [PlayerSDefLevel]
	jr nc, .end
; physical
	ld a, [EnemyAtkLevel]
	ld b, a
	ld a, [PlayerDefLevel]
.end
	cp b
	pop bc
	pop hl
	ret
; 353b5


ThickClubBoost: ; 353b5
; Return in hl the stat value at hl.

; If the attacking monster is Cubone or Marowak and
; it's holding a Thick Club, double it.
	push bc
	push de
	ld b, CUBONE
	ld c, MAROWAK
	ld d, THICK_CLUB
	call SpeciesItemBoost
	pop de
	pop bc
	ret
; 353c3


LightBallBoost: ; 353c3
; Return in hl the stat value at hl.

; If the attacking monster is Pikachu and it's
; holding a Light Ball, double it.
	push bc
	push de
	ld b, PIKACHU
	ld c, PIKACHU
	ld d, LIGHT_BALL
	call SpeciesItemBoost
	pop de
	pop bc
	ret
; 353d1


SpeciesItemBoost: ; 353d1
; Return in hl the stat value at hl.

; If the attacking monster is species b or c and
; it's holding item d, double it.

	ld a, [hli]
	ld l, [hl]
	ld h, a

	push hl
	ld a, MON_SPECIES
	call BattlePartyAttr

	ld a, [hBattleTurn]
	and a
	ld a, [hl]
	jr z, .CompareSpecies
	ld a, [TempEnemyMonSpecies]
.CompareSpecies
	pop hl

	cp b
	jr z, .GetItem
	cp c
	ret nz

.GetItem
	push hl
	call GetUserItem
	ld a, [hl]
	pop hl
	cp d
	ret nz

; Double the stat
	sla l
	rl h
	ret
; 353f6


EnemyAttackDamage: ; 353f6
	call ResetDamage

; No damage dealt with 0 power.
	ld hl, wEnemyMoveStruct + MOVE_POWER
	ld a, [hli] ; hl = wEnemyMoveStruct + MOVE_TYPE
	ld d, a
	and a
	ret z

	ld a, [hl]
	cp SPECIAL
	jr nc, .Special

.physical
	ld hl, BattleMonDefense
	ld a, [hli]
	ld b, a
	ld c, [hl]

	ld a, [PlayerScreens]
	bit SCREENS_REFLECT, a
	jr z, .physicalcrit
	sla c
	rl b

.physicalcrit
	ld hl, EnemyMonAttack
	call GetDamageStatsCritical
	jr c, .thickclub

	ld hl, PlayerStats + 2
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, EnemyStats
	jr .thickclub

.Special
	ld hl, BattleMonSpclDef
	ld a, [hli]
	ld b, a
	ld c, [hl]

	ld a, [PlayerScreens]
	bit SCREENS_LIGHT_SCREEN, a
	jr z, .specialcrit
	sla c
	rl b

.specialcrit
	ld hl, EnemyMonSpclAtk
	call GetDamageStatsCritical
	jr c, .lightball
	ld hl, PlayerStats + 8
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, EnemyStats + 6

.lightball
	call LightBallBoost
	jr .done

.thickclub
	call ThickClubBoost

.done
	call Function3534d

	ld a, [EnemyMonLevel]
	ld e, a
	call DittoMetalPowder

	ld a, 1
	and a
	ret
; 35461


BattleCommand_BeatUp: ; 35461
; beatup

	call ResetDamage
	ld a, [hBattleTurn]
	and a
	jp nz, .enemy_beats_up
	ld a, [PlayerSubStatus3]
	bit SUBSTATUS_IN_LOOP, a
	jr nz, .next_mon
	ld c, 20
	call DelayFrames
	xor a
	ld [PlayerRolloutCount], a
	ld [DefaultFlypoint], a
	ld [wc72d], a
	jr .got_mon

.next_mon
	ld a, [PlayerRolloutCount]
	ld b, a
	ld a, [PartyCount]
	sub b
	ld [DefaultFlypoint], a

.got_mon
	ld a, [DefaultFlypoint]
	ld hl, PartyMonNicknames
	call GetNick
	ld a, MON_HP
	call GetBeatupMonLocation
	ld a, [hli]
	or [hl]
	jp z, .beatup_fail ; fainted
	ld a, [DefaultFlypoint]
	ld c, a
	ld a, [CurBattleMon]
	cp [hl]
	ld hl, BattleMonStatus
	jr z, .active_mon
	ld a, MON_STATUS
	call GetBeatupMonLocation
.active_mon
	ld a, [hl]
	and a
	jp nz, .beatup_fail

	ld a, $1
	ld [wc72d], a
	ld hl, BeatUpAttackText
	call StdBattleTextBox
	ld a, [EnemyMonSpecies]
	ld [CurSpecies], a
	call GetBaseData
	ld a, [BaseDefense]
	ld c, a
	push bc
	ld a, MON_SPECIES
	call GetBeatupMonLocation
	ld a, [hl]
	ld [CurSpecies], a
	call GetBaseData
	ld a, [BaseAttack]
	pop bc
	ld b, a
	push bc
	ld a, MON_LEVEL
	call GetBeatupMonLocation
	ld a, [hl]
	ld e, a
	pop bc
	ld a, [wPlayerMoveStruct + MOVE_POWER]
	ld d, a
	ret

.enemy_beats_up
	ld a, [EnemySubStatus3]
	bit SUBSTATUS_IN_LOOP, a
	jr nz, .not_first_enemy_beatup

	xor a
	ld [EnemyRolloutCount], a
	ld [DefaultFlypoint], a
	ld [wc72d], a
	jr .enemy_continue

.not_first_enemy_beatup
	ld a, [EnemyRolloutCount]
	ld b, a
	ld a, [OTPartyCount]
	sub b
	ld [DefaultFlypoint], a
.enemy_continue
	ld a, [wBattleMode]
	dec a
	jr z, .wild

	ld a, [wLinkMode]
	and a
	jr nz, .link_or_tower

	ld a, [InBattleTowerBattle]
	and a
	jr nz, .link_or_tower

	ld a, [DefaultFlypoint]
	ld c, a
	ld b, 0
	ld hl, OTPartySpecies
	add hl, bc
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	jr .got_enemy_nick

.link_or_tower
	ld a, [DefaultFlypoint]
	ld hl, OTPartyMonNicknames
	ld bc, NAME_LENGTH
	call AddNTimes
	ld de, StringBuffer1
	call CopyBytes
.got_enemy_nick
	ld a, MON_HP
	call GetBeatupMonLocation
	ld a, [hli]
	or [hl]
	jp z, .beatup_fail
	ld a, [DefaultFlypoint]
	ld b, a
	ld a, [CurOTMon]
	cp b
	ld hl, EnemyMonStatus
	jr z, .active_enemy

	ld a, MON_STATUS
	call GetBeatupMonLocation
.active_enemy
	ld a, [hl]
	and a
	jr nz, .beatup_fail

	ld a, $1
	ld [wc72d], a
	jr .finish_beatup

.wild
	ld a, [EnemyMonSpecies]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, BeatUpAttackText
	call StdBattleTextBox
	jp EnemyAttackDamage

.finish_beatup
	ld hl, BeatUpAttackText
	call StdBattleTextBox
	ld a, [BattleMonSpecies]
	ld [CurSpecies], a
	call GetBaseData
	ld a, [BaseDefense]
	ld c, a
	push bc
	ld a, MON_SPECIES
	call GetBeatupMonLocation
	ld a, [hl]
	ld [CurSpecies], a
	call GetBaseData
	ld a, [BaseAttack]
	pop bc
	ld b, a
	push bc
	ld a, MON_LEVEL
	call GetBeatupMonLocation
	ld a, [hl]
	ld e, a
	pop bc
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	ld d, a
	ret
; 355b0


.beatup_fail: ; 355b0
	ld b, buildopponentrage_command
	jp SkipToBattleCommand
; 355b5


BattleCommanda8: ; 355b5
	ld a, [wc72d]
	and a
	ret nz

	jp PrintButItFailed
; 355bd


GetBeatupMonLocation: ; 355bd
	push bc
	ld c, a
	ld b, 0
	ld a, [hBattleTurn]
	and a
	ld hl, PartyMon1Species
	jr z, .asm_355cc
	ld hl, OTPartyMon1Species

.asm_355cc
	ld a, [DefaultFlypoint]
	add hl, bc
	call GetPartyLocation
	pop bc
	ret


BattleCommand_ClearMissDamage: ; 355d5
; clearmissdamage
	ld a, [AttackMissed]
	and a
	ret z

	jp ResetDamage
; 355dd


Function355dd: ; 355dd
	call ResetDamage
	ld a, [hBattleTurn]
	and a
	ld hl, BattleMonDefense
	ld de, PlayerScreens
	ld a, [BattleMonLevel]
	jr z, .asm_355f7

	ld hl, EnemyMonDefense
	ld de, EnemyScreens
	ld a, [EnemyMonLevel]
.asm_355f7
	push af
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld a, [de]
	bit SCREENS_REFLECT, a
	jr z, .asm_35604

	sla c
	rl b
.asm_35604
rept 3
	dec hl
endr
	ld a, [hli]
	ld l, [hl]
	ld h, a
	call Function3534d
	ld d, $28
	pop af
	ld e, a
	ret
; 35612


BattleCommand_DamageCalc: ; 35612
; damagecalc

; Return a damage value for move power d, player level e, enemy defense c and player attack b.

; Return 1 if successful, else 0.

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar

; Selfdestruct and Explosion halve defense.
	cp EFFECT_EXPLOSION
	jr nz, .asm_35620

	srl c
	jr nz, .asm_35620
	inc c

.asm_35620

; Variable-hit moves and Conversion can have a power of 0.
	cp EFFECT_MULTI_HIT
	jr z, .asm_3562b

	cp EFFECT_CONVERSION
	jr z, .asm_3562b

; No damage if move power is 0.
	ld a, d
	and a
	ret z

.asm_3562b
; Minimum defense value is 1.
	ld a, c
	and a
	jr nz, .asm_35631
	ld c, 1
.asm_35631

	xor a
	ld hl, hDividend
rept 2
	ld [hli], a
endr
	ld [hl], a

; Level * 2
	ld a, e
	add a
	jr nc, .asm_3563e
	ld [hl], $1
.asm_3563e
	inc hl
	ld [hli], a

; / 5
	ld a, 5
	ld [hld], a
	push bc
	ld b, $4
	call Divide
	pop bc

; + 2
rept 2
	inc [hl]
endr

; * bp
	inc hl
	ld [hl], d
	call Multiply

; * Attack
	ld [hl], b
	call Multiply

; / Defense
	ld [hl], c
	ld b, $4
	call Divide

; / 50
	ld [hl], 50
	ld b, $4
	call Divide

; Item boosts
	call GetUserItem

	ld a, b
	and a
	jr z, .DoneItem

	ld hl, TypeBoostItems

.NextItem
	ld a, [hli]
	cp $ff
	jr z, .DoneItem

; Item effect
	cp b
	ld a, [hli]
	jr nz, .NextItem

; Type
	ld b, a
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	cp b
	jr nz, .DoneItem

; * 100 + item effect amount
	ld a, c
	add 100
	ld [hMultiplier], a
	call Multiply

; / 100
	ld a, 100
	ld [hDivisor], a
	ld b, 4
	call Divide
.DoneItem

; Critical hits
	call .CriticalMultiplier


; Update CurDamage (capped at 997).
	ld hl, CurDamage
	ld b, [hl]
	ld a, [hQuotient + 2]
	add b
	ld [$ffb6], a
	jr nc, .asm_356a5

	ld a, [hQuotient + 1]
	inc a
	ld [$ffb5], a
	and a
	jr z, .Cap

.asm_356a5
	ld a, [$ffb3]
	ld b, a
	ld a, [$ffb4]
	or a
	jr nz, .Cap

	ld a, [$ffb5]
	cp 998 / $100
	jr c, .asm_356bd

	cp 998 / $100 + 1
	jr nc, .Cap

	ld a, [$ffb6]
	cp 998 % $100
	jr nc, .Cap

.asm_356bd
	inc hl

	ld a, [$ffb6]
	ld b, [hl]
	add b
	ld [hld], a

	ld a, [$ffb5]
	ld b, [hl]
	adc b
	ld [hl], a
	jr c, .Cap

	ld a, [hl]
	cp 998 / $100
	jr c, .asm_356df

	cp 998 / $100 + 1
	jr nc, .Cap

	inc hl
	ld a, [hld]
	cp 998 % $100
	jr c, .asm_356df

.Cap
	ld a, 997 / $100
	ld [hli], a
	ld a, 997 % $100
	ld [hld], a


.asm_356df
; Minimum neutral damage is 2 (bringing the cap to 999).
	inc hl
	ld a, [hl]
	add 2
	ld [hld], a
	jr nc, .asm_356e7
	inc [hl]
.asm_356e7

	ld a, 1
	and a
	ret


.CriticalMultiplier
	ld a, [CriticalHit]
	and a
	ret z

; x2
	ld a, [$ffb6]
	add a
	ld [$ffb6], a

	ld a, [$ffb5]
	rl a
	ld [$ffb5], a

; Cap at $ffff.
	ret nc

	ld a, $ff
	ld [$ffb5], a
	ld [$ffb6], a

	ret
; 35703


TypeBoostItems: ; 35703
	db HELD_NORMAL_BOOST,   NORMAL   ; Pink/Polkadot Bow
	db HELD_FIGHTING_BOOST, FIGHTING ; Blackbelt
	db HELD_FLYING_BOOST,   FLYING   ; Sharp Beak
	db HELD_POISON_BOOST,   POISON   ; Poison Barb
	db HELD_GROUND_BOOST,   GROUND   ; Soft Sand
	db HELD_ROCK_BOOST,     ROCK     ; Hard Stone
	db HELD_BUG_BOOST,      BUG      ; Silverpowder
	db HELD_GHOST_BOOST,    GHOST    ; Spell Tag
	db HELD_FIRE_BOOST,     FIRE     ; Charcoal
	db HELD_WATER_BOOST,    WATER    ; Mystic Water
	db HELD_GRASS_BOOST,    GRASS    ; Miracle Seed
	db HELD_ELECTRIC_BOOST, ELECTRIC ; Magnet
	db HELD_PSYCHIC_BOOST,  PSYCHIC  ; Twistedspoon
	db HELD_ICE_BOOST,      ICE      ; Nevermeltice
	db HELD_DRAGON_BOOST,   DRAGON   ; Dragon Scale
	db HELD_DARK_BOOST,     DARK     ; Blackglasses
	db HELD_STEEL_BOOST,    STEEL    ; Metal Coat
	db $ff
; 35726


BattleCommand_ConstantDamage: ; 35726
; constantdamage

	ld hl, BattleMonLevel
	ld a, [hBattleTurn]
	and a
	jr z, .asm_35731
	ld hl, EnemyMonLevel

.asm_35731
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_LEVEL_DAMAGE
	ld b, [hl]
	ld a, 0
	jr z, .asm_3578c

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_PSYWAVE
	jr z, .asm_35758

	cp EFFECT_SUPER_FANG
	jr z, .asm_3576b

	cp EFFECT_REVERSAL
	jr z, .asm_35792

	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVar
	ld b, a
	ld a, $0
	jr .asm_3578c

.asm_35758
	ld a, b
	srl a
	add b
	ld b, a
.asm_3575d
	call BattleRandom
	and a
	jr z, .asm_3575d ; 35761 $fa
	cp b
	jr nc, .asm_3575d ; 35764 $f7
	ld b, a
	ld a, $0
	jr .asm_3578c ; 35769 $21
.asm_3576b
	ld hl, EnemyMonHP
	ld a, [hBattleTurn]
	and a
	jr z, .asm_35776 ; 35771 $3
	ld hl, BattleMonHP
.asm_35776
	ld a, [hli]
	srl a
	ld b, a
	ld a, [hl]
	rr a
	push af
	ld a, b
	pop bc
	and a
	jr nz, .asm_3578c ; 35781 $9
	or b
	ld a, $0
	jr nz, .asm_3578c ; 35786 $4
	ld b, $1
	jr .asm_3578c ; 3578a $0
.asm_3578c
	ld hl, CurDamage
	ld [hli], a
	ld [hl], b
	ret
.asm_35792
	ld hl, BattleMonHP
	ld a, [hBattleTurn]
	and a
	jr z, .asm_3579d ; 35798 $3
	ld hl, EnemyMonHP
.asm_3579d
	xor a
	ld [$ffb3], a
	ld [hMultiplicand + 0], a
	ld a, [hli]
	ld [hMultiplicand + 1], a
	ld a, [hli]
	ld [hMultiplicand + 2], a
	ld a, $30
	ld [hMultiplier], a
	call Multiply
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld [hDivisor], a
	ld a, b
	and a
	jr z, .asm_357d6

	ld a, [$ffb7]
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
	ld [hDividend + 3], a
	ld a, b
	ld [hDividend + 2], a

.asm_357d6
	ld b, $4
	call Divide
	ld a, [hQuotient + 2]
	ld b, a
	ld hl, .FlailPower

.asm_357e1
	ld a, [hli]
	cp b
	jr nc, .asm_357e8
	inc hl
	jr .asm_357e1

.asm_357e8
	ld a, [hBattleTurn]
	and a
	ld a, [hl]
	jr nz, .notPlayersTurn

	ld hl, wPlayerMoveStruct + MOVE_POWER
	ld [hl], a
	push hl
	call PlayerAttackDamage
	jr .notEnemysTurn

.notPlayersTurn
	ld hl, wEnemyMoveStruct + MOVE_POWER
	ld [hl], a
	push hl
	call EnemyAttackDamage

.notEnemysTurn
	call BattleCommand_DamageCalc
	pop hl
	ld [hl], 1
	ret

.FlailPower
	;  px,  bp
	db  1, 200
	db  4, 150
	db  9, 100
	db 16,  80
	db 32,  40
	db 48,  20
; 35813


BattleCommand_Counter: ; 35813
; counter

	ld a, 1
	ld [AttackMissed], a
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	ret z

	ld b, a
	callab GetMoveEffect
	ld a, b
	cp EFFECT_COUNTER
	ret z

	call BattleCommand_ResetTypeMatchup
	ld a, [wTypeMatchup]
	and a
	ret z

	call Function36abf
	ret z

	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	dec a
	ld de, StringBuffer1
	call GetMoveData

	ld a, [StringBuffer1 + 2]
	and a
	ret z

	ld a, [StringBuffer1 + 3]
	cp SPECIAL
	ret nc

	ld hl, CurDamage
	ld a, [hli]
	or [hl]
	ret z

	ld a, [hl]
	add a
	ld [hld], a
	ld a, [hl]
	adc a
	ld [hl], a
	jr nc, .capped
	ld a, $ff
	ld [hli], a
	ld [hl], a
.capped

	xor a
	ld [AttackMissed], a
	ret
; 35864


BattleCommand_Encore: ; 35864
; encore

	ld hl, EnemyMonMoves
	ld de, EnemyEncoreCount
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, BattleMonMoves
	ld de, PlayerEncoreCount
.ok
	ld a, BATTLE_VARS_LAST_MOVE_OPP
	call GetBattleVar
	and a
	jp z, .failed
	cp STRUGGLE
	jp z, .failed
	cp ENCORE
	jp z, .failed
	cp MIRROR_MOVE
	jp z, .failed
	ld b, a

.asm_3588e
	ld a, [hli]
	cp b
	jr nz, .asm_3588e

	ld bc, $0005
	add hl, bc
	ld a, [hl]
	and $3f
	jp z, .failed
	ld a, [AttackMissed]
	and a
	jp nz, .failed
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_ENCORED, [hl]
	jp nz, .failed
	set SUBSTATUS_ENCORED, [hl]
	call BattleRandom
	and $3
rept 3
	inc a
endr
	ld [de], a
	call Function36abf
	jr nz, .asm_3591a
	ld a, [hBattleTurn]
	and a
	jr z, .asm_358ef

	push hl
	ld a, [LastPlayerMove]
	ld b, a
	ld c, 0
	ld hl, BattleMonMoves
.asm_358cc
	ld a, [hli]
	cp b
	jr z, .asm_358dd
	inc c
	ld a, c
	cp NUM_MOVES
	jr c, .asm_358cc
	pop hl
	res SUBSTATUS_ENCORED, [hl]
	xor a
	ld [de], a
	jr .failed

.asm_358dd
	pop hl

	ld a, c
	ld [CurMoveNum], a
	ld a, b
	ld [CurPlayerMove], a
	dec a
	ld de, wPlayerMoveStruct
	call GetMoveData
	jr .asm_3591a

.asm_358ef
	push hl
	ld a, [LastEnemyMove]
	ld b, a
	ld c, 0
	ld hl, EnemyMonMoves
.asm_358f9
	ld a, [hli]
	cp b
	jr z, .asm_3590a
	inc c
	ld a, c
	cp NUM_MOVES
	jr c, .asm_358f9
	pop hl
	res SUBSTATUS_ENCORED, [hl]
	xor a
	ld [de], a
	jr .failed
.asm_3590a
	pop hl

	ld a, c
	ld [CurEnemyMoveNum], a
	ld a, b
	ld [CurEnemyMove], a
	dec a
	ld de, wEnemyMoveStruct
	call GetMoveData

.asm_3591a
	call AnimateCurrentMove
	ld hl, GotAnEncoreText
	jp StdBattleTextBox

.failed
	jp PrintDidntAffect2
; 35926


BattleCommand_PainSplit: ; 35926
; painsplit

	ld a, [AttackMissed]
	and a
	jp nz, Function359cd
	call CheckSubstituteOpp
	jp nz, Function359cd
	call AnimateCurrentMove
	ld hl, BattleMonMaxHP + 1
	ld de, EnemyMonMaxHP + 1
	call .asm_3597d
	ld a, $1
	ld [wd10a], a
	hlcoord 10, 9
	predef AnimateHPBar
	ld hl, EnemyMonHP
	ld a, [hli]
	ld [Buffer4], a
	ld a, [hli]
	ld [Buffer3], a
	ld a, [hli]
	ld [Buffer2], a
	ld a, [hl]
	ld [Buffer1], a
	call Function359ac
	xor a
	ld [wd10a], a
	call ResetDamage
	hlcoord 2, 2
	predef AnimateHPBar
	callba Function178000

	ld hl, SharedPainText
	jp StdBattleTextBox

.asm_3597d
	ld a, [hld]
	ld [Buffer1], a
	ld a, [hld]
	ld [Buffer2], a
	ld a, [hld]
	ld b, a
	ld [Buffer3], a
	ld a, [hl]
	ld [Buffer4], a
rept 2
	dec de
endr
	ld a, [de]
	dec de
	add b
	ld [CurDamage + 1], a
	ld b, [hl]
	ld a, [de]
	adc b
	srl a
	ld [CurDamage], a
	ld a, [CurDamage + 1]
	rr a
	ld [CurDamage + 1], a
rept 3
	inc hl
endr
rept 3
	inc de
endr

	; fallthrough
; 359ac


Function359ac: ; 359ac
	ld c, [hl]
	dec hl
	ld a, [CurDamage + 1]
	sub c
	ld b, [hl]
	dec hl
	ld a, [CurDamage]
	sbc b
	jr nc, .asm_359c2

	ld a, [CurDamage]
	ld b, a
	ld a, [CurDamage + 1]
	ld c, a
.asm_359c2
	ld a, c
	ld [hld], a
	ld [Buffer5], a
	ld a, b
	ld [hli], a
	ld [Buffer6], a
	ret
; 359cd

Function359cd: ; 359cd
	jp PrintDidntAffect2
; 359d0


BattleCommand_Snore: ; 359d0
; snore
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP
	ret nz
	call ResetDamage
	ld a, $1
	ld [AttackMissed], a
	call Function37354
	jp EndMoveEffect
; 359e6


BattleCommand_Conversion2: ; 359e6
; conversion2

	ld a, [AttackMissed]
	and a
	jr nz, .asm_35a50
	ld hl, BattleMonType1
	ld a, [hBattleTurn]
	and a
	jr z, .asm_359f7
	ld hl, EnemyMonType1
.asm_359f7
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	jr z, .asm_35a50
	push hl
	dec a
	ld hl, Moves + MOVE_TYPE
	call GetMoveAttr
	ld d, a
	pop hl
	cp CURSE_T
	jr z, .asm_35a50
	call AnimateCurrentMove
	call BattleCommand_SwitchTurn

.asm_35a13
	call BattleRandom
	and $1f
	cp UNUSED_TYPES
	jr c, .asm_35a24
	cp UNUSED_TYPES_END
	jr c, .asm_35a13
	cp TYPES_END
	jr nc, .asm_35a13
.asm_35a24
	ld [hli], a
	ld [hld], a
	push hl
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	push af
	push hl
	ld a, d
	ld [hl], a
	call BattleCheckTypeMatchup
	pop hl
	pop af
	ld [hl], a
	pop hl
	ld a, [wTypeMatchup]
	cp 10
	jr nc, .asm_35a13
	call BattleCommand_SwitchTurn

	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	predef GetTypeName
	ld hl, TransformedTypeText
	jp StdBattleTextBox

.asm_35a50
	jp Function37354
; 35a53


BattleCommand_LockOn: ; 35a53
; lockon

	call CheckSubstituteOpp
	jr nz, .asm_35a6e

	ld a, [AttackMissed]
	and a
	jr nz, .asm_35a6e

	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	set SUBSTATUS_LOCK_ON, [hl]
	call AnimateCurrentMove

	ld hl, TookAimText
	jp StdBattleTextBox

.asm_35a6e
	call AnimateFailedMove
	jp PrintDidntAffect
; 35a74


BattleCommand_Sketch: ; 35a74
; sketch

	call Function372d8

	ld a, [wLinkMode]
	and a
	jr z, .asm_35a83
	call AnimateFailedMove
	jp PrintNothingHappened
.asm_35a83

	call CheckSubstituteOpp
	jp nz, .asm_35b10

	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_TRANSFORMED, [hl]
	jp nz, .asm_35b10

	ld a, MON_MOVES
	call UserPartyAttr
	ld d, h
	ld e, l
	ld hl, BattleMonMoves
	ld a, [hBattleTurn]
	and a
	jr z, .asm_35aa5
	ld hl, EnemyMonMoves
.asm_35aa5
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	ld [wTypeMatchup], a
	ld b, a
	and a
	jr z, .asm_35b10
	cp STRUGGLE
	jr z, .asm_35b10
	ld c, NUM_MOVES
.asm_35ab7
	ld a, [hli]
	cp b
	jr z, .asm_35b10
	dec c
	jr nz, .asm_35ab7
	dec hl
	ld c, NUM_MOVES
.asm_35ac1
	dec c
	ld a, [hld]
	cp SKETCH
	jr nz, .asm_35ac1
	inc hl
	ld a, b
	ld [hl], a
	push bc
	push hl
	dec a
	ld hl, Moves + MOVE_PP
	call GetMoveAttr
	pop hl
	ld bc, BattleMonPP - BattleMonMoves
	add hl, bc
	ld [hl], a
	pop bc
	ld a, [hBattleTurn]
	and a
	jr z, .asm_35af6
	ld a, [wBattleMode]
	dec a
	jr nz, .asm_35af6
	ld a, [hl]
	push bc
	ld hl, wc739
	ld b, 0
	add hl, bc
	ld [hl], a
	ld hl, wc735
	add hl, bc
	pop bc
	ld [hl], b
	jr .asm_35b04
.asm_35af6
	ld a, [hl]
	push af
	ld l, c
	ld h, 0
	add hl, de
	ld a, b
	ld [hl], a
	pop af
	ld de, $0015
	add hl, de
	ld [hl], a
.asm_35b04
	call GetMoveName
	call AnimateCurrentMove

	ld hl, SketchedText
	jp StdBattleTextBox

.asm_35b10
	call AnimateFailedMove
	jp PrintDidntAffect
; 35b16


BattleCommand_DefrostOpponent: ; 35b16
; defrostopponent
; Thaw the opponent if frozen, and
; raise the user's Attack one stage.

	call AnimateCurrentMove

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	call Defrost

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVarAddr
	ld a, [hl]
	push hl
	push af

	ld a, EFFECT_ATTACK_UP
	ld [hl], a
	call BattleCommand_StatUp

	pop af
	pop hl
	ld [hl], a
	ret
; 35b33


BattleCommand_SleepTalk: ; 35b33
; sleeptalk

	call Function372d8
	ld a, [AttackMissed]
	and a
	jr nz, .asm_35ba3
	ld a, [hBattleTurn]
	and a
	ld hl, BattleMonMoves + 1
	ld a, [DisabledMove]
	ld d, a
	jr z, .asm_35b4f
	ld hl, EnemyMonMoves + 1
	ld a, [EnemyDisabledMove]
	ld d, a
.asm_35b4f
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP
	jr z, .asm_35ba3
	ld a, [hl]
	and a
	jr z, .asm_35ba3
	call .asm_35ba9
	jr c, .asm_35ba3
	dec hl
.asm_35b62
	push hl
	call BattleRandom
	and 3 ; TODO factor in NUM_MOVES
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	pop hl
	and a
	jr z, .asm_35b62
	ld e, a
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	cp e
	jr z, .asm_35b62
	ld a, e
	cp d
	jr z, .asm_35b62
	call .asm_35bdf
	jr z, .asm_35b62
	ld a, BATTLE_VARS_MOVE
	call GetBattleVarAddr
	ld a, e
	ld [hl], a
	call Function34548
	jr nz, .asm_35b9a
	ld a, [wKickCounter]
	push af
	call BattleCommand_LowerSub
	pop af
	ld [wKickCounter], a
.asm_35b9a
	call PlayPlayerMoveAnim_ClearHiID
	call UpdateMoveData
	jp ResetTurn
.asm_35ba3
	call AnimateFailedMove
	jp TryPrintButItFailed

.asm_35ba9
	push hl
	push de
	push bc
	call .asm_35bb3
	pop bc
	pop de
	pop hl
	ret

.asm_35bb3
	ld a, [hBattleTurn]
	and a
	ld a, [DisabledMove]
	jr z, .asm_35bbe

	ld a, [EnemyDisabledMove]
.asm_35bbe
	ld b, a
	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld c, a
	dec hl
	ld d, NUM_MOVES
.asm_35bc8
	ld a, [hl]
	and a
	jr z, .asm_35bdb

	cp c
	jr z, .asm_35bd7
	cp b
	jr z, .asm_35bd7

	call .asm_35bdf
	jr nz, .asm_35bdd

.asm_35bd7
	inc hl
	dec d
	jr nz, .asm_35bc8

.asm_35bdb
	scf
	ret

.asm_35bdd
	and a
	ret

.asm_35bdf
	push hl
	push de
	push bc

	ld b, a
	callab GetMoveEffect
	ld a, b

	pop bc
	pop de
	pop hl

	cp EFFECT_SKULL_BASH
	ret z
	cp EFFECT_RAZOR_WIND
	ret z
	cp EFFECT_SKY_ATTACK
	ret z
	cp EFFECT_SOLARBEAM
	ret z
	cp EFFECT_FLY
	ret z
	cp EFFECT_BIDE
	ret
; 35bff


BattleCommand_DestinyBond: ; 35bff
; destinybond

	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	set SUBSTATUS_DESTINY_BOND, [hl]
	call AnimateCurrentMove
	ld hl, DestinyBondEffectText
	jp StdBattleTextBox
; 35c0f


BattleCommand_Spite: ; 35c0f
; spite

	ld a, [AttackMissed]
	and a
	jp nz, .asm_35c91
	ld bc, PARTYMON_STRUCT_LENGTH ; ????
	ld hl, EnemyMonMoves
	ld a, [hBattleTurn]
	and a
	jr z, .asm_35c24
	ld hl, BattleMonMoves
.asm_35c24
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	jr z, .asm_35c91
	cp STRUGGLE
	jr z, .asm_35c91
	ld b, a
	ld c, -1
.asm_35c33
	inc c
	ld a, [hli]
	cp b
	jr nz, .asm_35c33
	ld [wTypeMatchup], a
	dec hl
	ld b, 0
	push bc
	ld c, BattleMonPP - BattleMonMoves
	add hl, bc
	pop bc
	ld a, [hl]
	and $3f
	jr z, .asm_35c91
	push bc
	call GetMoveName
	call BattleRandom
	and 3
rept 2
	inc a
endr
	ld b, a
	ld a, [hl]
	and $3f
	cp b
	jr nc, .asm_35c5b
	ld b, a
.asm_35c5b
	ld a, [hl]
	sub b
	ld [hl], a
	push af
	ld a, MON_PP
	call OpponentPartyAttr
	ld d, b
	pop af
	pop bc
	add hl, bc
	ld e, a
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVar
	bit SUBSTATUS_TRANSFORMED, a
	jr nz, .asm_35c82
	ld a, [hBattleTurn]
	and a
	jr nz, .asm_35c81
	ld a, [wBattleMode]
	dec a
	jr nz, .asm_35c81
	ld hl, wc739
	add hl, bc
.asm_35c81
	ld [hl], e
.asm_35c82
	push de
	call AnimateCurrentMove
	pop de
	ld a, d
	ld [wTypeMatchup], a
	ld hl, SpiteEffectText
	jp StdBattleTextBox
.asm_35c91
	jp PrintDidntAffect2
; 35c94


BattleCommand_FalseSwipe: ; 35c94
; falseswipe

	ld hl, EnemyMonHP
	ld a, [hBattleTurn]
	and a
	jr z, .asm_35c9f
	ld hl, BattleMonHP
.asm_35c9f
	ld de, CurDamage
	ld c, $2
	push hl
	push de
	call StringCmp
	pop de
	pop hl
	jr c, .asm_35cc7
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	dec a
	ld [de], a
	inc a
	jr nz, .asm_35cba
	dec de
	ld a, [de]
	dec a
	ld [de], a
.asm_35cba
	ld a, [CriticalHit]
	cp $2
	jr nz, .asm_35cc5
	xor a
	ld [CriticalHit], a
.asm_35cc5
	scf
	ret
.asm_35cc7
	and a
	ret
; 35cc9


BattleCommand_HealBell: ; 35cc9
; healbell

	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	res SUBSTATUS_NIGHTMARE, [hl]
	ld de, PartyMon1Status
	ld a, [hBattleTurn]
	and a
	jr z, .asm_35cdb
	ld de, OTPartyMon1Status
.asm_35cdb
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	xor a
	ld [hl], a
	ld h, d
	ld l, e
	ld bc, PARTYMON_STRUCT_LENGTH
	ld d, PartyEnd - PartySpecies
.asm_35ce9
	ld [hl], a
	add hl, bc
	dec d
	jr nz, .asm_35ce9
	call AnimateCurrentMove

	ld hl, BellChimedText
	call StdBattleTextBox

	ld a, [hBattleTurn]
	and a
	jp z, CalcPlayerStats
	jp CalcEnemyStats
; 35d00


FarPlayBattleAnimation: ; 35d00
; play animation de

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret nz

	; fallthrough
; 35d08

PlayFXAnimID: ; 35d08
	ld a, e
	ld [FXAnimIDLo], a
	ld a, d
	ld [FXAnimIDHi], a

	ld c, 3
	call DelayFrames

	callab PlayBattleAnim

	ret
; 35d1c


Function35d1c: ; 35d1c
	ld hl, CurDamage
	ld a, [hli]
	ld b, a
	ld a, [hl]
	or b
	jr z, .asm_35d7b

	ld a, c
	and a
	jr nz, .asm_35d31

	ld a, [EnemySubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	jp nz, Function35de0
.asm_35d31
	ld a, [hld]
	ld b, a
	ld a, [EnemyMonHP + 1]
	ld [Buffer3], a
	sub b
	ld [EnemyMonHP + 1], a
	ld a, [hl]
	ld b, a
	ld a, [EnemyMonHP]
	ld [Buffer4], a
	sbc b
	ld [EnemyMonHP], a
	jr nc, .asm_35d59

	ld a, [Buffer4]
	ld [hli], a
	ld a, [Buffer3]
	ld [hl], a

	xor a
	ld hl, EnemyMonHP
	ld [hli], a
	ld [hl], a

.asm_35d59
	ld hl, EnemyMonMaxHP
	ld a, [hli]
	ld [Buffer2], a
	ld a, [hl]
	ld [Buffer1], a
	ld hl, EnemyMonHP
	ld a, [hli]
	ld [Buffer6], a
	ld a, [hl]
	ld [Buffer5], a
	hlcoord 2, 2
	xor a
	ld [wd10a], a
	predef AnimateHPBar
.asm_35d7b
	jp RefreshBattleHuds
; 35d7e


Function35d7e: ; 35d7e
	ld hl, CurDamage
	ld a, [hli]
	ld b, a
	ld a, [hl]
	or b
	jr z, .asm_35ddd

	ld a, c
	and a
	jr nz, .asm_35d93

	ld a, [PlayerSubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	jp nz, Function35de0
.asm_35d93
	ld a, [hld]
	ld b, a
	ld a, [BattleMonHP + 1]
	ld [Buffer3], a
	sub b
	ld [BattleMonHP + 1], a
	ld [Buffer5], a
	ld b, [hl]
	ld a, [BattleMonHP]
	ld [Buffer4], a
	sbc b
	ld [BattleMonHP], a
	ld [Buffer6], a
	jr nc, .asm_35dc5

	ld a, [Buffer4]
	ld [hli], a
	ld a, [Buffer3]
	ld [hl], a
	xor a

	ld hl, BattleMonHP
	ld [hli], a
	ld [hl], a
	ld hl, Buffer5
	ld [hli], a
	ld [hl], a

.asm_35dc5
	ld hl, BattleMonMaxHP
	ld a, [hli]
	ld [Buffer2], a
	ld a, [hl]
	ld [Buffer1], a
	hlcoord 10, 9
	ld a, $1
	ld [wd10a], a
	predef AnimateHPBar
.asm_35ddd
	jp RefreshBattleHuds
; 35de0


Function35de0: ; 35de0

	ld hl, SubTookDamageText
	call StdBattleTextBox

	ld de, EnemySubstituteHP
	ld a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld de, PlayerSubstituteHP
.got_hp

	ld hl, CurDamage
	ld a, [hli]
	and a
	jr nz, .broke

	ld a, [de]
	sub [hl]
	ld [de], a
	jr z, .broke
	jr nc, .done

.broke
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVarAddr
	res SUBSTATUS_SUBSTITUTE, [hl]

	ld hl, SubFadedText
	call StdBattleTextBox

	call BattleCommand_SwitchTurn
	call BattleCommand_LowerSubNoAnim
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	call z, Function37ec7
	call BattleCommand_SwitchTurn

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVarAddr
	cp EFFECT_MULTI_HIT
	jr z, .ok
	cp EFFECT_DOUBLE_HIT
	jr z, .ok
	cp EFFECT_TWINEEDLE
	jr z, .ok
	cp EFFECT_TRIPLE_KICK
	jr z, .ok
	cp EFFECT_BEAT_UP
	jr z, .ok
	xor a
	ld [hl], a
.ok
	call RefreshBattleHuds
.done
	jp ResetDamage
; 35e40


UpdateMoveData: ; 35e40

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarAddr
	ld d, h
	ld e, l

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld [CurMove], a
	ld [wNamedObjectIndexBuffer], a

	dec a
	call GetMoveData
	call GetMoveName
	jp CopyName1
; 35e5c


BattleCommand_SleepTarget: ; 35e5c
; sleeptarget

	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_SLEEP
	jr nz, .not_protected_by_item

	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	ld hl, ProtectedByText
	jr .fail

.not_protected_by_item
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	ld d, h
	ld e, l
	ld a, [de]
	and SLP
	ld hl, AlreadyAsleepText
	jr nz, .fail

	ld a, [AttackMissed]
	and a
	jp nz, PrintDidntAffect2

	ld hl, DidntAffect1Text
	call .CheckAIRandomFail
	jr c, .fail

	ld a, [de]
	and a
	jr nz, .fail

	call CheckSubstituteOpp
	jr nz, .fail

	call AnimateCurrentMove
	ld b, $7
	ld a, [InBattleTowerBattle]
	and a
	jr z, .random_loop
	ld b, $3

.random_loop
	call BattleRandom
	and b
	jr z, .random_loop
	cp 7
	jr z, .random_loop
	inc a
	ld [de], a
	call UpdateOpponentInParty
	call RefreshBattleHuds

	ld hl, FellAsleepText
	call StdBattleTextBox

	callba UseHeldStatusHealingItem

	jp z, OpponentCantMove
	ret

.fail
	push hl
	call AnimateFailedMove
	pop hl
	jp StdBattleTextBox
; 35ece


.CheckAIRandomFail: ; 35ece
	; Enemy turn
	ld a, [hBattleTurn]
	and a
	jr z, .dont_fail

	; Not in link battle
	ld a, [wLinkMode]
	and a
	jr nz, .dont_fail

	ld a, [InBattleTowerBattle]
	and a
	jr nz, .dont_fail

	; Not locked-on by the enemy
	ld a, [PlayerSubStatus5]
	bit SUBSTATUS_LOCK_ON, a
	jr nz, .dont_fail

	call BattleRandom
	cp $40 ; 25%
	ret c

.dont_fail
	xor a
	ret
; 35eee


BattleCommand_PoisonTarget: ; 35eee
; poisontarget

	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	ret nz
	ld a, [TypeModifier]
	and $7f
	ret z
	call CheckIfTargetIsPoisonType
	ret z
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_POISON
	ret z
	ld a, [EffectFailed]
	and a
	ret nz
	call SafeCheckSafeguard
	ret nz

	call PoisonOpponent
	ld de, ANIM_PSN
	call PlayOpponentBattleAnim
	call RefreshBattleHuds

	ld hl, WasPoisonedText
	call StdBattleTextBox

	callba UseHeldStatusHealingItem
	ret
; 35f2c


BattleCommand_Poison: ; 35f2c
; poison

	ld hl, DoesntAffectText
	ld a, [TypeModifier]
	and $7f
	jp z, .failed

	call CheckIfTargetIsPoisonType
	jp z, .failed

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	ld b, a
	ld hl, AlreadyPoisonedText
	and 1 << PSN
	jp nz, .failed

	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_POISON
	jr nz, .do_poison
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	ld hl, ProtectedByText
	jr .failed

.do_poison
	ld hl, DidntAffect1Text
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and a
	jr nz, .failed

	ld a, [hBattleTurn]
	and a
	jr z, .skip_random

	ld a, [wLinkMode]
	and a
	jr nz, .skip_random

	ld a, [InBattleTowerBattle]
	and a
	jr nz, .skip_random

	ld a, [PlayerSubStatus5]
	bit SUBSTATUS_LOCK_ON, a
	jr nz, .skip_random

	call BattleRandom
	cp $40 ; 25% chance AI fails
	jr c, .failed

.skip_random
	call CheckSubstituteOpp
	jr nz, .failed
	ld a, [AttackMissed]
	and a
	jr nz, .failed
	call .check_toxic
	jr z, .toxic

	call .apply_poison
	ld hl, WasPoisonedText
	call StdBattleTextBox
	jr .finished

.toxic
	set SUBSTATUS_TOXIC, [hl]
	xor a
	ld [de], a
	call .apply_poison

	ld hl, BadlyPoisonedText
	call StdBattleTextBox

.finished
	callba UseHeldStatusHealingItem
	ret

.failed
	push hl
	call AnimateFailedMove
	pop hl
	jp StdBattleTextBox
; 35fc0


.apply_poison: ; 35fc0
	call AnimateCurrentMove
	call PoisonOpponent
	jp RefreshBattleHuds
; 35fc9


.check_toxic: ; 35fc9
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	ld a, [hBattleTurn]
	and a
	ld de, EnemyToxicCount
	jr z, .ok
	ld de, PlayerToxicCount
.ok
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_TOXIC
	ret
; 35fe1


CheckIfTargetIsPoisonType: ; 35fe1
	ld de, EnemyMonType1
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, BattleMonType1
.ok
	ld a, [de]
	inc de
	cp POISON
	ret z
	ld a, [de]
	cp POISON
	ret
; 35ff5


PoisonOpponent: ; 35ff5
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set PSN, [hl]
	jp UpdateOpponentInParty
; 35fff


BattleCommand_DrainTarget: ; 35fff
; draintarget
	call SapHealth
	ld hl, SuckedHealthText
	jp StdBattleTextBox
; 36008


BattleCommand_EatDream: ; 36008
; eatdream
	call SapHealth
	ld hl, DreamEatenText
	jp StdBattleTextBox
; 36011


SapHealth: ; 36011
	ld hl, CurDamage
	ld a, [hli]
	srl a
	ld [hDividend], a
	ld b, a
	ld a, [hl]
	rr a
	ld [hDividend + 1], a
	or b
	jr nz, .ok1 ; 0x36020 $4
	ld a, $1
	ld [hDividend + 1], a
.ok1
	ld hl, BattleMonHP
	ld de, BattleMonMaxHP
	ld a, [hBattleTurn]
	and a
	jr z, .battlemonhp ; 0x3602f $6
	ld hl, EnemyMonHP
	ld de, EnemyMonMaxHP
.battlemonhp
	ld bc, Buffer4
	ld a, [hli]
	ld [bc], a
	ld a, [hl]
	dec bc
	ld [bc], a
	ld a, [de]
	dec bc
	ld [bc], a
	inc de
	ld a, [de]
	dec bc
	ld [bc], a
	ld a, [hDividend + 1]
	ld b, [hl]
	add b
	ld [hld], a
	ld [Buffer5], a
	ld a, [hDividend]
	ld b, [hl]
	adc b
	ld [hli], a
	ld [Buffer6], a
	jr c, .okay2 ; 0x36056 $c
	ld a, [hld]
	ld b, a
	ld a, [de]
	dec de
	sub b
	ld a, [hli]
	ld b, a
	ld a, [de]
	inc de
	sbc b
	jr nc, .okay3 ; 0x36062 $c
.okay2
	ld a, [de]
	ld [hld], a
	ld [Buffer5], a
	dec de
	ld a, [de]
	ld [hli], a
	ld [Buffer6], a
	inc de
.okay3
	ld a, [hBattleTurn]
	and a
	hlcoord 10, 9
	ld a, $1
	jr z, .hp_bar ; 0x36078 $4
	hlcoord 2, 2
	xor a
.hp_bar
	ld [wd10a], a
	predef AnimateHPBar
	call RefreshBattleHuds
	jp UpdateBattleMonInParty
; 3608c


BattleCommand_BurnTarget: ; 3608c
; burntarget

	xor a
	ld [wcfca], a
	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	jp nz, Defrost
	ld a, [TypeModifier]
	and $7f
	ret z
	call Function36e5b
	ret z
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_BURN
	ret z
	ld a, [EffectFailed]
	and a
	ret nz
	call SafeCheckSafeguard
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set BRN, [hl]
	call UpdateOpponentInParty
	ld hl, ApplyBrnEffectOnAttack
	call CallBattleCore
	ld de, ANIM_BRN
	call PlayOpponentBattleAnim
	call RefreshBattleHuds

	ld hl, WasBurnedText
	call StdBattleTextBox

	callba UseHeldStatusHealingItem
	ret
; 360dd


Defrost: ; 360dd
	ld a, [hl]
	and 1 << FRZ
	ret z

	xor a
	ld [hl], a

	ld a, [hBattleTurn]
	and a
	ld a, [CurOTMon]
	ld hl, OTPartyMon1Status
	jr z, .ok
	ld hl, PartyMon1Status
	ld a, [CurBattleMon]
.ok

	call GetPartyLocation
	xor a
	ld [hl], a
	call UpdateOpponentInParty

	ld hl, DefrostedOpponentText
	jp StdBattleTextBox
; 36102


BattleCommand_FreezeTarget: ; 36102
; freezetarget

	xor a
	ld [wcfca], a
	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	ret nz
	ld a, [TypeModifier]
	and $7f
	ret z
	ld a, [Weather]
	cp WEATHER_SUN
	ret z
	call Function36e5b
	ret z
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_FREEZE
	ret z
	ld a, [EffectFailed]
	and a
	ret nz
	call SafeCheckSafeguard
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set FRZ, [hl]
	call UpdateOpponentInParty
	ld de, ANIM_FRZ
	call PlayOpponentBattleAnim
	call RefreshBattleHuds

	ld hl, WasFrozenText
	call StdBattleTextBox

	callba UseHeldStatusHealingItem
	ret nz
	call OpponentCantMove
	call EndRechargeOpp
	ld hl, wc740
	ld a, [hBattleTurn]
	and a
	jr z, .finish
	ld hl, wc73f
.finish
	ld [hl], $1
	ret
; 36165


BattleCommand_ParalyzeTarget: ; 36165
; paralyzetarget

	xor a
	ld [wcfca], a
	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	ret nz
	ld a, [TypeModifier]
	and $7f
	ret z
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_PARALYZE
	ret z
	ld a, [EffectFailed]
	and a
	ret nz
	call SafeCheckSafeguard
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set PAR, [hl]
	call UpdateOpponentInParty
	ld hl, ApplyPrzEffectOnSpeed
	call CallBattleCore
	ld de, ANIM_PAR
	call PlayOpponentBattleAnim
	call RefreshBattleHuds
	call PrintParalyze
	ld hl, UseHeldStatusHealingItem
	jp CallBattleCore
; 361ac


BattleCommand_AttackUp: ; 361ac
; attackup
	ld b, ATTACK
	jr BattleCommand_StatUp
BattleCommand_DefenseUp: ; 361b0
; defenseup
	ld b, DEFENSE
	jr BattleCommand_StatUp
BattleCommand_SpeedUp: ; 361b4
; speedup
	ld b, SPEED
	jr BattleCommand_StatUp
BattleCommand_SpecialAttackUp: ; 361b8
; specialattackup
	ld b, SP_ATTACK
	jr BattleCommand_StatUp
BattleCommand_SpecialDefenseUp: ; 361bc
; specialdefenseup
	ld b, SP_DEFENSE
	jr BattleCommand_StatUp
BattleCommand_AccuracyUp: ; 361c0
; accuracyup
	ld b, ACCURACY
	jr BattleCommand_StatUp
BattleCommand_EvasionUp: ; 361c4
; evasionup
	ld b, EVASION
	jr BattleCommand_StatUp
BattleCommand_AttackUp2: ; 361c8
; attackup2
	ld b, $10 | ATTACK
	jr BattleCommand_StatUp
BattleCommand_DefenseUp2: ; 361cc
; defenseup2
	ld b, $10 | DEFENSE
	jr BattleCommand_StatUp
BattleCommand_SpeedUp2: ; 361d0
; speedup2
	ld b, $10 | SPEED
	jr BattleCommand_StatUp
BattleCommand_SpecialAttackUp2: ; 361d4
; specialattackup2
	ld b, $10 | SP_ATTACK
	jr BattleCommand_StatUp
BattleCommand_SpecialDefenseUp2: ; 361d8
; specialdefenseup2
	ld b, $10 | SP_DEFENSE
	jr BattleCommand_StatUp
BattleCommand_AccuracyUp2: ; 361dc
; accuracyup2
	ld b, $10 | ACCURACY
	jr BattleCommand_StatUp
BattleCommand_EvasionUp2: ; 361e0
; evasionup2
	ld b, $10 | EVASION
	jr BattleCommand_StatUp
BattleCommand_StatUp: ; 361e4
; statup
	call CheckIfStatCanBeRaised
	ld a, [FailedMessage]
	and a
	ret nz
	jp Function36281
; 361ef


CheckIfStatCanBeRaised: ; 361ef
	ld a, b
	ld [LoweredStat], a
	ld hl, PlayerStatLevels
	ld a, [hBattleTurn]
	and a
	jr z, .got_stat_levels ; 0x361f9 $3
	ld hl, EnemyStatLevels
.got_stat_levels
	ld a, [AttackMissed]
	and a
	jp nz, .stat_raise_failed
	ld a, [EffectFailed]
	and a
	jp nz, .stat_raise_failed
	ld a, [LoweredStat]
	and $f
	ld c, a
	ld b, 0
	add hl, bc
	ld b, [hl]
	inc b
	ld a, $d
	cp b
	jp c, .cant_raise_stat
	ld a, [LoweredStat]
	and $f0
	jr z, .got_num_stages ; 0x36222 $7
	inc b
	ld a, $d
	cp b
	jr nc, .got_num_stages ; 0x36228 $1
	ld b, a
.got_num_stages
	ld [hl], b
	push hl
	ld a, c
	cp $5
	jr nc, .done_calcing_stats ; 0x36230 $36
	ld hl, BattleMonStats + 1
	ld de, PlayerStats
	ld a, [hBattleTurn]
	and a
	jr z, .got_stats_pointer ; 0x3623b $6
	ld hl, EnemyMonStats + 1
	ld de, EnemyStats
.got_stats_pointer
	push bc
	sla c
	ld b, 0
	add hl, bc
	ld a, c
	add e
	ld e, a
	jr nc, .no_carry ; 0x3624c $1
	inc d
.no_carry
	pop bc
	ld a, [hld]
	sub 999 % $100
	jr nz, .not_already_max ; 0x36253 $6
	ld a, [hl]
	sbc 999 / $100
	jp z, .stats_already_max
.not_already_max
	ld a, [hBattleTurn]
	and a
	jr z, .calc_player_stats ; 0x3625e $5
	call CalcEnemyStats
	jr .done_calcing_stats ; 0x36263 $3
.calc_player_stats
	call CalcPlayerStats
.done_calcing_stats
	pop hl
	xor a
	ld [FailedMessage], a
	ret
; 3626e


.stats_already_max: ; 3626e
	pop hl
	dec [hl]
	; fallthrough
; 36270


.cant_raise_stat: ; 36270
	ld a, $2
	ld [FailedMessage], a
	ld a, $1
	ld [AttackMissed], a
	ret
; 3627b


.stat_raise_failed: ; 3627b
	ld a, $1
	ld [FailedMessage], a
	ret
; 36281


Function36281: ; 36281
	ld bc, wc6fe
	ld hl, Function3f447
	ld a, [hBattleTurn]
	and a
	jr z, .do_player ; 0x3628a $6
	ld bc, wc6fa
	ld hl, Function3f486
.do_player
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	cp MINIMIZE
	ret nz

	ld a, $1
	ld [bc], a
	call _CheckBattleScene
	ret nc

	xor a
	ld [$ffd4], a
	call CallBattleCore
	call WaitBGMap
	jp BattleCommand_MoveDelay
; 362ad


BattleCommand_AttackDown: ; 362ad
; attackdown
	ld a, ATTACK
	jr BattleCommand_StatDown
BattleCommand_DefenseDown: ; 362b1
; defensedown
	ld a, DEFENSE
	jr BattleCommand_StatDown
BattleCommand_SpeedDown: ; 362b5
; speeddown
	ld a, SPEED
	jr BattleCommand_StatDown
BattleCommand_SpecialAttackDown: ; 362b9
; specialattackdown
	ld a, SP_ATTACK
	jr BattleCommand_StatDown
BattleCommand_SpecialDefenseDown: ; 362bd
; specialdefensedown
	ld a, SP_DEFENSE
	jr BattleCommand_StatDown
BattleCommand_AccuracyDown: ; 362c1
; accuracydown
	ld a, ACCURACY
	jr BattleCommand_StatDown
BattleCommand_EvasionDown: ; 362c5
; evasiondown
	ld a, EVASION
	jr BattleCommand_StatDown
BattleCommand_AttackDown2: ; 362c9
; attackdown2
	ld a, $10 | ATTACK
	jr BattleCommand_StatDown
BattleCommand_DefenseDown2: ; 362cd
; defensedown2
	ld a, $10 | DEFENSE
	jr BattleCommand_StatDown
BattleCommand_SpeedDown2: ; 362d1
; speeddown2
	ld a, $10 | SPEED
	jr BattleCommand_StatDown
BattleCommand_SpecialAttackDown2: ; 362d5
; specialattackdown2
	ld a, $10 | SP_ATTACK
	jr BattleCommand_StatDown
BattleCommand_SpecialDefenseDown2: ; 362d9
; specialdefensedown2
	ld a, $10 | SP_DEFENSE
	jr BattleCommand_StatDown
BattleCommand_AccuracyDown2: ; 362dd
; accuracydown2
	ld a, $10 | ACCURACY
	jr BattleCommand_StatDown
BattleCommand_EvasionDown2: ; 362e1
; evasiondown2
	ld a, $10 | EVASION

BattleCommand_StatDown: ; 362e3
; statdown

	ld [LoweredStat], a

	call CheckMist
	jp nz, .Mist

	ld hl, EnemyStatLevels
	ld a, [hBattleTurn]
	and a
	jr z, .GetStatLevel
	ld hl, PlayerStatLevels

.GetStatLevel
; Attempt to lower the stat.
	ld a, [LoweredStat]
	and $f
	ld c, a
	ld b, 0
	add hl, bc
	ld b, [hl]
	dec b
	jp z, .CantLower

; Sharply lower the stat if applicable.
	ld a, [LoweredStat]
	and $f0
	jr z, .ComputerMiss
	dec b
	jr nz, .ComputerMiss
	inc b

.ComputerMiss
; Computer opponents have a 1/4 chance of failing.
	ld a, [hBattleTurn]
	and a
	jr z, .DidntMiss

	ld a, [wLinkMode]
	and a
	jr nz, .DidntMiss

	ld a, [InBattleTowerBattle]
	and a
	jr nz, .DidntMiss

; Lock-On still always works.
	ld a, [PlayerSubStatus5]
	bit SUBSTATUS_LOCK_ON, a
	jr nz, .DidntMiss

; Attacking moves that also lower accuracy are unaffected.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_ACCURACY_DOWN_HIT
	jr z, .DidntMiss

	call BattleRandom
	cp $40
	jr c, .Failed

.DidntMiss
	call CheckSubstituteOpp
	jr nz, .Failed

	ld a, [AttackMissed]
	and a
	jr nz, .Failed

	ld a, [EffectFailed]
	and a
	jr nz, .Failed

	call CheckHiddenOpponent
	jr nz, .Failed

; Accuracy/Evasion reduction don't involve stats.
	ld [hl], b
	ld a, c
	cp ACCURACY
	jr nc, .Hit

	push hl
	ld hl, EnemyMonAttack + 1
	ld de, EnemyStats
	ld a, [hBattleTurn]
	and a
	jr z, .do_enemy
	ld hl, BattleMonAttack + 1
	ld de, PlayerStats
.do_enemy
	call TryLowerStat
	pop hl
	jr z, .CouldntLower

.Hit
	xor a
	ld [FailedMessage], a
	ret

.CouldntLower
	inc [hl]
.CantLower
	ld a, 3
	ld [FailedMessage], a
	ld a, 1
	ld [AttackMissed], a
	ret

.Failed
	ld a, 1
	ld [FailedMessage], a
	ld [AttackMissed], a
	ret

.Mist
	ld a, 2
	ld [FailedMessage], a
	ld a, 1
	ld [AttackMissed], a
	ret
; 36391


CheckMist: ; 36391
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_ATTACK_DOWN
	jr c, .dont_check_mist
	cp EFFECT_EVASION_DOWN + 1
	jr c, .check_mist
	cp EFFECT_ATTACK_DOWN_2
	jr c, .dont_check_mist
	cp EFFECT_EVASION_DOWN_2 + 1
	jr c, .check_mist
	cp EFFECT_ATTACK_DOWN_HIT
	jr c, .dont_check_mist
	cp EFFECT_EVASION_DOWN_HIT + 1
	jr c, .check_mist
.dont_check_mist
	xor a
	ret

.check_mist
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_MIST, a
	ret
; 363b8


BattleCommand_StatUpMessage: ; 363b8
	ld a, [FailedMessage]
	and a
	ret nz
	ld a, [LoweredStat]
	and $f
	ld b, a
	inc b
	call GetStatName
	ld hl, .stat
	jp BattleTextBox

.stat
	text_jump UnknownText_0x1c0cc6
	start_asm

	ld hl, .up
	ld a, [LoweredStat]
	and $f0
	ret z
	ld hl, .wayup
	ret

.wayup
	text_jump UnknownText_0x1c0cd0
	db "@"

.up
	text_jump UnknownText_0x1c0ce0
	db "@"

; 363e9


BattleCommand_StatDownMessage: ; 363e9
	ld a, [FailedMessage]
	and a
	ret nz
	ld a, [LoweredStat]
	and $f
	ld b, a
	inc b
	call GetStatName
	ld hl, .stat
	jp BattleTextBox

.stat
	text_jump UnknownText_0x1c0ceb
	start_asm

	ld hl, .fell
	ld a, [LoweredStat]
	and $f0
	ret z
	ld hl, .sharplyfell
	ret

.sharplyfell
	text_jump UnknownText_0x1c0cf5
	db "@"
.fell
	text_jump UnknownText_0x1c0d06
	db "@"

; 3641a


TryLowerStat: ; 3641a
; Lower stat c from stat struct hl (buffer de).

	push bc
	sla c
	ld b, 0
	add hl, bc
	; add de, c
	ld a, c
	add e
	ld e, a
	jr nc, .no_carry
	inc d
.no_carry
	pop bc

; The lowest possible stat is 1.
	ld a, [hld]
	sub 1
	jr nz, .not_min
	ld a, [hl]
	and a
	ret z

.not_min
	ld a, [hBattleTurn]
	and a
	jr z, .Player

	call BattleCommand_SwitchTurn
	call CalcPlayerStats
	call BattleCommand_SwitchTurn
	jr .end

.Player
	call BattleCommand_SwitchTurn
	call CalcEnemyStats
	call BattleCommand_SwitchTurn
.end
	ld a, 1
	and a
	ret
; 3644c


BattleCommand_StatUpFailText: ; 3644c
; statupfailtext
	ld a, [FailedMessage]
	and a
	ret z
	push af
	call BattleCommand_MoveDelay
	pop af
	dec a
	jp z, TryPrintButItFailed
	ld a, [LoweredStat]
	and $f
	ld b, a
	inc b
	call GetStatName
	ld hl, WontRiseAnymoreText
	jp StdBattleTextBox
; 3646a


BattleCommand_StatDownFailText: ; 3646a
; statdownfailtext
	ld a, [FailedMessage]
	and a
	ret z
	push af
	call BattleCommand_MoveDelay
	pop af
	dec a
	jp z, TryPrintButItFailed
	dec a
	ld hl, ProtectedByMistText
	jp z, StdBattleTextBox
	ld a, [LoweredStat]
	and $f
	ld b, a
	inc b
	call GetStatName
	ld hl, WontDropAnymoreText
	jp StdBattleTextBox
; 3648f


GetStatName: ; 3648f
	ld hl, .names
	ld c, "@"
.CheckName
	dec b
	jr z, .Copy
.GetName
	ld a, [hli]
	cp c
	jr z, .CheckName
	jr .GetName
.Copy
	ld de, StringBuffer2
	ld bc, StringBuffer3 - StringBuffer2
	jp CopyBytes

.names
	db "ATTACK@"
	db "DEFENSE@"
	db "SPEED@"
	db "SPCL.ATK@"
	db "SPCL.DEF@"
	db "ACCURACY@"
	db "EVASION@"
	db "ABILITY@"
; 364e6


StatLevelMultipliers: ; 364e6
	db 25, 100 ; 0.25x
	db 28, 100 ; 0.28x
	db 33, 100 ; 0.33x
	db 40, 100 ; 0.40x
	db 50, 100 ; 0.50x
	db 66, 100 ; 0.66x
	db  1,   1 ; 1.00x
	db 15,  10 ; 1.50x
	db  2,   1 ; 2.00x
	db 25,  10 ; 2.50x
	db  3,   1 ; 3.00x
	db 35,  10 ; 3.50x
	db  4,   1 ; 4.00x
; 36500


BattleCommand_AllStatsUp: ; 36500
; allstatsup

; Attack
	call ResetMiss
	call BattleCommand_AttackUp
	call BattleCommand_StatUpMessage

; Defense
	call ResetMiss
	call BattleCommand_DefenseUp
	call BattleCommand_StatUpMessage

; Speed
	call ResetMiss
	call BattleCommand_SpeedUp
	call BattleCommand_StatUpMessage

; Special Attack
	call ResetMiss
	call BattleCommand_SpecialAttackUp
	call BattleCommand_StatUpMessage

; Special Defense
	call ResetMiss
	call BattleCommand_SpecialDefenseUp
	jp   BattleCommand_StatUpMessage
; 3652d


ResetMiss: ; 3652d
	xor a
	ld [AttackMissed], a
	ret
; 36532


LowerStat: ; 36532
	ld [LoweredStat], a

	ld hl, PlayerStatLevels
	ld a, [hBattleTurn]
	and a
	jr z, .got_target
	ld hl, EnemyStatLevels

.got_target
	ld a, [LoweredStat]
	and $f
	ld c, a
	ld b, 0
	add hl, bc
	ld b, [hl]
	dec b
	jr z, .cant_lower_anymore

	ld a, [LoweredStat]
	and $f0
	jr z, .got_num_stages
	dec b
	jr nz, .got_num_stages
	inc b

.got_num_stages
	ld [hl], b
	ld a, c
	cp 5
	jr nc, .accuracy_evasion

	push hl
	ld hl, BattleMonStats + 1
	ld de, PlayerStats
	ld a, [hBattleTurn]
	and a
	jr z, .got_target_2
	ld hl, EnemyMonStats + 1
	ld de, EnemyStats

.got_target_2
	call TryLowerStat
	pop hl
	jr z, .failed

.accuracy_evasion
	ld a, [hBattleTurn]
	and a
	jr z, .player

	call CalcEnemyStats

	jr .finish

.player
	call CalcPlayerStats

.finish
	xor a
	ld [FailedMessage], a
	ret

.failed
	inc [hl]

.cant_lower_anymore
	ld a, 2
	ld [FailedMessage], a
	ret
; 3658f


BattleCommand_TriStatusChance: ; 3658f
; tristatuschance

	call BattleCommand_EffectChance

; 1/3 chance of each status
.loop
	call BattleRandom
	swap a
	and 3
	jr z, .loop
; jump
	dec a
	ld hl, .ptrs
	rst JumpTable
	ret
.ptrs
	dw BattleCommand_ParalyzeTarget ; paralyze
	dw BattleCommand_FreezeTarget ; freeze
	dw BattleCommand_BurnTarget ; burn
; 365a7


BattleCommand_Curl: ; 365a7
; curl
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVarAddr
	set SUBSTATUS_CURLED, [hl]
	ret
; 365af


BattleCommand_RaiseSubNoAnim: ; 365af
	ld hl, GetMonBackpic
	ld a, [hBattleTurn]
	and a
	jr z, .PlayerTurn ; 365b5 $3
	ld hl, GetMonFrontpic
.PlayerTurn
	xor a
	ld [$ffd4], a
	call CallBattleCore
	jp WaitBGMap
; 365c3


BattleCommand_LowerSubNoAnim: ; 365c3
	ld hl, Function3f447
	ld a, [hBattleTurn]
	and a
	jr z, .PlayerTurn ; 365c9 $3
	ld hl, Function3f486
.PlayerTurn
	xor a
	ld [$ffd4], a
	call CallBattleCore
	jp WaitBGMap
; 365d7


CalcPlayerStats: ; 365d7
	ld hl, PlayerAtkLevel
	ld de, PlayerStats
	ld bc, BattleMonAttack

	ld a, 5
	call CalcStats

	ld hl, BadgeStatBoosts
	call CallBattleCore

	call BattleCommand_SwitchTurn

	ld hl, ApplyPrzEffectOnSpeed
	call CallBattleCore

	ld hl, ApplyBrnEffectOnAttack
	call CallBattleCore

	jp BattleCommand_SwitchTurn
; 365fd


CalcEnemyStats: ; 365fd
	ld hl, EnemyAtkLevel
	ld de, EnemyStats
	ld bc, EnemyMonAttack

	ld a, 5
	call CalcStats

	call BattleCommand_SwitchTurn

	ld hl, ApplyPrzEffectOnSpeed
	call CallBattleCore

	ld hl, ApplyBrnEffectOnAttack
	call CallBattleCore

	jp BattleCommand_SwitchTurn
; 3661d


CalcStats: ; 3661d
.loop
	push af
	ld a, [hli]
	push hl
	push bc

	ld c, a
	dec c
	ld b, 0
	ld hl, StatLevelMultipliers
rept 2
	add hl, bc
endr

	xor a
	ld [hMultiplicand + 0], a
	ld a, [de]
	ld [hMultiplicand + 1], a
	inc de
	ld a, [de]
	ld [hMultiplicand + 2], a
	inc de

	ld a, [hli]
	ld [hMultiplier], a
	call Multiply

	ld a, [hl]
	ld [hDivisor], a
	ld b, 4
	call Divide

	ld a, [hQuotient + 1]
	ld b, a
	ld a, [hQuotient + 2]
	or b
	jr nz, .check_maxed_out

	ld a, 1
	ld [hQuotient + 2], a
	jr .not_maxed_out

.check_maxed_out
	ld a, [hQuotient + 2]
	cp 999 % $100
	ld a, b
	sbc 999 / $100
	jr c, .not_maxed_out

	ld a, 999 % $100
	ld [$ffb6], a
	ld a, 999 / $100
	ld [$ffb5], a

.not_maxed_out
	pop bc
	ld a, [$ffb5]
	ld [bc], a
	inc bc
	ld a, [$ffb6]
	ld [bc], a
	inc bc
	pop hl
	pop af
	dec a
	jr nz, .loop

	ret
; 36671


BattleCommand_StoreEnergy: ; 36671
; storeenergy

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	bit SUBSTATUS_BIDE, a
	ret z

	ld hl, PlayerRolloutCount
	ld a, [hBattleTurn]
	and a
	jr z, .check_still_storing_energy
	ld hl, EnemyRolloutCount
.check_still_storing_energy
	dec [hl]
	jr nz, .still_storing

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	res SUBSTATUS_BIDE, [hl]

	ld hl, UnleashedEnergyText
	call StdBattleTextBox

	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVarAddr
	ld a, 1
	ld [hl], a
	ld hl, PlayerDamageTaken + 1
	ld de, wPlayerCharging ; player
	ld a, [hBattleTurn]
	and a
	jr z, .player
	ld hl, EnemyDamageTaken + 1
	ld de, wEnemyCharging ; enemy
.player
	ld a, [hld]
	add a
	ld b, a
	ld [CurDamage + 1], a
	ld a, [hl]
	rl a
	ld [CurDamage], a
	jr nc, .not_maxed
	ld a, $ff
	ld [CurDamage], a
	ld [CurDamage + 1], a
.not_maxed
	or b
	jr nz, .built_up_something
	ld a, 1
	ld [AttackMissed], a
.built_up_something
	xor a
	ld [hli], a
	ld [hl], a
	ld [de], a

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarAddr
	ld a, BIDE
	ld [hl], a

	ld b, unleashenergy_command
	jp SkipToBattleCommand

.still_storing
	ld hl, StoringEnergyText
	call StdBattleTextBox
	jp EndMoveEffect
; 366e5


BattleCommand_UnleashEnergy: ; 366e5
; unleashenergy

	ld de, PlayerDamageTaken
	ld bc, PlayerRolloutCount
	ld a, [hBattleTurn]
	and a
	jr z, .asm_366f6
	ld de, EnemyDamageTaken
	ld bc, EnemyRolloutCount
.asm_366f6
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	set SUBSTATUS_BIDE, [hl]
	xor a
	ld [de], a
	inc de
	ld [de], a
	ld [wPlayerMoveStruct + MOVE_EFFECT], a
	ld [wEnemyMoveStruct + MOVE_EFFECT], a
	call BattleRandom
	and 1
rept 2
	inc a
endr
	ld [bc], a
	ld a, 1
	ld [wKickCounter], a
	call AnimateCurrentMove
	jp EndMoveEffect
; 3671a


BattleCommand_CheckRampage: ; 3671a
; checkrampage

	ld de, PlayerRolloutCount
	ld a, [hBattleTurn]
	and a
	jr z, .player ; 36720 $3
	ld de, EnemyRolloutCount
.player
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	bit SUBSTATUS_RAMPAGE, [hl]
	ret z
	ld a, [de]
	dec a
	ld [de], a
	jr nz, .continue_rampage ; 36730 $1a

	res SUBSTATUS_RAMPAGE, [hl]
	call BattleCommand_SwitchTurn
	call SafeCheckSafeguard
	push af
	call BattleCommand_SwitchTurn
	pop af
	jr nz, .continue_rampage ; 3673f $b

	set SUBSTATUS_CONFUSED, [hl]
	call BattleRandom
	and %00000001
rept 2
	inc a
endr
	inc de ; ConfuseCount
	ld [de], a
.continue_rampage
	ld b, rampage_command
	jp SkipToBattleCommand
; 36751


BattleCommand_Rampage: ; 36751
; rampage

; No rampage during Sleep Talk.
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP
	ret nz

	ld de, PlayerRolloutCount
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, EnemyRolloutCount
.ok
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	set SUBSTATUS_RAMPAGE, [hl]
; Rampage for 1 or 2 more turns
	call BattleRandom
	and %00000001
	inc a
	ld [de], a
	ld a, 1
	ld [wc73e], a
	ret
; 36778


BattleCommand_Teleport: ; 36778
; teleport

	ld a, [BattleType]
	cp BATTLETYPE_SHINY
	jr z, .failed
	cp BATTLETYPE_TRAP
	jr z, .failed
	cp BATTLETYPE_CELEBI
	jr z, .failed
	cp BATTLETYPE_SUICUNE
	jr z, .failed

	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVar
	bit SUBSTATUS_CANT_RUN, a
	jr nz, .failed
; Only need to check these next things if it's your turn
	ld a, [hBattleTurn]
	and a
	jr nz, .enemy_turn
; Can't teleport from a trainer battle
	ld a, [wBattleMode]
	dec a
	jr nz, .failed
; If your level is greater than the opponent's, you run without fail.
	ld a, [CurPartyLevel]
	ld b, a
	ld a, [BattleMonLevel]
	cp b
	jr nc, .run_away
; Generate a number between 0 and (YourLevel + TheirLevel).
	add b
	ld c, a
	inc c
.loop_player
	call BattleRandom
	cp c
	jr nc, .loop_player ; 367b0 $fa
; If that number is greater than 4 times your level, run away.
	srl b
	srl b
	cp b
	jr nc, .run_away ; 367b7 $26

.failed
	call AnimateFailedMove
	jp PrintButItFailed

.enemy_turn
	ld a, [wBattleMode]
	dec a
	jr nz, .failed
	ld a, [BattleMonLevel]
	ld b, a
	ld a, [CurPartyLevel]
	cp b
	jr nc, .run_away ; 367cd $10
	add b
	ld c, a
	inc c
.loop_enemy
	call BattleRandom
	cp c
	jr nc, .loop_enemy ; 367d6 $fa
	srl b
	srl b
	cp b
	jr nc, .run_away ; 367dd $0
.run_away
	call UpdateBattleMonInParty
	xor a
	ld [wcfca], a
	inc a
	ld [wd232], a
	ld [wKickCounter], a
	call SetBattleDraw
	call BattleCommand_LowerSub
	call PlayPlayerMoveAnim_ClearHiID
	ld c, 20
	call DelayFrames
	call SetBattleDraw

	ld hl, FledFromBattleText
	jp StdBattleTextBox
; 36804


SetBattleDraw: ; 36804
	ld a, [wBattleResult]
	and $c0
	or $2
	ld [wBattleResult], a
	ret
; 3680f


BattleCommand_ForceSwitch: ; 3680f
; forceswitch

	ld a, [BattleType]
	cp BATTLETYPE_SHINY
	jp z, .fail
	cp BATTLETYPE_TRAP
	jp z, .fail
	cp BATTLETYPE_CELEBI
	jp z, .fail
	cp BATTLETYPE_SUICUNE
	jp z, .fail
	ld a, [hBattleTurn]
	and a
	jp nz, .force_player_switch
	ld a, [AttackMissed]
	and a
	jr nz, .missed ; 36830 $20
	ld a, [wBattleMode]
	dec a
	jr nz, .trainer ; 36836 $31
	ld a, [CurPartyLevel]
	ld b, a
	ld a, [BattleMonLevel]
	cp b
	jr nc, .wild_force_flee ; 36840 $13
	add b
	ld c, a
	inc c
.random_loop_wild
	call BattleRandom
	cp c
	jr nc, .random_loop_wild ; 36849 $fa
	srl b
	srl b
	cp b
	jr nc, .wild_force_flee ; 36850 $3
.missed
	jp .fail

.wild_force_flee
	call UpdateBattleMonInParty
	xor a
	ld [wcfca], a
	inc a
	ld [wd232], a
	call SetBattleDraw
	ld a, [wPlayerMoveStruct + MOVE_ANIM]
	jp .succeed

.trainer
	call CheckEnemyHasMonToSwitchTo
	jr c, .switch_fail ; 3686c $5c
	ld a, [wc70f]
	and a
	jr z, .switch_fail ; 36872 $56
	call UpdateEnemyMonInParty
	ld a, $1
	ld [wKickCounter], a
	call AnimateCurrentMove
	ld c, $14
	call DelayFrames
	hlcoord 1, 0
	lb bc, 4, 10
	call ClearBox
	ld c, 20
	call DelayFrames
	ld a, [OTPartyCount]
	ld b, a
	ld a, [CurOTMon]
	ld c, a
; select a random enemy mon to switch to
.random_loop_trainer
	call BattleRandom
	and $7
	cp b
	jr nc, .random_loop_trainer ; 368a0 $f8
	cp c
	jr z, .random_loop_trainer ; 368a3 $f5
	push af
	push bc
	ld hl, OTPartyMon1HP
	call GetPartyLocation
	ld a, [hli]
	or [hl]
	pop bc
	pop de
	jr z, .random_loop_trainer ; 368b1 $e7
	ld a, d
	inc a
	ld [wc718], a
	callab Function3d4c3

	ld hl, DraggedOutText
	call StdBattleTextBox

	ld hl, SpikesDamage
	jp CallBattleCore

.switch_fail
	jp .fail

.force_player_switch
	ld a, [AttackMissed]
	and a
	jr nz, .player_miss

	ld a, [wBattleMode]
	dec a
	jr nz, .vs_trainer

	ld a, [BattleMonLevel]
	ld b, a
	ld a, [CurPartyLevel]
	cp b
	jr nc, .wild_succeed_playeristarget

	add b
	ld c, a
	inc c
.wild_random_loop_playeristarget
	call BattleRandom
	cp c
	jr nc, .wild_random_loop_playeristarget

	srl b
	srl b
	cp b
	jr nc, .wild_succeed_playeristarget

.player_miss
	jr .fail

.wild_succeed_playeristarget
	call UpdateBattleMonInParty
	xor a
	ld [wcfca], a
	inc a
	ld [wd232], a
	call SetBattleDraw
	ld a, [wEnemyMoveStruct + MOVE_ANIM]
	jr .succeed

.vs_trainer
	call CheckPlayerHasMonToSwitchTo
	jr c, .fail

	ld a, [wc70f]
	cp $1
	jr z, .switch_fail

	call UpdateBattleMonInParty
	ld a, $1
	ld [wKickCounter], a
	call AnimateCurrentMove
	ld c, 20
	call DelayFrames
	hlcoord 9, 7
	lb bc, 5, 11
	call ClearBox
	ld c, 20
	call DelayFrames
	ld a, [PartyCount]
	ld b, a
	ld a, [CurBattleMon]
	ld c, a
.random_loop_trainer_playeristarget
	call BattleRandom
	and $7
	cp b
	jr nc, .random_loop_trainer_playeristarget

	cp c
	jr z, .random_loop_trainer_playeristarget

	push af
	push bc
	ld hl, PartyMon1HP
	call GetPartyLocation
	ld a, [hli]
	or [hl]
	pop bc
	pop de
	jr z, .random_loop_trainer_playeristarget

	ld a, d
	ld [CurPartyMon], a
	ld hl, SwitchPlayerMon
	call CallBattleCore

	ld hl, DraggedOutText
	call StdBattleTextBox

	ld hl, SpikesDamage
	jp CallBattleCore

.fail
	call BattleCommand_LowerSub
	call BattleCommand_MoveDelay
	call BattleCommand_RaiseSub
	jp PrintButItFailed

.succeed
	push af
	call SetBattleDraw
	ld a, $1
	ld [wKickCounter], a
	call AnimateCurrentMove
	ld c, 20
	call DelayFrames
	pop af

	ld hl, FledInFearText
	cp ROAR
	jr z, .do_text
	ld hl, BlownAwayText
.do_text
	jp StdBattleTextBox
; 36994


CheckPlayerHasMonToSwitchTo: ; 36994
	ld a, [PartyCount]
	ld d, a
	ld e, 0
	ld bc, PARTYMON_STRUCT_LENGTH
.loop
	ld a, [CurBattleMon]
	cp e
	jr z, .next

	ld a, e
	ld hl, PartyMon1HP
	call AddNTimes
	ld a, [hli]
	or [hl]
	jr nz, .not_fainted

.next
	inc e
	dec d
	jr nz, .loop

	scf
	ret

.not_fainted
	and a
	ret
; 369b6


BattleCommand_EndLoop: ; 369b6
; endloop

; Loop back to the command before 'critical'.

	ld de, PlayerRolloutCount
	ld bc, PlayerDamageTaken
	ld a, [hBattleTurn]
	and a
	jr z, .asm_369c7
	ld de, EnemyRolloutCount
	ld bc, EnemyDamageTaken
.asm_369c7

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	bit SUBSTATUS_IN_LOOP, [hl]
	jp nz, .asm_36a43
	set SUBSTATUS_IN_LOOP, [hl]
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVarAddr
	ld a, [hl]
	cp EFFECT_TWINEEDLE
	jr z, .asm_36a3f
	cp EFFECT_DOUBLE_HIT
	ld a, $1
	jr z, .asm_36a3a
	ld a, [hl]
	cp EFFECT_BEAT_UP
	jr z, .asm_369fb
	cp EFFECT_TRIPLE_KICK
	jr nz, .asm_36a2b
.asm_369ec
	call BattleRandom
	and $3
	jr z, .asm_369ec
	dec a
	jr nz, .asm_36a3a
	ld a, $1
	ld [bc], a
	jr .asm_36a48
.asm_369fb
	ld a, [hBattleTurn]
	and a
	jr nz, .asm_36a0b
	ld a, [PartyCount]
	cp $1
	jp z, .asm_36a1e
	dec a
	jr .asm_36a3a
.asm_36a0b
	ld a, [wBattleMode]
	cp $1
	jp z, .asm_36a1e
	ld a, [OTPartyCount]
	cp $1
	jp z, .asm_36a1e
	dec a
	jr .asm_36a3a

.asm_36a1e
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	res SUBSTATUS_IN_LOOP, [hl]
	call BattleCommanda8
	jp EndMoveEffect
.asm_36a2b
	call BattleRandom
	and $3
	cp $2
	jr c, .asm_36a39
	call BattleRandom
	and $3
.asm_36a39
	inc a
.asm_36a3a
	ld [de], a
	inc a
	ld [bc], a
	jr .asm_36a6b
.asm_36a3f
	ld a, $1
	jr .asm_36a3a

.asm_36a43
	ld a, [de]
	dec a
	ld [de], a
	jr nz, .asm_36a6b
.asm_36a48
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	res SUBSTATUS_IN_LOOP, [hl]

	ld hl, PlayerHitTimesText
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36a5a
	ld hl, EnemyHitTimesText
.asm_36a5a

	push bc
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_BEAT_UP
	jr z, .asm_36a67
	call StdBattleTextBox
.asm_36a67

	pop bc
	xor a
	ld [bc], a
	ret

; Loop back to the command before 'critical'.
.asm_36a6b
	ld a, [BattleScriptBufferLoc + 1]
	ld h, a
	ld a, [BattleScriptBufferLoc]
	ld l, a
.asm_36a73
	ld a, [hld]
	cp $5 ; critical
	jr nz, .asm_36a73
	inc hl
	ld a, h
	ld [BattleScriptBufferLoc + 1], a
	ld a, l
	ld [BattleScriptBufferLoc], a
	ret
; 36a82


BattleCommand_FakeOut: ; 36a82
	ld a, [AttackMissed]
	and a
	ret nz

	call CheckSubstituteOpp
	jr nz, .asm_36a9a

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and 1 << FRZ | SLP
	jr nz, .asm_36a9a

	call Function36abf
	jr z, Function36ab5

.asm_36a9a
	ld a, 1
	ld [AttackMissed], a
	ret
; 36aa0


BattleCommand_FlinchTarget: ; 36aa0
	call CheckSubstituteOpp
	ret nz

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and 1 << FRZ | SLP
	ret nz

	call Function36abf
	ret nz

	ld a, [EffectFailed]
	and a
	ret nz

	; fallthrough
; 36ab5


Function36ab5: ; 36ab5
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVarAddr
	set SUBSTATUS_FLINCHED, [hl]
	jp EndRechargeOpp
; 36abf


Function36abf: ; 36abf
	push bc
	ld a, [wc70f]
	ld b, a
	ld a, [hBattleTurn]
	xor b
	pop bc
	ret
; 36ac9


BattleCommand_KingsRock: ; 36ac9
; kingsrock

	ld a, [AttackMissed]
	and a
	ret nz

	call GetUserItem
	ld a, b
	cp HELD_TRADE_EVOLVE ; Only King's Rock has this effect
	ret nz

	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVarAddr
	ld d, h
	ld e, l
	call GetUserItem
	call BattleRandom
	cp c
	ret nc
	call EndRechargeOpp
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVarAddr
	set SUBSTATUS_FLINCHED, [hl]
	ret
; 36af3


BattleCommand_OHKO: ; 36af3
; ohko

	call ResetDamage
	ld a, [TypeModifier]
	and $7f
	jr z, .asm_36b2f
	ld hl, EnemyMonLevel
	ld de, BattleMonLevel
	ld bc, wPlayerMoveStruct + MOVE_ACC
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36b12
	push hl
	ld h, d
	ld l, e
	pop de
	ld bc, wEnemyMoveStruct + MOVE_ACC
.asm_36b12
	ld a, [de]
	sub [hl]
	jr c, .asm_36b2f
	add a
	ld e, a
	ld a, [bc]
	add e
	jr nc, .asm_36b1e
	ld a, $ff
.asm_36b1e
	ld [bc], a
	call BattleCommand_CheckHit
	ld hl, CurDamage
	ld a, $ff
	ld [hli], a
	ld [hl], a
	ld a, $2
	ld [CriticalHit], a
	ret
.asm_36b2f
	ld a, $ff
	ld [CriticalHit], a
	ld a, $1
	ld [AttackMissed], a
	ret
; 36b3a


BattleCommand_CheckCharge: ; 36b3a
; checkcharge

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	bit SUBSTATUS_CHARGED, [hl]
	ret z
	res SUBSTATUS_CHARGED, [hl]
	res SUBSTATUS_UNDERGROUND, [hl]
	res SUBSTATUS_FLYING, [hl]
	ld b, charge_command
	jp SkipToBattleCommand
; 36b4d


BattleCommand_Charge: ; 36b4d
; charge

	call BattleCommand_ClearText
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP
	jr z, .asm_36b65

	call BattleCommand_MoveDelay
	call BattleCommand_RaiseSub
	call PrintButItFailed
	jp EndMoveEffect

.asm_36b65
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	set SUBSTATUS_CHARGED, [hl]

	ld hl, IgnoredOrders2Text
	ld a, [AlreadyDisobeyed]
	and a
	call nz, StdBattleTextBox

	call BattleCommand_LowerSub
	xor a
	ld [wcfca], a
	inc a
	ld [wKickCounter], a
	call PlayPlayerMoveAnim_ClearHiID
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	cp FLY
	jr z, .asm_36b96
	cp DIG
	jr z, .asm_36b96
	call BattleCommand_RaiseSub
	jr .asm_36b99
.asm_36b96
	call Function37ec0
.asm_36b99
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld b, a
	cp FLY
	jr z, .asm_36bb0
	cp DIG
	jr nz, .asm_36bb2
	set SUBSTATUS_UNDERGROUND, [hl]
	jr .asm_36bb2

.asm_36bb0
	set SUBSTATUS_FLYING, [hl]

.asm_36bb2
	call Function34548
	jr nz, .asm_36bc3
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE
	call GetBattleVarAddr
	ld [hl], b
	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	ld [hl], b

.asm_36bc3
	call ResetDamage

	ld hl, .UsedText
	call BattleTextBox

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_SKULL_BASH
	ld b, endturn_command
	jp z, SkipToBattleCommand
	jp EndMoveEffect

.UsedText
	text_jump UnknownText_0x1c0d0e ; "[USER]"
	start_asm

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	cp RAZOR_WIND
	ld hl, .RazorWind
	jr z, .done

	cp SOLARBEAM
	ld hl, .Solarbeam
	jr z, .done

	cp SKULL_BASH
	ld hl, .SkullBash
	jr z, .done

	cp SKY_ATTACK
	ld hl, .SkyAttack
	jr z, .done

	cp FLY
	ld hl, .Fly
	jr z, .done

	cp DIG
	ld hl, .Dig

.done
	ret

.RazorWind
; 'made a whirlwind!'
	text_jump UnknownText_0x1c0d12
	db "@"

.Solarbeam
; 'took in sunlight!'
	text_jump UnknownText_0x1c0d26
	db "@"

.SkullBash
; 'lowered its head!'
	text_jump UnknownText_0x1c0d3a
	db "@"

.SkyAttack
; 'is glowing!'
	text_jump UnknownText_0x1c0d4e
	db "@"

.Fly
; 'flew up high!'
	text_jump UnknownText_0x1c0d5c
	db "@"

.Dig
; 'dug a hole!'
	text_jump UnknownText_0x1c0d6c
	db "@"
; 36c2c


BattleCommand3c: ; 36c2c
; unused
	ret
; 36c2d


BattleCommand_TrapTarget: ; 36c2d
; traptarget

	ld a, [AttackMissed]
	and a
	ret nz
	ld hl, wc731
	ld de, wc72f
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36c43
	ld hl, wc730
	ld de, wc72e

.asm_36c43
	ld a, [hl]
	and a
	ret nz
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret nz
	call BattleRandom
	and 3
rept 3
	inc a
endr
	ld [hl], a
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld [de], a
	ld b, a
	ld hl, .Traps

.asm_36c61
	ld a, [hli]
	cp b
	jr z, .asm_36c69
rept 2
	inc hl
endr
	jr .asm_36c61

.asm_36c69
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp StdBattleTextBox

.Traps
	dbw BIND,      UsedBindText      ; 'used BIND on'
	dbw WRAP,      WrappedByText     ; 'was WRAPPED by'
	dbw FIRE_SPIN, FireSpinTrapText  ; 'was trapped!'
	dbw CLAMP,     ClampedByText     ; 'was CLAMPED by'
	dbw WHIRLPOOL, WhirlpoolTrapText ; 'was trapped!'
; 36c7e


BattleCommand_Mist: ; 36c7e
; mist

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	bit SUBSTATUS_MIST, [hl]
	jr nz, .asm_36c92
	set SUBSTATUS_MIST, [hl]
	call AnimateCurrentMove
	ld hl, MistText
	jp StdBattleTextBox
.asm_36c92
	call AnimateFailedMove
	jp PrintButItFailed
; 36c98


BattleCommand_FocusEnergy: ; 36c98
; focusenergy

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	bit SUBSTATUS_FOCUS_ENERGY, [hl]
	jr nz, .asm_36cac
	set SUBSTATUS_FOCUS_ENERGY, [hl]
	call AnimateCurrentMove
	ld hl, GettingPumpedText
	jp StdBattleTextBox
.asm_36cac
	call AnimateFailedMove
	jp PrintButItFailed
; 36cb2


BattleCommand_Recoil: ; 36cb2
; recoil

	ld hl, BattleMonMaxHP
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36cbd
	ld hl, EnemyMonMaxHP
.asm_36cbd
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld d, a
	ld a, [CurDamage]
	ld b, a
	ld a, [CurDamage + 1]
	ld c, a
	srl b
	rr c
	srl b
	rr c
	ld a, b
	or c
	jr nz, .asm_36cd8
	inc c
.asm_36cd8
	ld a, [hli]
	ld [Buffer2], a
	ld a, [hl]
	ld [Buffer1], a
rept 2
	dec hl
endr
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
	jr nc, .asm_36cfe
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, Buffer5
	ld [hli], a
	ld [hl], a
.asm_36cfe
	hlcoord 10, 9
	ld a, [hBattleTurn]
	and a
	ld a, $1
	jr z, .asm_36d0c
	hlcoord 2, 2
	xor a
.asm_36d0c
	ld [wd10a], a
	predef AnimateHPBar
	call RefreshBattleHuds
	ld hl, RecoilText
	jp StdBattleTextBox
; 36d1d


BattleCommand_ConfuseTarget: ; 36d1d
; confusetarget

	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_CONFUSE
	ret z
	ld a, [EffectFailed]
	and a
	ret nz
	call SafeCheckSafeguard
	ret nz
	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_CONFUSED, [hl]
	ret nz
	jr Function36d70


BattleCommand_Confuse: ; 36d3b
; confuse

	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_CONFUSE
	jr nz, .asm_36d53
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	call AnimateFailedMove
	ld hl, ProtectedByText
	jp StdBattleTextBox

.asm_36d53
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_CONFUSED, [hl]
	jr z, .asm_36d65
	call AnimateFailedMove
	ld hl, AlreadyConfusedText
	jp StdBattleTextBox

.asm_36d65
	call CheckSubstituteOpp
	jr nz, Function36db6
	ld a, [AttackMissed]
	and a
	jr nz, Function36db6

	; fallthrough
; 36d70


Function36d70: ; 36d70
	ld bc, EnemyConfuseCount
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36d7b
	ld bc, PlayerConfuseCount

.asm_36d7b
	set SUBSTATUS_CONFUSED, [hl]
	call BattleRandom
	and 3
rept 2
	inc a
endr
	ld [bc], a

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_CONFUSE_HIT
	jr z, .asm_36d99
	cp EFFECT_SNORE
	jr z, .asm_36d99
	cp EFFECT_SWAGGER
	jr z, .asm_36d99
	call AnimateCurrentMove

.asm_36d99
	ld de, ANIM_CONFUSED
	call PlayOpponentBattleAnim

	ld hl, BecameConfusedText
	call StdBattleTextBox

	call GetOpponentItem
	ld a, b
	cp HELD_HEAL_STATUS
	jr z, .asm_36db0
	cp HELD_HEAL_CONFUSION
	ret nz
.asm_36db0
	ld hl, Function3de51
	jp CallBattleCore
; 36db6

Function36db6: ; 36db6
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_CONFUSE_HIT
	ret z
	cp EFFECT_SNORE
	ret z
	cp EFFECT_SWAGGER
	ret z
	jp PrintDidntAffect2
; 36dc7


BattleCommand_Paralyze: ; 36dc7
; paralyze

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	bit PAR, a
	jr nz, .asm_36e49
	ld a, [TypeModifier]
	and $7f
	jr z, .asm_36e55
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_PARALYZE
	jr nz, .asm_36def
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	call AnimateFailedMove
	ld hl, ProtectedByText
	jp StdBattleTextBox

.asm_36def
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36e0e

	ld a, [wLinkMode]
	and a
	jr nz, .asm_36e0e

	ld a, [InBattleTowerBattle]
	and a
	jr nz, .asm_36e0e

	ld a, [PlayerSubStatus5]
	bit SUBSTATUS_LOCK_ON, a
	jr nz, .asm_36e0e

	call BattleRandom
	cp $40
	jr c, .asm_36e52

.asm_36e0e
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	jr nz, .asm_36e52
	ld a, [AttackMissed]
	and a
	jr nz, .asm_36e52
	call CheckSubstituteOpp
	jr nz, .asm_36e52
	ld c, 30
	call DelayFrames
	call AnimateCurrentMove
	ld a, $1
	ld [$ffd4], a
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set PAR, [hl]
	call UpdateOpponentInParty
	ld hl, ApplyPrzEffectOnSpeed
	call CallBattleCore
	call UpdateBattleHuds
	call PrintParalyze
	ld hl, UseHeldStatusHealingItem
	jp CallBattleCore
.asm_36e49
	call AnimateFailedMove
	ld hl, AlreadyParalyzedText
	jp StdBattleTextBox
.asm_36e52
	jp PrintDidntAffect2
.asm_36e55
	call AnimateFailedMove
	jp PrintDoesntAffect
; 36e5b


Function36e5b: ; 36e5b
; Compare move type to opponent type.
; Return z if matching the opponent type,
; unless the move is Normal (Tri Attack).

	push hl

	ld hl, EnemyMonType1
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, BattleMonType1
.ok

	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	cp NORMAL
	jr z, .normal

	cp [hl]
	jr z, .return

	inc hl
	cp [hl]

.return
	pop hl
	ret

.normal
	ld a, 1
	and a
	pop hl
	ret
; 36e7c


BattleCommand_Substitute: ; 36e7c
; substitute

	call BattleCommand_MoveDelay
	ld hl, BattleMonMaxHP
	ld de, PlayerSubstituteHP
	ld a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, EnemyMonMaxHP
	ld de, EnemySubstituteHP
.got_hp

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	jr nz, .already_has_sub

	ld a, [hli]
	ld b, [hl]
	srl a
	rr b
	srl a
	rr b
rept 2
	dec hl
endr
	ld a, b
	ld [de], a
	ld a, [hld]
	sub b
	ld e, a
	ld a, [hl]
	sbc 0
	ld d, a
	jr c, .too_weak_to_sub
	ld a, d
	or e
	jr z, .too_weak_to_sub
	ld [hl], d
	inc hl
	ld [hl], e

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	set SUBSTATUS_SUBSTITUTE, [hl]

	ld hl, wc730
	ld de, wc72e
	ld a, [hBattleTurn]
	and a
	jr z, .player
	ld hl, wc731
	ld de, wc72f
.player

	xor a
	ld [hl], a
	ld [de], a
	call _CheckBattleScene
	jr c, .mobile

	xor a
	ld [wcfca], a
	ld [FXAnimIDHi], a
	ld [wKickCounter], a
	ld a, SUBSTITUTE
	call PlayMoveAnim_KeepHiID
	jr .finish

.mobile
	call BattleCommand_RaiseSubNoAnim
.finish
	ld hl, MadeSubstituteText
	call StdBattleTextBox
	jp RefreshBattleHuds

.already_has_sub
	call Function34548
	call nz, BattleCommand_RaiseSub
	ld hl, HasSubstituteText
	jr .jp_stdbattletextbox

.too_weak_to_sub
	call Function34548
	call nz, BattleCommand_RaiseSub
	ld hl, TooWeakSubText
.jp_stdbattletextbox
	jp StdBattleTextBox
; 36f0b

BattleCommand_RechargeNextTurn: ; 36f0b
; rechargenextturn
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	set SUBSTATUS_RECHARGE, [hl]
	ret
; 36f13


EndRechargeOpp: ; 36f13
	push hl
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVarAddr
	res SUBSTATUS_RECHARGE, [hl]
	pop hl
	ret
; 36f1d


BattleCommand_Rage: ; 36f1d
; rage
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	set SUBSTATUS_RAGE, [hl]
	ret
; 36f25


BattleCommand_DoubleFlyingDamage: ; 36f25
; doubleflyingdamage
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	bit SUBSTATUS_FLYING, a
	ret z
	jr DoubleDamage
; 36f2f


BattleCommand_DoubleUndergroundDamage: ; 36f2f
; doubleundergrounddamage
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	bit SUBSTATUS_UNDERGROUND, a
	ret z

	; fallthrough
; 36f37


DoubleDamage: ; 36f37
	ld hl, CurDamage + 1
	sla [hl]
	dec hl
	rl [hl]
	jr nc, .quit

	ld a, $ff
	ld [hli], a
	ld [hl], a
.quit
	ret
; 36f46


BattleCommand_Mimic: ; 36f46
; mimic

	call Function372d8
	call BattleCommand_MoveDelay
	ld a, [AttackMissed]
	and a
	jr nz, .asm_36f9a
	ld hl, BattleMonMoves
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36f5d
	ld hl, EnemyMonMoves
.asm_36f5d
	call CheckHiddenOpponent
	jr nz, .asm_36f9a
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	jr z, .asm_36f9a
	cp STRUGGLE
	jr z, .asm_36f9a
	ld b, a
	ld c, NUM_MOVES
.asm_36f71
	ld a, [hli]
	cp b
	jr z, .asm_36f9a
	dec c
	jr nz, .asm_36f71
	dec hl
.asm_36f79
	ld a, [hld]
	cp MIMIC
	jr nz, .asm_36f79
	inc hl
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	ld [hl], a
	ld [wNamedObjectIndexBuffer], a
	ld bc, BattleMonPP - BattleMonMoves
	add hl, bc
	ld [hl], 5
	call GetMoveName
	call AnimateCurrentMove
	ld hl, LearnedMoveText
	jp StdBattleTextBox
.asm_36f9a
	jp Function37357
; 36f9d


BattleCommand_LeechSeed: ; 36f9d
; leechseed
	ld a, [AttackMissed]
	and a
	jr nz, .evaded
	call CheckSubstituteOpp
	jr nz, .evaded

	ld de, EnemyMonType1
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, BattleMonType1
.ok

	ld a, [de]
	cp GRASS
	jr z, .grass
	inc de
	ld a, [de]
	cp GRASS
	jr z, .grass

	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_LEECH_SEED, [hl]
	jr nz, .evaded
	set SUBSTATUS_LEECH_SEED, [hl]
	call AnimateCurrentMove
	ld hl, WasSeededText
	jp StdBattleTextBox

.grass
	call AnimateFailedMove
	jp PrintDoesntAffect

.evaded
	call AnimateFailedMove
	ld hl, EvadedText
	jp StdBattleTextBox
; 36fe1


BattleCommand_Splash: ; 36fe1
	call AnimateCurrentMove
	callba MobileFn_1060e5
	jp PrintNothingHappened
; 36fed


BattleCommand_Disable: ; 36fed
; disable

	ld a, [AttackMissed]
	and a
	jr nz, .asm_37059

	ld de, EnemyDisableCount
	ld hl, EnemyMonMoves
	ld a, [hBattleTurn]
	and a
	jr z, .asm_37004
	ld de, PlayerDisableCount
	ld hl, BattleMonMoves
.asm_37004

	ld a, [de]
	and a
	jr nz, .asm_37059

	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	jr z, .asm_37059
	cp STRUGGLE
	jr z, .asm_37059

	ld b, a
	ld c, $ff
.asm_37017
	inc c
	ld a, [hli]
	cp b
	jr nz, .asm_37017

	ld a, [hBattleTurn]
	and a
	ld hl, EnemyMonPP
	jr z, .asm_37027
	ld hl, BattleMonPP
.asm_37027
	ld b, 0
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_37059
.asm_3702e
	call BattleRandom
	and 7
	jr z, .asm_3702e
	inc a
	inc c
	swap c
	add c
	ld [de], a
	call AnimateCurrentMove
	ld hl, DisabledMove
	ld a, [hBattleTurn]
	and a
	jr nz, .asm_37047
	inc hl
.asm_37047
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	ld [hl], a
	ld [wNamedObjectIndexBuffer], a
	call GetMoveName
	ld hl, WasDisabledText
	jp StdBattleTextBox
.asm_37059
	jp Function37354
; 3705c


BattleCommand_PayDay: ; 3705c
; payday

	xor a
	ld hl, StringBuffer1
	ld [hli], a

	ld a, [hBattleTurn]
	and a
	ld a, [BattleMonLevel]
	jr z, .ok
	ld a, [EnemyMonLevel]
.ok

	add a
	ld hl, wPayDayMoney + 2
	add [hl]
	ld [hld], a
	jr nc, .done
	inc [hl]
	dec hl
	jr nz, .done
	inc [hl]
.done
	ld hl, CoinsScatteredText
	jp StdBattleTextBox
; 3707f


BattleCommand_Conversion: ; 3707f
; conversion

	ld hl, BattleMonMoves
	ld de, BattleMonType1
	ld a, [hBattleTurn]
	and a
	jr z, .asm_37090
	ld hl, EnemyMonMoves
	ld de, EnemyMonType1
.asm_37090
	push de
	ld c, 0
	ld de, StringBuffer1
.asm_37096
	push hl
	ld b, 0
	add hl, bc
	ld a, [hl]
	pop hl
	and a
	jr z, .asm_370b2
	push hl
	push bc
	dec a
	ld hl, Moves + MOVE_TYPE
	call GetMoveAttr
	ld [de], a
	inc de
	pop bc
	pop hl
	inc c
	ld a, c
	cp NUM_MOVES
	jr c, .asm_37096
.asm_370b2
	ld a, $ff
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	pop de
	ld hl, StringBuffer1
.asm_370bd
	ld a, [hl]
	cp $ff
	jr z, .asm_370d3
	cp CURSE_T
	jr z, .asm_370d0
	ld a, [de]
	cp [hl]
	jr z, .asm_370d0
	inc de
	ld a, [de]
	dec de
	cp [hl]
	jr nz, .asm_370d9_a
.asm_370d0
	inc hl
	jr .asm_370bd
.asm_370d3
	call AnimateFailedMove
	jp PrintButItFailed
.asm_370d9_a
.asm_370d9_b
	call BattleRandom
	and 3 ; TODO factor in NUM_MOVES
	ld c, a
	ld b, 0
	ld hl, StringBuffer1
	add hl, bc
	ld a, [hl]
	cp $ff
	jr z, .asm_370d9_b
	cp CURSE_T
	jr z, .asm_370d9_b
	ld a, [de]
	cp [hl]
	jr z, .asm_370d9_b
	inc de
	ld a, [de]
	dec de
	cp [hl]
	jr z, .asm_370d9_b
	ld a, [hl]
	ld [de], a
	inc de
	ld [de], a
	ld [wNamedObjectIndexBuffer], a
	callba GetTypeName
	call AnimateCurrentMove
	ld hl, TransformedTypeText
	jp StdBattleTextBox
; 3710e


BattleCommand_ResetStats: ; 3710e
; resetstats

	ld a, 7 ; neutral
	ld hl, PlayerStatLevels
	call .Fill
	ld hl, EnemyStatLevels
	call .Fill

	ld a, [hBattleTurn]
	push af

	call SetPlayerTurn
	call CalcPlayerStats
	call SetEnemyTurn
	call CalcEnemyStats

	pop af
	ld [hBattleTurn], a

	call AnimateCurrentMove

	ld hl, EliminatedStatsText
	jp StdBattleTextBox

.Fill
	ld b, PlayerStatLevelsEnd - PlayerStatLevels
.next
	ld [hli], a
	dec b
	jr nz, .next
	ret
; 3713e


BattleCommand_Heal: ; 3713e
; heal

	ld de, BattleMonHP
	ld hl, BattleMonMaxHP
	ld a, [hBattleTurn]
	and a
	jr z, .asm_3714f
	ld de, EnemyMonHP
	ld hl, EnemyMonMaxHP
.asm_3714f
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld b, a
	push hl
	push de
	push bc
	ld c, 2
	call StringCmp
	pop bc
	pop de
	pop hl
	jp z, .asm_371c4
	ld a, b
	cp REST
	jr nz, .asm_37199
	push hl
	push de
	push af
	call BattleCommand_MoveDelay
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	res SUBSTATUS_TOXIC, [hl]
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	ld a, [hl]
	and a
	ld [hl], REST_TURNS + 1
	ld hl, WentToSleepText
	jr z, .asm_37186
	ld hl, RestedText
.asm_37186
	call StdBattleTextBox
	ld a, [hBattleTurn]
	and a
	jr nz, .asm_37193
	call CalcPlayerStats
	jr .asm_37196
.asm_37193
	call CalcEnemyStats
.asm_37196
	pop af
	pop de
	pop hl
.asm_37199
	jr z, .asm_371a3
	ld hl, GetHalfMaxHP
	call CallBattleCore
	jr .asm_371a9
.asm_371a3
	ld hl, GetMaxHP
	call CallBattleCore
.asm_371a9
	call AnimateCurrentMove
	call BattleCommand_SwitchTurn
	ld hl, RestoreHP
	call CallBattleCore
	call BattleCommand_SwitchTurn
	call UpdateUserInParty
	call RefreshBattleHuds
	ld hl, RegainedHealthText
	jp StdBattleTextBox

.asm_371c4
	call AnimateFailedMove
	ld hl, HPIsFullText
	jp StdBattleTextBox
; 371cd


BattleCommand_Transform: ; 371cd
; transform

	call Function372d8
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_TRANSFORMED, [hl]
	jp nz, Function372d2
	call CheckHiddenOpponent
	jp nz, Function372d2
	xor a
	ld [wcfca], a
	ld [FXAnimIDHi], a
	ld a, $1
	ld [wKickCounter], a
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	bit SUBSTATUS_SUBSTITUTE, [hl]
	push af
	jr z, .skip_substitute
	call Function34548
	jr nz, .skip_substitute
	ld a, SUBSTITUTE
	call PlayMoveAnim_KeepHiID
.skip_substitute
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	set SUBSTATUS_TRANSFORMED, [hl]
	call ResetActorDisable
	ld hl, BattleMonSpecies
	ld de, EnemyMonSpecies
	ld a, [hBattleTurn]
	and a
	jr nz, .got_mon_species
	ld hl, EnemyMonSpecies
	ld de, BattleMonSpecies
	xor a
	ld [CurMoveNum], a
.got_mon_species
	push hl
	ld a, [hli]
	ld [de], a
	inc hl
rept 2
	inc de
endr
	ld bc, NUM_MOVES
	call CopyBytes
	ld a, [hBattleTurn]
	and a
	jr z, .skip_enemy_backup
	ld a, [de]
	ld [wEnemyBackupDVs], a
	inc de
	ld a, [de]
	ld [wEnemyBackupDVs + 1], a
	dec de
.skip_enemy_backup
; copy DVs
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
; move pointer to stats
	ld bc, BattleMonStats - BattleMonPP
	add hl, bc
	push hl
	ld h, d
	ld l, e
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld bc, BattleMonStructEnd - BattleMonStats
	call CopyBytes
; init the power points
	ld bc, BattleMonMoves - BattleMonStructEnd
	add hl, bc
	push de
	ld d, h
	ld e, l
	pop hl
	ld bc, BattleMonPP - BattleMonStructEnd
	add hl, bc
	ld b, NUM_MOVES
.pp_loop
	ld a, [de]
	inc de
	and a
	jr z, .done_move
	cp SKETCH
	ld a, 1
	jr z, .done_move
	ld a, 5
.done_move
	ld [hli], a
	dec b
	jr nz, .pp_loop
	pop hl
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, EnemyStats
	ld de, PlayerStats
	ld bc, 2 * 5
	call BattleSideCopy
	ld hl, EnemyStatLevels
	ld de, PlayerStatLevels
	ld bc, 8
	call BattleSideCopy
	call _CheckBattleScene
	jr c, .skip_anims
	ld a, [hBattleTurn]
	and a
	ld a, [wc6fe]
	jr z, .got_byte
	ld a, [wc6fa]
.got_byte
	and a
	jr nz, .skip_anims
	call PlayPlayerMoveAnim_ClearHiID
	jr .after_anim
.skip_anims
	call BattleCommand_MoveDelay
	call BattleCommand_RaiseSubNoAnim
.after_anim
	xor a
	ld [wcfca], a
	ld [FXAnimIDHi], a
	ld a, $2
	ld [wKickCounter], a
	pop af
	ld a, SUBSTITUTE
	call nz, PlayMoveAnim_KeepHiID
	ld hl, TransformedText
	jp StdBattleTextBox
; 372c6


BattleSideCopy: ; 372c6
; Copy bc bytes from hl to de if it's the player's turn.
; Copy bc bytes from de to hl if it's the enemy's turn.
	ld a, [hBattleTurn]
	and a
	jr z, .copy

; Swap hl and de
	push hl
	ld h, d
	ld l, e
	pop de
.copy
	jp CopyBytes
; 372d2


Function372d2: ; 372d2
	call AnimateFailedMove
	jp PrintButItFailed
; 372d8


Function372d8: ; 372d8
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE
	call GetBattleVarAddr
	xor a
	ld [hl], a

	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	xor a
	ld [hl], a
	ret
; 372e7


ResetActorDisable: ; 372e7
	ld a, [hBattleTurn]
	and a
	jr z, .player

	xor a
	ld [EnemyDisableCount], a
	ld [EnemyDisabledMove], a
	ret

.player
	xor a
	ld [PlayerDisableCount], a
	ld [DisabledMove], a
	ret
; 372fc


BattleCommand_Screen: ; 372fc
; screen

	ld hl, PlayerScreens
	ld bc, PlayerLightScreenCount
	ld a, [hBattleTurn]
	and a
	jr z, .asm_3730d
	ld hl, EnemyScreens
	ld bc, EnemyLightScreenCount

.asm_3730d
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_LIGHT_SCREEN
	jr nz, .Reflect

	bit SCREENS_LIGHT_SCREEN, [hl]
	jr nz, .failed
	set SCREENS_LIGHT_SCREEN, [hl]
	ld a, 5
	ld [bc], a
	ld hl, LightScreenEffectText
	jr .asm_37331

.Reflect
	bit SCREENS_REFLECT, [hl]
	jr nz, .failed
	set SCREENS_REFLECT, [hl]

	; LightScreenCount -> ReflectCount
	inc bc

	ld a, 5
	ld [bc], a
	ld hl, ReflectEffectText

.asm_37331
	call AnimateCurrentMove
	jp StdBattleTextBox

.failed
	call AnimateFailedMove
	jp PrintButItFailed
; 3733d


PrintDoesntAffect: ; 3733d
; 'it doesn't affect'
	ld hl, DoesntAffectText
	jp StdBattleTextBox
; 37343


PrintNothingHappened: ; 37343
; 'but nothing happened!'
	ld hl, NothingHappenedText
	jp StdBattleTextBox
; 37349


TryPrintButItFailed: ; 37349
	ld a, [AlreadyFailed]
	and a
	ret nz

	; fallthrough
; 3734e


PrintButItFailed: ; 3734e
; 'but it failed!'
	ld hl, ButItFailedText
	jp StdBattleTextBox
; 37354


Function37354: ; 37354
	call AnimateFailedMove
	; fallthrough
; 37357

Function37357: ; 37357
	ld hl, ButItFailedText ; 'but it failed!'
	ld de, ItFailedText    ; 'it failed!'
	jp Function35157
; 37360


PrintDidntAffect: ; 37360
; 'it didn't affect'
	ld hl, DidntAffect1Text
	jp StdBattleTextBox
; 37366


PrintDidntAffect2: ; 37366
	call AnimateFailedMove
	ld hl, DidntAffect1Text ; 'it didn't affect'
	ld de, DidntAffect2Text ; 'it didn't affect'
	jp Function35157
; 37372


PrintParalyze: ; 37372
; 'paralyzed! maybe it can't attack!'
	ld hl, ParalyzedText
	jp StdBattleTextBox
; 37378


CheckSubstituteOpp: ; 37378
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret
; 37380


BattleCommand_SelfDestruct: ; 37380
	callba MobileFn_10610d
	ld a, $4
	ld [wcfca], a
	ld c, $3
	call DelayFrames
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	xor a
	ld [hli], a
	inc hl
	ld [hli], a
	ld [hl], a
	ld a, $1
	ld [wKickCounter], a
	call BattleCommand_LowerSub
	call PlayPlayerMoveAnim_ClearHiID
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	res SUBSTATUS_LEECH_SEED, [hl]
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	res SUBSTATUS_DESTINY_BOND, [hl]
	call _CheckBattleScene
	ret nc
	callba DrawPlayerHUD
	callba DrawEnemyHUD
	call WaitBGMap
	jp RefreshBattleHuds
; 373c9


INCLUDE "battle/effects/mirror_move.asm"

INCLUDE "battle/effects/metronome.asm"


CheckUserMove: ; 37462
; Return z if the user has move a.
	ld b, a
	ld de, BattleMonMoves
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, EnemyMonMoves
.ok

	ld c, NUM_MOVES
.loop
	ld a, [de]
	inc de
	cp b
	ret z

	dec c
	jr nz, .loop

	ld a, 1
	and a
	ret
; 3747b


ResetTurn: ; 3747b
	ld hl, wPlayerCharging
	ld a, [hBattleTurn]
	and a
	jr z, .player
	ld hl, wEnemyCharging

.player
	ld [hl], 1
	xor a
	ld [AlreadyDisobeyed], a
	call DoMove
	jp EndMoveEffect
; 37492


INCLUDE "battle/effects/thief.asm"


BattleCommand_ArenaTrap: ; 37517
; arenatrap

; Doesn't work on an absent opponent.

	call CheckHiddenOpponent
	jr nz, .failed

; Don't trap if the opponent is already trapped.

	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	bit SUBSTATUS_CANT_RUN, [hl]
	jr nz, .failed

; Otherwise trap the opponent.

	set SUBSTATUS_CANT_RUN, [hl]
	call AnimateCurrentMove
	ld hl, CantEscapeNowText
	jp StdBattleTextBox

.failed
	call AnimateFailedMove
	jp PrintButItFailed
; 37536


INCLUDE "battle/effects/nightmare.asm"


BattleCommand_Defrost: ; 37563
; defrost

; Thaw the user.

	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	bit FRZ, [hl]
	ret z
	res FRZ, [hl]

; Don't update the enemy's party struct in a wild battle.

	ld a, [hBattleTurn]
	and a
	jr z, .party

	ld a, [wBattleMode]
	dec a
	jr z, .done

.party
	ld a, MON_STATUS
	call UserPartyAttr
	res FRZ, [hl]

.done
	call RefreshBattleHuds
	ld hl, WasDefrostedText
	jp StdBattleTextBox
; 37588


INCLUDE "battle/effects/curse.asm"

INCLUDE "battle/effects/protect.asm"

INCLUDE "battle/effects/endure.asm"

INCLUDE "battle/effects/spikes.asm"

INCLUDE "battle/effects/foresight.asm"

INCLUDE "battle/effects/perish_song.asm"

INCLUDE "battle/effects/sandstorm.asm"

INCLUDE "battle/effects/rollout.asm"


BattleCommand5d: ; 37791
; unused
	ret
; 37792


BattleCommand_FuryCutter: ; 37792
; furycutter

	ld hl, PlayerFuryCutterCount
	ld a, [hBattleTurn]
	and a
	jr z, .go
	ld hl, EnemyFuryCutterCount

.go
	ld a, [AttackMissed]
	and a
	jp nz, ResetFuryCutterCount

	inc [hl]

; Damage capped at 5 turns' worth (16x).
	ld a, [hl]
	ld b, a
	cp 6
	jr c, .checkdouble
	ld b, 5

.checkdouble
	dec b
	ret z

; Double the damage
	ld hl, CurDamage + 1
	sla [hl]
	dec hl
	rl [hl]
	jr nc, .checkdouble

; No overflow
	ld a, $ff
	ld [hli], a
	ld [hl], a
	ret
; 377be


ResetFuryCutterCount: ; 377be

	push hl

	ld hl, PlayerFuryCutterCount
	ld a, [hBattleTurn]
	and a
	jr z, .reset
	ld hl, EnemyFuryCutterCount

.reset
	xor a
	ld [hl], a

	pop hl
	ret
; 377ce


INCLUDE "battle/effects/attract.asm"

BattleCommand_HappinessPower: ; 3784b
; happinesspower
	push bc
	ld hl, BattleMonHappiness
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, EnemyMonHappiness
.ok
	xor a
	ld [hMultiplicand + 0], a
	ld [hMultiplicand + 1], a
	ld a, [hl]
	ld [hMultiplicand + 2], a
	ld a, 10
	ld [hMultiplier], a
	call Multiply
	ld a, 25
	ld [hDivisor], a
	ld b, 4
	call Divide
	ld a, [hQuotient + 2]
	ld d, a
	pop bc
	ret
; 37874


INCLUDE "battle/effects/present.asm"

BattleCommand_FrustrationPower: ; 3790e
; frustrationpower

	push bc
	ld hl, BattleMonHappiness
	ld a, [hBattleTurn]
	and a
	jr z, .asm_3791a ; 37915 $3
	ld hl, EnemyMonHappiness
.asm_3791a
	ld a, $ff
	sub [hl]
	ld [hMultiplicand + 2], a
	xor a
	ld [hMultiplicand + 0], a
	ld [hMultiplicand + 1], a
	ld a, 10
	ld [hMultiplier], a
	call Multiply
	ld a, 25
	ld [hDivisor], a
	ld b, 4
	call Divide
	ld a, [hQuotient + 2]
	ld d, a
	pop bc
	ret
; 37939


BattleCommand_Safeguard: ; 37939
; safeguard

	ld hl, PlayerScreens
	ld de, PlayerSafeguardCount
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, EnemyScreens
	ld de, EnemySafeguardCount
.ok
	bit SCREENS_SAFEGUARD, [hl]
	jr nz, .failed
	set SCREENS_SAFEGUARD, [hl]
	ld a, 5
	ld [de], a
	call AnimateCurrentMove
	ld hl, CoveredByVeilText
	jp StdBattleTextBox
.failed
	call AnimateFailedMove
	jp PrintButItFailed
; 37962


SafeCheckSafeguard: ; 37962
	push hl
	ld hl, EnemyScreens
	ld a, [hBattleTurn]
	and a
	jr z, .got_turn
	ld hl, PlayerScreens

.got_turn
	bit SCREENS_SAFEGUARD, [hl]
	pop hl
	ret
; 37972


BattleCommand_CheckSafeguard: ; 37972
; checksafeguard
	ld hl, EnemyScreens
	ld a, [hBattleTurn]
	and a
	jr z, .got_turn ; 37978 $3
	ld hl, PlayerScreens
.got_turn
	bit SCREENS_SAFEGUARD, [hl]
	ret z
	ld a, 1
	ld [AttackMissed], a
	call BattleCommand_MoveDelay
	ld hl, SafeguardProtectText
	call StdBattleTextBox
	jp EndMoveEffect
; 37991


BattleCommand_GetMagnitude: ; 37991
; getmagnitude

	push bc
	call BattleRandom
	ld b, a
	ld hl, .Magnitudes
.loop
	ld a, [hli]
	cp b
	jr nc, .ok
rept 2
	inc hl
endr
	jr .loop
.ok
	ld d, [hl]
	push de
	inc hl
	ld a, [hl]
	ld [wTypeMatchup], a
	call BattleCommand_MoveDelay
	ld hl, MagnitudeText
	call StdBattleTextBox
	pop de
	pop bc
	ret

.Magnitudes
	;  /255, BP, magnitude
	db  13,  10,  4
	db  38,  30,  5
	db  89,  50,  6
	db 166,  70,  7
	db 217,  90,  8
	db 242, 110,  9
	db 255, 150, 10
; 379c9


BattleCommand_BatonPass: ; 379c9
; batonpass

	ld a, [hBattleTurn]
	and a
	jp nz, .Enemy


; Need something to switch to
	call CheckAnyOtherAlivePartyMons
	jp z, FailedBatonPass

	call UpdateBattleMonInParty
	call AnimateCurrentMove

	ld c, 50
	call DelayFrames

; Transition into switchmon menu
	call LoadPartyMenuDataHeader
	callba Function3d2f7

	callba ForcePickSwitchMonInBattle

; Return to battle scene
	call ClearPalettes
	callba Function3ed9f
	call WriteBackup
	call ClearSprites
	hlcoord 1, 0
	lb bc, 4, 10
	call ClearBox
	ld b, 1
	call GetSGBLayout
	call SetPalettes
	call BatonPass_LinkPlayerSwitch

; Mobile link battles handle entrances differently
	callba Function3d2e0
	jp c, EndMoveEffect

	ld hl, PassedBattleMonEntrance
	call CallBattleCore

	call ResetBatonPassStatus
	ret


.Enemy

; Wildmons don't have anything to switch to
	ld a, [wBattleMode]
	dec a ; WILDMON
	jp z, FailedBatonPass

	call CheckAnyOtherAliveEnemyMons
	jp z, FailedBatonPass

	call UpdateEnemyMonInParty
	call AnimateCurrentMove
	call BatonPass_LinkEnemySwitch

; Mobile link battles handle entrances differently
	callba Function3d2e0
	jp c, EndMoveEffect

; Passed enemy PartyMon entrance
	xor a
	ld [wc718], a
	ld hl, EnemySwitch_SetMode
	call CallBattleCore
	ld hl, ResetBattleParticipants
	call CallBattleCore
	ld a, 1
	ld [wTypeMatchup], a
	ld hl, ApplyStatLevelMultiplierOnAllStats
	call CallBattleCore

	ld hl, SpikesDamage
	call CallBattleCore

	jr ResetBatonPassStatus
; 37a67


BatonPass_LinkPlayerSwitch: ; 37a67
	ld a, [wLinkMode]
	and a
	ret z

	ld a, 1
	ld [wd0ec], a

	call LoadPartyMenuDataHeader
	ld hl, Function3e8e4
	call CallBattleCore
	call WriteBackup

	xor a
	ld [wd0ec], a
	ret
; 37a82


BatonPass_LinkEnemySwitch: ; 37a82
	ld a, [wLinkMode]
	and a
	ret z

	call LoadPartyMenuDataHeader
	ld hl, Function3e8e4
	call CallBattleCore

	ld a, [OTPartyCount]
	add BATTLEACTION_SWITCH1
	ld b, a
	ld a, [wBattleAction]
	cp BATTLEACTION_SWITCH1
	jr c, .baton_pass
	cp b
	jr c, .switch

.baton_pass
	ld a, [CurOTMon]
	add BATTLEACTION_SWITCH1
	ld [wBattleAction], a
.switch
	jp WriteBackup
; 37aab


FailedBatonPass: ; 37aab
	call AnimateFailedMove
	jp PrintButItFailed
; 37ab1


ResetBatonPassStatus: ; 37ab1
; Reset status changes that aren't passed by Baton Pass.

	; Nightmare isn't passed.
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP
	jr nz, .ok

	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	res SUBSTATUS_NIGHTMARE, [hl]
.ok

	; Disable isn't passed.
	call ResetActorDisable

	; Attraction isn't passed.
	ld hl, PlayerSubStatus1
	res SUBSTATUS_IN_LOVE, [hl]
	ld hl, EnemySubStatus1
	res SUBSTATUS_IN_LOVE, [hl]
	ld hl, PlayerSubStatus5

	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	res SUBSTATUS_TRANSFORMED, [hl]
	res SUBSTATUS_ENCORED, [hl]

	; New mon hasn't used a move yet.
	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	ld [hl], 0

	xor a
	ld [wc730], a
	ld [wc731], a
	ret
; 37ae9


CheckAnyOtherAlivePartyMons: ; 37ae9
	ld hl, PartyMon1HP
	ld a, [PartyCount]
	ld d, a
	ld a, [CurBattleMon]
	ld e, a
	jr CheckAnyOtherAliveMons
; 37af6


CheckAnyOtherAliveEnemyMons: ; 37af6
	ld hl, OTPartyMon1HP
	ld a, [OTPartyCount]
	ld d, a
	ld a, [CurOTMon]
	ld e, a

	; fallthrough
; 37b01

CheckAnyOtherAliveMons: ; 37b01
; Check for nonzero HP starting from partymon
; HP at hl for d partymons, besides current mon e.

; Return nz if any are alive.

	xor a
	ld b, a
	ld c, a
.loop
	ld a, c
	cp d
	jr z, .done
	cp e
	jr z, .next

	ld a, [hli]
	or b
	ld b, a
	ld a, [hld]
	or b
	ld b, a

.next
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	inc c
	jr .loop

.done
	ld a, b
	and a
	ret
; 37b1d


BattleCommand_Pursuit: ; 37b1d
; pursuit
; Double damage if the opponent is switching.

	ld hl, wEnemyIsSwitching
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wPlayerIsSwitching
.ok
	ld a, [hl]
	and a
	ret z

	ld hl, CurDamage + 1
	sla [hl]
	dec hl
	rl [hl]
	ret nc

	ld a, $ff
	ld [hli], a
	ld [hl], a
	ret
; 37b39


BattleCommand_ClearHazards: ; 37b39
; clearhazards

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	bit SUBSTATUS_LEECH_SEED, [hl]
	jr z, .asm_37b4a ; 37b40 $8
	res SUBSTATUS_LEECH_SEED, [hl]
	ld hl, ShedLeechSeedText
	call StdBattleTextBox
.asm_37b4a

	ld hl, PlayerScreens
	ld de, wc730
	ld a, [hBattleTurn]
	and a
	jr z, .asm_37b5b ; 37b53 $6
	ld hl, EnemyScreens
	ld de, wc731
.asm_37b5b
	bit SCREENS_SPIKES, [hl]
	jr z, .asm_37b69 ; 37b5d $a
	res SCREENS_SPIKES, [hl]
	ld hl, BlewSpikesText
	push de
	call StdBattleTextBox
	pop de
.asm_37b69

	ld a, [de]
	and a
	ret z
	xor a
	ld [de], a
	ld hl, ReleasedByText
	jp StdBattleTextBox
; 37b74


BattleCommand_HealMorn: ; 37b74
; healmorn
	ld b, MORN
	jr BattleCommand_HealMorn6c
; 37b78

BattleCommand_HealDay: ; 37b78
; healday
	ld b, DAY
	jr BattleCommand_HealMorn6c
; 37b7c

BattleCommand_HealNite: ; 37b7c
; healnite
	ld b, NITE
	; fallthrough
; 37b7e

BattleCommand_HealMorn6c: ; 37b7e
; Time- and weather-sensitive heal.

	ld hl, BattleMonMaxHP
	ld de, BattleMonHP
	ld a, [hBattleTurn]
	and a
	jr z, .start
	ld hl, EnemyMonMaxHP
	ld de, EnemyMonHP

.start
; Index for .Multipliers
; Default restores half max HP.
	ld c, 2

; Don't bother healing if HP is already full.
	push bc
	call StringCmp
	pop bc
	jr z, .Full

; Don't factor in time of day in link battles.
	ld a, [wLinkMode]
	and a
	jr nz, .Weather

	ld a, [TimeOfDay]
	cp b
	jr z, .Weather
	dec c

.Weather
	ld a, [Weather]
	and a
	jr z, .Heal

; x2 in sun
; /2 in rain/sandstorm
	inc c
	cp WEATHER_SUN
	jr z, .Heal
rept 2
	dec c
endr

.Heal
	ld b, 0
	ld hl, .Multipliers
rept 2
	add hl, bc
endr

	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, BANK(GetMaxHP)
	rst FarCall

	call AnimateCurrentMove
	call BattleCommand_SwitchTurn

	callab RestoreHP

	call BattleCommand_SwitchTurn
	call UpdateUserInParty

; 'regained health!'
	ld hl, RegainedHealthText
	jp StdBattleTextBox

.Full
	call AnimateFailedMove

; 'hp is full!'
	ld hl, HPIsFullText
	jp StdBattleTextBox

.Multipliers
	dw GetEighthMaxHP
	dw GetQuarterMaxHP
	dw GetHalfMaxHP
	dw GetMaxHP
; 37be8


BattleCommand_HiddenPower: ; 37be8
; hiddenpower

	ld a, [AttackMissed]
	and a
	ret nz
	callba HiddenPowerDamage
	ret
; 37bf4


BattleCommand_StartRain: ; 37bf4
; startrain
	ld a, WEATHER_RAIN
	ld [Weather], a
	ld a, 5
	ld [WeatherCount], a
	call AnimateCurrentMove
	ld hl, DownpourText
	jp StdBattleTextBox
; 37c07


BattleCommand_StartSun: ; 37c07
; startsun
	ld a, WEATHER_SUN
	ld [Weather], a
	ld a, 5
	ld [WeatherCount], a
	call AnimateCurrentMove
	ld hl, SunGotBrightText
	jp StdBattleTextBox
; 37c1a


BattleCommand_BellyDrum: ; 37c1a
; bellydrum
	call BattleCommand_AttackUp2
	ld a, [AttackMissed]
	and a
	jr nz, .asm_37c4f

	callab GetHalfMaxHP

	callab Function3ccde
	jr nc, .asm_37c4f

	push bc
	call AnimateCurrentMove
	pop bc
	callab SubtractHPFromUser
	call UpdateUserInParty
	ld a, 5

.asm_37c41
	push af
	call BattleCommand_AttackUp2
	pop af
	dec a
	jr nz, .asm_37c41

	ld hl, BellyDrumText
	jp StdBattleTextBox
.asm_37c4f
	call AnimateFailedMove
	jp PrintButItFailed
; 37c55


BattleCommand_PsychUp: ; 37c55
; psychup

	ld hl, EnemyStatLevels
	ld de, PlayerStatLevels
	ld a, [hBattleTurn]
	and a
	jr z, .asm_37c64 ; 37c5e $4
	push hl
	ld h, d
	ld l, e
	pop de
.asm_37c64
	push hl
	ld b, $8
.asm_37c67
	ld a, [hli]
	cp $7
	jr nz, .asm_37c76 ; 37c6a $a
	dec b
	jr nz, .asm_37c67 ; 37c6d $f8
	pop hl
	call AnimateFailedMove
	jp PrintButItFailed
.asm_37c76
	pop hl
	ld b, $8
.asm_37c79
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_37c79 ; 37c7d $fa
	ld a, [hBattleTurn]
	and a
	jr nz, .asm_37c89 ; 37c82 $5
	call CalcPlayerStats
	jr .asm_37c8c ; 37c87 $3
.asm_37c89
	call CalcEnemyStats
.asm_37c8c
	call AnimateCurrentMove
	ld hl, CopiedStatsText
	jp StdBattleTextBox
; 37c95


BattleCommand_MirrorCoat: ; 37c95
; mirrorcoat

	ld a, 1
	ld [AttackMissed], a

	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	ret z

	ld b, a
	callab GetMoveEffect
	ld a, b
	cp EFFECT_MIRROR_COAT
	ret z

	call BattleCommand_ResetTypeMatchup
	ld a, [wTypeMatchup]
	and a
	ret z

	call Function36abf
	ret z

	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	dec a
	ld de, StringBuffer1
	call GetMoveData

	ld a, [StringBuffer1 + 2]
	and a
	ret z

	ld a, [StringBuffer1 + 3]
	cp SPECIAL
	ret c

	ld hl, CurDamage
	ld a, [hli]
	or [hl]
	ret z

	ld a, [hl]
	add a
	ld [hld], a
	ld a, [hl]
	adc a
	ld [hl], a
	jr nc, .capped
	ld a, $ff
	ld [hli], a
	ld [hl], a
.capped

	xor a
	ld [AttackMissed], a
	ret
; 37ce6


BattleCommand_DoubleMinimizeDamage: ; 37ce6
; doubleminimizedamage

	ld hl, wc6fa
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wc6fe
.ok
	ld a, [hl]
	and a
	ret z
	ld hl, CurDamage + 1
	sla [hl]
	dec hl
	rl [hl]
	ret nc
	ld a, $ff
	ld [hli], a
	ld [hl], a
	ret
; 37d02


BattleCommand_SkipSunCharge: ; 37d02
; skipsuncharge
	ld a, [Weather]
	cp WEATHER_SUN
	ret nz
	ld b, charge_command
	jp SkipToBattleCommand
; 37d0d


BattleCommand_CheckFutureSight: ; 37d0d
; checkfuturesight

	ld hl, wc71d
	ld de, wc727
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wc71e
	ld de, wc729
.ok

	ld a, [hl]
	and a
	ret z
	cp 1
	ret nz

	ld [hl], 0
	ld a, [de]
	inc de
	ld [CurDamage], a
	ld a, [de]
	ld [CurDamage + 1], a
	ld b, futuresight_command
	jp SkipToBattleCommand
; 37d34

BattleCommand_FutureSight: ; 37d34
; futuresight

	call Function34548
	jr nz, .asm_37d4b ; 37d37 $12
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld b, a
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE
	call GetBattleVarAddr
	ld [hl], b
	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	ld [hl], b
.asm_37d4b
	ld hl, wc71d
	ld a, [hBattleTurn]
	and a
	jr z, .asm_37d56 ; 37d51 $3
	ld hl, wc71e
.asm_37d56
	ld a, [hl]
	and a
	jr nz, .asm_37d87 ; 37d58 $2d
	ld a, $4
	ld [hl], a
	call BattleCommand_LowerSub
	call BattleCommand_MoveDelay
	ld hl, ForesawAttackText
	call StdBattleTextBox
	call BattleCommand_RaiseSub
	ld de, wc727
	ld a, [hBattleTurn]
	and a
	jr z, .asm_37d77 ; 37d72 $3
	ld de, wc729
.asm_37d77
	ld hl, CurDamage
	ld a, [hl]
	ld [de], a
	ld [hl], 0
	inc hl
	inc de
	ld a, [hl]
	ld [de], a
	ld [hl], 0
	jp EndMoveEffect
.asm_37d87
	pop bc
	call ResetDamage
	call AnimateFailedMove
	call PrintButItFailed
	jp EndMoveEffect
; 37d94


BattleCommand_ThunderAccuracy: ; 37d94
; thunderaccuracy

	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	inc hl
	ld a, [Weather]
	cp WEATHER_RAIN
	jr z, .rain
	cp WEATHER_SUN
	ret nz
	ld [hl], 50 percent + 1
	ret
.rain
	ld [hl], 100 percent
	ret
; 37daa


CheckHiddenOpponent: ; 37daa
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret
; 37db2


GetUserItem: ; 37db2
; Return the effect of the user's item in bc, and its id at hl.
	ld hl, BattleMonItem
	ld a, [hBattleTurn]
	and a
	jr z, .go
	ld hl, EnemyMonItem
.go
	ld b, [hl]
	jp GetItem
; 37dc1


GetOpponentItem: ; 37dc1
; Return the effect of the opponent's item in bc, and its id at hl.
	ld hl, EnemyMonItem
	ld a, [hBattleTurn]
	and a
	jr z, .go
	ld hl, BattleMonItem
.go
	ld b, [hl]
	jp GetItem
; 37dd0


GetItem: ; 37dd0
; Return the effect of item b in bc.
	ld a, b
	and a
	ret z

	push hl
	ld hl, ItemAttributes + 2
	dec a
	ld c, a
	ld b, 0
	ld a, Item2Attributes - Item1Attributes
	call AddNTimes
	ld a, BANK(ItemAttributes)
	call GetFarHalfword
	ld b, l
	ld c, h
	pop hl
	ret
; 37de9


AnimateCurrentMoveEitherSide: ; 37de9
	push hl
	push de
	push bc
	ld a, [wKickCounter]
	push af
	call BattleCommand_LowerSub
	pop af
	ld [wKickCounter], a
	call PlayMoveAnim_ClearHiID
	call BattleCommand_RaiseSub
	pop bc
	pop de
	pop hl
	ret
; 37e01


AnimateCurrentMove: ; 37e01
	push hl
	push de
	push bc
	ld a, [wKickCounter]
	push af
	call BattleCommand_LowerSub
	pop af
	ld [wKickCounter], a
	call PlayPlayerMoveAnim_ClearHiID
	call BattleCommand_RaiseSub
	pop bc
	pop de
	pop hl
	ret
; 37e19


PlayMoveAnim_ClearHiID: ; 37e19
	xor a
	ld [FXAnimIDHi], a

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	and a
	ret z

	ld [FXAnimIDLo], a

	ld a, [hBattleTurn]
	and a
	ld a, 1
	jr z, .player
	ld a, 4

.player
	ld [wcfca], a

	jp PlayUserBattleAnim
; 37e36


PlayPlayerMoveAnim_ClearHiID: ; 37e36
	xor a
	ld [wcfca], a
	ld [FXAnimIDHi], a

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	and a
	ret z

	; fallthrough
; 37e44


PlayMoveAnim_KeepHiID: ; 37e44

	ld [FXAnimIDLo], a

	; fallthrough
; 37e47


PlayUserBattleAnim: ; 37e47
	push hl
	push de
	push bc
	callab PlayBattleAnim
	pop bc
	pop de
	pop hl
	ret
; 37e54


PlayOpponentBattleAnim: ; 37e54
	ld a, e
	ld [FXAnimIDLo], a
	ld a, d
	ld [FXAnimIDHi], a
	xor a
	ld [wcfca], a

	push hl
	push de
	push bc
	call BattleCommand_SwitchTurn

	callab PlayBattleAnim

	call BattleCommand_SwitchTurn
	pop bc
	pop de
	pop hl
	ret
; 37e73


CallBattleCore: ; 37e73
	ld a, BANK(BattleCore)
	rst FarCall
	ret
; 37e77


AnimateFailedMove: ; 37e77
	call BattleCommand_LowerSub
	call BattleCommand_MoveDelay
	jp BattleCommand_RaiseSub
; 37e80


BattleCommand_MoveDelay: ; 37e80
; movedelay
; Wait 40 frames.
	ld c, 40
	jp DelayFrames
; 37e85


BattleCommand_ClearText: ; 37e85
; cleartext

; Used in multi-hit moves.
	ld hl, .text
	jp BattleTextBox
.text
	db "@"
; 37e8c


SkipToBattleCommand: ; 37e8c
; Skip over commands until reaching command b.
	ld a, [BattleScriptBufferLoc + 1]
	ld h, a
	ld a, [BattleScriptBufferLoc]
	ld l, a
.asm_37e94
	ld a, [hli]
	cp b
	jr nz, .asm_37e94

	ld a, h
	ld [BattleScriptBufferLoc + 1], a
	ld a, l
	ld [BattleScriptBufferLoc], a
	ret
; 37ea1


GetMoveAttr: ; 37ea1
; Assuming hl = Moves + x, return attribute x of move a.
	push bc
	ld bc, MOVE_LENGTH
	call AddNTimes
	call GetMoveByte
	pop bc
	ret
; 37ead


GetMoveData: ; 37ead
; Copy move struct a to de.
	ld hl, Moves
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, Bank(Moves)
	jp FarCopyBytes
; 37ebb


GetMoveByte: ; 37ebb
	ld a, BANK(Moves)
	jp GetFarByte
; 37ec0


Function37ec0: ; 37ec0
	callba Functionfbd54
	ret
; 37ec7


Function37ec7: ; 37ec7
	callba Functionfbd71
	ret
; 37ece


Function37ece: ; 37ece
	callba Functionfbd69
	ret
; 37ed5


_CheckBattleScene: ; 37ed5
; Checks the options.  Returns carry if battle animations are disabled.
	push hl
	push de
	push bc
	callba CheckBattleScene
	pop bc
	pop de
	pop hl
	ret
; 37ee2
