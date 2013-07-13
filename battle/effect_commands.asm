DoPlayerTurn: ; 34000
	call SetPlayerTurn

	ld a, [$d0ec]
	and a
	ret nz

	jr DoTurn
; 3400a


DoEnemyTurn: ; 3400a
	call SetEnemyTurn

	ld a, [InLinkBattle]
	and a
	jr z, DoTurn

	ld a, [$d430]
	cp $e
	jr z, DoTurn
	cp $4
	ret nc

	; fallthrough
; 3401d


DoTurn: ; 3401d
; Read in and execute the user's move effects for this turn.

	xor a
	ld [$c6b4], a

; Effect command checkturn is called for every move.
	call CheckTurn

	ld a, [$c6b4]
	and a
	ret nz

	call UpdateMoveData
; 3402c


DoMove: ; 3402c
; Get the user's move effect.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call CleanGetBattleVarPair
	ld c, a
	ld b, 0
	ld hl, MoveEffectsPointers
	add hl, bc
	add hl, bc
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

; $fe is used to terminate branches without ending the read cycle.
	cp $fe
	ret nc

; The rest of the commands (01-af) are read from BattleCommandPointers.
	push bc
	dec a
	ld c, a
	ld b, 0
	ld hl, BattleCommandPointers
	add hl, bc
	add hl, bc
	pop bc

	ld a, BANK(BattleCommandPointers)
	call GetFarHalfword

	call .DoMoveEffectCommand

	jr .ReadMoveEffectCommand

.DoMoveEffectCommand
	jp [hl]
; 34084


CheckTurn:
BattleCommand01: ; 34084
; checkturn

; Repurposed as hardcoded turn handling. Useless as a command.

; Move $ff immediately ends the turn.
	ld a, BATTLE_VARS_MOVE
	call CleanGetBattleVarPair
	inc a
	jp z, Function0x34385

	xor a
	ld [AttackMissed], a
	ld [EffectFailed], a
	ld [$c689], a
	ld [AlreadyDisobeyed], a
	ld [AlreadyFailed], a
	ld [$c73e], a

	ld a, 10 ; 1.0
	ld [TypeModifier], a

	ld a, [hBattleTurn]
	and a
	jp nz, CheckEnemyTurn


CheckPlayerTurn:

; check recharge
	ld hl, PlayerSubStatus4
	bit 5, [hl]
	jr z, .CheckSleep
	res 5, [hl]

; 'must recharge!'
	ld hl, MustRechargeText
	call FarBattleTextBox

	call CantMove
	jp Function0x34385


.CheckSleep
	ld hl, BattleMonStatus
	ld a, [hl]
	and $7
	jr z, .CheckFrozen
	dec a
	ld [BattleMonStatus], a
	and $7
	jr z, .WokeUp
	xor a
	ld [$cfca], a
	ld de, ANIM_SLEEP
	call FarPlayBattleAnimation
	jr .FastAsleep


.WokeUp
; 'woke up!'
	ld hl, WokeUpText
	call FarBattleTextBox

	call CantMove
	call UpdateBattleMonInParty
	ld hl, $5f48
	call CallBankF
	ld a, $1
	ld [$ffd4], a
	ld hl, PlayerSubStatus1
	res 0, [hl]
	jr .CheckFrozen


.FastAsleep
; 'fast asleep!'
	ld hl, FastAsleepText
	call FarBattleTextBox

; Snore and Sleep Talk bypass sleep.
	ld a, [CurPlayerMove]
	cp SNORE
	jr z, .CheckFrozen
	cp SLEEP_TALK
	jr z, .CheckFrozen
	call CantMove
	jp Function0x34385


.CheckFrozen
	ld hl, BattleMonStatus
	bit 5, [hl]
	jr z, .CheckFlinch

; Flame Wheel and Sacred Fire thaw the user.
	ld a, [CurPlayerMove]
	cp FLAME_WHEEL
	jr z, .CheckFlinch
	cp SACRED_FIRE
	jr z, .CheckFlinch

; 'frozen solid!'
	ld hl, FrozenSolidText
	call FarBattleTextBox

	call CantMove
	jp Function0x34385


.CheckFlinch
	ld hl, PlayerSubStatus3
	bit 3, [hl] ; flinch
	jr z, .CheckDisabled

	res 3, [hl]

; 'flinched!'
	ld hl, FlinchedText
	call FarBattleTextBox

	call CantMove
	jp Function0x34385


.CheckDisabled
	ld hl, PlayerDisableCount
	ld a, [hl]
	and a
	jr z, .CheckConfused
	dec a
	ld [hl], a
	and $f
	jr nz, .CheckConfused
	ld [hl], a
	ld [DisabledMove], a

; 'disabled no more!'
	ld hl, DisabledNoMoreText
	call FarBattleTextBox


.CheckConfused
	ld a, [PlayerSubStatus3]
	add a
	jr nc, .CheckAttract
	ld hl, PlayerConfuseCount
	dec [hl]
	jr nz, .Confused

	ld hl, PlayerSubStatus3
	res 7, [hl]

; 'confused no more!'
	ld hl, ConfusedNoMoreText
	call FarBattleTextBox

	jr .CheckAttract


.Confused
; 'confused!'
	ld hl, IsConfusedText
	call FarBattleTextBox

	xor a
	ld [$cfca], a
	ld de, ANIM_CONFUSED
	call FarPlayBattleAnimation

; 50% chance of hitting itself
	call FarBattleRNG
	cp $80
	jr nc, .CheckAttract

	ld hl, PlayerSubStatus3
	ld a, [hl]
	and $80
	ld [hl], a

	call HitConfusion

	call CantMove
	jp Function0x34385


.CheckAttract
	ld a, [PlayerSubStatus1]
	add a ; check bit 7
	jr nc, .CheckDisabledMove

; 'in love with'
	ld hl, InLoveWithText
	call FarBattleTextBox

	xor a
	ld [$cfca], a

	ld de, ANIM_INLOVE
	call FarPlayBattleAnimation

; 50% chance of infatuation
	call FarBattleRNG
	cp $80
	jr c, .CheckDisabledMove

; 'infatuation kept it from attacking!'
	ld hl, InfatuationText
	call FarBattleTextBox

	call CantMove
	jp Function0x34385


.CheckDisabledMove
; We can't disable a move that doesn't exist.
	ld a, [DisabledMove]
	and a
	jr z, .CheckParalyzed

; Are we using the disabled move?
	ld hl, CurPlayerMove
	cp [hl]
	jr nz, .CheckParalyzed

	call MoveDisabled
	call CantMove
	jp Function0x34385


.CheckParalyzed
	ld hl, BattleMonStatus
	bit 6, [hl]
	ret z

; 25% chance to be fully paralyzed
	call FarBattleRNG
	cp $3f
	ret nc

; 'fully paralyzed!'
	ld hl, FullyParalyzedText
	call FarBattleTextBox
	call CantMove
	jp Function0x34385
; 341f0


CantMove: ; 341f0
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarPair
	res 6, [hl]

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarPair
	ld a, [hl]
	and $ec
	ld [hl], a

	call ResetFuryCutterCount

	ld a, BATTLE_VARS_MOVE_ANIM
	call CleanGetBattleVarPair
	cp FLY
	jr z, .asm_3420f

	cp $5b
	ret nz

.asm_3420f
	res 5, [hl]
	res 6, [hl]
	jp Function0x37ece
; 34216



Function0x34216: ; 34216
	call SwitchTurn
	call CantMove
	jp SwitchTurn
; 3421f



CheckEnemyTurn: ; 3421f

; check recharge
	ld hl, EnemySubStatus4
	bit 5, [hl]
	jr z, .CheckSleep
	res 5, [hl]

; 'must recharge!'
	ld hl, MustRechargeText
	call FarBattleTextBox
	call CantMove
	jp Function0x34385


.CheckSleep
	ld hl, EnemyMonStatus
	ld a, [hl]
	and $7
	jr z, .CheckFrozen
	dec a
	ld [EnemyMonStatus], a
	and a
	jr z, .WokeUp

; 'fast asleep!'
	ld hl, FastAsleepText
	call FarBattleTextBox
	xor a
	ld [$cfca], a
	ld de, ANIM_SLEEP
	call FarPlayBattleAnimation
	jr .FastAsleep


.WokeUp
; 'woke up!'
	ld hl, WokeUpText
	call FarBattleTextBox
	call CantMove
	call UpdateEnemyMonInParty
	ld hl, $6036
	call CallBankF
	ld a, $1
	ld [$ffd4], a
	ld hl, EnemySubStatus1
	res 0, [hl]
	jr .CheckFrozen


.FastAsleep
; Snore and Sleep Talk bypass sleep.
	ld a, [CurEnemyMove]
	cp SNORE
	jr z, .CheckFrozen
	cp SLEEP_TALK
	jr z, .CheckFrozen
	call CantMove
	jp Function0x34385


.CheckFrozen
	ld hl, EnemyMonStatus
	bit 5, [hl]
	jr z, .CheckFlinch
	ld a, [CurEnemyMove]
	cp $ac
	jr z, .CheckFlinch
	cp $dd
	jr z, .CheckFlinch

; 'frozen solid!'
	ld hl, FrozenSolidText
	call FarBattleTextBox
	call CantMove
	jp Function0x34385


.CheckFlinch
	ld hl, EnemySubStatus3
	bit 3, [hl]
	jr z, .CheckDisabled

	res 3, [hl]

; 'flinched!'
	ld hl, FlinchedText
	call FarBattleTextBox

	call CantMove
	jp Function0x34385


.CheckDisabled
	ld hl, EnemyDisableCount
	ld a, [hl]
	and a
	jr z, .CheckConfused

	dec a
	ld [hl], a
	and $f
	jr nz, .CheckConfused

	ld [hl], a
	ld [EnemyDisabledMove], a

; 'disabled no more!'
	ld hl, DisabledNoMoreText
	call FarBattleTextBox


.CheckConfused
	ld a, [EnemySubStatus3]
	add a
	jr nc, .CheckAttract

	ld hl, $c67b
	dec [hl]
	jr nz, .Confused

	ld hl, EnemySubStatus3
	res 7, [hl]

; 'confused no more!'
	ld hl, ConfusedNoMoreText
	call FarBattleTextBox

	jr .CheckAttract


.Confused
; 'confused!'
	ld hl, IsConfusedText
	call FarBattleTextBox

	xor a
	ld [$cfca], a
	ld de, ANIM_CONFUSED
	call FarPlayBattleAnimation

; 50% chance of hitting itself
	call FarBattleRNG
	cp $80
	jr nc, .CheckAttract

	ld hl, EnemySubStatus3
	ld a, [hl]
	and %10000000
	ld [hl], a

; 'hurt itself in its confusion!'
	ld hl, HurtItselfText
	call FarBattleTextBox

	call Function0x355dd

	call BattleCommand62

	call BattleCommand0a

	xor a
	ld [$cfca], a

; Flicker the monster pic unless flying or underground.
	ld de, $0115
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call CleanGetBattleVarPair
	and $60
	call z, PlayFXAnimID

	ld c, $1
	call Function0x35d1c

	call BattleCommand0c

	call CantMove
	jp Function0x34385


.CheckAttract
	ld a, [EnemySubStatus1]
	add a ; check bit 7
	jr nc, .CheckDisabledMove

; 'in love with'
	ld hl, InLoveWithText
	call FarBattleTextBox

	xor a
	ld [$cfca], a

	ld de, ANIM_INLOVE
	call FarPlayBattleAnimation

; 50% chance of infatuation
	call FarBattleRNG
	cp $80
	jr c, .CheckDisabledMove

; 'infatuation kept it from attacking!'
	ld hl, InfatuationText
	call FarBattleTextBox

	call CantMove
	jp Function0x34385


.CheckDisabledMove
; We can't disable a move that doesn't exist.
	ld a, [EnemyDisabledMove]
	and a
	jr z, .CheckParalyzed

; Are we using the disabled move?
	ld hl, CurEnemyMove
	cp [hl]
	jr nz, .CheckParalyzed

	call MoveDisabled

	call CantMove
	jp Function0x34385


.CheckParalyzed
	ld hl, EnemyMonStatus
	bit 6, [hl]
	ret z

; 25% chance to be fully paralyzed
	call FarBattleRNG
	cp $3f
	ret nc

; 'fully paralyzed!'
	ld hl, FullyParalyzedText
	call FarBattleTextBox

	call CantMove

	; fallthrough
; 34385


Function0x34385: ; 34385
	ld a, $1
	ld [$c6b4], a
	jp ResetDamage
; 3438d


MoveDisabled: ; 3438d

; Make sure any charged moves fail
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarPair
	res 4, [hl]

	ld a, BATTLE_VARS_MOVE
	call CleanGetBattleVarPair
	ld [$d265], a
	call GetMoveName

; 'disabled!'
	ld hl, DisabledMoveText
	jp FarBattleTextBox
; 343a5


HitConfusion: ; 343a5

; 'hurt itself in its confusion!'
	ld hl, HurtItselfText
	call FarBattleTextBox

	xor a
	ld [CriticalHit], a

	call Function0x355dd

	call BattleCommand62

	call BattleCommand0a

	xor a
	ld [$cfca], a

; Flicker the monster pic unless flying or underground.
	ld de, $0115
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call CleanGetBattleVarPair
	and $60
	call z, PlayFXAnimID

	ld hl, $5f48
	call CallBankF

	ld a, $1
	ld [$ffd4], a

	ld c, $1
	call Function0x35d7e

	jp BattleCommand0c
; 343db


BattleCommand02: ; 343db
; checkobedience

; Enemy can't disobey
	ld a, [hBattleTurn]
	and a
	ret nz

	call Function0x34548
	ret nz

; If we've already checked this turn
	ld a, [AlreadyDisobeyed]
	and a
	ret nz

	xor a
	ld [AlreadyDisobeyed], a

; No obedience in link battles (since no handling exists for enemy)
	ld a, [InLinkBattle]
	and a
	ret nz

	ld a, [$cfc0]
	and a
	ret nz

; If the monster's id doesn't match the player's,
; some conditions need to be met.
	ld a, PartyMon1ID - PartyMon1
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
	bit 7, [hl]
	ld a, 101
	jr nz, .getlevel

; stormbadge
	bit 5, [hl]
	ld a, 70
	jr nz, .getlevel

; fogbadge
	bit 3, [hl]
	ld a, 50
	jr nz, .getlevel

; hivebadge
	bit 1, [hl]
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
	call FarBattleRNG
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
	call FarBattleRNG
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
	call FarBattleRNG
	swap a
	sub b
	jr c, .Nap

; The chance of not hitting itself is the same.
	cp b
	jr nc, .DoNothing

; 'won't obey!'
	ld hl, WontObeyText
	call FarBattleTextBox

	call HitConfusion

	jp Function0x3450c


.Nap
	call FarBattleRNG
	add a
	swap a
	and 7
	jr z, .Nap

	ld [BattleMonStatus], a

; 'began to nap!'
	ld hl, BeganToNapText
	jr .Print


.DoNothing
	call FarBattleRNG
	and 3

; 'loafing around!'
	ld hl, LoafingAroundText
	and a
	jr z, .Print

; 'won't obey!'
	ld hl, WontObeyText
	dec a
	jr z, .Print

; 'turned away!'
	ld hl, TurnedAwayText
	dec a
	jr z, .Print

; 'ignored orders!'
	ld hl, IgnoredOrdersText

.Print
	call FarBattleTextBox
	jp Function0x3450c


.UseInstead

; Can't use another move if the monster only has one!
	ld a, [BattleMonMove2]
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

	ld a, [$cfa3]
	ld b, a

; Save the move we originally picked for afterward.
	ld a, [CurMoveNum]
	ld c, a
	push af


.RandomMove
	call FarBattleRNG
	and 3

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

	; fallthrough
; 3450c


Function0x3450c: ; 3450c
	xor a
	ld [LastPlayerMove], a
	ld [LastEnemyCounterMove], a

	ld hl, PlayerSubStatus5
	res 4, [hl]

; Break encore too.
	xor a
	ld [PlayerEncoreCount], a

	jp EndMoveEffect
; 3451f


IgnoreSleepOnly: ; 3451f

	ld a, BATTLE_VARS_MOVE_ANIM
	call CleanGetBattleVarPair

	cp SNORE
	jr z, .CheckSleep
	cp SLEEP_TALK
	jr z, .CheckSleep
	and a
	ret

.CheckSleep
	ld a, BATTLE_VARS_STATUS
	call CleanGetBattleVarPair
	and 7
	ret z

; 'ignored orders…sleeping!'
	ld hl, IgnoredSleepingText
	call FarBattleTextBox

	call EndMoveEffect

	scf
	ret
; 34541


BattleCommand03: ; 34541
; usedmovetext
	callba DisplayUsedMoveText
	ret
; 34548


Function0x34548: ; 34548

	ld a, [hBattleTurn]
	and a
	ld a, [$c732] ; player
	jr z, .end
	ld a, [$c733] ; enemy
.end
	and a
	ret
; 34555


BattleCommand04: ; 34555
	call Function0x34548
	ret nz

	ld hl, BattleMonPP
	ld de, PlayerSubStatus3
	ld bc, PlayerTurnsTaken

	ld a, [hBattleTurn]
	and a
	jr z, .asm_34570

	ld hl, EnemyMonPP
	ld de, EnemySubStatus3
	ld bc, EnemyTurnsTaken

.asm_34570
; If we've gotten this far, this counts as a turn.
	ld a, [bc]
	inc a
	ld [bc], a

	ld a, BATTLE_VARS_MOVE
	call CleanGetBattleVarPair
	cp STRUGGLE
	ret z

	ld a, [de]
	and %111 ; rollout | bide | ???
	ret nz

	call .asm_345ad
	ld a, b
	and a
	jp nz, EndMoveEffect

; SubStatus5
	inc de
	inc de

	ld a, [de]
	bit 3, a
	ret nz

	ld a, [hBattleTurn]
	and a

	ld hl, PartyMon1PP
	ld a, [CurBattleMon]
	jr z, .asm_345a4

; skip this part entirely if wildbattle
	ld a, [IsInBattle]
	dec a
	jr z, .asm_345c5

	ld hl, OTPartyMon1PP
	ld a, [CurOTMon]

.asm_345a4
	call GetPartyLocation
	push hl
	call Function0x3460b
	pop hl
	ret c

.asm_345ad
	ld a, [hBattleTurn]
	and a
	ld a, [CurMoveNum]
	jr z, .asm_345b8
	ld a, [CurEnemyMoveNum]

.asm_345b8
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	and $3f
	jr z, .asm_345e3
	dec [hl]
	ld b, $0
	ret

.asm_345c5
	ld hl, EnemyMonMoves
	ld a, [CurEnemyMoveNum]
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	cp MIMIC
	jr z, .asm_345dc
	ld hl, $c735
	add hl, bc
	ld a, [hl]
	cp MIMIC
	ret z

.asm_345dc
	ld hl, $c739
	call .asm_345ad
	ret

.asm_345e3
	call BattleCommandaa
; get move effect
	ld a, BATTLE_VARS_MOVE_EFFECT
	call CleanGetBattleVarPair
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
	call FarBattleTextBox
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

Function0x3460b: ; 3460b
	ld a, [hBattleTurn]
	and a
	ld a, [CurMoveNum]
	jr z, .asm_34616
	ld a, [CurEnemyMoveNum]

.asm_34616
	ld c, a
	ld a, 2
	call UserPartyAttr

	ld a, BATTLE_VARS_MOVE
	call CleanGetBattleVarPair
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


BattleCommand05: ; 34631
; critical

; Determine whether this attack's hit will be critical.

	xor a
	ld [CriticalHit], a

	ld a, BATTLE_VARS_MOVE_POWER
	call CleanGetBattleVarPair
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
	call CleanGetBattleVarPair
	bit 2, a
	jr z, .CheckCritical

; +1 critical level
	inc c

.CheckCritical
	ld a, BATTLE_VARS_MOVE_ANIM
	call CleanGetBattleVarPair
	ld de, 1
	ld hl, .Criticals
	push bc
	call IsInArray
	pop bc
	jr nc, .ScopeLens

; +2 critical level
	inc c
	inc c

.ScopeLens
	push bc
	call GetUserItem
	ld a, b
	cp $49 ; Increased critical chance. Only Scope Lens has this.
	pop bc
	jr nz, .Tally

; +1 critical level
	inc c

.Tally
	ld hl, .Chances
	ld b, 0
	add hl, bc
	call FarBattleRNG
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


BattleCommand4e: ; 346b2
; triplekick

	ld a, [$c689]
	ld b, a
	inc b
	ld hl, CurDamage + 1
	ld a, [hld]
	ld e, a
	ld a, [hli]
	ld d, a
.asm_346be
	dec b
	ret z
	ld a, [hl]
	add e
	ld [hld], a
	ld a, [hl]
	adc d
	ld [hli], a

; No overflow.
	jr nc, .asm_346be
	ld a, $ff
	ld [hld], a
	ld [hl], a
	ret
; 346cd


BattleCommand4f: ; 346cd
; kickcounter

	ld hl, $c689
	inc [hl]
	ret
; 346d2


BattleCommand07: ; 346d2
; stab
	ld a, BATTLE_VARS_MOVE_ANIM
	call CleanGetBattleVarPair
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
	jr z, .go

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
	call GetBattleVarPair
	ld [$d265], a

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

	ld a, [$d265]
	cp b
	jr z, .stab
	cp c
	jr z, .stab

	jr .asm_3473a

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

.asm_3473a
	ld a, BATTLE_VARS_MOVE_TYPE
	call CleanGetBattleVarPair
	ld b, a
	ld hl, TypeMatchup

.asm_34743
	ld a, [hli]

	cp $ff
	jr z, .end

; foresight
	cp $fe
	jr nz, .asm_34757
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call CleanGetBattleVarPair
	bit 3, a
	jr nz, .end

	jr .asm_34743

.asm_34757
	cp b
	jr nz, .asm_347b3
	ld a, [hl]
	cp d
	jr z, .asm_34763
	cp e
	jr z, .asm_34763
	jr .asm_347b3

.asm_34763
	push hl
	push bc
	inc hl
	ld a, [TypeModifier]
	and %10000000
	ld b, a
	ld a, [hl]
	and a
	jr nz, .asm_34775
	inc a
	ld [AttackMissed], a
	xor a
.asm_34775
	ld [$ffb7], a
	add b
	ld [TypeModifier], a

	xor a
	ld [$ffb4], a

	ld hl, CurDamage
	ld a, [hli]
	ld [$ffb5], a
	ld a, [hld]
	ld [$ffb6], a

	call Multiply

	ld a, [$ffb4]
	ld b, a
	ld a, [$ffb5]
	or b
	ld b, a
	ld a, [$ffb6]
	or b
	jr z, .asm_347ab

	ld a, $a
	ld [$ffb7], a
	ld b, $4
	call Divide
	ld a, [$ffb5]
	ld b, a
	ld a, [$ffb6]
	or b
	jr nz, .asm_347ab

	ld a, $1
	ld [$ffb6], a

.asm_347ab
	ld a, [$ffb5]
	ld [hli], a
	ld a, [$ffb6]
	ld [hl], a
	pop bc
	pop hl

.asm_347b3
	inc hl
	inc hl
	jr .asm_34743

.end
	call Function0x347c8
	ld a, [$d265]
	ld b, a
	ld a, [TypeModifier]
	and $80
	or b
	ld [TypeModifier], a
	ret
; 347c8


Function0x347c8: ; 347c8
	ld hl, EnemyMonType1
	ld a, [hBattleTurn]
	and a
	jr z, Function0x347d3
	ld hl, BattleMonType1

	; fallthrough
; 347d3


Function0x347d3: ; 347d3
	push hl
	push de
	push bc
	ld a, BATTLE_VARS_MOVE_TYPE
	call CleanGetBattleVarPair
	ld d, a
	ld b, [hl]
	inc hl
	ld c, [hl]
	ld a, $a
	ld [$d265], a
	ld hl, TypeMatchup
.asm_347e7
	ld a, [hli]
	cp $ff
	jr z, .asm_3482f ; 0x347ea $43
	cp $fe
	jr nz, .asm_347fb ; 0x347ee $b
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call CleanGetBattleVarPair
	bit SUBSTATUS_IDENTIFIED, a
	jr nz, .asm_3482f ; 0x347f7 $36
	jr .asm_347e7 ; 0x347f9 $ec
