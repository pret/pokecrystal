#!/usr/bin/env python3

from sys import stderr, exit
from os import walk
from os.path import join
from struct import unpack, calcsize
from enum import Enum

class symtype(Enum):
    LOCAL = 0
    IMPORT = 1
    EXPORT = 2

def unpack_file(fmt, f):
    size = calcsize(fmt)
    return unpack(fmt, f.read(size))

def read_string(f):
    buf = bytearray()
    while True:
        b = f.read(1)
        if b is None or b == b'\0':
            return buf.decode()
        else:
            buf += b


# Fix broken pipe when using `head`
from signal import signal, SIGPIPE, SIG_DFL
signal(SIGPIPE,SIG_DFL)

import argparse
parser = argparse.ArgumentParser(description="Parse the symfile to find unnamed symbols")
parser.add_argument('symfile', type=argparse.FileType('r'), help="the list of symbols")
parser.add_argument('-b', '--builddir', type=str, help="scan the output files to obtain a list of files with unnamed symbols")
args = parser.parse_args()

# Get list of object files
objects = []
if args.builddir:
    for root, dirs, files in walk(args.builddir):
        objects += [join(root, file) for file in files if file.endswith(".o")]
    if not objects:
        print("Error: Object files not found!", file=stderr)
        exit(1)

# Scan all unnamed symbols from the symfile
symbols_total = 0
symbols = set()
for line in args.symfile:
    line = line.split(";")[0].strip()
    split = line.split(" ")
    if len(split) < 2:
        continue

    symbols_total += 1

    symbol = " ".join(split[1:]).strip()
    if symbol[-3:].lower() == split[0][-3:].lower():
        symbols.add(symbol)

# If no object files were provided, just print what we know and exit
print("Unnamed symbols: %d (%.2f%% complete)" % (len(symbols),
        (symbols_total - len(symbols)) / symbols_total * 100))
if not objects:
    for sym in symbols:
        print(sym)
    exit()

# Count the amount of symbols in each file
files = {}
for objfile in objects:
    f = open(objfile, "rb")
    if unpack_file("4s", f)[0] != b'RGB6':
        print("Error: File '%s' is of an unknown format." % objfile, file=stderr)
        exit(1)

    num_symbols = unpack_file("<II", f)[0]
    for x in range(num_symbols):
        sym_name = read_string(f)
        sym_type = symtype(unpack_file("<B", f)[0])
        if sym_type == symtype.IMPORT:
            continue
        sym_filename = read_string(f)
        unpack_file("<III", f)
        if sym_name not in symbols:
            continue

        if sym_filename not in files:
            files[sym_filename] = 0
        files[sym_filename] += 1
    f.close()

# Sort the files, the one with the most amount of symbols first
files = sorted([(fname, files[fname]) for fname in files], key=lambda x: x[1], reverse=True)
for f in files:
    fname = f[0]
    while fname.startswith("../"):
        fname = fname[3:]
    print("%s: %d" % (fname, f[1]))
