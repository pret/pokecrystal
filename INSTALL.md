# Linux

Note that this requires python2.7 for the moment.

	sudo apt-get install make gcc bison git python python-setuptools

	git clone git://github.com/bentley/rgbds.git
	cd rgbds
	sudo make install
	cd ..

	git clone --recursive git://github.com/kanzure/pokecrystal.git
	cd pokecrystal

To build **pokecrystal.gbc**:

	make


# OS X

On 10.8 or earlier, download and install **Command Line Tools for Xcode**.

On 10.9 or later:

	xcode-select --install

In the shell, run:

	git clone git://github.com/bentley/rgbds.git
	cd rgbds
	sudo make install
	cd ..

	git clone --recursive git://github.com/kanzure/pokecrystal.git
	cd pokecrystal

To build **pokecrystal.gbc**:

	make


# Windows

To build on Windows, use [**Cygwin**](http://cygwin.com/install.html) (32-bit).

In the installer, select the following packages: `make` `git` `python` `python-setuptools` `gcc` `libsasl2` `ca-certificates`

Then get the most recent version of [**rgbds**](https://github.com/bentley/rgbds/releases/).
Put `rgbasm.exe`, `rgblink.exe` and `rgbfix.exe` in `C:\cygwin\usr\local\bin`.

In the **Cygwin terminal**:

	git clone --recursive git://github.com/kanzure/pokecrystal.git
	cd pokecrystal

To build:

	make


# Vagrant

The simplest way to get pokecrystal to compile is to use Vagrant and
VirtualBox. Follow these steps:

* [Download and install Vagrant](http://www.vagrantup.com/downloads.html)
* Follow the instructions to [download and install VirtualBox](http://docs-v1.vagrantup.com/v1/docs/getting-started/)
* Run these commands:

```
	vagrant box add pokecrystal http://diyhpl.us/~bryan/irc/pokecrystal/pokecrystal.box
	mkdir vagrantbox
	cd vagrantbox
	vagrant init pokecrystal
	vagrant up
	vagrant ssh -c "cd /vagrant && git clone --recursive git://github.com/kanzure/pokecrystal.git"
	vagrant ssh
```

Running "vagrant ssh" will give you a shell to type commands into for compiling
the source code. Then the "virtualbox" directory on the host appears as a shared
folder inside of the guest virtual machine at "/vagrant".

To build the project, run these commands in the guest (that is, inside "vagrant
ssh"):

	cd /vagrant/pokecrystal
	make