.asm_347fb
	cp d
	jr nz, .asm_34807 ; 0x347fc $9
	ld a, [hli]
	cp b
	jr z, .asm_3480b ; 0x34800 $9
	cp c
	jr z, .asm_3480b ; 0x34803 $6
	jr .asm_34808 ; 0x34805 $1
.asm_34807
	inc hl
.asm_34808
	inc hl
	jr .asm_347e7 ; 0x34809 $dc
.asm_3480b
	xor a
	ld [$ffb3], a
	ld [$ffb4], a
	ld [$ffb5], a
	ld a, [hli]
	ld [$ffb6], a
	ld a, [$d265]
	ld [$ffb7], a
	call Multiply
	ld a, $a
	ld [$ffb7], a
	push bc
	ld b, $4
	call Divide
	pop bc
	ld a, [$ffb6]
	ld [$d265], a
	jr .asm_347e7 ; 0x3482d $b8
.asm_3482f
	pop bc
	pop de
	pop hl
	ret
; 34833


BattleCommanda3: ; 34833
	call Function0x347c8
	ld a, [$d265]
	and a
	ld a, $a
	jr nz, .asm_3484a ; 3483c $c
	call ResetDamage
	xor a
	ld [TypeModifier], a
	inc a
	ld [AttackMissed], a
	ret
.asm_3484a
	ld [$d265], a
	ret
; 3484e


Function0x3484e: ; 3484e
	push hl
	push de
	push bc
	ld a, $a
	ld [$c716], a
	ld hl, PlayerUsedMoves
	ld a, [hl]
	and a
	jr z, .asm_348b0 ; 0x3485b $53
	ld d, $4
	ld e, $0
.asm_34861
	ld a, [hli]
	and a
	jr z, .asm_3489f ; 0x34863 $3a
	push hl
	dec a
	ld hl, Moves + PlayerMovePower - PlayerMoveStruct
	call GetMoveAttr
	and a
	jr z, .asm_3489b ; 0x3486e $2b
	inc hl
	call GetMoveByte
	ld hl, EnemyMonType1
	call Function0x347d3
	ld a, [$d265]
	cp $b
	jr nc, .asm_34895 ; 0x3487f $14
	and a
	jr z, .asm_3489b ; 0x34882 $17
	cp $a
	jr nc, .asm_34891 ; 0x34886 $9
	ld a, e
	cp $1
	jr nc, .asm_3489b ; 0x3488b $e
	ld e, $1
	jr .asm_3489b ; 0x3488f $a
.asm_34891
	ld e, $2
	jr .asm_3489b ; 0x34893 $6
.asm_34895
	call Function0x34931
	pop hl
	jr .asm_348d7 ; 0x34899 $3c
.asm_3489b
	pop hl
	dec d
	jr nz, .asm_34861 ; 0x3489d $c2
.asm_3489f
	ld a, e
	cp $2
	jr z, .asm_348d7 ; 0x348a2 $33
	call Function0x34939
	ld a, e
	and a
	jr nz, .asm_348d7 ; 0x348a9 $2c
	call Function0x34939
	jr .asm_348d7 ; 0x348ae $27
.asm_348b0
	ld a, [BattleMonType1]
	ld b, a
	ld hl, EnemyMonType1
	call Function0x347d3
	ld a, [$d265]
	cp $b
	jr c, .asm_348c4 ; 0x348bf $3
	call Function0x34931
.asm_348c4
	ld a, [BattleMonType2]
	cp b
	jr z, .asm_348d7 ; 0x348c8 $d
	call Function0x347d3
	ld a, [$d265]
	cp $b
	jr c, .asm_348d7 ; 0x348d2 $3
	call Function0x34931
.asm_348d7
	call Function0x348de
	pop bc
	pop de
	pop hl
	ret
; 348de


Function0x348de: ; 348de
	ld de, EnemyMonMove1
	ld b, 5
	ld c, 0

	ld a, [$d265]
	push af

.loop
	dec b
	jr z, .exit

	ld a, [de]
	and a
	jr z, .exit

	inc de
	dec a
	ld hl, Moves + PlayerMovePower - PlayerMoveStruct
	call GetMoveAttr
	and a
	jr z, .loop

	inc hl
	call GetMoveByte
	ld hl, BattleMonType1
	call Function0x347d3
	ld a, [$d265]
	and a
	jr z, .loop

	inc c
	cp $a
	jr c, .loop

	inc c
	inc c
	inc c
	inc c
	inc c

	cp $a
	jr z, .loop

	ld c, $64
	jr .loop
.exit

	pop af
	ld [$d265], a

	ld a, c
	and a
	jr z, .doubledown ; double down
	cp $5
	jr c, Function0x34931 ; down
	cp $64
	ret c
	jr Function0x34939 ; up

.doubledown
	call Function0x34931
	
	; fallthrough
; 34931


Function0x34931: ; 34931
	ld a, [$c716]
	dec a
	ld [$c716], a
	ret
; 34939


Function0x34939: ; 34939
	ld a, [$c716]
	inc a
	ld [$c716], a
	ret
; 34941


Function0x34941: ; 34941
	xor a
	ld [$c717], a
	call Function0x349f4
	ret c

	ld a, [EnemySubStatus1]
	bit 4, a
	jr z, .asm_34986

	ld a, [$c67f]
	cp $1
	jr nz, .asm_34986

	call Function0x349f4
	call Function0x34b77
	call Function0x34b20
	call Function0x34a85

	ld a, e
	cp $2
	jr nz, .asm_34971

	ld a, [$c716]
	add $30
	ld [$c717], a
	ret

.asm_34971
	call Function0x349f4
	sla c
	sla c
	ld b, $ff

.asm_3497a
	inc b
	sla c
	jr nc, .asm_3497a

	ld a, b
	add $30
	ld [$c717], a
	ret

.asm_34986
	call Function0x3484e
	ld a, [$c716]
	cp $b
	ret nc

	ld a, [LastEnemyCounterMove]
	and a
	jr z, .asm_349d2

	call Function0x34a2a
	ld a, [$c716]
	and a
	jr z, .asm_349d2

	ld c, a
	call Function0x34aa7
	ld a, [$c716]
	cp $ff
	ret z

	ld b, a
	ld a, e
	cp $2
	jr z, .asm_349be

	call Function0x3484e
	ld a, [$c716]
	cp $a
	ret nc

	ld a, b
	add $10
	ld [$c717], a
	ret

.asm_349be
	ld c, $10
	call Function0x3484e
	ld a, [$c716]
	cp $a
	jr nc, .asm_349cc
	ld c, $20

.asm_349cc
	ld a, b
	add c
	ld [$c717], a
	ret

.asm_349d2
	call Function0x3484e
	ld a, [$c716]
	cp $a
	ret nc

	call Function0x349f4
	call Function0x34b77
	call Function0x34b20
	call Function0x34a85

	ld a, e
	cp $2
	ret nz

	ld a, [$c716]
	add $10
	ld [$c717], a
	ret
; 349f4


Function0x349f4: ; 349f4
	ld a, [OTPartyCount]
	cp 2
	jr c, .asm_34a26

	ld d, a
	ld e, 0
	ld b, $20
	ld c, 0
	ld hl, OTPartyMon1CurHP

.asm_34a05
	ld a, [CurOTMon]
	cp e
	jr z, .asm_34a16

	push bc
	ld b, [hl]
	inc hl
	ld a, [hld]
	or b
	pop bc
	jr z, .asm_34a16

	ld a, c
	or b
	ld c, a
.asm_34a16
	srl b
	push bc
	ld bc, $30
	add hl, bc
	pop bc
	inc e
	dec d
	jr nz, .asm_34a05

	ld a, c
	and a
	jr nz, .asm_34a28

.asm_34a26
	scf
	ret

.asm_34a28
	and a
	ret
; 34a2a


Function0x34a2a: ; 34a2a
	ld hl, OTPartyMon1
	ld a, [OTPartyCount]
	ld b, a
	ld c, $20
	ld d, 0
	xor a
	ld [$c716], a

.asm_34a39
	ld a, [CurOTMon]
	cp d
	push hl
	jr z, .asm_34a77

	push hl
	push bc
	ld bc, $0022
	add hl, bc
	pop bc
	ld a, [hli]
	or [hl]
	pop hl
	jr z, .asm_34a77

	ld a, [hl]
	ld [CurSpecies], a
	call GetBaseData
	ld a, [LastEnemyCounterMove]
	dec a
	ld hl, Moves + PlayerMovePower - PlayerMoveStruct
	call GetMoveAttr
	and a
	jr z, .asm_34a77

	inc hl
	call GetMoveByte
	ld hl, $d23d
	call Function0x347d3
	ld a, [$d265]
	and a
	jr nz, .asm_34a77

	ld a, [$c716]
	or c
	ld [$c716], a
.asm_34a77
	pop hl
	dec b
	ret z

	push bc
	ld bc, $30
	add hl, bc
	pop bc

	inc d
	srl c
	jr .asm_34a39
; 34a85


Function0x34a85: ; 34a85
	push bc
	ld a, [OTPartyCount]
	ld e, a
	ld hl, OTPartyMon1CurHP
	ld b, $20
	ld c, $0
.asm_34a91
	ld a, [hli]
	or [hl]
	jr z, .asm_34a98

	ld a, b
	or c
	ld c, a

.asm_34a98
	srl b
	push bc
	ld bc, $2f
	add hl, bc
	pop bc
	dec e
	jr nz, .asm_34a91

	ld a, c
	pop bc

	and c
	ld c, a

	; fallthrough
; 34aa7

Function0x34aa7: ; 34aa7

	ld a, $ff
	ld [$c716], a
	ld hl, OTPartyMon1Move1
	ld b, $20
	ld d, $0
	ld e, $0
.asm_34ab5
	ld a, b
	and c
	jr z, .asm_34b00

	push hl
	push bc
	ld b, $4
	ld c, $0
.asm_34abf
	ld a, [hli]
	and a
	push hl
	jr z, .asm_34aef

	dec a
	ld hl, Moves + PlayerMovePower - PlayerMoveStruct
	call GetMoveAttr
	and a
	jr z, .asm_34ae9

	inc hl
	call GetMoveByte
	ld hl, BattleMonType1
	call Function0x347d3
	ld a, [$d265]
	cp $a
	jr c, .asm_34ae9

	ld e, $1
	cp $b
	jr c, .asm_34ae9

	ld e, $2
	jr .asm_34aef

.asm_34ae9
	pop hl
	dec b
	jr nz, .asm_34abf

	jr .asm_34af0

.asm_34aef
	pop hl
.asm_34af0
	ld a, e
	pop bc
	pop hl
	cp $2
	jr z, .asm_34b0e

	cp $1
	jr nz, .asm_34b00

	ld a, d
	or b
	ld d, a
	jr .asm_34b00

.asm_34b00
	push bc
	ld bc, $0030
	add hl, bc
	pop bc
	srl b
	jr nc, .asm_34ab5

	ld a, d
	ld b, a
	and a
	ret z

.asm_34b0e
	push bc
	sla b
	sla b
	ld c, $ff
.asm_34b15
	inc c
	sla b
	jr nc, .asm_34b15

	ld a, c
	ld [$c716], a
	pop bc
	ret
; 34b20


Function0x34b20: ; 34b20
	push bc
	ld hl, OTPartySpecies
	ld b, $20
	ld c, $0

.asm_34b28
	ld a, [hli]
	cp $ff
	jr z, .asm_34b72

	push hl
	ld [CurSpecies], a
	call GetBaseData
	ld a, [LastEnemyCounterMove]
	and a
	jr z, .asm_34b4a

	dec a
	ld hl, Moves + PlayerMovePower - PlayerMoveStruct
	call GetMoveAttr
	and a
	jr z, .asm_34b4a

	inc hl
	call GetMoveByte
	jr .asm_34b5d

.asm_34b4a
	ld a, [BattleMonType1]
	ld hl, $d23d
	call Function0x347d3
	ld a, [$d265]
	cp $b
	jr nc, .asm_34b6d
	ld a, [BattleMonType2]

.asm_34b5d
	ld hl, $d23d
	call Function0x347d3
	ld a, [$d265]
	cp $b
	jr nc, .asm_34b6d

	ld a, b
	or c
	ld c, a

.asm_34b6d
	srl b
	pop hl
	jr .asm_34b28

.asm_34b72
	ld a, c
	pop bc
	and c
	ld c, a
	ret
; 34b77


Function0x34b77: ; 34b77
	push bc
	ld de, OTPartySpecies
	ld b, $20
	ld c, 0
	ld hl, OTPartyMon1CurHP

.asm_34b82
	ld a, [de]
	inc de
	cp $ff
	jr z, .asm_34bac

	push hl
	push bc
	ld b, [hl]
	inc hl
	ld c, [hl]
	inc hl
	inc hl
	srl c
	rl b
	srl c
	rl b
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	pop bc
	jr nc, .asm_34ba1

	ld a, b
	or c
	ld c, a

.asm_34ba1
	srl b
	pop hl
	push bc
	ld bc, $0030
	add hl, bc
	pop bc
	jr .asm_34b82

.asm_34bac
	ld a, c
	pop bc
	and c
	ld c, a
	ret
; 34bb1


TypeMatchup: ; 34bb1
INCLUDE "battle/type_matchup.asm"
; 34cfd


BattleCommand08: ; 34cfd
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
	ld [$ffb4], a
	dec hl
	ld a, [hli]
	ld [$ffb5], a
	ld a, [hl]
	ld [$ffb6], a

; Multiply by 85-100%...
.loop
	call FarBattleRNG
	rrca
	cp $d9 ; 85%
	jr c, .loop

	ld [$ffb7], a
	call Multiply

; ...divide by 100%...
	ld a, $ff ; 100%
	ld [$ffb7], a
	ld b, $4
	call Divide

; ...to get .85-1.00x damage.
	ld a, [$ffb5]
	ld hl, CurDamage
	ld [hli], a
	ld a, [$ffb6]
	ld [hl], a
	ret
; 34d32


BattleCommand09: ; 34d32
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

	call .UnleashedEnergy
	ret nz

; Perfect-accuracy moves
	ld a, BATTLE_VARS_MOVE_EFFECT
	call CleanGetBattleVarPair
	cp EFFECT_ALWAYS_HIT
	ret z

	call .StatModifiers

	ld a, [PlayerMoveAccuracy]
	ld b, a
	ld a, [hBattleTurn]
	and a
	jr z, .BrightPowder
	ld a, [EnemyMoveAccuracy]
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

	call FarBattleRNG
	cp b
	jr nc, .Miss

.Hit
	ret


.Miss
; Keep the damage value intact if we're using (Hi) Jump Kick.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call CleanGetBattleVarPair
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
	call CleanGetBattleVarPair
	cp EFFECT_DREAM_EATER
	ret nz

	ld a, BATTLE_VARS_STATUS_OPP
	call CleanGetBattleVarPair
	and SLP
	ret


.Protect
; Return nz if the opponent is protected.
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call CleanGetBattleVarPair
	bit SUBSTATUS_PROTECT, a
	ret z

	ld c, 40
	call DelayFrames

; 'protecting itself!'
	ld hl, ProtectingItselfText
	call FarBattleTextBox

	ld c, 40
	call DelayFrames

	ld a, 1
	and a
	ret


.LockOn
; Return nz if we are locked-on and aren't trying to use Earthquake,
; Fissure or Magnitude on a monster that is flying.
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarPair
	bit SUBSTATUS_LOCK_ON, [hl]
	res SUBSTATUS_LOCK_ON, [hl]
	ret z

	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call CleanGetBattleVarPair
	bit SUBSTATUS_FLYING, a
	jr z, .LockedOn

	ld a, BATTLE_VARS_MOVE_ANIM
	call CleanGetBattleVarPair

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
	call CleanGetBattleVarPair

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
	call CleanGetBattleVarPair
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret z

	bit SUBSTATUS_FLYING, a
	jr z, .DigMoves

	ld a, BATTLE_VARS_MOVE_ANIM
	call CleanGetBattleVarPair

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
	call CleanGetBattleVarPair

	cp EARTHQUAKE
	ret z
	cp FISSURE
	ret z
	cp MAGNITUDE
	ret


.ThunderRain
; Return z if the current move always hits in rain, and it is raining.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call CleanGetBattleVarPair
	cp EFFECT_THUNDER
	ret nz

	ld a, [Weather]
	cp WEATHER_RAIN
	ret


.UnleashedEnergy
; Return nz if unleashing energy from Bide.
	ld a, BATTLE_VARS_SUBSTATUS4
	call CleanGetBattleVarPair
	bit SUBSTATUS_UNLEASH, a
	ret


.StatModifiers

	ld a, [hBattleTurn]
	and a

	ld hl, PlayerMoveAccuracy
	ld a, [PlayerAccLevel]
	ld b, a
	ld a, [EnemyEvaLevel]
	ld c, a

	jr z, .asm_34e60

	ld hl, EnemyMoveAccuracy
	ld a, [EnemyAccLevel]
	ld b, a
	ld a, [PlayerEvaLevel]
	ld c, a

.asm_34e60
	cp b
	jr c, .asm_34e6b

	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call CleanGetBattleVarPair
	bit SUBSTATUS_IDENTIFIED, a
	ret nz

.asm_34e6b
	ld a, $e
	sub c
	ld c, a
	xor a
	ld [$ffb4], a
	ld [$ffb5], a
	ld a, [hl]
	ld [$ffb6], a
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
	ld [$ffb7], a
	call Multiply
	ld a, [hl]
	ld [$ffb7], a
	ld b, $4
	call Divide
	ld a, [$ffb6]
	ld b, a
	ld a, [$ffb5]
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


BattleCommand90: ; 34ecc
; effectchance

	xor a
	ld [EffectFailed], a
	call CheckSubstituteOpp
	jr nz, .failed

	push hl
	ld hl, PlayerMoveEffectChance
	ld a, [hBattleTurn]
	and a
	jr z, .asm_34ee1
	ld hl, EnemyMoveEffectChance
.asm_34ee1

	call FarBattleRNG
	cp [hl]
	pop hl
	ret c

.failed
	ld a, 1
	ld [EffectFailed], a
	and a
	ret
; 34eee


BattleCommand0a: ; 34eee

	ld a, BATTLE_VARS_SUBSTATUS4
	call CleanGetBattleVarPair
	bit SUBSTATUS_SUBSTITUTE, a
	ret z

	ld a, BATTLE_VARS_SUBSTATUS3
	call CleanGetBattleVarPair
	bit SUBSTATUS_CHARGED, a
	jr nz, .asm_34f18

	ld a, BATTLE_VARS_MOVE_EFFECT
	call CleanGetBattleVarPair
	cp EFFECT_RAZOR_WIND
	jr z, .asm_34f21
	cp EFFECT_SKY_ATTACK
	jr z, .asm_34f21
	cp EFFECT_SKULL_BASH
	jr z, .asm_34f21
	cp EFFECT_SOLARBEAM
	jr z, .asm_34f21
	cp EFFECT_FLY
	jr z, .asm_34f21

.asm_34f18
	call .Rampage
	jr z, .asm_34f21

	call Function0x34548
	ret nz

.asm_34f21
	call Function0x37ed5
	jr c, .asm_34f36

	xor a
	ld [$cfca], a
	ld [FXAnimIDHi], a
	inc a
	ld [$c689], a
	ld a, $a4
	jp Function0x37e44

.asm_34f36
	call BattleCommanda7
	jp BattleCommandaa

.Rampage
	ld a, BATTLE_VARS_MOVE_EFFECT
	call CleanGetBattleVarPair
	cp EFFECT_ROLLOUT
	jr z, .asm_34f4d
	cp EFFECT_RAMPAGE
	jr z, .asm_34f4d

	ld a, 1
	and a
	ret

.asm_34f4d
	ld a, [$c73e]
	and a
	ld a, 0
	ld [$c73e], a
	ret
; 34f57


BattleCommandab: ; 34f57
; hittarget
	call BattleCommand0a
	call BattleCommand0b
	jp BattleCommand0c
; 34f60


BattleCommand0b: ; 34f60
	ld a, [AttackMissed]
	and a
	jp nz, BattleCommandaa

	ld a, [hBattleTurn]
	and a
	ld de, PlayerRolloutCount
	ld a, 1
	jr z, .asm_34f76
	ld de, EnemyRolloutCount
	ld a, 4

.asm_34f76
	ld [$cfca], a
	ld a, BATTLE_VARS_MOVE_EFFECT
	call CleanGetBattleVarPair
	cp EFFECT_MULTI_HIT
	jr z, .asm_34fb0
	cp EFFECT_CONVERSION
	jr z, .asm_34fb0
	cp EFFECT_DOUBLE_HIT
	jr z, .asm_34fb0
	cp EFFECT_TWINEEDLE
	jr z, .asm_34fb0
	cp EFFECT_TRIPLE_KICK
	jr z, .asm_34f96
	xor a
	ld [$c689], a

.asm_34f96

	ld a, BATTLE_VARS_MOVE_ANIM
	call CleanGetBattleVarPair
	ld e, a
	ld d, 0
	call PlayFXAnimID

	ld a, BATTLE_VARS_MOVE_ANIM
	call CleanGetBattleVarPair
	cp FLY
	jr z, .asm_34fad
	cp DIG
	ret nz

.asm_34fad
; clear sprite
	jp Function0x37ec7
.asm_34fb0
	ld a, [$c689]
	and 1
	xor 1
	ld [$c689], a
	ld a, [de]
	cp $1
	push af
	ld a, BATTLE_VARS_MOVE_ANIM
	call CleanGetBattleVarPair
	ld e, a
	ld d, 0
	pop af
	jp z, PlayFXAnimID
	xor a
	ld [$cfca], a
	jp PlayFXAnimID
; 34fd1


BattleCommand92: ; 34fd1
	ld a, [AttackMissed]
	and a
	jp nz, BattleCommandaa

	xor a
	jr BattleCommand91_92
; 34fdb


BattleCommand91: ; 34fdb
	ld a, [AttackMissed]
	and a
	jp nz, BattleCommandaa

	ld a, [hBattleTurn]
	and a
	ld a, 2
	jr z, BattleCommand91_92
	ld a, 5

	; fallthrough
; 34feb


BattleCommand91_92: ; 34feb
	ld [$cfca], a
	xor a
	ld [$c689], a
	ld a, BATTLE_VARS_MOVE_ANIM
	call CleanGetBattleVarPair
	ld e, a
	ld d, 0
	jp PlayFXAnimID
; 34ffd


SwitchTurn: ; 34ffd
BattleCommand93: ; 34ffd
; switchturn

	ld a, [hBattleTurn]
	xor 1
	ld [hBattleTurn], a
	ret
; 35004


BattleCommand0c: ; 35004
	ld a, BATTLE_VARS_SUBSTATUS4
	call CleanGetBattleVarPair
	bit SUBSTATUS_SUBSTITUTE, a
	ret z

	call Function0x37ed5
	jp c, BattleCommanda6

	xor a
	ld [$cfca], a
	ld [FXAnimIDHi], a
	ld a, $2
	ld [$c689], a
	ld a, $a4
	jp Function0x37e44
; 35023


BattleCommand0d: ; 35023
; resulttext
	ld a, [AttackMissed]
	and a
	ret z

	call Function0x350e4
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarPair

	cp FLY
	jr z, .asm_3504f ; 35032 $1b
	cp DIG
	jr z, .asm_3504f ; 35036 $17

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
	call BattleCommand0c
	jp EndMoveEffect

.asm_3504f
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarPair
	res SUBSTATUS_UNDERGROUND, [hl]
	res SUBSTATUS_FLYING, [hl]
	call Function0x37ece
	jp EndMoveEffect
; 3505e


BattleCommand0e: ; 3505e
; checkfaint

	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call CleanGetBattleVarPair
	bit SUBSTATUS_ENDURE, a
	jr z, .asm_35072 ; 35065 $b
	call BattleCommand4b
	ld b, $0
	jr nc, .asm_3508b ; 3506c $1d
	ld b, $1
	jr .asm_3508b ; 35070 $19

