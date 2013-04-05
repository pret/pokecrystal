# Getting Started

Compiling requires a certain Pokemon Crystal ROM:

```
Pokemon - Crystal Version (UE) (V1.0) [C][!].gbc
md5: 9f2922b235a5eeb78d65594e82ef5dde
```

Save it as `baserom.gbc` in the repository.


Feel free to ask us on nucleus.kafuka.org #skeetendo if something goes wrong (remember to tell where)!

Don't know how to use IRC? Try [mibbit](http://chat.mibbit.com/?server=nucleus.kafuka.org&channel=#skeetendo).


## Linux

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
```

To compile the ROM from ASM source:
```
make clean && make
```

That will take between 3 and 15 seconds, depending on your computer. If you see
`cmp baserom.gbc pokecrystal.gbc` as the last line, the build was successful! Rejoice!


## Windows

Set up [GitHub for Windows](http://windows.github.com/) and clone this repository.

If you haven't already, get [Python 2.7](http://www.python.org/ftp/python/2.7.3/python-2.7.3.msi) ([64-bit](http://www.python.org/ftp/python/2.7.3/python-2.7.3.amd64.msi)).

Extract the following files from the [RGBDS](https://github.com/downloads/bentley/rgbds/rgbds-0.0.1.zip) package into the repository:
`rgbasm.exe`
`rgbds.exe`
`rgbfix.exe`
`rgblink.exe`

Install [make](http://gnuwin32.sourceforge.net/downlinks/make.php) for Windows.

To compile the ROM from ASM source, run `pokecrystal.bat`.

That will take between 3 and 15 seconds, depending on your computer. If you see
`FC: no differences encountered`, the build was successful! Rejoice!

Now you may try messing around with `main.asm`, or just do whatever you wanted to.


# Contributions are welcome!

