BattleCommand5a: ; 3766f
; endure

; Endure shares code with Protect. See protect.asm.

	call ProtectChance
	ret c

	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarPair
	set SUBSTATUS_ENDURE, [hl]

	call Function0x37e01

	ld hl, BracedItselfText
	jp StdBattleTextBox
; 37683

