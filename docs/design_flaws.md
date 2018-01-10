# Design Flaws

These are parts of the code that do not work *incorrectly*, like [bugs and glitches](/docs/bugs_and_glitches.md), but that clearly exist just to work around a problem. In other words, with a slightly different design, the code would not need to exist at all. Design flaws may be exceptions to a usual rule, such as "tables of pointers in different banks use `dba`" ([one exception](#pic-banks-are-offset-by-pics_fix), [and another](#pokédex-entry-banks-are-derived-from-their-species-ids)) or "graphics used as a unit are stored and loaded contiguously" ([a notable exception](#footprints-are-split-into-top-and-bottom-halves)).


## Contents

- [Pic banks are offset by `PICS_FIX`](#pic-banks-are-offset-by-pics_fix)
- [`PokemonPicPointers` and `UnownPicPointers` are assumed to start at the same address](#pokemonpicpointers-and-unownpicpointers-are-assumed-to-start-at-the-same-address)
- [Footprints are split into top and bottom halves](#footprints-are-split-into-top-and-bottom-halves)
- [Pokédex entry banks are derived from their species IDs](#pokédex-entry-banks-are-derived-from-their-species-ids)
- [`ITEM_C3` and `ITEM_DC` break up the continuous sequence of TM items](#item_c3-and-item_dc-break-up-the-continuous-sequence-of-tm-items)
- [`GetForestTreeFrame` works, but it's still bad](#getforesttreeframe-works-but-its-still-bad)


## Pic banks are offset by `PICS_FIX`

[data/pokemon/pic_pointers.asm](/data/pokemon/pic_pointers.asm), [data/pokemon/unown_pic_pointers.asm](/data/pokemon/unown_pic_pointers.asm), and [data/trainers/pic_pointers.asm](/data/trainers/pic_pointers.asm) all have to use `dba_pic` instead of `dba`. This is a macro in [macros/data.asm](/macros/data.asm) that offsets banks by `PICS_FIX`:

```asm
dba_pic: MACRO ; dbw bank, address
	db BANK(\1) - PICS_FIX
	dw \1
ENDM
```

The offset is translated into a correct bank by `FixPicBank` in [gfx/load_pics.asm](/gfx/load_pics.asm):

```asm
FixPicBank: ; 511c5
; This is a thing for some reason.

PICS_FIX EQU $36
GLOBAL PICS_FIX

	push hl
	push bc
	sub BANK(Pics_1) - PICS_FIX
	ld c, a
	ld b, 0
	ld hl, .PicsBanks
	add hl, bc
	ld a, [hl]
	pop bc
	pop hl
	ret

.PicsBanks: ; 511d4
	db BANK(Pics_1) + 0
	db BANK(Pics_1) + 1
	db BANK(Pics_1) + 2
	db BANK(Pics_1) + 3
	db BANK(Pics_1) + 4
	db BANK(Pics_1) + 5
	db BANK(Pics_1) + 6
	db BANK(Pics_1) + 7
	db BANK(Pics_1) + 8
	db BANK(Pics_1) + 9
	db BANK(Pics_1) + 10
	db BANK(Pics_1) + 11
	db BANK(Pics_1) + 12
	db BANK(Pics_1) + 13
	db BANK(Pics_1) + 14
	db BANK(Pics_1) + 15
	db BANK(Pics_1) + 16
	db BANK(Pics_1) + 17
	db BANK(Pics_1) + 18
	db BANK(Pics_1) + 19
	db BANK(Pics_1) + 20
	db BANK(Pics_1) + 21
	db BANK(Pics_1) + 22
	db BANK(Pics_1) + 23
```

**Fix:** Use `dba` instead of `dba_pic`, and don't call `FixPicBank` to modify `a`.


## `PokemonPicPointers` and `UnownPicPointers` are assumed to start at the same address

In [gfx/pics.asm](/gfx/pics.asm):

```asm
; PokemonPicPointers and UnownPicPointers are assumed to start at the same
; address, but in different banks. This is enforced in pokecrystal.link.

SECTION "Pic Pointers", ROMX

INCLUDE "data/pokemon/pic_pointers.asm"


SECTION "Unown Pic Pointers", ROMX

INCLUDE "data/pokemon/unown_pic_pointers.asm"
```

In [pokecrystal.link](/pokecrystal.link):

```
ROMX $48
	org $4000
	"Pic Pointers"
	"Pics 1"
ROMX $49
	org $4000
	"Unown Pic Pointers"
	"Pics 2"
```

Two routines in [gfx/load_pics.asm](/gfx/load_pics.asm) make this assumption; `GetFrontpicPointer`:

```asm
	ld a, [CurPartySpecies]
	cp UNOWN
	jr z, .unown
	ld a, [CurPartySpecies]
	ld d, BANK(PokemonPicPointers)
	jr .ok

.unown
	ld a, [UnownLetter]
	ld d, BANK(UnownPicPointers)

.ok
	ld hl, PokemonPicPointers ; UnownPicPointers
	dec a
	ld bc, 6
	call AddNTimes
```

And `GetMonBackpic`:

```asm
	; These are assumed to be at the same
	; address in their respective banks.
	GLOBAL PokemonPicPointers,  UnownPicPointers
	ld hl, PokemonPicPointers ; UnownPicPointers
	ld a, b
	ld d, BANK(PokemonPicPointers)
	cp UNOWN
	jr nz, .ok
	ld a, c
	ld d, BANK(UnownPicPointers)
.ok
	dec a
	ld bc, 6
	call AddNTimes
```

**Fix:**

Don't enforce `org $4000` in pokecrystal.link.

Modify `GetFrontpicPointer`:

```asm
	ld a, [CurPartySpecies]
	cp UNOWN
	jr z, .unown
	ld a, [CurPartySpecies]
	ld hl, PokemonPicPointers
	ld d, BANK(PokemonPicPointers)
	jr .ok

.unown
	ld a, [UnownLetter]
	ld hl, UnownPicPointers
	ld d, BANK(UnownPicPointers)

.ok
	dec a
	ld bc, 6
	call AddNTimes
```

And `GetMonBackpic`:

```asm
	GLOBAL PokemonPicPointers, UnownPicPointers
	ld a, b
	ld hl, PokemonPicPointers
	ld d, BANK(PokemonPicPointers)
	cp UNOWN
	jr nz, .ok
	ld a, c
	ld hl, UnownPicPointers
	ld d, BANK(UnownPicPointers)
.ok
	dec a
	ld bc, 6
	call AddNTimes
```


## Footprints are split into top and bottom halves

In [gfx/footprints.asm](/gfx/footprints.asm):

```asm
; Footprints are 2x2 tiles each, but are stored as a 16x64-tile image
; (32 rows of 8 footprints per row).
; That means there's a row of the top two tiles for eight footprints,
; then a row of the bottom two tiles for those eight footprints.

; These macros help extract the first and the last two tiles, respectively.
footprint_top    EQUS "0,                 2 * LEN_1BPP_TILE"
footprint_bottom EQUS "2 * LEN_1BPP_TILE, 2 * LEN_1BPP_TILE"

; Entries correspond to Pokémon species, two apiece, 8 tops then 8 bottoms

; 001-008 top halves
INCBIN "gfx/footprints/bulbasaur.1bpp",  footprint_top
INCBIN "gfx/footprints/ivysaur.1bpp",    footprint_top
INCBIN "gfx/footprints/venusaur.1bpp",   footprint_top
INCBIN "gfx/footprints/charmander.1bpp", footprint_top
INCBIN "gfx/footprints/charmeleon.1bpp", footprint_top
INCBIN "gfx/footprints/charizard.1bpp",  footprint_top
INCBIN "gfx/footprints/squirtle.1bpp",   footprint_top
INCBIN "gfx/footprints/wartortle.1bpp",  footprint_top
; 001-008 bottom halves
INCBIN "gfx/footprints/bulbasaur.1bpp",  footprint_bottom
INCBIN "gfx/footprints/ivysaur.1bpp",    footprint_bottom
INCBIN "gfx/footprints/venusaur.1bpp",   footprint_bottom
INCBIN "gfx/footprints/charmander.1bpp", footprint_bottom
INCBIN "gfx/footprints/charmeleon.1bpp", footprint_bottom
INCBIN "gfx/footprints/charizard.1bpp",  footprint_bottom
INCBIN "gfx/footprints/squirtle.1bpp",   footprint_bottom
INCBIN "gfx/footprints/wartortle.1bpp",  footprint_bottom
...
```

`Pokedex_LoadAnyFootprint` in [engine/pokedex.asm](/engine/pokedex.asm):

```asm
	push hl
	ld e, l
	ld d, h
	ld hl, VTiles2 tile $62
	lb bc, BANK(Footprints), 2
	call Request1bpp
	pop hl

	; Whoever was editing footprints forgot to fix their
	; tile editor. Now each bottom half is 8 tiles off.
	ld de, 8 tiles
	add hl, de

	ld e, l
	ld d, h
	ld hl, VTiles2 tile $64
	lb bc, BANK(Footprints), 2
	call Request1bpp
```

**Fix:**

Store footprints contiguously:

```asm
INCBIN "gfx/footprints/bulbasaur.1bpp"
INCBIN "gfx/footprints/ivysaur.1bpp"
INCBIN "gfx/footprints/venusaur.1bpp"
INCBIN "gfx/footprints/charmander.1bpp"
INCBIN "gfx/footprints/charmeleon.1bpp"
INCBIN "gfx/footprints/charizard.1bpp"
INCBIN "gfx/footprints/squirtle.1bpp"
INCBIN "gfx/footprints/wartortle.1bpp"
...
```

Modify `Pokedex_LoadAnyFootprint`:

```asm
	ld e, l
	ld d, h
	ld hl, VTiles2 tile $62
	lb bc, BANK(Footprints), 4
	call Request1bpp
```


## Pokédex entry banks are derived from their species IDs

`PokedexDataPointerTable` in [data/pokemon/dex_entry_pointers.asm](/data/pokemon/dex_entry_pointers.asm) is a table of `dw`, not `dba`, yet there are four banks used for Pokédex entries. The correct bank is derived from the species ID at the beginning of each Pokémon's base stats. (This is the only use the base stat species ID has.)

Three separate routines do the same derivation; `GetDexEntryPointer` in [engine/pokedex_2.asm](/engine/pokedex_2.asm):

```asm
GetDexEntryPointer: ; 44333
; return dex entry pointer b:de
	push hl
	ld hl, PokedexDataPointerTable
	ld a, b
	dec a
	ld d, 0
	ld e, a
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	rlca
	rlca
	and $3
	ld hl, .PokedexEntryBanks
	ld d, 0
	ld e, a
	add hl, de
	ld b, [hl]
	pop de
	pop hl
	ret

.PokedexEntryBanks: ; 44351

GLOBAL PokedexEntries1
GLOBAL PokedexEntries2
GLOBAL PokedexEntries3
GLOBAL PokedexEntries4

	db BANK(PokedexEntries1)
	db BANK(PokedexEntries2)
	db BANK(PokedexEntries3)
	db BANK(PokedexEntries4)
```

`GetPokedexEntryBank` in [engine/item_effects.asm](/engine/item_effects.asm):

```asm
GetPokedexEntryBank:
	push hl
	push de
	ld a, [EnemyMonSpecies]
	rlca
	rlca
	and 3
	ld hl, .PokedexEntryBanks
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hl]
	pop de
	pop hl
	ret

.PokedexEntryBanks:

GLOBAL PokedexEntries1
GLOBAL PokedexEntries2
GLOBAL PokedexEntries3
GLOBAL PokedexEntries4

	db BANK(PokedexEntries1)
	db BANK(PokedexEntries2)
	db BANK(PokedexEntries3)
	db BANK(PokedexEntries4)
```

And `PokedexShow_GetDexEntryBank` in [engine/radio.asm](/engine/radio.asm):

```asm
PokedexShow_GetDexEntryBank:
	push hl
	push de
	ld a, [CurPartySpecies]
	dec a
	rlca
	rlca
	and 3
	ld hl, .pokedexbanks
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hl]
	pop de
	pop hl
	ret

.pokedexbanks
	db BANK(PokedexEntries1)
	db BANK(PokedexEntries2)
	db BANK(PokedexEntries3)
	db BANK(PokedexEntries4)
```

**Fix:** Use `dba` instead of `dw` in `PokedexDataPointerTable`, and modify the code that accesses it to match.


## `ITEM_C3` and `ITEM_DC` break up the continuous sequence of TM items

[constants/item_constants.asm](/constants/item_constants.asm) defined the 50 TMs in order with `add_tm`, but `ITEM_C3` and `ITEM_DC` break up that sequence.

```asm
	add_tm DYNAMICPUNCH ; $BF
	...
	add_tm ROLLOUT      ; $C2
	const ITEM_C3       ; $C3
	add_tm ROAR         ; $C4
	...
	add_tm DIG          ; $DB
	const ITEM_DC       ; $DC
	add_tm PSYCHIC_M    ; $DD
	...
	add_tm NIGHTMARE    ; $F2
NUM_TMS = const_value - TM01 - 2 ; discount ITEM_C3 and ITEM_DC
```

`GetTMHMNumber` and `GetNumberedTMHM` in [engine/items.asm](/engine/items.asm) have to compensate for this:

```asm
GetTMHMNumber:: ; d407
; Return the number of a TM/HM by item id c.
	ld a, c
; Skip any dummy items.
	cp ITEM_C3 ; TM04-05
	jr c, .done
	cp ITEM_DC ; TM28-29
	jr c, .skip
	dec a
.skip
	dec a
.done
	sub TM01
	inc a
	ld c, a
	ret

GetNumberedTMHM: ; d417
; Return the item id of a TM/HM by number c.
	ld a, c
; Skip any gaps.
	cp ITEM_C3 - (TM01 - 1)
	jr c, .done
	cp ITEM_DC - (TM01 - 1) - 1
	jr c, .skip_one
.skip_two
	inc a
.skip_one
	inc a
.done
	add TM01
	dec a
	ld c, a
	ret
```

**Fix:**

Move `ITEM_C3` and `ITEM_DC` above all the TMs in every table of item data.

Modify engine/items.asm:

```asm
GetTMHMNumber:: ; d407
; Return the number of a TM/HM by item id c.
	ld a, c
	sub TM01
	inc a
	ld c, a
	ret

GetNumberedTMHM: ; d417
; Return the item id of a TM/HM by number c.
	ld a, c
	add TM01
	dec a
	ld c, a
	ret
```


## `GetForestTreeFrame` works, but it's still bad

In [engine/tileset_anims.asm](/engine/tileset_anims.asm):

```asm
GetForestTreeFrame: ; fc54c
; Return 0 if a is even, or 2 if odd.
	and a
	jr z, .even
	cp 1
	jr z, .odd
	cp 2
	jr z, .even
	cp 3
	jr z, .odd
	cp 4
	jr z, .even
	cp 5
	jr z, .odd
	cp 6
	jr z, .even
.odd
	ld a, 2
	scf
	ret
.even
	xor a
	ret
; fc56d
```

**Fix:**

```asm
GetForestTreeFrame: ; fc54c
; Return 0 if a is even, or 2 if odd.
	and 1
	add a
	ret
; fc56d
```
