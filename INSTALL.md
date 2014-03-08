# Linux

Dependencies:

	sudo apt-get install make gcc bison git python python-setuptools
	sudo easy_install pip

The assembler used is [**rgbds**](https://github.com/bentley/rgbds).

	git clone git://github.com/bentley/rgbds.git
	cd rgbds
	sudo mkdir -p /usr/local/man/man{1,7}
	sudo make install
	cd ..

Set up the repository.

	git clone git://github.com/kanzure/pokecrystal.git
	cd pokecrystal
	git submodule init
	git submodule update
	sudo pip install -r extras/requirements.txt

- Copy your Pokémon Crystal rom to the directory. Name it **baserom.gbc**.

To build **pokecrystal.gbc**:

	make

This should take about 30 seconds.
Subsequent builds are much faster (2-10 seconds).


# OS X

Download and install **Command Line Tools for Xcode**.
Then follow the Linux instructions.

If you have Xcode already, you can get Command Line Tools with:

	xcode-select --install


# Windows

It's recommended that you use a virtual machine running Linux or OS X.

If you insist on Windows, use [**Cygwin**](http://cygwin.com/install.html) (32-bit).

Dependencies are downloaded in the installer rather than the command line.
Select the following packages:
* make
* git
* python
* python-setuptools
* libsasl2
* ca-certificates

To install rgbds, extract the contents of
**http://iimarck.us/etc/rgbds.zip**
and put them in `C:\cygwin\usr\local\bin`.

Then set up the repository. In the **Cygwin terminal**:

	git clone git://github.com/kanzure/pokecrystal.git
	cd pokecrystal
	git submodule init
	git submodule update
	sudo easy_install pip
	sudo pip install -r extras/requirements.txt

- Copy your Pokémon Crystal rom to the directory. Name it **baserom.gbc**.

To build:

	make