.asm_35072
	call GetOpponentItem
	ld a, b
	cp HELD_FOCUS_BAND
	ld b, $0
	jr nz, .asm_3508b ; 3507a $f
	call FarBattleRNG
	cp c
	jr nc, .asm_3508b ; 35080 $9
	call BattleCommand4b
	ld b, $0
	jr nc, .asm_3508b ; 35087 $2
	ld b, $2
.asm_3508b
	push bc
	call .asm_50bb
	ld c, $0
	ld a, [hBattleTurn]
	and a
	jr nz, .asm_3509b
	call Function0x35d1c
	jr .asm_3509e

.asm_3509b
	call Function0x35d7e

.asm_3509e
	pop bc
	ld a, b
	and a
	ret z
	dec a
	jr nz, .asm_350ab ; 350a3 $6
	ld hl, EnduredText
	jp FarBattleTextBox

.asm_350ab
	call GetOpponentItem
	ld a, [hl]
	ld [$d265], a
	call GetItemName

	ld hl, HungOnText
	jp FarBattleTextBox

.asm_50bb
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call CleanGetBattleVarPair
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


Function0x350e4: ; 350e4
	ld hl, DoesntAffectText
	ld de, DoesntAffectText
	ld a, [TypeModifier]
	and $7f
	jr z, .asm_35110 ; 0x350ef $1f
	ld a, BATTLE_VARS_MOVE_EFFECT
	call CleanGetBattleVarPair
	cp EFFECT_FUTURE_SIGHT
	ld hl, ButItFailedText
	ld de, ItFailedText
	jr z, .asm_35110 ; 0x350fe $10
	ld hl, AttackMissedText
	ld de, AttackMissed2Text
	ld a, [CriticalHit]
	cp $ff
	jr nz, .asm_35110 ; 0x3510b $3
	ld hl, UnaffectedText
.asm_35110
	call Function0x35157
	xor a
	ld [CriticalHit], a
	ld a, BATTLE_VARS_MOVE_EFFECT
	call CleanGetBattleVarPair
	cp EFFECT_JUMP_KICK
	ret nz
	ld a, [TypeModifier]
	and $7f
	ret z
	ld hl, CurDamage
	ld a, [hli]
	ld b, [hl]
	srl a
	rr b
	srl a
	rr b
	srl a
	rr b
	ld [hl], b
	dec hl
	ld [hli], a
	or b
	jr nz, .asm_3513e ; 0x3513a $2
	inc a
	ld [hl], a
.asm_3513e
	ld hl, CrashedText
	call FarBattleTextBox
	ld a, $1
	ld [$c689], a
	call Function0x37e36
	ld c, $1
	ld a, [hBattleTurn]
	and a
	jp nz, Function0x35d1c
	jp Function0x35d7e

Function0x35157: ; 35157
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call CleanGetBattleVarPair
	bit SUBSTATUS_PROTECT, a
	jr z, .asm_35162
	ld h, d
	ld l, e
.asm_35162
	jp FarBattleTextBox
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


BattleCommand0f: ; 35175
; criticaltext
; Prints the message for critical hits or one-hit KOs.

; If there is no message to be printed, wait 20 frames.
	ld a, [CriticalHit]
	and a
	jr z, .wait

	dec a
	add a
	ld hl, .ptrs
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call FarBattleTextBox

	xor a
	ld [CriticalHit], a

.wait
	ld c, 20
	jp DelayFrames

.ptrs
	dw CriticalHitText ; 'critical hit'
	dw OneHitKOText    ; 'one-hit ko'
; 35197


BattleCommandae: ; 35197
; startloop

	ld hl, PlayerRolloutCount
	ld a, [hBattleTurn]
	and a
	jr z, .asm_351a2
	ld hl, EnemyRolloutCount

.asm_351a2
	xor a
	ld [hl], a
	ret
; 351a5


BattleCommandad: ; 351a5
; supereffectivelooptext

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarPair
	bit 2, a
	ret nz

	; fallthrough
; 351ad


BattleCommand10: ; 351ad
; supereffectivetext

	ld a, [TypeModifier]
	and $7f
	cp 10 ; 1.0
	ret z
	ld hl, SuperEffectiveText ; 'super-effective'
	jr nc, .print
	ld hl, NotVeryEffectiveText ; 'not very effective'
.print
	jp FarBattleTextBox
; 351c0


BattleCommand11: ; 351c0
; checkdestinybond

; Faint the user if it fainted an opponent using Destiny Bond.

	ld hl, EnemyMonHPHi
	ld a, [hBattleTurn]
	and a
	jr z, .asm_351cb
	ld hl, BattleMonHP

.asm_351cb
	ld a, [hli]
	or [hl]
	ret nz

	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call CleanGetBattleVarPair
	bit SUBSTATUS_DESTINY_BOND, a
	jr z, .asm_35231

	ld hl, TookDownWithItText
	call FarBattleTextBox

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
	ld [$d10a], a
	ld a, [hld]
	ld [$d1ea], a
	ld a, [hld]
	ld [$d1eb], a
	ld a, [hl]
	ld [$d1ec], a
	xor a
	ld [hld], a
	ld a, [hl]
	ld [$d1ed], a
	xor a
	ld [hl], a
	ld [$d1ee], a
	ld [$d1ef], a
	ld h, b
	ld l, c
	ld a, $b
	call Predef
	call RefreshBattleHuds

	call SwitchTurn
	xor a
	ld [$cfca], a
	ld [FXAnimIDHi], a
	inc a
	ld [$c689], a
	ld a, $c2
	call Function0x37e44
	call SwitchTurn

	jr .asm_3524d ; 3522f $1c

.asm_35231
	ld a, BATTLE_VARS_MOVE_EFFECT
	call CleanGetBattleVarPair
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
	call BattleCommand0c

.asm_3524d
	jp EndMoveEffect
; 35250


BattleCommand12: ; 35250
; buildopponentrage

	jp .start
.start
	ld a, [AttackMissed]
	and a
	ret nz

	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call CleanGetBattleVarPair
	bit SUBSTATUS_RAGE, a
	ret z

	ld de, $c72c
	ld a, [hBattleTurn]
	and a
	jr z, .asm_3526b
	ld de, $c72b
.asm_3526b
	ld a, [de]
	inc a
	ret z
	ld [de], a

	call SwitchTurn
	ld hl, RageBuildingText
	call FarBattleTextBox
	jp SwitchTurn
; 3527b


BattleCommanda2: ; 3527b
; ragedamage

	ld a, [CurDamage]
	ld h, a
	ld b, a
	ld a, [CurDamage + 1]
	ld l, a
	ld c, a
	ld a, [hBattleTurn]
	and a
	ld a, [$c72b]
	jr z, .asm_35290 ; 3528b $3
	ld a, [$c72c]
.asm_35290
	and a
	jr z, .asm_3529a ; 35291 $7
	dec a
	add hl, bc
	jr nc, .asm_35290 ; 35295 $f9
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
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret
; 352b1


DittoMetalPowder: ; 352b1
	ld a, PartyMon1Species - PartyMon1
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


BattleCommand06: ; 352dc
; damagestats

	ld a, [hBattleTurn]
	and a
	jp nz, EnemyAttackDamage

	; fallthrough
; 352e2


PlayerAttackDamage: ; 352e2
; Return move power d, player level e, enemy defense c and player attack b.

	call ResetDamage

	ld hl, PlayerMovePower
	ld a, [hli]
	and a
	ld d, a
	ret z

	ld a, [hl]
	cp FIRE
	jr nc, .special


; Physical
	ld hl, EnemyMonDef
	ld a, [hli]
	ld b, a
	ld c, [hl]

; Reflect
	ld a, [EnemyScreens]
	bit 4, a
	jr z, .physicalcrit
	sla c
	rl b

.physicalcrit
	ld hl, BattleMonAtk
	call GetDamageStatsCritical
	jr c, .thickclub

	ld hl, $c6c3
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

; Light Screen
	ld a, [EnemyScreens]
	bit 3, a
	jr z, .specialcrit
	sla c
	rl b

.specialcrit
	ld hl, BattleMonSpclAtk
	call GetDamageStatsCritical
	jr c, .lightball

	ld hl, $c6c9
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, $c6bc

.lightball
; Note: Returns player special attack at hl in hl.
	call LightBallBoost
	jr .done

.thickclub
; Note: Returns player attack at hl in hl.
	call ThickClubBoost

.done
	call Function0x3534d

	ld a, [BattleMonLevel]
	ld e, a
	call DittoMetalPowder

	ld a, 1
	and a
	ret
; 3534d


Function0x3534d: ; 3534d
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
	ld a, [InLinkBattle]
	cp 3
	jr z, .done

	ld a, h
	or b
	jr nz, Function0x3534d

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
	ld a, [PlayerMoveType]
	cp FIRE
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
	ld a, [EnemyMoveType]
	cp FIRE
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
	ld a, PartyMon1Species - PartyMon1
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
	ld hl, EnemyMovePower
	ld a, [hli] ; hl = EnemyMoveType
	ld d, a
	and a
	ret z

	ld a, [hl]
	cp FIRE
	jr nc, .Special


; Physical
	ld hl, BattleMonDef
	ld a, [hli]
	ld b, a
	ld c, [hl]

; Reflect
	ld a, [PlayerScreens]
	bit 4, a
	jr z, .physicalcrit
	sla c
	rl b

.physicalcrit
	ld hl, EnemyMonAtk
	call GetDamageStatsCritical
	jr c, .thickclub

	ld hl, $c6b8
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

; Light Screen
	ld a, [PlayerScreens]
	bit 3, a
	jr z, .specialcrit
	sla c
	rl b

.specialcrit
	ld hl, EnemyMonSpclAtk
	call GetDamageStatsCritical
	jr c, .lightball
	ld hl, $c6be
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, $c6c7

.lightball
	call LightBallBoost
	jr .done

.thickclub
	call ThickClubBoost

.done
	call Function0x3534d

	ld a, [EnemyMonLevel]
	ld e, a
	call DittoMetalPowder

	ld a, 1
	and a
	ret
; 35461


BattleCommanda1: ; 35461
; beatup

	call ResetDamage
	ld a, [hBattleTurn]
	and a
	jp nz, .asm_354ef
	ld a, [PlayerSubStatus3]
	bit 2, a
	jr nz, .asm_35482 ; 3546f $11
	ld c, $14
	call DelayFrames
	xor a
	ld [PlayerRolloutCount], a
	ld [DefaultFlypoint], a
	ld [$c72d], a
	jr .asm_3548d ; 35480 $b
.asm_35482
	ld a, [PlayerRolloutCount]
	ld b, a
	ld a, [PartyCount]
	sub b
	ld [DefaultFlypoint], a
.asm_3548d
	ld a, [DefaultFlypoint]
	ld hl, PartyMon1Nickname
	call $38a2
	ld a, $22
	call Function0x355bd
	ld a, [hli]
	or [hl]
	jp z, Function0x355b0
	ld a, [DefaultFlypoint]
	ld c, a
	ld a, [CurBattleMon]
	cp [hl]
	ld hl, BattleMonStatus
	jr z, .asm_354b2 ; 354ab $5
	ld a, $20
	call Function0x355bd
.asm_354b2
	ld a, [hl]
	and a
	jp nz, Function0x355b0
	ld a, $1
	ld [$c72d], a
	ld hl, BeatUpAttackText
	call FarBattleTextBox
	ld a, [EnemyMonSpecies]
	ld [CurSpecies], a
	call $3856
	ld a, [$d239]
	ld c, a
	push bc
	ld a, $0
	call Function0x355bd
	ld a, [hl]
	ld [CurSpecies], a
	call $3856
	ld a, [$d238]
	pop bc
	ld b, a
	push bc
	ld a, $1f
	call Function0x355bd
	ld a, [hl]
	ld e, a
	pop bc
	ld a, [PlayerMovePower]
	ld d, a
	ret

.asm_354ef
	ld a, [EnemySubStatus3]
	bit 2, a
	jr nz, .asm_35502

	xor a
	ld [EnemyRolloutCount], a
	ld [DefaultFlypoint], a
	ld [$c72d], a
	jr .asm_3550d

.asm_35502
	ld a, [EnemyRolloutCount]
	ld b, a
	ld a, [OTPartyCount]
	sub b
	ld [DefaultFlypoint], a
.asm_3550d
	ld a, [IsInBattle]
	dec a
	jr z, .asm_3556b

	ld a, [InLinkBattle]
	and a
	jr nz, .asm_35532

	ld a, [$cfc0]
	and a
	jr nz, .asm_35532

	ld a, [DefaultFlypoint]
	ld c, a
	ld b, $0
	ld hl, OTPartySpecies
	add hl, bc
	ld a, [hl]
	ld [$d265], a
	call $343b
	jr .asm_35544

.asm_35532
	ld a, [DefaultFlypoint]
	ld hl, OTPartyMon1Nickname
	ld bc, $000b
	call AddNTimes
	ld de, StringBuffer1
	call CopyBytes
.asm_35544
	ld a, $22
	call Function0x355bd
	ld a, [hli]
	or [hl]
	jp z, Function0x355b0
	ld a, [DefaultFlypoint]
	ld b, a
	ld a, [CurOTMon]
	cp b
	ld hl, EnemyMonStatus
	jr z, .asm_35560

	ld a, $20
	call Function0x355bd
.asm_35560
	ld a, [hl]
	and a
	jr nz, Function0x355b0

	ld a, $1
	ld [$c72d], a
	jr .asm_3557d

.asm_3556b
	ld a, [EnemyMonSpecies]
	ld [$d265], a
	call $343b
	ld hl, BeatUpAttackText
	call FarBattleTextBox
	jp EnemyAttackDamage
.asm_3557d
	ld hl, BeatUpAttackText
	call FarBattleTextBox
	ld a, [BattleMonSpecies]
	ld [CurSpecies], a
	call GetBaseData
	ld a, [$d239]
	ld c, a
	push bc
	ld a, $0
	call Function0x355bd
	ld a, [hl]
	ld [CurSpecies], a
	call GetBaseData
	ld a, [$d238]
	pop bc
	ld b, a
	push bc
	ld a, $1f
	call Function0x355bd
	ld a, [hl]
	ld e, a
	pop bc
	ld a, [EnemyMovePower]
	ld d, a
	ret
; 355b0


Function0x355b0: ; 355b0
	ld b, $12 ; buildopponentrage
	jp SkipToBattleCommand
; 355b5


BattleCommanda8: ; 355b5
	ld a, [$c72d]
	and a
	ret nz
	jp PrintButItFailed
; 355bd


Function0x355bd: ; 355bd
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
; 355d5


BattleCommanda9: ; 355d5
; clearmissdamage
	ld a, [AttackMissed]
	and a
	ret z
	jp ResetDamage
; 355dd


Function0x355dd: ; 355dd
	call ResetDamage
	ld a, [hBattleTurn]
	and a
	ld hl, BattleMonDef
	ld de, PlayerScreens
	ld a, [BattleMonLevel]
	jr z, .asm_355f7

	ld hl, EnemyMonDef
	ld de, EnemyScreens
	ld a, [EnemyMonLevel]
.asm_355f7
	push af
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld a, [de]
	bit 4, a
	jr z, .asm_35604

	sla c
	rl b
.asm_35604
	dec hl
	dec hl
	dec hl
	ld a, [hli]
	ld l, [hl]
	ld h, a
	call Function0x3534d
	ld d, $28
	pop af
	ld e, a
	ret
; 35612


BattleCommand62: ; 35612
; damagecalc

; Return a damage value for move power d, player level e, enemy defense c and player attack b.

; Return 1 if successful, else 0.

	ld a, BATTLE_VARS_MOVE_EFFECT
	call CleanGetBattleVarPair

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
	ld [hli], a
	ld [hli], a
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
	inc [hl]
	inc [hl]

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
	call CleanGetBattleVarPair
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
	ld a, [$ffb6]
	add b
	ld [$ffb6], a
	jr nc, .asm_356a5

	ld a, [$ffb5]
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


BattleCommand3f: ; 35726
; constantdamage

	ld hl, BattleMonLevel
	ld a, [hBattleTurn]
	and a
	jr z, .asm_35731
	ld hl, EnemyMonLevel

.asm_35731
	ld a, BATTLE_VARS_MOVE_EFFECT
	call CleanGetBattleVarPair
	cp EFFECT_LEVEL_DAMAGE
	ld b, [hl]
	ld a, 0
	jr z, .asm_3578c

	ld a, BATTLE_VARS_MOVE_EFFECT
	call CleanGetBattleVarPair
	cp EFFECT_PSYWAVE
	jr z, .asm_35758

	cp EFFECT_SUPER_FANG
	jr z, .asm_3576b

	cp EFFECT_REVERSAL
	jr z, .asm_35792

	ld a, BATTLE_VARS_MOVE_POWER
	call CleanGetBattleVarPair
	ld b, a
	ld a, $0
	jr .asm_3578c

.asm_35758
	ld a, b
	srl a
	add b
	ld b, a
.asm_3575d
	call FarBattleRNG
	and a
	jr z, .asm_3575d ; 35761 $fa
	cp b
	jr nc, .asm_3575d ; 35764 $f7
	ld b, a
	ld a, $0
	jr .asm_3578c ; 35769 $21
.asm_3576b
	ld hl, EnemyMonHPHi
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
	ld hl, EnemyMonHPHi
.asm_3579d
	xor a
	ld [$ffb3], a
	ld [$ffb4], a
	ld a, [hli]
	ld [$ffb5], a
	ld a, [hli]
	ld [$ffb6], a
	ld a, $30
	ld [$ffb7], a
	call Multiply
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld [$ffb7], a
	ld a, b
	and a
	jr z, .asm_357d6

	ld a, [$ffb7]
	srl b
	rr a
	srl b
	rr a
	ld [$ffb7], a
	ld a, [$ffb5]
	ld b, a
	srl b
	ld a, [$ffb6]
	rr a
	srl b
	rr a
	ld [$ffb6], a
	ld a, b
	ld [$ffb5], a

.asm_357d6
	ld b, $4
	call Divide
	ld a, [$ffb6]
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
	jr nz, .asm_357f8

	ld hl, PlayerMovePower
	ld [hl], a
	push hl
	call PlayerAttackDamage
	jr .asm_35800

.asm_357f8
	ld hl, EnemyMovePower
	ld [hl], a
	push hl
	call EnemyAttackDamage

.asm_35800
	call BattleCommand62
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


BattleCommand40: ; 35813
; counter

	ld a, $1
	ld [AttackMissed], a
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call CleanGetBattleVarPair
	and a
	ret z
	ld b, a

	ld hl, $45ec
	ld a, $f
	rst FarCall

	ld a, b
	cp $59
	ret z
	call BattleCommanda3
	ld a, [$d265]
	and a
	ret z
	call Function0x36abf
	ret z
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call CleanGetBattleVarPair
	dec a
	ld de, StringBuffer1
	call GetMoveData
	ld a, [$d075]
	and a
	ret z
	ld a, [$d076]
	cp $14
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
	jr nc, .asm_3585f ; 35859 $4
	ld a, $ff
	ld [hli], a
	ld [hl], a
.asm_3585f
	xor a
	ld [AttackMissed], a
	ret
; 35864


BattleCommand41: ; 35864
; encore

	ld hl, EnemyMonMoves
	ld de, EnemyEncoreCount
	ld a, [hBattleTurn]
	and a
	jr z, .asm_35875 ; 3586d $6
	ld hl, BattleMonMoves
	ld de, PlayerEncoreCount
.asm_35875
	ld a, BATTLE_VARS_LAST_MOVE_OPP
	call CleanGetBattleVarPair
	and a
	jp z, Function0x35923
	cp STRUGGLE
	jp z, Function0x35923
	cp ENCORE
	jp z, Function0x35923
	cp MIRROR_MOVE
	jp z, Function0x35923
	ld b, a

.asm_3588e
	ld a, [hli]
	cp b
	jr nz, .asm_3588e

	ld bc, $0005
	add hl, bc
	ld a, [hl]
	and $3f
	jp z, Function0x35923
	ld a, [AttackMissed]
	and a
	jp nz, Function0x35923
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarPair
	bit 4, [hl]
	jp nz, Function0x35923
	set 4, [hl]
	call FarBattleRNG
	and $3
	inc a
	inc a
	inc a
	ld [de], a
	call Function0x36abf
	jr nz, .asm_3591a
	ld a, [hBattleTurn]
	and a
	jr z, .asm_358ef
	push hl
	ld a, [LastPlayerMove]
	ld b, a
	ld c, $0
	ld hl, BattleMonMoves
.asm_358cc
	ld a, [hli]
	cp b
	jr z, .asm_358dd
	inc c
	ld a, c
	cp $4
	jr c, .asm_358cc
	pop hl
	res 4, [hl]
	xor a
	ld [de], a
	jr Function0x35923
.asm_358dd
	pop hl
	ld a, c
	ld [CurMoveNum], a
	ld a, b
	ld [CurPlayerMove], a
	dec a
	ld de, PlayerMoveStruct
	call GetMoveData
	jr .asm_3591a
.asm_358ef
	push hl
	ld a, [LastEnemyMove]
	ld b, a
	ld c, $0
	ld hl, EnemyMonMoves
.asm_358f9
	ld a, [hli]
	cp b
	jr z, .asm_3590a
	inc c
	ld a, c
	cp $4
	jr c, .asm_358f9
	pop hl
	res 4, [hl]
	xor a
	ld [de], a
	jr Function0x35923
.asm_3590a
	pop hl
	ld a, c
	ld [CurEnemyMoveNum], a
	ld a, b
	ld [CurEnemyMove], a
	dec a
	ld de, EnemyMoveStruct
	call GetMoveData
.asm_3591a
	call Function0x37e01

	ld hl, GotAnEncoreText
	jp FarBattleTextBox
; 35923


Function0x35923: ; 35923
	jp PrintDidntAffect2
; 35926


BattleCommand42: ; 35926
; painsplit

	ld a, [AttackMissed]
	and a
	jp nz, Function0x359cd
	call CheckSubstituteOpp
	jp nz, Function0x359cd
	call Function0x37e01
	ld hl, $c63f
	ld de, EnemyMonMaxHPLo
	call .asm_3597d
	ld a, $1
	ld [$d10a], a
	ld hl, $c55e
	ld a, $b
	call Predef
	ld hl, EnemyMonHPHi
	ld a, [hli]
	ld [$d1ed], a
	ld a, [hli]
	ld [$d1ec], a
	ld a, [hli]
	ld [$d1eb], a
	ld a, [hl]
	ld [$d1ea], a
	call Function0x359ac
	xor a
	ld [$d10a], a
	call ResetDamage
	ld hl, $c4ca
	ld a, $b
	call Predef
	ld a, $5e
	ld hl, $4000
	rst FarCall

	ld hl, SharedPainText
	jp FarBattleTextBox

.asm_3597d
	ld a, [hld]
	ld [$d1ea], a
	ld a, [hld]
	ld [$d1eb], a
	ld a, [hld]
	ld b, a
	ld [$d1ec], a
	ld a, [hl]
	ld [$d1ed], a
	dec de
	dec de
	ld a, [de]
	dec de
	add b
	ld [$d257], a
	ld b, [hl]
	ld a, [de]
	adc b
	srl a
	ld [CurDamage], a
	ld a, [$d257]
	rr a
	ld [$d257], a
	inc hl
	inc hl
	inc hl
	inc de
	inc de
	inc de

	; fallthrough
; 359ac


Function0x359ac: ; 359ac
	ld c, [hl]
	dec hl
	ld a, [$d257]
	sub c
	ld b, [hl]
	dec hl
	ld a, [CurDamage]
	sbc b
	jr nc, .asm_359c2

	ld a, [CurDamage]
	ld b, a
	ld a, [$d257]
	ld c, a
.asm_359c2
	ld a, c
	ld [hld], a
	ld [$d1ee], a
	ld a, b
	ld [hli], a
	ld [$d1ef], a
	ret
; 359cd

Function0x359cd: ; 359cd
	jp PrintDidntAffect2
; 359d0


BattleCommand43: ; 359d0
; snore
	ld a, BATTLE_VARS_STATUS
	call CleanGetBattleVarPair
	and SLP
	ret nz
	call ResetDamage
	ld a, $1
	ld [AttackMissed], a
	call Function0x37354
	jp EndMoveEffect
