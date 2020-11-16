AIScoring: ; used only for BANK(AIScoring)

; Details about diagrams :
; 0) A flow is a succession of conditions and descriptions.
; 1) A description is a sentence. It unconditionally refines a flow.
;      A description can include odds of success.
;      Examples : "for each other move", "50% to encourage".
; 2) A condition is a question between parentheses. The condition must be met
;      to switch to that flow.
;      Example : "(is player immune)".
; 3) When needed, a sentence can be split between lines with " ... ".
;      Example : (is super effective...)
;                (... or neutral)
; 4) A branch, in " ┤ ┴ ┬ ┼ ├ ", represents an OR statement. It is followed by
;      a condition at each end.
; 5) The symbols " ► ◄ " is followed by the end of a flow.
;      The latter is only used to save horizontal space.
; 6) The symbol " & " represents multiple score changes for a single flow.
;      Example : move ─&─► encourage
;                      └ other moves ─► discourage
;      reads as : move is encouraged and all others are discouraged.
; 7) A jump to a different part of the graph is written between brackets.
;      Example : (enemy is full HP) ─ [A] 
;      reads as : " if enemy is full HP, jump to label [A] below.

AI_Basic:
; Modifiable scores : ALL_MOVES | Randomness : NO

; Don't do anything redundant :
; - Using status-only moves if the player can't be statused.
; - Using moves that fail if they've already been used.

;  for each move ┬ (is redundant) ─► dismiss (-10)
;                └ (not) ┬ (can't status) ─► dismiss (-10)
;                        └ (can) ┬ (player has active Safeguard) ─► dismiss (-10)   
;                                └ (not) ─► nothing

	ld hl, wBuffer1 - 1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.checkmove
	dec b
	ret z

	inc hl
	ld a, [de]
	and a
	ret z

	inc de
	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	ld c, a

; Dismiss (+10) moves with special effects if they are
;   useless or not a good choice right now.
; For example, healing moves, weather moves, Dream Eater...
	push hl
	push de
	push bc
	farcall AI_Redundant
	pop bc
	pop de
	pop hl
	jr nz, .dismiss

; Dismiss (+10) status-only moves if the player is already statused.
	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	push hl
	push de
	push bc
	ld hl, StatusOnlyEffects
	ld de, 1
	call IsInArray

	pop bc
	pop de
	pop hl
	jr nc, .checkmove

	ld a, [wBattleMonStatus]
	and a
	jr nz, .dismiss

; Dismiss (+10) status-only move if the player has an active Safeguard.
	ld a, [wPlayerScreens]
	bit SCREENS_SAFEGUARD, a
	jr z, .checkmove

.dismiss
	call AIDismissMove
	jr .checkmove

INCLUDE "data/battle/ai/status_only_effects.asm"


AI_Setup:
; Modifiable scores : ALL_MOVES | Randomness : YES

; Use stat-modifying moves on turn 1.
; NOTE : wPlayerTurnsTaken and wEnemyTurnsTaken don't increase when using items.

; 50% chance to greatly encourage (-2) stat-up moves 
;   during the first turn of enemy's Pokemon.
; 50% chance to greatly encourage (-2) stat-down moves 
;   during the first turn of player's Pokemon.
; 88% (226/256) chance to greatly discourage (+2) stat-modifying moves 
;   otherwise.

;                                                      ┌► 50% greatly encourage (-2)
;                              ┌ (is first enemy turn) ┴► 50% nothing
;               ┌ (is stat-up) ┴ (not) ┬► 88% greatly discourage (+2)
;               │                      └► 12% nothing
; for each move ┼ (is stat-down) ┬ (is first player turn)┬► 50% greatly encourage (-2)
;               │                │                       └► 50% nothing
;               └ (else) ┐       └ (not) ┬► 88% greatly discourage (+2)
;                        └► nothing      └► 12% nothing

	ld hl, wBuffer1 - 1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.checkmove
	dec b
	ret z

	inc hl
	ld a, [de]
	and a
	ret z

	inc de
	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_EFFECT]

	cp EFFECT_ATTACK_UP
	jr c, .checkmove
	cp EFFECT_EVASION_UP + 1
	jr c, .statup

;	cp EFFECT_ATTACK_DOWN - 1
	jr z, .checkmove
	cp EFFECT_EVASION_DOWN + 1
	jr c, .statdown

	cp EFFECT_ATTACK_UP_2
	jr c, .checkmove
	cp EFFECT_EVASION_UP_2 + 1
	jr c, .statup

;	cp EFFECT_ATTACK_DOWN_2 - 1
	jr z, .checkmove
	cp EFFECT_EVASION_DOWN_2 + 1
	jr c, .statdown

	jr .checkmove

.statup
	ld a, [wEnemyTurnsTaken]
	and a
	jr nz, .certainly_greatly_discourage

	jr .maybe_greatly_encourage

.statdown
	ld a, [wPlayerTurnsTaken]
	and a
	jr nz, .certainly_greatly_discourage

.maybe_greatly_encourage
	call AI_50_50
	jr c, .checkmove

	dec [hl]
	dec [hl]
	jr .checkmove

.certainly_greatly_discourage
	call Random
	cp 12 percent
	jr c, .checkmove
	inc [hl]
	inc [hl]
	jr .checkmove


AI_Types:
; Modifiable scores : ALL_MOVES | Randomness : NO

; Dismiss (+10) any move that the player is immune to.
; Encourage (+1) super-effective moves.
; Discourage (-1) not very effective moves unless
;   all damaging moves are of the same type.

; NOTE : non-damaging immune moves are also dismissed.
;   Super effective and not very effective moves include those
;   with only 1 power, such as Horn Drill, Night Shade, Flail, etc.

; for each move ┬ (is player immune) ─► dismiss (-10)
;               ├ (is move neutral) ─► nothing
;               ├ (is move super effective) ┬ (is power = 0) ─► nothing
;               │                           └ (is power > 0) ─► encourage (-1)
;               └ (else) ┬ (enemy has another move with...)
;                        │ (... power > 0 and a different type) ─► discourage (+1)
;                        └ (else) ─► nothing 

	ld hl, wBuffer1 - 1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.checkmove
	dec b
	ret z

	inc hl
	ld a, [de]
	and a
	ret z

	inc de
	call AIGetEnemyMove

	push hl
	push bc
	push de
	ld a, 1
	ldh [hBattleTurn], a
	callfar BattleCheckTypeMatchup
	pop de
	pop bc
	pop hl

	ld a, [wTypeMatchup]
	and a
	jr z, .immune
	cp EFFECTIVE
	jr z, .checkmove
	jr c, .noteffective

; effective
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .checkmove
; encourage (-1)
	dec [hl]
	jr .checkmove

.noteffective
; Discourage (+1) this move if there are any moves
; that do damage of a different type.
	push hl
	push de
	push bc
	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	ld d, a
	ld hl, wEnemyMonMoves
	ld b, NUM_MOVES + 1
	ld c, 0
.checkmove2
	dec b
	jr z, .movesdone

	ld a, [hli]
	and a
	jr z, .movesdone

	call AIGetEnemyMove
	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	cp d
	jr z, .checkmove2
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr nz, .damaging
	jr .checkmove2

.damaging
	ld c, a
.movesdone
	ld a, c
	pop bc
	pop de
	pop hl
	and a
	jr z, .checkmove
; discourage (+1)
	inc [hl]
	jr .checkmove

.immune
	call AIDismissMove
	jr .checkmove


AI_Offensive:
; Modifiable scores : ALL_MOVES | Randomness : NO

; Greatly discourage (-2) non-damaging moves (power = 0).

; for each move ┬ (is power = 0) ─► nothing
;               └ (is power > 0) ─► greatly encourage (-2)

	ld hl, wBuffer1 - 1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.checkmove
	dec b
	ret z

	inc hl
	ld a, [de]
	and a
	ret z

	inc de
	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr nz, .checkmove

; greatly discourage (+2)
	inc [hl]
	inc [hl]
	jr .checkmove


AI_Smart:
; Modifiable scores : VARIOUS | Randomness : VARIOUS

; Context-specific scoring.

	ld hl, wBuffer1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.checkmove
	dec b
	ret z

	ld a, [de]
	inc de
	and a
	ret z

	push de
	push bc
	push hl
	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	ld hl, AI_Smart_EffectHandlers
	ld de, 3
	call IsInArray

	inc hl
	jr nc, .nextmove

	ld a, [hli]
	ld e, a
	ld d, [hl]

	pop hl
	push hl

	ld bc, .nextmove
	push bc

	push de
	ret

.nextmove
	pop hl
	pop bc
	pop de
	inc hl
	jr .checkmove

AI_Smart_EffectHandlers:
	dbw EFFECT_SLEEP,            AI_Smart_Sleep
	dbw EFFECT_LEECH_HIT,        AI_Smart_LeechHit
	dbw EFFECT_SELFDESTRUCT,     AI_Smart_Selfdestruct
	dbw EFFECT_DREAM_EATER,      AI_Smart_DreamEater
	dbw EFFECT_MIRROR_MOVE,      AI_Smart_MirrorMove
	dbw EFFECT_EVASION_UP,       AI_Smart_EvasionUp
	dbw EFFECT_ALWAYS_HIT,       AI_Smart_AlwaysHit
	dbw EFFECT_ACCURACY_DOWN,    AI_Smart_AccuracyDown
	dbw EFFECT_RESET_STATS,      AI_Smart_ResetStats
	dbw EFFECT_BIDE,             AI_Smart_Bide
	dbw EFFECT_FORCE_SWITCH,     AI_Smart_ForceSwitch
	dbw EFFECT_HEAL,             AI_Smart_Heal
	dbw EFFECT_TOXIC,            AI_Smart_Toxic
	dbw EFFECT_LIGHT_SCREEN,     AI_Smart_LightScreen
	dbw EFFECT_OHKO,             AI_Smart_Ohko
	dbw EFFECT_RAZOR_WIND,       AI_Smart_RazorWind
	dbw EFFECT_SUPER_FANG,       AI_Smart_SuperFang
	dbw EFFECT_TRAP_TARGET,      AI_Smart_TrapTarget
	dbw EFFECT_UNUSED_2B,        AI_Smart_Unused2B
	dbw EFFECT_CONFUSE,          AI_Smart_Confuse
	dbw EFFECT_SP_DEF_UP_2,      AI_Smart_SpDefenseUp2
	dbw EFFECT_REFLECT,          AI_Smart_Reflect
	dbw EFFECT_PARALYZE,         AI_Smart_Paralyze
	dbw EFFECT_SPEED_DOWN_HIT,   AI_Smart_SpeedDownHit
	dbw EFFECT_SUBSTITUTE,       AI_Smart_Substitute
	dbw EFFECT_HYPER_BEAM,       AI_Smart_HyperBeam
	dbw EFFECT_RAGE,             AI_Smart_Rage
	dbw EFFECT_MIMIC,            AI_Smart_Mimic
	dbw EFFECT_LEECH_SEED,       AI_Smart_LeechSeed
	dbw EFFECT_DISABLE,          AI_Smart_Disable
	dbw EFFECT_COUNTER,          AI_Smart_Counter
	dbw EFFECT_ENCORE,           AI_Smart_Encore
	dbw EFFECT_PAIN_SPLIT,       AI_Smart_PainSplit
	dbw EFFECT_SNORE,            AI_Smart_Snore
	dbw EFFECT_CONVERSION2,      AI_Smart_Conversion2
	dbw EFFECT_LOCK_ON,          AI_Smart_LockOn
	dbw EFFECT_DEFROST_OPPONENT, AI_Smart_DefrostOpponent
	dbw EFFECT_SLEEP_TALK,       AI_Smart_SleepTalk
	dbw EFFECT_DESTINY_BOND,     AI_Smart_DestinyBond
	dbw EFFECT_REVERSAL,         AI_Smart_Reversal
	dbw EFFECT_SPITE,            AI_Smart_Spite
	dbw EFFECT_HEAL_BELL,        AI_Smart_HealBell
	dbw EFFECT_PRIORITY_HIT,     AI_Smart_PriorityHit
	dbw EFFECT_THIEF,            AI_Smart_Thief
	dbw EFFECT_MEAN_LOOK,        AI_Smart_MeanLook
	dbw EFFECT_NIGHTMARE,        AI_Smart_Nightmare
	dbw EFFECT_FLAME_WHEEL,      AI_Smart_FlameWheel
	dbw EFFECT_CURSE,            AI_Smart_Curse
	dbw EFFECT_PROTECT,          AI_Smart_Protect
	dbw EFFECT_FORESIGHT,        AI_Smart_Foresight
	dbw EFFECT_PERISH_SONG,      AI_Smart_PerishSong
	dbw EFFECT_SANDSTORM,        AI_Smart_Sandstorm
	dbw EFFECT_ENDURE,           AI_Smart_Endure
	dbw EFFECT_ROLLOUT,          AI_Smart_Rollout
	dbw EFFECT_SWAGGER,          AI_Smart_Swagger
	dbw EFFECT_FURY_CUTTER,      AI_Smart_FuryCutter
	dbw EFFECT_ATTRACT,          AI_Smart_Attract
	dbw EFFECT_SAFEGUARD,        AI_Smart_Safeguard
	dbw EFFECT_MAGNITUDE,        AI_Smart_Magnitude
	dbw EFFECT_BATON_PASS,       AI_Smart_BatonPass
	dbw EFFECT_PURSUIT,          AI_Smart_Pursuit
	dbw EFFECT_RAPID_SPIN,       AI_Smart_RapidSpin
	dbw EFFECT_MORNING_SUN,      AI_Smart_MorningSun
	dbw EFFECT_SYNTHESIS,        AI_Smart_Synthesis
	dbw EFFECT_MOONLIGHT,        AI_Smart_Moonlight
	dbw EFFECT_HIDDEN_POWER,     AI_Smart_HiddenPower
	dbw EFFECT_RAIN_DANCE,       AI_Smart_RainDance
	dbw EFFECT_SUNNY_DAY,        AI_Smart_SunnyDay
	dbw EFFECT_BELLY_DRUM,       AI_Smart_BellyDrum
	dbw EFFECT_PSYCH_UP,         AI_Smart_PsychUp
	dbw EFFECT_MIRROR_COAT,      AI_Smart_MirrorCoat
	dbw EFFECT_SKULL_BASH,       AI_Smart_SkullBash
	dbw EFFECT_TWISTER,          AI_Smart_Twister
	dbw EFFECT_EARTHQUAKE,       AI_Smart_Earthquake
	dbw EFFECT_FUTURE_SIGHT,     AI_Smart_FutureSight
	dbw EFFECT_GUST,             AI_Smart_Gust
	dbw EFFECT_STOMP,            AI_Smart_Stomp
	dbw EFFECT_SOLARBEAM,        AI_Smart_Solarbeam
	dbw EFFECT_THUNDER,          AI_Smart_Thunder
	dbw EFFECT_FLY,              AI_Smart_Fly
	db -1 ; end

