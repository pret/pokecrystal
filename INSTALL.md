# Getting Started

Compiling **pokecrystal.gbc** requires a certain **Pokemon Crystal** rom:

```
Pokemon - Crystal Version (UE) (V1.0) [C][!].gbc
md5: 9f2922b235a5eeb78d65594e82ef5dde
```

Save it as **baserom.gbc** in the repository.


Feel free to ask us on **[nucleus.kafuka.org #skeetendo](https://kiwiirc.com/client/irc.nolimitzone.com/?#skeetendo)** if something goes wrong!

# Windows

If you are on Windows and can't install Linux, **Cygwin** is a great alternative.

## Installing Cygwin

Cygwin provides a virtual Linux environment on Windows systems. Just get **setup.exe**.

**http://cygwin.com/install.html**

During the install:

* Keep the defaults.

* Most mirrors are molasses. Use **http://mirrors.kernel.org**.

* From the package selection, select **wget**.


## Using Cygwin

Launch the **Cygwin terminal**. Maybe you know your way around the Linux terminal, **bash**. If not, a crash course:
```bash
# list files in current directory
ls

# show current directory
pwd

# change directory
cd /away/we/go
```


## Getting up and running

We need a couple more things to be able to compile.


If you're feeling lazy, just paste these commands into your terminal.


**apt-cyg** lets you install new packages without running Cygwin setup.

```bash
wget http://apt-cyg.googlecode.com/svn/trunk/apt-cyg
chmod +x apt-cyg
mv apt-cyg /usr/local/bin/
```

Now we can use apt-cyg to install everything else.

```bash
apt-cyg install make git python python-setuptools unzip
easy_install pip
```

**rgbds** will let you compile Game Boy roms.

```bash
wget http://diyhpl.us/~bryan/irc/pokered/rgbds/rgbds-0.0.1.zip
unzip rgbds-0.0.1.zip
mv rgbds-0.0.1/* /usr/local/bin
rm -r rgbds-0.0.1*
```

Set up the **pokecrystal** repository:

```bash
cd ~
git clone https://github.com/kanzure/pokecrystal
cd pokecrystal

# install python requirements
pip install -r requirements.txt
```

## Don't forget baserom.gbc!!

Make sure you downloaded a base rom. Name it **baserom.gbc**.

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

If you see `cmp baserom.gbc pokecrystal.gbc` as the last line, the build was successful!

Your first compile processes every source file at once. After that, **only modified source files have to be reprocessed**, so compiling again should be a few seconds faster.

# Linux

```bash
sudo apt-get install make gcc bison git python python-setuptools 

# unittest2 is required if using python2.6
sudo easy_install unittest2
sudo easy_install pip

# download rgbds source code
git clone git://github.com/bentley/rgbds.git

# compile rgbds
cd rgbds
make
sudo make install

# check if rgbasm is installed now
which rgbasm

# download pokecrystal
git clone git://github.com/kanzure/pokecrystal.git
cd pokecrystal

# grab extras/ which is required for compiling
git submodule init
git submodule update

# install python requirements
pip install -r requirements.txt

# use hexdump to diff binary files
git config diff.hex.textconv hexdump
```

To compile the rom from asm source:
```bash
make
```

That will take between 3 and 15 seconds, depending on your computer. If you see `cmp baserom.gbc pokecrystal.gbc` as the last line, the build was successful! Rejoice!


# Now what?

**main.asm** is a good starting point. The structure of the source is laid out here.

* **Can't find something?** Anyone can add to the source. There's lots to be uncovered.

* **Do your own thing!** The asm source is hack-friendly, and the supplementary scripts in extras/ can be used for other projects.

* We'll be happy to answer any **questions** on **[nucleus.kafuka.org #skeetendo](https://kiwiirc.com/client/irc.nolimitzone.com/?#skeetendo)**.

Other **make targets** that may come in handy:

`make clean` deletes any preprocessed source files (.tx), rgbds object files and pokecrystal.gbc, in case something goes wrong.

`make pngs` decompresses any **lz** files in gfx/ and then exports any graphics files to **png**.

`make lzs` does the reverse. This is already part of the build process, so **modified pngs will automatically be converted to 2bpp and lz-compressed** without any additional work.
