BadEgg:
; Failsafe if there is a checksum error
	db BULBASAUR
	db NO_ITEM
	db POUND, NO_MOVE, NO_MOVE, NO_MOVE
	dw 0 ; OT ID
	db 0, 0, 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 0, 0, 0, 0 ; DVs
	db 0, 0, 0, 0 ; PP
	db 255 ; Step cycles to hatch
	db 0, 0, 0 ; Pokérus, Caught data
	db EGG_LEVEL ; Level
	db 0 ; Status
	db 0 ; unused
	bigdw 0 ; HP
	bigdw 11 ; Max HP
	bigdw 5 ; Atk
	bigdw 5 ; Def
	bigdw 5 ; Spd
	bigdw 5 ; SAtk
	bigdw 5 ; SDef
	db EGG ; Alt species
	db "BAD EGG@@@@" ; Nickname
	db "?@@@@@@@@@@" ; OT name
BadEggEnd:
