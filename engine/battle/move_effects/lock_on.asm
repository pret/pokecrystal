BattleCommand_LockOn:
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
	jp StdBattleTextbox

.fail
	call AnimateFailedMove
	jp PrintDidntAffect
