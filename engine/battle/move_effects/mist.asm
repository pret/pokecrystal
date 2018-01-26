BattleCommand_Mist: ; 36c7e
; mist

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	bit SUBSTATUS_MIST, [hl]
	jr nz, .already_mist
	set SUBSTATUS_MIST, [hl]
	call AnimateCurrentMove
	ld hl, MistText
	jp StdBattleTextBox

.already_mist
	call AnimateFailedMove
	jp PrintButItFailed

; 36c98
