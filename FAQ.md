# FAQ


## Questions

- [What is pokecrystal11.gbc?](#what-is-pokecrystal11gbc)
- [What is pokecrystal-au.gbc?](#what-is-pokecrystal-augbc)
- [I can't build the ROM, `make` just prints an error!](#i-cant-build-the-rom-make-just-prints-an-error)
  - [`gcc`: command not found](#gcc-command-not-found)
  - ["ERROR: `UNION` already defined"](#error-union-already-defined)
  - ["Expression must be 8-bit"](#expression-must-be-8-bit)
  - ["Segmentation fault" from `rgbgfx`](#segmentation-fault-from-rgbgfx)
  - ["Section is too big" or "Unable to place section in bank"](#section-is-too-big-or-unable-to-place-section-in-bank)
  - ["Invalid file or object file version"](#invalid-file-or-object-file-version)
  - ["Syntax error"](#syntax-error)
- [How do I edit maps?](#how-do-i-edit-maps)
- [How do I edit the colors of an image?](#how-do-i-edit-the-colors-of-an-image)
- [How do I write new features?](#how-do-i-write-new-features)
- [I need more help!](#i-need-more-help)


## What is pokecrystal11.gbc?

Version 1.1 of Pokémon Crystal, which fixed some issues with the initial international release. `make crystal11` defines `_CRYSTAL11` so the assembly builds the changed version.

## What is pokecrystal-au.gbc?

The Australian release of Pokémon Crystal, which is based on the international 1.1 release but censors gambling references from the Game Corners. `make crystal-au` defines `_CRYSTAL11` and `_CRYSTAL_AU` so the assembly builds the changed version.


## I can't build the ROM, `make` just prints an error!

Reread [INSTALL.md](INSTALL.md) carefully, and make sure you're following all its steps.

### `gcc`: command not found

You need to install `gcc`. If you're using Cygwin, re-run its setup, and at "Select Packages", choose to install `gcc-core`.

### "ERROR: `UNION` already defined"

Download [**rgbds 0.3.9**][rgbds] or newer. Older versions will not work.

### "Expression must be 8-bit"

Download [**rgbds 0.3.9**][rgbds] or newer. Older versions will not work.

### "Segmentation fault" from `rgbgfx`

If you are using 64-bit Windows, download [**64-bit Cygwin**][cygwin] and [**64-bit rgbds**][rgbds].

### "Section is too big" or "Unable to place section in bank"

If you have not changed any of the asm, make sure you have the latest version of pokecrystal and the correct version of rgbds (see [INSTALL.md](INSTALL.md)).

If you added or changed any code, it has to fit in the **memory banks**. The 2MB ROM is divided into 128 banks of 4KB ($4000 bytes) each, numbered $00 to $7F. The linkerscript [pokecrystal.link](pokecrystal.link) lists which `SECTION`s go in which banks. Try moving some code into a new section.

### "Invalid file or object file version"

Run `make clean` to remove all the old `o` files, then re-run `make`.

### "Syntax error"

If you have not changed any of the asm, make sure you have the latest version of pokecrystal and the correct version of rgbds (see [INSTALL.md](INSTALL.md)).

If you added or changed any code, you've made a mistake while writing some of it. Re-read the modifications you've made to the file it complains about and try to compare them with other code.


## How do I edit maps?

For `asm` scripts, read [docs/map_event_scripts.md](https://pret.github.io/pokecrystal/map_event_scripts). For `blk` layouts, use [Polished Map][polished-map].


## How do I edit the colors of an image?

Most `.png` images are paletted PNGs. You can edit these with any program that supports creating PNGs with palette information. These palettes should consist of exactly 4 colors. Additionally, for Pokémon images, the first color should be white, and the last black. Tools such as Paint and [GIMP](gimp) will do the right job, while other tools such as [paint.net](paintdotnet) or Photoshop might mess it up and output palettes of 255 colors even though only using 4. You may try using tools like [GraphicsGale](graphicsgale) or [IrfanView](irfanview) to fix this, or sometimes resaving the image in Paint seems to help.

Some image `.png` files are greyscale. This indicates that even though these images do have proper colors in-game, they're shared with something else, and as such changing them will affect other things as well. Don't try opening the `.2bpp` files, these only contain the image data as well, not the palettes.

It really depends on what image you're trying to change the colors of, where these colors are specified. Try looking for related files or `.pal` files.


## How do I write new features?

There are a number of special-purpose scripting languages, as described in [docs](https://pret.github.io/pokecrystal/). For more general features, you'll need to code directly in [assembly language][asm]. Some of the [tutorials][tutorials] for specific features may also be helpful.


## I need more help!

Try asking on IRC or Discord (see [README.md](README.md)).

[cygwin]: https://cygwin.com/install.html
[rgbds]: https://github.com/rednex/rgbds/releases
[polished-map]: https://github.com/Rangi42/polished-map
[gimp]: https://www.gimp.org/
[paintdotnet]: https://www.getpaint.net/
[graphicsgale]: https://graphicsgale.com/us/
[irfanview]: https://www.irfanview.com/
[asm]: https://github.com/pret/pokecrystal/wiki/Assembly-programming
[tutorials]: https://github.com/pret/pokecrystal/wiki/Tutorials
