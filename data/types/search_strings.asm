PokedexTypeSearchStrings:
; entries correspond with PokedexTypeSearchConversionTable (see data/types/search_types.asm)
	table_width POKEDEX_TYPE_STRING_LENGTH, PokedexTypeSearchStrings
	db "  ----  @"
	db " NORMAL @"
	db "  FEU   @"
	db "  EAU   @"
	db " PLANTE @"
	db "ELECTRIK@"
	db " GLACE  @"
	db " COMBAT @"
	db " POISON @"
	db "  SOL   @"
	db "  VOL   @"
	db "  PSY   @"
	db "INSECTE @"
	db " ROCHE  @"
	db "SPECTRE @"
	db " DRAGON @"
	db "TENEBRES@"
	db " ACIER  @"
	assert_table_length NUM_TYPES + 1
