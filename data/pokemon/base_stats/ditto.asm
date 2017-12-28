	db DITTO ; 132

	db  48,  48,  48,  48,  48,  48
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 35 ; catch rate
	db 61 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db GENDERLESS ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	INCBIN "gfx/pokemon/ditto/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn LADIES_MAN, LADIES_MAN ; egg groups

	; tmhm
	tmhm
	; end
