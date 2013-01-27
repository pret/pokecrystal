# -*- coding: utf-8 -*-
"""
Various functions related to pointer and address math. Mostly to avoid
depedency loops.
"""

def calculate_bank(address):
    """you are too lazy to divide on your own?"""
    if type(address) == str:
        address = int(address, 16)
    #if 0x4000 <= address <= 0x7FFF:
    #    raise Exception, "bank 1 does not exist"
    return int(address) / 0x4000

def calculate_pointer(short_pointer, bank=None):
    """calculates the full address given a 4-byte pointer and bank byte"""
    short_pointer = int(short_pointer)
    if 0x4000 <= short_pointer <= 0x7fff:
        short_pointer -= 0x4000
        bank = int(bank)
    else:
        bank = 0
    pointer = short_pointer + (bank * 0x4000)
    return pointer

