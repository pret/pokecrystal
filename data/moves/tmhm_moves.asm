; The add_tm, add_hm, and add_mt macros in constants/item_constants.asm simultaneously
; define constants for the item IDs and for the corresponding move values.

TMHMMoves:
; entries correspond to *_TMNUM constants (see constants/item_constants.asm)

; TMs
n = 1
rept NUM_TMS
if n < 10
MOVE_FOR_TM EQUS "TM0{d:n}_MOVE"
else
MOVE_FOR_TM EQUS "TM{d:n}_MOVE"
endc
	db MOVE_FOR_TM
PURGE MOVE_FOR_TM
n = n + 1
endr

; HMs
n = 1
rept NUM_HMS
if n < 10
MOVE_FOR_HM EQUS "HM0{d:n}_MOVE"
else
MOVE_FOR_HM EQUS "HM{d:n}_MOVE"
endc
	db MOVE_FOR_HM
PURGE MOVE_FOR_HM
n = n + 1
endr

; Move tutor
n = 1
rept NUM_TUTORS
if n < 10
MOVE_FOR_MT EQUS "MT0{d:n}_MOVE"
else
MOVE_FOR_MT EQUS "MT{d:n}_MOVE"
endc
	db MOVE_FOR_MT
PURGE MOVE_FOR_MT
n = n + 1
endr

	db 0 ; end
