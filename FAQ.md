# FAQ


## Questions

- [What is pokecrystal11.gbc?](#what-is-pokecrystal11gbc)
- [Can't build ROM; "ERROR: `UNION` already defined"](#cant-build-rom-error-union-already-defined)
- [Can't build ROM; "Segmentation fault" from `rgbgfx`](#cant-build-rom-segmentation-fault-from-rgbgfx)
- [Can't build ROM; "Section is too big" or "Unable to place section in bank"](#cant-build-rom-section-is-too-big-or-unable-to-place-section-in-bank)
- [How do I edit maps?](#how-do-i-edit-maps)
- [How do I write new features?](#how-do-i-write-new-features)
- [I need more help!](#i-need-more-help)


## What is pokecrystal11.gbc?

Version 1.1 of Pokémon Crystal, which fixed some issues with the initial international release. `make crystal11` defines `_CRYSTAL11` so the assembly builds the changed version.


## Can't build ROM; "ERROR: `UNION` already defined"

Download [**rgbds 0.3.3**][rgbds]. Earlier versions will not work.


## Can't build ROM; "Segmentation fault" from `rgbgfx`

If you are using 64-bit Windows, download [**64-bit Cygwin**][cygwin] and [**64-bit rgbds**][rgbds].


## Can't build ROM; "Section is too big" or "Unable to place section in bank"

If you have not changed any of the asm, make sure you have the latest version of pokecrystal and the correct version of rgbds (see [INSTALL.md](INSTALL.md)).

If you added or changed any code, it has to fit in the **memory banks**. The 2MB ROM is divided into 128 banks of 4KB each, numbered $00 to $7F. The linkerscript **pokecrystal.link** lists which **`SECTION`**s go in which banks. Try moving some code into a new section.


## How do I edit maps?

For `asm` scripts, read [docs/map_scripts.md](docs/map_scripts.md). For `blk` layouts, try [crowdmap][crowdmap] or [Polished Map][polished-map].


## How do I write new features?

There are a number of special-purpose scripting languages used for different purposes, as described in [docs](docs/). For more general features, you'll need to code directly in assembly language. See [docs/assembly_programming.md](docs/assembly_programming.md).


## I need more help!

Try asking on IRC or Discord (see [README.md](README.md)).

[cygwin]: https://cygwin.com/install.html
[rgbds]: https://github.com/rednex/rgbds/releases
[crowdmap]: https://github.com/yenatch/crowdmap/
[polished-map]: https://github.com/roukaour/polished-map
