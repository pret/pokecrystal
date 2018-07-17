# FAQ


## Questions

- [What is pokecrystal11.gbc?](#what-is-pokecrystal11gbc)
- [I can't build the ROM, `make` just prints an error!](#i-cant-build-the-rom-make-just-prints-an-error)
  - [`gcc`: command not found](#gcc-command-not-found)
  - ["ERROR: `UNION` already defined"](#error-union-already-defined)
  - ["Segmentation fault" from `rgbgfx`](#segmentation-fault-from-rgbgfx)
  - ["Section is too big" or "Unable to place section in bank"](#section-is-too-big-or-unable-to-place-section-in-bank)
  - ["Invalid file or object file version"](#invalid-file-or-object-file-version)
- [How do I edit maps?](#how-do-i-edit-maps)
- [How do I write new features?](#how-do-i-write-new-features)
- [I need more help!](#i-need-more-help)


## What is pokecrystal11.gbc?

Version 1.1 of Pokémon Crystal, which fixed some issues with the initial international release. `make crystal11` defines `_CRYSTAL11` so the assembly builds the changed version.


## I can't build the ROM, `make` just prints an error!

Reread [INSTALL.md](INSTALL.md) carefully, and make sure you're following all its steps.

### `gcc`: command not found

You need to install `gcc`. If you're using Cygwin, re-run its setup, and at "Select Packages", choose to install `gcc-core`.

### "ERROR: `UNION` already defined"

Download [the latest **rgbds** release][rgbds]. Versions earlier than 0.3.3 will not work.

### "Segmentation fault" from `rgbgfx`

If you are using 64-bit Windows, download [**64-bit Cygwin**][cygwin] and [**64-bit rgbds**][rgbds].

### "Section is too big" or "Unable to place section in bank"

If you have not changed any of the asm, make sure you have the latest version of pokecrystal and the correct version of rgbds (see [INSTALL.md](INSTALL.md)).

If you added or changed any code, it has to fit in the **memory banks**. The 2MB ROM is divided into 128 banks of 4KB each, numbered $00 to $7F. The linkerscript **pokecrystal.link** lists which `SECTION`s go in which banks. Try moving some code into a new section.

### "Invalid file or object file version"

Run `make clean` to remove all the old `o` files, then re-run `make`.


## How do I edit maps?

For `asm` scripts, read [docs/map_event_scripts.md](docs/map_event_scripts.md). For `blk` layouts, try [Polished Map][polished-map] or [crowdmap][crowdmap].


## How do I write new features?

There are a number of special-purpose scripting languages, as described in [docs](docs/). For more general features, you'll need to code directly in assembly language. See [docs/assembly_programming.md](docs/assembly_programming.md). Some of the [tutorials][tutorials] may also be helpful.


## I need more help!

Try asking on IRC or Discord (see [README.md](README.md)).

[cygwin]: https://cygwin.com/install.html
[rgbds]: https://github.com/rednex/rgbds/releases
[polished-map]: https://github.com/Rangi42/polished-map
[crowdmap]: https://github.com/yenatch/crowdmap/
[tutorials]: https://github.com/pret/pokecrystal/wiki/Tutorials
