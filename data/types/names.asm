TypeNames:
; entries correspond to types (see constants/type_constants.asm)
	table_width 2, TypeNames
	dw Normal
	dw Fighting
	dw Flying
	dw Poison
	dw Ground
	dw Rock
	dw Bird
	dw Bug
	dw Ghost
	dw Steel
	assert_table_length UNUSED_TYPES
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw CurseType
	assert_table_length UNUSED_TYPES_END
	dw Fire
	dw Water
	dw Grass
	dw Electric
	dw Psychic
	dw Ice
	dw Dragon
	dw Dark
	assert_table_length TYPES_END

Normal:    db "NORMAL@"
Fighting:  db "COMBAT@"
Flying:    db "VOL@"
Poison:    db "POISON@"
CurseType: db "???@"
Fire:      db "FEU@"
Water:     db "EAU@"
Grass:     db "PLANTE@"
Electric:  db "ELECTRIK@"
Psychic:   db "PSY@"
Ice:       db "GLACE@"
Ground:    db "SOL@"
Rock:      db "ROCHE@"
Bird:      db "@"
Bug:       db "INSECTE@"
Ghost:     db "SPECTRE@"
Steel:     db "ACIER@"
Dragon:    db "DRAGON@"
Dark:      db "TENEBRES@"
