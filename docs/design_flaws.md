# Design Flaws

These are parts of the code that do not work *incorrectly*, like [bugs and glitches](/docs/bugs_and_glitches.md), but that clearly exist just to work around a problem. In other words, with a slightly different design, the code would not need to exist at all. Design flaws may be exceptions to a usual rule, such as "tables of pointers in different banks use `dba`" ([one exception](#pic-banks-are-offset-by-pics_fix), [and another](#pokédex-entry-banks-are-derived-from-their-species-ids)) or "graphics used as a unit are stored and loaded contiguously" ([a notable exception](#footprints-are-split-into-top-and-bottom-halves)).


## Contents

- [Pic banks are offset by `PICS_FIX`](#pic-banks-are-offset-by-pics_fix)
- [`PokemonPicPointers` and `UnownPicPointers` are assumed to start at the same address](#pokemonpicpointers-and-unownpicpointers-are-assumed-to-start-at-the-same-address)
- [Footprints are split into top and bottom halves](#footprints-are-split-into-top-and-bottom-halves)
- [`ITEM_C3` and `ITEM_DC` break up the continuous sequence of TM items](#item_c3-and-item_dc-break-up-the-continuous-sequence-of-tm-items)
- [Pokédex entry banks are derived from their species IDs](#pokédex-entry-banks-are-derived-from-their-species-ids)
- [Identical sine wave code and data is repeated five times](#identical-sine-wave-code-and-data-is-repeated-five-times)
- [`GetForestTreeFrame` works, but it's still bad](#getforesttreeframe-works-but-its-still-bad)


## Pic banks are offset by `PICS_FIX`

[data/pokemon/pic_pointers.asm](/data/pokemon/pic_pointers.asm), [data/pokemon/unown_pic_pointers.asm](/data/pokemon/unown_pic_pointers.asm), and [data/trainers/pic_pointers.asm](/data/trainers/pic_pointers.asm) all have to use `dba_pic` instead of `dba`. This is a macro in [macros/data.asm](/macros/data.asm) that offsets banks by `PICS_FIX`:

```asm
dba_pic: MACRO ; dbw bank, address
	db BANK(\1) - PICS_FIX
	dw \1
ENDM
```

The offset is translated into a correct bank by `FixPicBank` in [engine/gfx/load_pics.asm](/engine/gfx/load_pics.asm):

```asm
FixPicBank:
; This is a thing for some reason.

PICS_FIX EQU $36
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
	db BANK("Pics 2")  ; BANK("Pics 1") + 1
	db BANK("Pics 3")  ; BANK("Pics 1") + 2
	db BANK("Pics 4")  ; BANK("Pics 1") + 3
	db BANK("Pics 5")  ; BANK("Pics 1") + 4
	db BANK("Pics 6")  ; BANK("Pics 1") + 5
	db BANK("Pics 7")  ; BANK("Pics 1") + 6
	db BANK("Pics 8")  ; BANK("Pics 1") + 7
	db BANK("Pics 9")  ; BANK("Pics 1") + 8
	db BANK("Pics 10") ; BANK("Pics 1") + 9
	db BANK("Pics 11") ; BANK("Pics 1") + 10
	db BANK("Pics 12") ; BANK("Pics 1") + 11
	db BANK("Pics 13") ; BANK("Pics 1") + 12
	db BANK("Pics 14") ; BANK("Pics 1") + 13
	db BANK("Pics 15") ; BANK("Pics 1") + 14
	db BANK("Pics 16") ; BANK("Pics 1") + 15
	db BANK("Pics 17") ; BANK("Pics 1") + 16
	db BANK("Pics 18") ; BANK("Pics 1") + 17
	db BANK("Pics 19") ; BANK("Pics 1") + 18
	db BANK("Pics 20") ; BANK("Pics 1") + 19
	db BANK("Pics 21") ; BANK("Pics 1") + 20
	db BANK("Pics 22") ; BANK("Pics 1") + 21
	db BANK("Pics 23") ; BANK("Pics 1") + 22
	db BANK("Pics 24") ; BANK("Pics 1") + 23
```

**Fix:** Use `dba` instead of `dba_pic`, delete `FixPicBank`, and remove all four calls to `FixPicBank`.


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

Two routines in [engine/gfx/load_pics.asm](/engine/gfx/load_pics.asm) make this assumption; `GetFrontpicPointer`:

```asm
	ld a, [wCurPartySpecies]
	cp UNOWN
	jr z, .unown
	ld a, [wCurPartySpecies]
	ld d, BANK(PokemonPicPointers)
	jr .ok

.unown
	ld a, [wUnownLetter]
	ld d, BANK(UnownPicPointers)

.ok
	ld hl, PokemonPicPointers ; UnownPicPointers
	dec a
	ld bc, 6
	call AddNTimes
```

And `GetMonBackpic`:

```asm
	; These are assumed to be at the same address in their respective banks.
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

```diff
 	ld a, [wCurPartySpecies]
 	cp UNOWN
 	jr z, .unown
 	ld a, [wCurPartySpecies]
+	ld hl, PokemonPicPointers
 	ld d, BANK(PokemonPicPointers)
 	jr .ok

 .unown
 	ld a, [wUnownLetter]
+	ld hl, UnownPicPointers
 	ld d, BANK(UnownPicPointers)

 .ok
-	ld hl, PokemonPicPointers ; UnownPicPointers
 	dec a
 	ld bc, 6
 	call AddNTimes
```

And `GetMonBackpic`:

```diff
-	; These are assumed to be at the same address in their respective banks.
-	ld hl, PokemonPicPointers ; UnownPicPointers
 	ld a, b
+	ld hl, PokemonPicPointers
 	ld d, BANK(PokemonPicPointers)
 	cp UNOWN
 	jr nz, .ok
 	ld a, c
+	ld hl, UnownPicPointers
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

`Pokedex_LoadAnyFootprint` in [engine/pokedex/pokedex.asm](/engine/pokedex/pokedex.asm):

```asm
	push hl
	ld e, l
	ld d, h
	ld hl, vTiles2 tile $62
	lb bc, BANK(Footprints), 2
	call Request1bpp
	pop hl

	; Whoever was editing footprints forgot to fix their
	; tile editor. Now each bottom half is 8 tiles off.
	ld de, 8 tiles
	add hl, de

	ld e, l
	ld d, h
	ld hl, vTiles2 tile $64
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

```diff
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


## `ITEM_C3` and `ITEM_DC` break up the continuous sequence of TM items

[constants/item_constants.asm](/constants/item_constants.asm) defined the 50 TMs in order with `add_tm`, but `ITEM_C3` and `ITEM_DC` break up that sequence.

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
NUM_TMS = const_value - TM01 - 2 ; discount ITEM_C3 and ITEM_DC
```

`GetTMHMNumber` and `GetNumberedTMHM` in [engine/items/items.asm](/engine/items/items.asm) have to compensate for this:

```asm
GetTMHMNumber::
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

GetNumberedTMHM:
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

Modify engine/items/items.asm:

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

`PokedexDataPointerTable` in [data/pokemon/dex_entry_pointers.asm](/data/pokemon/dex_entry_pointers.asm) is a table of `dw`, not `dba`, yet there are four banks used for Pokédex entries. The correct bank is derived from the species ID at the beginning of each Pokémon's base stats. (This is the only use the base stat species ID has.)

Three separate routines do the same derivation; `GetDexEntryPointer` in [engine/pokedex/pokedex_2.asm](/engine/pokedex/pokedex_2.asm):

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

`GetPokedexEntryBank` in [engine/items/item_effects.asm](/engine/items/item_effects.asm):

```asm
GetPokedexEntryBank:
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

And `PokedexShow_GetDexEntryBank` in [engine/pokegear/radio.asm](/engine/pokegear/radio.asm):

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

**Fix:** Use `dba` instead of `dw` in `PokedexDataPointerTable`, and modify the code that accesses it to match.


## Identical sine wave code and data is repeated five times

`_Sine` in [engine/math/sine.asm](/engine/math/sine.asm):

```asm
_Sine::
; a = d * sin(e * pi/32)
	ld a, e
	calc_sine_wave
```

`Sprites_Cosine` and `Sprites_Sine` in [engine/gfx/sprites.asm](/engine/gfx/sprites.asm):

```asm
Sprites_Cosine:
; a = d * cos(a * pi/32)
	add %010000 ; cos(x) = sin(x + pi/2)
	; fallthrough
Sprites_Sine:
; a = d * sin(a * pi/32)
	calc_sine_wave
```

`BattleAnim_Cosine` and `BattleAnim_Sine` in [engine/battle_anims/functions.asm](/engine/battle_anims/functions.asm):

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

`StartTrainerBattle_DrawSineWave` in [engine/battle/battle_transition.asm](/engine/battle/battle_transition.asm):

```asm
StartTrainerBattle_DrawSineWave:
	calc_sine_wave
```

And `CelebiEvent_Cosine` in [engine/events/celebi.asm](/engine/events/celebi.asm):

```asm
CelebiEvent_Cosine:
; a = d * cos(a * pi/32)
	add %010000 ; cos(x) = sin(x + pi/2)
	calc_sine_wave
```

They all rely on `calc_sine_wave` in [macros/code.asm](/macros/code.asm):

```asm
calc_sine_wave: MACRO
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

And on `sine_table` in [macros/data.asm](/macros/data.asm):

```asm
sine_table: MACRO
; \1 samples of sin(x) from x=0 to x<32768 (pi radians)
x = 0
rept \1
	dw (sin(x) + (sin(x) & $ff)) >> 8 ; round up
x = x + DIV(32768, \1) ; a circle has 65536 "degrees"
endr
ENDM
```

**Fix:** Edit [home/sine.asm](/home/sine.asm) to contain a single copy of the (co)sine code in bank 0, and call it from those five sites.


## `GetForestTreeFrame` works, but it's still bad

In [engine/tilesets/tileset_anims.asm](/engine/tilesets/tileset_anims.asm):

```asm
GetForestTreeFrame:
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
```

**Fix:**

```asm
GetForestTreeFrame:
; Return 0 if a is even, or 2 if odd.
	and 1
	add a
	ret
```
