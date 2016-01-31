The source files are assembled into a rom using [*rgbds*][https://github.com/bentley/rgbds].
These instructions explain how to set up the tools required to build.


# Linux

Python 2.7 is required.

```bash
sudo apt-get install make gcc bison git python python-pip
pip install pypng

git clone https://github.com/bentley/rgbds
cd rgbds
sudo make install
cd ..

git clone --recursive https://github.com/pret/pokecrystal
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
sudo easy_install pypng

git clone https://github.com/bentley/rgbds
cd rgbds
sudo make install
cd ..

git clone --recursive https://github.com/pret/pokecrystal
cd pokecrystal
```

To build **pokecrystal.gbc**:

```bash
make
```


# Windows

To build on Windows, use [**Cygwin**](http://cygwin.com/install.html). Use the default settings.

In the installer, select the following packages: `make` `git` `python` `python-setuptools` `gcc-core` `libsasl2-3` `ca-certificates`

Then get the most recent version of [**rgbds**](https://github.com/bentley/rgbds/releases/).
Extract the archive and put `rgbasm.exe`, `rgblink.exe` and `rgbfix.exe` in `C:\cygwin\usr\local\bin`.

In the **Cygwin terminal**:

```bash
lynx -source bootstrap.pypa.io/get-pip.py | python
pip install pypng

git clone --recursive https://github.com/pret/pokecrystal
cd pokecrystal
```

To build **pokecrystal.gbc**:

```bash
make
```
