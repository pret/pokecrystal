""" Various functions related to pointer and address math. Mostly to avoid
    depedency loops.
"""

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