; 359e6


BattleCommand44: ; 359e6
; conversion2

	ld a, [AttackMissed]
	and a
	jr nz, .asm_35a50 ; 359ea $64
	ld hl, BattleMonType1
	ld a, [hBattleTurn]
	and a
	jr z, .asm_359f7 ; 359f2 $3
	ld hl, EnemyMonType1
.asm_359f7
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call CleanGetBattleVarPair
	and a
	jr z, .asm_35a50 ; 359fd $51
	push hl
	dec a
	ld hl, Moves + PlayerMoveType - PlayerMoveStruct
	call GetMoveAttr
	ld d, a
	pop hl
	cp CURSE_T
	jr z, .asm_35a50 ; 35a0b $43
	call Function0x37e01

	call SwitchTurn
.asm_35a13
	call FarBattleRNG
	and $1f
	cp $a
	jr c, .asm_35a24 ; 35a1a $8
	cp $14
	jr c, .asm_35a13 ; 35a1e $f3
	cp $1c
	jr nc, .asm_35a13 ; 35a22 $ef
.asm_35a24
	ld [hli], a
	ld [hld], a
	push hl
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarPair
	push af
	push hl
	ld a, d
	ld [hl], a
	call Function0x347c8
	pop hl
	pop af
	ld [hl], a
	pop hl
	ld a, [$d265]
	cp $a
	jr nc, .asm_35a13 ; 35a3c $d5
	call SwitchTurn

	ld a, [hl]
	ld [$d265], a
	ld a, $29
	call Predef
	ld hl, $5452
	jp FarBattleTextBox
.asm_35a50
	jp Function0x37354
; 35a53


BattleCommand45: ; 35a53
; lockon

	call CheckSubstituteOpp
	jr nz, .asm_35a6e
	ld a, [AttackMissed]
	and a
	jr nz, .asm_35a6e
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarPair
	set SUBSTATUS_LOCK_ON, [hl]
	call Function0x37e01

	ld hl, TookAimText
	jp FarBattleTextBox

.asm_35a6e
	call Function0x37e77
	jp PrintDidntAffect
; 35a74


BattleCommand46: ; 35a74
; sketch

	call Function0x372d8
	ld a, [InLinkBattle]
	and a
	jr z, .asm_35a83 ; 35a7b $6
	call Function0x37e77
	jp PrintNothingHappened
.asm_35a83
	call CheckSubstituteOpp
	jp nz, .asm_35b10
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarPair
	bit 3, [hl]
	jp nz, .asm_35b10
	ld a, $2
	call UserPartyAttr
	ld d, h
	ld e, l
	ld hl, BattleMonMoves
	ld a, [hBattleTurn]
	and a
	jr z, .asm_35aa5 ; 35aa0 $3
	ld hl, EnemyMonMoves
.asm_35aa5
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call CleanGetBattleVarPair
	ld [$d265], a
	ld b, a
	and a
	jr z, .asm_35b10 ; 35aaf $5f
	cp STRUGGLE
	jr z, .asm_35b10 ; 35ab3 $5b
	ld c, $4
.asm_35ab7
	ld a, [hli]
	cp b
	jr z, .asm_35b10 ; 35ab9 $55
	dec c
	jr nz, .asm_35ab7 ; 35abc $f9
	dec hl
	ld c, $4
.asm_35ac1
	dec c
	ld a, [hld]
	cp SKETCH
	jr nz, .asm_35ac1 ; 35ac5 $fa
	inc hl
	ld a, b
	ld [hl], a
	push bc
	push hl
	dec a
	ld hl, Moves + PlayerMovePP - PlayerMoveStruct
	call GetMoveAttr
	pop hl
	ld bc, $0006
	add hl, bc
	ld [hl], a
	pop bc
	ld a, [hBattleTurn]
	and a
	jr z, .asm_35af6 ; 35add $17
	ld a, [IsInBattle]
	dec a
	jr nz, .asm_35af6 ; 35ae3 $11
	ld a, [hl]
	push bc
	ld hl, $c739
	ld b, $0
	add hl, bc
	ld [hl], a
	ld hl, $c735
	add hl, bc
	pop bc
	ld [hl], b
	jr .asm_35b04 ; 35af4 $e
.asm_35af6
	ld a, [hl]
	push af
	ld l, c
	ld h, $0
	add hl, de
	ld a, b
	ld [hl], a
	pop af
	ld de, $0015
	add hl, de
	ld [hl], a
.asm_35b04
	call GetMoveName
	call Function0x37e01

	ld hl, SketchedText
	jp FarBattleTextBox

.asm_35b10
	call Function0x37e77
	jp PrintDidntAffect
; 35b16


BattleCommand47: ; 35b16
; defrostopponent

; If the opponent isn't frozen, raise Attack one stage.
; If the opponent is frozen, thaw them and raise Accuracy two stages.

	call Function0x37e01

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarPair
	call Defrost

; Sharply raise accuracy
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVarPair
	ld a, [hl]
	push hl
	push af

	ld a, $a ; meditate, sharpen
	ld [hl], a
	call BattleCommand1c

	pop af
	pop hl
	ld [hl], a
	ret
; 35b33


BattleCommand48: ; 35b33
; sleeptalk

	call Function0x372d8
	ld a, [AttackMissed]
	and a
	jr nz, .asm_35ba3 ; 35b3a $67
	ld a, [hBattleTurn]
	and a
	ld hl, BattleMonMove2
	ld a, [DisabledMove]
	ld d, a
	jr z, .asm_35b4f ; 35b46 $7
	ld hl, EnemyMonMove2
	ld a, [EnemyDisabledMove]
	ld d, a
.asm_35b4f
	ld a, BATTLE_VARS_STATUS
	call CleanGetBattleVarPair
	and $7
	jr z, .asm_35ba3 ; 35b56 $4b
	ld a, [hl]
	and a
	jr z, .asm_35ba3 ; 35b5a $47
	call .asm_35ba9
	jr c, .asm_35ba3 ; 35b5f $42
	dec hl
.asm_35b62
	push hl
	call FarBattleRNG
	and $3
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	pop hl
	and a
	jr z, .asm_35b62 ; 35b6f $f1
	ld e, a
	ld a, BATTLE_VARS_MOVE_ANIM
	call CleanGetBattleVarPair
	cp e
	jr z, .asm_35b62 ; 35b78 $e8
	ld a, e
	cp d
	jr z, .asm_35b62 ; 35b7c $e4
	call .asm_35bdf
	jr z, .asm_35b62 ; 35b81 $df
	ld a, BATTLE_VARS_MOVE
	call GetBattleVarPair
	ld a, e
	ld [hl], a
	call Function0x34548
	jr nz, .asm_35b9a ; 35b8d $b
	ld a, [$c689]
	push af
	call BattleCommand0a
	pop af
	ld [$c689], a
.asm_35b9a
	call Function0x37e36
	call UpdateMoveData
	jp ResetTurn
.asm_35ba3
	call Function0x37e77
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
	ld a, $10
	call CleanGetBattleVarPair
	ld c, a
	dec hl
	ld d, $4
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
	ld hl, $45ec
	ld a, $f
	rst $8
	ld a, b

	pop bc
	pop de
	pop hl

	cp $91
	ret z
	cp $27
	ret z
	cp $4b
	ret z
	cp $97
	ret z
	cp $9b
	ret z
	cp $1a
	ret
; 35bff


BattleCommand49: ; 35bff
; destinybond

	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarPair
	set 6, [hl]
	call Function0x37e01
	ld hl, DestinyBondEffectText
	jp FarBattleTextBox
; 35c0f


BattleCommand4a: ; 35c0f
; spite

	ld a, [AttackMissed]
	and a
	jp nz, .asm_35c91
	ld bc, $0030
	ld hl, EnemyMonMoves
	ld a, [hBattleTurn]
	and a
	jr z, .asm_35c24 ; 35c1f $3
	ld hl, BattleMonMoves
.asm_35c24
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call CleanGetBattleVarPair
	and a
	jr z, .asm_35c91 ; 35c2a $65
	cp $a5
	jr z, .asm_35c91 ; 35c2e $61
	ld b, a
	ld c, $ff
.asm_35c33
	inc c
	ld a, [hli]
	cp b
	jr nz, .asm_35c33 ; 35c36 $fb
	ld [$d265], a
	dec hl
	ld b, $0
	push bc
	ld c, $6
	add hl, bc
	pop bc
	ld a, [hl]
	and $3f
	jr z, .asm_35c91 ; 35c46 $49
	push bc
	call GetMoveName
	call FarBattleRNG
	and $3
	inc a
	inc a
	ld b, a
	ld a, [hl]
	and $3f
	cp b
	jr nc, .asm_35c5b ; 35c58 $1
	ld b, a
.asm_35c5b
	ld a, [hl]
	sub b
	ld [hl], a
	push af
	ld a, $17
	call OpponentPartyAttr
	ld d, b
	pop af
	pop bc
	add hl, bc
	ld e, a
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call CleanGetBattleVarPair
	bit 3, a
	jr nz, .asm_35c82 ; 35c70 $10
	ld a, [hBattleTurn]
	and a
	jr nz, .asm_35c81 ; 35c75 $a
	ld a, [IsInBattle]
	dec a
	jr nz, .asm_35c81 ; 35c7b $4
	ld hl, $c739
	add hl, bc
.asm_35c81
	ld [hl], e
.asm_35c82
	push de
	call Function0x37e01
	pop de
	ld a, d
	ld [$d265], a
	ld hl, SpiteEffectText
	jp FarBattleTextBox
.asm_35c91
	jp PrintDidntAffect2
; 35c94


BattleCommand4b: ; 35c94
; falseswipe

	ld hl, EnemyMonHPHi
	ld a, [hBattleTurn]
	and a
	jr z, .asm_35c9f ; 35c9a $3
	ld hl, BattleMonHP
.asm_35c9f
	ld de, CurDamage
	ld c, $2
	push hl
	push de
	call StringCmp
	pop de
	pop hl
	jr c, .asm_35cc7 ; 35cab $1a
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	dec a
	ld [de], a
	inc a
	jr nz, .asm_35cba ; 35cb4 $4
	dec de
	ld a, [de]
	dec a
	ld [de], a
.asm_35cba
	ld a, [CriticalHit]
	cp $2
	jr nz, .asm_35cc5 ; 35cbf $4
	xor a
	ld [CriticalHit], a
.asm_35cc5
	scf
	ret
.asm_35cc7
	and a
	ret
; 35cc9


BattleCommand4c: ; 35cc9
; healbell

	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarPair
	res 0, [hl]
	ld de, PartyMon1Status
	ld a, [hBattleTurn]
	and a
	jr z, .asm_35cdb ; 35cd6 $3
	ld de, OTPartyMon1Status
.asm_35cdb
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarPair
	xor a
	ld [hl], a
	ld h, d
	ld l, e
	ld bc, $30
	ld d, $6
.asm_35ce9
	ld [hl], a
	add hl, bc
	dec d
	jr nz, .asm_35ce9
	call Function0x37e01

	ld hl, BellChimedText
	call FarBattleTextBox

	ld a, [hBattleTurn]
	and a
	jp z, Function0x365d7
	jp Function0x365fd
; 35d00


FarPlayBattleAnimation: ; 35d00
; play animation de

; battle animations disabled?
	ld a, BATTLE_VARS_SUBSTATUS3
	call CleanGetBattleVarPair
	and $60 ; bit 6 | 5
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

	ld hl, $40d6
	ld a, $33
	rst FarCall ; callab SafePlayBattleAnimation

	ret
; 35d1c


Function0x35d1c: ; 35d1c
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
	bit 4, a
	jp nz, Function0x35de0
.asm_35d31
	ld a, [hld]
	ld b, a
	ld a, [EnemyMonHPLo]
	ld [$d1ec], a
	sub b
	ld [EnemyMonHPLo], a
	ld a, [hl]
	ld b, a
	ld a, [EnemyMonHPHi]
	ld [$d1ed], a
	sbc b
	ld [EnemyMonHPHi], a
	jr nc, .asm_35d59

	ld a, [$d1ed]
	ld [hli], a
	ld a, [$d1ec]
	ld [hl], a
	xor a
	ld hl, EnemyMonHPHi
	ld [hli], a
	ld [hl], a
.asm_35d59
	ld hl, EnemyMonMaxHPHi
	ld a, [hli]
	ld [$d1eb], a
	ld a, [hl]
	ld [$d1ea], a
	ld hl, EnemyMonHPHi
	ld a, [hli]
	ld [$d1ef], a
	ld a, [hl]
	ld [$d1ee], a
	ld hl, $c4ca
	xor a
	ld [$d10a], a
	ld a, $b
	call Predef
.asm_35d7b
	jp RefreshBattleHuds
; 35d7e


Function0x35d7e: ; 35d7e
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
	bit 4, a
	jp nz, Function0x35de0
.asm_35d93
	ld a, [hld]
	ld b, a
	ld a, [$c63d]
	ld [$d1ec], a
	sub b
	ld [$c63d], a
	ld [$d1ee], a
	ld b, [hl]
	ld a, [BattleMonHP]
	ld [$d1ed], a
	sbc b
	ld [BattleMonHP], a
	ld [$d1ef], a
	jr nc, .asm_35dc5

	ld a, [$d1ed]
	ld [hli], a
	ld a, [$d1ec]
	ld [hl], a
	xor a
	ld hl, BattleMonHP
	ld [hli], a
	ld [hl], a
	ld hl, $d1ee
	ld [hli], a
	ld [hl], a
.asm_35dc5
	ld hl, BattleMonMaxHP
	ld a, [hli]
	ld [$d1eb], a
	ld a, [hl]
	ld [$d1ea], a
	ld hl, $c55e
	ld a, $1
	ld [$d10a], a
	ld a, $b
	call Predef
.asm_35ddd
	jp RefreshBattleHuds
; 35de0


Function0x35de0: ; 35de0

	ld hl, SubTookDamageText
	call FarBattleTextBox

	ld de, $c6e0
	ld a, [hBattleTurn]
	and a
	jr z, .asm_35df1

	ld de, $c6df
.asm_35df1
	ld hl, CurDamage
	ld a, [hli]
	and a
	jr nz, .asm_35dff

	ld a, [de]
	sub [hl]
	ld [de], a
	jr z, .asm_35dff

	jr nc, .asm_35e3d

.asm_35dff
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVarPair
	res 4, [hl]

	ld hl, SubFadedText
	call FarBattleTextBox

	call SwitchTurn
	call BattleCommanda7
	ld a, BATTLE_VARS_SUBSTATUS3
	call CleanGetBattleVarPair
	and $60 ; fly | dig
	call z, Function0x37ec7
	call SwitchTurn

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVarPair
	cp EFFECT_MULTI_HIT
	jr z, .asm_35e3a
	cp EFFECT_DOUBLE_HIT
	jr z, .asm_35e3a
	cp EFFECT_TWINEEDLE
	jr z, .asm_35e3a
	cp EFFECT_TRIPLE_KICK
	jr z, .asm_35e3a
	cp EFFECT_BEAT_UP
	jr z, .asm_35e3a

	xor a
	ld [hl], a
.asm_35e3a
	call RefreshBattleHuds
.asm_35e3d
	jp ResetDamage
; 35e40


UpdateMoveData: ; 35e40

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarPair
	ld d, h
	ld e, l

	ld a, BATTLE_VARS_MOVE
	call CleanGetBattleVarPair
	ld [$cf60], a ; not CurSpecies
	ld [$d265], a

	dec a
	call GetMoveData
	call GetMoveName
	jp CopyName1
; 35e5c


BattleCommand14: ; 35e5c
; sleeptarget

	call GetOpponentItem
	ld a, b
	cp $17
	jr nz, .asm_35e70 ; 35e62 $c
	ld a, [hl]
	ld [$d265], a
	call GetItemName
	ld hl, ProtectedByText
	jr .asm_35ec6

.asm_35e70
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarPair
	ld d, h
	ld e, l
	ld a, [de]
	and 7
	ld hl, AlreadyAsleepText
	jr nz, .asm_35ec6

	ld a, [AttackMissed]
	and a
	jp nz, PrintDidntAffect2

	ld hl, DidntAffect1Text
	call Function0x35ece
	jr c, .asm_35ec6

	ld a, [de]
	and a
	jr nz, .asm_35ec6

	call CheckSubstituteOpp
	jr nz, .asm_35ec6

	call Function0x37e01
	ld b, $7
	ld a, [$cfc0]
	and a
	jr z, .asm_35ea4
	ld b, $3

.asm_35ea4
	call FarBattleRNG
	and b
	jr z, .asm_35ea4
	cp 7
	jr z, .asm_35ea4
	inc a
	ld [de], a
	call UpdateOpponentInParty
	call RefreshBattleHuds

	ld hl, FellAsleepText
	call FarBattleTextBox

	ld a, $f
	ld hl, $5de9
	rst FarCall

	jp z, Function0x34216
	ret

.asm_35ec6
	push hl
	call Function0x37e77
	pop hl
	jp FarBattleTextBox
; 35ece


Function0x35ece: ; 35ece
; Enemy turn
	ld a, [hBattleTurn]
	and a
	jr z, .asm_35eec

; Not in link battle
	ld a, [InLinkBattle]
	and a
	jr nz, .asm_35eec


	ld a, [$cfc0]
	and a
	jr nz, .asm_35eec

; Not locked-on by the enemy
	ld a, [PlayerSubStatus5]
	bit 5, a
	jr nz, .asm_35eec

	call FarBattleRNG
	cp $40
	ret c

.asm_35eec
	xor a
	ret
; 35eee


BattleCommand13: ; 35eee
; poisontarget

	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarPair
	and a
	ret nz
	ld a, [TypeModifier]
	and $7f
	ret z
	call Function0x35fe1
	ret z
	call GetOpponentItem
	ld a, b
	cp $14
	ret z
	ld a, [EffectFailed]
	and a
	ret nz
	call Function0x37962
	ret nz
	call Function0x35ff5
	ld de, $0106
	call Function0x37e54
	call RefreshBattleHuds

	ld hl, WasPoisonedText
	call FarBattleTextBox

	ld a, $f
	ld hl, $5de9
	rst FarCall
	ret
; 35f2c


BattleCommand2f: ; 35f2c
; poison

	ld hl, DoesntAffectText
	ld a, [TypeModifier]
	and $7f
	jp z, .asm_35fb8
	call Function0x35fe1
	jp z, .asm_35fb8
	ld a, BATTLE_VARS_STATUS_OPP
	call CleanGetBattleVarPair
	ld b, a
	ld hl, AlreadyPoisonedText
	and $8
	jp nz, .asm_35fb8
	call GetOpponentItem
	ld a, b
	cp $14
	jr nz, .asm_35f5f ; 35f51 $c
	ld a, [hl]
	ld [$d265], a
	call GetItemName
	ld hl, ProtectedByText
	jr .asm_35fb8 ; 35f5d $59
.asm_35f5f
	ld hl, DidntAffect1Text
	ld a, BATTLE_VARS_STATUS_OPP
	call CleanGetBattleVarPair
	and a
	jr nz, .asm_35fb8 ; 35f68 $4e
	ld a, [hBattleTurn]
	and a
	jr z, .asm_35f89 ; 35f6d $1a
	ld a, [InLinkBattle]
	and a
	jr nz, .asm_35f89 ; 35f73 $14
	ld a, [$cfc0]
	and a
	jr nz, .asm_35f89 ; 35f79 $e
	ld a, [PlayerSubStatus5]
	bit 5, a
	jr nz, .asm_35f89 ; 35f80 $7
	call FarBattleRNG
	cp $40
	jr c, .asm_35fb8 ; 35f87 $2f
.asm_35f89
	call CheckSubstituteOpp
	jr nz, .asm_35fb8 ; 35f8c $2a
	ld a, [AttackMissed]
	and a
	jr nz, .asm_35fb8 ; 35f92 $24
	call Function0x35fc9
	jr z, .asm_35fa4 ; 35f97 $b
	call Function0x35fc0

	ld hl, WasPoisonedText
	call FarBattleTextBox

	jr .asm_35fb1 ; 35fa2 $d
.asm_35fa4
	set 0, [hl]
	xor a
	ld [de], a
	call Function0x35fc0

	ld hl, BadlyPoisonedText
	call FarBattleTextBox

.asm_35fb1
	ld a, $f
	ld hl, $5de9
	rst FarCall
	ret

.asm_35fb8
	push hl
	call Function0x37e77
	pop hl
	jp FarBattleTextBox
; 35fc0


Function0x35fc0: ; 35fc0
	call Function0x37e01
	call Function0x35ff5
	jp RefreshBattleHuds
; 35fc9


Function0x35fc9: ; 35fc9
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarPair
	ld a, [hBattleTurn]
	and a
	ld de, $c67c
	jr z, .asm_35fd9
	ld de, $c674
.asm_35fd9
	ld a, BATTLE_VARS_MOVE_EFFECT
	call CleanGetBattleVarPair
	cp EFFECT_TOXIC
	ret
; 35fe1


Function0x35fe1: ; 35fe1
	ld de, EnemyMonType1
	ld a, [hBattleTurn]
	and a
	jr z, .asm_35fec
	ld de, BattleMonType1
.asm_35fec
	ld a, [de]
	inc de
	cp POISON
	ret z
	ld a, [de]
	cp POISON
	ret
; 35ff5


Function0x35ff5: ; 35ff5
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarPair
	set PSN, [hl]
	jp UpdateOpponentInParty
; 35fff


BattleCommand15: ; 35fff
; draintarget
	call Function0x36011
	ld hl, SuckedHealthText
	jp FarBattleTextBox
; 36008


BattleCommand16: ; 36008
; eatdream
	call Function0x36011
	ld hl, DreamEatenText
	jp FarBattleTextBox
; 36011


Function0x36011: ; 36011
	ld hl, CurDamage
	ld a, [hli]
	srl a
	ld [$ffb3], a
	ld b, a
	ld a, [hl]
	rr a
	ld [$ffb4], a
	or b
	jr nz, .asm_36026 ; 0x36020 $4
	ld a, $1
	ld [$ffb4], a
.asm_36026
	ld hl, BattleMonHP
	ld de, BattleMonMaxHP
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36037 ; 0x3602f $6
	ld hl, EnemyMonHPHi
	ld de, EnemyMonMaxHPHi
.asm_36037
	ld bc, $d1ed
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
	ld a, [$ffb4]
	ld b, [hl]
	add b
	ld [hld], a
	ld [$d1ee], a
	ld a, [$ffb3]
	ld b, [hl]
	adc b
	ld [hli], a
	ld [$d1ef], a
	jr c, .asm_36064 ; 0x36056 $c
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
	jr nc, .asm_36070 ; 0x36062 $c
.asm_36064
	ld a, [de]
	ld [hld], a
	ld [$d1ee], a
	dec de
	ld a, [de]
	ld [hli], a
	ld [$d1ef], a
	inc de
.asm_36070
	ld a, [hBattleTurn]
	and a
	ld hl, $c55e
	ld a, $1
	jr z, .asm_3607e ; 0x36078 $4
	ld hl, $c4ca
	xor a
.asm_3607e
	ld [$d10a], a
	ld a, $b
	call Predef
	call RefreshBattleHuds
	jp UpdateBattleMonInParty
; 3608c


BattleCommand17: ; 3608c
; burntarget

	xor a
	ld [$cfca], a
	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarPair
	and a
	jp nz, Defrost
	ld a, [TypeModifier]
	and $7f
	ret z
	call Function0x36e5b
	ret z
	call GetOpponentItem
	ld a, b
	cp $15
	ret z
	ld a, [EffectFailed]
	and a
	ret nz
	call Function0x37962
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarPair
	set 4, [hl]
	call UpdateOpponentInParty
	ld hl, $6c76
	call CallBankF
	ld de, $0105
	call Function0x37e54
	call RefreshBattleHuds

	ld hl, WasBurnedText
	call FarBattleTextBox

	ld a, $f
	ld hl, $5de9
	rst FarCall
	ret
; 360dd


Defrost: ; 360dd
	ld a, [hl]
	and $20
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
	jp FarBattleTextBox
; 36102


