# -*- coding: utf-8 -*-

import sys
import os
import time
import datetime
import json
from ctypes import c_int8
from copy import copy

from gbz80disasm import opt_table

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
        if type(address) == str and "0x" in address:
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

        return DisAsm(start_address=start_address, end_address=end_address, size=size, max_size=max_size, debug=debug, rom=self)

class DisAsm:
    """ z80 disassembler
    """

    def __init__(self, start_address=None, end_address=None, size=None, max_size=0x4000, debug=True, rom=None):
        assert start_address != None, "start_address must be given"

        if rom == None:
            file_handler = open("../baserom.gbc", "r")
            bytes = file_handler.read()
            file_handler.close()
            rom = RomStr(bytes)

        if debug not in [None, True, False]:
            raise Exception, "debug param is invalid"
        if debug == None:
            debug = False

        # get end_address and size in sync with each other
        if end_address == None and size != None:
            end_address = start_address + size
        elif end_address != None and size == None:
            size = end_address - start_address
        elif end_address != None and size != None:
            size = max(end_address - start_address, size)
            end_address = start_address + size

        # check that the bounds make sense
        if end_address != None:
            if end_address <= start_address:
                raise Exception, "end_address is out of bounds"
            elif (end_address - start_address) > max_size:
                raise Exception, "end_address goes beyond max_size"

        # check more edge cases
        if not start_address >= 0:
            raise Exception, "start_address must be at least 0"
        elif end_address != None and not end_address >= 0:
            raise Exception, "end_address must be at least 0"

        self.rom           = rom
        self.start_address = start_address
        self.end_address   = end_address
        self.size          = size
        self.max_size      = max_size
        self.debug         = debug

        self.parse()

    def parse(self):
        """ Disassembles stuff and things.
        """

        rom           = self.rom
        start_address = self.start_address
        end_address   = self.end_address
        max_size      = self.max_size
        debug         = self.debug

        bank_id = start_address / 0x4000

        # [{"command": 0x20, "bytes": [0x20, 0x40, 0x50],
        # "asm": "jp $5040", "label": "Unknown5040"}]
        asm_commands = {}

        offset = start_address

        last_hl_address = None
        last_a_address  = None
        used_3d97       = False

        keep_reading    = True

        while (end_address != 0 and offset <= end_address) or keep_reading:
            # read the current opcode byte
            current_byte = ord(rom[offset])
            current_byte_number = len(asm_commands.keys())

            # setup this next/upcoming command
            if offset in asm_commands.keys():
                asm_command = asm_commands[offset]
            else:
                asm_command = {}

            asm_command["address"] = offset

            if not "references" in asm_command.keys():
                # This counts how many times relative jumps reference this
                # byte. This is used to determine whether or not to print out a
                # label later.
                asm_command["references"] = 0

            # some commands have two opcodes
            next_byte = ord(rom[offset+1])

            if self.debug:
                print "offset: \t\t" + hex(offset)
                print "current_byte: \t\t" + hex(current_byte)
                print "next_byte: \t\t" + hex(next_byte)

            # all two-byte opcodes also have their first byte in there somewhere
            if (current_byte in opt_table.keys()) or ((current_byte + (next_byte << 8)) in opt_table.keys()):
                # this might be a two-byte opcode
                possible_opcode = current_byte + (next_byte << 8)

                # check if this is a two-byte opcode
                if possible_opcode in opt_table.keys():
                    op_code = possible_opcode
                else:
                    op_code = current_byte

                op = opt_table[op_code]

                opstr = op[0].lower()
                optype = op[1]

                if self.debug:
                    print "opstr: " + opstr

                asm_command["type"] = "op"
                asm_command["id"] = op_code
                asm_command["format"] = opstr
                asm_command["opnumberthing"] = optype

                opstr2 = None
                base_opstr = copy(opstr)

                if "x" in opstr:
                    for x in range(0, opstr.count("x")):
                        insertion = ord(rom[offset + 1])

                        # Certain opcodes will have a local relative jump label
                        # here instead of a raw hex value, but this is
                        # controlled through asm output.
                        insertion = "$" + hex(insertion)[2:]

                        opstr = opstr[:opstr.find("x")].lower() + insertion + opstr[opstr.find("x")+1:].lower()

                        if op_code in relative_jumps:
                            target_address = offset + 2 + c_int8(ord(rom[offset + 1])).value
                            insertion = "asm_" + hex(target_address)

                            if str(target_address) in self.rom.labels.keys():
                                insertion = self.rom.labels[str(target_address)]

                            opstr2 = base_opstr[:base_opstr.find("x")].lower() + insertion + base_opstr[base_opstr.find("x")+1:].lower()
                            asm_command["formatted_with_labels"] = opstr2
                            asm_command["target_address"] = target_address

                        current_byte_number += 1
                        offset += 1

                if "?" in opstr:
                    for y in range(0, opstr.count("?")):
                        byte1 = ord(rom[offset + 1])
                        byte2 = ord(rom[offset + 2])

                        number = byte1
                        number += byte2 << 8;

                        # In most cases, you can use a label here. Labels will
                        # be shown during asm output.
                        insertion = "$%.4x" % (number)

                        opstr = opstr[:opstr.find("?")].lower() + insertion + opstr[opstr.find("?")+1:].lower()

                        # This version of the formatted string has labels. In
                        # the future, the actual labels should be parsed
                        # straight out of the "main.asm" file.
                        target_address = number % 0x4000
                        insertion = "asm_" + hex(target_address)

                        if str(target_address) in self.rom.labels.keys():
                            insertion = self.rom.labels[str(target_address)]

                        opstr2 = base_opstr[:base_opstr.find("?")].lower() + insertion + base_opstr[base_opstr.find("?")+1:].lower()
                        asm_command["formatted_with_labels"] = opstr2
                        asm_command["target_address"] = target_address

                        current_byte_number += 2
                        offset += 2

                # Check for relative jumps, construct the formatted asm line.
                # Also set the usage of labels.
                if current_byte in [0x18, 0x20] + relative_jumps: # jr or jr nz
                    # generate a label for the byte we're jumping to
                    target_address = offset + 1 + c_int8(ord(rom[offset])).value

                    if target_address in asm_commands.keys():
                        asm_commands[target_address]["references"] += 1
                        remote_label = "asm_" + hex(target_address)
                        asm_commands[target_address]["current_label"] = remote_label
                        asm_command["remote_label"] = remote_label

                        # Not sure how to set this, can't be True because an
                        # address referenced multiple times will use a label
                        # despite the label not necessarily being used in the
                        # output. The "use_remote_label" values should be
                        # calculated when rendering the asm output, based on
                        # which addresses and which op codes will be displayed
                        # (within the range).
                        asm_command["use_remote_label"] = "unknown"
                    else:
                        remote_label = "asm_" + hex(target_address)

                        # This remote address might not be part of this
                        # function.
                        asm_commands[target_address] = {
                            "references": 1,
                            "current_label": remote_label,
                            "address": target_address,
                        }
                        # Also, target_address can be negative (before the
                        # start_address that the user originally requested),
                        # and it shouldn't be shown on asm output because the
                        # intermediate bytes (between a negative target_address
                        # and start_address) won't be disassembled.

                        # Don't know yet if this remote address is part of this
                        # function or not. When the remote address is not part
                        # of this function, the label name should not be used,
                        # because that label will not be disassembled in the
                        # output, until the user asks it to.
                        asm_command["use_remote_label"] = "unknown"
                        asm_command["remote_label"] = remote_label
                elif current_byte == 0x3e:
                    last_a_address = ord(rom[offset + 1])

                # store the formatted string for the output later
                asm_command["formatted"] = opstr

                if current_byte == 0x21:
                    last_hl_address = byte1 + (byte2 << 8)

                # this is leftover from pokered, might be meaningless
                if current_byte == 0xcd:
                    if number == 0x3d97:
                        used_3d97 = True

                if current_byte == 0xc3 or current_byte in relative_unconditional_jumps:
                    if current_byte == 0xc3:
                        if number == 0x3d97:
                            used_3d97 = True

                # stop reading at a jump, relative jump or return
                if current_byte in end_08_scripts_with:
                    is_data = False

                    if not self.has_outstanding_labels(asm_commands, offset):
                        keep_reading = False
                        break
                    else:
                        keep_reading = True
                else:
                    keep_reading = True

            else:
                # This shouldn't really happen, and means that this area of the
                # ROM probably doesn't represent instructions.
                asm_command["type"] = "data" # db
                asm_command["value"] = current_byte
                keep_reading = False

            # save this new command in the list
            asm_commands[asm_command["address"]] = asm_command

            # jump forward by a byte
            offset += 1

        # also save the last command if necessary
        if len(asm_commands.keys()) > 0 and asm_commands[asm_commands.keys()[-1]] is not asm_command:
            asm_commands[asm_command["address"]] = asm_command

        # store the set of commands on this object
        self.asm_commands = asm_commands

        self.end_address  = offset + 1
        self.last_address = self.end_address

    def has_outstanding_labels(self, asm_commands, offset):
        """ Checks if there are any labels that haven't yet been created.
        """ # is this really necessary??
        return False

    def used_addresses(self):
        """ Returns a list of unique addresses that this function will probably
            call.
        """
        addresses = set()

        for (id, command) in self.asm_commands.items():
            if command.has_key("target_address") and command["id"] in call_commands:
                addresses.add(command["target_address"])

        return addresses

    def __str__(self):
        """ ASM pretty printer.
        """
        output = ""

        for (key, line) in self.asm_commands.items():
            # skip anything from before the beginning
            if key < self.start_address:
                continue

            # show a label
            if line["references"] > 0 and "current_label" in line.keys():
                if line["address"] == self.start_address:
                    output += "thing: ; " + hex(line["address"]) + "\n"
                else:
                    output += "." + line["current_label"] + "\@ ; " + hex(line["address"]) + "\n"

            # show the actual line
            if line.has_key("formatted_with_labels"):
                output += spacing + line["formatted_with_labels"]
            elif line.has_key("formatted"):
                output += spacing + line["formatted"]
            #output += " ; to " +
            output += "\n"

        # show the next address after this chunk
        output += "; " + hex(self.end_address)

        return output

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
