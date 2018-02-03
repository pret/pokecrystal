BattleCommand_HiddenPower: ; 37be8
; hiddenpower

	ld a, [wAttackMissed]
	and a
	ret nz
	farcall HiddenPowerDamage
	ret

; 37bf4
