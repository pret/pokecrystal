BattleCommand5a: ; 3766f
; endure

	call ProtectChance
	ret c

	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarPair
	set SUBSTATUS_ENDURE, [hl]

	call Function0x37e01

	ld hl, BracedItselfText
	jp StdBattleTextBox
; 37683

