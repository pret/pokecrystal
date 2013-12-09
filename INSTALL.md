# Getting Started

Assembling **pokecrystal.gbc** requires a certain **Pokémon Crystal** rom:

	Pokemon - Crystal Version (UE) (V1.0) [C][!].gbc
	md5: 9f2922b235a5eeb78d65594e82ef5dde


# Linux

Linux dependencies. OSX users already have these after installing Xcode.

	sudo apt-get install make gcc bison git python python-setuptools


Set up the **pokecrystal** repository:

	git clone git://github.com/kanzure/pokecrystal.git
	cd pokecrystal

	./init.sh

Copy the Pokémon Crystal rom to this directory. Name it **baserom.gbc**.

Now you should be able to build **pokecrystal.gbc** for the first time.

	make

Your first build may take about a minute. Subsequent builds are much faster (5-20 seconds).


# OSX

Download and install **Xcode**. Then follow the Linux instructions.


# Windows

Not yet.

