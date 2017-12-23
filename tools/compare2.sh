#!/bin/sh
# Compares baserom.gbc and pokecrystal.gbc

# create baserom.txt if necessary
crystal_md5=9f2922b235a5eeb78d65594e82ef5dde
if [ ! -f baserom.gbc ]; then
    echo "FATAL: Baserom not found"
    exit 1
fi

if [ $1 ]; then
	if [ $1 == "-v" ]; then
		verbose=1
	else
		verbose = 0
	fi
else
	verbose=0
fi

base_md5=`md5sum baserom.gbc | cut -d' ' -f1`
if [ $verbose == 1 ]; then
	echo "baserom.gbc:     $base_md5"
fi
if [ $base_md5 != $crystal_md5 ]; then
    echo "FATAL: Baserom is incorrect"
    exit 1
fi

built_md5=`md5sum pokecrystal.gbc | cut -d' ' -f1`
if [ $verbose == 1 ]; then
	echo "pokecrystal.gbc: $built_md5"
fi
if [ $built_md5 != $crystal_md5 ]
then
	if [ $verbose == 1 ]; then
		echo "Checksums do not match, here's where the ROMs differ..."
	fi
    if [ ! -f baserom.txt ]; then
        hexdump -C baserom.gbc > baserom.txt
    fi

    hexdump -C pokecrystal.gbc > pokecrystal.txt

    diff -u baserom.txt pokecrystal.txt | less
else
	if [ $verbose == 1 ]; then
		echo "Checksums match! :D"
	fi
fi

