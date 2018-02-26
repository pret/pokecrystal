BattleCommand_LockOn: ; 35a53
; lockon

	call CheckSubstituteOpp
	jr nz, .fail

	ld a, [wAttackMissed]
	and a
	jr nz, .fail

	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	set SUBSTATUS_LOCK_ON, [hl]
	call AnimateCurrentMove

	ld hl, TookAimText
	jp StdBattleTextBox

.fail
	call AnimateFailedMove
	jp PrintDidntAffect

; 35a74