AI_Smart_Sleep:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; 50% to greatly encourage (-2) if the enemy has either Dream Eater or Nightmare.

; move ┬ (enemy has Dream Eater or Nightmare) ┬► 50% greatly encourage (-2)
;      └ (else) ─► nothing                    └► 50% nothing

	ld b, EFFECT_DREAM_EATER
	call AIHasMoveEffect
	jr c, .maybe_greatly_encourage

	ld b, EFFECT_NIGHTMARE
	call AIHasMoveEffect
	ret nc

.maybe_greatly_encourage
	call AI_50_50
	ret c
	dec [hl]
	dec [hl]
	ret

AI_Smart_LeechHit:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; 61% (156/256) to discourage(+1) if the enemy move is not very effective 
;   or the player is immune.
; 80% (206/256) to encourage (-1) if the enemy move is super effective 
;   and the enemy is not at full HP. 

;      ┌ (player immune or move...)
;      │ (...not very effective) ┬► 61% discourage (+1) 
; move ┤                         └► 39% nothing
;      ├ (neutral) ─► nothing
;      └ (else) ┬ (enemy is full HP) ─► nothing
;               └ (not) ┬► 80% encourage (-1)
;                       └► 20% nothing

	push hl
	ld a, 1
	ldh [hBattleTurn], a
	callfar BattleCheckTypeMatchup
	pop hl

; 61% chance to discourage this move if not very effective.
	ld a, [wTypeMatchup]
	cp EFFECTIVE
	jr c, .maybe_discourage

; Do nothing if effectiveness is neutral.
	ret z

; Do nothing if enemy's HP is full.
	call AICheckEnemyMaxHP
	ret c

; 80% chance to encourage this move otherwise.
	call AI_80_20
	ret c

	dec [hl]
	ret

.maybe_discourage
	call Random
	cp 39 percent + 1
	ret c

	inc [hl]
	ret

AI_Smart_LockOn:
; Modifiable scores : ALL_MOVES | Randomness : NO

; Generally encourage Lock On and low accuracy moves when helpful,
;   and discourage when not.
; Dismiss Lock On if the player is already locked.

;                                            greatly encourage (-2)◄┐      
;      ┌ (player is...)  ┌► dismiss (+10)       ┌ (accuracy <= 70%) ┘
; move ┤ (...locked on) ─&─ for each other move ┴ (not) ─► nothing                   
;      │                                        
;      └ (isn't) ┬ (enemy HP <= 25%) ─► discourage (+1)
;                ├ (enemy HP > 50%) ┬ (player faster or tied) ─► discourage (+1)
;                └ (else) ── [A]    └ (else) ── [A] 
;

;     ┌ (player evasion >= 3) ─► 50% to greatly encourage (-2)
; [A] ┼ (player evasion between 1 and 2) ─► nothing
;     └ (else) ┬ (enemy accuracy <= -3) ─► 50% to greatly encourage (-2)
;              ┼ (enemy accuracy between -2 and -1) ─► nothing
;              └ (else) ┬ (enemy has another move with...)
;                       │ (...accuracy <= 70 which is...)
;                       │ (...neutral or super effective) ─► nothing
;                       └ (else) ─► discourage (+1)

	ld a, [wPlayerSubStatus5]                            
	bit SUBSTATUS_LOCK_ON, a
	jr nz, .player_locked_on

	push hl
	call AICheckEnemyQuarterHP
	jr nc, .discourage

	call AICheckEnemyHalfHP
	jr c, .skip_speed_check

	call AICompareSpeed
	jr nc, .discourage

.skip_speed_check
	ld a, [wPlayerEvaLevel]
	cp BASE_STAT_LEVEL + 3
	jr nc, .maybe_greatly_encourage
	cp BASE_STAT_LEVEL + 1
	jr nc, .do_nothing

	ld a, [wEnemyAccLevel]
	cp BASE_STAT_LEVEL - 2
	jr c, .maybe_greatly_encourage
	cp BASE_STAT_LEVEL
	jr c, .do_nothing

	ld hl, wEnemyMonMoves
	ld c, NUM_MOVES + 1
.checkmove
	dec c
	jr z, .discourage

	ld a, [hli]
	and a
	jr z, .discourage

	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_ACC]
	cp 71 percent - 1
	jr nc, .checkmove

	ld a, 1
	ldh [hBattleTurn], a

	push hl
	push bc
	farcall BattleCheckTypeMatchup
	ld a, [wTypeMatchup]
	cp EFFECTIVE
	pop bc
	pop hl
	jr c, .checkmove

.do_nothing
	pop hl
	ret

.discourage
	pop hl
	inc [hl]
	ret

.maybe_greatly_encourage
	pop hl
	call AI_50_50
	ret c

	dec [hl]
	dec [hl]
	ret

.player_locked_on
	push hl
	ld hl, wBuffer1 - 1
	ld de, wEnemyMonMoves
	ld c, NUM_MOVES + 1

.checkmove2
	inc hl
	dec c
	jr z, .dismiss

	ld a, [de]
	and a
	jr z, .dismiss

	inc de
	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_ACC]
	cp 71 percent - 1
	jr nc, .checkmove2

	dec [hl]
	dec [hl]
	jr .checkmove2

.dismiss
	pop hl
	jp AIDismissMove

AI_Smart_Selfdestruct:
; Selfdestruct, Explosion
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; Greatly discourage (+3) in the following cases :
; - it's the last enemy mon, but not the last player mon.
; - otherwise, if enemy HP is stricly above 50%.
; - otherwise, 92% (236/256) chance if enemy HP is in ]25%;50%].

; move ┬ (is last enemy mon) ┬ (is last player mon) ── [A]
;      └ (not) ── [A]        └ (not) ─► greatly discourage (+3)

; [A] ┬ (enemy HP > 50%) ─► greatly discourage (+3)
;     ├ (enemy HP <= 25%) ─► nothing
;     └ (else) ┬► 92% greatly discourage (+3)
;              └► 8% nothing

; Unless this is the enemy's last Pokemon...
	push hl
	farcall FindAliveEnemyMons
	pop hl
	jr nc, .notlastenemymon

; ...greatly discourage this move unless this is the player's last Pokemon too.
	push hl
	call AICheckLastPlayerMon
	pop hl
	jr nz, .greatly_discourage

.notlastenemymon
; Greatly discourage this move if enemy's HP is stricly above 50%.
	call AICheckEnemyHalfHP
	jr c, .greatly_discourage

; Do nothing if enemy's HP is below 25% or equal.
	call AICheckEnemyQuarterHP
	ret nc

; If enemy's HP is between 25% and 50%,
; 92% chance to greatly discourage this move.
	call Random
	cp 8 percent
	ret c

.greatly_discourage
	inc [hl]
	inc [hl]
	inc [hl]
	ret

AI_Smart_DreamEater:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; 90% (231/256) chance to greatly encourage (-3) this move.
; The AI_Basic layer will make sure that
; Dream Eater is only used against sleeping targets.

	call Random
	cp 10 percent
	ret c
	dec [hl]
	dec [hl]
	dec [hl]
	ret

