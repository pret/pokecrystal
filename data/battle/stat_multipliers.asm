; Multiplier ratios for all stats from modifier -6 to +6
; (except accuracy, see data/battle/accuracy_multipliers.asm).

; This table is identical to data/battle/stat_multipliers_2.asm.
; This one is used by CalcBattleStats.

StatLevelMultipliers:
	db  25, 100 ; -6 =  25%
	db  28, 100 ; -5 =  28%
	db  33, 100 ; -4 =  33%
	db  40, 100 ; -3 =  40%
	db  50, 100 ; -2 =  50%
	db  66, 100 ; -1 =  66%
	db   1,   1 ;  0 = 100%
	db  15,  10 ; +1 = 150%
	db   2,   1 ; +2 = 200%
	db  25,  10 ; +3 = 250%
	db   3,   1 ; +4 = 300%
	db  35,  10 ; +5 = 350%
	db   4,   1 ; +6 = 400%
