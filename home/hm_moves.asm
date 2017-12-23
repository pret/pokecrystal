; HM moves can't be forgotten

IsHM:: ; 34df
	cp HM01
	jr c, .NotHM
	scf
	ret
.NotHM:
	and a
	ret
; 34e7

IsHMMove:: ; 34e7
	ld hl, .HMMoves
	ld de, 1
	jp IsInArray

.HMMoves: ; 34f0
	db CUT
	db FLY
	db SURF
	db STRENGTH
	db FLASH
	db WATERFALL
	db WHIRLPOOL
	db -1 ; end
; 34f8
