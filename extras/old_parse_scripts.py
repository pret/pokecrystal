# -*- coding: utf-8 -*-
"""
This is in a separate file because it screws up highlighting. Doesn't
do anything on its own.

old_parse is a part of the Script class
"""

def old_parse(self, *args, **kwargs):
    """parses a script-engine script; force=True if you want to re-parse
    and get the debug information"""
    print "Script.old_parse address="+hex(self.address)
    #can't handle more than one argument
    if len(args) > 1:
        raise Exception, "Script.parse_script doesn't know how to handle positional arguments"
    #use the first positional argument as the address
    elif len(args) == 1:
        self.address = args[0]
        if type(self.address) == str:
            self.address = int(self.address, 16)
        elif type(self.address) != int:
            raise Exception, "address param is the wrong type"
    #parse any keyword arguments, first make up the defaults
    kwargsorig = {"map_group": None, "map_id": None, "force": False, "debug": True, "origin": False}
    #let the caller override any defaults
    kwargsorig.update(kwargs)
    #copy these into kwargs
    kwargs = kwargsorig
    #set these defaults
    map_group = kwargs["map_group"]
    map_id = kwargs["map_id"]
    force = kwargs["force"]
    debug = kwargs["debug"]
    origin = kwargs["origin"]
    self.map_group = map_group
    self.map_id = map_id

    global rom
    if rom == None:
        direct_load_rom()

    #max number of commands in a 'recursive' script
    max_cmds = 150

    #set the address to be parsed
    address = self.address
    original_start_address = address

    #don't parse these crazy things (battle tower things, some rival things, etc.)
    if address in stop_points:
        print "got " + hex(address) + ".. map_group=" + str(map_group) + " map_id=" + str(map_id)
        return None
    #don't parse anything that looks crazy
    if address < 0x4000 and address not in [0x26ef, 0x114, 0x1108]:
        print "address is less than 0x4000.. address is: " + hex(address)
        sys.exit()

    #check if work is being repeated
    if is_script_already_parsed_at(address) and not force:
        raise Exception, "this script has already been parsed before, please use that instance"
        #use the commands from a previously-parsed Script object
        #self.commands = script_parse_table[address].commands
        #return True

        #return a previously-created Script object
        #return script_parse_table[address]

    #this next line stops the same script from being re-parsed multiple times
    #for instance.. maybe there's a script jump, then a jump back
    #the original script should only be parsed once
    script_parse_table[original_start_address:original_start_address+1] = "incomplete Script"

    #set up some variables
    self.commands = {}
    commands = self.commands
    offset = address
    end = False

    #main loop.. parse each command byte
    while not end:
        #reset variables so we don't contaminate this command
        info, long_info, size = None, None, 0
        #read the current command byte
        command_byte = ord(rom[offset])
        #setup the current command representation
        command = {"type": command_byte, "start_address": offset}

        #size is the total size including the command byte
        #last_byte_address is offset+size-1
        start_address = offset

        if (len(commands.keys()) > max_cmds) and origin != False:
            print "too many commands in this script? might not be a script (starting at: " +\
                  hex(original_start_address) + ").. called from a script at: " + hex(origin)
            sys.exit()

        #start checking against possible command bytes
        if   command_byte == 0x00: #Pointer code [2b+ret]
            pksv_name = "2call"
            info = "pointer code"
            long_info = """
            2byte pointer points to script; when pointed script ends --> return to old script
            [code][2 byte pointer]
            """
            size = 3
            start_address = offset
            last_byte_address = offset + size - 1
            pointer = calculate_pointer_from_bytes_at(start_address+1)
            if pointer == None:
                raise Exception, "pointer is None (shouldn't be None pointer on 0x0 script command"
            command["pointer"] = pointer
            if debug:
                print "in script starting at "+hex(original_start_address)+\
                      " about to parse script at "+hex(pointer)+\
                      " called by "+info+" byte="+hex(command_byte)
            script = rec_parse_script_engine_script_at(pointer, original_start_address, debug=debug)
            command["script"] = script
        elif command_byte == 0x01: #Pointer code [3b+ret]
            pksv_name = "3call"
            info = "pointer code"
            long_info = """
            3byte pointer points to script; when pointed script ends --> return to old script
            [Code][resp. pointer(2byte or 3byte)]
            """
            size = 4
            info = "pointer code"
            pointer = calculate_pointer_from_bytes_at(start_address+1, bank=True)
            if debug:
                print "in script starting at "+hex(original_start_address)+\
                      " about to parse script at "+hex(pointer)+\
                      " called by "+info+" byte="+hex(command_byte)
            script = rec_parse_script_engine_script_at(pointer, original_start_address, debug)
            command["pointer"] = pointer
            command["script"] = script
        elif command_byte == 0x02: #Pointer code [2b+3b+ret]
            info = "pointer code"
            long_info = """
            2byte pointer points to 3byte pointer; when pointed script --> return to old script
            [Code][resp. pointer(2byte or 3byte)]
            """
            size = 3
            pointer = calculate_pointer_from_bytes_at(start_address+1)
            if debug:
                print "in script starting at "+hex(original_start_address)+\
                      " about to parse script at "+hex(pointer)+\
                      " called by "+info+" byte="+hex(command_byte)
            script = rec_parse_script_engine_script_at(pointer, original_start_address, debug=debug)
            command["pointer"] = pointer
            command["script"] = script
        elif command_byte == 0x03: #Pointer code [2b]
            #XXX what does "new script is part of main script" mean?
            info = "pointer code"
            long_info = """
            2byte pointer points to script; new script is part of main script
            [Code][resp. pointer(2byte or 3byte)]
            """
            size = 3
            pointer = calculate_pointer_from_bytes_at(start_address+1)
            if debug:
                print "in script starting at "+hex(original_start_address)+\
                      " about to parse script at "+hex(pointer)+\
                      " called by "+info+" byte="+hex(command_byte)
            script = rec_parse_script_engine_script_at(pointer, original_start_address, debug=debug)
            command["pointer"] = pointer
            command["script"] = script
            end = True #according to pksv
        elif command_byte == 0x04: #Pointer code [3b]
            info = "pointer code"
            long_info = """
            3byte pointer points to script; new script is part of main script
            [Code][resp. pointer(2byte or 3byte)]
            """
            size = 4
            pointer = calculate_pointer_from_bytes_at(start_address+1, bank=True)
            if debug:
                print "in script starting at "+hex(original_start_address)+\
                  " about to parse script at "+hex(pointer)+\
                  " called by "+info+" byte="+hex(command_byte)
            script = rec_parse_script_engine_script_at(pointer, original_start_address, debug=debug)
            command["pointer"] = pointer
            command["script"] = script
            end = True #according to pksv
        elif command_byte == 0x05: #Pointer code [2b+3b]
            info = "pointer code"
            long_info = """
            2byte pointer points to 3byte pointer; new script is part of main script
            [Code][resp. pointer(2byte or 3byte)]
            """
            size = 3
            command["pointer"] = calculate_pointer_from_bytes_at(start_address+1)
            command["target_pointer"] = calculate_pointer_from_bytes_at(command["pointer"], bank=True)

            if debug:
                print "in script starting at "+hex(original_start_address)+\
                  " about to parse script at "+hex(command["target_pointer"])+\
                  " called by "+info+" byte="+hex(command_byte)
            script = rec_parse_script_engine_script_at(command["target_pointer"], original_start_address, debug=debug)
            command["script"] = script
            end = True #according to pksv
        elif command_byte == 0x06: #RAM check [=byte]
            info = "RAM check [=byte]"
            long_info = """
            When the conditional is true...
            .. then go to pointed script, else resume interpreting after the pointer
            """
            size = 4
            command["byte"] = ord(rom[start_address+1])
            pointer = calculate_pointer_from_bytes_at(start_address+2)
            if debug:
                print "in script starting at "+hex(original_start_address)+\
                  " about to parse script at "+hex(pointer)+\
                  " called by "+info+" byte="+hex(command_byte)
            script = rec_parse_script_engine_script_at(pointer, original_start_address, debug=debug)
            command["pointer"] = pointer
            command["script"] = script
        elif command_byte == 0x07: #RAM check [<>byte]
            info = "RAM check [<>byte]"
            long_info = """
            When the conditional is true...
            .. then go to pointed script, else resume interpreting after the pointer
            """
            size = 4
            command["byte"] = ord(rom[start_address+1])
            pointer = calculate_pointer_from_bytes_at(start_address+2)
            if debug:
                print "in script starting at "+hex(original_start_address)+\
                  " about to parse script at "+hex(pointer)+\
                  " called by "+info+" byte="+hex(command_byte)
            script = rec_parse_script_engine_script_at(pointer, original_start_address, debug=debug)
            command["pointer"] = pointer
            command["script"] = script
        elif command_byte == 0x08: #RAM check [=0]
            info = "RAM check [=0]"
            long_info = """
            When the conditional is true...
            .. then go to pointed script, else resume interpreting after the pointer
            """
            size = 3
            pointer = calculate_pointer_from_bytes_at(start_address+1)
            if debug:
                print "in script starting at "+hex(original_start_address)+\
                  " about to parse script at "+hex(pointer)+\
                  " called by "+info+" byte="+hex(command_byte)
            script = rec_parse_script_engine_script_at(pointer, original_start_address, debug=debug)
            command["pointer"] = pointer
            command["script"] = script
        elif command_byte == 0x09: #RAM check [<>0]
            info = "RAM check [<>0]"
            long_info = """
            When the conditional is true...
            .. then go to pointed script, else resume interpreting after the pointer
            """
            size = 3
            pointer = calculate_pointer_from_bytes_at(start_address+1)
            if debug:
                print "in script starting at "+hex(original_start_address)+\
                  " about to parse script at "+hex(pointer)+\
                  " called by "+info+" byte="+hex(command_byte)
            script = rec_parse_script_engine_script_at(pointer, original_start_address, debug=debug)
            command["pointer"] = pointer
            command["script"] = script
        elif command_byte == 0x0A: #RAM check [<byte]
            info = "RAM check [<byte]"
            long_info = """
            When the conditional is true...
            .. then go to pointed script, else resume interpreting after the pointer
            """
            size = 4
            command["byte"] = ord(rom[start_address+1])
            pointer = calculate_pointer_from_bytes_at(start_address+2)
            if debug:
                print "in script starting at "+hex(original_start_address)+\
                  " about to parse script at "+hex(pointer)+\
                  " called by "+info+" byte="+hex(command_byte)
            script = rec_parse_script_engine_script_at(pointer, original_start_address, debug=debug)
            command["pointer"] = pointer
            command["script"] = script
        elif command_byte == 0x0B: #RAM check [>byte]
            info = "RAM check [>byte]"
            long_info = """
            When the conditional is true...
            .. then go to pointed script, else resume interpreting after the pointer
            """
            size = 4
            command["byte"] = ord(rom[start_address+1])
            pointer = calculate_pointer_from_bytes_at(start_address+2)
            if debug:
                print "in script starting at "+hex(original_start_address)+\
                  " about to parse script at "+hex(pointer)+\
                  " called by "+info+" byte="+hex(command_byte)
            script = rec_parse_script_engine_script_at(pointer, original_start_address, debug=debug)
            command["pointer"] = pointer
            command["script"] = script
        elif command_byte == 0x0C: #0C codes [xxyy]
            info = "call predefined script then end"
            long_info = """
            Calls predefined scripts. After this code the script ends.
            [0C][xxyy]
            """
            size = 3
            end = True
            byte1 = ord(rom[offset+1])
            byte2 = ord(rom[offset+2])
            number = byte1 + (byte2 << 8)
            #0000 to 000AD ... XXX how should these be handled?
            command["predefined_script_number"] = number
        elif command_byte == 0x0D: #0D codes [xxyy]
            info = "call some predefined script"
            long_info = """
            Calls predefined scripts. Exactly like $0C except the script does not end.
            [0D][xxyy]
            """
            size = 3
            byte1 = ord(rom[offset+1])
            byte2 = ord(rom[offset+2])
            number = byte1 + (byte2 << 8)
            #0000 to 000AD ... XXX how should these be handled?
            command["predefined_script_number"] = number
        elif command_byte == 0x0E: #ASM code1 [3b]
            info = "ASM code1 [3b]"
            long_info = """
            Calls a predefined routine by interpreting the ASM the pointer points to.
            [0E][3byte pointer]
            """
            size = 4
            command["pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=True)
            #XXX should we dissassemble the asm at the target location?
        elif command_byte == 0x0F: #0F codes [xxyy]
            info = "call some predefined script [0F][yyxx]"
            long_info = """
            Calls predefined scripts.
            [0F][yyxx]
            NOTE: For (some) dialogues the font needs to be loaded with the Text box&font code.
            """
            size = 3
            byte1 = ord(rom[offset+1])
            byte2 = ord(rom[offset+2])
            number = byte1 + (byte2 << 8)
            command["predefined_script_number"] = number
        elif command_byte == 0x10: #ASM code2 [2b]
            info = "ASM code2 [2b to 3b to asm]"
            long_info = """
            Call an ASM script via a 2byte pointer pointing to a 3byte pointer.
            [10][2byte pointer pointing to 3byte pointer pointing to ASM script]
            """
            size = 3
            command["pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=False)
            #XXX should i include the 3-byte pointer at the target location?
            #XXX should we dissassemble the asm at the target location?
        elif command_byte == 0x11: #Trigger event check1 [xxyy]
            info = "Trigger event check1 [xx][yy]"
            long_info = """
            Check the current number of the trigger event on map (map group/map id).
            [11][map group][map number]
            """
            size = 3
            command["map_group"] = ord(rom[start_address+1])
            command["map_id"] = ord(rom[start_address+2])
        elif command_byte == 0x12: #Activate trigger event from afar [xxyyzz]
            info = "Activate trigger event from afar [xx][yy][zz]"
            long_info = """
            Changes trigger event number on map (map bank/map no) to xx.
            xx = trigger event number that should be activated
            [12][MapBank][MapNo][xx]
            """
            size = 4
            command["map_group"] = ord(rom[start_address+1])
            command["map_id"] = ord(rom[start_address+2])
            command["trigger_number"] = ord(rom[start_address+3])
        elif command_byte == 0x13: #Trigger event check
            info = "Trigger event check"
            long_info = """
            Checks the number of the trigger events on the current map.
            [13]
            """
            size = 1
        elif command_byte == 0x14: #De-/activate trigger event [xx]
            info = "De-/activate trigger event [xx]"
            long_info = """
            Changes trigger event number on current map to xx.
            xx = trigger event number that should be activated
            [14][xx]
            deactivate? Just activate a different trigger event number. There's a limit of 1 active trigger.
            """
            size = 2
            command["trigger_number"] = ord(rom[start_address+1])
        elif command_byte == 0x15: #Load variable into RAM [xx]
            info = "Load variable into RAM [xx]"
            long_info = "[15][xx]"
            size = 2
            command["variable"] = ord(rom[start_address+1])
        elif command_byte == 0x16: #Add variables [xx]
            info = "Add variables [xx]"
            long_info = """
            Adds xx and the variable in RAM.
            #[16][xx]
            """
            size = 2
            command["variable"] = ord(rom[start_address+1])
        elif command_byte == 0x17: #Random number [xx]
            info = "Random number [xx]"
            long_info = """
            #Reads xx and creates a random number between 00 and xx -1.
            #According to this xx can be all but 00. Random number = [00; xx)
            #The nearer the random number is to xx, the rarer it occurs.
            #Random number gets written to RAM.
            """
            size = 2
            command["rarest"] = ord(rom[start_address+1])
        elif command_byte == 0x18: #Version check
            info = "G/S version check"
            long_info = """
            #Check if version is gold or silver. Gives feedback.
            #00 = Gold
            #01 = Silver
            #[18]
            """
            size = 1
        elif command_byte == 0x19: #Copy variable code1 [xxyy]
            info = "Copy from RAM address to script RAM variable [xxyy]"
            long_info = """
            #Writes variable from ram address to RAM.
            #[19][2-byte RAM address]
            """
            size = 3
            #XXX maybe a pointer is a bad idea?
            command["pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=False)
        elif command_byte == 0x1A: #Copy variable code2 [xxyy]
            info = "Write variable from script RAM variable to actual RAM address [xxyy]"
            long_info = """
            #Writes variable from RAM to actual RAM address.
            #[1A][2-byte RAM address]
            """
            size = 3
            command["pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=False)
        elif command_byte == 0x1B: #Load variable [xxyyzz]
            info = "Load variable [xxyy][zz]"
            long_info = """
            #Writes zz to ram address.
            #[1B][2-byte RAM address][zz]
            """
            size = 4
            command["pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=False)
            command["value"] = ord(rom[start_address+3])
        elif command_byte == 0x1C: #Check codes [xx]
            #XXX no idea what's going on in this one :(
            info = "Check pre-ID-mapped RAM location [xx]"
            long_info = """
            #Checks special game-technical values and writes then into RAM.
            #[1C][following part][Ram check (when <> 08/09 see „numbers“ in list of following parts)]
            #following part (and then hex values)
            #01 = PKMN count in party
            #     00 - 06
            #02 = ???
            #03 = Battle type of wild PKMN
            #04 = ???
            #05 = PokéDex caught
            #     00 - FA
            #06 = PokéDex seen
            #     00 - FA
            #07 = Badge count
            #     00 - 10
            #08 = Movement
            #     00 = walk
            #     01 = bike
            #     02 = slipping
            #     04 = surfer
            #     08 = surfing pikachu
            #09 = HIRO direction
            #     00 (d)
            #     01 (u)
            #     02 (l)
            #     03 (r)
            #0A = Time in hours
            #     00 - 18
            #0B = Day
            #     00 (Mo) - 06 (Su)
            #0C = Map bank of current map
            #0D = Map no of current map
            #0E = Num. of diff. unowns seen
            #     00 - 1A
            #0F = Action byte of map
            #10 = Amount of free spaces in pkmn box
            #     00 - 14
            #11 = Minutes until end bug contest
            #     00 - 14
            #12 = X position of HIRO
            #13 = Y position of HIRO
            #14 = phone call number
            """
            size = 2 #i think?
            command["following_part"] = ord(rom[start_address+1])
        elif command_byte == 0x1D: #Input code1 [xx]
            info = "Write to pre-ID-mapped RAM location [xx]"
            long_info = """
            #Writes variable from RAM to special game-technical value offsets.
            #[1D][following part]
            #where [following part] is the same as 0x1C
            """
            size = 2
            command["following_part"] = ord(rom[start_address+1])
        elif command_byte == 0x1E: #Input code2 [xxyy]
            info = "Write byte value to pre-ID-mapped RAM location [aa][xx]"
            long_info = """
            #Writes variable xx to special game-technical value offsets.
            #[1E][following part][xx]
            #where [following part] is the same as 0x1C
            """
            size = 3
            command["following_part"] = ord(rom[start_address+1])
            command["value"] = ord(rom[start_address+2])
        elif command_byte == 0x1F: #Give item code [xxyy]
            info = "Give item by id and quantity [xx][yy]"
            long_info = """
            #Gives item (item no) amount times.
            #feedback:
            #   00 = bag full
            #   01 = OK
            #[1F][item no][amount]
            """
            size = 3
            command["item_id"] = ord(rom[start_address+1])
            command["quantity"] = ord(rom[start_address+2])
        elif command_byte == 0x20: #Take item code [xxyy]
            info = "Take item by id and quantity [xx][yy]"
            long_info = """
            #Gives item (item no) amount times
            #feedback:
            #   00 = not enough items
            #[20][item no][amount]
            """
            size = 3
            command["item_id"] = ord(rom[start_address+1])
            command["quantity"] = ord(rom[start_address+2])
        elif command_byte == 0x21: #Check for item code [xx]
            info = "Check if player has item [xx]"
            long_info = """
            #Checks if item is possessed.
            #feedback:
            #   00 = does not have item
            #   01 = has item
            #[21][item no]
            """
            size = 2
            command["item_id"] = ord(rom[start_address+1])
        elif command_byte == 0x22: #Give money code [xxyyzzaa]
            info = "Give money to HIRO/account [xxyyzzaa]"
            long_info = """
            #Gives zzyyxx money to HIRO/account.
            #zzyyxx = amount of money (000000 - 0F423F)
            #[22][00-HIRO/01-account][xxyyzz]
            """
            size = 5
            bytes = rom_interval(start_address, size, strings=False)
            command["account"] = bytes[1]
            command["amount"] = bytes[2:]
            #raise NotImplementedError, "don't know if zzyyxx is a decimal or hex value"
        elif command_byte == 0x23: #Take money code [xxyyzzaa]
            info = "Take money from HIRO/account [xxyyzzaa]"
            long_info = """
            #Takes zzyyxx money from HIRO/account.
            #zzyyxx = amount of money (000000 - 0F423F)
            #[23][00-HIRO/01-account][xxyyzz]
            """
            size = 5
            bytes = rom_interval(start_address, size, strings=False)
            command["account"] = bytes[1]
            command["amount"] = bytes[2:]
            #raise NotImplementedError, "don't know if zzyyxx is a decimal or hex value"
        elif command_byte == 0x24: #Check for money code [xxyyzzaa]
            info = "Check if HIRO/account has enough money [xxyyzzaa]"
            long_info = """
            #Checks if HIRO/account has got zzyyxx money.
            #feedback:
            #   00 = enough money
            #   01 = exact amount
            #   02 = less money
            #zzyyxx = amount of money (000000 - 0F423F)
            #[24][00-HIRO/01-account][xxyyzz]
            """
            size = 5
            bytes = rom_interval(start_address, size, strings=False)
            command["account"] = bytes[1]
            command["quantity"] = bytes[2:]
            #XXX how is quantity formatted?
            #raise NotImplementedError, "don't know if zzyyxx is a decimal or hex value"
        elif command_byte == 0x25: #Give coins code [xxyy]
            info = "Give coins to HIRO [xxyy]"
            long_info = """
            #Gives coins to HIRO.
            #yyxx = amount of coins (0000 - 270F)
            #[25][xxyy]
            """
            size = 3
            bytes = rom_interval(start_address, size, strings=False)
            command["quantity"] = bytes[1] + (bytes[2] << 8)
        elif command_byte == 0x26: #Take coins code [xxyy]
            info = "Take coins from HIRO [xxyy]"
            long_info = """
            #Takes coins away from HIRO.
            #yyxx = amount of coins (0000 - 270F)
            #[26][xxyy]
            """
            size = 3
            bytes = rom_interval(start_address, size, strings=False)
            command["quantity"] = bytes[1] + (bytes[2] << 8)
        elif command_byte == 0x27: #Check for coins code [xxyy]
            info = "Check if HIRO has enough coins [xxyy]"
            long_info = """
            #Checks if HIRO has enough coins.
            #feedback:
            #   00 = has enough coins
            #   01 = has exact amount
            #   02 = does not have enough
            #yyxx = amount of coins necessary (0000 - 270F)
            #[27][xxyy]
            """
            size = 3
            bytes = rom_interval(start_address, size, strings=False)
            command["quantity"] = bytes[1] + (bytes[2] << 8)
        elif command_byte == 0x28: #Give cell phone number [xx]
            info = "Give cell phone number [xx]"
            long_info = """
            #Gives number to HIRO.
            #feedback:
            #   00 = number was added successfully
            #   01 = Number already added, or no memory
            #xx = number of person
            #[28][xx]
            #01 = mother
            #02 = bike store
            #03 = bll
            #04 = elm
            """
            size = 2
            command["number"] = ord(rom[start_address+1])
        elif command_byte == 0x29: #Take cell phone number [xx]
            info = "Delete cell phone number [xx]"
            long_info = """
            #Deletes a number from the list.
            #feedback:
            #   00 = number deleted successfully
            #   01 = number wasn't in list
            #xx = number of person
            #[29][xx]
            """
            size = 2
            command["number"] = ord(rom[start_address+1])
        elif command_byte == 0x2A: #Check for cell phone number [xx]
            info = "Check for cell phone number [xx]"
            long_info = """
            #Checks if a number is in the list.
            #feedback:
            #   00 = number is in list
            #   01 = number not in list
            #xx = number to look for
            #[2A][xx]
            """
            size = 2
            command["number"] = ord(rom[start_address+1])
        elif command_byte == 0x2B: #Check time of day [xx]
            info = "Check time of day [xx]"
            long_info = """
            #Checks the time of day.
            #feedback:
            #   00 = time of day is the same
            #   01 = time of day is not the same
            #[2B][time of day (01morn-04night)]
            """
            size = 2
            command["time_of_day"] = ord(rom[start_address+1])
        elif command_byte == 0x2C: #Check for PKMN [xx]
            info = "Check for pokemon [xx]"
            long_info = """
            #Checks if there is a certain PKMN in team.
            #feedback:
            #   00 = in team
            #   01 = not in team
            #xx = pkmn id
            #[2C][xx]
            """
            size = 2
            command["pokemon_id"] = ord(rom[start_address+1])
        elif command_byte == 0x2D: #Give PKMN [xxyyzzaa(+2b +2b)]
            info = "Give pokemon [pokemon][level][item][trainer2b][...]"
            long_info = """
            #Gives a PKMN if there's space
            #feedback:
            #   trainer id
            #[2D][PKMN][PKMNlvl][PKMNitem][TRAINER]
            #trainer:
            #   00 = HIRO
            #   01 = after the main code there are 4 bytes added
            #       [2byte pointer to trainer's name (max.0x0A figures + 0x50)][2byte pointer to nickname (max.0x0A figures + 0x50)]
            """
            size = 5
            bytes = rom_interval(start_address, size, strings=False)
            command["pokemon_id"] = bytes[1]
            command["pokemon_level"] = bytes[2]
            command["held_item_id"] = bytes[3]
            command["trainer"] = bytes[4]
            if command["trainer"] == 0x01:
                size += 4
                bytes = rom_interval(start_address, size, strings=False)
                command["trainer_name_pointer"] = calculate_pointer_from_bytes_at(start_address+5, bank=False)
                command["pokemon_nickname_pointer"] = calculate_pointer_from_bytes_at(start_address+7, bank=False)
        elif command_byte == 0x2E: #Give EGG [xxyy]
            info = "Give egg [xx][yy]"
            long_info = """
            #Gives egg if there's space.
            #feedback:
            #   00 = OK
            #   02 = transaction not complete
            #[2E][PKMN][PKMNlvl]
            """
            size = 3
            command["pokemon_id"] = ord(rom[start_address+1])
            command["pokemon_level"] = ord(rom[start_address+2])
        elif command_byte == 0x2F: #Attach item code [2B]
            info = "Attach item to last pokemon in list [xxyy]"
            long_info = """
            #Gives last PKMN in list an item and letter text if applicable. Replaces existing items.
            #[2F][2byte pointer to item no + 0x20 bytes letter text]
            """
            size = 3
            command["item_pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=False)
            #XXX are those 20 bytes supposed to happen here? or at the pointer's destination?
        elif command_byte == 0x30: #Check letter code [2b]
            info = "Check letter against known letter [xxyy]"
            long_info = """
            #Opens a PKMN list. Selected PKMN must have the right letter + the right contents. If OK, then PKMN is taken away
            #feedback:
            #   00 = wrong letter
            #   01 = OK
            #   02 = Cancelled
            #   03 = Chosen PKMN has no letter
            #   04 = Chosen PKMN is the only one in the list.
            #[30][2byte pointer to letter item no + 0x20 bytes letter text]
            """
            size = 3
            command["item_pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=False)
        elif command_byte == 0x31: #BitTable1 check [xxyy]
            info = "Check some bit on bit table 1 [xxyy]"
            long_info = """
            #Checks whether a bit of BitTable1 has the value 0 or 1.
            #feedback:
            #   00 = value 0 (off)
            #   01 = value 1 (on)
            #[31][2-byte bit number]
            """
            #XXX what format is the 2-byte number in?
            size = 3
            bytes = rom_interval(start_address+1, size-1, strings=False)
            command["bit_number_bytes"] = bytes
            #raise NotImplementedError, "what format is the 2-byte number in?"
        elif command_byte == 0x32: #BitTable1 reset [xxyy]
            info = "Reset (to 0) a bit on bit table 1 [xxyy]"
            long_info = """
            #Sets a bit of BitTable1 to value 0.
            #[32][Bit no (2byte)]
            """
            size = 3
            bytes = rom_interval(start_address+1, size-1, strings=False)
            command["bit_number_bytes"] = bytes
        elif command_byte == 0x33: #BitTable1 set [xxyy]
            info = "Set (to 1) a bit on bit table 1 [xxyy]"
            long_info = """
            #Sets a bit of BitTable1 to value 1.
            #[33][Bit-No (2byte)]
            """
            size = 3
            bytes = rom_interval(start_address+1, size-1, strings=False)
            command["bit_number_bytes"] = bytes
        elif command_byte == 0x34: #BitTable2 check [xxyy]
            info = "Check some bit on bit table 2 [xxyy]"
            long_info = """
            #Checks whether a bit of BitTable2 has the value 0 or 1.
            #feedback:
            #   00 = value 0 (off)
            #   01 = value 1 (on)
            #[34][Bit no (2byte)]
            """
            size = 3
            bytes = rom_interval(start_address+1, size-1, strings=False)
            command["bit_number_bytes"] = bytes
        elif command_byte == 0x35: #BitTable2 reset [xxyy]
            info = "Reset (to 0) a bit on bit table 2 [xxyy]"
            long_info = """
            #Sets a bit of BitTable2 to value 0.
            #[35][Bit no (2byte)]
            """
            size = 3
            bytes = rom_interval(start_address+1, size-1, strings=False)
            command["bit_number_bytes"] = bytes
        elif command_byte == 0x36: #BitTable2 set [xxyy]
            info = "Set (to 1) a bit on bit table 2 [xxyy]"
            long_info = """
            #Sets a bit of BitTable2 to value 1.
            #[36][Bit no (2byte)]
            """
            size = 3
            bytes = rom_interval(start_address+1, size-1, strings=False)
            command["bit_number_bytes"] = bytes
        elif command_byte == 0x37: #Deactivate PKMN battles
            info = "Turn off wild pokemon battles"
            long_info = """
            #This code turns all wild PKMN battles off.
            #[37]
            """
            size = 1
        elif command_byte == 0x38: #Activate PKMN battles
            info = "Turn no wild pokemon battles"
            long_info = "This code turns all wild PKMN battles on."
            size = 1
        elif command_byte == 0x39: #X/Y comparison [xxyy]
            info = "BUGGY x/y comparison [xxyy]"
            long_info = """
            #This code is buggy (Bug fix: 0x3021 --> C6) and can't used as
            #described without fix. This code compares the X and Y coordinates of
            #HIRO with the ones in a table (max. 20h XY pairs) on the current map.
            #It sets or resets the 4 bytes D17C to D17F accordingly to this table,
            #1 bit for every table entry. To be useful, this code can only be used
            #in a command queue, because with every regular move of HIRO the bits
            #are reset again. This code is an alternative to the trigger events and
            #can be used via the command queue code.
            #See Write command queue, Additional documentation: 3:4661 with c= index
            #in table (start=00), hl=D171, b=01, d=00.
            """
            size = 3
            command["table_pointer"] = rom_interval(start_address+1, size-1, strings=False)
        elif command_byte == 0x3A: #Warp modifier [xxyyzz]
            info = "Set target for 0xFF warps [warp id][map group][map id]"
            long_info = """
            #Changes warp data for all warps of the current map that have a 0xFF for warp-to data.
            #[3A][Nee warp-to][New map bank][New map no]
            """
            size = 4
            bytes = rom_interval(start_address+1, size-1, strings=False)
            command["nee_warp_to"] = bytes[0]
            command["map_group"] = bytes[1]
            command["map_id"] = bytes[2]
        elif command_byte == 0x3B: #Blackout modifier [xxyy]
            info = "Blackout warp modifier [map group][map id]"
            long_info = """
            #Changes the map HIRO arrives at, after having a blackout.
            #There needs to be flying data for that map.
            #[3B][Map bank][Map no]
            """
            size = 3
            command["map_group"] = ord(rom[start_address+1])
            command["map_id"] = ord(rom[start_address+2])
        elif command_byte == 0x3C: #Warp code [xxyyzzaa]
            info = "Warp to [map group][map id][x][y]"
            long_info = """
            #Warps to another map.
            #If all data is 00s, then the current map is reloaded with
            #the current X and Y coordinates. Old script is not finished
            #without a [90].
            #[3C][Map bank][Map no][X][Y]
            """
            size = 5
            command["map_group"] = ord(rom[start_address+1])
            command["map_id"] = ord(rom[start_address+2])
            command["x"] = ord(rom[start_address+3])
            command["y"] = ord(rom[start_address+4])
        elif command_byte == 0x3D: #Account code [xxyy]
            info = "Read money amount [xx][yy]"
            long_info = """
            #Reads amount of money in accounts of HIRO and mother and writes
            #it to MEMORY1, 2 or 3 for later use in text.
            #[3D][00 = HIRO| <> 00 = Mother][00-02 MEMORY]
            #see http://hax.iimarck.us/files/scriptingcodes_eng.htm#InText01
            """
            size = 3
            command["account_id"] = ord(rom[start_address+1])
            command["memory_id"] = ord(rom[start_address+2])
        elif command_byte == 0x3E: #Coin case code [xx]
            info = "Read coins amount [xx]"
            long_info = """
            #Reads amount of coins in coin case and writes it to MEMORY 1, 2,
            #or 3 for later use in text.
            #[3E][00-02 MEMORY]
            """
            size = 2
            command["memory_id"] = ord(rom[start_address+1])
        elif command_byte == 0x3F: #Display RAM [xx]
            info = "Copy script RAM value into memX [xx]"
            long_info = """
            #Reads RAM value and writes it to MEMORY1, 2 or 3 for later use in text.
            #[3F][00-02 MEMORY]
            """
            size = 2
            command["memory_id"] = ord(rom[start_address+1])
        elif command_byte == 0x40: #Display pokémon name [xxyy]
            info = "Copy pokemon name (by id) to memX [id][xx]"
            long_info = """
            #Writes pokémon name to MEMORY1, 2 or 3 for later use in text.
            #[40][PKMN no][00-02 MEMORY]
            """
            size = 3
            command["map_id"] = ord(rom[start_address+1])
            command["memory_id"] = ord(rom[start_address+2])
        elif command_byte == 0x41: #Display item name [xxyy]
            info = "Copy item name (by id) to memX [id][xx]"
            long_info = """
            #Writes item name to MEMORY1, 2 or 3 for later use in text.
            #[41][Item no][00-02 MEMORY]
            """
            size = 3
            command["item_id"] = ord(rom[start_address+1])
            command["memory_id"] = ord(rom[start_address+2])
        elif command_byte == 0x42: #Display location name [xx]
            info = "Copy map name to memX [xx]"
            long_info = """
            #Writes current location's name to MEMORY1, 2 or 3 for later use in text.
            #[42][00-02 MEMORY]
            """
            size = 2
            command["memory_id"] = ord(rom[start_address+1])
        elif command_byte == 0x43: #Display trainer name [xxyyzz]
            info = "Copy trainer name (by id&group) to memZ [xx][yy][zz]"
            long_info = """
            #Writes trainer name to MEMORY1, 2 or 3 for later use in text.
            #[43][Trainer number][Trainer group][00-02 MEMORY]
            """
            size = 4
            command["trainer_id"] = ord(rom[start_address+1])
            command["trainer_group"] = ord(rom[start_address+2])
            command["memory_id"] = ord(rom[start_address+3])
        elif command_byte == 0x44: #Display strings [2b + xx]
            info = "Copy text (by pointer) to memX [aabb][xx]"
            long_info = """
            #Writes string to MEMORY1, 2 or 3 for later use in text.
            #[44][2byte pointer to string (max. 0x0C figures + 0x50)][00-02 MEMORY]
            #See 0C codes: 0C2900, 0C2A00, 0C1B00, 0C2200, Usage of variable strings in text.
            """
            size = 4
            command["pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=False)
            command["memory_id"] = ord(rom[start_address+3])
            command["text"] = parse_text_engine_script_at(command["pointer"], map_group=map_group, map_id=map_id, debug=debug)
        elif command_byte == 0x45: #Stow away item code
            info = "Show HIRO put the ITEMNAME in the ITEMPOCKET text box"
            long_info = """
            #Text box: "HIRO put the ITEMNAME in the ITEMPOCKET."
            #The item number has to have been loaded beforehand
            #(e.g. by Give item code).
            """
            size = 1
        elif command_byte == 0x46: #Full item pocket code
            info = "Show ITEMPOCKET is full textbox"
            long_info = """
            #Text box: "ITEMPOCKET is full..." The item number has to have
            #been loaded beforehand (e.g. by Give item code).
            """
            size = 1
        elif command_byte == 0x47: #Text box&font code
            info = "Loads the font into the ram and opens a text box."
            size = 1
        elif command_byte == 0x48: #Refresh code [xx]
            info = "Screen refresh [xx]"
            long_info = """
            #Executes a complete screen refresh.
            #[48][xx]
            #xx is a dummy byte
            """
            size = 2
            command["dummy"] = ord(rom[start_address+1])
        elif command_byte == 0x49: #Load moving sprites
            info = "Load moving sprites into memory"
            long_info = "Loads moving sprites for person events into ram."
            size = 1
        elif command_byte == 0x4A: #Load byte to C1CE [xx]
            info = "Load specific byte to $C1CE [xx]"
            long_info = """
            #Loads a byte to C1CE. Seems to have no function in the game.
            #[4A][Byte]
            """
            size = 2
            command["byte"] = ord(rom[start_address+1])
        elif command_byte == 0x4B: #Display text [3b]
            info = "Display text by pointer [bb][xxyy]"
            long_info = """
            #Opens a text box and writes text. Doesn't load font.
            #[4B][Text bank][2byte text pointer]
            """
            size = 4
            command["text_group"] = ord(rom[start_address+1])
            command["pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=True)
            command["text"] = parse_text_engine_script_at(command["pointer"], map_group=map_group, map_id=map_id, debug=debug)
        elif command_byte == 0x4C: #Display text [2b]
            info = "Display text by pointer [xxyy]"
            long_info = """
            #Opens a text box and writes text. Doesn't load font.
            #[4C][2byte text pointer]
            """
            size = 3
            command["pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=False)
            command["text"] = parse_text_engine_script_at(command["pointer"], map_group=map_group, map_id=map_id, debug=debug)
        elif command_byte == 0x4D: #Repeat text [xxyy]
            info = "Repeat text [FF][FF]"
            long_info = """
            #Opens a text box and writes the text written latest resp. whose address was put statically to D175-D177.
            #Doesn't load font.
            #[4D][FF][FF]
            #Without FF for both bytes, no operation occurs
            """
            size = 3
            command["bytes"] = rom_interval(start_address+1, 2, strings=False)
        elif command_byte == 0x4E: #YES/No box
            info = "YES/No box"
            long_info = """
            #Displays a YES/NO box at X0F/Y07
            #feedback:
            #   00 = no
            #   01 = yes
            """
            size = 1
        elif command_byte == 0x4F: #Menu data code [2b]
            info = "Load menu data by pointer [xxyy]"
            long_info = """
            #Loads data for menus
            #[4F][2byte pointer to menu data]
            #see http://hax.iimarck.us/files/scriptingcodes_eng.htm#ZusatzDatA4F
            """
            size = 3
            command["menu_pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=False)
        elif command_byte == 0x50: #Write backup code
            info = "Write screen backup"
            long_info = "Writes backup of parts of the screen the box was overlapping."
            size = 1
        elif command_byte == 0x51: #Text1 code [2b]
            info = "Display text (by pointer), turn to HIRO, end [xxyy]"
            long_info = """
            #Displays a text and lets person turn to HIRO.
            #Afterwards there is no other script interpreted.
            #Corresponds to 6A + 47 + 4C + 53 + 49 + 90
            #[51][2byte textpointer]
            """
            size = 3
            end = True
            command["pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=False)
            command["text"] = parse_text_engine_script_at(command["pointer"], map_group=map_id, map_id=map_id, debug=debug)
        elif command_byte == 0x53: #Text2 code [2b]
            info = "Display text (by pointer) and end [xxyy]"
            long_info = """
            #Displays a text. Afterwards there is no other script interpreted.
            #Corresponds to 47 + 4C + 53 + 49 + 90
            #[52][2byte textpointer]
            """
            size = 3
            end = True
            command["pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=False)
            command["text"] = parse_text_engine_script_at(command["pointer"], map_group=map_id, map_id=map_id, debug=debug)
        elif command_byte == 0x54: #Close text box code
            info = "Close text box"
            long_info = "Closes a text box which was opened by 47 resp. 4B/4C/4D."
            size = 1
        elif command_byte == 0x55: #Keep text box open code
            info = "Keep text box open"
            long_info = "Keeps a text box open which was opened by 47 resp. 4B/4C/4D."
            size = 1
        elif command_byte == 0x56: #Pokémon picture code [xx]
            info = "Display a pokemon picture in a box by pokemon id [xx]"
            long_info = """
            #Opens a box and puts a Pokémon picture into it.
            #[55][xx]
            #xx:
            #    <>00 : Pokémon no
            #     =00 : Pokémon no gets read from RAM
            """
            size = 2
            command["byte"] = ord(rom[start_address+1])
        elif command_byte == 0x57: #Pokémon picture YES/NO code
            info = "?? Display a pokemon picture and a yes/no box"
            long_info = """
            #Displays a YES/NO box at X08/Y05.
            #feedback:
            #   00 = no chosen
            #   01 = yes chosen
            """
            size = 1
        elif command_byte == 0x58: #Menu interpreter 1
            info = "Menu interpreter 1 (see menu loader)"
            long_info = """
            #Interprets menu data loaded by 4F.
            #see also http://hax.iimarck.us/files/scriptingcodes_eng.htm#ZusatzDatA57
            """
            size = 1
        elif command_byte == 0x59: #Menu interpreter 2
            info = "Menu interpreter 2 (see menu loader)"
            long_info = """
            #Interprets menu data loaded by 4F.
            #see also http://hax.iimarck.us/files/scriptingcodes_eng.htm#Marke57
            #see also http://hax.iimarck.us/files/scriptingcodes_eng.htm#ZusatzDatA58
            """
            size = 1
        elif command_byte == 0x5A: #Load Pikachu data
            info = "Load pikachu data"
            long_info = "Loads 0x19 (Pikachu) to PokéRAM and level 5 to LevelRAM."
            size = 1
        elif command_byte == 0x5B: #Delete FightRAM/reset person check
            info = "? Disable fleeing from battle"
            long_info = """
            #Deletes the value in BattleRAM.
            #Turns off the check if the battle was started by entering
            #a trainer's area of view.
            """
            size = 1
        elif command_byte == 0x5C: #Load trainer data1
            info = "Load trainer from RAM"
            long_info = """
            #Loads trainer data when HIRO is in a trainer's range of sight.
            #Trainer group is read from CF2E and written to
            #TrRAM1, the trainer number is read from CF2F and written to
            #TrRAM2. 81 is written to BattleRAM.
            """
            size = 1
        elif command_byte == 0x5D: #Load Pokémon data [xxyy]
            info = "Loads pokemon by id and level for BattleRAM [xx][yy]"
            long_info = """
            #Loads Pokémon data. Writes 80 to BattleRAM.
            #[5C][Poke no][Level]
            """
            size = 3
            command["pokemon_id"] = ord(rom[start_address+1])
            command["pokemon_level"] = ord(rom[start_address+2])
        elif command_byte == 0x5E: #Load trainer data2 [xxyy]
            info = "Load trainer by group/id for BattleRAM [xx][yy]"
            long_info = """
            #Loads trainer data. Trainer group --> TrRAM1,
            #trainer number --> TrRAM2. Writes 81 to BattleRAM.
            #[5D][Trainer group][Trainer no]
            """
            size = 3
            command["trainer_group"] = ord(rom[start_address+1])
            command["trainer_id"] = ord(rom[start_address+2])
        elif command_byte == 0x5F: #Start battle
            info = "Start pre-configured battle"
            long_info = """
            #Starts trainer or Pokémon battle. BattleRAM: 80 = Poké battle; 81 = Trainer battle.
            #feedback:
            #   00 = win
            #   01 = lose
            """
            size = 1
        elif command_byte == 0x60: #Return to In game engine after battle
            info = "Return to in-game engine after battle"
            long_info = "Returns to ingame engine and evaluates battle. When lost then return to last Pokémon Center etc."
            size = 1
        elif command_byte == 0x61: #Learn how to catch PKMN [xx]
            info = "Pokemon catching tutorial [xx]"
            long_info = """
            #Starts a learn-how-to-catch battle with a Pokémon, whose data needs to be loaded beforehand
            #see http://hax.iimarck.us/files/scriptingcodes_eng.htm#Marke5C
            #Player has to have at least 1 Pokémon for it to work.
            #Items that are statically used: 1xPotion, 5xPoké ball.
            #[60][xx]
            #xx: Between 01 and 03. If <> 03 then HIRO sprite instead of dude sprite and kills
            #itself when using the item system.
            """
            size = 2
            command["byte"] = ord(rom[start_address+1])
        elif command_byte == 0x62: #Trainer text code
            info = "Set trainer text by id [xx]"
            long_info = """
            #Interprets the data of a in the event structure defined trainer.
            #[61][xx]
            #Xx decides which text to use.
            #xx: Between 00 and 03.
            #see http://hax.iimarck.us/files/scriptingcodes_eng.htm#Eventaufbau
            """
            size = 2
            command["byte"] = ord(rom[start_address+1])
        elif command_byte == 0x63: #Trainer status code [xx]
            info = "? Check trainer status [xx]"
            long_info = """
            #Checks/changes the status of a in the event structure defined trainer.
            #see http://hax.iimarck.us/files/scriptingcodes_eng.htm#Eventaufbau
            #[62][xx]
            #xx is:
            #   00 = deactivate
            #   01 = activate
            #   02 = check
            """
            size = 2
            command["byte"] = ord(rom[start_address+1])
        elif command_byte == 0x64: #Pointer Win/Lose [2b + 2b]
            info = "Set win/lose pointers for battle [xxyy][xxyy]"
            long_info = """
            #Writes the win/lose pointer of a battle into the ram.
            #[63][2byte pointer to text Win][2byte pointer to text Loss*]
            #* When pointer = 0000 then "Blackout" instead of return to gameplay.
            """
            size = 5
            #sometimes win/lost can be a pointer to 0000 or None?
            command["won_pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=False)
            command["lost_pointer"] = calculate_pointer_from_bytes_at(start_address+3, bank=False)
            if command["won_pointer"] == None:
                command["won_pointer"] = 0
            else:
                command["text_won"] = parse_text_engine_script_at(command["won_pointer"], map_group=map_id, map_id=map_id, debug=debug)
            if command["lost_pointer"] == None:
                command["lost_pointer"] = 0
            else:
                command["text_lost"] = parse_text_engine_script_at(command["lost_pointer"], map_group=map_id, map_id=map_id, debug=debug)
        elif command_byte == 0x65: #Script talk-after
            #XXX this is a really poor description of whatever this is
            info = "? Load the trainer talk-after script"
            long_info = """
            #Interprets which script is going to be run, when a in the event-structure-defined
            #trainer is talked to again.
            #see http://hax.iimarck.us/files/scriptingcodes_eng.htm#Eventaufbau
            #[64]
            """
            size = 1
        elif command_byte == 0x66: #Script talk-after-cancel
            info = "Disable/cancel trainer after-battle text"
            long_info = """
            #Cancels the talk-after script of the in the event-structure-defined
            #trainer when talk-after script is executed just after the battle.
            #[65]
            """
            size = 1
        elif command_byte == 0x67: #Script talk-after-check
            #XXX also bad explanation/name...
            info = "? Check if trainer talk-after script is executed just after battle or not"
            long_info = """
            #Checks if the talk-after script of the event structure defined trainer
            #is executed just after the battle or at a later point in time.
            #feedback:
            #   00 = no
            #   01 = yes
            #[66]
            """
            size = 1
        elif command_byte == 0x68: #Set talked-to person [xx]
            info = "Set last talked-to person [xx]"
            long_info = """
            #Sets the number of the last person talked to.
            #[67][person]
            """
            size = 2
            command["person_id"] = ord(rom[start_address+1])
        elif command_byte == 0x69: #Moving code [xx + 2b]
            info = "Move person (by id) with moving data (by pointer) [id][xxyy]"
            long_info = """
            #Moves the person using moving data.
            #[68][Person][2byte pointer to moving data]
            #see also http://hax.iimarck.us/files/scriptingcodes_eng.htm#ZusatzB68bis69
            """
            size = 4
            command["person_id"] = ord(rom[start_address+1])
            command["moving_data_pointer"] = calculate_pointer_from_bytes_at(start_address+2, bank=False)
        elif command_byte == 0x6A: #Moving code for talked-to person [2b]
            info = "Move talked-to person with moving data (by pointer) [xxyy]"
            long_info = """
            #Moves talked-to person using moving data.
            #[69][2byte pointer to moving data]
            """
            size = 3
            command["moving_data_pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=False)
        elif command_byte == 0x6B: #Talk-to facing code
            info = "Move talked-to person's facing direction to HIRO"
            long_info = """
            #Turns the heads of the talked-to persons to HIRO.
            #[6A]
            """
            size = 1
        elif command_byte == 0x6C: #Facing of people code [xxyy]
            info = "Move facing direction of person1 to look at person2 [2][1]"
            long_info = """
            #Turns the head of person1 to another person2.
            #[6B][Person2][Person1]
            #Person2 = If number is greater than 0xFD, then use number of talked-to person.
            #Person1 = If number equals 0xFE, then take number of talked-to person.
            """
            size = 3
            command["person2_id"] = ord(rom[start_address+1])
            command["person1_id"] = ord(rom[start_address+2])
        elif command_byte == 0x6D: #Variable sprites [xxyy]
            info = "Store value in variable sprite RAM location x by id Y [xx][yy]"
            long_info = """
            #Writes a number to the variable sprite RAM from D555 to D564 (see Compendium on the sprite system).
            #[6C][xx][Sprite no]
            #xx: Number between 0x00 and 0x0F
            """
            size = 3
            command["number"] = ord(rom[start_address+1])
            command["sprite_id"] = ord(rom[start_address+2])
        elif command_byte == 0x6E: #Hide person [xx]
            info = "Hide person by id [xx]"
            long_info = """
            #Hides a person.
            #[6D][person id]
            """
            size = 2
            command["person_id"] = ord(rom[start_address+1])
        elif command_byte == 0x6F: #Show person [xx]
            info = "Show person by id [xx]"
            long_info = """
            #Shows a hidden person again.
            #[6E][person id]
            """
            size = 2
            command["person_id"] = ord(rom[start_address+1])
        elif command_byte == 0x70: #Following code1 [xxyy]
            info = "Following code1 [leader id][follower id]"
            long_info = """
            #A person1 follows another person2. The person1 that follows
            #just repeats the movement of person2, even if the persons are
            #not directly next to each other.
            #[6F][Leader Person2][Follower Person1]
            """
            size = 3
            command["leader_person_id"] = ord(rom[start_address+1])
            command["follower_person_id"] = ord(rom[start_address+2])
        elif command_byte == 0x71: #Stop following code
            info = "Stop all follow code"
            long_info = "Ends all current follow codes."
            size = 1
        elif command_byte == 0x72: #Move person [xxyyzz]
            info = "Move person by id to xy [id][xx][yy]"
            long_info = """
            #Sets the X/Y values of a person anew.
            #The person doesn't get shown immediately. Use hide&show.
            #[71][Person][X][Y]
            """
            size = 4
            command["person_id"] = ord(rom[start_address+1])
            command["x"] = ord(rom[start_address+2])
            command["y"] = ord(rom[start_address+3])
        elif command_byte == 0x73: #Write person location [xx] (lock person location?)
            info = "Lock person's location by id [id]"
            long_info = """
            #Writes the current X/Y values of a person into the ram.
            #The person is going to stand at its current location even when
            #it's out of HIRO's sight and is not going to return to its old
            #location until the next map load.
            #[72][person]
            """
            size = 2
            command["person_id"] = ord(rom[start_address+1])
        elif command_byte == 0x74: #Load emoticons [xx]
            info = "Load emoticon bubble [xx]"
            long_info = """
            #Loads the emoticon bubble depending on the given bubble number.
            #[73][bubble number]
            #xx: If xx = FF then take number from RAM.
            #  00 = Exclamation mark
            #  01 = Question mark
            #  02 = Happy
            #  03 = Sad
            #  04 = Heart
            #  05 = Flash
            #  06 = Snoring
            #  07 = Fish
            """
            size = 2
            command["bubble_number"] = ord(rom[start_address+1])
        elif command_byte == 0x75: #Display emoticon [xxyyzz]
            info = "Display emoticon by bubble id and person id and time [xx][yy][zz]"
            long_info = """
            #Displays the bubble above a persons head for the given time period.
            #Attention: Bubbles get loaded into ram!
            #[74][Bubble][Person][Time]
            #for bubble ids see 0x73
            """
            size = 4
            command["bubble_number"] = ord(rom[start_address+1])
            command["person_id"] = ord(rom[start_address+2])
            command["time"] = ord(rom[start_address+3])
        elif command_byte == 0x76: #Change facing [xxyy]
            info = "Set facing direction of person [person][facing]"
            long_info = """
            #Changes the facing direction of a person.
            #[75][person][facing]
            """
            size = 3
            command["person_id"] = ord(rom[start_address+1])
            command["facing"] = ord(rom[start_address+2])
        elif command_byte == 0x77: #Following code2 [xxyy]
            info = "Following code2 [leader id][follower id]"
            long_info = """
            #A person1 follows a person2. The following person1 automatically clings to person2.
            #Person1 just follows person2, but doesn't make the exact same movements at person2.
            #[76][Leader Person2][Follower Person1]
            """
            size = 3
            command["leader_person_id"] = ord(rom[start_address+1])
            command["follower_person_id"] = ord(rom[start_address+2])
        elif command_byte == 0x78: #Earth quake [xx]
            info = "Earthquake [xx]"
            long_info = """
            #The screen shakes. xx gives time as well as displacement of the screen.
            #[77][xx]
            """
            size = 2
            command["shake_byte"] = ord(rom[start_address+1])
        elif command_byte == 0x79: #Exchange map [3b]
            info = "Draw map data over current map [bank][pointer]"
            long_info = """
            #This code draws another whole map as wide and high as the
            #current map over the current map.
            #The 3byte pointer points to the new map.
            #[78][3byte pointer to new map data]
            """
            size = 4
            command["map_data_pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=True)
        elif command_byte == 0x7A: #Change block code [xxyyzz]
            info = "Change block to block id on map [xx][yy][id]"
            long_info = """
            #Changes a block on the current map by giving the new block
            #number and its X/Y values measured in half-blocks.
            #[79][X][Y][Block]
            """
            size = 4
            command["x"] = ord(rom[start_address+1])
            command["y"] = ord(rom[start_address+2])
            command["block"] = ord(rom[start_address+3])
        elif command_byte == 0x7B: #Reload map code
            info = "Reload/redisplay map"
            long_info = """
            #Reloads and re-displays the map completely.
            #Loads tileset and all map data anew. Screen gets light.
            #[7A]
            """
            size = 1
        elif command_byte == 0x7C: #Reload map part code
            info = "Reload/redisplay map portion occupied by HIRO"
            long_info = """
            #Reloads and re-displays the part of the map HIRO is on,
            #without reloading any other map data or the tileset.
            #[7B]
            """
            size = 1
        elif command_byte == 0x7D: #Write command queue
            info = "Write command queue [xxyy]"
            long_info = """
            #Writes a command queue to the next free slot in ram.
            #Max 4 command queues à 5 bytes. This code is buggy (bug fix: 25:7C74 --> 12).
            #[7C][2byte pointer to 5byte command queue]
            #see http://hax.iimarck.us/files/scriptingcodes_eng.htm#ZusatzDok25_7CC9
            """
            size = 3
            command["command_queue_pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=False)
        elif command_byte == 0x7E: #Delete command queue
            info = "Delete command queue"
            long_info = """
            #Deletes a command queue and frees a slot in ram.
            #[7D][First command of the resp. queue]
            """
            #XXX wtf?
            size = 2
            command["first_command"] = ord(rom[start_address+1])
        elif command_byte == 0x7F: #Song code1 [xxyy]
            info = "Play music by number [xxyy]"
            long_info = """
            #Immediately plays the music.
            #[7E][Music no (2byte)]
            #Music no: See the music archive that should accompany
            #this document Thanks to Filb. He dumped all the songs
            #via gameboy player and gave them to me.
            """
            size = 3
            #XXX what is the format of this music data?
            command["music_number"] = rom_interval(start_address+1, size-1, strings=False)
        elif command_byte == 0x80: #Song code2
            info = "Song code2"
            long_info = """
            #Plays the music of the trainer group in TrRAM1.
            #Takes music numbers from list at 3A:5027.
            #[7F]
            """
            size = 1
        elif command_byte == 0x81: #Music fade-out code [xxyy][zz]
            info = "Music fade-out then play next [xxyy][time]"
            long_info = """
            #The current music is faded out and the new music is played afterwards.
            #[80][Music no (2byte)][Time to fade out (00-7F)]
            """
            size = 4
            command["music_number"] = rom_interval(start_address+1, 2, strings=False)
            command["fade_time"] = ord(rom[start_address+3])
        elif command_byte == 0x82: #Play map music code
            info = "Play map's music"
            long_info = """
            #Starts playing the original map music.
            #Includes special check for surfer and bug contest song.
            #[81]
            """
            size = 1
        elif command_byte == 0x83: #Map reload music code
            info = "Reload map music"
            long_info = """
            #After a map reload no music is played.
            #[82]
            """
            size = 1
        elif command_byte == 0x84: #Cry code [xx00]
            info = "Play cry by id or RAM [cry][00]"
            long_info = """
            #Plays the Pokémon's cry.
            #[83][Cry no][00]
            #If the cry no = 00 then the number is taken from RAM.
            """
            size = 3
            command["cry_number"] = ord(rom[start_address+1])
            command["other_byte"] = ord(rom[start_address+2])
        elif command_byte == 0x85: #Sound code [xxyy]
            info = "Play sound by sound number [xxyy]"
            long_info = """
            #Plays the sound.
            #[84][Sound no (2byte)]
            #Sound no: See the music archive that should accompany this document
            #Thanks to philb for this matter. He helped me to record a big
            #part of these sounds.
            """
            size = 3
            command["sound_number"] = rom_interval(start_address+1, 2, strings=False)
        elif command_byte == 0x86: #Key-down code
            info = "Wait for key-down"
            long_info = """
            #Waits for the Player to press a button.
            #[85]
            """
            size = 1
        elif command_byte == 0x87: #Warp sound
            info = "Warp sound"
            long_info = """
            #Evaluates which sound is played when HIRO enters a Warp field.
            #Usage via script ingame is rather not useful.
            #[86]
            """
            size = 1
        elif command_byte == 0x88: #Special sound
            info = "Special sound if TM was last checked"
            long_info = """
            #When last given/checked Item was a TM then it plays sound 0x9B. If not, then 0x01.
            #[87]
            """
            size = 1
        elif command_byte == 0x89: #Engine remote control [2b]
            info = "Engine remote control [bb][xxyy]"
            long_info = """
            #This code controls the engine via "data stream".
            #[88][3byte pointer to control structure]
            #see http://hax.iimarck.us/files/scriptingcodes_eng.htm#ZusatzDatA88
            """
            size = 4
            command["data_stream_pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=True)
        elif command_byte == 0x8A: #Load map anew [xx]
            info = "Load map with specific loading process [xx]"
            long_info = """
            #The number decides which map loading process is used.
            #The number must be 0xF0 + process number to work correctly.
            #[89][Number]
            #see map loading process:
            #   http://hax.iimarck.us/files/scriptingcodes_eng.htm#ZusatzDok5_5550
            """
            size = 2
            command["number"] = ord(rom[start_address+1])
        elif command_byte == 0x8B: #Waiting code [xx]
            info = "Wait code"
            long_info = """
            #This code lets the game wait for 2 * xx time intervals.
            #[8A][xx]
            #xx: Numbers from 0x01 to 0xFF.
            #If 0x00 is chosen then the time can be manipulated by previously loading a number to RAM2.
            """
            size = 2
            command["time"] = ord(rom[start_address+1])
        elif command_byte == 0x8C: #Deactivate static facing [xx]
            info = "Deactive static facing after time [xx]"
            long_info = """
            #Deactivates static facings on all persons on the screen after a time xx.
            #[8B][xx]
            """
            size = 2
            command["time"] = ord(rom[start_address+1])
        elif command_byte == 0x8D: #Priority jump1 [2b]
            info = "Priority jump to script by pointer [xxyy]"
            long_info = """
            #The pointer acts like code 00, but with this higher
            #functions like the bike etc. are not paid attention to,
            #while the script is running.
            #[8C][2byte pointer to script]
            """
            size = 3
            script_pointer = calculate_pointer_from_bytes_at(start_address+1, bank=False)
            if debug:
                print "in script starting at "+hex(original_start_address)+\
                  " about to parse script at "+hex(script_pointer)+\
                  " called by "+info+" byte="+hex(command_byte)
            script = rec_parse_script_engine_script_at(script_pointer, original_start_address, debug=debug)
            command["script_pointer"] = script_pointer
            command["script"] = script
            end = True #according to pksv
        elif command_byte == 0x8E: #Warp check
            info = "Reactive all engine checks if player is warping"
            long_info = """
            #If HIRO is entering or leaving a warp then this code reactivates all the engine-checks.
            #[8D]
            """
            size = 1
        elif command_byte == 0x8F: #Priority jump2 [2b]
            info = "Priority jump to script by pointer (after 1st cycle) [xxyy]"
            long_info = """
            #The pointer acts like code 03, but with this code all
            #higher functions wait for a cycle before the script gets interpreted.
            #[8E][2byte pointer to script]
            """
            size = 3
            script_pointer = calculate_pointer_from_bytes_at(start_address+1, bank=False)
            if debug:
                print "in script starting at "+hex(original_start_address)+\
                  " about to parse script at "+hex(script_pointer)+\
                  " called by "+info+" byte="+hex(command_byte)
            script = rec_parse_script_engine_script_at(script_pointer, original_start_address, debug=debug)
            command["script_pointer"] = script_pointer
            command["script"] = script
            end = True #according to pksv
        elif command_byte == 0x90: #Return code1
            info = "Return code 1"
            long_info = """
            #Ends the current script and loads the backup offset for "linked"
            #scripts if applicable. The sophisticated functions are not affected
            #and run like before the code. This code is mostly used for scripts
            #called by the 2nd part of the script header, because else malfunctions
            #occur.
            #[8F]
            """
            size = 1
            end = True
        elif command_byte == 0x91: #Return code2
            info = "Return code 2"
            long_info = """
            #Ends the current script and loads the backup offset for "linked"
            #scripts if applicable.  The sophisticated functions get reset if
            #no backup offset was loaded. This code is used to end most scripts.
            #[90]
            """
            size = 1
            end = True
        elif command_byte == 0x92: #Return code3
            info = "Return code 3"
            long_info = """
            #Reloads the map completely like the code 0x7A
            #and else acts completely like Return code2
            #[91]
            #see reload map code
            #   http://hax.iimarck.us/files/scriptingcodes_eng.htm#Marke7A
            #see 0x90
            """
            size = 1
            #XXX does this end the script?? "else acts like 0x90"
            #       else? what's the "if"?
            end = True
        elif command_byte == 0x93: #Reset sophisticated functions
            info = "Reset sophisticated functions"
            long_info = """
            #Resets all sophisticated functions to 0.
            #[92]
            """
            size = 1
        elif command_byte == 0x94: #Mart menu [xxyyzz]
            info = "Mart menu [dialog no][mart no 2b]"
            long_info = """
            #Displays a whole mart menu, however, doesn't load font to ram.
            #[93][Dialog no][Mart no (2byte)]
            #see http://hax.iimarck.us/files/scriptingcodes_eng.htm#AwBsp93
            #see http://hax.iimarck.us/files/scriptingcodes_eng.htm#ZusatzB93
            """
            size = 4
            command["dialog_number"] = ord(rom[start_address+1])
            command["mart_number"] = rom_interval(start_address+2, 2, strings=False)
        elif command_byte == 0x95: #Elevator menu [2b]
            info = "Display elevator menu by pointer [xxyy]"
            long_info = """
            #Displays a whole elevator menu, but it doesn't load font to ram.
            #Only works with warps with warp-to = 0xFF.
            #[94][2byte pointer to floor list]
            """
            size = 3
            command["floor_list_pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=False)
        elif command_byte == 0x96: #Trade menu [xx]
            info = "Display trade menu by trade id [xx]"
            long_info = """
            #Displays a whole trade menu, but it doesn't load font to ram.
            #[95][trade no]
            #see http://hax.iimarck.us/files/scriptingcodes_eng.htm#ZusatzDokTausch
            """
            size = 2
            command["trade_number"] = ord(rom[start_address+1])
        elif command_byte == 0x97: #Give cell phone number with YES/NO [xx]
            info = "Give cell phone number by id with YES/NO [id]"
            long_info = """
            #Gives a telephone number but asks for decision beforehand.
            #feedback:
            #   00 = ok chosen
            #   01 = Cell phone number already registered/Memory full
            #   02 = no chosen
            #[96][Cell phone number]
            """
            size = 2
            #maybe this next param should be called "phone_number"
            command["number"] = ord(rom[start_address+1])
        elif command_byte == 0x98: #Call code [2b]
            info = "Call code pointing to name of caller [xxyy]"
            long_info = """
            #Displays the upper cell phone box and displays a freely selectable name.
            #[97][2byte pointer to name of caller]
            """
            size = 3
            command["caller_name_pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=False)
        elif command_byte == 0x99: #Hang-up code
            info = "Hang-up phone"
            long_info = """
            #Simulates the hanging-up.
            #[98]
            """
            size = 1
        elif command_byte == 0x9A: #Decoration code [xx]
            info = "Set monologue decoration [xx]"
            long_info = """
            #Displays monologues according to the selected ornament.
            #[99][xx]
            #xx values:
            #  00 = Map/Poster
            #  01 = Ornament left
            #  02 = Ornament right
            #  03 = Huge doll
            #  04 = Console
            """
            size = 2
            command["ornament"] = ord(rom[start_address+1])
        elif command_byte == 0x9B: #Berry tree code [xx]
            info = "Berry tree by tree id [xx]"
            long_info = """
            #Creates a typical berry tree monologue.
            #There is a maximum of 32 berry trees in the game.
            #After this code the script ends.
            #[9A][Fruit tree number]
            #Fruit tree number + 11:4091 is the offset where the item no of the berry is defined.
            """
            size = 2
            end = True
            command["tree_id"] = ord(rom[start_address+1])
        elif command_byte == 0x9C: #Cell phone call code [xx00]
            #XXX confirm this?
            info = "Cell phone call [2-byte call id]" #was originally: [call id][00]
            long_info = """
            #Initiates with the next step on a outer world map (permission byte) a phone call.
            #[9B][Call no] and maybe [00] ???
            #call no:
            #  01 = PokéRus
            #  02 = Pokémon stolen
            #  03 = Egg examined/ Assistant in Viola City
            #  04 = Team Rocket on the radio
            #  05 = PROF. ELM has got something for HIRO
            #  06 = Bike shop gives bike away
            #  07 = Mother is unhappy that HIRO didn't talk to her before leaving
            #  08 = PROF. ELM has got something for HIRO a second time
            """
            size = 3
            command["call_id"] = ord(rom[start_address+1])
            command["id"] = rom_interval(start_address+2, 2, strings=False)
        elif command_byte == 0x9D: #Check cell phone call code
            info = "Check if/which a phone call is active"
            long_info = """
            #Checks if a phone call is "in the line".
            #feedback:
            #   00 = no
            # <>00 = call number
            #[9C]
            """
            size = 1
        elif command_byte == 0x9E: #Commented give item code [xxyy]
            info = "Give item by id and quantity with 'put in pocket' text [id][qty]"
            long_info = """
            #The same as 0x1F but this code comments where
            #HIRO puts what item in a short monologue.
            #[9D][Item][Amount]
            """
            size = 3
            command["item_id"] = ord(rom[start_address+1])
            command["quantity"] = ord(rom[start_address+2])
        elif command_byte == 0x9F: #Commented ive item code?
            info = "Give item by id and quantity with 'put in pocket' text [id][qty]"
            long_info = """
            #The same as 0x1F but this code comments where
            #HIRO puts what item in a short monologue.
            #[9D][Item][Amount]
            """
            size = 3
            command["item_id"] = ord(rom[start_address+1])
            command["quantity"] = ord(rom[start_address+2])
        elif command_byte == 0xA0: #Load special wild PKMN data [xxyy]
            info = "Load wild pokemon data for a remote map [map group][map id]"
            long_info = """
            #Activates the checks in the special tables for the wild pokémon data.
            #[9E][map group][map id]
            #see also http://hax.iimarck.us/files/scriptingcodes_eng.htm#ZusatzDok3E_66ED
            """
            size = 3
            command["map_group"] = ord(rom[start_address+1])
            command["map_id"] = ord(rom[start_address+2])
        elif command_byte == 0xA1: #Hall of Fame code
            info = "Hall of Fame"
            long_info = """
            #Saves and enters HIRO's complete Team in the Hall of Fame.
            #Shows the credits and restarts the game with HIRO located in New Bark Town.
            #[9F]
            """
            size = 1
        elif command_byte == 0xA2: #Credits code
            info = "Credits"
            long_info = """
            #Shows the credits and HIRO is located on the Silver mountain plateau.
            #[A0]
            """
            size = 1
        elif command_byte == 0xA3: #Facing warp
            info = "Warp-to and set facing direction [Facing (00-03)][Map bank][Map no][X][Y]"
            long_info = """
            #Acts like code 0x3C but defines the desired facing of HIRO.
            #[A1][Facing (00-03)][Map bank][Map no][X][Y]
            """
            size = 6
            command["facing"] = ord(rom[start_address+1])
            command["map_group"] = ord(rom[start_address+2])
            command["map_id"] = ord(rom[start_address+3])
            command["x"] = ord(rom[start_address+4])
            command["y"] = ord(rom[start_address+5])
        elif command_byte == 0xA4: #MEMORY code [2b + Bank + xx]
            info = "Set memX to a string by a pointer [aabb][bank][xx]"
            long_info = """
            #MEMORY1, 2 or 3 can directly be filled with a string from
            #a different rom bank.
            #[A2][2byte pointer][Bank][00-02 MEMORY]
            """
            size = 5
            command["string_pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank="reversed")
            command["string_pointer_bank"] = ord(rom[start_address+3])
            command["memory_id"] = ord(rom[start_address+4])
        elif command_byte == 0xA5: #Display any location name [xx]
            info = "Copy the name of a location (by id) to TEMPMEMORY1"
            long_info = """
            #By the location number the name of that location is written to TEMPMEMORY1.
            #[A3][Location no]
            """
            size = 2
            command["location_number"] = ord(rom[start_address+1])
        else:
            size = 1
            #end = True
            #raise NotImplementedError, "command byte is " + hex(command_byte) + " at " + hex(offset) + " on map " + str(map_group) + "." + str(map_id)
            print "dunno what this command is: " + hex(command_byte)
        long_info = clean_up_long_info(long_info)

        if command_byte in pksv_crystal.keys():
            pksv_name = pksv_crystal[command_byte]
        else:
            pksv_name = None
            if command_byte in pksv_no_names.keys():
                pksv_no_names[command_byte].append(address)
            else:
                pksv_no_names[command_byte] = [address]

        if debug:
            print command_debug_information(command_byte=command_byte, map_group=map_group, map_id=map_id, address=offset, info=info, long_info=long_info, pksv_name=pksv_name)

        #store the size of the command
        command["size"] = size
        #the end address is just offset + size - 1 (because size includes command byte)
        offset += size - 1
        #the end address is the last byte belonging to this command
        command["last_byte_address"] = offset
        #we also add the size of the command byte to get to the next command
        offset += 1
        #add the command into the command list please
        commands[len(commands.keys())] = command

    self.commands = commands
    script_parse_table[original_start_address : offset] = self
    return True
