BattleCommand_SleepTalk:
	call ClearLastMove
	ld a, [wAttackMissed]
	and a
	jr nz, .fail
	ldh a, [hBattleTurn]
	and a
	ld hl, wBattleMonMoves + 1
	ld a, [wDisabledMove]
	ld d, a
	jr z, .got_moves
	ld hl, wEnemyMonMoves + 1
	ld a, [wEnemyDisabledMove]
	ld d, a
.got_moves
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP_MASK
	jr z, .fail
	ld a, [hl]
	and a
	jr z, .fail
	call .safely_check_has_usable_move
	jr c, .fail
	dec hl
.sample_move
	push hl
	call BattleRandom
	maskbits NUM_MOVES
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	pop hl
	and a
	jr z, .sample_move
	ld e, a
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	cp e
	jr z, .sample_move
	ld a, e
	cp d
	jr z, .sample_move
	call .check_two_turn_move
	jr z, .sample_move
	ld a, BATTLE_VARS_MOVE
	call GetBattleVarAddr
	ld a, e
	ld [hl], a
	call CheckUserIsCharging
	jr nz, .charging
	ld a, [wBattleAnimParam]
	push af
	call BattleCommand_LowerSub
	pop af
	ld [wBattleAnimParam], a
.charging
	call LoadMoveAnim
	call UpdateMoveData
	jp ResetTurn

.fail
	call AnimateFailedMove
	jp TryPrintButItFailed

.safely_check_has_usable_move
	push hl
	push de
	push bc
	call .check_has_usable_move
	pop bc
	pop de
	pop hl
	ret

.check_has_usable_move
	ldh a, [hBattleTurn]
	and a
	ld a, [wDisabledMove]
	jr z, .got_move_2

	ld a, [wEnemyDisabledMove]
.got_move_2
	ld b, a
	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld c, a
	dec hl
	ld d, NUM_MOVES
.loop2
	ld a, [hl]
	and a
	jr z, .carry

	cp c
	jr z, .nope
	cp b
	jr z, .nope

	call .check_two_turn_move
	jr nz, .no_carry

.nope
	inc hl
	dec d
	jr nz, .loop2

.carry
	scf
	ret

.no_carry
	and a
	ret

.check_two_turn_move
	push hl
	push de
	push bc

	ld b, a
	callfar GetMoveEffect
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
