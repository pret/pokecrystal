BillsPC_ThemeNames:
	table_width 2, BillsPC_ThemeNames
	dw .Pokedex
	dw .PokegearM
	dw .PokegearF
	dw .PackM
	dw .PackF
	dw .TrainerM
	dw .TrainerF
	dw .Normal
	dw .Fighting
	dw .Flying
	dw .Poison
	dw .Ground
	dw .Rock
	dw .Bug
	dw .Ghost
	dw .Steel
	dw .Fire
	dw .Water
	dw .Grass
	dw .Electric
	dw .Psychic
	dw .Ice
	dw .Dragon
	dw .Dark
	assert_table_length NUM_BILLS_PC_THEMES

.Pokedex:   db "#DEX@"
.PokegearM: db "#GEAR♂@"
.PokegearF: db "#GEAR♀@"
.PackM:     db "PACK♂@"
.PackF:     db "PACK♀@"
.TrainerM:  db "TRAINER♂@"
.TrainerF:  db "TRAINER♀@"
.Normal:    db "NORMAL@"
.Fighting:  db "FIGHTING@"
.Flying:    db "FLYING@"
.Poison:    db "POISON@"
.Ground:    db "GROUND@"
.Rock:      db "ROCK@"
.Bug:       db "BUG@"
.Ghost:     db "GHOST@"
.Steel:     db "STEEL@"
.Fire:      db "FIRE@"
.Water:     db "WATER@"
.Grass:     db "GRASS@"
.Electric:  db "ELECTRIC@"
.Psychic:   db "PSYCHIC@"
.Ice:       db "ICE@"
.Dragon:    db "DRAGON@"
.Dark:      db "DARK@"
