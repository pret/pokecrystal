# Getting Started

Assembling **pokecrystal.gbc** requires a certain **Pokemon Crystal** rom:

```
Pokemon - Crystal Version (UE) (V1.0) [C][!].gbc
md5: 9f2922b235a5eeb78d65594e82ef5dde
```

Save it as **baserom.gbc** in the repository.

Feel free to ask us on
**[nucleus.kafuka.org #skeetendo](https://kiwiirc.com/client/irc.nolimitzone.com/?#skeetendo)**
if something goes wrong.

# Windows

If you're on Windows and can't install Linux, **Cygwin** is a great alternative.


## Installing Cygwin

Cygwin provides a virtual Linux environment on Windows systems. Just get **setup.exe**.

**http://cygwin.com/install.html**

During the install:

* Keep the defaults.
* Most mirrors are molasses. Use **http://mirrors.kernel.org**.
* From the package selection, pick:
 * **wget**
 * **make**
 * **git**
 * **python**
 * **python-setuptools**
 * **unzip**

## Using Cygwin

Launch the **Cygwin terminal**.
Maybe you know your way around the Linux terminal ( **bash** ).
If not, a crash course:
```bash
# list files in current directory
ls

# show current directory
pwd

# change directory
cd /away/we/go
```

## Getting up and running

We need three things to assemble the source into a rom.

1. **rgbds**
2. a **pokecrystal** repository
3. a **base rom**

We use **rgbds** to spit out a Game Boy rom from source.
```bash
cd /usr/local/bin
wget http://iimarck.us/etc/rgbds-20130811.zip
unzip -j rgbds-20130811.zip
rm rgbds-20130811.zip
```

The **pokecrystal** repository contains the source files used to create the rom.
```bash
cd ~
git clone https://github.com/kanzure/pokecrystal
cd pokecrystal

# install python requirements
easy_install pip
pip install -r requirements.txt
```

Not everything is included in the source yet.
Missing patches are copied from a **base rom** (not included).

```
Pokemon - Crystal Version (UE) (V1.0) [C][!].gbc
md5: 9f2922b235a5eeb78d65594e82ef5dde
```

Name it **baserom.gbc**.

**pokecrystal** only compiles with the use of a git submodule. To activate the submodule type:

```
git submodule init
git submodule update
```

Now you should be able to build **pokecrystal.gbc** for the first time.

This compiles a new rom from the source code, with any patches filled in from the base rom.

```bash
make
```

This ought to take **between 3 and 15 seconds**, depending on your computer.

If the last line is `cmp baserom.gbc pokecrystal.gbc`, the build was successful!

Your first build processes every source file at once.
After that, **only modified source files have to be processed again**,
so compiling again should be a few seconds faster.

# Linux

```bash
sudo apt-get install make gcc bison git python python-setuptools 
sudo easy_install pip

# install rgbds
git clone git://github.com/bentley/rgbds.git
cd rgbds
make
sudo make install

cd ..

# download pokecrystal
git clone git://github.com/kanzure/pokecrystal.git
cd pokecrystal

# grab extras/ which is required for compiling
git submodule init
git submodule update

# install python requirements
pip install -r extras/requirements.txt

# use hexdump to diff binary files
git config diff.hex.textconv hexdump
```

Put your base rom in the pokecrystal repository. Name it **baserom.gbc**.

To compile the rom from source:
```bash
make
```

That will take between 3 and 15 seconds, depending on your computer.
If you see `cmp baserom.gbc pokecrystal.gbc` as the last line, the build was successful! Rejoice!


# Now what?

**[pokecrystal.asm](https://github.com/kanzure/pokecrystal/blob/master/pokecrystal.asm)** is a good starting point.
The structure of the source is laid out here.


* Other **make targets** that may come in handy:

 * `make clean` deletes any preprocessed source files (.tx), rgbds object files and pokecrystal.gbc.
 * `make pngs` decompresses any **lz** files in gfx/ and then exports any graphics files to **png**.
 * `make lzs` does the reverse. This is already part of the build process, so **modified pngs will automatically be converted to 2bpp and lz-compressed** without any additional work.


* **Can't find something?**
Anyone can add to the source. There's lots to be uncovered.

* **Do your own thing!**
The asm source is hack-friendly, and the supplementary scripts in extras/ can be used for other projects.

We'll be happy to answer any **questions** on
**[nucleus.kafuka.org #skeetendo](https://kiwiirc.com/client/irc.nolimitzone.com/?#skeetendo)**.


Other **make targets** that may come in handy:

`make clean` deletes any preprocessed source files (.tx), rgbds object files and pokecrystal.gbc, in case something goes wrong.

`make pngs` decompresses any **lz** files in gfx/ and then exports any graphics files to **png**.

`make lzs` does the reverse. This is already part of the build process, so **modified pngs will automatically be converted to 2bpp and lz-compressed** without any additional work.
