# Vagrant

The simplest way to get pokecrystal to compile is to use Vagrant and
VirtualBox. Follow these steps:

* [Download and install Vagrant](http://www.vagrantup.com/downloads.html)
* Follow the instructions to [download and install VirtualBox](http://docs-v1.vagrantup.com/v1/docs/getting-started/)
* Run these commands:

	vagrant box add pokecrystal http://diyhpl.us/~bryan/irc/pokecrystal/pokecrystal.box
	mkdir vagrantbox
	cd vagrantbox
	vagrant init pokecrystal
	vagrant up
	vagrant ssh -c "cd /vagrant && git clone git://github.com/kanzure/pokecrystal.git"
	vagrant ssh -c "cd /vagrant/pokecrystal && git submodule init && git submodule update"
	vagrant ssh

Running "vagrant ssh" will give you a shell to type commands into for compiling
the source code. The the "virtualbox" directory on the host appears as a shared
folder inside of the guest virtual machine at "/vagrant".

To build the project, run these commands in the guest (that is, inside "vagrant
ssh"):

	cd /vagrant/pokecrystal
	make

To make the build work you will need to copy baserom.gbc into the "pokecrystal"
directory inside the "virtualbox" directory on the host machine. Eventually
this will not be required.

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
* gcc
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
	easy_install pip
	pip install -r extras/requirements.txt

- Copy your Pokémon Crystal rom to the directory. Name it **baserom.gbc**.

To build:

	make

