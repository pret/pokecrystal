PresentPower:
	; chance, power
	db 40 percent,     40 ; 40% chance
	db 70 percent + 1, 80 ; 30% chance
	db 80 percent,    120 ; 10% chance
	db -1                 ; 20% chance to heal instead
