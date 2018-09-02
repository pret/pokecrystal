# Instructions

The source files are assembled into a ROM using [**rgbds**](https://github.com/rednex/rgbds).
These instructions explain how to set up the tools required to build.

If you run into trouble, ask for help on IRC or Discord (see [README.md](README.md)).


## Windows 10

Set up/install [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10).

WSL has its own file system that's not accessible from Windows, but the Windows file system, *is* accessible from WSL. So you're going to want to install pokecrystal within the Windows file system.

The Windows `C:\` drive is called `/mnt/c/` in WSL. You will have to change the current working directory to within `/mnt/c/` every time you open WSL.

For example, if you want your pokecrystal in `C:\Users\<user>\Desktop`:

```
cd /mnt/c/Users/<user>/Desktop
```

(Replace `<user>` with your username.)

You will have to run this command each time you open WSL.

Follow [the instructions for Linux](#linux) to complete the installation.

If this doesn't work, try following the regular Windows installation instructions below.


## Windows

Download [**Cygwin**](http://cygwin.com/install.html): **setup-x86_64.exe** for 64-bit Windows, **setup-x86.exe** for 32-bit.

Run setup and leave the default settings. At "Select Packages", choose to install the following, all of which are in the "Devel" category:

- `make`
- `git`
- `gcc-core`

Click once on the text that says "Skip" next to each package to select the most recent version to install.

Then download [**rgbds**](https://github.com/rednex/rgbds/releases/): the latest **win64.zip** or **win32.zip** release. Extract it and put all the `exe` and `dll` files individually in **C:\cygwin64\usr\local\bin**.

**Note: If you have an older rgbds, you will need to update to 0.3.7 or newer.** Ignore this if you have never installed rgbds before.

In the **Cygwin terminal**, enter these commands:

```bash
git clone https://github.com/pret/pokecrystal
cd pokecrystal
```

The files will be stored in **C:\cygwin64\home\<user>**.

To build **pokecrystal.gbc**:

```bash
make
```

To build **pokecrystal11.gbc**:

```bash
make crystal11
```


## Mac

In **Terminal**, run:

```bash
xcode-select --install

git clone --depth=1 https://github.com/rednex/rgbds
cd rgbds
sudo make CFLAGS=-O2 install
cd ..

git clone https://github.com/pret/pokecrystal
cd pokecrystal
```

To build **pokecrystal.gbc**:

```bash
make
```


## Linux

### Install the required software

#### Debian/Ubuntu

```bash
sudo apt-get install make gcc bison git libpng-dev

git clone --depth=1 https://github.com/rednex/rgbds
sudo make -C rgbds CFLAGS=-O2 install
```

#### OpenSUSE

```bash
sudo zypper install make gcc bison git libpng16-devel

git clone --depth=1 https://github.com/rednex/rgbds
sudo make -C rgbds CFLAGS=-O2 install
```

#### Arch Linux

```bash
sudo pacman -S make gcc bison git libpng

git clone --depth=1 https://github.com/rednex/rgbds
sudo make -C rgbds CFLAGS=-O2 install
```

#### Termux

```bash
sudo apt install make clang git rgbds sed
```

#### Other distros

If your distro is not listed here, try to find the required software in the repositories:
- `make`
- `gcc` (or `clang`)
- `git`
- `rgbds`

To build `rgbds` from source, if not available for your distro, you need, additionally:
- `bison`
- `libpng` (and the development headers)

And run the following commands:
```bash
git clone --depth=1 https://github.com/rednex/rgbds
sudo make -C rgbds CFLAGS=-O2 install
```

### Download and build the code

```bash
git clone https://github.com/pret/pokecrystal
cd pokecrystal
```

To build **pokecrystal.gbc**:

```bash
make
```
