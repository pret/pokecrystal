HappinessData_OlderHaircutBrother:
	db $4c, 2, HAPPINESS_OLDERCUT1 ; 30% chance
	db $80, 3, HAPPINESS_OLDERCUT2 ; 50% chance
	db $ff, 4, HAPPINESS_OLDERCUT3 ; 20% chance

HappinessData_YoungerHaircutBrother:
	db $9a, 2, HAPPINESS_YOUNGCUT1 ; 60% chance
	db $4c, 3, HAPPINESS_YOUNGCUT2 ; 30% chance
	db $ff, 4, HAPPINESS_YOUNGCUT3 ; 10% chance

HappinessData_DaisysGrooming:
	db $ff, 2, HAPPINESS_GROOMING ; 99.6% chance
