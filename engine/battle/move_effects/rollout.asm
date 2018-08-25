MAX_ROLLOUT_COUNT EQU 5

BattleCommand_CheckCurl:
; checkcurl

	ld de, wPlayerRolloutCount
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, wEnemyRolloutCount
.ok
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVar
	bit SUBSTATUS_ROLLOUT, a
	jr z, .reset

	ld b, $4 ; doturn
	jp SkipToBattleCommand

.reset
	xor a
	ld [de], a
	ret

BattleCommand_RolloutPower:
; rolloutpower

	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP
	ret nz

	ld hl, wPlayerRolloutCount
	ldh a, [hBattleTurn]
	and a
	jr z, .got_rollout_count
	ld hl, wEnemyRolloutCount

.got_rollout_count
	ld a, [hl]
	and a
	jr nz, .skip_set_rampage
	ld a, 1
	ld [wSomeoneIsRampaging], a

.skip_set_rampage
	ld a, [wAttackMissed]
	and a
	jr z, .hit

	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	res 6, [hl]
	ret

.hit
	inc [hl]
	ld a, [hl]
	ld b, a
	cp MAX_ROLLOUT_COUNT
	jr c, .not_done_with_rollout

	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	res SUBSTATUS_ROLLOUT, [hl]
	jr .done_with_substatus_flag

.not_done_with_rollout
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	set SUBSTATUS_ROLLOUT, [hl]

.done_with_substatus_flag
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVar
	bit SUBSTATUS_CURLED, a
	jr z, .not_curled
	inc b
.not_curled
.loop
	dec b
	jr z, .done_damage

	ld hl, wCurDamage + 1
	sla [hl]
	dec hl
	rl [hl]
	jr nc, .loop

	ld a, $ff
	ld [hli], a
	ld [hl], a

.done_damage
	ret
