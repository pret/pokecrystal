; AI_RISKY will not use these effects at max HP
; even if they would KO the player.

RiskyEffects:
	db EFFECT_SELFDESTRUCT
	db EFFECT_OHKO
	db -1 ; end
