The source files are assembled into a rom using [**rgbds**](https://github.com/rednex/rgbds).
These instructions explain how to set up the tools required to build.

If you run into trouble, ask for help on irc or discord (see [README.md](README.md)).


# Linux

```bash
sudo apt-get install make gcc bison git libpng-dev

git clone https://github.com/rednex/rgbds
cd rgbds
sudo make install
cd ..

git clone https://github.com/pret/pokecrystal
cd pokecrystal
```

To build **pokecrystal.gbc**:

```bash
make
```


# Mac

In **Terminal**, run:

```bash
xcode-select --install

git clone https://github.com/rednex/rgbds
cd rgbds
sudo make install
cd ..

git clone https://github.com/pret/pokecrystal
cd pokecrystal
```

To build **pokecrystal.gbc**:

```bash
make
```


# Windows

To build on Windows, install [**Cygwin**](http://cygwin.com/install.html) with the default settings.

In the installer, select the following packages:
- `make`
- `git`
- `gcc-core`

Then download [**rgbds**](https://github.com/rednex/rgbds/releases/).
Extract rgbds-0.3.3-win64.tar.gz and put all the `exe` and `dll` files individually in **C:\Cygwin64\usr\local\bin**. If you are using 32-bit Windows and Cygwin, extract **rgbds-0.3.3-win32.tar.gz** to **C:\Cygwin\usr\local\bin**.

**Note: If you have an older rgbds, you will need to update to 0.3.3 or newer.** Ignore this if you have never installed rgbds before.

In the **Cygwin terminal**:

```bash

git clone https://github.com/pret/pokecrystal
cd pokecrystal
```

To build **pokecrystal.gbc**:

```bash
make
```