BattleCommand18: ; 36102
; freezetarget

	xor a
	ld [$cfca], a
	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarPair
	and a
	ret nz
	ld a, [TypeModifier]
	and $7f
	ret z
	ld a, [Weather]
	cp $2
	ret z
	call Function0x36e5b
	ret z
	call GetOpponentItem
	ld a, b
	cp $16
	ret z
	ld a, [EffectFailed]
	and a
	ret nz
	call Function0x37962
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarPair
	set 5, [hl]
	call UpdateOpponentInParty
	ld de, $0108
	call Function0x37e54
	call RefreshBattleHuds

	ld hl, WasFrozenText
	call FarBattleTextBox

	ld a, $f
	ld hl, $5de9
	rst FarCall
	ret nz
	call Function0x34216
	call EndRechargeOpp
	ld hl, $c740
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36162 ; 3615d $3
	ld hl, $c73f
.asm_36162
	ld [hl], $1
	ret
; 36165


BattleCommand19: ; 36165
; paralyzetarget

	xor a
	ld [$cfca], a
	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarPair
	and a
	ret nz
	ld a, [TypeModifier]
	and $7f
	ret z
	call GetOpponentItem
	ld a, b
	cp $18
	ret z
	ld a, [EffectFailed]
	and a
	ret nz
	call Function0x37962
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarPair
	set 6, [hl]
	call UpdateOpponentInParty
	ld hl, $6c39
	call CallBankF
	ld de, $0109
	call Function0x37e54
	call RefreshBattleHuds
	call PrintParalyze
	ld hl, $5de9
	jp CallBankF
; 361ac


BattleCommand70: ; 361ac
; attackup
	ld b, $0
	jr BattleCommand1c
BattleCommand71: ; 361b0
; defenseup
	ld b, $1
	jr BattleCommand1c
BattleCommand72: ; 361b4
; speedup
	ld b, $2
	jr BattleCommand1c
BattleCommand73: ; 361b8
; specialattackup
	ld b, $3
	jr BattleCommand1c
BattleCommand74: ; 361bc
; specialdefenseup
	ld b, $4
	jr BattleCommand1c
BattleCommand75: ; 361c0
; accuracyup
	ld b, $5
	jr BattleCommand1c
BattleCommand76: ; 361c4
; evasionup
	ld b, $6
	jr BattleCommand1c
BattleCommand77: ; 361c8
; attackup2
	ld b, $10
	jr BattleCommand1c
BattleCommand78: ; 361cc
; defenseup2
	ld b, $11
	jr BattleCommand1c
BattleCommand79: ; 361d0
; speedup2
	ld b, $12
	jr BattleCommand1c
BattleCommand7a: ; 361d4
; specialattackup2
	ld b, $13
	jr BattleCommand1c
BattleCommand7b: ; 361d8
; specialdefenseup2
	ld b, $14
	jr BattleCommand1c
BattleCommand7c: ; 361dc
; accuracyup2
	ld b, $15
	jr BattleCommand1c
BattleCommand7d: ; 361e0
; evasionup2
	ld b, $16
	jr BattleCommand1c
BattleCommand1c: ; 361e4
; statup
	call Function0x361ef
	ld a, [FailedMessage]
	and a
	ret nz
	jp Function0x36281
; 361ef


Function0x361ef: ; 361ef
	ld a, b
	ld [LoweredStat], a
	ld hl, PlayerStatLevels
	ld a, [hBattleTurn]
	and a
	jr z, .asm_361fe ; 0x361f9 $3
	ld hl, EnemyStatLevels
.asm_361fe
	ld a, [AttackMissed]
	and a
	jp nz, Function0x3627b
	ld a, [EffectFailed]
	and a
	jp nz, Function0x3627b
	ld a, [LoweredStat]
	and $f
	ld c, a
	ld b, $0
	add hl, bc
	ld b, [hl]
	inc b
	ld a, $d
	cp b
	jp c, Function0x36270
	ld a, [LoweredStat]
	and $f0
	jr z, .asm_3622b ; 0x36222 $7
	inc b
	ld a, $d
	cp b
	jr nc, .asm_3622b ; 0x36228 $1
	ld b, a
.asm_3622b
	ld [hl], b
	push hl
	ld a, c
	cp $5
	jr nc, .asm_36268 ; 0x36230 $36
	ld hl, $c641
	ld de, PlayerStats
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36243 ; 0x3623b $6
	ld hl, $d21b
	ld de, EnemyStats
.asm_36243
	push bc
	sla c
	ld b, $0
	add hl, bc
	ld a, c
	add e
	ld e, a
	jr nc, .asm_3624f ; 0x3624c $1
	inc d
.asm_3624f
	pop bc
	ld a, [hld]
	sub $e7
	jr nz, .asm_3625b ; 0x36253 $6
	ld a, [hl]
	sbc $3
	jp z, Function0x3626e
.asm_3625b
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36265 ; 0x3625e $5
	call Function0x365fd
	jr .asm_36268 ; 0x36263 $3
.asm_36265
	call Function0x365d7
.asm_36268
	pop hl
	xor a
	ld [FailedMessage], a
	ret
; 3626e


Function0x3626e: ; 3626e
	pop hl
	dec [hl]
	; fallthrough
; 36270


Function0x36270: ; 36270
	ld a, $2
	ld [FailedMessage], a
	ld a, $1
	ld [AttackMissed], a
	ret
; 3627b


Function0x3627b: ; 3627b
	ld a, $1
	ld [FailedMessage], a
	ret
; 36281


Function0x36281: ; 36281
	ld bc, $c6fe
	ld hl, $7447
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36292 ; 0x3628a $6
	ld bc, $c6fa
	ld hl, $7486
.asm_36292
	ld a, $c
	call CleanGetBattleVarPair
	cp $6b
	ret nz
	ld a, $1
	ld [bc], a
	call Function0x37ed5
	ret nc
	xor a
	ld [$ffd4], a
	call CallBankF
	call WaitBGMap
	jp BattleCommandaa
; 362ad


BattleCommand7e: ; 362ad
; attackdown
	ld a, ATTACK
	jr BattleCommand1d
BattleCommand7f: ; 362b1
; defensedown
	ld a, DEFENSE
	jr BattleCommand1d
BattleCommand80: ; 362b5
; speeddown
	ld a, SPEED
	jr BattleCommand1d
BattleCommand81: ; 362b9
; specialattackdown
	ld a, SP_ATTACK
	jr BattleCommand1d
BattleCommand82: ; 362bd
; specialdefensedown
	ld a, SP_DEFENSE
	jr BattleCommand1d
BattleCommand83: ; 362c1
; accuracydown
	ld a, ACCURACY
	jr BattleCommand1d
BattleCommand84: ; 362c5
; evasiondown
	ld a, EVASION
	jr BattleCommand1d
BattleCommand85: ; 362c9
; attackdown2
	ld a, $10 | ATTACK
	jr BattleCommand1d
BattleCommand86: ; 362cd
; defensedown2
	ld a, $10 | DEFENSE
	jr BattleCommand1d
BattleCommand87: ; 362d1
; speeddown2
	ld a, $10 | SPEED
	jr BattleCommand1d
BattleCommand88: ; 362d5
; specialattackdown2
	ld a, $10 | SP_ATTACK
	jr BattleCommand1d
BattleCommand89: ; 362d9
; specialdefensedown2
	ld a, $10 | SP_DEFENSE
	jr BattleCommand1d
BattleCommand8a: ; 362dd
; accuracydown2
	ld a, $10 | ACCURACY
	jr BattleCommand1d
BattleCommand8b: ; 362e1
; evasiondown2
	ld a, $10 | EVASION

BattleCommand1d: ; 362e3
; statdown

	ld [LoweredStat], a

	call Function0x36391
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
	ld a, [InLinkBattle]
	and a
	jr nz, .DidntMiss

	ld a, [$cfc0]
	and a
	jr nz, .DidntMiss

; Lock-On still always works.
	ld a, [PlayerSubStatus5]
	bit SUBSTATUS_LOCK_ON, a
	jr nz, .DidntMiss

; Attacking moves that also lower accuracy are unaffected.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call CleanGetBattleVarPair
	cp EFFECT_ACCURACY_DOWN_HIT
	jr z, .DidntMiss

	call FarBattleRNG
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
	ld hl, EnemyMonAtk + 1
	ld de, EnemyStats
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36366
	ld hl, BattleMonAtk + 1
	ld de, PlayerStats
.asm_36366
	call Function0x3641a
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


Function0x36391: ; 36391
	ld a, BATTLE_VARS_MOVE_EFFECT
	call CleanGetBattleVarPair
	cp EFFECT_ATTACK_DOWN
	jr c, .asm_363ae
	cp EFFECT_EVASION_DOWN + 1
	jr c, .asm_363b0
	cp EFFECT_ATTACK_DOWN_2
	jr c, .asm_363ae
	cp EFFECT_EVASION_DOWN_2 + 1
	jr c, .asm_363b0
	cp EFFECT_ATTACK_DOWN_HIT
	jr c, .asm_363ae
	cp EFFECT_EVASION_DOWN_HIT + 1
	jr c, .asm_363b0
.asm_363ae
	xor a
	ret
.asm_363b0
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call CleanGetBattleVarPair
	bit SUBSTATUS_MIST, a
	ret
; 363b8


BattleCommand8c: ; 363b8
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
	TX_FAR UnknownText_0x1c0cc6
	start_asm

	ld hl, .up
	ld a, [LoweredStat]
	and $f0
	ret z
	ld hl, .wayup
	ret

.wayup
	TX_FAR UnknownText_0x1c0cd0
	db "@"

.up
	TX_FAR UnknownText_0x1c0ce0
	db "@"

; 363e9


BattleCommand8d: ; 363e9
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
	TX_FAR UnknownText_0x1c0ceb
	start_asm

	ld hl, .fell
	ld a, [LoweredStat]
	and $f0
	ret z
	ld hl, .sharplyfell
	ret

.sharplyfell
	TX_FAR UnknownText_0x1c0cf5
	db "@"
.fell
	TX_FAR UnknownText_0x1c0d06
	db "@"

; 3641a


Function0x3641a: ; 3641a
; Lower stat c from stat struct hl (buffer de).

	push bc
	sla c
	ld b, 0
	add hl, bc
	; add de, c
	ld a, c
	add e
	ld e, a
	jr nc, .asm_36426
	inc d
.asm_36426
	pop bc

; The lowest possible stat is 1.
	ld a, [hld]
	sub 1
	jr nz, .asm_3642f
	ld a, [hl]
	and a
	ret z

.asm_3642f
	ld a, [hBattleTurn]
	and a
	jr z, .Player

	call SwitchTurn
	call Function0x365d7
	call SwitchTurn
	jr .end

.Player
	call SwitchTurn
	call Function0x365fd
	call SwitchTurn
.end
	ld a, 1
	and a
	ret
; 3644c


BattleCommand8e: ; 3644c
; statupfailtext
	ld a, [FailedMessage]
	and a
	ret z
	push af
	call BattleCommandaa
	pop af
	dec a
	jp z, TryPrintButItFailed
	ld a, [LoweredStat]
	and $f
	ld b, a
	inc b
	call GetStatName
	ld hl, WontRiseAnymoreText
	jp FarBattleTextBox
; 3646a


BattleCommand8f: ; 3646a
; statdownfailtext
	ld a, [FailedMessage]
	and a
	ret z
	push af
	call BattleCommandaa
	pop af
	dec a
	jp z, TryPrintButItFailed
	dec a
	ld hl, ProtectedByMistText
	jp z, FarBattleTextBox
	ld a, [LoweredStat]
	and $f
	ld b, a
	inc b
	call GetStatName
	ld hl, WontDropAnymoreText
	jp FarBattleTextBox
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


Table0x364e6: ; 364e6
	dw $6419
	dw $641c
	dw $6421
	dw $6428
	dw $6432
	dw $6442
; 364f2


StatLevelMulipliers: ; 364f2
	db  1,  1 ; 1.0x
	db 15, 10 ; 1.5x
	db  2,  1 ; 2.0x
	db 25, 10 ; 2.5x
	db  3,  1 ; 3.0x
	db 35, 10 ; 3.5x
	db  4,  1 ; 4.0x
; 36500


BattleCommanda4: ; 36500
; allstatsup

; Attack
	call ResetMiss
	call BattleCommand70
	call BattleCommand8c

; Defense
	call ResetMiss
	call BattleCommand71
	call BattleCommand8c

; Speed
	call ResetMiss
	call BattleCommand72
	call BattleCommand8c

; Special Attack
	call ResetMiss
	call BattleCommand73
	call BattleCommand8c

; Special Defense
	call ResetMiss
	call BattleCommand74
	jp   BattleCommand8c
; 3652d


ResetMiss: ; 3652d
	xor a
	ld [AttackMissed], a
	ret
; 36532


Function0x36532: ; 36532
	ld [LoweredStat], a

	ld hl, PlayerStatLevels
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36540
	ld hl, EnemyStatLevels

.asm_36540
	ld a, [LoweredStat]
	and $f
	ld c, a
	ld b, 0
	add hl, bc
	ld b, [hl]
	dec b
	jr z, .asm_36589

	ld a, [LoweredStat]
	and $f0
	jr z, .asm_36558
	dec b
	jr nz, .asm_36558
	inc b

.asm_36558
	ld [hl], b
	ld a, c
	cp 5
	jr nc, .asm_36576

	push hl
	ld hl, $c641
	ld de, PlayerStats
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36570
	ld hl, $d21b
	ld de, EnemyStats

.asm_36570
	call Function0x3641a
	pop hl
	jr z, .asm_36588

.asm_36576
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36580

	call Function0x365fd

	jr .asm_36583

.asm_36580
	call Function0x365d7

.asm_36583
	xor a
	ld [FailedMessage], a
	ret

.asm_36588
	inc [hl]

.asm_36589
	ld a, 2
	ld [FailedMessage], a
	ret
; 3658f


BattleCommandac: ; 3658f
; tristatuschance

	call BattleCommand90

; 1/3 chance of each status
.loop
	call FarBattleRNG
	swap a
	and 3
	jr z, .loop
; jump
	dec a
	ld hl, .ptrs
	rst JumpTable
	ret
.ptrs
	dw BattleCommand19 ; paralyze
	dw BattleCommand18 ; freeze
	dw BattleCommand17 ; burn
; 365a7


BattleCommandaf: ; 365a7
; curl
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVarPair
	set 0, [hl]
	ret
; 365af


BattleCommanda6: ; 365af
	ld hl, $743d
	ld a, [hBattleTurn]
	and a
	jr z, .asm_365ba ; 365b5 $3
	ld hl, $747c
.asm_365ba
	xor a
	ld [$ffd4], a
	call CallBankF
	jp $31f6
; 365c3


BattleCommanda7: ; 365c3
	ld hl, $7447
	ld a, [hBattleTurn]
	and a
	jr z, .asm_365ce ; 365c9 $3
	ld hl, $7486
.asm_365ce
	xor a
	ld [$ffd4], a
	call CallBankF
	jp $31f6
; 365d7


Function0x365d7: ; 365d7
	ld hl, PlayerAtkLevel
	ld de, PlayerStats
	ld bc, BattleMonAtk

	ld a, $5
	call Function0x3661d

	ld hl, $6d45
	call CallBankF

	call SwitchTurn

	ld hl, $6c39
	call CallBankF

	ld hl, $6c76
	call CallBankF

	jp SwitchTurn
; 365fd


Function0x365fd: ; 365fd
	ld hl, EnemyAtkLevel
	ld de, EnemyStats
	ld bc, EnemyMonAtk

	ld a, $5
	call Function0x3661d

	call SwitchTurn

	ld hl, $6c39
	call CallBankF

	ld hl, $6c76
	call CallBankF

	jp SwitchTurn
; 3661d


Function0x3661d: ; 3661d
.asm_3661d
	push af
	ld a, [hli]
	push hl
	push bc
	ld c, a
	dec c
	ld b, 0
	ld hl, Table0x364e6
	add hl, bc
	add hl, bc
	xor a
	ld [$ffb4], a
	ld a, [de]
	ld [$ffb5], a
	inc de
	ld a, [de]
	ld [$ffb6], a
	inc de
	ld a, [hli]
	ld [$ffb7], a
	call Multiply

	ld a, [hl]
	ld [$ffb7], a
	ld b, $4
	call Divide

	ld a, [$ffb5]
	ld b, a
	ld a, [$ffb6]
	or b
	jr nz, .asm_36651

	ld a, $1
	ld [$ffb6], a
	jr .asm_36662

.asm_36651
	ld a, [$ffb6]
	cp $e7
	ld a, b
	sbc $3
	jr c, .asm_36662

	ld a, $e7
	ld [$ffb6], a
	ld a, $3
	ld [$ffb5], a
.asm_36662
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
	jr nz, .asm_3661d

	ret
; 36671


BattleCommand21: ; 36671
; storeenergy

	ld a, BATTLE_VARS_SUBSTATUS3
	call CleanGetBattleVarPair
	bit 0, a
	ret z
	ld hl, PlayerRolloutCount
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36684
	ld hl, EnemyRolloutCount
.asm_36684
	dec [hl]
	jr nz, .asm_366dc
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarPair
	res 0, [hl]

	ld hl, UnleashedEnergyText
	call FarBattleTextBox

	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVarPair
	ld a, 1
	ld [hl], a
	ld hl, PlayerDamageTaken + 1
	ld de, $c732
	ld a, [hBattleTurn]
	and a
	jr z, .asm_366ad
	ld hl, EnemyDamageTaken + 1
	ld de, $c733
.asm_366ad
	ld a, [hld]
	add a
	ld b, a
	ld [CurDamage + 1], a
	ld a, [hl]
	rl a
	ld [CurDamage], a
	jr nc, .asm_366c3
	ld a, $ff
	ld [CurDamage], a
	ld [CurDamage + 1], a
.asm_366c3
	or b
	jr nz, .asm_366cb
	ld a, 1
	ld [AttackMissed], a
.asm_366cb
	xor a
	ld [hli], a
	ld [hl], a
	ld [de], a

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarPair
	ld a, BIDE
	ld [hl], a

	ld b, $22 ; unleashenergy
	jp SkipToBattleCommand

.asm_366dc
	ld hl, StoringEnergyText
	call FarBattleTextBox
	jp EndMoveEffect
; 366e5


BattleCommand22: ; 366e5
; unleashenergy

	ld de, $c682
	ld bc, PlayerRolloutCount
	ld a, [hBattleTurn]
	and a
	jr z, .asm_366f6 ; 366ee $6
	ld de, $c684
	ld bc, EnemyRolloutCount
.asm_366f6
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarPair
	set 0, [hl]
	xor a
	ld [de], a
	inc de
	ld [de], a
	ld [PlayerMoveEffect], a
	ld [EnemyMoveEffect], a
	call FarBattleRNG
	and $1
	inc a
	inc a
	ld [bc], a
	ld a, $1
	ld [$c689], a
	call Function0x37e01
	jp EndMoveEffect
; 3671a


BattleCommand3e: ; 3671a
; checkrampage

	ld de, PlayerRolloutCount
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36725 ; 36720 $3
	ld de, EnemyRolloutCount
.asm_36725
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarPair
	bit 1, [hl]
	ret z
	ld a, [de]
	dec a
	ld [de], a
	jr nz, .asm_3674c ; 36730 $1a
	res 1, [hl]
	call SwitchTurn
	call Function0x37962
	push af
	call SwitchTurn
	pop af
	jr nz, .asm_3674c ; 3673f $b
	set 7, [hl]
	call FarBattleRNG
	and $1
	inc a
	inc a
	inc de
	ld [de], a
.asm_3674c
	ld b, $3d ; rampage
	jp SkipToBattleCommand
; 36751


BattleCommand3d: ; 36751
; rampage

; No rampage during Sleep Talk.
	ld a, BATTLE_VARS_STATUS
	call CleanGetBattleVarPair
	and 7
	ret nz

	ld de, PlayerRolloutCount
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36764 ; 3675f $3
	ld de, EnemyRolloutCount
.asm_36764
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarPair
	set 1, [hl]
	call FarBattleRNG
	and $1
	inc a
	ld [de], a
	ld a, 1
	ld [$c73e], a
	ret
; 36778


BattleCommanda0: ; 36778
; teleport

	ld a, [BattleType]
	cp BATTLETYPE_SHINY
	jr z, .asm_367b9
	cp $9
	jr z, .asm_367b9
	cp $b
	jr z, .asm_367b9
	cp BATTLETYPE_SUICUNE
	jr z, .asm_367b9

	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call CleanGetBattleVarPair
	bit SUBSTATUS_CANT_RUN, a
	jr nz, .asm_367b9
	ld a, [hBattleTurn]
	and a
	jr nz, .asm_367bf
	ld a, [IsInBattle]
	dec a
	jr nz, .asm_367b9
	ld a, [$d143]
	ld b, a
	ld a, [BattleMonLevel]
	cp b
	jr nc, .asm_367df
	add b
	ld c, a
	inc c
.asm_367ac
	call FarBattleRNG
	cp c
	jr nc, .asm_367ac ; 367b0 $fa
	srl b
	srl b
	cp b
	jr nc, .asm_367df ; 367b7 $26

.asm_367b9
	call Function0x37e77
	jp PrintButItFailed

.asm_367bf
	ld a, [IsInBattle]
	dec a
	jr nz, .asm_367b9 ; 367c3 $f4
	ld a, [BattleMonLevel]
	ld b, a
	ld a, [$d143]
	cp b
	jr nc, .asm_367df ; 367cd $10
	add b
	ld c, a
	inc c
.asm_367d2
	call FarBattleRNG
	cp c
	jr nc, .asm_367d2 ; 367d6 $fa
	srl b
	srl b
	cp b
	jr nc, .asm_367df ; 367dd $0
.asm_367df
	call UpdateBattleMonInParty
	xor a
	ld [$cfca], a
	inc a
	ld [$d232], a
	ld [$c689], a
	call Function0x36804
	call BattleCommand0a
	call Function0x37e36
	ld c, 20
	call DelayFrames
	call Function0x36804

	ld hl, FledFromBattleText
	jp FarBattleTextBox
; 36804


Function0x36804: ; 36804
	ld a, [$d0ee]
	and $c0
	or $2
	ld [$d0ee], a
	ret
; 3680f


BattleCommand23: ; 3680f
; forceswitch

	ld a, [BattleType]
	cp BATTLETYPE_SHINY
	jp z, .asm_36969
	cp $9
	jp z, .asm_36969
	cp $b
	jp z, .asm_36969
	cp BATTLETYPE_SUICUNE
	jp z, .asm_36969
	ld a, [hBattleTurn]
	and a
	jp nz, .asm_368cd
	ld a, [AttackMissed]
	and a
	jr nz, .asm_36852 ; 36830 $20
	ld a, [IsInBattle]
	dec a
	jr nz, .asm_36869 ; 36836 $31
	ld a, [$d143]
	ld b, a
	ld a, [BattleMonLevel]
	cp b
	jr nc, .asm_36855 ; 36840 $13
	add b
	ld c, a
	inc c
.asm_36845
	call FarBattleRNG
	cp c
	jr nc, .asm_36845 ; 36849 $fa
	srl b
	srl b
	cp b
	jr nc, .asm_36855 ; 36850 $3
.asm_36852
	jp .asm_36969
.asm_36855
	call UpdateBattleMonInParty
	xor a
	ld [$cfca], a
	inc a
	ld [$d232], a
	call Function0x36804
	ld a, [PlayerMoveAnimation]
	jp .asm_36975
.asm_36869
	call Function0x349f4
	jr c, .asm_368ca ; 3686c $5c
	ld a, [$c70f]
	and a
	jr z, .asm_368ca ; 36872 $56
	call UpdateEnemyMonInParty
	ld a, $1
	ld [$c689], a
	call Function0x37e01
	ld c, $14
	call DelayFrames
	ld hl, $c4a1
	ld bc, $040a
	call ClearBox
	ld c, $14
	call DelayFrames
	ld a, [OTPartyCount]
	ld b, a
	ld a, [CurOTMon]
	ld c, a
