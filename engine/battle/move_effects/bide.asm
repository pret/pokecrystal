BattleCommand_StoreEnergy:
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	bit SUBSTATUS_BIDE, a
	ret z

	ld hl, wPlayerRolloutCount
	ldh a, [hBattleTurn]
	and a
	jr z, .check_still_storing_energy
	ld hl, wEnemyRolloutCount
.check_still_storing_energy
	dec [hl]
	jr nz, .still_storing

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	res SUBSTATUS_BIDE, [hl]

	ld hl, UnleashedEnergyText
	call StdBattleTextbox

	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVarAddr
	ld a, 1
	ld [hl], a
	ld hl, wPlayerDamageTaken + 1
	ld de, wPlayerCharging ; player
	ldh a, [hBattleTurn]
	and a
	jr z, .player
	ld hl, wEnemyDamageTaken + 1
	ld de, wEnemyCharging ; enemy
.player
	ld a, [hld]
	add a
	ld b, a
	ld [wCurDamage + 1], a
	ld a, [hl]
	rl a
	ld [wCurDamage], a
	jr nc, .not_maxed
	ld a, $ff
	ld [wCurDamage], a
	ld [wCurDamage + 1], a
.not_maxed
	or b
	jr nz, .built_up_something
	ld a, 1
	ld [wAttackMissed], a
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
	call StdBattleTextbox
	jp EndMoveEffect

BattleCommand_UnleashEnergy:
	ld de, wPlayerDamageTaken
	ld bc, wPlayerRolloutCount
	ldh a, [hBattleTurn]
	and a
	jr z, .got_damage
	ld de, wEnemyDamageTaken
	ld bc, wEnemyRolloutCount
.got_damage
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	set SUBSTATUS_BIDE, [hl]
	xor a
	ld [de], a
	inc de
	ld [de], a
	ld [wPlayerMoveStructEffect], a
	ld [wEnemyMoveStructEffect], a
	call BattleRandom
	and 1
	inc a
	inc a
	ld [bc], a
	ld a, 1
	ld [wBattleAnimParam], a
	call AnimateCurrentMove
	jp EndMoveEffect
