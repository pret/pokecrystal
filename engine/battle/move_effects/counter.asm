BattleCommand_Counter: ; 35813
; counter

	ld a, 1
	ld [AttackMissed], a
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	ret z

	ld b, a
	callfar GetMoveEffect
	ld a, b
	cp EFFECT_COUNTER
	ret z

	call BattleCommand_ResetTypeMatchup
	ld a, [wTypeMatchup]
	and a
	ret z

	call CheckOpponentWentFirst
	ret z

	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	dec a
	ld de, StringBuffer1
	call GetMoveData

	ld a, [StringBuffer1 + MOVE_POWER]
	and a
	ret z

	ld a, [StringBuffer1 + MOVE_TYPE]
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
