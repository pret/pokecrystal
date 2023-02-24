# Design Flaws

These are parts of the code that do not work *incorrectly*, like [bugs and glitches](https://github.com/pret/pokecrystal/blob/master/docs/bugs_and_glitches.md), but that clearly exist just to work around a problem. In other words, with a slightly different design, the code would not need to exist at all. Design flaws may be exceptions to a usual rule, such as "tables of pointers in different banks use `dba`" ([one exception](#pic-banks-are-offset-by-pics_fix), [and another](#pok%C3%A9dex-entry-banks-are-derived-from-their-species-ids)) or "graphics used as a unit are stored and loaded contiguously" ([a notable exception](#footprints-are-split-into-top-and-bottom-halves)).


## Contents

- [Pic banks are offset by `PICS_FIX`](#pic-banks-are-offset-by-pics_fix)
- [`PokemonPicPointers` and `UnownPicPointers` are assumed to start at the same address](#pokemonpicpointers-and-unownpicpointers-are-assumed-to-start-at-the-same-address)
- [Footprints are split into top and bottom halves](#footprints-are-split-into-top-and-bottom-halves)
- [Music IDs $64 and $80 or above have special behavior](#music-ids-64-and-80-or-above-have-special-behavior)
- [`ITEM_C3` and `ITEM_DC` break up the continuous sequence of TM items](#item_c3-and-item_dc-break-up-the-continuous-sequence-of-tm-items)
- [Pokédex entry banks are derived from their species IDs](#pok%C3%A9dex-entry-banks-are-derived-from-their-species-ids)
- [The 6-bit caught level can only record up to level 63](#the-6-bit-caught-level-can-only-record-up-to-level-63)
- [Identical sine wave code and data is repeated five times](#identical-sine-wave-code-and-data-is-repeated-five-times)
- [`GetForestTreeFrame` works, but it's still bad](#getforesttreeframe-works-but-its-still-bad)
- [The overworld scripting engine assumes no more than 127 banks](#the-overworld-scripting-engine-assumes-no-more-than-127-banks)


## Pic banks are offset by `PICS_FIX`

[data/pokemon/pic_pointers.asm](https://github.com/pret/pokecrystal/blob/master/data/pokemon/pic_pointers.asm), [data/pokemon/unown_pic_pointers.asm](https://github.com/pret/pokecrystal/blob/master/data/pokemon/unown_pic_pointers.asm), and [data/trainers/pic_pointers.asm](https://github.com/pret/pokecrystal/blob/master/data/trainers/pic_pointers.asm) all have to use `dba_pic` instead of `dba`. This is a macro in [macros/data.asm](https://github.com/pret/pokecrystal/blob/master/macros/data.asm) that offsets banks by `PICS_FIX`:

```asm
MACRO dba_pic ; dbw bank, address
	db BANK(\1) - PICS_FIX
	dw \1
ENDM
```

The offset is translated into a correct bank by `FixPicBank` in [engine/gfx/load_pics.asm](https://github.com/pret/pokecrystal/blob/master/engine/gfx/load_pics.asm):

```asm
FixPicBank:
; This is a thing for some reason.

DEF PICS_FIX EQU $36
GLOBAL PICS_FIX

	push hl
	push bc
	sub BANK("Pics 1") - PICS_FIX
	ld c, a
	ld b, 0
	ld hl, .PicsBanks
	add hl, bc
	ld a, [hl]
	pop bc
	pop hl
	ret

.PicsBanks:
	db BANK("Pics 1")  ; BANK("Pics 1") + 0
	...
	db BANK("Pics 24") ; BANK("Pics 1") + 23
```

**Fix:** Delete `FixPicBank` and remove all four calls to `FixPicBank` in [engine/gfx/load_pics.asm](https://github.com/pret/pokecrystal/blob/master/engine/gfx/load_pics.asm). Then use `dba` instead of `dba_pic` everywhere.


## `PokemonPicPointers` and `UnownPicPointers` are assumed to start at the same address

`GetFrontpicPointer` and `GetMonBackpic` in [engine/gfx/load_pics.asm](https://github.com/pret/pokecrystal/blob/master/engine/gfx/load_pics.asm) make this assumption, which has to be accounted for in the data files.

In [gfx/pics.asm](https://github.com/pret/pokecrystal/blob/master/gfx/pics.asm):

```asm
; PokemonPicPointers and UnownPicPointers are assumed to start at the same
; address, but in different banks. This is enforced in layout.link.


SECTION "Pic Pointers", ROMX

INCLUDE "data/pokemon/pic_pointers.asm"


SECTION "Unown Pic Pointers", ROMX

INCLUDE "data/pokemon/unown_pic_pointers.asm"
```

In [layout.link](https://github.com/pret/pokecrystal/blob/master/layout.link):

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

**Fix:**

Don't enforce `org $4000` in [layout.link](https://github.com/pret/pokecrystal/blob/master/layout.link).

Edit `GetFrontpicPointer`:

```diff
 	ld a, [wCurPartySpecies]
 	cp UNOWN
 	jr z, .unown
+	ld hl, PokemonPicPointers
 	ld a, [wCurPartySpecies]
 	ld d, BANK(PokemonPicPointers)
 	jr .ok
 .unown
+	ld hl, UnownPicPointers
 	ld a, [wUnownLetter]
 	ld d, BANK(UnownPicPointers)
 .ok
-	; These are assumed to be at the same address in their respective banks.
-	assert PokemonPicPointers == UnownPicPointers
-	ld hl, PokemonPicPointers
 	dec a
 	ld bc, 6
 	call AddNTimes
```

And `GetMonBackpic`:

```diff
-	; These are assumed to be at the same address in their respective banks.
-	assert PokemonPicPointers == UnownPicPointers
 	ld hl, PokemonPicPointers
 	ld a, b
 	ld d, BANK(PokemonPicPointers)
 	cp UNOWN
 	jr nz, .ok
+	ld hl, UnownPicPointers
 	ld a, c
 	ld d, BANK(UnownPicPointers)
 .ok
 	dec a
 	ld bc, 6
 	call AddNTimes
```


## Footprints are split into top and bottom halves

In [gfx/footprints.asm](https://github.com/pret/pokecrystal/blob/master/gfx/footprints.asm):

```asm
; Footprints are 2x2 tiles each, but are stored as a 16x64-tile image
; (32 rows of 8 footprints per row).
; That means there's a row of the top two tiles for eight footprints,
; then a row of the bottom two tiles for those eight footprints.

; These macros help extract the first and the last two tiles, respectively.
DEF footprint_top    EQUS "0,                 2 * LEN_1BPP_TILE"
DEF footprint_bottom EQUS "2 * LEN_1BPP_TILE, 2 * LEN_1BPP_TILE"

Footprints:
; Entries correspond to Pokémon species, two apiece, 8 tops then 8 bottoms
	table_width LEN_1BPP_TILE * 4, Footprints

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

`Pokedex_LoadAnyFootprint` in [engine/pokedex/pokedex.asm](https://github.com/pret/pokecrystal/blob/master/engine/pokedex/pokedex.asm) has to load the halves separately.

**Fix:**

Store footprints contiguously:

```asm

Footprints:
	table_width LEN_1BPP_TILE * 4, Footprints

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

Edit `Pokedex_LoadAnyFootprint`:

```diff
 	ld a, [wTempSpecies]
 	dec a
 	and %111
 	swap a ; * $10
+	add a, a
 	ld l, a
 	ld h, 0
 	add hl, de
 	ld de, Footprints
 	add hl, de

-	push hl
 	ld e, l
 	ld d, h
 	ld hl, vTiles2 tile $62
-	lb bc, BANK(Footprints), 2
+	lb bc, BANK(Footprints), 4
 	call Request1bpp
-	pop hl
-
-	; Whoever was editing footprints forgot to fix their
-	; tile editor. Now each bottom half is 8 tiles off.
-	ld de, 8 tiles
-	add hl, de
-
-	ld e, l
-	ld d, h
-	ld hl, vTiles2 tile $64
-	lb bc, BANK(Footprints), 2
-	call Request1bpp
```


## Music IDs $64 and $80 or above have special behavior

If a map's music ID in [data/maps/maps.asm](https://github.com/pret/pokecrystal/blob/master/master/data/maps/maps.asm) is $64 (the value of `MUSIC_MAHOGANY_MART` or `MUSIC_SUICUNE_BATTLE`) it will play either `MUSIC_ROCKET_HIDEOUT` or `MUSIC_CHERRYGROVE_CITY`. Moreover, if a map's music ID is $80 or above (the value of `RADIO_TOWER_MUSIC`) it might play `MUSIC_ROCKET_OVERTURE` or something else. This is caused by `GetMapMusic` in [home/map.asm](https://github.com/pret/pokecrystal/blob/master/master/home/map.asm).

**Fix:**

Replace `RADIO_TOWER_MUSIC | MUSIC_GOLDENROD_CITY` with `MUSIC_RADIO_TOWER` in [data/maps/maps.asm](https://github.com/pret/pokecrystal/blob/master/master/data/maps/maps.asm).

Redefine the special music constants in [constants/music_constants.asm](https://github.com/pret/pokecrystal/blob/master/master/constants/music_constants.asm):

```diff
-; GetMapMusic picks music for this value (see home/map.asm)
-DEF MUSIC_MAHOGANY_MART EQU $64
+; GetMapMusic picks music for these values (see home/map.asm)
+DEF MUSIC_MAHOGANY_MART EQU $fc
+DEF MUSIC_RADIO_TOWER   EQU $fd

 ; ExitPokegearRadio_HandleMusic uses these values
 DEF RESTART_MAP_MUSIC EQU $fe
 DEF ENTER_MAP_MUSIC   EQU $ff
-
-; GetMapMusic picks music for this bit flag
-DEF RADIO_TOWER_MUSIC_F EQU 7
-DEF RADIO_TOWER_MUSIC EQU 1 << RADIO_TOWER_MUSIC_F
```

Edit `GetMapMusic`:

```diff
 GetMapMusic::
 	push hl
 	push bc
 	ld de, MAP_MUSIC
 	call GetMapField
 	ld a, c
 	cp MUSIC_MAHOGANY_MART
 	jr z, .mahoganymart
-	bit RADIO_TOWER_MUSIC_F, c
-	jr nz, .radiotower
+	cp MUSIC_RADIO_TOWER
+	jr z, .radiotower
 	farcall Function8b342
 	ld e, c
 	ld d, 0
 .done
 	pop bc
 	pop hl
 	ret

 .radiotower
 	ld a, [wStatusFlags2]
 	bit STATUSFLAGS2_ROCKETS_IN_RADIO_TOWER_F, a
 	jr z, .clearedradiotower
 	ld de, MUSIC_ROCKET_OVERTURE
 	jr .done

 .clearedradiotower
-	; the rest of the byte
-	ld a, c
-	and RADIO_TOWER_MUSIC - 1
-	ld e, a
-	ld d, 0
+	ld de, MUSIC_GOLDENROD_CITY
 	jr .done

 .mahoganymart
 	ld a, [wStatusFlags2]
 	bit STATUSFLAGS2_ROCKETS_IN_MAHOGANY_F, a
 	jr z, .clearedmahogany
 	ld de, MUSIC_ROCKET_HIDEOUT
 	jr .done

 .clearedmahogany
 	ld de, MUSIC_CHERRYGROVE_CITY
 	jr .done
```


## `ITEM_C3` and `ITEM_DC` break up the continuous sequence of TM items

[constants/item_constants.asm](https://github.com/pret/pokecrystal/blob/master/constants/item_constants.asm) defined the 50 TMs in order with `add_tm`, but `ITEM_C3` and `ITEM_DC` break up that sequence.

```asm
	add_tm DYNAMICPUNCH ; bf
	...
	add_tm ROLLOUT      ; c2
	const ITEM_C3       ; c3
	add_tm ROAR         ; c4
	...
	add_tm DIG          ; db
	const ITEM_DC       ; dc
	add_tm PSYCHIC_M    ; dd
	...
	add_tm NIGHTMARE    ; f2
DEF NUM_TMS EQU const_value - TM01 - 2 ; discount ITEM_C3 and ITEM_DC
```

`GetTMHMNumber` and `GetNumberedTMHM` in [engine/items/items.asm](https://github.com/pret/pokecrystal/blob/master/engine/items/items.asm) have to compensate for this.

> There was originally a good reason for these two gaps!
>
> Pokémon traded from RBY to GSC have their catch rate interpreted as their new held item. This was planned early on in development, so some items were given indexes corresponding to appropriate Gen 1 catch rates:
>
> - $03 = 3: `BRIGHTPOWDER` is for Articuno, Zapdos, Moltres, and Mewtwo
> - $1E = 30: `LUCKY_PUNCH` is for Chansey
> - $23 = 35: `METAL_POWDER` is for Ditto
> - $3C = 60: `SILVER_LEAF` is for 10 Pokémon
> - $4B = 75: `GOLD_LEAF` is for 13 Pokémon
> - $96 = 150: `MYSTERYBERRY` is for Clefairy
> - $AA = 170: `POLKADOT_BOW` is for Jigglypuff
> - $B4 = 180: `BRICK_PIECE` is for Machop
>
> Yellow was also being developed then, and it did the reverse, altering some Pokémon's data after they're caught to correspond to appropriate Gen 2 items:
>
> - Starter Pikachu's catch rate byte is overwritten with 163 = $A3 for `LIGHT_BALL`
> - Wild-caught Kadabra's catch rate byte is overwritten with 96 = $60 for `TWISTEDSPOON`
>
> (Yellow also directly changed Dragonair's catch rate to 27 and Dragonite's to 9, but this seems to have been only for adjusting their difficulty, since those meaninglessly correspond to `PROTEIN` and `ANTIDOTE`.)
>
> Most catch rates were left as gaps in the item list, and transformed into held items via the `TimeCapsule_CatchRateItems` table in [data/items/catch_rate_items.asm](https://github.com/pret/pokecrystal/blob/master/data/items/catch_rate_items.asm). For example, the 52 Pokémon with catch rate 45 would hold the gap `ITEM_2D`, except that gets transformed into `BITTER_BERRY`.
>
> But a few Pokémon end up with weird items. Abra has a catch rate of 200, or $C8; and Krabby, Horsea, Goldeen, and Staryu have a catch rate of 225, or $E1. Those indexes correspond to the items `TM_PSYCH_UP` and `TM_ICE_PUNCH`, which seem like random choices—because they are.
>
> The TMs and HMs span from indexes $BF to $F9. However, as we can see in [pokegold-spaceworld](https://github.com/pret/pokegold-spaceworld/blob/master/constants/item_constants.asm), they *originally* spanned $C4 to $FF. For some reason they were shifted down by 5 during development.
>
> Before the index shift, the gap `ITEM_C3` would have been at index $C8, and `ITEM_DC` at $E1. In other words, they would have neatly corresponded to the catch rates for those five Pokémon! Then they would have held `BERRY` when traded through the Time Capsule (since the gap items get transformed via `TimeCapsule_CatchRateItems`).

**Fix:**

Move `ITEM_C3` and `ITEM_DC` above all the TMs in every table of item data.

Edit [engine/items/items.asm](https://github.com/pret/pokecrystal/blob/master/engine/items/items.asm):

```diff
 GetTMHMNumber::
 ; Return the number of a TM/HM by item id c.
 	ld a, c
-; Skip any dummy items.
-	cp ITEM_C3 ; TM04-05
-	jr c, .done
-	cp ITEM_DC ; TM28-29
-	jr c, .skip
-	dec a
-.skip
-	dec a
-.done
 	sub TM01
 	inc a
 	ld c, a
 	ret

 GetNumberedTMHM:
 ; Return the item id of a TM/HM by number c.
 	ld a, c
-; Skip any gaps.
-	cp ITEM_C3 - (TM01 - 1)
-	jr c, .done
-	cp ITEM_DC - (TM01 - 1) - 1
-	jr c, .skip_one
-.skip_two
-	inc a
-.skip_one
-	inc a
-.done
 	add TM01
 	dec a
 	ld c, a
 	ret
```


## Pokédex entry banks are derived from their species IDs

`PokedexDataPointerTable` in [data/pokemon/dex_entry_pointers.asm](https://github.com/pret/pokecrystal/blob/master/data/pokemon/dex_entry_pointers.asm) is a table of `dw`, not `dba`, yet there are four banks used for Pokédex entries. The correct bank is derived from the species ID at the beginning of each Pokémon's base stats. (This is the only use the base stat species ID has.)

Three separate routines do the same derivation: `GetDexEntryPointer` in [engine/pokedex/pokedex_2.asm](https://github.com/pret/pokecrystal/blob/master/engine/pokedex/pokedex_2.asm):

```asm
GetDexEntryPointer:
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
	maskbits NUM_DEX_ENTRY_BANKS
	ld hl, .PokedexEntryBanks
	ld d, 0
	ld e, a
	add hl, de
	ld b, [hl]
	pop de
	pop hl
	ret

.PokedexEntryBanks:
	db BANK("Pokedex Entries 001-064")
	db BANK("Pokedex Entries 065-128")
	db BANK("Pokedex Entries 129-192")
	db BANK("Pokedex Entries 193-251")
```

`HeavyBall_GetDexEntryBank` in [engine/items/item_effects.asm](https://github.com/pret/pokecrystal/blob/master/engine/items/item_effects.asm):

```asm
HeavyBall_GetDexEntryBank:
	push hl
	push de
	ld a, [wEnemyMonSpecies]
	rlca
	rlca
	maskbits NUM_DEX_ENTRY_BANKS
	ld hl, .PokedexEntryBanks
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hl]
	pop de
	pop hl
	ret

.PokedexEntryBanks:
	db BANK("Pokedex Entries 001-064")
	db BANK("Pokedex Entries 065-128")
	db BANK("Pokedex Entries 129-192")
	db BANK("Pokedex Entries 193-251")
```

And `PokedexShow_GetDexEntryBank` in [engine/pokegear/radio.asm](https://github.com/pret/pokecrystal/blob/master/engine/pokegear/radio.asm):

```asm
PokedexShow_GetDexEntryBank:
	push hl
	push de
	ld a, [wCurPartySpecies]
	dec a
	rlca
	rlca
	maskbits NUM_DEX_ENTRY_BANKS
	ld hl, .PokedexEntryBanks
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hl]
	pop de
	pop hl
	ret

.PokedexEntryBanks:
	db BANK("Pokedex Entries 001-064")
	db BANK("Pokedex Entries 065-128")
	db BANK("Pokedex Entries 129-192")
	db BANK("Pokedex Entries 193-251")
```

**Fix:**

Use `dba` instead of `dw` in `PokedexDataPointerTable`. Make sure to edit the `table_width` line to specify a width of 3 instead of 2.

Delete `HeavyBall_GetDexEntryBank` and `PokedexShow_GetDexEntryBank`. You can also delete `NUM_DEX_ENTRY_BANKS` from [constants/pokemon_data_constants.asm](https://github.com/pret/pokecrystal/blob/master/constants/pokemon_data_constants.asm).

Edit [engine/pokedex/pokedex_2.asm](https://github.com/pret/pokecrystal/blob/master/engine/pokedex/pokedex_2.asm):

```diff
 GetDexEntryPointer:
 ; return dex entry pointer b:de
 	push hl
 	ld hl, PokedexDataPointerTable
 	ld a, b
 	dec a
 	ld d, 0
 	ld e, a
 	add hl, de
 	add hl, de
-	ld e, [hl]
-	inc hl
-	ld d, [hl]
-	push de
-	rlca
-	rlca
-	maskbits NUM_DEX_ENTRY_BANKS
-	ld hl, .PokedexEntryBanks
-	ld d, 0
-	ld e, a
-	add hl, de
-	ld b, [hl]
-	pop de
+	add hl, de
+	; b = bank
+	ld a, [hli]
+	ld b, a
+	; de = address
+	ld a, [hli]
+	ld e, a
+	ld d, [hl]
 	pop hl
 	ret
-
-.PokedexEntryBanks:
-	db BANK("Pokedex Entries 001-064")
-	db BANK("Pokedex Entries 065-128")
-	db BANK("Pokedex Entries 129-192")
-	db BANK("Pokedex Entries 193-251")
```

Edit [engine/items/item_effects.asm](https://github.com/pret/pokecrystal/blob/master/engine/items/item_effects.asm):

```diff
 HeavyBallMultiplier:
 ; subtract 20 from catch rate if weight < 102.4 kg
 ; else add 0 to catch rate if weight < 204.8 kg
 ; else add 20 to catch rate if weight < 307.2 kg
 ; else add 30 to catch rate if weight < 409.6 kg
 ; else add 40 to catch rate
 	ld a, [wEnemyMonSpecies]
 	ld hl, PokedexDataPointerTable
 	dec a
 	ld e, a
 	ld d, 0
 	add hl, de
 	add hl, de
+	add hl, de
+	; d = bank, hl = address
+	ld a, BANK(PokedexDataPointerTable)
+	call GetFarByte
+	push af
+	inc hl
 	ld a, BANK(PokedexDataPointerTable)
 	call GetFarWord
+	pop de

 .SkipText:
-	call HeavyBall_GetDexEntryBank
+	ld a, d
 	call GetFarByte
 	inc hl
 	cp "@"
 	jr nz, .SkipText

-	call HeavyBall_GetDexEntryBank
+	ld a, d
 	push bc
 	inc hl
 	inc hl
 	call GetFarWord
```

And edit [engine/pokegear/radio.asm](https://github.com/pret/pokecrystal/blob/master/engine/pokegear/radio.asm):

```diff
 PokedexShow2:
 	ld a, [wCurPartySpecies]
 	dec a
 	ld hl, PokedexDataPointerTable
 	ld c, a
 	ld b, 0
 	add hl, bc
 	add hl, bc
+	add hl, bc
+	; b = bank
+	ld a, BANK(PokedexDataPointerTable)
+	call GetFarByte
+	ld b, a
+	inc hl
+	; hl = address
 	ld a, BANK(PokedexDataPointerTable)
 	call GetFarWord
-	call PokedexShow_GetDexEntryBank
+	ld a, b
 	push af
 	push hl
 	call CopyDexEntryPart1
```


## The 6-bit caught level can only record up to level 63

Crystal added the Poké Seer, who tells you your Pokémon's caught data: where it was caught, what time, and at what level. The status screen also displays the gender of its Original Trainer, since Crystal added player genders. This data is packed into two previously-unused bytes in the `box_struct`; from [macros/ram.asm](https://github.com/pret/pokecrystal/blob/master/macros/ram.asm):

```asm
MACRO box_struct
\1Species::        db
...
\1CaughtData::
\1CaughtTime::
\1CaughtLevel::    db
\1CaughtGender::
\1CaughtLocation:: db
\1Level::          db
\1BoxEnd::
ENDM
```

These four pieces of data are packed into two bytes using the bitmasks in [constants/pokemon_data_constants.asm](https://github.com/pret/pokecrystal/blob/master/constants/pokemon_data_constants.asm):

```asm
DEF CAUGHT_TIME_MASK  EQU %11000000
DEF CAUGHT_LEVEL_MASK EQU %00111111

DEF CAUGHT_GENDER_MASK   EQU %10000000
DEF CAUGHT_LOCATION_MASK EQU %01111111
```

The caught level only uses six bits, so it can only record levels as high as 2^6 − 1 = 63. If a Pokémon is caught at level 64 or higher, its level overflows into the two bits used for the caught time, before the actual caught time is stored in the same byte with a bitwise `or` operation. For example, a Pokémon caught at level 70 (`%01000110`) in the morning (`%00000000`) would be reported as caught at level 6 (`%000110` in the low six bits) during the day (`%01` in the high two bits).

This limitation is probably why Lugia and Ho-Oh are both encountered at level 60 in Crystal, instead of level 70 in GS.

**Possible fixes:**

- Record any level higher than 63 as level 0, and have the Poké Seer report 0 as "very high".
- Use seven bits for the level (which can store up to level 2^7 − 1 = 127) and one for the time, simply recording 0 for morning or day and 1 for night.
- Move some data around into unused bits elsewhere in the `box_struct`, such as the high bit of `MON_LEVEL`, or the three high bits of `MON_EXP`.
- Add another byte for more caught data, making the `box_struct` larger; this would affect PC Box storage.
- Free up some other bytes in the `box_struct` (e.g. by [replacing](https://github.com/pret/pokecrystal/wiki/Replace-stat-experience-with-EVs) 2-byte stat experience with 1-byte EVs).


## Identical sine wave code and data is repeated five times

`_Sine` in [engine/math/sine.asm](https://github.com/pret/pokecrystal/blob/master/engine/math/sine.asm):

```asm
_Sine::
; a = d * sin(e * pi/32)
	ld a, e
	calc_sine_wave
```

`Sprites_Cosine` and `Sprites_Sine` in [engine/gfx/sprites.asm](https://github.com/pret/pokecrystal/blob/master/engine/gfx/sprites.asm):

```asm
Sprites_Cosine:
; a = d * cos(a * pi/32)
	add %010000 ; cos(x) = sin(x + pi/2)
	; fallthrough
Sprites_Sine:
; a = d * sin(a * pi/32)
	calc_sine_wave
```

`BattleAnim_Cosine` and `BattleAnim_Sine` in [engine/battle_anims/functions.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle_anims/functions.asm):

```asm
BattleAnim_Cosine:
; a = d * cos(a * pi/32)
	add %010000 ; cos(x) = sin(x + pi/2)
	; fallthrough
BattleAnim_Sine:
; a = d * sin(a * pi/32)
	calc_sine_wave BattleAnimSineWave

...

BattleAnimSineWave:
	sine_table 32
```

`StartTrainerBattle_DrawSineWave` in [engine/battle/battle_transition.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/battle_transition.asm):

```asm
StartTrainerBattle_DrawSineWave:
	calc_sine_wave
```

And `CelebiEvent_Cosine` in [engine/events/celebi.asm](https://github.com/pret/pokecrystal/blob/master/engine/events/celebi.asm):

```asm
CelebiEvent_Cosine:
; a = d * cos(a * pi/32)
	add %010000 ; cos(x) = sin(x + pi/2)
	calc_sine_wave
```

They all rely on `calc_sine_wave` in [macros/code.asm](https://github.com/pret/pokecrystal/blob/master/macros/code.asm):

```asm
MACRO calc_sine_wave
; input: a = a signed 6-bit value
; output: a = d * sin(a * pi/32)
	and %111111
	cp  %100000
	jr nc, .negative\@
	call .apply\@
	ld a, h
	ret
.negative\@
	and %011111
	call .apply\@
	ld a, h
	xor $ff
	inc a
	ret
.apply\@
	ld e, a
	ld a, d
	ld d, 0
if _NARG == 1
	ld hl, \1
else
	ld hl, .sinetable\@
endc
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, 0
.multiply\@ ; factor amplitude
	srl a
	jr nc, .even\@
	add hl, de
.even\@
	sla e
	rl d
	and a
	jr nz, .multiply\@
	ret
if _NARG == 0
.sinetable\@
	sine_table 32
endc
ENDM
```

And on `sine_table` in [macros/data.asm](https://github.com/pret/pokecrystal/blob/master/macros/data.asm):

```asm
MACRO sine_table
; \1 samples of sin(x) from x=0 to x<0.5 turns (pi radians)
	for x, \1
		dw sin(x * 0.5 / (\1))
	endr
ENDM
```

**Fix:** Edit [home/sine.asm](https://github.com/pret/pokecrystal/blob/master/home/sine.asm) to contain a single copy of the (co)sine code in bank 0, and call it from those five sites.


## `GetForestTreeFrame` works, but it's still bad

The routine `GetForestTreeFrame` in [engine/tilesets/tileset_anims.asm](https://github.com/pret/pokecrystal/blob/master/engine/tilesets/tileset_anims.asm) is hilariously inefficient.

**Fix:**

Edit `GetForestTreeFrame`:

```diff
 GetForestTreeFrame:
 ; Return 0 if a is even, or 2 if odd.
-	and a
-	jr z, .even
-	cp 1
-	jr z, .odd
-	cp 2
-	jr z, .even
-	cp 3
-	jr z, .odd
-	cp 4
-	jr z, .even
-	cp 5
-	jr z, .odd
-	cp 6
-	jr z, .even
-.odd
-	ld a, 2
-	scf
-	ret
-.even
-	xor a
+	and 1
+	add a
 	ret
```


## The overworld scripting engine assumes no more than 127 banks

The `CallCallback` and `ExitScriptSubroutine` functions in [engine/overworld/scripting.asm](https://github.com/pret/pokecrystal/blob/master/engine/overworld/scripting.asm) use the highest bit of the bank value, to store whether a certain script stack position should be treated as a return from a callback. However, it seems it was opted to explicitly use the `endcallback` command for this purpose, instead.

As such, this bit serves no purpose but to make map scripts living in the higher banks of mappers such as Japanese Crystal's MBC30 crash for weird reasons.

**Fix:**

Remove the bit mask for the bank value in `ExitScriptSubroutine`:

```diff
 ExitScriptSubroutine:
 	...
 	add hl, de
 	ld a, [hli]
 	ld b, a
-	and $7f
 	ld [wScriptBank], a
 	ld a, [hli]
 	ld e, a
```

And in `CallCallback`:

```diff
 CallCallback::
-	ld a, [wScriptBank]
-	or $80
-	ld [wScriptBank], a
 	jp ScriptCall
```
