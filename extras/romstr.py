# -*- coding: utf-8 -*-

import sys
import os
import time
import datetime
import json
from ctypes import c_int8
from copy import copy

from labels import (
    get_label_from_line,
    get_address_from_line_comment,
)

relative_jumps = [0x38, 0x30, 0x20, 0x28, 0x18, 0xc3, 0xda, 0xc2, 0x32]
relative_unconditional_jumps = [0xc3, 0x18]
call_commands = [0xdc, 0xd4, 0xc4, 0xcc, 0xcd]
end_08_scripts_with = [
    0xe9, # jp hl
    0xc9, # ret
] # possibly also:
    # 0xc3,  # jp
    # 0xc18, # jr
    # 0xda, 0xe9, 0xd2, 0xc2, 0xca, 0x38, 0x30, 0x20, 0x28, 0x18, 0xd8,
    # 0xd0, 0xc0, 0xc8, 0xc9

spacing = "\t"

class RomStr(str):
    """ Simple wrapper to prevent a giant rom from being shown on screen.
    """

    def __init__(self, *args, **kwargs):
        if "labels" in kwargs.keys() and kwargs["labels"] == True:
            self.load_labels()
        str.__init__(self)

    def __repr__(self):
        """ Simplifies this object so that the output doesn't overflow stdout.
        """
        return "RomStr(too long)"

    @classmethod
    def load(cls, crystal=True, red=False):
        """ Loads a ROM into a RomStr.
        """
        if   crystal and not red:
            file_handler = open("../baserom.gbc", "r")
        elif red and not crystal:
            file_handler = open("../pokered-baserom.gbc", "r")
        else:
            raise Exception, "not sure which rom to load?"
        bytes = file_handler.read()
        file_handler.close()
        return RomStr(bytes)

    def load_labels(self, filename="labels.json"):
        """ Loads labels from labels.json, or parses the source code file and
            generates new labels.
        """
        filename = os.path.join(os.path.dirname(__file__), filename)

        # blank out the hash
        self.labels = {}

        # check if the labels file exists
        file_existence = os.path.exists(filename)

        generate_labels = False

        # determine if the labels file needs to be regenerated
        if file_existence:
            modified = os.path.getmtime(filename)
            modified = datetime.datetime.fromtimestamp(modified)
            current  = datetime.datetime.fromtimestamp(time.time())

            is_old = (current - modified) > datetime.timedelta(days=3)

            if is_old:
                generate_labels = True
        else:
            generate_labels = True

        # scan the asm source code for labels
        if generate_labels:
            asm = open(os.path.join(os.path.dirname(__file__), "../main.asm"), "r").read().split("\n")

            for line in asm:
                label = get_label_from_line(line)

                if label:
                    address = get_address_from_line_comment(line)

                    self.labels[address] = label

            content = json.dumps(self.labels)
            file_handler = open(filename, "w")
            file_handler.write(content)
            file_handler.close()

        # load the labels from the file
        self.labels = json.loads(open(filename, "r").read())

    def get_address_for(self, label):
        """ Returns the address of a label. This is slow and could be improved
        dramatically.
        """
        label = str(label)
        for address in self.labels.keys():
            if self.labels[address] == label:
                return address
        return None

    def length(self):
        """ len(self)
        """
        return len(self)

    def len(self):
        """ len(self)
        """
        return self.length()

    def interval(self, offset, length, strings=True, debug=True):
        """ returns hex values for the rom starting at offset until
            offset+length
        """
        returnable = []
        for byte in self[offset:offset+length]:
            if strings:
                returnable.append(hex(ord(byte)))
            else:
                returnable.append(ord(byte))
        return returnable

    def until(self, offset, byte, strings=True, debug=False):
        """ Returns hex values from rom starting at offset until the given
            byte.
        """
        return self.interval(offset, self.find(chr(byte), offset) - offset, strings=strings)

    def to_asm(self, address, end_address=None, size=None, max_size=0x4000, debug=None):
        """ Disassembles ASM at some address. This will stop disassembling when
            either the end_address or size is met. Also, there's a maximum size
            that will be parsed, so that large patches of data aren't parsed as
            code.
        """
        if type(address) in [str, unicode] and "0x" in address:
            address = int(address, 16)

        start_address = address

        if start_address == None:
            raise Exception, "address must be given"

        if debug == None:
            if not hasattr(self, "debug"):
                debug = False
            else:
                debug = self.debug

        # this is probably a terrible idea.. why am i doing this?
        if size != None and max_size < size:
            raise Exception, "max_size must be greater than or equal to size"
        elif end_address != None and (end_address - start_address) > max_size:
            raise Exception, "end_address is out of bounds"
        elif end_address != None and size != None:
            if (end_address - start_address) >= size:
                size = end_address - start_address
            else:
                end_address = start_address + size
        elif end_address == None and size != None:
            end_address = start_address + size
        elif end_address != None and size == None:
            size = end_address - start_address

        raise NotImplementedError("DisAsm was removed and never worked; hook up another disassembler please.")
        #return DisAsm(start_address=start_address, end_address=end_address, size=size, max_size=max_size, debug=debug, rom=self)

class AsmList(list):
    """ Simple wrapper to prevent all asm lines from being shown on screen.
    """

    def length(self):
        """ len(self)
        """
        return len(self)

    def __repr__(self):
        """ Simplifies this object so that the output doesn't overflow stdout.
        """
        return "AsmList(too long)"

if __name__ == "__main__":
    cryrom = RomStr(open("../pokecrystal.gbc", "r").read());
    asm = cryrom.to_asm(sys.argv[1])
    print asm
