Makefile usage
==============

[Make](https://en.wikipedia.org/wiki/Make_(software)) is a tool that takes care of figuring out what files need to be used to build the game, how to use them, and in what order. It also figures out what steps it can skip by checking what files have been modified or not. This tool makes building and iterating on software simple and and fast.

To know what to build and how, `make` relies on a special file called a `Makefile` to tell it what to do. Different makefiles tend vary a bit in behavior and options, and pokecrystal's is no different. This document explains the basic usage of `make` in combination with this `Makefile` and goes over some of the parameters and modes of use it accepts. Whether you're a beginner or have been using `make` for a while, this document should prove useful to learn how to use it to its fullest.


Basic usage
-----------

To build the project normally, you run:
```
make
```
This will look for all `.asm` files it can find, figure out what files they need, and use this information to build the game.

But `make`, being the tool that it is, allows for [parallelization](https://www.gnu.org/software/make/manual/html_node/Parallel.html). This means that it can run multiple processes, and as such build multiple files at the same time. To do this, you can use:
```
make -j4
```
The `-j` option stands for "jobs", and we tell it to run at most 4 builds at the same time. On a multicore/hyperthreading machine, this will result in much faster build times. Many machines, however, can do more than 4 threads at once. To find a better number for your machine, you can run the `nproc` command, or combine it with `make` like this:
```
make -j$(nproc)
```

When you want to share or back up your project without the built files, or simply want to start building from a clean slate (such as for example when updating rgbds), you can run:
```
make clean
```
This will remove all of the built files, and a subsequent `make` will rebuild _everything_. The default `.gitignore` file should ignore these files when managing the project with `git`, so you shouldn't have to clean to make a commit or upload it to a git hosting service such as github.

pokecrystal contains the disassembly of more than one version of Pokémon Crystal. By default, crystal version 1.0 is built. If you want to build version 1.1, run:
```
make crystal11
```
This will set the `_CRYSTAL11` flag so the assembler knows what version we're building, and use some files from the `version/crystal11/` directory instead of the equivalent base files.


Advanced usage
--------------


### Change output ROM directory
You can have the project copy the built ROMs elsewhere by setting the `POKECRYSTAL_OUTPUT` environment variable, like this:
```
export POKECRYSTAL_OUTPUT="/cygdrive/c/Users/You/My Documents/pokemon"
make
```
To make this setting permanent, add the `export` command to your `$HOME/.bashrc` file.


### Build only one file
If you only need to build one single file, or a set of files, you can specify it in the command-line. For example:
```
make gfx/pokemon/pikachu/front.animated.2bpp.lz gfx/pokemon/pikachu/back.2bpp.lz
```
These files will appear under `build/crystal/`. You can combine this with the `version=` parameter to build this file for a different version of the game.


### Change build defaults (name of rom/version to build)
You can change a couple of paramters at the very top of the makefile, such as the name of the ROM(s), the version of the game that should be built by default (when `make` is ran without arguments), and the different versions that can be built (see the `version/` directories)
```
# Name of the ROM
name = poke$(version)

# Default version of the game to build
version := crystal

# All of the available versions
versions := crystal crystal11 crystal-au
```
Of note is that `version` should appear in `versions`, and if you intend to build more than one version, the `name` variable should contain the `$(version)` variable somewhere, otherwise the different versions will overwrite the same file.


### Remove all versions of the game you won't use
This disassembly is able to build multiple different versions of the ROM from the same source code. This works by setting a variable (such as `_CRYSTAL11`) that can be checked in the assembly files to generate different code depending on this (see the `.mk` files under `version/`). On top of that, some files are fully replaced with equivalents in the `version/` directory.

However, when making a derivative version off of this disassembly, you oftentimes just want to bother with _one_ version. Fortunately, removing all excess versions is pretty easy.

First of all, set your default `version` and the list of `versions` you're going to use in the `Makefile`. In this example we're using:
```
version := crystal11
versions := crystal11
```

Then, copy everything from your chosen default version to the main directory, and remove that version's directory, like:
```
cp -av version/crystal11/* .
rm -rf version/crystal11
```

Now, remove all version directories of the versions you're not using, and their `.mk` files:
```
rm -rf version/crystal-au # ... etc
rm -f version/crystal.mk version/crystal-au.mk # ... etc
```

If you now have only one `.mk` file left under `version/`, you can open up the `Makefile` and replace the `include $(version).mk` line with its contents. Then you can delete the `version/` directory. You'll still find `if DEF(_CRYSTAL11)` and similar in the source code. They do no harm but you can delete these conditionals and only keep the version(s) you care about.


### Verify the built ROMs still match the original
In case you plan on contributing back to this project, to fix or document things, through for example a Pull Request, you should verify the ROMs still match the original game. You can do this by:
```
make compare
```
This might take quite a bit, as it has to rebuild the entire game for as many versions as there are, so you probably want to combine this with the `-j` option.
