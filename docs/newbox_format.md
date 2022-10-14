# Newbox data format

## Save file address locations

* 0x2D10-0x2F20: Gameplay newbox metadata (0x210 bytes)
* 0x2F20-0x3130: Saved newbox metadata (0x210 bytes)

Total boxes: 16 gameplay boxes, 16 saved boxes.
Extraction from a .sav should be done from 0x2F20 unless save was interrupted.
If saving was interrupted, box data *might* be in 0x2D10-0x2F20 instead,
depending on when in the process you interrupted the saving.

* 0x4000-0x5FF2: Pokémon database 1 (0x1FF2 bytes)
* 0x6000-0x7FF2: Pokémon database 2 (0x1FF2 bytes)

Total database entries: 174 per database, 348 total.
Pokémon data referenced by newbox metadata. Left unitialized on a new game,
there is no gurantee that data in here that isn't referenced by boxes above
isn't filled with garbage. Hence, always reference data here indirectly by
reading the newbox metadata.

## Newbox metadata format

Each individual "newbox" box is 0x21, or 33 bytes, long. It contains the
following data:

* 0x00-0x13: Database pointers for the species
* 0x14-0x16: Bitflags for which of the 2 databases the given entry uses
* 0x17-0x1F: Box name (9 characters in GSC character format, no string terminator)
* 0x20: Box theme

The pointers contains either 0, for a blank slot, or 1-174, corresponding to
a database entry. Each entry has a corresponding bitflag, which is unset if
database bank 1 is referenced, set if database bank 2 is. The entry referenced
can be somewhat arbitrary (each time a player adds a Pokémon to the storage,
the game looks up the lowest entry not marked as used, and thus over time the
pointer list can become somewhat haphazardly ordered). Thus, the pointers
should not be relied on to be in any particular order. This is a major reason
as to why you shouldn't try to reference pokedb Pokémon directly.

Slots are stored starting from the top left corner, then continuing on the same
row until switching to the next row. So the top left corner is the first slot,
the one right of it is slot 2 while the slot right below the first slot is the
5th slot.

0x14-0x16 contains bitflags for which of the 2 pokedb banks is used. The flags
are structured as follows:

* 0x14: 0bHGFEDCBA
* 0x15: 0bPONMLKJI
* 0x16: 0b0000TSRQ

where A corresponds to the bank for slot 1, B for slot 2, etc up to slot 20.
The bits marked as zero above are unused.

For blank slots, the bitflag has no impact (and may be set if the slot used to
reference a Pokémon from storage database 2) and should be ignored.

The box name is stored as 9 characters with no terminator using the standard
GSC character map. The box theme can be anything between 0x00-0x17 for a valid
theme. The themes are as follows:

* 0x00: Pokédex
* 0x01: Pokégear ♂
* 0x02: Pokégear ♀
* 0x03: Pack ♂
* 0x04: Pack ♀
* 0x05: Trainer Card ♂
* 0x06: Trainer Card ♀
* 0x07: Normal
* 0x08: Fighting
* 0x09: Flying
* 0x0A: Poison
* 0x0B: Ground
* 0x0C: Rock
* 0x0D: Bug
* 0x0E: Ghost
* 0x0F: Steel
* 0x10: Fire
* 0x11: Water
* 0x12: Grass
* 0x13: Electric
* 0x14: Psychic
* 0x15: Ice
* 0x16: Dragon
* 0x17: Dark

## Pokémon database format

Each individual pokedb entry is 0x2F, or 47 bytes, long. It contains the
following data:

* 0x00: Species
* 0x01: Item
* 0x02-0x05: Moves
* 0x06-0x07: OT ID
* 0x08-0x0A: Experience
* 0x0B-0x14: Stat experience (HP, Attack, Defense, Speed, Special)
* 0x15-0x16: DVs
* 0x17: PP Up data
* 0x18: Friendship/Egg cycles
* 0x19: Pokérus data
* 0x1A: Caught time and level
* 0x1B: OT gender and caught location
* 0x1C: Level
* 0x1D: "Alt" species
* 0x1E-0x27: Nickname excluding terminator
* 0x28-0x2E: OT name excluding terminator (only 7 bytes are stored)
* 0x1E-0x2E also contains the checksum.

Data in 0x00-0x16 is identical to a regular GSC Pokémon.

0x17 stores PP Up data as 0bDDCCBBAA where A is move 1, B is move 2,
C is move 3 and D is move 4.

Data in 0x18-0x1C is also identical to GSC, but shifted because instead of
storing 4 bytes for PP, newbox only stores a single byte for PP Up data.

0x1D contains "Alt" species. A quick explanation: GSC stores 2 species bytes,
which are usually identical. The main exception is Eggs, which stores Egg
as one of the 2 species bytes. For the purpose of newbox, "Alt" species contains
the species byte that is set to Egg when applicable.

0x1E-0x27 and 0x28-0x2E contains nickname and OT name respectively. They do not
include the terminator. These are for the most part GSC character data without
the 7th bit being part of the name. When interpreting the name here,
set the most significant bit, and do the following conversions:

* Treat 0xC6 as a space (0x7F)
* Treat 0xC7 as a terminator (0x50)
* Treat 0xC8 as a zero (0x00)

The most significant bit in 0x1E-0x27 (nickname) and 0x28-0x2E (OT name) stores
a checksum. If this checksum is invalid, the game will decode the Pokémon into
a Bad Egg. This is *not* done as some sort of anticheat (despite what many people
believe about the purpose of Bad Eggs). The reason this is done is to act as a
failsafe against data corruption. If invalid Pokémon data were to be interpreted
by the game (a corrupted save file or similar), and said data would crash the
game with SRAM banks still open, there is a large chance that the save will be
irreparably broken. Bad Eggs is a failsafe against this, since the game isn't
going to crash by trying to interpret its data.

## Checksum

Each pokedb Pokémon entry is checksummed. The checksum is calculated as follows:

* Start with 127
* For bytes 0x00-0x1D, add the byte times (byte + 1)
* For bytes 0x1E-0x2E, add the lower 7 bits of the byte times (byte + 2)
* Clamp to 2 bytes (so 2 remains 2, 65536 becomes 0, etc)
* Treat the 2 bytes as a series of bits
* Write the most significant bit to 0x1E's most significant bit
* Continue with the 2nd most significant bit to the most significant bit in 0x1F
* Continue like this for the rest of the name fields
* Note that since 0x2E would be the 17th bit, and we only keep 16, its MSB is
  unset. It is still considered an invalid checksum if 0x2E's MSB is set when
  decoded.

Having a checksum starting point of 127 ensures that a completely blank entry,
consisting only of zeroes, doesn't create a valid checksum.
