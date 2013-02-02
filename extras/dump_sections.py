#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Use this tool to dump an asm file for a new source code or disassembly project.

usage:

    from dump_sections import dump_sections

    output = dump_sections("../../butt.gbc")

    file_handler = open("main.asm", "w")
    file_handler.write(output)
    file_handler.close()

You can also use this script from the shell, where it will look for
"baserom.gbc" in the current working path or whatever file path you pass in the
first positional argument.
"""

import os
import sys
import argparse

def upper_hex(input):
    """
    Converts the input to an uppercase hex string.
    """
    if input in [0, "0"]:
        return "0"
    elif input <= 0xF:
        return ("%.x" % (input)).upper()
    else:
        return ("%.2x" % (input)).upper()

def format_bank_number(address, bank_size=0x4000):
    """
    Returns a str of the hex number of the bank based on the address.
    """
    return upper_hex(address / bank_size)

def calculate_bank_quantity(path, bank_size=0x4000):
    """
    Returns the number of 0x4000 banks in the file at path.
    """
    return float(os.lstat(path).st_size) / bank_size

def dump_section(bank_number, separator="\n\n"):
    """
    Returns a str of a section header for the asm file.
    """
    output = "SECTION \""
    if bank_number in [0, "0"]:
        output += "bank0\",HOME"
    else:
        output += "bank"
        output += bank_number
        output += "\",DATA,BANK[$"
        output += bank_number
        output += "]"
    output += separator
    return output

def dump_incbin_for_section(address, bank_size=0x4000, baserom="baserom.gbc", separator="\n\n"):
    """
    Returns a str for an INCBIN line for an entire section.
    """
    output = "INCBIN \""
    output += baserom
    output += "\",$"
    output += upper_hex(address)
    output += ",$"
    output += upper_hex(bank_size)
    output += separator
    return output

def dump_sections(path, bank_size=0x4000, initial_bank=0, last_bank=None, separator="\n\n"):
    """
    Returns a str of assembly source code. The source code delineates each
    SECTION and includes bytes from the file specified by baserom.
    """
    if not last_bank:
        last_bank = calculate_bank_quantity(path, bank_size=bank_size)

    if last_bank < initial_bank:
        raise Exception("last_bank must be greater than or equal to initial_bank")

    baserom_name = os.path.basename(path)

    output = ""

    banks = range(initial_bank, last_bank)

    for bank_number in banks:
        address = bank_number * bank_size

        # get a formatted hex number of the bank based on the address
        formatted_bank_number = format_bank_number(address, bank_size=bank_size)

        # SECTION
        output += dump_section(formatted_bank_number, separator=separator)

        # INCBIN a range of bytes from the ROM
        output += dump_incbin_for_section(address, bank_size=bank_size, baserom=baserom_name, separator=separator)

    # clean up newlines at the end of the output
    if output[-2:] == "\n\n":
        output = output[:-2]
        output += "\n"

    return output

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("rompath", nargs="?", metavar="rompath", type=str)
    args = parser.parse_args()

    # default to "baserom.gbc" in the current working directory
    baserom = "baserom.gbc"

    # but let the user override the default
    if args.rompath:
        baserom = args.rompath

    # generate some asm
    output = dump_sections(baserom)

    # dump everything to stdout
    sys.stdout.write(output)

