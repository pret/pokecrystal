BattleCommand_Hammer:
	ld a, [wAttackMissed]
	and a
	ret nz
	
	ld a, SPEED
	call LowerStat
	call BattleCommand_SwitchTurn
	call BattleCommand_StatDownMessage
	call ResetMiss
	jp BattleCommand_SwitchTurn