.asm_3689a
	call FarBattleRNG
	and $7
	cp b
	jr nc, .asm_3689a ; 368a0 $f8
	cp c
	jr z, .asm_3689a ; 368a3 $f5
	push af
	push bc
	ld hl, OTPartyMon1CurHP
	call GetPartyLocation
	ld a, [hli]
	or [hl]
	pop bc
	pop de
	jr z, .asm_3689a ; 368b1 $e7
	ld a, d
	inc a
	ld [$c718], a
	ld hl, $54c3
	ld a, $f
	rst FarCall

	ld hl, DraggedOutText
	call FarBattleTextBox

	ld hl, $5c23
	jp CallBankF

.asm_368ca
	jp .asm_36969

.asm_368cd
	ld a, [AttackMissed]
	and a
	jr nz, .asm_368f3

	ld a, [IsInBattle]
	dec a
	jr nz, .asm_36908

	ld a, [BattleMonLevel]
	ld b, a
	ld a, [$d143]
	cp b
	jr nc, .asm_368f5

	add b
	ld c, a
	inc c
.asm_368e6
	call FarBattleRNG
	cp c
	jr nc, .asm_368e6

	srl b
	srl b
	cp b
	jr nc, .asm_368f5

.asm_368f3
	jr .asm_36969

.asm_368f5
	call UpdateBattleMonInParty
	xor a
	ld [$cfca], a
	inc a
	ld [$d232], a
	call Function0x36804
	ld a, [EnemyMoveAnimation]
	jr .asm_36975

.asm_36908
	call Function0x36994
	jr c, .asm_36969

	ld a, [$c70f]
	cp $1
	jr z, .asm_368ca

	call UpdateBattleMonInParty
	ld a, $1
	ld [$c689], a
	call Function0x37e01
	ld c, $14
	call DelayFrames
	ld hl, $c535
	ld bc, $050b
	call $0fb6
	ld c, $14
	call DelayFrames
	ld a, [PartyCount]
	ld b, a
	ld a, [CurBattleMon]
	ld c, a
.asm_3693a
	call FarBattleRNG
	and $7
	cp b
	jr nc, .asm_3693a

	cp c
	jr z, .asm_3693a

	push af
	push bc
	ld hl, PartyMon1CurHP
	call GetPartyLocation
	ld a, [hli]
	or [hl]
	pop bc
	pop de
	jr z, .asm_3693a

	ld a, d
	ld [CurPartyMon], a
	ld hl, $5b32
	call CallBankF

	ld hl, DraggedOutText
	call FarBattleTextBox

	ld hl, $5c23
	jp CallBankF

.asm_36969
	call BattleCommand0a
	call BattleCommandaa
	call BattleCommand0c
	jp PrintButItFailed

.asm_36975
	push af
	call Function0x36804
	ld a, $1
	ld [$c689], a
	call Function0x37e01
	ld c, $14
	call DelayFrames
	pop af

	ld hl, FledInFearText
	cp $2e
	jr z, .asm_36991
	ld hl, BlownAwayText
.asm_36991
	jp FarBattleTextBox
; 36994


Function0x36994: ; 36994
	ld a, [PartyCount]
	ld d, a
	ld e, 0
	ld bc, $30
.asm_3699d
	ld a, [CurBattleMon]
	cp e
	jr z, .asm_369ae

	ld a, e
	ld hl, PartyMon1CurHP
	call AddNTimes
	ld a, [hli]
	or [hl]
	jr nz, .asm_369b4

.asm_369ae
	inc e
	dec d
	jr nz, .asm_3699d

	scf
	ret

.asm_369b4
	and a
	ret
; 369b6


BattleCommand24: ; 369b6
; endloop

; Loop back to the command before 'critical'.

	ld de, PlayerRolloutCount
	ld bc, $c682
	ld a, [hBattleTurn]
	and a
	jr z, .asm_369c7
	ld de, EnemyRolloutCount
	ld bc, $c684
.asm_369c7

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarPair
	bit 2, [hl]
	jp nz, .asm_36a43
	set 2, [hl]
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVarPair
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
	call FarBattleRNG
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
	ld a, [IsInBattle]
	cp $1
	jp z, .asm_36a1e
	ld a, [OTPartyCount]
	cp $1
	jp z, .asm_36a1e
	dec a
	jr .asm_36a3a

.asm_36a1e
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarPair
	res 2, [hl]
	call BattleCommanda8
	jp EndMoveEffect
.asm_36a2b
	call FarBattleRNG
	and $3
	cp $2
	jr c, .asm_36a39 ; 36a32 $5
	call FarBattleRNG
	and $3
.asm_36a39
	inc a
.asm_36a3a
	ld [de], a
	inc a
	ld [bc], a
	jr .asm_36a6b ; 36a3d $2c
.asm_36a3f
	ld a, $1
	jr .asm_36a3a ; 36a41 $f7

.asm_36a43
	ld a, [de]
	dec a
	ld [de], a
	jr nz, .asm_36a6b ; 36a46 $23
.asm_36a48
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarPair
	res 2, [hl]

	ld hl, PlayerHitTimesText
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36a5a
	ld hl, EnemyHitTimesText
.asm_36a5a

	push bc
	ld a, BATTLE_VARS_MOVE_EFFECT
	call CleanGetBattleVarPair
	cp EFFECT_BEAT_UP
	jr z, .asm_36a67
	call FarBattleTextBox
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
	jr nz, .asm_36a73 ; 36a76 $fb
	inc hl
	ld a, h
	ld [BattleScriptBufferLoc + 1], a
	ld a, l
	ld [BattleScriptBufferLoc], a
	ret
; 36a82


BattleCommand94: ; 36a82
	ld a, [AttackMissed]
	and a
	ret nz
	call CheckSubstituteOpp
	jr nz, .asm_36a9a ; 36a8a $e
	ld a, BATTLE_VARS_STATUS_OPP
	call CleanGetBattleVarPair
	and $27
	jr nz, .asm_36a9a ; 36a93 $5
	call Function0x36abf
	jr z, Function0x36ab5 ; 36a98 $1b
.asm_36a9a
	ld a, 1
	ld [AttackMissed], a
	ret
; 36aa0


BattleCommand25: ; 36aa0
	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call CleanGetBattleVarPair
	and $27
	ret nz
	call Function0x36abf
	ret nz
	ld a, [EffectFailed]
	and a
	ret nz

	; fallthrough
; 36ab5


Function0x36ab5: ; 36ab5
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVarPair
	set 3, [hl]
	jp EndRechargeOpp
; 36abf


Function0x36abf: ; 36abf
	push bc
	ld a, [$c70f]
	ld b, a
	ld a, [hBattleTurn]
	xor b
	pop bc
	ret
; 36ac9


BattleCommand4d: ; 36ac9
; kingsrock

	ld a, [AttackMissed]
	and a
	ret nz

	call GetUserItem
	ld a, b
	cp $4b ; king's rock
	ret nz

	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVarPair
	ld d, h
	ld e, l
	call GetUserItem
	call FarBattleRNG
	cp c
	ret nc
	call EndRechargeOpp
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVarPair
	set 3, [hl]
	ret
; 36af3


BattleCommand26: ; 36af3
; ohko

	call ResetDamage
	ld a, [TypeModifier]
	and $7f
	jr z, .asm_36b2f ; 36afb $32
	ld hl, EnemyMonLevel
	ld de, BattleMonLevel
	ld bc, PlayerMoveAccuracy
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36b12 ; 36b09 $7
	push hl
	ld h, d
	ld l, e
	pop de
	ld bc, EnemyMoveAccuracy
.asm_36b12
	ld a, [de]
	sub [hl]
	jr c, .asm_36b2f ; 36b14 $19
	add a
	ld e, a
	ld a, [bc]
	add e
	jr nc, .asm_36b1e ; 36b1a $2
	ld a, $ff
.asm_36b1e
	ld [bc], a
	call BattleCommand09
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


BattleCommand3a: ; 36b3a
; checkcharge

; charged?
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarPair
	bit 4, [hl]
	ret z
; go to town
	res 4, [hl]
	res 5, [hl]
	res 6, [hl]
	ld b, $39 ; charge
	jp SkipToBattleCommand
; 36b4d


BattleCommand39: ; 36b4d
; charge

	call BattleCommand38
	ld a, BATTLE_VARS_STATUS
	call CleanGetBattleVarPair
	and $7
	jr z, .asm_36b65

	call BattleCommandaa
	call BattleCommand0c
	call PrintButItFailed
	jp EndMoveEffect

.asm_36b65
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarPair
	set 4, [hl]

	ld hl, IgnoredOrders2Text
	ld a, [AlreadyDisobeyed]
	and a
	call nz, FarBattleTextBox

	call BattleCommand0a
	xor a
	ld [$cfca], a
	inc a
	ld [$c689], a
	call Function0x37e36
	ld a, BATTLE_VARS_MOVE_ANIM
	call CleanGetBattleVarPair
	cp $13
	jr z, .asm_36b96 ; 36b8b $9
	cp $5b
	jr z, .asm_36b96 ; 36b8f $5
	call BattleCommand0c
	jr .asm_36b99 ; 36b94 $3
.asm_36b96
	call Function0x37ec0
.asm_36b99
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarPair
	ld a, BATTLE_VARS_MOVE_ANIM
	call CleanGetBattleVarPair
	ld b, a
	cp $13
	jr z, .asm_36bb0 ; 36ba6 $8
	cp $5b
	jr nz, .asm_36bb2 ; 36baa $6
	set 5, [hl]
	jr .asm_36bb2 ; 36bae $2

.asm_36bb0
	set 6, [hl]

.asm_36bb2
	call Function0x34548
	jr nz, .asm_36bc3 ; 36bb5 $c
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE
	call GetBattleVarPair
	ld [hl], b
	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarPair
	ld [hl], b

.asm_36bc3
	call ResetDamage

	ld hl, .text_36bdb
	call BattleTextBox

	ld a, BATTLE_VARS_MOVE_EFFECT
	call CleanGetBattleVarPair
	cp EFFECT_SKULL_BASH
	ld b, $fe ; endturn
	jp z, SkipToBattleCommand
	jp EndMoveEffect

.text_36bdb
; [user]
	TX_FAR UnknownText_0x1c0d0e
	start_asm

	ld a, BATTLE_VARS_MOVE_ANIM
	call CleanGetBattleVarPair
	cp RAZOR_WIND
	ld hl, .RazorWind
	jr z, .asm_36c0d

	cp SOLARBEAM
	ld hl, .Solarbeam
	jr z, .asm_36c0d

	cp SKULL_BASH
	ld hl, .SkullBash
	jr z, .asm_36c0d

	cp SKY_ATTACK
	ld hl, .SkyAttack
	jr z, .asm_36c0d

	cp FLY
	ld hl, .Fly
	jr z, .asm_36c0d

	cp DIG
	ld hl, .Dig

.asm_36c0d
	ret

.RazorWind
; 'made a whirlwind!'
	TX_FAR UnknownText_0x1c0d12
	db "@"

.Solarbeam
; 'took in sunlight!'
	TX_FAR UnknownText_0x1c0d26
	db "@"

.SkullBash
; 'lowered its head!'
	TX_FAR UnknownText_0x1c0d3a
	db "@"

.SkyAttack
; 'is glowing!'
	TX_FAR UnknownText_0x1c0d4e
	db "@"

.Fly
; 'flew up high!'
	TX_FAR UnknownText_0x1c0d5c
	db "@"

.Dig
; 'dug a hole!'
	TX_FAR UnknownText_0x1c0d6c
	db "@"
; 36c2c


BattleCommand3c: ; 36c2c
; unused
	ret
; 36c2d


BattleCommand3b: ; 36c2d
; traptarget

	ld a, [AttackMissed]
	and a
	ret nz
	ld hl, $c731
	ld de, $c72f
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36c43
	ld hl, $c730
	ld de, $c72e

.asm_36c43
	ld a, [hl]
	and a
	ret nz
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call CleanGetBattleVarPair
	bit 4, a
	ret nz
	call FarBattleRNG
	and 3
	inc a
	inc a
	inc a
	ld [hl], a
	ld a, BATTLE_VARS_MOVE_ANIM
	call CleanGetBattleVarPair
	ld [de], a
	ld b, a
	ld hl, .Traps

.asm_36c61
	ld a, [hli]
	cp b
	jr z, .asm_36c69
	inc hl
	inc hl
	jr .asm_36c61

.asm_36c69
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp FarBattleTextBox

.Traps
	dbw BIND,      UsedBindText      ; 'used BIND on'
	dbw WRAP,      WrappedByText     ; 'was WRAPPED by'
	dbw FIRE_SPIN, FireSpinTrapText  ; 'was trapped!'
	dbw CLAMP,     ClampedByText     ; 'was CLAMPED by'
	dbw WHIRLPOOL, WhirlpoolTrapText ; 'was trapped!'
; 36c7e


BattleCommand28: ; 36c7e
; mist

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarPair
	bit 1, [hl]
	jr nz, .asm_36c92 ; 36c85 $b
	set 1, [hl]
	call Function0x37e01
	ld hl, MistText
	jp FarBattleTextBox
.asm_36c92
	call Function0x37e77
	jp PrintButItFailed
; 36c98


BattleCommand29: ; 36c98
; focusenergy

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarPair
	bit 2, [hl]
	jr nz, .asm_36cac ; 36c9f $b
	set 2, [hl]
	call Function0x37e01
	ld hl, GettingPumpedText
	jp FarBattleTextBox
.asm_36cac
	call Function0x37e77
	jp PrintButItFailed
; 36cb2


BattleCommand27: ; 36cb2
; recoil

	ld hl, BattleMonMaxHP
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36cbd ; 36cb8 $3
	ld hl, EnemyMonMaxHPHi
.asm_36cbd
	ld a, BATTLE_VARS_MOVE_ANIM
	call CleanGetBattleVarPair
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
	jr nz, .asm_36cd8 ; 36cd5 $1
	inc c
.asm_36cd8
	ld a, [hli]
	ld [$d1eb], a
	ld a, [hl]
	ld [$d1ea], a
	dec hl
	dec hl
	ld a, [hl]
	ld [$d1ec], a
	sub c
	ld [hld], a
	ld [$d1ee], a
	ld a, [hl]
	ld [$d1ed], a
	sbc b
	ld [hl], a
	ld [$d1ef], a
	jr nc, .asm_36cfe ; 36cf4 $8
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, $d1ee
	ld [hli], a
	ld [hl], a
.asm_36cfe
	ld hl, $c55e
	ld a, [hBattleTurn]
	and a
	ld a, $1
	jr z, .asm_36d0c ; 36d06 $4
	ld hl, $c4ca
	xor a
.asm_36d0c
	ld [$d10a], a
	ld a, $b
	call Predef
	call RefreshBattleHuds
	ld hl, RecoilText
	jp FarBattleTextBox
; 36d1d


BattleCommand2b: ; 36d1d
; confusetarget

	call GetOpponentItem
	ld a, b
	cp $19
	ret z
	ld a, [EffectFailed]
	and a
	ret nz
	call Function0x37962
	ret nz
	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVarPair
	bit 7, [hl]
	ret nz
	jr Function0x36d70


BattleCommand2a: ; 36d3b
; confuse

	call GetOpponentItem
	ld a, b
	cp $19
	jr nz, .asm_36d53
	ld a, [hl]
	ld [$d265], a
	call GetItemName
	call Function0x37e77
	ld hl, ProtectedByText
	jp FarBattleTextBox

.asm_36d53
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVarPair
	bit 7, [hl]
	jr z, .asm_36d65
	call Function0x37e77
	ld hl, AlreadyConfusedText
	jp FarBattleTextBox

.asm_36d65
	call CheckSubstituteOpp
	jr nz, Function0x36db6
	ld a, [AttackMissed]
	and a
	jr nz, Function0x36db6

	; fallthrough
; 36d70


Function0x36d70: ; 36d70
	ld bc, EnemyConfuseCount
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36d7b
	ld bc, PlayerConfuseCount

.asm_36d7b
	set 7, [hl]
	call FarBattleRNG
	and 3
	inc a
	inc a
	ld [bc], a

	ld a, BATTLE_VARS_MOVE_EFFECT
	call CleanGetBattleVarPair
	cp EFFECT_CONFUSE_HIT
	jr z, .asm_36d99
	cp EFFECT_SNORE
	jr z, .asm_36d99
	cp EFFECT_SWAGGER
	jr z, .asm_36d99
	call Function0x37e01

.asm_36d99
	ld de, $0103
	call Function0x37e54

	ld hl, BecameConfusedText
	call FarBattleTextBox

	call GetOpponentItem
	ld a, b
	cp $f
	jr z, .asm_36db0
	cp $10
	ret nz
.asm_36db0
	ld hl, $5e51
	jp CallBankF
; 36db6

Function0x36db6: ; 36db6
	ld a, BATTLE_VARS_MOVE_EFFECT
	call CleanGetBattleVarPair
	cp EFFECT_CONFUSE_HIT
	ret z
	cp EFFECT_SNORE
	ret z
	cp EFFECT_SWAGGER
	ret z
	jp PrintDidntAffect2
; 36dc7


BattleCommand30: ; 36dc7
; paralyze

	ld a, BATTLE_VARS_STATUS_OPP
	call CleanGetBattleVarPair
	bit 6, a
	jr nz, .asm_36e49 ; 36dce $79
	ld a, [TypeModifier]
	and $7f
	jr z, .asm_36e55 ; 36dd5 $7e
	call GetOpponentItem
	ld a, b
	cp $18
	jr nz, .asm_36def ; 36ddd $10
	ld a, [hl]
	ld [$d265], a
	call GetItemName
	call Function0x37e77
	ld hl, ProtectedByText
	jp FarBattleTextBox
.asm_36def
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36e0e ; 36df2 $1a
	ld a, [InLinkBattle]
	and a
	jr nz, .asm_36e0e ; 36df8 $14
	ld a, [$cfc0]
	and a
	jr nz, .asm_36e0e ; 36dfe $e
	ld a, [PlayerSubStatus5]
	bit 5, a
	jr nz, .asm_36e0e ; 36e05 $7
	call FarBattleRNG
	cp $40
	jr c, .asm_36e52 ; 36e0c $44
.asm_36e0e
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarPair
	and a
	jr nz, .asm_36e52 ; 36e14 $3c
	ld a, [AttackMissed]
	and a
	jr nz, .asm_36e52 ; 36e1a $36
	call CheckSubstituteOpp
	jr nz, .asm_36e52 ; 36e1f $31
	ld c, $1e
	call DelayFrames
	call Function0x37e01
	ld a, $1
	ld [$ffd4], a
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarPair
	set 6, [hl]
	call UpdateOpponentInParty
	ld hl, $6c39
	call CallBankF
	call UpdateBattleHuds
	call PrintParalyze
	ld hl, $5de9
	jp CallBankF
.asm_36e49
	call Function0x37e77
	ld hl, AlreadyParalyzedText
	jp FarBattleTextBox
.asm_36e52
	jp PrintDidntAffect2
.asm_36e55
	call Function0x37e77
	jp PrintDoesntAffect
; 36e5b


Function0x36e5b: ; 36e5b
; Compare move type to user type.
; Return z if matching the user type (unless the move is Normal).

	push hl

	ld hl, EnemyMonType1
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, BattleMonType1
.ok

	ld a, BATTLE_VARS_MOVE_TYPE
	call CleanGetBattleVarPair
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


BattleCommand31: ; 36e7c
; substitute

	call BattleCommandaa
	ld hl, BattleMonMaxHP
	ld de, $c6df
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36e90 ; 36e88 $6
	ld hl, EnemyMonMaxHPHi
	ld de, $c6e0
.asm_36e90
	ld a, BATTLE_VARS_SUBSTATUS4
	call CleanGetBattleVarPair
	bit 4, a
	jr nz, .asm_36ef4 ; 36e97 $5b
	ld a, [hli]
	ld b, [hl]
	srl a
	rr b
	srl a
	rr b
	dec hl
	dec hl
	ld a, b
	ld [de], a
	ld a, [hld]
	sub b
	ld e, a
	ld a, [hl]
	sbc $0
	ld d, a
	jr c, .asm_36eff ; 36eae $4f
	ld a, d
	or e
	jr z, .asm_36eff ; 36eb2 $4b
	ld [hl], d
	inc hl
	ld [hl], e
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarPair
	set 4, [hl]
	ld hl, $c730
	ld de, $c72e
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36ecf ; 36ec7 $6
	ld hl, $c731
	ld de, $c72f
.asm_36ecf
	xor a
	ld [hl], a
	ld [de], a
	call Function0x37ed5
	jr c, .asm_36ee8 ; 36ed5 $11
	xor a
	ld [$cfca], a
	ld [FXAnimIDHi], a
	ld [$c689], a
	ld a, $a4
	call Function0x37e44
	jr .asm_36eeb ; 36ee6 $3
.asm_36ee8
	call BattleCommanda6
.asm_36eeb
	ld hl, MadeSubstituteText
	call FarBattleTextBox
	jp RefreshBattleHuds
.asm_36ef4
	call Function0x34548
	call nz, BattleCommand0c
	ld hl, HasSubstituteText
	jr .asm_36f08 ; 36efd $9
.asm_36eff
	call Function0x34548
	call nz, BattleCommand0c
	ld hl, TooWeakSubText
.asm_36f08
	jp FarBattleTextBox
; 36f0b

BattleCommand32: ; 36f0b
; rechargenextturn
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarPair
	set 5, [hl]
	ret
; 36f13


EndRechargeOpp: ; 36f13
	push hl
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVarPair
	res 5, [hl]
	pop hl
	ret
; 36f1d


BattleCommand97: ; 36f1d
; rage
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarPair
	set 6, [hl]
	ret
; 36f25


BattleCommand98: ; 36f25
; doubleflyingdamage
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call CleanGetBattleVarPair
	bit 6, a ; flying
	ret z
	jr DoubleDamage
; 36f2f


BattleCommand99: ; 36f2f
; doubleundergrounddamage
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call CleanGetBattleVarPair
	bit 5, a ; underground
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


BattleCommand33: ; 36f46
; mimic

	call Function0x372d8
	call BattleCommandaa
	ld a, [AttackMissed]
	and a
	jr nz, .asm_36f9a ; 36f50 $48
	ld hl, BattleMonMoves
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36f5d ; 36f58 $3
	ld hl, EnemyMonMoves
.asm_36f5d
	call CheckHiddenOpponent
	jr nz, .asm_36f9a ; 36f60 $38
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call CleanGetBattleVarPair
	and a
	jr z, .asm_36f9a ; 36f68 $30
	cp $a5
	jr z, .asm_36f9a ; 36f6c $2c
	ld b, a
	ld c, $4
.asm_36f71
	ld a, [hli]
	cp b
	jr z, .asm_36f9a ; 36f73 $25
	dec c
	jr nz, .asm_36f71 ; 36f76 $f9
	dec hl
.asm_36f79
	ld a, [hld]
	cp $66
	jr nz, .asm_36f79 ; 36f7c $fb
	inc hl
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call CleanGetBattleVarPair
	ld [hl], a
	ld [$d265], a
	ld bc, $0006
	add hl, bc
	ld [hl], $5
	call GetMoveName
	call Function0x37e01
	ld hl, LearnedMoveText
	jp FarBattleTextBox
.asm_36f9a
	jp Function0x37357
; 36f9d


BattleCommand35: ; 36f9d
; leechseed
	ld a, [AttackMissed]
	and a
	jr nz, .asm_36fd8 ; 36fa1 $35
	call CheckSubstituteOpp
	jr nz, .asm_36fd8 ; 36fa6 $30
	ld de, EnemyMonType1
	ld a, [hBattleTurn]
	and a
	jr z, .asm_36fb3 ; 36fae $3
	ld de, BattleMonType1
.asm_36fb3
	ld a, [de]
	cp $16
	jr z, .asm_36fd2 ; 36fb6 $1a
	inc de
	ld a, [de]
	cp $16
	jr z, .asm_36fd2 ; 36fbc $14
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVarPair
	bit 7, [hl]
	jr nz, .asm_36fd8 ; 36fc5 $11
	set 7, [hl]
	call Function0x37e01
	ld hl, WasSeededText
	jp FarBattleTextBox
.asm_36fd2
	call Function0x37e77
	jp PrintDoesntAffect
.asm_36fd8
	call Function0x37e77
	ld hl, EvadedText
	jp FarBattleTextBox
; 36fe1


BattleCommand36: ; 36fe1
	call Function0x37e01
	ld a, $41
	ld hl, $60e5
	rst FarCall
	jp PrintNothingHappened
