BattleCommand_CloseCombat:
	ld a, [wAttackMissed]
	and a
	ret nz
	
	ld a, DEFENSE
	call LowerStat
	call BattleCommand_SwitchTurn
	call BattleCommand_StatDownMessage
	call ResetMiss
	call BattleCommand_SwitchTurn
	ld a, SP_DEFENSE
	call LowerStat
	call BattleCommand_SwitchTurn
	call BattleCommand_StatDownMessage
	call ResetMiss
	jp BattleCommand_SwitchTurn