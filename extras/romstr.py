class RomStr(str):
    """ Simple wrapper to prevent a giant rom from being shown on screen
    """

    def length(self):
        """len(self)"""
        return len(self)

    def __repr__(self):
        return "RomStr(too long)"

    def interval(self, offset, length, strings=True, debug=True):
        """returns hex values for the rom starting at offset until offset+length"""
        returnable = [] 
        for byte in self[offset:offset+length]:
            if strings:
                returnable.append(hex(ord(byte)))
            else:
                returnable.append(ord(byte))
        return returnable

    def until(self, offset, byte, strings=True, debug=False):
        """returns hex values from rom starting at offset until the given byte"""
        return self.interval(offset, self.find(chr(byte), offset) - offset, strings=strings)

class AsmList(list):
    """simple wrapper to prevent all asm lines from being shown on screen"""

    def length(self):
        """len(self)"""
        return len(self)

    def __repr__(self):
        return "AsmList(too long)"