; 36fed


BattleCommand37: ; 36fed
; disable

	ld a, [AttackMissed]
	and a
	jr nz, .asm_37059 ; 36ff1 $66
	ld de, EnemyDisableCount
	ld hl, EnemyMonMoves
	ld a, [hBattleTurn]
	and a
	jr z, .asm_37004 ; 36ffc $6
	ld de, PlayerDisableCount
	ld hl, BattleMonMoves
.asm_37004
	ld a, [de]
	and a
	jr nz, .asm_37059 ; 37006 $51
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call CleanGetBattleVarPair
	and a
	jr z, .asm_37059 ; 3700e $49
	cp $a5
	jr z, .asm_37059 ; 37012 $45
	ld b, a
	ld c, $ff
.asm_37017
	inc c
	ld a, [hli]
	cp b
	jr nz, .asm_37017 ; 3701a $fb
	ld a, [hBattleTurn]
	and a
	ld hl, EnemyMonPPMove1
	jr z, .asm_37027 ; 37022 $3
	ld hl, BattleMonPP
.asm_37027
	ld b, $0
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_37059 ; 3702c $2b
.asm_3702e
	call FarBattleRNG
	and $7
	jr z, .asm_3702e ; 37033 $f9
	inc a
	inc c
	swap c
	add c
	ld [de], a
	call Function0x37e01
	ld hl, DisabledMove
	ld a, [hBattleTurn]
	and a
	jr nz, .asm_37047 ; 37044 $1
	inc hl
.asm_37047
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call CleanGetBattleVarPair
	ld [hl], a
	ld [$d265], a
	call GetMoveName
	ld hl, WasDisabledText
	jp FarBattleTextBox
.asm_37059
	jp Function0x37354
; 3705c


BattleCommand1e: ; 3705c
; payday

	xor a
	ld hl, StringBuffer1
	ld [hli], a
	ld a, [hBattleTurn]
	and a
	ld a, [BattleMonLevel]
	jr z, .asm_3706c ; 37067 $3
	ld a, [EnemyMonLevel]
.asm_3706c
	add a
	ld hl, $c6ee
	add [hl]
	ld [hld], a
	jr nc, .asm_37079 ; 37072 $5
	inc [hl]
	dec hl
	jr nz, .asm_37079 ; 37076 $1
	inc [hl]
.asm_37079
	ld hl, CoinsScatteredText
	jp FarBattleTextBox
; 3707f


BattleCommand1f: ; 3707f
; conversion

	ld hl, BattleMonMoves
	ld de, BattleMonType1
	ld a, [hBattleTurn]
	and a
	jr z, .asm_37090 ; 37088 $6
	ld hl, EnemyMonMoves
	ld de, EnemyMonType1
.asm_37090
	push de
	ld c, $0
	ld de, StringBuffer1
.asm_37096
	push hl
	ld b, $0
	add hl, bc
	ld a, [hl]
	pop hl
	and a
	jr z, .asm_370b2 ; 3709d $13
	push hl
	push bc
	dec a
	ld hl, Moves + PlayerMoveType - PlayerMoveStruct
	call GetMoveAttr
	ld [de], a
	inc de
	pop bc
	pop hl
	inc c
	ld a, c
	cp $4
	jr c, .asm_37096 ; 370b0 $e4
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
	jr z, .asm_370d3 ; 370c0 $11
	cp $13
	jr z, .asm_370d0 ; 370c4 $a
	ld a, [de]
	cp [hl]
	jr z, .asm_370d0 ; 370c8 $6
	inc de
	ld a, [de]
	dec de
	cp [hl]
	jr nz, .asm_370d9 ; 370ce $9
.asm_370d0
	inc hl
	jr .asm_370bd ; 370d1 $ea
.asm_370d3
	call Function0x37e77
	jp PrintButItFailed
.asm_370d9
	call FarBattleRNG
	and $3
	ld c, a
	ld b, $0
	ld hl, StringBuffer1
	add hl, bc
	ld a, [hl]
	cp $ff
	jr z, .asm_370d9 ; 370e8 $ef
	cp $13
	jr z, .asm_370d9 ; 370ec $eb
	ld a, [de]
	cp [hl]
	jr z, .asm_370d9 ; 370f0 $e7
	inc de
	ld a, [de]
	dec de
	cp [hl]
	jr z, .asm_370d9 ; 370f6 $e1
	ld a, [hl]
	ld [de], a
	inc de
	ld [de], a
	ld [$d265], a
	ld a, $14
	ld hl, $4964
	rst FarCall
	call Function0x37e01
	ld hl, TransformedTypeText
	jp FarBattleTextBox
; 3710e


BattleCommand20: ; 3710e
; resetstats

	ld a, 7 ; neutral
	ld hl, PlayerStatLevels
	call .Fill
	ld hl, EnemyStatLevels
	call .Fill

	ld a, [hBattleTurn]
	push af

	call SetPlayerTurn
	call Function0x365d7
	call SetEnemyTurn
	call Function0x365fd

	pop af
	ld [hBattleTurn], a

	call Function0x37e01

	ld hl, EliminatedStatsText
	jp FarBattleTextBox

.Fill
	ld b, PlayerStatLevelsEnd - PlayerStatLevels
.asm_37139
	ld [hli], a
	dec b
	jr nz, .asm_37139
	ret
; 3713e


BattleCommand2c: ; 3713e
; heal

	ld de, BattleMonHP
	ld hl, BattleMonMaxHP
	ld a, [hBattleTurn]
	and a
	jr z, .asm_3714f ; 37147 $6
	ld de, EnemyMonHPHi
	ld hl, EnemyMonMaxHPHi
.asm_3714f
	ld a, BATTLE_VARS_MOVE_ANIM
	call CleanGetBattleVarPair
	ld b, a
	push hl
	push de
	push bc
	ld c, $2
	call StringCmp
	pop bc
	pop de
	pop hl
	jp z, .asm_371c4
	ld a, b
	cp $9c
	jr nz, .asm_37199 ; 37166 $31
	push hl
	push de
	push af
	call BattleCommandaa
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarPair
	res 0, [hl]
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarPair
	ld a, [hl]
	and a
	ld [hl], $3
	ld hl, WentToSleepText
	jr z, .asm_37186 ; 37181 $3
	ld hl, RestedText
.asm_37186
	call FarBattleTextBox
	ld a, [hBattleTurn]
	and a
	jr nz, .asm_37193 ; 3718c $5
	call Function0x365d7
	jr .asm_37196 ; 37191 $3
.asm_37193
	call Function0x365fd
.asm_37196
	pop af
	pop de
	pop hl
.asm_37199
	jr z, .asm_371a3 ; 37199 $8
	ld hl, $4c9f
	call CallBankF
	jr .asm_371a9 ; 371a1 $6
.asm_371a3
	ld hl, $4cac
	call CallBankF
.asm_371a9
	call Function0x37e01
	call SwitchTurn
	ld hl, $4cef
	call CallBankF
	call SwitchTurn
	call UpdateUserInParty
	call RefreshBattleHuds
	ld hl, RegainedHealthText
	jp FarBattleTextBox

.asm_371c4
	call Function0x37e77
	ld hl, HPIsFullText
	jp FarBattleTextBox
; 371cd


BattleCommand2d: ; 371cd
; transform

	call Function0x372d8
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarPair
	bit 3, [hl]
	jp nz, Function0x372d2
	call CheckHiddenOpponent
	jp nz, Function0x372d2
	xor a
	ld [$cfca], a
	ld [FXAnimIDHi], a
	ld a, $1
	ld [$c689], a
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarPair
	bit 4, [hl]
	push af
	jr z, .asm_37200 ; 371f4 $a
	call Function0x34548
	jr nz, .asm_37200 ; 371f9 $5
	ld a, $a4
	call Function0x37e44
.asm_37200
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarPair
	set 3, [hl]
	call Function0x372e7
	ld hl, BattleMonSpecies
	ld de, EnemyMonSpecies
	ld a, [hBattleTurn]
	and a
	jr nz, .asm_3721f ; 37213 $a
	ld hl, EnemyMonSpecies
	ld de, BattleMonSpecies
	xor a
	ld [CurMoveNum], a
.asm_3721f
	push hl
	ld a, [hli]
	ld [de], a
	inc hl
	inc de
	inc de
	ld bc, $0004
	call $3026
	ld a, [hBattleTurn]
	and a
	jr z, .asm_3723a ; 3722e $a
	ld a, [de]
	ld [$c6f2], a
	inc de
	ld a, [de]
	ld [$c6f3], a
	dec de
.asm_3723a
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld bc, $000c
	add hl, bc
	push hl
	ld h, d
	ld l, e
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld bc, $000c
	call $3026
	ld bc, $ffe2
	add hl, bc
	push de
	ld d, h
	ld e, l
	pop hl
	ld bc, $ffe8
	add hl, bc
	ld b, $4
.asm_3725f
	ld a, [de]
	inc de
	and a
	jr z, .asm_3726c ; 37262 $8
	cp $a6
	ld a, $1
	jr z, .asm_3726c ; 37268 $2
	ld a, $5
.asm_3726c
	ld [hli], a
	dec b
	jr nz, .asm_3725f ; 3726e $ef
	pop hl
	ld a, [hl]
	ld [$d265], a
	call $343b
	ld hl, EnemyStats
	ld de, PlayerStats
	ld bc, $000a
	call BattleSideCopy
	ld hl, EnemyStatLevels
	ld de, PlayerStatLevels
	ld bc, $0008
	call BattleSideCopy
	call Function0x37ed5
	jr c, .asm_372a8 ; 37293 $13
	ld a, [hBattleTurn]
	and a
	ld a, [$c6fe]
	jr z, .asm_372a0 ; 3729b $3
	ld a, [$c6fa]
.asm_372a0
	and a
	jr nz, .asm_372a8 ; 372a1 $5
	call Function0x37e36
	jr .asm_372ae ; 372a6 $6
.asm_372a8
	call BattleCommandaa
	call BattleCommanda6
.asm_372ae
	xor a
	ld [$cfca], a
	ld [FXAnimIDHi], a
	ld a, $2
	ld [$c689], a
	pop af
	ld a, $a4
	call nz, Function0x37e44
	ld hl, TransformedText
	jp FarBattleTextBox
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


Function0x372d2: ; 372d2
	call Function0x37e77
	jp PrintButItFailed
; 372d8


Function0x372d8: ; 372d8
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE
	call GetBattleVarPair
	xor a
	ld [hl], a

	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarPair
	xor a
	ld [hl], a
	ret
; 372e7


Function0x372e7: ; 372e7
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


BattleCommand2e: ; 372fc
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
	call CleanGetBattleVarPair
	cp EFFECT_LIGHT_SCREEN
	jr nz, .Reflect

	bit 3, [hl]
	jr nz, .asm_37337
	set 3, [hl]
	ld a, $5
	ld [bc], a
	ld hl, LightScreenEffectText
	jr .asm_37331

.Reflect
	bit 4, [hl]
	jr nz, .asm_37337
	set 4, [hl]

; LightScreenCount -> ReflectCount
	inc bc

	ld a, $5
	ld [bc], a
	ld hl, ReflectEffectText

.asm_37331
	call Function0x37e01
	jp FarBattleTextBox

.asm_37337
	call Function0x37e77
	jp PrintButItFailed
; 3733d


PrintDoesntAffect: ; 3733d
; 'it doesn't affect'
	ld hl, DoesntAffectText
	jp FarBattleTextBox
; 37343


PrintNothingHappened: ; 37343
; 'but nothing happened!'
	ld hl, NothingHappenedText
	jp FarBattleTextBox
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
	jp FarBattleTextBox
; 37354


Function0x37354: ; 37354
	call Function0x37e77
	; fallthrough
; 37357

Function0x37357: ; 37357
	ld hl, ButItFailedText ; 'but it failed!'
	ld de, ItFailedText    ; 'it failed!'
	jp Function0x35157
; 37360


PrintDidntAffect: ; 37360
; 'it didn't affect'
	ld hl, DidntAffect1Text
	jp FarBattleTextBox
; 37366


PrintDidntAffect2: ; 37366
	call Function0x37e77
	ld hl, DidntAffect1Text ; 'it didn't affect'
	ld de, DidntAffect2Text ; 'it didn't affect'
	jp Function0x35157
; 37372


PrintParalyze: ; 37372
; 'paralyzed! maybe it can't attack!'
	ld hl, ParalyzedText
	jp FarBattleTextBox
; 37378


CheckSubstituteOpp: ; 37378
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call CleanGetBattleVarPair
	bit 4, a
	ret
; 37380


BattleCommand1a: ; 37380
	ld a, $41
	ld hl, $610d
	rst FarCall
	ld a, $4
	ld [$cfca], a
	ld c, $3
	call DelayFrames
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarPair
	xor a
	ld [hli], a
	inc hl
	ld [hli], a
	ld [hl], a
	ld a, $1
	ld [$c689], a
	call BattleCommand0a
	call Function0x37e36
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarPair
	res 7, [hl]
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarPair
	res 6, [hl]
	call Function0x37ed5
	ret nc
	ld a, $f
	ld hl, $5f58
	rst FarCall
	ld a, $f
	ld hl, $6043
	rst FarCall
	call $31f6
	jp RefreshBattleHuds
; 373c9


BattleCommand1b: ; 373c9
; mirrormove

	call Function0x372d8
	ld a, BATTLE_VARS_MOVE
	call GetBattleVarPair
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call CleanGetBattleVarPair
	and a
	jr z, .asm_373de ; 373d7 $5
	call CheckUserMove
	jr nz, .asm_373ea ; 373dc $c
.asm_373de
	call Function0x37e77
	ld hl, MirrorMoveFailedText
	call FarBattleTextBox
	jp EndMoveEffect
.asm_373ea
	ld a, b
	ld [hl], a
	ld [$d265], a
	push af
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarPair
	ld d, h
	ld e, l
	pop af
	dec a
	call GetMoveData
	call GetMoveName
	call $30d6
	call Function0x34548
	jr nz, .asm_37412 ; 37405 $b
	ld a, [$c689]
	push af
	call BattleCommand0a
	pop af
	ld [$c689], a
.asm_37412
	call BattleCommandaa
	jp ResetTurn
; 37418


BattleCommand34: ; 37418
; metronome

	call Function0x372d8
	call Function0x34548
	jr nz, .asm_3742b

	ld a, [$c689]
	push af
	call BattleCommand0a
	pop af
	ld [$c689], a

.asm_3742b
	call Function0x37e36

.GetMove
	call FarBattleRNG

; No invalid moves.
	cp BEAT_UP + 1
	jr nc, .GetMove

; None of the moves in MetronomeExcepts.
	push af
	ld de, 1
	ld hl, MetronomeExcepts
	call IsInArray
	pop bc
	jr c, .GetMove

; No moves the user already has.
	ld a, b
	call CheckUserMove
	jr z, .GetMove


	ld a, BATTLE_VARS_MOVE
	call GetBattleVarPair
	ld [hl], b
	call UpdateMoveData
	jp ResetTurn
; 37454


MetronomeExcepts: ; 37454
	db $00
	db METRONOME
	db STRUGGLE
	db SKETCH
	db MIMIC
	db COUNTER
	db MIRROR_COAT
	db PROTECT
	db DETECT
	db ENDURE
	db DESTINY_BOND
	db SLEEP_TALK
	db THIEF
	db $ff
; 37462


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
	ld hl, $c732
	ld a, [hBattleTurn]
	and a
	jr z, .asm_37486
	ld hl, $c733

.asm_37486
	ld [hl], 1
	xor a
	ld [AlreadyDisobeyed], a
	call DoMove
	jp EndMoveEffect
; 37492


BattleCommand50: ; 37492
; thief

	ld a, [hBattleTurn]
	and a
	jr nz, .asm_374ce ; 37495 $37
	call .asm_37501
	ld a, [hl]
	and a
	ret nz
	call .asm_3750c
	ld a, [hl]
	and a
	ret z
	ld [$d265], a
	ld d, a
	ld a, $2e
	ld hl, $5e76
	rst FarCall
	ret c
	ld a, [EffectFailed]
	and a
	ret nz
	ld a, [InLinkBattle]
	and a
	jr z, .asm_374be ; 374b7 $5
	ld a, [IsInBattle]
	dec a
	ret z
.asm_374be
	call .asm_3750c
	xor a
	ld [hl], a
	ld [de], a
	call .asm_37501
	ld a, [$d265]
	ld [hl], a
	ld [de], a
	jr .asm_374f8 ; 374cc $2a
.asm_374ce
	call .asm_3750c
	ld a, [hl]
	and a
	ret nz
	call .asm_37501
	ld a, [hl]
	and a
	ret z
	ld [$d265], a
	ld d, a
	ld a, $2e
	ld hl, $5e76
	rst FarCall
	ret c
	ld a, [EffectFailed]
	and a
	ret nz
	call .asm_37501
	xor a
	ld [hl], a
	ld [de], a
	call .asm_3750c
	ld a, [$d265]
	ld [hl], a
	ld [de], a
.asm_374f8
	call GetItemName
	ld hl, StoleText
	jp FarBattleTextBox

.asm_37501
	ld a, 1
	call BattlePartyAttr
	ld d, h
	ld e, l
	ld hl, BattleMonItem
	ret

.asm_3750c
	ld a, 1
	call $396d ; GetOTStat_Battle
	ld d, h
	ld e, l
	ld hl, EnemyMonItem
	ret
; 37517


BattleCommand51: ; 37517
; arenatrap
	call CheckHiddenOpponent
	jr nz, .asm_37530 ; 3751a $14
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarPair
	bit 7, [hl]
	jr nz, .asm_37530 ; 37523 $b
	set 7, [hl]
	call Function0x37e01
	ld hl, CantEscapeNowText
	jp FarBattleTextBox
.asm_37530
	call Function0x37e77
	jp PrintButItFailed
; 37536


BattleCommand52: ; 37536
; nightmare

	call CheckHiddenOpponent
	jr nz, .asm_3755d ; 37539 $22
	call CheckSubstituteOpp
	jr nz, .asm_3755d ; 3753e $1d
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarPair
	and $7
	jr z, .asm_3755d ; 37547 $14
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVarPair
	bit 0, [hl]
	jr nz, .asm_3755d ; 37550 $b
	set 0, [hl]
	call Function0x37e01
	ld hl, StartedNightmareText
	jp FarBattleTextBox
.asm_3755d
	call Function0x37e77
	jp PrintButItFailed
; 37563


BattleCommand53: ; 37563
; defrost

	ld a, BATTLE_VARS_STATUS
	call GetBattleVarPair
	bit 5, [hl]
	ret z
	res 5, [hl]
	ld a, [hBattleTurn]
	and a
	jr z, .asm_37578 ; 37570 $6
	ld a, [IsInBattle]
	dec a
	jr z, .asm_3757f ; 37576 $7
.asm_37578
	ld a, $20
	call UserPartyAttr
	res 5, [hl]
.asm_3757f
	call RefreshBattleHuds
	ld hl, WasDefrostedText
	jp FarBattleTextBox
; 37588


BattleCommand54: ; 37588
; curse

	ld de, BattleMonType1
	ld bc, PlayerStatLevels
	ld a, [hBattleTurn]
	and a
	jr z, .asm_37599 ; 37591 $6
	ld de, EnemyMonType1
	ld bc, EnemyStatLevels
.asm_37599
	ld a, [de]
	cp $8
	jr z, .asm_375d7 ; 3759c $39
	inc de
	ld a, [de]
	cp $8
	jr z, .asm_375d7 ; 375a2 $33
	ld a, [bc]
	cp $d
	jr c, .asm_375af ; 375a7 $6
	inc bc
	ld a, [bc]
	cp $d
	jr nc, .asm_3760a ; 375ad $5b
.asm_375af
	ld a, $1
	ld [$c689], a
	call Function0x37e01
	ld a, $2
	call Function0x36532
	call SwitchTurn
	call BattleCommand8d
	call ResetMiss
	call SwitchTurn
	call BattleCommand70
	call BattleCommand8c
	call ResetMiss
	call BattleCommand71
	jp BattleCommand8c
.asm_375d7
	call CheckHiddenOpponent
	jr nz, .asm_37604 ; 375da $28
	call CheckSubstituteOpp
	jr nz, .asm_37604 ; 375df $23
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVarPair
	bit 1, [hl]
	jr nz, .asm_37604 ; 375e8 $1a
	set 1, [hl]
	call Function0x37e01
	ld hl, $4c9f
	call CallBankF
	ld hl, $4c3f
	call CallBankF
	call UpdateUserInParty
	ld hl, PutACurseText
	jp FarBattleTextBox
.asm_37604
	call Function0x37e77
	jp PrintButItFailed
.asm_3760a
	ld b, $8
	call GetStatName
	call Function0x37e77
	ld hl, WontRiseAnymoreText
	jp FarBattleTextBox
; 37618


BattleCommand55: ; 37618
; protect

	call Function0x3762c
	ret c
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarPair
	set 2, [hl]
	call Function0x37e01
	ld hl, ProtectedItselfText
	jp FarBattleTextBox
; 3762c


Function0x3762c: ; 3762c
	ld de, $c679
	ld a, [hBattleTurn]
	and a
	jr z, .asm_37637
	ld de, $c681

.asm_37637
	call Function0x36abf
	jr nz, .asm_37665

	ld a, $3
	call CleanGetBattleVarPair
	bit 4, a
	jr nz, .asm_37665

	ld b, $ff
	ld a, [de]
	ld c, a
.asm_37649
	ld a, c
	and a
	jr z, .asm_37656

	dec c
	srl b
	ld a, b
	and a
	jr nz, .asm_37649

	jr .asm_37665

.asm_37656
	call FarBattleRNG
	and a
	jr z, .asm_37656

	dec a
	cp b
	jr nc, .asm_37665

	ld a, [de]
	inc a
	ld [de], a
	and a
	ret

.asm_37665
	xor a
	ld [de], a
	call Function0x37e77
	call PrintButItFailed
	scf
	ret
; 3766f


BattleCommand5a: ; 3766f
; endure

	call Function0x3762c
	ret c

	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarPair
	set SUBSTATUS_ENDURE, [hl]
	call Function0x37e01
	ld hl, BracedItselfText
	jp FarBattleTextBox
; 37683


BattleCommand56: ; 37683
; spikes

	ld hl, EnemyScreens
	ld a, [hBattleTurn]
	and a
	jr z, .asm_3768e
	ld hl, PlayerScreens

.asm_3768e
	bit 0, [hl]
	jr nz, .failed

	set 0, [hl]
	call Function0x37e01
	ld hl, SpikesText
	jp FarBattleTextBox

.failed
	jp Function0x37354
; 376a0


BattleCommand57: ; 376a0
; foresight

	ld a, [AttackMissed]
	and a
	jr nz, .asm_376bf
	call CheckHiddenOpponent
	jr nz, .asm_376bf
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVarPair
	bit SUBSTATUS_IDENTIFIED, [hl]
	jr nz, .asm_376bf
	set SUBSTATUS_IDENTIFIED, [hl]
	call Function0x37e01
	ld hl, IdentifiedText
	jp FarBattleTextBox
.asm_376bf
	jp Function0x37354
; 376c2


BattleCommand58: ; 376c2
; perishsong

	ld hl, PlayerSubStatus1
	ld de, EnemySubStatus1
	bit SUBSTATUS_PERISH, [hl]
	jr z, .asm_376d1
	ld a, [de]
	bit SUBSTATUS_PERISH, a
	jr nz, .asm_376f2
.asm_376d1
	bit SUBSTATUS_PERISH, [hl]
	jr nz, .asm_376dc
	set SUBSTATUS_PERISH, [hl]
	ld a, 4
	ld [PlayerPerishCount], a
.asm_376dc
	ld a, [de]
	bit SUBSTATUS_PERISH, a
	jr nz, .asm_376e9
	set SUBSTATUS_PERISH, a
	ld [de], a
	ld a, 4
	ld [EnemyPerishCount], a
.asm_376e9
	call Function0x37e01
	ld hl, StartPerishText
	jp FarBattleTextBox
.asm_376f2
	call Function0x37e77
	jp PrintButItFailed
; 376f8


