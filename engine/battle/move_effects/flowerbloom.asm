BattleCommand_FlowerBloom:
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVarAddr
	bit SUBSTATUS_BLOOM, [hl]
	jr nz, .cant_raise_stat
	set SUBSTATUS_BLOOM, [hl]

	call AnimateCurrentMove

	call BattleCommand_AttackUp2
	call BattleCommand_StatUpMessage

	call AnimateCurrentMove

	call BattleCommand_SpecialAttackUp2
	call BattleCommand_StatUpMessage

	xor a
	inc a
	ld [wBattleAnimParam], a
	call AnimateCurrentMove
	ret

.cant_raise_stat:
	ld a, $1
	ld [wFailedMessage], a
	ld a, $1
	ld [wAttackMissed], a
	ret
