TreeMons:
; entries correspond to TREEMON_SET_* constants
	table_width 2, TreeMons
	dw TreeMonSet_City
	dw TreeMonSet_Canyon
	dw TreeMonSet_Town
	dw TreeMonSet_Route
	dw TreeMonSet_Kanto
	dw TreeMonSet_Lake
	dw TreeMonSet_Forest
	dw TreeMonSet_Rock
	assert_table_length NUM_TREEMON_SETS
	dw TreeMonSet_City ; unused

; Two tables each (common, rare).
; Structure:
;	db  %, species, level

TreeMonSet_City:
TreeMonSet_Canyon:
; common
	db 50, EXEGGCUTE,  10
	db 15, HERACROSS,  10
	db 15, HERACROSS,  10
	db 10, AIPOM,      10
	db  5, AIPOM,      10
	db  5, AIPOM,      10
	db -1
; rare
	db 50, EXEGGCUTE,  10
	db 15, HERACROSS,  10
	db 15, HERACROSS,  10
	db 10, AIPOM,      10
	db  5, AIPOM,      10
	db  5, AIPOM,      10
	db -1

TreeMonSet_Town:
; common
	db 50, PINECO,     10
	db 15, EKANS,      10
	db 15, PINECO,     10
	db 10, AIPOM,      10
	db  5, AIPOM,      10
	db  5, AIPOM,      10
	db -1
; rare
	db 50, PINECO,     10
	db 15, EKANS,      10
	db 15, PINECO,     10
	db 10, AIPOM,      10
	db  5, AIPOM,      10
	db  5, AIPOM,      10
	db -1

TreeMonSet_Route:
; common
	db 50, AIPOM,	   10
	db 15, HOOTHOOT,   10
	db 15, AIPOM,      10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1
; rare
	db 50, AIPOM,	   10
	db 15, HOOTHOOT,   10
	db 15, AIPOM,      10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1

TreeMonSet_Kanto:
; common
	db 50, HERACROSS,  10
	db 15, EKANS,      10
	db 15, HERACROSS,  10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1
; rare
	db 50, HERACROSS,  10
	db 15, EKANS,      10
	db 15, HERACROSS,  10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1

TreeMonSet_Lake:
; common
	db 50, HERACROSS,  10
	db 15, AIPOM,      10
	db 15, HOOTHOOT,   10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1
; rare
	db 50, HERACROSS,  10
	db 15, AIPOM,      10
	db 15, HOOTHOOT,   10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1

TreeMonSet_Forest:
; common
	db 50, PINECO,     10
	db 15, PINECO,     10
	db 15, SPEAROW,    10
	db 10, SPEAROW,    10
	db  5, BUTTERFREE, 10
	db  5, BEEDRILL,   10
	db -1
; rare
	db 50, PINECO,     10
	db 15, PINECO,     10
	db 15, SPEAROW,    10
	db 10, SPEAROW,    10
	db  5, BUTTERFREE, 10
	db  5, BEEDRILL,   10
	db -1

TreeMonSet_Rock:
	db 45, OMANYTE,    15
	db 45, KABUTO,     15
	db 10, SHUCKLE,    15
	db -1