AI_Smart_EvasionUp:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; move ┬ (enemy has max evasion) -► dismiss (+10)
;      └ (not) ┬ (enemy is full HP) ┬ (player is toxic'd) ─► greatly encourage (-2)
;              │                    └ (not) ┬► 70% greatly encourage (-2)
;              │                            └─ 30% ── [A]
;              └ (not) ┬ (enemy HP <= 25%) ─ greatly discourage (+2) ── [A]
;                      └ (else) ┬► 4% greatly encourage (-2)
;                               └─ 96% ┬ (enemy HP <= 50%) ── [B]
;                                      └ (else) ┬► 20% greatly encourage (-2)
;                                               └─ 80% ── [A]
; [B] ┬ 50% ─► [A]                                                                
;     └ 50% greatly discourage (+2) ─► [A]
;
; [A] ┬ (is player toxic'd) ┬► 69% greatly encourage (-2)
;     │                     └► 31% nothing
;     └ (not) ┬ (is player seeded)  ┬► 50% encourage (-1)
;             │                     └► 50% nothing
;             └ (not) ┬ (enemy evasion > player accuracy) ─► discourage (+1)
;                     └ (not) ┬ (player is using Fury...)
;                             │ (...Cutter or Rollout) ─► greatly encourage (-2)
;                             └ (not) ─► discourage (-1)

; NOTE : 70% (178/256), 30% ( 78/256)
;        96% (246/256),  4% ( 10/256)
;        80% (206/256), 20% ( 50/256)
;        69% (176/256), 31% ( 80/256)

; Dismiss (+10) this move if enemy's evasion can't raise anymore.
	ld a, [wEnemyEvaLevel]
	cp MAX_STAT_LEVEL
	jp nc, AIDismissMove

; If enemy's HP is full...
	call AICheckEnemyMaxHP
	jr nc, .enemy_not_full_hp

; ...greatly encourage (-2) this move if player is badly poisoned.
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, .greatly_encourage

; ...70% (178/256) chance to greatly encourage (-2) this move if player is not badly poisoned.
	call Random
	cp 70 percent
	jr nc, .not_encouraged

.greatly_encourage
	dec [hl]
	dec [hl]
	ret

.enemy_not_full_hp
; Greatly discourage (+2) this move if enemy's HP is below 25%.
	call AICheckEnemyQuarterHP
	jr nc, .enemy_below_quarter_hp

; If enemy's HP is above 25% but not full, 4% chance to greatly encourage (-2) this move.
	call Random
	cp 4 percent
	jr c, .greatly_encourage

; If enemy's HP is between 25% and 50%,...
	call AICheckEnemyHalfHP
	jr nc, .enemy_between_quarter_and_half_hp

; If enemy's HP is above 50% but not full, 20% chance to greatly encourage (-2) this move.
	call AI_80_20
	jr c, .greatly_encourage
	jr .not_encouraged

.enemy_between_quarter_and_half_hp
; ...50% chance to greatly discourage (+2) this move.
	call AI_50_50
	jr c, .not_encouraged

.enemy_below_quarter_hp
	inc [hl]
	inc [hl]

; 30% chance to end up here if enemy's HP is full and player is not badly poisoned.
; 77% chance to end up here if enemy's HP is above 50% but not full.
; 96% chance to end up here if enemy's HP is between 25% and 50%.
; 100% chance to end up here if enemy's HP is below 25%.
; In other words, we only end up here if the move has not been encouraged or dismissed.
.not_encouraged
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, .maybe_greatly_encourage

	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_LEECH_SEED, a
	jr nz, .maybe_encourage

; Discourage (+1) this move if enemy's evasion level is higher than player's accuracy level.
	ld a, [wEnemyEvaLevel]
	ld b, a
	ld a, [wPlayerAccLevel]
	cp b
	jr c, .discourage

; Greatly encourage (-2) this move if the player is in the middle of Fury Cutter or Rollout.
	ld a, [wPlayerFuryCutterCount]
	and a
	jr nz, .greatly_encourage

	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_ROLLOUT, a
	jr nz, .greatly_encourage

.discourage
	inc [hl]
	ret

; Player is badly poisoned.
; 69% (176/256) chance to greatly encourage this move.
; This would counter any previous discouragement.
.maybe_greatly_encourage
	call Random
	cp 31 percent + 1
	ret c

	dec [hl]
	dec [hl]
	ret

; Player is seeded.
; 50% chance to encourage this move.
; This would partly counter any previous discouragement.
.maybe_encourage
	call AI_50_50
	ret c

	dec [hl]
	ret

AI_Smart_AlwaysHit:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

;                                     ┌► 80% greatly encourage (-2)
; move ┬ (is enemy accuracy -6 to -3) ┴► 20% nothing
;      └ (else) ┬ (is player evasion 3 to 6) ┬► 80% greatly encourage (-2)
;               └ (else) ─► nothing          └► 20% nothing

; 80% chance to greatly encourage this move if either...

; ...enemy's accuracy level has been lowered three or more stages
	ld a, [wEnemyAccLevel]
	cp BASE_STAT_LEVEL - 2
	jr c, .certainly_greatly_encourage

; ...or player's evasion level has been raised three or more stages.
	ld a, [wPlayerEvaLevel]
	cp BASE_STAT_LEVEL + 3
	ret c

.certainly_greatly_encourage
	call AI_80_20
	ret c

	dec [hl]
	dec [hl]
	ret

AI_Smart_MirrorMove:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; NOTE : wLastPlayerCounterMove and wLastEnemyCounterMove are not set to 0
;   when using an item. Thus Mirror Move can still be used in this case.

;                                                    ┌► 50% nothing
; move ┬ (player has used a move) ┬ (in UsefulMoves) ┴─ 50% ── [A]
;      │                          └ (not) ─► nothing
;      └ (not) ┬ (enemy is strictly faster) ─► dismiss (+10)
;              └ (not) ─► nothing
; [A] ─ encourage (-1) ┬ (enemy is strictly faster) ┬► 90% encourage (-1)
;                      └ (not) ─► nothing           └► 10% nothing

; If the player did not use any move last turn...
	ld a, [wLastPlayerCounterMove]
	and a
	jr nz, .usedmove

; ...do nothing if enemy is slower than player or speedtied.
	call AICompareSpeed
	ret nc

; ...or dismiss this move if enemy is faster than player.
	jp AIDismissMove

; If the player did use a move in UsefulMoves last turn...
.usedmove
	push hl
	ld hl, UsefulMoves
	ld de, 1
	call IsInArray
	pop hl

; ...do nothing if he didn't use a useful move.
	ret nc

; If he did, 50% chance to encourage this move...
	call AI_50_50
	ret c

	dec [hl]

; ...and 90% chance to encourage this move again if the enemy is faster.
	call AICompareSpeed
	ret nc

	call Random
	cp 10 percent
	ret c

	dec [hl]
	ret

AI_Smart_AccuracyDown:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

;                                                greatly encourage (-2) ◄┐
; move ┬ (is player full HP) ┬ (is enemy HP > 50%) ┬ (is player toxic'd) ┘
;      └─ [B]                └─ [B]                └ (not) ┬► 70% greatly encourage (-2)
;                                                          └► 30% ── [A]
; [B] ┬ (is player HP <= 25%) ─ greatly discourage (-2) ── [A]
;     └ (else) ┬► 4% greatly encourage (-2)         ┌ 50% ── [A]
;              └─ 96% ┬ (is player HP in ]25%;50%]) ┴ 50% greatly encourage (-2) ─ [A]
;                     └ (player HP > 50%) ┬► 20% greatly encourage (-2)
;                                         └─ 80% ── [A]
; [A] ┬ (is player toxic'd) ┬► 69% greatly encourage (-2)
;     │                     └► 31% nothing
;     └ (not) ┬ (is player seeded) ┬► 50% encourage (-1)
;             │                    └► 50% nothing
;             └ (not) ┬ (is player accuracy < enemy evasion) ─► discourage (+1)
;                     └ (not) ┬ (is player using Fury Cutter or Rollout) ┐
;                             │                  greatly encourage (-2) ◄┘
;                             └ (not) ─► discourage (+1)

; If player's HP is full...
	call AICheckPlayerMaxHP
	jr nc, .hp_mismatch_1

; ...and enemy's HP is strictly above 50%...
	call AICheckEnemyHalfHP
	jr nc, .hp_mismatch_1

; ...greatly encourage this move if player is badly poisoned.
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, .greatly_encourage

; ...70% chance to greatly encourage this move if player is not badly poisoned.
	call Random
	cp 70 percent
	jr nc, .not_encouraged

.greatly_encourage
	dec [hl]
	dec [hl]
	ret

.hp_mismatch_1
; Greatly discourage this move if player's HP is 25% or below.
	call AICheckPlayerQuarterHP
	jr nc, .hp_mismatch_2

; If player's HP is above 25% but not full, 4% chance to greatly encourage this move.
	call Random
	cp 4 percent
	jr c, .greatly_encourage

; If player's HP is between 25% and 50%,...
	call AICheckPlayerHalfHP
	jr nc, .hp_mismatch_3

; If player's HP is above 50% but not full, 20% chance to greatly encourage this move.
	call AI_80_20
	jr c, .greatly_encourage
	jr .not_encouraged

; ...50% chance to greatly discourage this move.
.hp_mismatch_3
	call AI_50_50
	jr c, .not_encouraged

.hp_mismatch_2
	inc [hl]
	inc [hl]

; We only end up here if the move has not been already encouraged.
.not_encouraged
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, .maybe_greatly_encourage

	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_LEECH_SEED, a
	jr nz, .maybe_encourage

; Discourage this move if enemy's evasion level is higher than player's accuracy level.
	ld a, [wEnemyEvaLevel]
	ld b, a
	ld a, [wPlayerAccLevel]
	cp b
	jr c, .discourage

; Greatly encourage this move if the player is in the middle of Fury Cutter or Rollout.
	ld a, [wPlayerFuryCutterCount]
	and a
	jr nz, .greatly_encourage

	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_ROLLOUT, a
	jr nz, .greatly_encourage

.discourage
	inc [hl]
	ret

; Player is badly poisoned.
; 69% chance to greatly encourage this move.
; This would counter any previous discouragement.
.maybe_greatly_encourage
	call Random
	cp 31 percent + 1
	ret c

	dec [hl]
	dec [hl]
	ret

; Player is seeded.
; 50% chance to encourage this move.
; This would partly counter any previous discouragement.
.maybe_encourage
	call AI_50_50
	ret c

	dec [hl]
	ret

AI_Smart_ResetStats:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

;                               ┌► 84% encourage (-1)
; move ┬ (any enemy stat <= -3) ┴► 16% nothing
;      └ (else) ┬ (any player stat >= +3) ┬► 84% encourage (-1)
;               │                         └► 16% nothing
;               └ (else) ─► discourage (+1)

; 84% (214/256) to encourage (-1) this move if either...

; ... any of enemy's stat levels is lower than -2 or ...
	push hl
	ld hl, wEnemyAtkLevel
	ld c, NUM_LEVEL_STATS
.enemystatsloop
	dec c
	jr z, .enemystatsdone
	ld a, [hli]
	cp BASE_STAT_LEVEL - 2
	jr c, .certainly_encourage
	jr .enemystatsloop

; ... any of player's stat levels is higher than +2.
.enemystatsdone
	ld hl, wPlayerAtkLevel
	ld c, NUM_LEVEL_STATS
.playerstatsloop
	dec c
	jr z, .discourage
	ld a, [hli]
	cp BASE_STAT_LEVEL + 3
	jr c, .playerstatsloop

.certainly_encourage
	pop hl
	call Random
	cp 16 percent
	ret c
	dec [hl]
	ret

; Discourage (+1) this move otherwise.
.discourage
	pop hl
	inc [hl]
	ret

AI_Smart_Bide:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; 90% (231/256) to discourage (+1) this move unless enemy's HP is full.

; move ┬ (enemy is full HP) ─► nothing
;      └ (not) ┬► 90% discourage (+1)
;              └► 10% nothing.

	call AICheckEnemyMaxHP
	ret c
	call Random
	cp 10 percent
	ret c
	inc [hl]
	ret

AI_Smart_ForceSwitch:
; Whirlwind, Roar.
; Modifiable scores : SELECTED_MOVE | Randomness : NO

; Discourage (+1) this move if the player has not shown
;   a super-effective move with power > 0 against the enemy.
; Consider player's type(s) if its moves are unknown.

; move ┬ (player has used a super effective...
;      │ (... move with power > 0) ─► nothing
;      └ (not) ┬ (player typing is super effective) ─► nothing
;              └ (not) ─► discourage (+1)

	push hl
	callfar CheckPlayerMoveTypeMatchups
	ld a, [wEnemyAISwitchScore]
	cp BASE_AI_SWITCH_SCORE
	pop hl
	ret c
	inc [hl]
	ret

AI_Smart_Heal:
AI_Smart_MorningSun:
AI_Smart_Synthesis:
AI_Smart_Moonlight:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; 90% (231/256) to greatly encourage (-2) this move if enemy's HP is 25% or below.
; Discourage (+1) this move if enemy's HP is strictly higher than 50%.
; Do nothing otherwise.

; move ┬ (is enemy HP <= 25%) ┬► 90% greatly encourage (-2)
;      │                      └► 10% nothing
;      ├ (is enemy HP > 50%) ─► discourage (+1)
;      └ (else) ─► nothing

	call AICheckEnemyQuarterHP
	jr nc, .certainly_greatly_encourage
	call AICheckEnemyHalfHP
	ret nc
	inc [hl]
	ret

.certainly_greatly_encourage
	call Random
	cp 10 percent
	ret c
	dec [hl]
	dec [hl]
	ret

AI_Smart_Toxic:
AI_Smart_LeechSeed:
; Modifiable scores : SELECTED_MOVE | Randomness : NO

; Discourage (+1) this move if player's HP is 50% or below.

; move ┬ (player HP > 50%) ─► nothing
;      └ (else) ─► discourage (+1)

	call AICheckPlayerHalfHP
	ret c
	inc [hl]
	ret

AI_Smart_LightScreen:
AI_Smart_Reflect:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; 92% (236/256) to discourage (+1) this move unless enemy's HP is full.

; move ┬ (enemy is full HP) ─► nothing
;      └ (not) ┬► 8% nothing
;              └► 92% discourage (+1)

	call AICheckEnemyMaxHP
	ret c
	call Random
	cp 8 percent
	ret c
	inc [hl]
	ret

AI_Smart_Ohko:
; Modifiable scores : SELECTED_MOVE | Randomness : NO

; Dismiss (+10) this move if player's level is strictly higher than enemy's level.
; Else, discourage (+1) this move is player's HP is 50% or below.

; move ┬ (player level > enemy level) ─► dismiss (+10)
;      └ (else) ┬ (player HP > 50%) ─► nothing
;               └ (else) ─► discourage (+1)

	ld a, [wBattleMonLevel]
	ld b, a
	ld a, [wEnemyMonLevel]
	cp b
	jp c, AIDismissMove
	call AICheckPlayerHalfHP
	ret c
	inc [hl]
	ret

AI_Smart_TrapTarget:
; Bind, Wrap, Fire Spin, Clamp
; Modifiable scores : SELECTED_MOVE | Randomness : YES

;                                    ┌► 50% discourage (+1)
; move ┬ (player is already trapped) ┴► 50% nothing
;      └ (not) ┬ (player is toxic'd, infatuated, identified,...
;              │ (...in Rollout or in Nightmare) ┐
;              └ (not) ┬ (is first player turn) ─┴┬ (enemy HP <= 25%) ─► nothing
;                      └ (else) ┬► 50% nothing    └ (else) ┬► 50% nothing
;                               └► 50% discourage (+1)     └► 50% greatly encourage (-2)

; 50% chance to discourage this move if the player is already trapped.
	ld a, [wPlayerWrapCount]
	and a
	jr nz, .maybe_discourage

; 50% chance to greatly encourage this move if player is either
; badly poisoned, in love, identified, stuck in Rollout, or has a Nightmare.
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, .maybe_greatly_encourage

	ld a, [wPlayerSubStatus1]
	and 1 << SUBSTATUS_IN_LOVE | 1 << SUBSTATUS_ROLLOUT | 1 << SUBSTATUS_IDENTIFIED | 1 << SUBSTATUS_NIGHTMARE
	jr nz, .maybe_greatly_encourage

; Else, 50% chance to greatly encourage this move if it's the player's Pokemon first turn.
	ld a, [wPlayerTurnsTaken]
	and a
	jr z, .maybe_greatly_encourage

; 50% chance to discourage this move otherwise.
.maybe_discourage
	call AI_50_50
	ret c
	inc [hl]
	ret

.maybe_greatly_encourage
	call AICheckEnemyQuarterHP
	ret nc
	call AI_50_50
	ret c
	dec [hl]
	dec [hl]
	ret

AI_Smart_RazorWind:
AI_Smart_Unused2B:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; Discourage (+1) if Perish Song kills during or after Razor Wind.
; Dismiss (+6) if the player has moves like Protect or Detect.
; Otherwise 22% (56/256) to discourage (+1) if the enemy is confused or below 50% HP.

; move ┬ (enemy is under Perish Song) ┬ (1 or 2 turns left) ─► discourage (+1)
;      └ (not) ── [A]                 └ (else) ── [A]
;
; [A] ┬ (player already used...
;     │  (...Protect or Detect) ─► dismiss (+10)
;     └ (not) ┬ (enemy is confused) ──────┐┌► 22% discourage (+1)                     
;             └ (not) ┬ (enemy HP <= 50%) ┴┴► 78% nothing 
;                     └ (else) ─► nothing

; ENHANCE : .unlikely_discourage was probably meant to be `ret nc` in order to
;   discourage most of the time if the enemy is confused.

	ld a, [wEnemySubStatus1]
	bit SUBSTATUS_PERISH, a
	jr z, .no_perish_count

	ld a, [wEnemyPerishCount]
	cp 3
	jr c, .discourage

.no_perish_count
	push hl
	ld hl, wPlayerUsedMoves
	ld c, NUM_MOVES

.checkmove
	ld a, [hli]
	and a
	jr z, .movesdone

	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	cp EFFECT_PROTECT
	jr z, .dismiss
	dec c
	jr nz, .checkmove

.movesdone
	pop hl
	ld a, [wEnemySubStatus3]
	bit SUBSTATUS_CONFUSED, a
	jr nz, .unlikely_discourage

	call AICheckEnemyHalfHP
	ret c

.unlikely_discourage
	call Random
	cp 79 percent - 1
	ret c

.discourage
	inc [hl]
	ret

.dismiss
	pop hl
	ld a, [hl]
	add 6
	ld [hl], a
	ret

AI_Smart_Confuse:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; Certainly discourage if the player has low HP, and discourage more 
;   the lower the player HP is.

; move ┬ (player HP > 50%) ─► nothing
;      ├ (player HP in ]25%;50%]) ┬► 90% discourage (+1)
;      │                          └► 10% nothing
;      └ (player HP <= 25%) ┬► 90% greatly discourage (+2)
;                           └► 10% discourage (+1)

	call AICheckPlayerHalfHP
	ret c
	call Random
	cp 10 percent
	jr c, .skipdiscourage
; discourage (+1)
	inc [hl]

.skipdiscourage
; Discourage (+1) again if player's HP is 25% or below.
	call AICheckPlayerQuarterHP
	ret c
	inc [hl]
	ret

AI_Smart_SpDefenseUp2:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; move ┬ (enemy HP < 50%) ─► discourage (+1)
;      └ (else) ┬ (enemy SpDef >= +4) ─► discourage (+1)
;               ├ (enemy SpDef is +2 or +3) ─► nothing
;               └ (else) ┬ (player has a special type) ┬► 80% greatly encourage (-2)
;                        └ (else) ─► nothing           └► 20% nothing

; Discourage this move if enemy's HP is strictly lower than 50%.
	call AICheckEnemyHalfHP
	jr nc, .discourage

; Discourage this move if enemy's special defense level is higher than +3.
	ld a, [wEnemySDefLevel]
	cp BASE_STAT_LEVEL + 4
	jr nc, .discourage

; 80% chance to greatly encourage this move if
; enemy's Special Defense level is lower than +2, and the player is of a special type.
	cp BASE_STAT_LEVEL + 2
	ret nc

	ld a, [wBattleMonType1]
	cp SPECIAL
	jr nc, .certainly_greatly_encourage
	ld a, [wBattleMonType2]
	cp SPECIAL
	ret c

.certainly_greatly_encourage
	call AI_80_20
	ret c
	dec [hl]
	dec [hl]
	ret

.discourage
	inc [hl]
	ret

AI_Smart_Fly:
; Fly, Dig
; Modifiable scores : SELECTED_MOVE | Randomness : NO

; Greatly encourage (+3) this move if the player is
;   flying or underground, and slower than the enemy or speedtied.

;                                          greatly encourage (-3) ◄┐
; move ┬ (player is using Fly or Dig) ┬ (enemy is strictly faster) ┘
;      └ (not) ─► nothing             └ (not) ─► nothing

	ld a, [wPlayerSubStatus3]
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret z

	call AICompareSpeed
	ret nc

	dec [hl]
	dec [hl]
	dec [hl]
	ret

AI_Smart_SuperFang:
; Modifiable scores : SELECTED_MOVE | Randomness : NO

; Discourage (+1) this move if player's HP is 25% or below.

; move ┬ (player HP > 25%) ─► nothing
;      └ (else) ─► discourage (+1)

	call AICheckPlayerQuarterHP
	ret c
	inc [hl]
	ret

AI_Smart_Paralyze:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

;                           ┌► 50% nothing
; move ┬ (player HP <= 25%) ┴► 50% discourage (+1)
;      └ (else) ┬ (enemy is strictly faster) ─► nothing
;               └ (not) ┬ (enemy HP <= 25%) ─► nothing
;                       └ (else) ─► greatly encourage (-2)

; 50% to discourage (+1) this move if player's HP is 25% or below.
	call AICheckPlayerQuarterHP
	jr nc, .maybe_discourage

; 80% chance to greatly encourage (-2) this move
;   if enemy is slower than player or speedtied and its HP is strictly above 25%.
	call AICompareSpeed
	ret c
	call AICheckEnemyQuarterHP
	ret nc
	call AI_80_20
	ret c
	dec [hl]
	dec [hl]
	ret

.maybe_discourage
	call AI_50_50
	ret c
	inc [hl]
	ret

AI_Smart_SpeedDownHit:
; Icy Wind
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; 88% (226/256) to greatly encourage (-2) this move if these conditions all meet:
; - Enemy's HP is strictly higher than 25%.
; - It's the first turn of player's Pokemon.
; - Player is strictly faster than enemy.

; move ┬ (enemy HP <= 25%) ─► nothing
;      └ (else) ┬ (player turn > 0) ─► nothing
;               └ (else) ┬ (player is slower or speedtied) ─► nothing
;                        └ (else) ┬► 12% nothing
;                                 └► 88% greatly encourage (-2)

	ld a, [wEnemyMoveStruct + MOVE_ANIM]
	cp ICY_WIND
	ret nz
	call AICheckEnemyQuarterHP
	ret nc
	ld a, [wPlayerTurnsTaken]
	and a
	ret nz
	call AICompareSpeed
	ret c
	call Random
	cp 12 percent
	ret c
	dec [hl]
	dec [hl]
	ret

AI_Smart_Substitute:
; Modifiable scores : SELECTED_MOVE | Randomness : NO

; Dismiss (+10) this move if enemy's HP is 50% or below.

; move ┬ (enemy HP <= 50%) ─► dismiss (+10)
;      └ (enemy HP > 50%) ─► nothing

	call AICheckEnemyHalfHP
	ret c
	jp AIDismissMove

AI_Smart_HyperBeam:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; Maybe encourage this move at low enemy HP. Discourage at high HP.

;                         ┌► 16% nothing
; move ┬ (enemy HP > 50%) ┼► 42% discourage (+1)
;      │                  └► 42% greatly discourage (+2)
;      ├ (enemy HP in ]25%;50%]) ─► nothing
;      └ (enemy HP <= 25%) ┬► 50% encourage (-1)
;                          └► 50% nothing

	call AICheckEnemyHalfHP
	jr c, .randomly_discourage

; 50% to encourage this move if enemy's HP is 25% or below.
	call AICheckEnemyQuarterHP
	ret c
	call AI_50_50
	ret c
	dec [hl]
	ret

.randomly_discourage
; If enemy's HP is strictly above 50%, discourage this move as follows :
; - 16% nothing
; - 42% discourage (+1)
; - 42% greatly discourage (+2)
	call Random
	cp 16 percent
	ret c
	inc [hl]
	call AI_50_50
	ret c
	inc [hl]
	ret

AI_Smart_Rage:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

;                                  ┌► 50% greatly encourage (-3)
; move ┬ (enemy Rage counter > 2) ─┴►┌► 50% greatly encourage (-2)
;      ├ (enemy Rage counter is 2) ──┴►┌► 50% encourage (-1)   
;      ├ (enemy Rage counter is 1) ────┴► 50% nothing 
;      └ (not in Rage) ┬ (enemy HP > 50%) ┬► 20% encourage (-1)
;                      │                  └► 80% nothing
;                      └ (enemy HP <= 50%) ─► discourage (+1)

	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_RAGE, a
	jr z, .notbuilding

; If enemy's Rage is building, 50% to encourage (-1) this move.
	call AI_50_50
	jr c, .skipencourage

	dec [hl]

; Encourage this move based on Rage's counter :
; - encourage (-1) if is 2
; - greatly encourage if is greater or equal to 3
.skipencourage
	ld a, [wEnemyRageCounter]
	cp 2
	ret c
	dec [hl]
	ld a, [wEnemyRageCounter]
	cp 3
	ret c
	dec [hl]
	ret

.notbuilding
; If enemy's Rage is not building, discourage (+1) this move 
;   if enemy's HP is 50% or below.
	call AICheckEnemyHalfHP
	jr nc, .discourage

; 20% to encourage (-1) this move otherwise.
	call AI_80_20
	ret nc
	dec [hl]
	ret

.discourage
	inc [hl]
	ret

AI_Smart_Mimic:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; Dismiss (+10) if both conditions apply :
; - player hasn't used a move yet.
; - enemy is strictly faster than the player.
; Discourage (+1) if any condition applies :
; - player hasn't used a move yet and is faster or speedtied with the enemy.
; - enemy HP is 50% or below.
; - player is immune or resistant to last player move.
; 50% to encourage (-1) if last player move is super effective against the player.
; Another 50% to encourage (-1) if the last player move is in UsefulMoves.

; move ┬ (player hasn't used a move) ┬ (enemy is strictly faster) ─► dismiss (+10)
;      │                             └ (else) ─► discourage (+1)
;      └ (has) ┬ (enemy HP <= 50%) ─► discourage (+1)
;              └ (else) ┬ (player is immune or resistant...
;                       │ (...to his last move) ─► discourage (+1)
;                       ├ (player is neutral...) ─► nothing          ┌► 25% (-2)
;                       └ (player is weak...) ┬ (and in UsefulMoves) ┼► 50% (-1) 
;                                             └ (not) ┬► 50% (-1)    └► 25% nothing 
;                                                     └► 50% nothing

	ld a, [wLastPlayerCounterMove]
	and a
	jr z, .dismiss

	call AICheckEnemyHalfHP
	jr nc, .discourage

	push hl
	ld a, [wLastPlayerCounterMove]
	call AIGetEnemyMove

	ld a, 1
	ldh [hBattleTurn], a
	callfar BattleCheckTypeMatchup

	ld a, [wTypeMatchup]
	cp EFFECTIVE
	pop hl
	jr c, .discourage
	jr z, .skip_encourage

	call AI_50_50
	jr c, .skip_encourage

	dec [hl]

.skip_encourage
	ld a, [wLastPlayerCounterMove]
	push hl
	ld hl, UsefulMoves
	ld de, 1
	call IsInArray

	pop hl
	ret nc
	call AI_50_50
	ret c
	dec [hl]
	ret

.dismiss
; Dismiss (+10) this move if the enemy is strictly faster than the player.
	call AICompareSpeed
	jp c, AIDismissMove

.discourage
	inc [hl]
	ret

AI_Smart_Counter:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; 60% to encourage (-1) if the player used # physical moves with power > 0 :
; - # > 2.
; - # is 1 or 2, and the last player move was one of them.
; Discourage (+1) if the player used no physical move with power > 0.

; move ┬ (player used > 2 physical...)
;      │ (...moves with power > 0) ───────────────────┐
;      ├ (1 or 2) ┬ (last player move is one of them) ┴┬► 60% encourage (-1)
;      │          └ (not) ─► nothing                   └► 40% nothing
;      └ (0) ─► discourage (+1)

	push hl
	ld hl, wPlayerUsedMoves
	ld c, NUM_MOVES
	ld b, 0

.playermoveloop
	ld a, [hli]
	and a
	jr z, .skipmove

	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .skipmove

	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	cp SPECIAL
	jr nc, .skipmove

	inc b

.skipmove
	dec c
	jr nz, .playermoveloop

	pop hl
	ld a, b
	and a
	jr z, .discourage

	cp 3
	jr nc, .maybe_encourage

	ld a, [wLastPlayerCounterMove]
	and a
	jr z, .done

	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .done

	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	cp SPECIAL
	jr nc, .done

.maybe_encourage
	call Random
	cp 39 percent + 1
	jr c, .done

	dec [hl]

.done
	ret

.discourage
	inc [hl]
	ret

AI_Smart_Encore:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; Greatly discourage (+3) if any of the following conditions applies :
; - player is faster than the enemy or speedtied.
; - last player move is not in EncoreMoves and any applies : 
;   - power = 0.
;   - power > 0 and neutral or super-effective against the enemy.
; Dismiss (+10) if the player hasn't used a move yet.
; 72% to greatly encourage (-2) if last player move has no effect on the enemy.

; move ┬ (player is slower or speedtied) ─► greatly discourage (+3)
;      └ (not) ┬ (player hasn't used a move yet) ─► dismiss (+10)
;              └ (has) ┬ (power = 0) ── [A]
;                      └ (else) ┬ (neutral or super-effective) ── [A]
;                               ├ (not very effective) ─► nothing
;                               └ (enemy is immune) ┬►┌► 72% greatly encourage (-2)
;                                                   └►├► 28% nothing
; [A] ┬ (last player move is in EncoreMoves) ─────────┘
;     └ (else) ─► greatly discourage (+3)

; BUG : the raw call to `CheckTypeMatchup` might have some oversights.
; - Contrarily to the general comment of this routine, since `wEnemyMoveStruct` is
;     populated with the last player move, this will be used properly in
;     `CheckTypeMatchup` (putting it in `a` is indeed not how to use the matchup
;     routine, but it is irrrelevant in that case).
; - However, if the AI flow can lead to this clause being called with a 
;     `hBattleTurn` set to 0, the type matchup will consider the player types
;     instead of the enemy types.

; - AI layers which can cause this oversight if called before `AI_Smart_Encore`
;   (without `hBattleTurn` being set back to 1 unvoluntarily) :
;   - `AI_Smart_Conversion2`
;   - TODO : there could be some other very tricky situations like the last turn
;     using Metronome->Conversion2 if the AI switching conserves `hBattleTurn`, etc.
  
; - AI layers which unvoluntarily avoid this oversight (by setting `hBattleTurn` to 1) :
;   - `AI_Types` (SuperNerd, Juggler, ExecutiveM/F, PokefanM/F).
;   - `AI_Status` reaching the `.typeimmunity` jump label.
;   - `AI_Smart_LeechHit`.
;   - `AI_Smart_LockOn` when the player isn't locked on.
;   - `AI_Smart_Mimic` when player used a move & enemy HP > 50%.
;   - `AI_Smart_PriorityHit` when the enemy is slower or speedtied 
;        and the player is not using Fly or Dig.
;   - `AI_Smart_HiddenPower`.

	call AICompareSpeed
	jr nc, .greatly_discourage

	ld a, [wLastPlayerMove]
	and a
	jp z, AIDismissMove

	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .no_power_move

	push hl
	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	ld hl, wEnemyMonType1
	predef CheckTypeMatchup

	pop hl
	ld a, [wTypeMatchup]
	cp EFFECTIVE
	jr nc, .strong_against_enemy_move

	and a
	ret nz
	jr .maybe_greatly_encourage

.no_power_move
.strong_against_enemy_move
	push hl
	ld a, [wLastPlayerCounterMove]
	ld hl, EncoreMoves
	ld de, 1
	call IsInArray
	pop hl
	jr nc, .greatly_discourage

.maybe_greatly_encourage
	call Random
	cp 28 percent - 1
	ret c
	dec [hl]
	dec [hl]
	ret

.greatly_discourage
	inc [hl]
	inc [hl]
	inc [hl]
	ret

INCLUDE "data/battle/ai/encore_moves.asm"

AI_Smart_PainSplit:
; Modifiable scores : SELECTED_MOVE | Randomness : NO

; Discourage (+1) this move if [enemy's current HP * 2 > player's current HP].

; move ┬ (2 * enemy HP > player HP) ─► discourage (+1)
;      └ (else) ─► nothing

	push hl
	ld hl, wEnemyMonHP
	ld b, [hl]
	inc hl
	ld c, [hl]
	sla c
	rl b
	ld hl, wBattleMonHP + 1
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	pop hl
	ret nc
	inc [hl]
	ret

AI_Smart_Snore:
AI_Smart_SleepTalk:
; Modifiable scores : SELECTED_MOVE | Randomness : NO

; Greatly encourage (-3) this move if enemy is fast asleep and won't wake up.
; Greatly discourage (+3) this move otherwise.

; move ┬ (enemy is asleep and won't wake up next turn) ─► greatly encourage (-3)
;      └ (not) ─► greatly discourage (+3)

; NOTE : The enemy "cheats" here, since neither the enemy or the player
;   should know when their sleep is gonna stop.

	ld a, [wEnemyMonStatus]
	and SLP
	cp 1
	jr z, .greatly_discourage

	dec [hl]
	dec [hl]
	dec [hl]
	ret

.greatly_discourage
	inc [hl]
	inc [hl]
	inc [hl]
	ret

AI_Smart_DefrostOpponent:
; Modifiable scores : SELECTED_MOVE | Randomness : NO

; Greatly encourage (-3) this move if enemy is frozen.
; No move has EFFECT_DEFROST_OPPONENT, so this layer is unused.

; move ┬ (enemy is frozen) ─► greatly encourage (-3)
;      └ (not) ─► nothing

	ld a, [wEnemyMonStatus]
	and 1 << FRZ
	ret z
	dec [hl]
	dec [hl]
	dec [hl]
	ret

AI_Smart_Spite:
; Modifiable scores : SELECTED_MOVE | Randomness : NO

; If the player hasn't used a move : 
;   - dismiss (+10) if the enemy is strictly faster than the player.
;   - 50% to discourage (+1) otherwise.
; If the player used a move :
;   - 60% to greatly encourage (-2) if last move PP count is between 0 and 5.
;   - 40% to discourage (+1) if last move PP count is between 6 and 14.
;   - discourage (+1) if last move PP count is 15 or more.

;                             ┌ (left PP >= 15) ─► discourage (+1)
; move ┬ (played used a move) ┼ (6 <= left PP <= 14) ┬► 40% discourage (+1)
;      │                      │                      └► 60% nothing
;      │                      └ (left PP <= 5) ┬► 60% to greatly encourage (-2)
;      │                                       └► 40% nothing
;      └ (not) ┬ (enemy is strictly faster) ─► dismiss (+10)
;              └ (not) ┬► 50% discourage (+1)
;                      └► 50% nothing

	ld a, [wLastPlayerCounterMove]
	and a
	jr nz, .usedmove

	call AICompareSpeed
	jp c, AIDismissMove

	call AI_50_50
	ret c
	inc [hl]
	ret

.usedmove
	push hl
	ld b, a
	ld c, NUM_MOVES
	ld hl, wBattleMonMoves
	ld de, wBattleMonPP

.moveloop
	ld a, [hli]
	cp b
	jr z, .foundmove

	inc de
	dec c
	jr nz, .moveloop

	pop hl
	ret

.foundmove
	pop hl
	ld a, [de]
	cp 6
	jr c, .maybe_greatly_encourage
	cp 15
	jr nc, .discourage

	call Random
	cp 39 percent + 1
	ret nc

.discourage
	inc [hl]
	ret

.maybe_greatly_encourage
	call Random
	cp 39 percent + 1
	ret c
	dec [hl]
	dec [hl]
	ret

.dismiss ; unreferenced
	jp AIDismissMove

AI_Smart_DestinyBond:
AI_Smart_Reversal:
AI_Smart_SkullBash:
; Modifiable scores : SELECTED_MOVE | Randomness : NO

; Discourage (+1) this move if enemy's HP is strictly above 25%.

; move ┬ (enemy HP > 25%) ─► discourage (+1)
;      └ (enemy HP <= 25%) ─► nothing

	call AICheckEnemyQuarterHP
	ret nc
	inc [hl]
	ret

AI_Smart_HealBell:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; Dismiss (+10) this move if none of the enemy's Pokemon is statused.
; Encourage (-1) this move if the enemy is statused.
; 50% chance to greatly encourage (-2) this move if the enemy is asleep or frozen.

; move ┬ (no other enemy mon has status) ┬ (enemy has statused) ─► nothing
;      │                                 └ (not) ─► dismiss (+10)
;      └ (there is) ┬ (enemy has status) ┬ (FRZ or SLP) ┬► 50% greatly encourage (-3)
;                   └ (not) ─► nothing   └ (neither) ──►└► 50% encourage (-1)

; ENHANCE : since the enemy can't use a move while asleep or frozen (at the exception
;   of Sleep Talk -> Heal Bell while asleep), the last encouragement is of no use.
;   A possible enhancement could be to reload `c` into `a` before checking FRZ or SLP, 
;   which would lead to encouraging Heal Bell if any enemy Pokemon 
;   is asleep or frozen, instead of the sole enemy on the field.

	push hl
	ld a, [wOTPartyCount]
	ld b, a
	ld c, 0
	ld hl, wOTPartyMon1HP
	ld de, PARTYMON_STRUCT_LENGTH

.loop
	push hl
	ld a, [hli]
	or [hl]
	jr z, .next

	; status
	dec hl
	dec hl
	dec hl
	ld a, [hl]
	or c
	ld c, a

.next
	pop hl
	add hl, de
	dec b
	jr nz, .loop

	pop hl
	ld a, c
	and a
	jr z, .no_status

	ld a, [wEnemyMonStatus]
	and a
	jr z, .ok
	dec [hl]
.ok
;	ld a, c
	and 1 << FRZ | SLP
	ret z
	call AI_50_50
	ret c
	dec [hl]
	dec [hl]
	ret

.no_status
	ld a, [wEnemyMonStatus]
	and a
	ret nz
	jp AIDismissMove


AI_Smart_PriorityHit:
; Modifiable scores : SELECTED_MOVE | Randomness : NO

; move ┬ (enemy strictly faster) ─► nothing
;      └ (not) ┬ (player is using Fly or Dig) ─► dismiss (+10)
;              └ (not) ┬ (max damage > current player HP) ─► greatly encourage (-3)
;                      └► nothing

; Don't change anything if the enemy is strictly faster than the player.
	call AICompareSpeed
	ret c

; Dismiss (+10) this move if the player is flying or underground.
	ld a, [wPlayerSubStatus3]
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	jp nz, AIDismissMove

; Greatly encourage (-3) this move if max damage > player current HP.
	ld a, 1
	ldh [hBattleTurn], a
	push hl
	callfar EnemyAttackDamage
	callfar BattleCommand_DamageCalc
	callfar BattleCommand_Stab
	pop hl
	ld a, [wCurDamage + 1]
	ld c, a
	ld a, [wCurDamage]
	ld b, a
	ld a, [wBattleMonHP + 1]
	cp c
	ld a, [wBattleMonHP]
	sbc b
	ret nc
	dec [hl]
	dec [hl]
	dec [hl]
	ret

AI_Smart_Thief:
; Modifiable scores : SELECTED_MOVE | Randomness : NO

; Don't use Thief unless it's the only move available.

; move ─► dismiss!!! (+30) 

	ld a, [hl]
	add $1e
	ld [hl], a
	ret

AI_Smart_Conversion2:
; Modifiable scores : SELECTED_MOVE | Randomness : NO

; 90% to discourage if the player used a move.

; move ┬ (player used a move) ┬► 90% discourage (+1)
;      └ (not) ─► nothing     └► 10% nothing

; BUG : the first check was probably meant to be "jr z, ...".
; Instead, a underflows to 255, hl ends up being at EvolveAfterBattle_MasterLoop+2 (RO10:61F7)
; Corresponding instruction is "ld hl, wCurPartyMon" in asm -> 21 09 D1
; In other words, [EvolveAfterBattle_MasterLoop+2] = D1 (high byte of wCurPartyMon)
; This D1 is set as the player move type, CheckTypeMatchup will keep wTypeMatchup = 10
; Then comparison doesn't carry, so scoring of Conversion2 is unchanged.
; However, when Conversion2 move effect is applied, type is considered correctly.

; FIX : change "jr nz, .certainly_discourage" to "jr z, .certainly_discourage",
; in order to 90% discourage (+1) Conversion2 when the player hasn't used a move yet,
;   or a move that is not very effective or has no effect on the enemy,
; or 50% encourage (-1) if last player move super effective against the enemy.

	ld a, [wLastPlayerMove]
	and a
	jr nz, .certainly_discourage

	push hl
	dec a
	ld hl, Moves + MOVE_TYPE
	ld bc, MOVE_LENGTH
	call AddNTimes

	ld a, BANK(Moves)
	call GetFarByte
	ld [wPlayerMoveStruct + MOVE_TYPE], a

	xor a
	ldh [hBattleTurn], a

	callfar BattleCheckTypeMatchup

	ld a, [wTypeMatchup]
	cp EFFECTIVE
	pop hl
	jr c, .certainly_discourage
	ret z

	call AI_50_50
	ret c

	dec [hl]
	ret

.certainly_discourage
	call Random
	cp 10 percent
	ret c
	inc [hl]
	ret

AI_Smart_Disable:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

;                                                                    ┌► 61% encourage (-1)
; move ┬ (enemy strictly faster) ┬ (last player move in UsefulMoves) ┴► 39% nothing
;      │                         └ (not) ┬ (power > 0) ─► nothing
;      │                                 └ (power = 0) ┐
;      └ (player is faster or speedtied) ────────────┬►├► 92% discourage (+1)    
;                                                    └►└► 8% nothing

; 92% (236/256) to discourage (+1) if the player is faster than the enemy or speedtied,
;   or the player has not used a damaging move or a move in UsefulMoves.
; Otherwise, 61% (156/256) to encourage (-1) if enemy is strictly faster
;   and last player move is in UsefulMoves.

	call AICompareSpeed
	jr nc, .certainly_discourage

	push hl
	ld a, [wLastPlayerCounterMove]
	ld hl, UsefulMoves
	ld de, 1
	call IsInArray

	pop hl
	jr nc, .notencourage

	call Random
	cp 39 percent + 1
	ret c
	dec [hl]
	ret

.notencourage
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	ret nz

.certainly_discourage
	call Random
	cp 8 percent
	ret c
	inc [hl]
	ret

AI_Smart_MeanLook:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; move ┬ (enemy HP <= 50%) ─► discourage (+1)
;      └ (> 50%) ┬ (is last player mon) ─► dismiss (+10)
;                └ (not) ┬ (enemy is toxic'd) ── [A]
;                        └ (not) ┬ (player is infatuated, identified...
;                                │ (... in Rollout or Nightmare) ── [A]
;                                └ (not) ┬ (player only has used not very...
; [A] ┬► 80% greatly encourage (-3)      │ (...effective moves) ─► nothing
;     └► 20% nothing                     └ (has) ─► discourage (+1)

	call AICheckEnemyHalfHP
	jr nc, .discourage

	push hl
	call AICheckLastPlayerMon
	pop hl
	jp z, AIDismissMove

; 80% chance to greatly encourage this move if the enemy is badly poisoned (buggy).
; Should check wPlayerSubStatus5 instead.
	ld a, [wEnemySubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, .certainly_greatly_encourage

; 80% chance to greatly encourage this move if the player is either
; in love, identified, stuck in Rollout, or has a Nightmare.
	ld a, [wPlayerSubStatus1]
	and 1 << SUBSTATUS_IN_LOVE | 1 << SUBSTATUS_ROLLOUT | 1 << SUBSTATUS_IDENTIFIED | 1 << SUBSTATUS_NIGHTMARE
	jr nz, .certainly_greatly_encourage

; Otherwise, discourage (+1) this move unless the player only has 
;   not very effective moves against the enemy.
	push hl
	callfar CheckPlayerMoveTypeMatchups
	ld a, [wEnemyAISwitchScore]
	cp BASE_AI_SWITCH_SCORE + 1 ; not very effective
	pop hl
	ret nc

.discourage
	inc [hl]
	ret

.certainly_greatly_encourage
	call AI_80_20
	ret c
	dec [hl]
	dec [hl]
	dec [hl]
	ret

AICheckLastPlayerMon:
; Return z if the player has no other mon alive.
	ld a, [wPartyCount]
	ld b, a
	ld c, 0
	ld hl, wPartyMon1HP
	ld de, PARTYMON_STRUCT_LENGTH

.loop
	ld a, [wCurBattleMon]
	cp c
	jr z, .skip

	ld a, [hli]
	or [hl]
	ret nz
	dec hl

.skip
	add hl, de
	inc c
	dec b
	jr nz, .loop

	ret

AI_Smart_Nightmare:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; 50% chance to encourage (+1) this move.
; The AI_Basic layer will make sure that
; Dream Eater is only used against sleeping targets.

; move ┬► 50% encourage (-1)
;      └► 50% nothing

	call AI_50_50
	ret c
	dec [hl]
	ret

AI_Smart_FlameWheel:
; Modifiable scores : SELECTED_MOVE | Randomness : NO

; Approve (-5) this move if the enemy is frozen.

; move ┬ (enemy is frozen) ─► approve (-5)
;      └ (not) ─► nothing

	ld a, [wEnemyMonStatus]
	bit FRZ, a
	ret z
rept 5
	dec [hl]
endr
	ret

AI_Smart_Curse:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; For a ghost type enemey mon :
;   Dismiss (+10) if the player is already under Curse.
;   50% to greatly encourage (-2) if enemy has another mon alive, but not the player.
;   Disapprove (+4) if it is last enemy mon, but player has another one.
;   Otherwise, with enemy HP in : 
;   - ] 0%; 25%] : disapprove (+4).
;   - ]25%; 50%] : greatly discourage (+2).
;   - ]50%;100%[ : nothing
;   - 100% : if player has not played yet, 50% to greatly encourage (-2).
;
; For a non-ghost type enemy mon :
;   Discourage (+1) if enemy HP is 50% or below, 
;     or enemy attack level is between 4 and 6.
;   Do nothing if enemy attack level is between 2 and 3.
;   Otherwise, depending on the player types (type1 / type2) :
;   -  GHOST     / Any     : greatly discourage (+2).
;   -  SPECIAL   / Any     : nothing.
;   -  PHYSICAL* / SPECIAL : nothing.
;   -  PHYSICAL* / PHYSICAL: 80% to greatly encourage (-2). 
;      (* not GHOST)

; Ghost diagram :
; move ┬ (player already in Curse) ─► dismiss (+10)
;      └ (not) ┬ (is last enemy mon) ┬ (is last player mon) ── [A]
;              │                     └ (not) ─► disapprove (+4)
;              └ (not) ┬ (is last player mon) ┬► 50% greatly encourage (-2)
;                      └ (not) ── [A]         └► 50% nothing
; [A] ┬ (enemy HP <= 25%) ─► disapprove (+4)
;     ├ (25% < enemy HP <= 50%) ─► greatly discourage (+2)
;     ├ (50% < enemy HP < 100%) ─► nothing
;     └ (enemy HP = 100%) ┬ (player has used a move) ─► nothing
;                         └ (not) ┬► 50% greatly encourage (-2)
;                                 └► 50% nothing

; Non-ghost diagram :
; move ┬ (enemy HP <= 50%) ─► discourage (+1)
;      └ (else) ┬ (enemy Atk >= 4) ─► discourage (+1)
;               ├ (2 <= enemy Atk < 4) ─► nothing
;               └ (else) ┬ (player type1 is ghost) ─► greatly discourage (+2)
;                        ├ (player type1 is special) ─► nothing
;                        └ (else) ┬ (type2 is special) ─► nothing
;                                 └ (else) ┬► 80% greatly encourage (-2)
;                                          └► 20% nothing

	ld a, [wEnemyMonType1]
	cp GHOST
	jr z, .ghost_curse
	ld a, [wEnemyMonType2]
	cp GHOST
	jr z, .ghost_curse

	call AICheckEnemyHalfHP
	jr nc, .discourage

	ld a, [wEnemyAtkLevel]
	cp BASE_STAT_LEVEL + 4
	jr nc, .discourage
	cp BASE_STAT_LEVEL + 2
	ret nc

	ld a, [wBattleMonType1]
	cp GHOST
	jr z, .greatly_discourage
	cp SPECIAL
	ret nc
	ld a, [wBattleMonType2]
	cp SPECIAL
	ret nc
	call AI_80_20
	ret c
	dec [hl]
	dec [hl]
	ret

.disapprove
	inc [hl]
	inc [hl]
.greatly_discourage
	inc [hl]
.discourage
	inc [hl]
	ret

.ghost_curse
	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_CURSE, a
	jp nz, AIDismissMove

	push hl
	farcall FindAliveEnemyMons
	pop hl
	jr nc, .notlastmon

	push hl
	call AICheckLastPlayerMon
	pop hl
	jr nz, .disapprove

	jr .ghost_continue

.notlastmon
	push hl
	call AICheckLastPlayerMon
	pop hl
	jr z, .maybe_greatly_encourage

.ghost_continue
	call AICheckEnemyQuarterHP
	jp nc, .disapprove

	call AICheckEnemyHalfHP
	jr nc, .greatly_discourage

	call AICheckEnemyMaxHP
	ret nc

	ld a, [wPlayerTurnsTaken]
	and a
	ret nz

.maybe_greatly_encourage
	call AI_50_50
	ret c

	dec [hl]
	dec [hl]
	ret

AI_Smart_Protect:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

;                                     ┌► 92% greatly discourage (+3)
; move ┬ (enemy already used Protect) ┴► 8% discourage (+1)
;      ├ (player is not locked on) ──────────┬►┌► 92% greatly discourage (+2)
;      │                                     └►├► 8% nothing
;      ├ (player used Rollout 2 times or less) ┘
;      ├ (player used Rollout 3+ times) ────┐
;      ├ (player used Fury Cutter 3+ times) ┤
;      ├ (player charges a 2-turn move) ────┤
;      ├ (player is toxic'd) ───────────────┼┬► 80% encourage (-1)
;      ├ (player is seeded) ────────────────┤└► 20% nothing
;      ├ (player is cursed) ────────────────┘
;      └ (else) ─► nothing
;

; Greatly discourage this move if the enemy already used Protect.
	ld a, [wEnemyProtectCount]
	and a
	jr nz, .greatly_discourage

; Discourage this move if the player is locked on.
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_LOCK_ON, a
	jr nz, .certainly_greatly_discourage

; Encourage this move if the player's Fury Cutter is boosted enough.
	ld a, [wPlayerFuryCutterCount]
	cp 3
	jr nc, .certainly_encourage

; Encourage this move if the player has charged a two-turn move.
	ld a, [wPlayerSubStatus3]
	bit SUBSTATUS_CHARGED, a
	jr nz, .certainly_encourage

; Encourage this move if the player is affected by Toxic, Leech Seed, or Curse.
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, .certainly_encourage
	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_LEECH_SEED, a
	jr nz, .certainly_encourage
	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_CURSE, a
	jr nz, .certainly_encourage

; Discourage this move if the player's Rollout count is not boosted enough.
	bit SUBSTATUS_ROLLOUT, a
	jr z, .certainly_greatly_discourage
	ld a, [wPlayerRolloutCount]
	cp 3
	jr c, .certainly_greatly_discourage

; 80% chance to encourage (-1) this move otherwise.
.certainly_encourage
	call AI_80_20
	ret c

	dec [hl]
	ret

.greatly_discourage
	inc [hl]

.certainly_greatly_discourage
	call Random
	cp 8 percent
	ret c

	inc [hl]
	inc [hl]
	ret

AI_Smart_Foresight:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; move ┬ (enemy accuracy <= -3) ┐
;      ├ (player evasion >= +3) ┼┬► 61% greatly encourage (-2)
;      ├ (player is Ghost type) ┘└► 39% nothing
;      └ (else) ┬► 92% discourage (+1)
;               └► 8% nothing

; 61% chance to greatly encourage (-2) this move if ...

; ... the enemy's accuracy is sharply lowered.
	ld a, [wEnemyAccLevel]
	cp BASE_STAT_LEVEL - 2
	jr c, .maybe_greatly_encourage

; ... the player's evasion is sharply raised.
	ld a, [wPlayerEvaLevel]
	cp BASE_STAT_LEVEL + 3
	jr nc, .maybe_greatly_encourage

; ... the player is a Ghost type.
	ld a, [wBattleMonType1]
	cp GHOST
	jr z, .maybe_greatly_encourage
	ld a, [wBattleMonType2]
	cp GHOST
	jr z, .maybe_greatly_encourage

; 92% chance to discourage (+1) this move otherwise.
	call Random
	cp 8 percent
	ret c

	inc [hl]
	ret

.maybe_greatly_encourage
	call Random
	cp 39 percent + 1
	ret c

	dec [hl]
	dec [hl]
	ret

AI_Smart_PerishSong:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; Disapprove (+5) if it is last enemy mon.
; 50% to encourage (-1) if the player can't switch out / run away.
; 50% to discourage (+1) if player used moves are mostly neutral 
;   or super effective against the enemy.

; move ┬ (is last enemy mon) ─► disapprove (+5)
;      └ (not) ┬ (player can't escape) ┬► 50% encourage (-1)
;              │                       └► 50% nothing
;              └ (can) ┬ (player has used a super effective...
;                      │ (... move with power > 0) ─► nothing
;                      └ (not) ┬ (player typing is super effective) ─► nothing
;                              └ (not) ┬► 50% discourage (+1)
;                                      └► 50% nothing

	push hl
	callfar FindAliveEnemyMons
	pop hl
	jr c, .disapprove

	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_CANT_RUN, a
	jr nz, .maybe_encourage

	push hl
	callfar CheckPlayerMoveTypeMatchups
	ld a, [wEnemyAISwitchScore]
	cp BASE_AI_SWITCH_SCORE
	pop hl
	ret c

	call AI_50_50
	ret c

	inc [hl]
	ret

.maybe_encourage
	call AI_50_50
	ret c

	dec [hl]
	ret

.disapprove
	ld a, [hl]
	add 5
	ld [hl], a
	ret

AI_Smart_Sandstorm:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; move ┬ (player type is immune to Sandstorm) ─► greatly discourage (+2)
;      └ (not) ┬ (player HP <= 50%) ─► discourage (+1)
;              └ (player HP > 50%) ┬► 50% encourage (-1)
;                                  └► 50% nothing

; Greatly discourage (+2) this move if the player is immune to Sandstorm damage.
	ld a, [wBattleMonType1]
	push hl
	ld hl, .SandstormImmuneTypes
	ld de, 1
	call IsInArray
	pop hl
	jr c, .greatly_discourage

	ld a, [wBattleMonType2]
	push hl
	ld hl, .SandstormImmuneTypes
	ld de, 1
	call IsInArray
	pop hl
	jr c, .greatly_discourage

; Discourage (+1) this move if player's HP is 50% or below.
	call AICheckPlayerHalfHP
	jr nc, .discourage

; 50% chance to encourage (-1) this move otherwise.
	call AI_50_50
	ret c

	dec [hl]
	ret

.greatly_discourage
	inc [hl]
.discourage
	inc [hl]
	ret

.SandstormImmuneTypes:
	db ROCK
	db GROUND
	db STEEL
	db -1 ; end

AI_Smart_Endure:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; move ┬ (enemy has used Protect) ┐
;      ├ (enemy HP = 100%) ───────┴─► greatly discourage (-2)
;      ├ (enemy HP > 25%) ─► discourage (+1)
;      └ (else) ┬ (enemy has Reversal) ┬► 80% greatly encourage (-3)
;               │                      └► 20% nothing
;               └ (not) ┬ (player is locked on) ┬► 50% greatly encourage (-2)
;                       └ (not) ─► nothing      └► nothing

; Greatly discourage (+2) this move if the enemy already used Protect.
	ld a, [wEnemyProtectCount]
	and a
	jr nz, .greatly_discourage

; Greatly discourage (+2) this move if the enemy's HP is full.
	call AICheckEnemyMaxHP
	jr c, .greatly_discourage

; Discourage (+1) this move if the enemy's HP is strictly more than 25%.
	call AICheckEnemyQuarterHP
	jr c, .discourage

; If the enemy has Reversal...
	ld b, EFFECT_REVERSAL
	call AIHasMoveEffect
	jr nc, .no_reversal

; ...80% chance to greatly encourage (-3) this move.
	call AI_80_20
	ret c

	dec [hl]
	dec [hl]
	dec [hl]
	ret

.no_reversal
; If the enemy is not locked on, do nothing.
	ld a, [wEnemySubStatus5]
	bit SUBSTATUS_LOCK_ON, a
	ret z

; 50% chance to greatly encourage (-2) this move.
	call AI_50_50
	ret c

	dec [hl]
	dec [hl]
	ret

.greatly_discourage
	inc [hl]
.discourage
	inc [hl]
	ret

AI_Smart_FuryCutter:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; move ┬ (Fury Cutter count = 0) ─────────────┐           
;      ├ (count = 1) ─ encourage (-1) ────────┤
;      ├ (count = 2) ─ greatly encourage (-2) ┤
;      └ (count = 3) ─ greatly encourage (-3) ┴── AI_Smart_Rollout
;

; Encourage this move based on Fury Cutter's count.

	ld a, [wEnemyFuryCutterCount]
	and a
	jr z, AI_Smart_Rollout
	dec [hl]

	cp 2
	jr c, AI_Smart_Rollout
	dec [hl]
	dec [hl]

	cp 3
	jr c, AI_Smart_Rollout
	dec [hl]
	dec [hl]
	dec [hl]

	; fallthrough

AI_Smart_Rollout:
; Rollout, Fury Cutter
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; move ┬ (enemy is infatuated) ───────────────┐
;      ├ (enemy is confused) ─────────────────┤
;      ├ (enemy is paralysed) ────────────────┤
;      └ (else) ┬ (enemy HP <= 25%) ──────────┤
;               └ (else) ┬ (enemy acc <= -1) ─┤┌► 80% discourage (+1)
;                        ├ (player eva >= +1) ┴┴► 20% nothing
;                        └ (else) ┬► 78% greatly encourage (-2)
;                                 └► 22% nothing 
;

; 80% chance to discourage (+1) this move if the enemy is in love, 
;   confused, or paralyzed...
	ld a, [wEnemySubStatus1]
	bit SUBSTATUS_IN_LOVE, a
	jr nz, .maybe_discourage

	ld a, [wEnemySubStatus3]
	bit SUBSTATUS_CONFUSED, a
	jr nz, .maybe_discourage

	ld a, [wEnemyMonStatus]
	bit PAR, a
	jr nz, .maybe_discourage

;   ... or if the enemy's HP is 25% or below,
;   or if accuracy or evasion modifiers favour the player.
	call AICheckEnemyQuarterHP
	jr nc, .maybe_discourage

	ld a, [wEnemyAccLevel]
	cp BASE_STAT_LEVEL
	jr c, .maybe_discourage
	ld a, [wPlayerEvaLevel]
	cp BASE_STAT_LEVEL + 1
	jr nc, .maybe_discourage

; 78% chance to greatly encourage (-2) this move otherwise.
	call Random
	cp 79 percent - 1
	ret nc
	dec [hl]
	dec [hl]
	ret

.maybe_discourage
	call AI_80_20
	ret c
	inc [hl]
	ret

AI_Smart_Swagger:
AI_Smart_Attract:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; 78% chance to encourage (-1) this move during the first turn of player's Pokemon.
; 80% chance to discourage (+1) this move otherwise.

; move ┬ (is player first turn) ┬► 78% encourage (-1)
;      │                        └► 22% nothing
;      └ (not) ┬► 80% discourage (+1)
;              └► 20% nothing

	ld a, [wPlayerTurnsTaken]
	and a
	jr z, .first_turn

	call AI_80_20
	ret c
	inc [hl]
	ret

.first_turn
	call Random
	cp 79 percent - 1
	ret nc
	dec [hl]
	ret

AI_Smart_Safeguard:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; 80% chance to discourage (+1) this move if player's HP is 50% or below.

; move ┬ (player HP > 50%) ─► nothing
;      └ (player HP <= 50%) ┬► 80% discourage (+1)
;                           └► 20% nothing

	call AICheckPlayerHalfHP
	ret c
	call AI_80_20
	ret c
	inc [hl]
	ret

AI_Smart_Magnitude:
AI_Smart_Earthquake:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; move ┬ (last player move isn't Dig) ─► nothing   
;      │                                     greatly encourage (-2) ◄┐
;      └ (is) ┬ (player is underground) ┬ (enemy is strictly faster) ┘ 
;             │                         └ (not) ─► nothing
;             └ (not) ┬ (enemy is strictly faster) ─► nothing
;                     └ (not) ┬► 50% encourage (-1)
;                             └► 50% nothing


; Greatly encourage (-2) this move if the player is underground 
;   and the enemy is faster.
	ld a, [wLastPlayerCounterMove]
	cp DIG
	ret nz

	ld a, [wPlayerSubStatus3]
	bit SUBSTATUS_UNDERGROUND, a
	jr z, .could_dig

	call AICompareSpeed
	ret nc
	dec [hl]
	dec [hl]
	ret

.could_dig
; Try to predict if the player will use Dig this turn.

; 50% chance to encourage (-1) this move if the enemy is slower than the player,
;   or speedtied.
	call AICompareSpeed
	ret c

	call AI_50_50
	ret c

	dec [hl]
	ret

AI_Smart_BatonPass:
; Modifiable scores : SELECTED_MOVE | Randomness : NO

; Discourage (+1) this move if the player hasn't shown 
;   super-effective moves against the enemy.
; Consider player's type(s) if its moves are unknown.

; move ┬ (player has used a super effective...
;      │ (... move with power > 0) ─► nothing
;      └ (not) ┬ (player typing is super effective) ─► nothing
;              └ (not) ─► discourage (+1)

	push hl
	callfar CheckPlayerMoveTypeMatchups
	ld a, [wEnemyAISwitchScore]
	cp BASE_AI_SWITCH_SCORE
	pop hl
	ret c
	inc [hl]
	ret

AI_Smart_Pursuit:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; 50% chance to greatly encourage (-2) this move if player's HP is 25% or below.
; 80% chance to discourage (+1) this move otherwise.

; move ┬ (player HP <= 25%) ┬► 50% greatly encourage (-2)
;      │                    └► 50% nothing
;      └ (player HP > 25%) ┬► 80% discourage (+1)
;                          └► 20% nothing

	call AICheckPlayerQuarterHP
	jr nc, .maybe_greatly_encourage
	call AI_80_20
	ret c
	inc [hl]
	ret

.maybe_greatly_encourage
	call AI_50_50
	ret c
	dec [hl]
	dec [hl]
	ret

AI_Smart_RapidSpin:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; 80% chance to greatly encourage (-2) this move if the enemy is
; trapped (Bind effect), seeded, or scattered with spikes.

; move ┬ (enemy is wrapped) ──┐
;      ├ (enemy is seeded) ───┼┬► 80% greatly encourage (-2)
;      ├ (enemy is in Spikes) ┘└► 20% nothing
;      └ (else) ─► nothing

	ld a, [wEnemyWrapCount]
	and a
	jr nz, .certainly_greatly_encourage

	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_LEECH_SEED, a
	jr nz, .certainly_greatly_encourage

	ld a, [wEnemyScreens]
	bit SCREENS_SPIKES, a
	ret z

.certainly_greatly_encourage
	call AI_80_20
	ret c

	dec [hl]
	dec [hl]
	ret

AI_Smart_HiddenPower:
; Modifiable scores : SELECTED_MOVE | Randomness : NO

; move ┬ (player is immune or move...
;      │ (...is not very efffective) ┬► discourage (+1)
;      ├ (power < 50) ───────────────┘
;      └ (else) ┬ (move is super effective) ┬► encourage (-1)
;               ├ (power = 70) ─────────────┘
;               └ (else) ─► nothing

	push hl
	ld a, 1
	ldh [hBattleTurn], a

; Calculate Hidden Power's type and base power based on enemy's DVs.
	callfar HiddenPowerDamage
	callfar BattleCheckTypeMatchup
	pop hl

; Discourage (+1) Hidden Power if not very effective or player is immuned...
	ld a, [wTypeMatchup]
	cp EFFECTIVE
	jr c, .discourage

; ... or its base power is 49 or lower.
	ld a, d
	cp 50
	jr c, .discourage

; Encourage (-1) Hidden Power if super-effective...
	ld a, [wTypeMatchup]
	cp EFFECTIVE + 1
	jr nc, .encourage

; ... or its base power is 70.
	ld a, d
	cp 70
	ret c

.encourage
	dec [hl]
	ret

.discourage
	inc [hl]
	ret

AI_Smart_RainDance:
; Modifiable scores : SELECTED_MOVE | Randomness : YES (if reaches AI_Smart_WeatherMove)

; Greatly discourage (+3) this move if it would favour the player type-wise.
; Particularly, if the player is a Water-type.

; move ┬ (player is Water type) ─► Greatly discourage (+3)
;      ├ (player is Fire type) ── AIGoodWeatherType
;      └ (else) ── AI_Smart_WeatherMove w/ RainDanceMoves

	ld a, [wBattleMonType1]
	cp WATER
	jr z, AIBadWeatherType
	cp FIRE
	jr z, AIGoodWeatherType

	ld a, [wBattleMonType2]
	cp WATER
	jr z, AIBadWeatherType
	cp FIRE
	jr z, AIGoodWeatherType

	push hl
	ld hl, RainDanceMoves
	jr AI_Smart_WeatherMove

INCLUDE "data/battle/ai/rain_dance_moves.asm"

AI_Smart_SunnyDay:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; Greatly discourage (+3) this move if it would favour the player type-wise.
; Particularly, if the player is a Fire-type.

; move ┬ (player is Fire type) ─► Greatly discourage (+3)
;      ├ (player is Water type) ── AIGoodWeatherType
;      └ (else) ── AI_Smart_WeatherMove w/ SunnyDayMoves

	ld a, [wBattleMonType1]
	cp FIRE
	jr z, AIBadWeatherType
	cp WATER
	jr z, AIGoodWeatherType

	ld a, [wBattleMonType2]
	cp FIRE
	jr z, AIBadWeatherType
	cp WATER
	jr z, AIGoodWeatherType

	push hl
	ld hl, SunnyDayMoves

	; fallthrough

AI_Smart_WeatherMove:
; Rain Dance, Sunny Day
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; move ┬ (doesn't favour another enemy move) ─► Greatly discourage (+3)
;      └ (does) ┬ (player HP <= 50%) ─► Greatly discourage (+3)
;               └ (player HP > 50%) ┬► 50% encourage (-1)
;                                   └► 50 nothing

; Greatly discourage (+3) this move if the enemy doesn't have
; one of the useful Rain Dance or Sunny Day moves...
	call AIHasMoveInArray
	pop hl
	jr nc, AIBadWeatherType

; ... or if player's HP is 50% or below.
	call AICheckPlayerHalfHP
	jr nc, AIBadWeatherType

; 50% chance to encourage (-1) this move otherwise.
	call AI_50_50
	ret c

	dec [hl]
	ret

AIBadWeatherType:
; Greatly discourage (+3)
	inc [hl]
	inc [hl]
	inc [hl]
	ret

AIGoodWeatherType:
; Rain Dance, Sunny Day
; Modifiable scores : SELECTED_MOVE | Randomness : NO

; move ┬ (player HP <= 50%) ─► nothing
;      └ (else) ┬ (first player turn) ┬► greatly encourage (-2)
;               ├ (first enemy turn) ─┘
;               └ (else) ─► nothing

; Greatly encourage (-2) this move if it would disfavour 
;   the player type-wise and player's HP is strictly above 50%...
	call AICheckPlayerHalfHP
	ret nc

; ...as long as one of the following conditions meet:
; It's the first turn of the player's Pokemon.
	ld a, [wPlayerTurnsTaken]
	and a
	jr z, .greatly_encourage

; Or it's the first turn of the enemy's Pokemon.
	ld a, [wEnemyTurnsTaken]
	and a
	ret nz

.greatly_encourage
	dec [hl]
	dec [hl]
	ret

INCLUDE "data/battle/ai/sunny_day_moves.asm"

AI_Smart_BellyDrum:
; Modifiable scores : SELECTED_MOVE | Randomness : NO

; Disapprove (+5) this move if enemy's attack is +3 or more.
; Else, disapprove (+6) this move if enemy's HP is 50% or below.
; Else, discourage (+1) this move if enemy's HP is not full.

; move ┬ (enemy atk >= +3) ─► disapprove (+5)
;      └ (else) ┬ (enemy HP is full) ─► nothing
;               └ (not) ┬ (enemy HP <= 50%) ─► disapprove (+6)
;                       └ (50% < enemy HP < 100%) ─► discourage (+1)

	ld a, [wEnemyAtkLevel]
	cp BASE_STAT_LEVEL + 3
	jr nc, .disapprove

	call AICheckEnemyMaxHP
	ret c

	inc [hl]

	call AICheckEnemyHalfHP
	ret c

.disapprove
	ld a, [hl]
	add 5
	ld [hl], a
	ret

AI_Smart_PsychUp:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; move ┬ (enemy stat levels >= player stat levels) ─► greatly discourage (+2)
;      └ (else) ┬ (player accuracy >= -1) ┬┬► 80% encourage (-1)
;               ├ (enemy evasion <= 0) ───┘└► 20% nothing
;               └ (else) ─► nothing

	push hl
	ld hl, wEnemyAtkLevel
	ld b, NUM_LEVEL_STATS
	ld c, 100

; Calculate the sum of all enemy's stat level modifiers. 
;   Add 100 first to prevent underflow.
; Put the result in c. c will range between 58 and 142.
.enemy_loop
	ld a, [hli]
	sub BASE_STAT_LEVEL
	add c
	ld c, a
	dec b
	jr nz, .enemy_loop

; Calculate the sum of all player's stat level modifiers. Add 100 first to prevent underflow.
; Put the result in d. d will range between 58 and 142.
	ld hl, wPlayerAtkLevel
	ld b, NUM_LEVEL_STATS
	ld d, 100

.player_loop
	ld a, [hli]
	sub BASE_STAT_LEVEL
	add d
	ld d, a
	dec b
	jr nz, .player_loop

; Greatly discourage (+2) this move if enemy's stat levels are 
;   higher than player's or equal (if c>=d).
	ld a, c
	sub d
	pop hl
	jr nc, .greatly_discourage

; Else, 80% chance to encourage (-1) this move unless 
;   player's accuracy level is -2 or lower...
	ld a, [wPlayerAccLevel]
	cp BASE_STAT_LEVEL - 1
	ret c

; ...or enemy's evasion level is +1 or higher.
	ld a, [wEnemyEvaLevel]
	cp BASE_STAT_LEVEL + 1
	ret nc

	call AI_80_20
	ret c

	dec [hl]
	ret

.greatly_discourage
	inc [hl]
	inc [hl]
	ret

AI_Smart_MirrorCoat:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; 60% to encourage (-1) if the player used # special moves with power > 0 :
; - # > 2.
; - # is 1 or 2, and the last player move was one of them.
; Discourage (+1) if the player used no physical move with power > 0.

; move ┬ (player used > 2 special...)
;      │ (...moves with power > 0) ───────────────────┐
;      ├ (1 or 2) ┬ (last player move is one of them) ┴┬► 60% encourage (-1)
;      │          └ (not) ─► nothing                   └► 40% nothing
;      └ (0) ─► discourage (+1)

	push hl
	ld hl, wPlayerUsedMoves
	ld c, NUM_MOVES
	ld b, 0

.playermoveloop
	ld a, [hli]
	and a
	jr z, .skipmove

	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .skipmove

	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	cp SPECIAL
	jr c, .skipmove

	inc b

.skipmove
	dec c
	jr nz, .playermoveloop

	pop hl
	ld a, b
	and a
	jr z, .discourage

	cp 3
	jr nc, .maybe_encourage

	ld a, [wLastPlayerCounterMove]
	and a
	jr z, .done

	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .done

	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	cp SPECIAL
	jr c, .done

.maybe_encourage
	call Random
	cp 39 percent + 1
	jr c, .done
	dec [hl]

.done
	ret

.discourage
	inc [hl]
	ret

AI_Smart_Twister:
AI_Smart_Gust:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; move ┬ (last player move isn't Fly) ─► nothing   
;      │                                greatly encourage (-2) ◄┐
;      └ (is) ┬ (player is flying) ┬ (enemy is strictly faster) ┘ 
;             │                    └ (not) ─► nothing
;             └ (not) ┬ (enemy is strictly faster) ─► nothing
;                     └ (not) ┬► 50% encourage (-1)
;                             └► 50% nothing


; Greatly encourage (-2) this move if the player is flying 
;   and the enemy is strictly faster.
	ld a, [wLastPlayerCounterMove]
	cp FLY
	ret nz

	ld a, [wPlayerSubStatus3]
	bit SUBSTATUS_FLYING, a
	jr z, .couldFly

	call AICompareSpeed
	ret nc

	dec [hl]
	dec [hl]
	ret

; Try to predict if the player will use Fly this turn.
.couldFly

; 50% chance to encourage (-1) this move if the enemy is slower than the player
;   or speedtied.
	call AICompareSpeed
	ret c
	call AI_50_50
	ret c
	dec [hl]
	ret

AI_Smart_FutureSight:
; Modifiable scores : SELECTED_MOVE | Randomness : NO

; Greatly encourage (-2) this move if the player is
; flying or underground, and strictly slower than the enemy.

; move ┬ (player is faster or speedtied) ─► nothing
;      └ (else) ┬ (player is flying) ─────┬► greatly encourage (-2)
;               ├ (player is underground) ┘
;               └ (else) ─► nothing

	call AICompareSpeed
	ret nc

	ld a, [wPlayerSubStatus3]
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret z

	dec [hl]
	dec [hl]
	ret

AI_Smart_Stomp:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; 80% chance to encourage (-1) this move if the player has used Minimize.

; move ┬ (player has used Minimized) ┬► 80% encourage (-1)
;      └ (not) ─► nothing            └► 20% nothing

	ld a, [wPlayerMinimized]
	and a
	ret z

	call AI_80_20
	ret c

	dec [hl]
	ret

AI_Smart_Solarbeam:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; 80% chance to greatly encourage (-2) this move when it's sunny.
; 90% chance to greatly discourage (+2) this move when it's raining.

;                           ┌► 80% greatly encourage (-2)
; move ┬ (weather is sunny) ┴► 20% nothing
;      ├ (weather is rainy) ┬► 90% greatly discourage (+2)
;      │                    └► 10% nothing
;      └ (else) ─► nothing

	ld a, [wBattleWeather]
	cp WEATHER_SUN
	jr z, .certainly_greatly_encourage

	cp WEATHER_RAIN
	ret nz

	call Random
	cp 10 percent
	ret c

	inc [hl]
	inc [hl]
	ret

.certainly_greatly_encourage
	call AI_80_20
	ret c

	dec [hl]
	dec [hl]
	ret

AI_Smart_Thunder:
; Modifiable scores : SELECTED_MOVE | Randomness : YES

; 90% chance to discourage (+1) this move when it's sunny.

; move ┬ (is sunny) ┬► 90% discourage (+1)
;      │            └► 10% nothing
;      └ (else) ─► nothing

	ld a, [wBattleWeather]
	cp WEATHER_SUN
	ret nz

	call Random
	cp 10 percent
	ret c

	inc [hl]
	ret

AICompareSpeed:
; Return carry if enemy is strictly faster than player.

	push bc
	ld a, [wEnemyMonSpeed + 1]
	ld b, a
	ld a, [wBattleMonSpeed + 1]
	cp b
	ld a, [wEnemyMonSpeed]
	ld b, a
	ld a, [wBattleMonSpeed]
	sbc b
	pop bc
	ret

AICheckPlayerMaxHP:
	push hl
	push de
	push bc
	ld de, wBattleMonHP
	ld hl, wBattleMonMaxHP
	jr AICheckMaxHP

AICheckEnemyMaxHP:
	push hl
	push de
	push bc
	ld de, wEnemyMonHP
	ld hl, wEnemyMonMaxHP
	; fallthrough

AICheckMaxHP:
; Return carry if HP at de matches max HP at hl.

	ld a, [de]
	inc de
	cp [hl]
	jr nz, .not_max

	inc hl
	ld a, [de]
	cp [hl]
	jr nz, .not_max

	pop bc
	pop de
	pop hl
	scf
	ret

.not_max
	pop bc
	pop de
	pop hl
	and a
	ret

AICheckPlayerHalfHP:
; Return carry if player HP is strictly more than half.

	push hl
	ld hl, wBattleMonHP
	ld b, [hl]
	inc hl
	ld c, [hl]
	sla c
	rl b
	inc hl
	inc hl
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	pop hl
	ret

AICheckEnemyHalfHP:
; Return carry if enemy HP is strictly more than half.
	push hl
	push de
	push bc
	ld hl, wEnemyMonHP
	ld b, [hl]
	inc hl
	ld c, [hl]
	sla c
	rl b
	inc hl
	inc hl
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	pop bc
	pop de
	pop hl
	ret

AICheckEnemyQuarterHP:
; Return carry if enemy HP is strictly more than a quarter.
	push hl
	push de
	push bc
	ld hl, wEnemyMonHP
	ld b, [hl]
	inc hl
	ld c, [hl]
	sla c
	rl b
	sla c
	rl b
	inc hl
	inc hl
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	pop bc
	pop de
	pop hl
	ret

AICheckPlayerQuarterHP:
; Return carry if player HP is strictly more than a quarter.
	push hl
	ld hl, wBattleMonHP
	ld b, [hl]
	inc hl
	ld c, [hl]
	sla c
	rl b
	sla c
	rl b
	inc hl
	inc hl
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	pop hl
	ret

AIHasMoveEffect:
; Return carry if the enemy has move b.

	push hl
	ld hl, wEnemyMonMoves
	ld c, NUM_MOVES

.checkmove
	ld a, [hli]
	and a
	jr z, .no

	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	cp b
	jr z, .yes

	dec c
	jr nz, .checkmove

.no
	pop hl
	and a
	ret

.yes
	pop hl
	scf
	ret

AIHasMoveInArray:
; Return carry if the enemy has a move in array hl.

	push hl
	push de
	push bc

.next
	ld a, [hli]
	cp -1
	jr z, .done

	ld b, a
	ld c, NUM_MOVES + 1
	ld de, wEnemyMonMoves

.check
	dec c
	jr z, .next

	ld a, [de]
	inc de
	cp b
	jr nz, .check

	scf

.done
	pop bc
	pop de
	pop hl
	ret

INCLUDE "data/battle/ai/useful_moves.asm"

AI_Opportunist:
; Modifiable scores : ALL_MOVES | Randomness : YES

; Discourage stall moves when the enemy's HP is low.

; ┬ (enemy HP > 50%) ─► nothing
; ├ (25% < enemy HP <= 50%) ┬► 50% nothing
; │                         └─ 50% ┐
; └ (enemy HP <= 25%) ─────────────┴ for each move ┬ (is in StallMoves) ─► (+1)
;                                                  └ (not) ─► nothing

; Do nothing if enemy's HP is above 50%.
	call AICheckEnemyHalfHP
	ret c

; Discourage (+1) stall moves if enemy's HP is 25% or below.
	call AICheckEnemyQuarterHP
	jr nc, .lowhp

; 50% chance to discourage (+1) stall moves if enemy's HP is in ]25%;50%].
	call AI_50_50
	ret c

.lowhp
	ld hl, wBuffer1 - 1
	ld de, wEnemyMonMoves
	ld c, NUM_MOVES + 1
.checkmove
	inc hl
	dec c
	jr z, .done

	ld a, [de]
	inc de
	and a
	jr z, .done

	push hl
	push de
	push bc
	ld hl, StallMoves
	ld de, 1
	call IsInArray

	pop bc
	pop de
	pop hl
	jr nc, .checkmove

	inc [hl]
	jr .checkmove

.done
	ret

INCLUDE "data/battle/ai/stall_moves.asm"


AI_Aggressive:
; Modifiable scores : ALL_MOVES | Randomness : NO

; Use whatever does the most damage.

; Discourage (+1) all damaging moves but the one that does the most damage.
;   If several deal the same amount of damage, keep the last one.
; If no damaging move deals damage to the player (immune),
; no move will be discouraged

; find the highest damaging...
; ...move ┬ (there is none) ─► nothing
;         └ (there is) ─ for all other..
;                        ..move ┬ (power = 0) ───────────┬► nothing
;                               ├ (is in Reckless Moves) ┘
;                               └ (else) ─► discourage (+1)
;

; Figure out which attack does the most damage and put it in c.
	ld hl, wEnemyMonMoves
	ld bc, 0
	ld de, 0
.checkmove
	inc b
	ld a, b
	cp NUM_MOVES + 1
	jr z, .gotstrongestmove

	ld a, [hli]
	and a
	jr z, .gotstrongestmove

	push hl
	push de
	push bc
	call AIGetEnemyMove
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .nodamage
	call AIDamageCalc
	pop bc
	pop de
	pop hl

; Update current move if damage is highest so far
	ld a, [wCurDamage + 1]
	cp e
	ld a, [wCurDamage]
	sbc d
	jr c, .checkmove

	ld a, [wCurDamage + 1]
	ld e, a
	ld a, [wCurDamage]
	ld d, a
	ld c, b
	jr .checkmove

.nodamage
	pop bc
	pop de
	pop hl
	jr .checkmove

.gotstrongestmove
; Nothing we can do if no attacks did damage.
	ld a, c
	and a
	jr z, .done

; Discourage (+1) moves that do less damage unless they're reckless too.
	ld hl, wBuffer1 - 1
	ld de, wEnemyMonMoves
	ld b, 0
.checkmove2
	inc b
	ld a, b
	cp NUM_MOVES + 1
	jr z, .done

; Ignore this move if it is the highest damaging one.
	cp c
	ld a, [de]
	inc de
	inc hl
	jr z, .checkmove2

	call AIGetEnemyMove

; Ignore this move if its power is 0 or 1.
; Moves such as Seismic Toss, Hidden Power,
; Counter and Fissure have a base power of 1.
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	cp 2
	jr c, .checkmove2

; Ignore this move if it is reckless.
	push hl
	push de
	push bc
	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	ld hl, RecklessMoves
	ld de, 1
	call IsInArray
	pop bc
	pop de
	pop hl
	jr c, .checkmove2

; If we made it this far, discourage (+1) this move.
	inc [hl]
	jr .checkmove2

.done
	ret

INCLUDE "data/battle/ai/reckless_moves.asm"

AIDamageCalc:
	ld a, 1
	ldh [hBattleTurn], a
	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	ld de, 1
	ld hl, ConstantDamageEffects
	call IsInArray
	jr nc, .notconstant
	callfar BattleCommand_ConstantDamage
	ret

.notconstant
	callfar EnemyAttackDamage
	callfar BattleCommand_DamageCalc
	callfar BattleCommand_Stab
	ret

INCLUDE "data/battle/ai/constant_damage_effects.asm"

AI_Cautious:
; Modifiable scores : ALL_MOVES | Randomness : YES

; 90% chance to discourage (+1) moves with residual effects after the first turn.

; ┬ (is enemy first turn) ─► nothing
; └ (not) ─ for each move ┬ (is in ResidualMoves) ┬► 90% discourage (+1)
;                         └ (not) ─► nothing      └► 10% nothing

	ld a, [wEnemyTurnsTaken]
	and a
	ret z

	ld hl, wBuffer1 - 1
	ld de, wEnemyMonMoves
	ld c, NUM_MOVES + 1
.loop
	inc hl
	dec c
	ret z

	ld a, [de]
	inc de
	and a
	ret z

	push hl
	push de
	push bc
	ld hl, ResidualMoves
	ld de, 1
	call IsInArray

	pop bc
	pop de
	pop hl
	jr nc, .loop

	call Random
	cp 90 percent + 1
	ret nc

	inc [hl]
	jr .loop

INCLUDE "data/battle/ai/residual_moves.asm"


AI_Status:
; Modifiable scores : ALL_MOVES | Randomness : NO

; Dismiss (+10) status moves that don't affect the player, 
;   and damaging moves from which the player is immune thanks to its types.

; for each move ┬ (player is status- or...
;               │ (... type-immuned) ─► dismiss (+10)
;               └ (else) ─► nothing

	ld hl, wBuffer1 - 1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.checkmove
	dec b
	ret z

	inc hl
	ld a, [de]
	and a
	ret z

	inc de
	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	cp EFFECT_TOXIC
	jr z, .poisonimmunity
	cp EFFECT_POISON
	jr z, .poisonimmunity
	cp EFFECT_SLEEP
	jr z, .typeimmunity
	cp EFFECT_PARALYZE
	jr z, .typeimmunity

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .checkmove

	jr .typeimmunity

.poisonimmunity
	ld a, [wBattleMonType1]
	cp POISON
	jr z, .immune
	ld a, [wBattleMonType2]
	cp POISON
	jr z, .immune

.typeimmunity
	push hl
	push bc
	push de
	ld a, 1
	ldh [hBattleTurn], a
	callfar BattleCheckTypeMatchup
	pop de
	pop bc
	pop hl

	ld a, [wTypeMatchup]
	and a
	jr nz, .checkmove

.immune
	call AIDismissMove
	jr .checkmove


AI_Risky:
; Modifiable scores : ALL_MOVES | Randomness : YES

; Approve (-5) any move that will KO the target.
; Risky moves will often be an exception (see below).

; for each move ┬ (power = 0) ─► nothing
;               └ (else) ┬ (is not in RiskyMoves) ──────────────┬─ [A]
;                        └ (is) ┬ (enemy HP is not full) ┬─ 78% ┘
;                               └ (is) ─► nothing        └► 22% nothing
; [A] ┬ (damage > player HP) ─► approve (-5)
;     └ (else) ─► nothing

	ld hl, wBuffer1 - 1
	ld de, wEnemyMonMoves
	ld c, NUM_MOVES + 1
.checkmove
	inc hl
	dec c
	ret z

	ld a, [de]
	inc de
	and a
	ret z

	push de
	push bc
	push hl
	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .nextmove

; Don't use risky moves at max HP.
	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	ld de, 1
	ld hl, RiskyEffects
	call IsInArray
	jr nc, .checkko

	call AICheckEnemyMaxHP
	jr c, .nextmove

; Else, 78% chance to approve (+5) them if damage is strictly more than player HP.
	call Random
	cp 79 percent - 1
	jr c, .nextmove

.checkko
	call AIDamageCalc

	ld a, [wCurDamage + 1]
	ld e, a
	ld a, [wCurDamage]
	ld d, a
	ld a, [wBattleMonHP + 1]
	cp e
	ld a, [wBattleMonHP]
	sbc d
	jr nc, .nextmove

	pop hl
rept 5
	dec [hl]
endr
	push hl

.nextmove
	pop hl
	pop bc
	pop de
	jr .checkmove

INCLUDE "data/battle/ai/risky_effects.asm"


AI_None:
	ret

AIDismissMove:
; Add 10 to move score in hl.
	ld a, [hl]
	add 10
	ld [hl], a
	ret

AIGetEnemyMove:
; Load attributes of move a into ram.

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

	pop bc
	pop de
	pop hl
	ret

AI_80_20:
; 19.5% (50/256) to return c
	call Random
	cp 20 percent - 1
	ret

AI_50_50:
; 50% (128/256) to return c
	call Random
	cp 50 percent + 1
	ret
