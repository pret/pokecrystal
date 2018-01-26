BattleCommand_HiddenPower: ; 37be8
; hiddenpower

	ld a, [AttackMissed]
	and a
	ret nz
	farcall HiddenPowerDamage
	ret

; 37bf4
