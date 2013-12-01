BattleCommand57: ; 376a0
; foresight

	ld a, [AttackMissed]
	and a
	jr nz, .failed

	call CheckHiddenOpponent
	jr nz, .failed

	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call _GetBattleVar
	bit SUBSTATUS_IDENTIFIED, [hl]
	jr nz, .failed

	set SUBSTATUS_IDENTIFIED, [hl]
	call Function0x37e01
	ld hl, IdentifiedText
	jp StdBattleTextBox

.failed
	jp Function0x37354
; 376c2

