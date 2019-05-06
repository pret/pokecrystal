#!/usr/bin/env python3

from sys import argv, exit, stderr
from subprocess import Popen, PIPE
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


import argparse
parser = argparse.ArgumentParser(description="Parse object files to get a list of global but unused symbols. Mainly used for Travis CI")
parser.add_argument('objects', type=str, nargs='*', help="the objects to parse")
parser.add_argument('-r', '--rootdir', type=str, help="use the Makefile to determine what objects to scan (NOTE: will rebuild objects as necessary)")
parser.add_argument('-i', '--ignore', action='append', help="Ignore unused globals of certain object files while still taking their references into account")
args = parser.parse_args()


# Get list of object files
objects = args.objects
if args.rootdir:
    for line in Popen(["make", "-C", args.rootdir, "-s", "-p"],
            stdout=PIPE).stdout.read().decode().split("\n"):
        if line.startswith("crystal_obj := "):
            objects = line[15:].strip().split()
            break
    else:
        print("Error: Object files not found!", file=stderr)
        exit(1)

if not objects:
    parser.print_usage(stderr)
    print("Error: No object files provided!", file=stderr)
    exit(2)


globalsyms = {}
for objfile in objects:
    f = open(objfile, "rb")
    if unpack_file("4s", f)[0] != b'RGB6':
        print("Error: File %s is of an unknown format." % objfile, file=stderr)
        exit(1)

    num_symbols = unpack_file("<II", f)[0]
    for x in range(num_symbols):
        sym_name = read_string(f)
        sym_type = symtype(unpack_file("<B", f)[0])

        # Skip unnecessary attributes
        if sym_type != symtype.IMPORT:
            read_string(f)
            unpack_file("<III", f)

        if sym_type == symtype.IMPORT:
            if sym_name not in globalsyms:
                globalsyms[sym_name] = 0
            globalsyms[sym_name] += 1
        elif sym_type == symtype.EXPORT:
            if (sym_name not in globalsyms and
                    (not args.ignore or objfile not in args.ignore)):
                globalsyms[sym_name] = 0
    f.close()

status = 0
for sym in globalsyms:
    if globalsyms[sym] == 0:
        status = 1
        print(sym)
exit(status)
