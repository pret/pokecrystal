	db UNOWN ; 201

	db  48,  72,  48,  48,  72,  48
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC
	db 225 ; catch rate
	db 61 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db GENDERLESS ; gender
	db 100 ; unknown
	db 40 ; step cycles to hatch
	db 5 ; unknown
	INCBIN "gfx/pokemon/unown_a/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; tmhm
	tmhm
	; end
