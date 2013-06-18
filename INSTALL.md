# Getting Started

Compiling **pokecrystal.gbc** requires a certain **Pokemon Crystal** rom:

```
Pokemon - Crystal Version (UE) (V1.0) [C][!].gbc
md5: 9f2922b235a5eeb78d65594e82ef5dde
```

Save it as **baserom.gbc** in the repository.


Feel free to ask us on **[nucleus.kafuka.org #skeetendo](http://chat.mibbit.com/?server=nucleus.kafuka.org&channel=#skeetendo)** if something goes wrong!

# Windows

If you are on Windows and can't install Linux, **Cygwin** is a great alternative.

## Installing Cygwin

Cygwin provides a virtual Linux environment on Windows systems. Just get **setup.exe**.

**http://cygwin.com/install.html**

During the install:

* Keep the defaults.

* Most mirrors are molasses. Use **http://mirrors.kernel.org**.


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

We need a couple more things.

```bash
apt-cyg install python make git wget
```

**rgbds** will let you compile Game Boy roms.

```bash
# download rgbds binaries
wget http://diyhpl.us/~bryan/irc/pokered/rgbds/rgbds.zip
unzip rgbds.zip
rm rgbds.zip

# make rgbds accessible for all time
export PATH=$PATH:`pwd`/rgbds
echo "export PATH=$PATH" >> ~/.bashrc
```

Set up the **pokecrystal** repository:

```bash
cd ~
git clone https://github.com/kanzure/pokecrystal
cd pokecrystal

# install python requirements
pip install -r requirements.txt

# use hexdump to diff binary files
git config diff.hex.textconv hexdump

# download the base rom
```

Now you should be able to build **pokecrystal.gbc** for the first time.
```
make clean && make
```

This ought to take between **3 and 15 seconds**, depending on your computer.

If you see `cmp baserom.gbc pokecrystal.gbc` as the last line, the build was successful! Rejoice!


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

# install python requirements
pip install -r requirements.txt

# use hexdump to diff binary files
git config diff.hex.textconv hexdump
```

To compile the rom from asm source:
```
make clean && make
```

That will take between 3 and 15 seconds, depending on your computer. If you see `cmp baserom.gbc pokecrystal.gbc` as the last line, the build was successful! Rejoice!


# Now what?

* **Can't find something?** Contribute!

* **Do your own thing!** The asm source is hack-friendly, and the supplementary scripts in extras/ can be used for other projects.

* We'll be happy to answer any **questions** at **[nucleus.kafuka.org #skeetendo](http://chat.mibbit.com/?server=nucleus.kafuka.org&channel=#skeetendo)**

