BattleCommand_Draco:
	ld a, [wAttackMissed]
	and a
	ret nz
	
	ld a, $10 | SP_ATTACK
	call LowerStat
	call BattleCommand_SwitchTurn
	call BattleCommand_StatDownMessage
	call ResetMiss
	jp BattleCommand_SwitchTurn
