BattleCommand_Rage: ; 36f1d
; rage
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	set SUBSTATUS_RAGE, [hl]
	ret

; 36f25
