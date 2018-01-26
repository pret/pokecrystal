; AI_BASIC discourages these effects if the player
; already has a status condition.

StatusOnlyEffects: ; 385db
	db EFFECT_SLEEP
	db EFFECT_TOXIC
	db EFFECT_POISON
	db EFFECT_PARALYZE
	db -1 ; end
; 385e0
