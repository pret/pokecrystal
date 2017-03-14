INCLUDE "includes.asm"


SECTION "Pokedex Entries 001-064", ROMX[$5695], BANK[POKEDEX_ENTRIES_1]

PokedexEntries1::
INCLUDE "data/pokedex/entries_1.asm"


SECTION "Pokedex Entries 065-128", ROMX[$4000], BANK[POKEDEX_ENTRIES_2]

PokedexEntries2::
INCLUDE "data/pokedex/entries_2.asm"


SECTION "Pokedex Entries 129-192", ROMX[$4000], BANK[POKEDEX_ENTRIES_3]

PokedexEntries3::
INCLUDE "data/pokedex/entries_3.asm"


SECTION "Pokedex Entries 193-251", ROMX[$4000], BANK[POKEDEX_ENTRIES_4]

PokedexEntries4::
INCLUDE "data/pokedex/entries_4.asm"
