; Multiplier ratios for accuracy from modifier -6 to +6
; (for other stats, see data/battle/stat_multipliers.asm).

AccuracyLevelMultipliers:
	db  33, 100 ; -6 =  33%
	db  36, 100 ; -5 =  36%
	db  43, 100 ; -4 =  43%
	db  50, 100 ; -3 =  50%
	db  60, 100 ; -2 =  60%
	db  75, 100 ; -1 =  75%
	db   1,   1 ;  0 = 100%
	db 133, 100 ; +1 = 133%
	db 166, 100 ; +2 = 166%
	db   2,   1 ; +3 = 200%
	db 233, 100 ; +4 = 233%
	db 133,  50 ; +5 = 266%
	db   3,   1 ; +6 = 300%
