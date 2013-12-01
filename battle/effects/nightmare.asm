BattleCommand52: ; 37536
; nightmare

; Can't hit an absent opponent.

	call CheckHiddenOpponent
	jr nz, .failed

; Can't hit a substitute.

	call CheckSubstituteOpp
	jr nz, .failed

; Only works on a sleeping opponent.

	ld a, BATTLE_VARS_STATUS_OPP
	call _GetBattleVar
	and SLP
	jr z, .failed

; Bail if the opponent is already having a nightmare.

	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call _GetBattleVar
	bit SUBSTATUS_NIGHTMARE, [hl]
	jr nz, .failed

; Otherwise give the opponent a nightmare.

	set SUBSTATUS_NIGHTMARE, [hl]
	call Function0x37e01
	ld hl, StartedNightmareText
	jp StdBattleTextBox

.failed
	call Function0x37e77
	jp PrintButItFailed
; 37563

