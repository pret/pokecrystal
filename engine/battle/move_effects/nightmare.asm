BattleCommand_Nightmare:
; Can't hit an absent opponent.

	call CheckHiddenOpponent
	jr nz, .failed

; Can't hit a substitute.

	call CheckSubstituteOpp
	jr nz, .failed

; Only works on a sleeping opponent.

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and SLP_MASK
	jr z, .failed

; Bail if the opponent is already having a nightmare.

	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_NIGHTMARE, [hl]
	jr nz, .failed

; Otherwise give the opponent a nightmare.

	set SUBSTATUS_NIGHTMARE, [hl]
	call AnimateCurrentMove
	ld hl, StartedNightmareText
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed
