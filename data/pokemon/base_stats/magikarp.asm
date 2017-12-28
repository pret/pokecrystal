	db MAGIKARP ; 129

	db  20,  10,  55,  80,  15,  20
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER
	db 255 ; catch rate
	db 20 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db GENDER_F50 ; gender
	db 100 ; unknown
	db 5 ; step cycles to hatch
	db 5 ; unknown
	INCBIN "gfx/pokemon/magikarp/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db SLOW ; growth rate
	dn FISH, REPTILE ; egg groups

	; tmhm
	tmhm
	; end
