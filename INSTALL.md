# Linux

Note that this requires python2.7 for the moment.

```bash
sudo apt-get install make gcc bison git python python-pip
pip install pypng

git clone git://github.com/bentley/rgbds.git
cd rgbds
sudo make install
cd ..

git clone --recursive git://github.com/kanzure/pokecrystal.git
cd pokecrystal
```

To build **pokecrystal.gbc**:

```bash
make
```


# OS X

Xcode provides most of the tools needed to build.

On 10.8 or earlier, download and install **Command Line Tools for Xcode**.

On 10.9 or later, run `xcode-select --install` in the terminal.

In **Terminal**, run:

```bash
lynx -source bootstrap.pypa.io/get-pip.py | python
pip install pypng

git clone git://github.com/bentley/rgbds.git
cd rgbds
sudo make install
cd ..

git clone --recursive git://github.com/kanzure/pokecrystal.git
cd pokecrystal
```

To build **pokecrystal.gbc**:

```bash
make
```


# Windows

To build on Windows, use [**Cygwin**](http://cygwin.com/install.html). Use the default settings.

Then get the most recent version of [**rgbds**](https://github.com/bentley/rgbds/releases/).
Extract the archive and put `rgbasm.exe`, `rgblink.exe` and `rgbfix.exe` in `C:\cygwin\usr\local\bin`.

In the **Cygwin terminal**:

```bash
install $(lynx -source rawgit.com/transcode-open/apt-cyg/master/apt-cyg) /bin
apt-cyg install make git python gcc-core libsasl2-3 ca-certificates

lynx -source bootstrap.pypa.io/get-pip.py | python
pip install pypng

git clone --recursive git://github.com/kanzure/pokecrystal.git
cd pokecrystal
```

To build **pokecrystal.gbc**:

```bash
make
```


# Vagrant

The simplest way to get pokecrystal to compile is to use Vagrant and
VirtualBox. Follow these steps:

* [Download and install Vagrant](http://www.vagrantup.com/downloads.html)
* Follow the instructions to [download and install VirtualBox](http://docs-v1.vagrantup.com/v1/docs/getting-started/)
* Run these commands:

```bash
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

```bash
cd /vagrant/pokecrystal
make
```
