
AnimObjGFX: ; cfcf6

object_gfx: MACRO
; label, # tiles
	db \2
	db BANK(\1)
	dw \1
ENDM

	object_gfx AnimObj00GFX, 0
	object_gfx AnimObj01GFX, 21
	object_gfx AnimObj02GFX, 6
	object_gfx AnimObj03GFX, 6
	object_gfx AnimObj04GFX, 20
	object_gfx AnimObj05GFX, 26
	object_gfx AnimObj06GFX, 18
	object_gfx AnimObj07GFX, 12
	object_gfx AnimObj08GFX, 9
	object_gfx AnimObj09GFX, 17
	object_gfx AnimObj10GFX, 6
	object_gfx AnimObj11GFX, 10
	object_gfx AnimObj12GFX, 9
	object_gfx AnimObj13GFX, 13
	object_gfx AnimObj14GFX, 16
	object_gfx AnimObj15GFX, 2
	object_gfx AnimObj16GFX, 11
	object_gfx AnimObj17GFX, 9
	object_gfx AnimObj18GFX, 9
	object_gfx AnimObj19GFX, 19
	object_gfx AnimObj20GFX, 10
	object_gfx AnimObj21GFX, 12
	object_gfx AnimObj22GFX, 18
	object_gfx AnimObj23GFX, 13
	object_gfx AnimObj24GFX, 10
	object_gfx AnimObj25GFX, 27
	object_gfx AnimObj26GFX, 12
	object_gfx AnimObj27GFX, 14
	object_gfx AnimObj28GFX, 16
	object_gfx AnimObj29GFX, 7
	object_gfx AnimObj30GFX, 8
	object_gfx AnimObj31GFX, 40
	object_gfx AnimObj32GFX, 36
	object_gfx AnimObj33GFX, 16
	object_gfx AnimObj34GFX, 48
	object_gfx AnimObj35GFX, 18
	object_gfx AnimObj36GFX, 38
	object_gfx AnimObj37GFX, 35
	object_gfx AnimObj38GFX, 18
	object_gfx AnimObj39GFX, 24
	object_gfx NULL, 1
	object_gfx NULL, 1
; cfd9e
