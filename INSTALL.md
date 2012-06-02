# Linux

```bash
sudo apt-get install make gcc bison git python python-setuptools 

# unittest2 is required if using python2.6
sudo easy_install unittest2

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

make clean; make
```

# Windows

Follow these instructions to install `pokecrystal` on Microsoft Windows. Once
installed, you can run `make` to compile `main.asm` into a ROM.

## Installing cygwin

Cygwin provides a virtual linux environment on Windows systems. Just get
`setup.exe`: http://cygwin.com/install.html

During the install:

  1. Keep the defaults.

  2. It shouldn't matter which mirror you choose, but http://mirrors.kernel.org
  seems to work.

  3. Select the packages listed below.

You'll be presented with a package selection screen. Select the following
packages (hint: there's a search box).

  1. `python` (installed by default)

  2. `gcc` and `gcc-core` (under devel)

  3. `byacc` (under devel)

  4. `make` (under devel)

  5. `wget` (under web)

  6. `git` (under devel)

  7. `mercurial` (optional, if you wish to work with pokered as well)

Let cygwin finish the install.  Might take a sec while all packages are
downloading.

## Installing other requirements

Launch cygwin (bash). Maybe you know your way around the linux terminal. If not, a
crash course:

```bash
# list files in current directory
ls

# show current directory
pwd

# change directory
cd /away/we/go
```

The next step is building `rgbds`, the GB assembler. Type:

```bash
# download rgbds source code
git clone git://github.com/bentley/rgbds.git

# compile rgbds
cd rgbds
YACC=byacc make

# make rgbds accessible for all time
export PATH=$PATH:`pwd`
echo "export PATH=$PATH:`pwd`" >> ~/.bashrc

# check if rgbasm is installed now
which rgbasm
```

If that fails (it shouldn't), you can download binaries like so:

```bash
# download rgbds binaries
wget http://diyhpl.us/~bryan/irc/pokered/rgbds/rgbds.zip --output-document=rgbds.zip

# unzip
unzip rgbds.zip

# make rgbds accessible for all time
export PATH=$PATH:`pwd`/rgbds
echo "export PATH=$PATH:`pwd/rgbds`" >> ~/.bashrc

# clean up that zip file
rm rgbds.zip
```

The next step is to install `unittest2`, unless you installed python2.7
earlier:

```bash
cd ~
wget http://peak.telecommunity.com/dist/ez_setup.py
sudo python ez_setup.py
easy_install unittest2
```

Now you should be able to build `pokecrystal` for the first time:

```bash
cd ~
git clone https://github.com/kanzure/pokecrystal.git
cd pokecrystal
```

The final requirement is downloading a certain Pokemon Crystal ROM:

```
Pokemon - Crystal Version (UE) (V1.0) [C][!].gbc
md5: 9f2922b235a5eeb78d65594e82ef5dde
```

Save it as `C:\cygwin\home\(your username)\pokecrystal\baserom.gbc`. You can
check the md5 of a file by typing `md5sum baserom.gbc`.

To compile the ROM from ASM source, type:

```bash
make
```

That will take between 3 and 15 seconds, depending on your computer. If you see
`cmp baserom.gbc pokecrystal.gbc` as the last line, the build was successful!
Rejoice!

Now you may try messing around with `main.asm`, or just do whatever you wanted
to.

To build again, you should use the following command:

```bash
make clean; make
```

Feel free to ask us on nucleus.kafuka.org #skeetendo if something goes wrong
(remember to tell where)! Don't know how to use IRC? Try
[mibbit](http://mibbit.com/) or something.

# Contributing changes

## Setting up a public git repo

For those uninitiated with git-based collaboration, and who do not want to setup a server to host git repositories, use GitHub. Register on GitHub and follow [this tutorial to setup ssh keys](https://help.github.com/articles/generating-ssh-keys). Then go to [the pokecrystal repo](https://github.com/kanzure/pokecrystal) and click the giant "fork" button. This will bring you to a page with some instructions regarding `git remote` (follow these steps in your pokecrystal folder).
