mon_prob: MACRO
; percent, index
	db \1, \2 * 2
ENDM

GrassMonProbTable:
	mon_prob 20,  0 ; 20% chance
	mon_prob 35,  1 ; 15% chance
	mon_prob 50,  2 ; 15% chance
	mon_prob 65,  3 ; 15% chance
	mon_prob 80,  4 ; 15% chance
	mon_prob 95,  5 ; 15% chance
	mon_prob 100, 6 ;  5% chance

WaterMonProbTable:
	mon_prob 40,  0 ; 40% chance
	mon_prob 80,  1 ; 40% chance
	mon_prob 100, 2 ; 20% chance
