BattleCommand_Endure: ; 3766f
; endure

; Endure shares code with Protect. See protect.asm.

	call ProtectChance
	ret c

	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	set SUBSTATUS_ENDURE, [hl]

	call AnimateCurrentMove

	ld hl, BracedItselfText
	jp StdBattleTextBox
; 37683
