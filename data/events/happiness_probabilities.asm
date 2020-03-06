HappinessData_OlderHaircutBrother:
	db $4c, 2, HAPPINESS_OLDERCUT1 ; 30% chance
	db $80, 3, HAPPINESS_OLDERCUT2 ; 20% chance
	db $ff, 4, HAPPINESS_OLDERCUT3 ; 50% chance

HappinessData_YoungerHaircutBrother:
	db $9a, 2, HAPPINESS_YOUNGCUT1 ; 60% chance
	db $4c, 3, HAPPINESS_YOUNGCUT2 ; 10% chance
	db $ff, 4, HAPPINESS_YOUNGCUT3 ; 30% chance

HappinessData_DaisysGrooming:
	; These entries add up to 100% and fix a bug
	db $80, 2, HAPPINESS_GROOMING ; 50% chance
	db $ff, 2, HAPPINESS_GROOMING ; 50% chance
