TreeMons: ; b82e8
; entries correspond to TREEMON_SET_* constants
	dw TreeMonSet_City
	dw TreeMonSet_Canyon
	dw TreeMonSet_Azalea
	dw TreeMonSet_Route
	dw TreeMonSet_Kanto
	dw TreeMonSet_Lake
	dw TreeMonSet_Forest
	dw TreeMonSet_Rock
	dw TreeMonSet_City

; Two tables each (common, rare).
; Structure:
;	db  %, species, level

TreeMonSet_City:
TreeMonSet_Canyon: ; b82fa
; common
	db 50, SPEAROW,    10
	db 15, SPEAROW,    10
	db 15, SPEAROW,    10
	db 10, AIPOM,      10
	db  5, AIPOM,      10
	db  5, AIPOM,      10
	db -1
; rare
	db 50, SPEAROW,    10
	db 15, HERACROSS,  10
	db 15, HERACROSS,  10
	db 10, AIPOM,      10
	db  5, AIPOM,      10
	db  5, AIPOM,      10
	db -1

TreeMonSet_Azalea: ; b8320
; common
	db 50, SPEAROW,    10
	db 15, EKANS,      10
	db 15, SPEAROW,    10
	db 10, AIPOM,      10
	db  5, AIPOM,      10
	db  5, AIPOM,      10
	db -1
; rare
	db 50, SPEAROW,    10
	db 15, HERACROSS,  10
	db 15, HERACROSS,  10
	db 10, AIPOM,      10
	db  5, AIPOM,      10
	db  5, AIPOM,      10
	db -1

TreeMonSet_Route: ; b8346
; common
	db 50, HOOTHOOT,   10
	db 15, SPINARAK,   10
	db 15, LEDYBA,     10
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

TreeMonSet_Kanto: ; b836c
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

TreeMonSet_Lake: ; b8392
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

TreeMonSet_Forest: ; b83b8
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

TreeMonSet_Rock: ; b83de
	db 90, KRABBY,     15
	db 10, SHUCKLE,    15
	db -1
; b83e5
