; See also data/items/heal_status.asm

HeldStatusHealingEffects:
	db HELD_HEAL_POISON,   1 << PSN
	db HELD_HEAL_FREEZE,   1 << FRZ
	db HELD_HEAL_BURN,     1 << BRN
	db HELD_HEAL_SLEEP,    SLP_MASK
	db HELD_HEAL_PARALYZE, 1 << PAR
	db HELD_HEAL_STATUS,   ALL_STATUS
	db -1 ; end
