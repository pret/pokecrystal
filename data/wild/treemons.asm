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
	db 50, SPEAROW,    20
	db 15, SPEAROW,    20
	db 15, FEAROW,     20
	db 10, AIPOM,      20
	db  5, AIPOM,      20
	db  5, EXEGGCUTE,  20
	db -1
; rare
	db 50, FEAROW,     20
	db 15, HERACROSS,  20
	db 15, HERACROSS,  20
	db 10, EXEGGCUTE,  20
	db  5, AIPOM,      20
	db  5, AIPOM,      20
	db -1

TreeMonSet_Town:
; common
	db 50, SPEAROW,    20
	db 15, EKANS,      20
	db 15, FEAROW,     20
	db 10, AIPOM,      20
	db  5, AIPOM,      20
	db  5, FEAROW,     20
	db -1
; rare
	db 50, SPEAROW,    20
	db 15, HERACROSS,  20
	db 15, HERACROSS,  20
	db 10, FEAROW,     20
	db  5, EXEGGCUTE,  20
	db  5, AIPOM,      20
	db -1

TreeMonSet_Route:
; common
	db 50, NOCTOWL,    20
	db 15, ARIADOS,    20
	db 15, LEDIAN,     20
	db 10, EXEGGCUTE,  20
	db  5, EXEGGCUTE,  20
	db  5, AIPOM,      20
	db -1
; rare
	db 50, NOCTOWL,    20
	db 15, PINECO,     20
	db 15, PINECO,     20
	db 10, FEAROW,     20
	db  5, EXEGGCUTE,  20
	db  5, EXEGGCUTE,  20
	db -1

TreeMonSet_Kanto:
; common
	db 50, HOOTHOOT,   10
	db 15, EKANS,      10
	db 15, HOOTHOOT,   10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1
; rare
	db 50, HOOTHOOT,   10
	db 15, PINECO,     10
	db 15, PINECO,     10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1

TreeMonSet_Lake:
; common
	db 50, HOOTHOOT,   10
	db 15, VENONAT,    10
	db 15, HOOTHOOT,   10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1
; rare
	db 50, HOOTHOOT,   10
	db 15, PINECO,     10
	db 15, PINECO,     10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1

TreeMonSet_Forest:
; common
	db 50, HOOTHOOT,   10
	db 15, PINECO,     10
	db 15, PINECO,     10
	db 10, NOCTOWL,    10
	db  5, BUTTERFREE, 10
	db  5, BEEDRILL,   10
	db -1
; rare
	db 50, HOOTHOOT,   10
	db 15, CATERPIE,   10
	db 15, WEEDLE,     10
	db 10, HOOTHOOT,   10
	db  5, METAPOD,    10
	db  5, KAKUNA,     10
	db -1

TreeMonSet_Rock:
	db 40, GEODUDE,    25
	db 40, KRABBY,     25
	db 10, SLUGMA,     25
	db 10, SHUCKLE,    25
	db -1
