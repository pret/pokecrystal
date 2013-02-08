# Pokémon Crystal

This is a hand-crafted disassembly of Pokémon Crystal.

The source code in this project successfully converts back into a ROM image. All source code is meticulously commented.

## Base ROM

The following ROM is required for compiling:

Pokemon - Crystal Version (UE) (V1.0) [C][!].gbc

md5: 9f2922b235a5eeb78d65594e82ef5dde

Eventually this will not be necessary.

## Installing

Simple.

``` bash
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
git clone https://github.com/kanzure/pokecrystal.git
cd pokecrystal

pip install -r requirements.txt

make clean && make
```

Also, there are [Windows installation instructions](https://github.com/kanzure/pokecrystal/blob/master/INSTALL.md).

## Assembling

* To assemble, first install RGBDS and put it in your path. The version of RGBDS needed is [rgbds-linux](https://github.com/bentley/rgbds/).

* Next, copy the Pokémon ROM to this directory as "baserom.gbc".

* Then run "make" in your shell.

* This will output a file named "pokecrystal.gbc".

## See also

* disassembly of [Pokémon Red](http://bitbucket.org/iimarckus/pokered).

## Contributing

* Hang out with us on IRC, nucleus.kafuka.org #skeetendo ([or use mibbit](http://chat.mibbit.com/?server=nucleus.kafuka.org&channel=#skeetendo))

* Tackle some [issues](https://github.com/kanzure/pokecrystal/issues)!