BattleCommand59: ; 376f8
; startsandstorm

	ld a, [Weather]
	cp WEATHER_SANDSTORM
	jr z, .asm_37712
	ld a, WEATHER_SANDSTORM
	ld [Weather], a
	ld a, 5
	ld [WeatherCount], a
	call Function0x37e01
	ld hl, SandstormBrewedText
	jp FarBattleTextBox
.asm_37712
	call Function0x37e77
	jp PrintButItFailed
; 37718


BattleCommand5b: ; 37718
; checkcurl

	ld de, PlayerRolloutCount
	ld a, [hBattleTurn]
	and a
	jr z, .asm_37723
	ld de, EnemyRolloutCount
.asm_37723
	ld a, BATTLE_VARS_SUBSTATUS1
	call CleanGetBattleVarPair
	bit SUBSTATUS_ENCORED, a
	jr z, .asm_37731

	ld b, $4 ; doturn
	jp SkipToBattleCommand

.asm_37731
	xor a
	ld [de], a
	ret
; 37734


BattleCommand5c: ; 37734
; rolloutpower

	ld a, BATTLE_VARS_STATUS
	call CleanGetBattleVarPair
	and 7
	ret nz

	ld hl, PlayerRolloutCount
	ld a, [hBattleTurn]
	and a
	jr z, .asm_37747
	ld hl, EnemyRolloutCount

.asm_37747
	ld a, [hl]
	and a
	jr nz, .asm_37750
	ld a, 1
	ld [$c73e], a

.asm_37750
	ld a, [AttackMissed]
	and a
	jr z, .hit

	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarPair
	res 6, [hl]
	ret

.hit
	inc [hl]
	ld a, [hl]
	ld b, a
	cp $5
	jr c, .asm_3776e ; 37763 $9
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarPair
	res 6, [hl]
	jr .asm_37775 ; 3776c $7

.asm_3776e
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarPair
	set 6, [hl]

.asm_37775
	ld a, BATTLE_VARS_SUBSTATUS2
	call CleanGetBattleVarPair
	bit 0, a
	jr z, .asm_3777f ; 3777c $1
	inc b
.asm_3777f
	dec b
	jr z, .asm_37790 ; 37780 $e
	ld hl, CurDamage + 1
	sla [hl]
	dec hl
	rl [hl]
	jr nc, .asm_3777f ; 3778a $f3
	ld a, $ff
	ld [hli], a
	ld [hl], a
.asm_37790
	ret
; 37791


BattleCommand5d: ; 37791
; unused
	ret
; 37792


BattleCommand5e: ; 37792
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


BattleCommand5f: ; 377ce
; attract
	ld a, [AttackMissed]
	and a
	jr nz, .asm_377f2
	call Function0x377f5
	jr c, .asm_377f2
	call CheckHiddenOpponent
	jr nz, .asm_377f2
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVarPair
	bit 7, [hl]
	jr nz, .asm_377f2

	set 7, [hl]
	call Function0x37e01

; 'fell in love!'
	ld hl, FellInLoveText
	jp FarBattleTextBox

.asm_377f2
	jp Function0x37354
; 377f5


Function0x377f5: ; 377f5
	ld a, 0
	call BattlePartyAttr
	ld a, [hl]
	ld [CurPartySpecies], a

	ld a, [CurBattleMon]
	ld [CurPartyMon], a
	xor a
	ld [MonType], a

	ld a, $14
	ld hl, $4bdd
	rst FarCall
	jr c, .asm_37849

	ld b, 1
	jr nz, .asm_37815
	dec b

.asm_37815
	push bc
	ld a, [TempEnemyMonSpecies]
	ld [CurPartySpecies], a
	ld hl, EnemyMonAtkDefDV
	ld a, [EnemySubStatus5]
	bit 3, a
	jr z, .asm_37829
	ld hl, $c6f2

.asm_37829
	ld a, [hli]
	ld [$d123], a
	ld a, [hl]
	ld [$d124], a
	ld a, 3
	ld [MonType], a
	ld a, $14
	ld hl, $4bdd
	rst FarCall
	pop bc
	jr c, .asm_37849

	ld a, 1
	jr nz, .asm_37844
	dec a

.asm_37844
	xor b
	jr z, .asm_37849

	and a
	ret

.asm_37849
	scf
	ret
; 3784b


BattleCommand60: ; 3784b
; happinesspower
	push bc
	ld hl, BattleMonHappiness
	ld a, [hBattleTurn]
	and a
	jr z, .asm_37857 ; 37852 $3
	ld hl, EnemyMonHappiness
.asm_37857
	xor a
	ld [$ffb4], a
	ld [$ffb5], a
	ld a, [hl]
	ld [$ffb6], a
	ld a, $a
	ld [$ffb7], a
	call Multiply
	ld a, $19
	ld [$ffb7], a
	ld b, $4
	call Divide
	ld a, [$ffb6]
	ld d, a
	pop bc
	ret
; 37874


BattleCommand61: ; 37874
; present

	ld a, [InLinkBattle]
	cp $3
	jr z, .asm_3787d ; 37879 $2
	push bc
	push de
.asm_3787d
	call BattleCommand07
	ld a, [InLinkBattle]
	cp $3
	jr z, .asm_37889 ; 37885 $2
	pop de
	pop bc
.asm_37889
	ld a, [$d265]
	and a
	jp z, Function0x37e77
	ld a, [AttackMissed]
	and a
	jp nz, Function0x37e77
	push bc
	call FarBattleRNG
	ld b, a
	ld hl, .table_37907
	ld c, 0
.asm_378a1
	ld a, [hli]
	cp $ff
	jr z, .asm_378b7 ; 378a4 $11
	cp b
	jr nc, .asm_378ad ; 378a7 $4
	inc c
	inc hl
	jr .asm_378a1 ; 378ab $f4
.asm_378ad
	ld a, c
	ld [$c689], a
	call Function0x37de9
	ld d, [hl]
	pop bc
	ret
.asm_378b7
	pop bc
	ld a, $3
	ld [$c689], a
	call Function0x37e01
	call SwitchTurn
	ld hl, $5246
	ld a, [hBattleTurn]
	and a
	jr z, .asm_378ce ; 378c9 $3
	ld hl, $5251
.asm_378ce
	ld a, $e
	rst FarCall
	jr c, .asm_378f3 ; 378d1 $20
	ld hl, $4c8e
	call CallBankF
	call SwitchTurn
	ld hl, $4cef
	call CallBankF
	call SwitchTurn
	ld hl, RegainedHealthText
	call FarBattleTextBox
	call SwitchTurn
	call UpdateOpponentInParty
	jr .asm_37904 ; 378f1 $11
.asm_378f3
	call SwitchTurn
	call Function0x37ed5
	jr nc, .asm_37904 ; 378f9 $9
	call Function0x37e77
	ld hl, RefusedGiftText
	call FarBattleTextBox
.asm_37904
	jp EndMoveEffect

.table_37907
	db $66,  40
	db $b3,  80
	db $cc, 120
	db $ff
; 3790e


BattleCommand63: ; 3790e
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
	ld [$ffb6], a
	xor a
	ld [$ffb4], a
	ld [$ffb5], a
	ld a, $a
	ld [$ffb7], a
	call Multiply
	ld a, $19
	ld [$ffb7], a
	ld b, $4
	call Divide
	ld a, [$ffb6]
	ld d, a
	pop bc
	ret
; 37939


BattleCommand64: ; 37939
; safeguard

	ld hl, PlayerScreens
	ld de, $c701
	ld a, [hBattleTurn]
	and a
	jr z, .asm_3794a ; 37942 $6
	ld hl, EnemyScreens
	ld de, $c705
.asm_3794a
	bit 2, [hl]
	jr nz, .asm_3795c ; 3794c $e
	set 2, [hl]
	ld a, $5
	ld [de], a
	call Function0x37e01
	ld hl, CoveredByVeilText
	jp FarBattleTextBox
.asm_3795c
	call Function0x37e77
	jp PrintButItFailed
; 37962


Function0x37962: ; 37962
	push hl
	ld hl, EnemyScreens
	ld a, [hBattleTurn]
	and a
	jr z, .asm_3796e
	ld hl, PlayerScreens

.asm_3796e
	bit 2, [hl]
	pop hl
	ret
; 37972


BattleCommand65: ; 37972
; checksafeguard
	ld hl, EnemyScreens
	ld a, [hBattleTurn]
	and a
	jr z, .asm_3797d ; 37978 $3
	ld hl, PlayerScreens
.asm_3797d
	bit 2, [hl]
	ret z
	ld a, $1
	ld [AttackMissed], a
	call BattleCommandaa
	ld hl, SafeguardProtectText
	call FarBattleTextBox
	jp EndMoveEffect
; 37991


BattleCommand66: ; 37991
; getmagnitude

	push bc
	call FarBattleRNG
	ld b, a
	ld hl, .Magnitudes
.asm_37999
	ld a, [hli]
	cp b
	jr nc, .asm_379a1 ; 3799b $4
	inc hl
	inc hl
	jr .asm_37999 ; 3799f $f8
.asm_379a1
	ld d, [hl]
	push de
	inc hl
	ld a, [hl]
	ld [$d265], a
	call BattleCommandaa
	ld hl, MagnitudeText
	call FarBattleTextBox
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


BattleCommand67: ; 379c9
; batonpass

	ld a, [hBattleTurn]
	and a
	jp nz, .Enemy

	call Function0x37ae9
	jp z, Function0x37aab

	call UpdateBattleMonInParty
	call Function0x37e01

	ld c, 50
	call DelayFrames

	call $1d6e

	ld a, $f
	ld hl, $52f7
	rst FarCall

	ld a, $f
	ld hl, $5380
	rst FarCall

	call $3317

	ld a, $f
	ld hl, $6d9f
	rst FarCall

	call $1c17
	call $300b

	ld hl, $c4a1
	ld bc, $040a
	call ClearBox

	ld b, 1
	call $3340
	call $32f9
	call Function0x37a67

	ld a, $f
	ld hl, $52e0
	rst FarCall

	jp c, EndMoveEffect

	ld hl, $6459
	call CallBankF
	call Function0x37ab1

	ret

.Enemy
	ld a, [IsInBattle]
	dec a
	jp z, Function0x37aab

	call Function0x37af6
	jp z, Function0x37aab

	call UpdateEnemyMonInParty
	call Function0x37e01
	call Function0x37a82

	ld a, $f
	ld hl, $52e0
	rst FarCall
	jp c, EndMoveEffect

	xor a
	ld [$c718], a

	ld hl, $5517
	call CallBankF

	ld hl, $557a
	call CallBankF

	ld a, 1
	ld [$d265], a

	ld hl, $6cab
	call CallBankF

	ld hl, $5c23
	call CallBankF

	jr Function0x37ab1
; 37a67


Function0x37a67: ; 37a67
	ld a, [InLinkBattle]
	and a
	ret z

	ld a, 1
	ld [$d0ec], a

	call $1d6e

	ld hl, $68e4
	call CallBankF

	call $1c17

	xor a
	ld [$d0ec], a

	ret
; 37a82


Function0x37a82; 37a82
	ld a, [InLinkBattle]
	and a
	ret z

	call $1d6e
	ld hl, $68e4
	call CallBankF
	ld a, [OTPartyCount]
	add $4
	ld b, a
	ld a, [$d430]
	cp $4
	jr c, .asm_37aa0

	cp b
	jr c, .asm_37aa8

.asm_37aa0
	ld a, [CurOTMon]
	add $4
	ld [$d430], a
.asm_37aa8
	jp $1c17
; 37aab


Function0x37aab: ; 37aab
	call Function0x37e77
	jp PrintButItFailed
; 37ab1


Function0x37ab1: ; 37ab1
	ld a, BATTLE_VARS_STATUS
	call CleanGetBattleVarPair
	and 7
	jr nz, .asm_37ac1
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarPair
	res 0, [hl]

.asm_37ac1
	call Function0x372e7
	ld hl, PlayerSubStatus1
	res 7, [hl]
	ld hl, EnemySubStatus1
	res 7, [hl]
	ld hl, PlayerSubStatus5
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarPair
	res 3, [hl]
	res 4, [hl]
	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarPair
	ld [hl], 0
	xor a
	ld [$c730], a
	ld [$c731], a
	ret
; 37ae9


Function0x37ae9: ; 37ae9
	ld hl, PartyMon1CurHP
	ld a, [PartyCount]
	ld d, a
	ld a, [CurBattleMon]
	ld e, a
	jr Function0x37b01
; 37af6


Function0x37af6: ; 37af6
	ld hl, OTPartyMon1CurHP
	ld a, [OTPartyCount]
	ld d, a
	ld a, [CurOTMon]
	ld e, a

	; fallthrough
; 37b01

Function0x37b01: ; 37b01
	xor a
	ld b, a
	ld c, a
.asm_37b04
	ld a, c
	cp d
	jr z, .asm_37b1a

	cp e
	jr z, .asm_37b11

	ld a, [hli]
	or b
	ld b, a
	ld a, [hld]
	or b
	ld b, a
.asm_37b11
	push bc
	ld bc, $30
	add hl, bc
	pop bc
	inc c
	jr .asm_37b04

.asm_37b1a
	ld a, b
	and a
	ret
; 37b1d


BattleCommand68: ; 37b1d
	ld hl, $c711
	ld a, [hBattleTurn]
	and a
	jr z, .asm_37b28 ; 37b23 $3
	ld hl, $c710
.asm_37b28
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


BattleCommand69: ; 37b39
; clearhazards

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarPair
	bit 7, [hl]
	jr z, .asm_37b4a ; 37b40 $8
	res 7, [hl]
	ld hl, ShedLeechSeedText
	call FarBattleTextBox
.asm_37b4a
	ld hl, PlayerScreens
	ld de, $c730
	ld a, [hBattleTurn]
	and a
	jr z, .asm_37b5b ; 37b53 $6
	ld hl, EnemyScreens
	ld de, $c731
.asm_37b5b
	bit 0, [hl]
	jr z, .asm_37b69 ; 37b5d $a
	res 0, [hl]
	ld hl, BlewSpikesText
	push de
	call FarBattleTextBox
	pop de
.asm_37b69
	ld a, [de]
	and a
	ret z
	xor a
	ld [de], a
	ld hl, ReleasedByText
	jp FarBattleTextBox
; 37b74


BattleCommand6a: ; 37b74
; healmorn
	ld b, MORN
	jr BattleCommand6a6c
; 37b78

BattleCommand6b: ; 37b78
; healday
	ld b, DAY
	jr BattleCommand6a6c
; 37b7c

BattleCommand6c: ; 37b7c
; healnite
	ld b, NITE
	; fallthrough
; 37b7e

BattleCommand6a6c: ; 37b7e
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
	ld a, [InLinkBattle]
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
	dec c
	dec c

.Heal
	ld b, 0
	ld hl, .Multipliers
	add hl, bc
	add hl, bc

	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, BANK(GetMaxHP)
	rst FarCall

	call Function0x37e01
	call SwitchTurn

	ld hl, $4cef
	ld a, $f
	rst FarCall ; callab 3ccef

	call SwitchTurn
	call UpdateUserInParty

; 'regained health!'
	ld hl, RegainedHealthText
	jp FarBattleTextBox

.Full
	call Function0x37e77

; 'hp is full!'
	ld hl, HPIsFullText
	jp FarBattleTextBox

.Multipliers
	dw GetEighthMaxHP
	dw GetQuarterMaxHP
	dw GetHalfMaxHP
	dw GetMaxHP
; 37be8


BattleCommand6d: ; 37be8
; hiddenpower

	ld a, [AttackMissed]
	and a
	ret nz

	ld a, $3e
	ld hl, $7ced
	rst FarCall

	ret
; 37bf4


BattleCommand6e: ; 37bf4
; startrain
	ld a, WEATHER_RAIN
	ld [Weather], a
	ld a, 5
	ld [WeatherCount], a
	call Function0x37e01
	ld hl, DownpourText
	jp FarBattleTextBox
; 37c07


BattleCommand6f: ; 37c07
; startsun
	ld a, WEATHER_SUN
	ld [Weather], a
	ld a, 5
	ld [WeatherCount], a
	call Function0x37e01
	ld hl, SunGotBrightText
	jp FarBattleTextBox
; 37c1a


BattleCommand95: ; 37c1a
; bellydrum
	call BattleCommand77
	ld a, [AttackMissed]
	and a
	jr nz, .asm_37c4f

	ld hl, $4c9f
	ld a, $f
	rst FarCall

	ld hl, $4cde
	ld a, $f
	rst FarCall
	jr nc, .asm_37c4f

	push bc
	call Function0x37e01
	pop bc
	ld hl, $4c3f
	ld a, $f
	rst FarCall
	call UpdateUserInParty
	ld a, $5

.asm_37c41
	push af
	call BattleCommand77
	pop af
	dec a
	jr nz, .asm_37c41 ; 37c47 $f8

	ld hl, BellyDrumText
	jp FarBattleTextBox
.asm_37c4f
	call Function0x37e77
	jp PrintButItFailed
; 37c55


BattleCommand96: ; 37c55
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
	call Function0x37e77
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
	call Function0x365d7
	jr .asm_37c8c ; 37c87 $3
.asm_37c89
	call Function0x365fd
.asm_37c8c
	call Function0x37e01
	ld hl, CopiedStatsText
	jp FarBattleTextBox
; 37c95


BattleCommand9a: ; 37c95
; mirrorcoat

	ld a, $1
	ld [AttackMissed], a
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call CleanGetBattleVarPair
	and a
	ret z
	ld b, a
	ld hl, $45ec
	ld a, $f
	rst FarCall
	ld a, b
	cp $90
	ret z
	call BattleCommanda3
	ld a, [$d265]
	and a
	ret z
	call Function0x36abf
	ret z
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call CleanGetBattleVarPair
	dec a
	ld de, StringBuffer1
	call GetMoveData
	ld a, [$d075]
	and a
	ret z
	ld a, [$d076]
	cp $14
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
	jr nc, .asm_37ce1 ; 37cdb $4
	ld a, $ff
	ld [hli], a
	ld [hl], a
.asm_37ce1
	xor a
	ld [AttackMissed], a
	ret
; 37ce6


BattleCommand9d: ; 37ce6
; doubleminimizedamage

	ld hl, $c6fa
	ld a, [hBattleTurn]
	and a
	jr z, .asm_37cf1 ; 37cec $3
	ld hl, $c6fe
.asm_37cf1
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


BattleCommand9e: ; 37d02
; skipsuncharge
	ld a, [Weather]
	cp WEATHER_SUN
	ret nz
	ld b, $39 ; charge
	jp SkipToBattleCommand
; 37d0d


BattleCommand9b: ; 37d0d
; checkfuturesight

	ld hl, $c71d
	ld de, $c727
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, $c71e
	ld de, $c729
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
	ld b, $9c ; futuresight
	jp SkipToBattleCommand
; 37d34

BattleCommand9c: ; 37d34
; futuresight

	call Function0x34548
	jr nz, .asm_37d4b ; 37d37 $12
	ld a, BATTLE_VARS_MOVE_ANIM
	call CleanGetBattleVarPair
	ld b, a
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE
	call GetBattleVarPair
	ld [hl], b
	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarPair
	ld [hl], b
.asm_37d4b
	ld hl, $c71d
	ld a, [hBattleTurn]
	and a
	jr z, .asm_37d56 ; 37d51 $3
	ld hl, $c71e
.asm_37d56
	ld a, [hl]
	and a
	jr nz, .asm_37d87 ; 37d58 $2d
	ld a, $4
	ld [hl], a
	call BattleCommand0a
	call BattleCommandaa
	ld hl, ForesawAttackText
	call FarBattleTextBox
	call BattleCommand0c
	ld de, $c727
	ld a, [hBattleTurn]
	and a
	jr z, .asm_37d77 ; 37d72 $3
	ld de, $c729
.asm_37d77
	ld hl, CurDamage
	ld a, [hl]
	ld [de], a
	ld [hl], $0
	inc hl
	inc de
	ld a, [hl]
	ld [de], a
	ld [hl], $0
	jp EndMoveEffect
.asm_37d87
	pop bc
	call ResetDamage
	call Function0x37e77
	call PrintButItFailed
	jp EndMoveEffect
; 37d94


BattleCommand9f: ; 37d94
; thunderaccuracy

	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarPair
	inc hl
	ld a, [Weather]
	cp WEATHER_RAIN
	jr z, .asm_37da7 ; 37d9f $6
	cp WEATHER_SUN
	ret nz
	ld [hl], $80
	ret
.asm_37da7
	ld [hl], $ff
	ret
; 37daa


CheckHiddenOpponent: ; 37daa
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call CleanGetBattleVarPair
	and $60 ; fly | dig
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


Function0x37de9: ; 37de9
	push hl
	push de
	push bc
	ld a, [$c689]
	push af
	call BattleCommand0a
	pop af
	ld [$c689], a
	call Function0x37e19
	call BattleCommand0c
	pop bc
	pop de
	pop hl
	ret
; 37e01


Function0x37e01: ; 37e01
	push hl
	push de
	push bc
	ld a, [$c689]
	push af
	call BattleCommand0a
	pop af
	ld [$c689], a
	call Function0x37e36
	call BattleCommand0c
	pop bc
	pop de
	pop hl
	ret
; 37e19


Function0x37e19: ; 37e19
	xor a
	ld [FXAnimIDHi], a

	ld a, BATTLE_VARS_MOVE_ANIM
	call CleanGetBattleVarPair
	and a
	ret z

	ld [FXAnimIDLo], a

	ld a, [hBattleTurn]
	and a
	ld a, 1
	jr z, .asm_37e30
	ld a, 4

.asm_37e30
	ld [$cfca], a

	jp Function0x37e47
; 37e36


Function0x37e36: ; 37e36
	xor a
	ld [$cfca], a
	ld [FXAnimIDHi], a

	ld a, BATTLE_VARS_MOVE_ANIM
	call CleanGetBattleVarPair
	and a
	ret z

	; fallthrough
; 37e44


Function0x37e44: ; 37e44

	ld [FXAnimIDLo], a

	; fallthrough
; 37e47


Function0x37e47: ; 37e47
	push hl
	push de
	push bc
	ld hl, $40d6
	ld a, $33
	rst FarCall ; callab SafePlayBattleAnimation
	pop bc
	pop de
	pop hl
	ret
; 37e54


Function0x37e54: ; 37e54
	ld a, e
	ld [FXAnimIDLo], a
	ld a, d
	ld [FXAnimIDHi], a
	xor a
	ld [$cfca], a

	push hl
	push de
	push bc
	call SwitchTurn

	ld hl, $40d6
	ld a, $33
	rst FarCall ; callab SafePlayBattleAnimation

	call SwitchTurn
	pop bc
	pop de
	pop hl
	ret
; 37e73


CallBankF: ; 37e73
	ld a, $f
	rst FarCall
	ret
; 37e77


Function0x37e77: ; 37e77
	call BattleCommand0a
	call BattleCommandaa
	jp BattleCommand0c
; 37e80


BattleCommandaa: ; 37e80
; wait
; Wait 40 frames.
	ld c, 40
	jp DelayFrames
; 37e85


BattleCommand38: ; 37e85
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
	ld bc, Move2 - Move1
	call AddNTimes
	call GetMoveByte
	pop bc
	ret
; 37ead


GetMoveData: ; 37ead
; Copy move struct a to de.
	ld hl, Moves
	ld bc, Move2 - Move1
	call AddNTimes
	ld a, Bank(Moves)
	jp FarCopyBytes
; 37ebb


GetMoveByte: ; 37ebb
	ld a, BANK(Moves)
	jp GetFarByte
; 37ec0


Function0x37ec0: ; 37ec0
	ld a, $3e
	ld hl, $7d54
	rst $8
	ret
; 37ec7


Function0x37ec7: ; 37ec7
	ld a, $3e
	ld hl, $7d71
	rst $8
	ret
; 37ece


Function0x37ece: ; 37ece
	ld a, $3e
	ld hl, $7d69
	rst $8
	ret
; 37ed5


Function0x37ed5: ; 37ed5
; Related to mobile link battles.
	push hl
	push de
	push bc
	ld a, $13
	ld hl, $6a44
	rst $8
	pop bc
	pop de
	pop hl
	ret
; 37ee2



