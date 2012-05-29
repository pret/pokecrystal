#!/usr/bin/python
# -*- coding: utf-8 -*-
# author: Bryan Bishop <kanzure@gmail.com>
# date: 2012-05-29
# purpose: find shared functions between red/crystal

from crystal import get_label_from_line,           \
                    get_address_from_line_comment, \
                    AsmSection

from romstr import RomStr, AsmList

def load_rom(path):
    """ Loads a ROM file into an abbreviated RomStr object.
    """

    fh = open(path, "r")
    x  = RomStr(fh.read())
    fh.close()

    return x

def load_asm(path):
    """ Loads source ASM into an abbreviated AsmList object.
    """

    fh = open(path, "r")
    x = AsmList(fh.read().split("\n"))
    fh.close()

    return x

def findall_iter(sub, string):
    # url: http://stackoverflow.com/a/3874760/687783

    def next_index(length):
        index = 0 - length
        while True:
            index = string.find(sub, index + length)
            yield index

    return iter(next_index(len(sub)).next, -1)

class Address(int):
    """ A simple int wrapper to take 0xFFFF and $FFFF addresses.
    """

    def __new__(cls, x=None, *args, **kwargs):
        if type(x) == str:
            if "$" in x:
                x = x.replace("$", "0x")

            if "0x" in str:
                instance = int.__new__(cls, int(x, base=16), *args, **kwargs)
            else:
                msg = "Address.__new__ doesn't know how to parse this string"
                raise Exception, msg
        else:
            instance = int.__new__(cls, x, *args, **kwargs)

        return instance

found_blobs = []

class BinaryBlob(object):
    """ Stores a label, line number, and addresses of a function from Pokémon
    Red. These details can be used to determine whether or not the function was
    copied into Pokémon Crystal.
    """

    start_address = None
    end_address   = None
    label         = None
    line_number   = None
    bytes         = None
    bank          = None
    debug         = False
    locations     = None

    def __init__(self, start_address=None, end_address=None, label=None, \
                 debug=None, line_number=None):
        if not isinstance(start_address, Address):
            start_address = Address(start_address)
        if not isinstance(end_address, Address):
            end_address   = Address(end_address)

        assert label != None,          "label can't be none"
        assert isinstance(label, str), "label must be a string"
        assert line_number != None,    "line_number must be provided"

        self.start_address = start_address
        self.end_address   = end_address
        self.label         = label
        self.line_number   = line_number
        self.bytes         = []
        self.locations     = []
        self.bank          = start_address / 0x4000

        if debug != None:
            self.debug = debug

        self.parse_from_red()
        self.find_in_crystal()

    def __repr__(self):
        """ A beautiful poem.
        """

        r = "BinaryBlob("
        r += "label=\""+self.label+"\", "
        r += "start_address="+hex(self.start_address)+", "
        r += "size="+str(self.end_address - self.start_address)+", "
        r += "located="+str(len(self.locations) > 0)
        r += ")"

        return r

    def __str__(self):
        return self.__repr__()

    def parse_from_red(self):
        """ Reads bytes from Pokémon Red and stores them.
        """

        self.bytes = redrom[self.start_address : self.end_address + 1]

    def pretty_bytes(self):
        """ Returns a better looking range of bytes.
        """

        bytes = redrom.interval(self.start_address,    \
                self.end_address - self.start_address, \
                strings=False, debug=True)

        return bytes

    def find_in_crystal(self):
        """ Checks whether or not the bytes appear in Pokémon Crystal.
        """

        finditer       = findall_iter(self.bytes, cryrom)
        self.locations = [match for match in finditer]

        if len(self.locations) > 0:
            found_blobs.append(self)

            if self.debug:
                print self.label + ": found " + str(len(self.locations)) + " matches."

pokecrystal_rom_path = "../baserom.gbc"
pokecrystal_src_path = "../main.asm"
pokered_rom_path     = "../pokered-baserom.gbc"
pokered_src_path     = "../pokered-main.asm"

cryrom           = load_rom(pokecrystal_rom_path)
crysrc           = load_asm(pokecrystal_src_path)
redrom           = load_rom(pokered_rom_path)
redsrc           = load_asm(pokered_src_path)

def scan_red_asm(bank_stop=3, debug=True):
    """ Scans the ASM from Pokémon Red. Finds labels and objects. Does things.

    Uses get_label_from_line and get_address_from_line_comment.
    """

    # whether or not to show the lines from redsrc
    show_lines            = False

    line_number           = 0
    current_bank          = 0

    current_label         = None
    latest_label          = None
    current_start_address = None
    latest_start_address  = None
    latest_line           = ""

    for line in redsrc:
        if debug and show_lines:
            print "processing a line from red: " + line

        if line[0:7] == "SECTION":
            thing        = AsmSection(line)
            current_bank = thing.bank_id

            if debug:
                print "scan_red_asm: switching to bank " + str(current_bank)

        elif line[0:6] != "INCBIN":
            if ":" in line:
                current_label         = get_label_from_line(line)
                current_start_address = get_address_from_line_comment(line, \
                                        bank=current_bank)

                if current_label != None and current_start_address != None and \
                   current_start_address != 0 and current_start_address != latest_start_address:
                    if latest_label != None:
                        if latest_label not in ["Char52", "PokeCenterSignText", "DefaultNamesPlayer", "Unnamed_6a12"]:
                            blob = BinaryBlob(label=latest_label,      \
                                   start_address=latest_start_address, \
                                   end_address=current_start_address,  \
                                   line_number=line_number)

                            if debug:
                                print "Created a new blob: " + str(blob) + " from line: " + str(latest_line)

                    latest_label          = current_label
                    latest_start_address  = current_start_address
                    latest_line           = line

        line_number += 1

        if current_bank == bank_stop:
            if debug:
                print "scan_red_asm: stopping because current_bank >= " + \
                      str(bank_stop) + " (bank_stop)"

            break

scan_red_asm()

print "================================"

for blob in found_blobs:
    print blob

print "Found " + str(len(found_blobs)) + " possibly copied functions."

