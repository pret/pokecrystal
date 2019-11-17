# Instructions

These instructions explain how to set up the tools required to build **pokecrystal**, including [**rgbds**](https://github.com/rednex/rgbds), which assembles the source files into a ROM.

If you run into trouble, ask for help on IRC or Discord (see [README.md](README.md)).

## Required Libraries

- `make`
- `gcc` (or `clang`)
- `git`
- `rgbds`

If `rgbds` is not available, you'll also need these:

- `pkg-config`
- `flex`
- `bison`
- `libpng` (and the development headers)

To install **rgbds**:

```bash
git clone --depth=1 https://github.com/rednex/rgbds
sudo make -C rgbds CFLAGS=-O2 install
```

Now you're ready to [build **pokecrystal**](#build-pokecrystal).


## Build pokecrystal

To download the **pokecrystal** source files:

```bash
git clone https://github.com/pret/pokecrystal
cd pokecrystal
```

To build **pokecrystal.gbc**:

```bash
make
```

To build **pokecrystal11.gbc**:

```bash
make crystal11
```
