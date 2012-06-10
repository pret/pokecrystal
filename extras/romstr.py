from gbz80disasm import opt_table, end_08_scripts_with, relative_jumps, relative_unconditional_jumps, call_commands

class RomStr(str):
    """ Simple wrapper to prevent a giant rom from being shown on screen.
    """

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

        return Asm(start_address=start_address, end_address=end_address, size=size, max_size=max_size, debug=debug, rom=self)

class Asm:
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
        elif not end_address >= 0:
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

        while offset <= end_address and keep_reading:
            # read the current opcode byte
            current_byte = ord(rom[offset])
            current_byte_number = len(asm_commands.keys())
            
            # setup this next/upcoming command
            asm_command = {
                "address": offset,

                # This counts how many times relative jumps reference this
                # byte. This is used to determine whether or not to print out a
                # label later.
                "references": 0,
            }

            # some commands have two opcodes
            next_byte = ord(rom[offset+1])

            # all two-byte opcodes also have their first byte in there somewhere
            if current_byte in opt_table.keys():
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

                asm_command["type"] = "op"
                asm_command["id"] = op_code
                asm_command["format"] = opstr
                asm_command["opnumberthing"] = optype
                
                if "x" in opstr:
                    for x in range(0, opstr.count("x")):
                        insertion = ord(rom[offset + 1])
                        insertion = "$" + hex(insertion)[2:]
    
                        opstr = opstr[:opstr.find("x")].lower() + insertion + opstr[opstr.find("x")+1:].lower()
    
                        current_byte_number += 1
                        offset += 1 

                if "?" in opstr:
                    for y in range(0, opstr.count("?")):
                        byte1 = ord(rom[offset + 1])
                        byte2 = ord(rom[offset + 2])
    
                        number = byte1
                        number += byte2 << 8;
    
                        insertion = "$%.4x" % (number)
    
                        opstr = opstr[:opstr.find("?")].lower() + insertion + opstr[opstr.find("?")+1:].lower()
    
                        current_byte_number += 2
                        offset += 2

                # Check for relative jumps, construct the formatted asm line.
                # Also set the usage of labels.
                if current_byte in [0x18, 0x20] or current_byte in relative_jumps: # jr or jr nz
                    # generate a label for the byte we're jumping to
                    target_address = offset + 2 + c_int8(ord(rom[offset + 1])).value

                    if target_address in byte_labels.keys():
                        byte_labels[target_address]["usage"] = 1 + byte_labels[target_address]["usage"]
                        line_label2 = byte_labels[target_address]["name"]

                    else:
                        line_label2 = asm_label(target_address)
                        byte_labels[target_address] = {}
                        byte_labels[target_address]["name"] = line_label2
                        byte_labels[target_address]["usage"] = 1
                        byte_labels[target_address]["definition"] = False

                    insertion = line_label2.lower()
                    include_comment = True
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

                    if not has_outstanding_labels(byte_labels) or all_outstanding_labels_are_reverse(byte_labels, offset):
                        keep_reading = False
                        break

                # stop reading at a jump, relative jump or return
                if current_byte in end_08_scripts_with:
                    is_data = False

                    if not has_outstanding_labels(byte_labels) and all_outstanding_labels_are_reverse(byte_labels, offset):
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
            
            # save this new command in the list
            asm_commands[current_byte_number] = asm_command

    def __str__(self):
        """ ASM pretty printer.
        """
        raise NotImplementedError, "zzzzzz"

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

