BattleCommand_DestinyBond: ; 35bff
; destinybond

	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	set SUBSTATUS_DESTINY_BOND, [hl]
	call AnimateCurrentMove
	ld hl, DestinyBondEffectText
	jp StdBattleTextBox

; 35c0f
