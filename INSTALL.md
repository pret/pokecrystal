The source files are assembled into a rom using [**rgbds**](https://github.com/rednex/rgbds).
These instructions explain how to set up the tools required to build.

If you run into trouble, ask on irc ([**freenode#pret**](https://kiwiirc.com/client/irc.freenode.net/?#pret)).


# Linux

```bash
sudo apt-get install make gcc bison git libpng-dev

git clone https://github.com/rednex/rgbds
cd rgbds
git checkout v0.2.5
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
git checkout v0.2.5
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

In the installer, select the following packages: `make` `git` `gettext` `gcc-core`

Then get [**rgbds 0.2.5**](https://github.com/rednex/rgbds/releases/). Versions 0.3.0 and later are not compatible.
Extract the archive and put all the `exe` and `dll` files individually in `C:\cygwin64\usr\local\bin`.

In the **Cygwin terminal**:

```bash

git clone https://github.com/pret/pokecrystal
cd pokecrystal
```

To build **pokecrystal.gbc**:

```bash
make
```

## notes

- If `gettext` no longer exists, grab `libsasl2-3` `ca-certificates`.
