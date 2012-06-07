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
        asm_commands = []

        offset = start_address
        
        current_byte_number = 0
        
        last_hl_address = None
        last_a_address  = None
        used_3d97       = False

        keep_reading    = True

        # for labeling future bytes (like for relative jumps)
        byte_labels = {}

        while offset <= end_address and keep_reading:
            current_byte = ord(rom[offset])

            is_data = False
            
            maybe_byte = current_byte

            # check if this byte has a label prior to it
            # and if not, generate a new label
            # This new label might not be used, so it will be
            # removed if the total usage is zero.
            if offset in byte_labels.keys():
                line_label = byte_labels[offset]["name"]
                byte_labels[offset]["usage"] += 1
            else:
                line_label = asm_label(offset)
                byte_labels[offset] = {}
                byte_labels[offset]["name"] = line_label
                byte_labels[offset]["usage"] = 0 
            byte_labels[offset]["definition"] = True
        output += .. add label here (well, not really)

            #find out if there's a two byte key like this
            temp_maybe = maybe_byte
            temp_maybe += ( ord(rom[offset+1]) << 8)
            if temp_maybe in opt_table.keys() and ord(rom[offset+1])!=0:
                opstr = opt_table[temp_maybe][0].lower()
    
                if "x" in opstr:
                    for x in range(0, opstr.count("x")):
                        insertion = ord(rom[offset + 1])
                        insertion = "$" + hex(insertion)[2:]
    
                        opstr = opstr[:opstr.find("x")].lower() + insertion + opstr[opstr.find("x")+1:].lower()
    
                        current_byte += 1
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
    
            output += spacing + opstr #+ " ; " + hex(offset)
            output += "\n"
    
                current_byte_number += 2
                offset += 2
            elif maybe_byte in opt_table.keys():
                op_code = opt_table[maybe_byte]
                op_code_type = op_code[1]
                op_code_byte = maybe_byte
    
                #type = -1 when it's the E op
                #if op_code_type != -1:
                if   op_code_type == 0 and ord(rom[offset]) == op_code_byte:
                    op_str = op_code[0].lower()
    
                    output += spacing + op_code[0].lower() #+ " ; " + hex(offset)
                    output += "\n"
    
                    offset += 1
                    current_byte_number += 1
                elif op_code_type == 1 and ord(rom[offset]) == op_code_byte:
                    oplen = len(op_code[0])
                    opstr = copy(op_code[0])
                    xes = op_code[0].count("x")
                    include_comment = False
                    for x in range(0, xes):
                        insertion = ord(rom[offset + 1])
                        insertion = "$" + hex(insertion)[2:]
    
                        if current_byte == 0x18 or current_byte==0x20 or current_byte in relative_jumps: #jr or jr nz
                            #generate a label for the byte we're jumping to
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
    
                        opstr = opstr[:opstr.find("x")].lower() + insertion + opstr[opstr.find("x")+1:].lower()
                        output += spacing + opstr
                        if include_comment:
                            output += " ; " + hex(offset)
                            if current_byte in relative_jumps:
                                output += " $" + hex(ord(rom[offset + 1]))[2:]
                        output += "\n"
    
                        current_byte_number += 1
                        offset += 1
                        insertion = ""
    
                    current_byte_number += 1
                    offset += 1
                    include_comment = False
    
                elif op_code_type == 2 and ord(rom[offset]) == op_code_byte:
                    oplen = len(op_code[0])
                    opstr = copy(op_code[0])
                    qes = op_code[0].count("?")
                    for x in range(0, qes):
                        byte1 = ord(rom[offset + 1])
                        byte2 = ord(rom[offset + 2])
    
                        number = byte1
                        number += byte2 << 8;
    
                        insertion = "$%.4x" % (number)
                        if maybe_byte in call_commands or current_byte in relative_unconditional_jumps or current_byte in relative_jumps:
                            result = find_label(insertion, bank_id)
                            if result != None:
                                insertion = result
    
                        opstr = opstr[:opstr.find("?")].lower() + insertion + opstr[opstr.find("?")+1:].lower()
                        output += spacing + opstr #+ " ; " + hex(offset)
                        output += "\n"
    
                        current_byte_number += 2
                        offset += 2
    
                    current_byte_number += 1
                    offset += 1
    
                    if current_byte == 0x21:
                        last_hl_address = byte1 + (byte2 << 8)
                    if current_byte == 0xcd:
                        if number == 0x3d97: used_3d97 = True
                    #duck out if this is jp $24d7
                    if current_byte == 0xc3 or current_byte in relative_unconditional_jumps:
                        if current_byte == 0xc3:
                            if number == 0x3d97: used_3d97 = True
                        #if number == 0x24d7: #jp
                        if not has_outstanding_labels(byte_labels) or all_outstanding_labels_are_reverse(byte_labels, offset):
                            keep_reading = False
                            is_data = False
                            break
                else:
                    is_data = True
    
                #stop reading at a jump, relative jump or return
                if current_byte in end_08_scripts_with:
                    if not has_outstanding_labels(byte_labels) and all_outstanding_labels_are_reverse(byte_labels, offset):
                        keep_reading = False
                        is_data = False #cleanup
                        break
                    else:
                        is_data = False
                        keep_reading = True
                else:
                    is_data = False
                    keep_reading = True
            else:
            #if is_data and keep_reading:
                output += spacing + "db $" + hex(ord(rom[offset]))[2:] #+ " ; " + hex(offset)
                output += "\n"
                offset += 1
                current_byte_number += 1
            #else the while loop would have spit out the opcode
    
            #these two are done prior
            #offset += 1
            #current_byte_number += 1
    
        #clean up unused labels
        for label_line in byte_labels.keys():
            address = label_line
            label_line = byte_labels[label_line]
            if label_line["usage"] == 0:
                output = output.replace((label_line["name"] + "\n").lower(), "")
    
        #add the offset of the final location
        output += "; " + hex(offset)
    
        return (output, offset, last_hl_address, last_a_address, used_3d97)

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

