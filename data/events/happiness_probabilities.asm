HappinessData_OlderHaircutBrother:
	db 30 percent,     2, HAPPINESS_OLDERCUT1 ; 30% chance
	db 50 percent + 1, 3, HAPPINESS_OLDERCUT2 ; 50% chance
	db -1,             4, HAPPINESS_OLDERCUT3 ; 20% chance

HappinessData_YoungerHaircutBrother:
	db 60 percent + 1, 2, HAPPINESS_YOUNGCUT1 ; 60% chance
	db 30 percent,     3, HAPPINESS_YOUNGCUT2 ; 30% chance
	db -1,             4, HAPPINESS_YOUNGCUT3 ; 10% chance

HappinessData_DaisysGrooming:
	db 50 percent,     2, HAPPINESS_GROOMING ; 50% chance
	db -1,             2, HAPPINESS_GROOMING ; 50% chance
