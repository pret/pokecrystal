#!/usr/bin/python
# -*- coding: utf-8 -*-
#author: Bryan Bishop <kanzure@gmail.com>
#date: 2012-03-04
#utilities to help disassemble pokémon crystal
import sys
from copy import copy

#table of pointers to map groups
#each map group contains some number of map headers
map_group_pointer_table = 0x94000
map_group_count = 26
map_group_offsets = []
map_header_byte_size = 9
second_map_header_byte_size = 12

#event segment sizes
warp_byte_size = 5
trigger_byte_size = 8
signpost_byte_size = 5
people_event_byte_size = 13

#a message to show with NotImplementedErrors
bryan_message = "bryan hasn't got to this yet"

#this is straight out of ../textpre.py because i'm lazy
#see jap_chars for overrides if you are in japanese mode?
chars = {
    0x50: "@",
    0x54: "#",
    0x75: "…",
    
    0x79: "┌",
    0x7A: "─",
    0x7B: "┐",
    0x7C: "│",
    0x7D: "└",
    0x7E: "┘",
    
    0x74: "№",
    
    0x7F: " ",
    0x80: "A",
    0x81: "B",
    0x82: "C",
    0x83: "D",
    0x84: "E",
    0x85: "F",
    0x86: "G",
    0x87: "H",
    0x88: "I",
    0x89: "J",
    0x8A: "K",
    0x8B: "L",
    0x8C: "M",
    0x8D: "N",
    0x8E: "O",
    0x8F: "P",
    0x90: "Q",
    0x91: "R",
    0x92: "S",
    0x93: "T",
    0x94: "U",
    0x95: "V",
    0x96: "W",
    0x97: "X",
    0x98: "Y",
    0x99: "Z",
    0x9A: "(",
    0x9B: ")",
    0x9C: ":",
    0x9D: ";",
    0x9E: "[",
    0x9F: "]",
    0xA0: "a",
    0xA1: "b",
    0xA2: "c",
    0xA3: "d",
    0xA4: "e",
    0xA5: "f",
    0xA6: "g",
    0xA7: "h",
    0xA8: "i",
    0xA9: "j",
    0xAA: "k",
    0xAB: "l",
    0xAC: "m",
    0xAD: "n",
    0xAE: "o",
    0xAF: "p",
    0xB0: "q",
    0xB1: "r",
    0xB2: "s",
    0xB3: "t",
    0xB4: "u",
    0xB5: "v",
    0xB6: "w",
    0xB7: "x",
    0xB8: "y",
    0xB9: "z",
    0xC0: "Ä",
    0xC1: "Ö",
    0xC2: "Ü",
    0xC3: "ä",
    0xC4: "ö",
    0xC5: "ü",
    0xD0: "'d",
    0xD1: "'l",
    0xD2: "'m",
    0xD3: "'r",
    0xD4: "'s",
    0xD5: "'t",
    0xD6: "'v",
    0xE0: "'",
    0xE3: "-",
    0xE6: "?",
    0xE7: "!",
    0xE8: ".",
    0xE9: "&",
    0xEA: "é",
    0xEB: "→",
    0xEF: "♂",
    0xF0: "¥",
    0xF1: "×",
    0xF3: "/",
    0xF4: ",",
    0xF5: "♀",
    0xF6: "0",
    0xF7: "1",
    0xF8: "2",
    0xF9: "3",
    0xFA: "4",
    0xFB: "5",
    0xFC: "6",
    0xFD: "7",
    0xFE: "8",
    0xFF: "9",
}

#override whatever defaults for japanese symbols
jap_chars = copy(chars)
jap_chars.update({
    0x05: "ガ",
    0x06: "ギ",
    0x07: "グ",
    0x08: "ゲ",
    0x09: "ゴ",
    0x0A: "ザ",
    0x0B: "ジ",
    0x0C: "ズ",
    0x0D: "ゼ",
    0x0E: "ゾ",
    0x0F: "ダ",
    0x10: "ヂ",
    0x11: "ヅ",
    0x12: "デ",
    0x13: "ド",
    0x19: "バ",
    0x1A: "ビ",
    0x1B: "ブ",
    0x1C: "ボ",
    0x26: "が",
    0x27: "ぎ",
    0x28: "ぐ",
    0x29: "げ",
    0x2A: "ご",
    0x2B: "ざ",
    0x2C: "じ",
    0x2D: "ず",
    0x2E: "ぜ",
    0x2F: "ぞ",
    0x30: "だ",
    0x31: "ぢ",
    0x32: "づ",
    0x33: "で",
    0x34: "ど",
    0x3A: "ば",
    0x3B: "び",
    0x3C: "ぶ",
    0x3D: "べ",
    0x3E: "ぼ",
    0x40: "パ",
    0x41: "ピ",
    0x42: "プ",
    0x43: "ポ",
    0x44: "ぱ",
    0x45: "ぴ",
    0x46: "ぷ",
    0x47: "ぺ",
    0x48: "ぽ",
    0x80: "ア",
    0x81: "イ",
    0x82: "ウ",
    0x83: "エ",
    0x84: "ォ",
    0x85: "カ",
    0x86: "キ",
    0x87: "ク",
    0x88: "ケ",
    0x89: "コ",
    0x8A: "サ",
    0x8B: "シ",
    0x8C: "ス",
    0x8D: "セ",
    0x8E: "ソ",
    0x8F: "タ",
    0x90: "チ",
    0x91: "ツ",
    0x92: "テ",
    0x93: "ト",
    0x94: "ナ",
    0x95: "ニ",
    0x96: "ヌ",
    0x97: "ネ",
    0x98: "ノ",
    0x99: "ハ",
    0x9A: "ヒ",
    0x9B: "フ",
    0x9C: "ホ",
    0x9D: "マ",
    0x9E: "ミ",
    0x9F: "ム",
    0xA0: "メ",
    0xA1: "モ",
    0xA2: "ヤ",
    0xA3: "ユ",
    0xA4: "ヨ",
    0xA5: "ラ",
    0xA6: "ル",
    0xA7: "レ",
    0xA8: "ロ",
    0xA9: "ワ",
    0xAA: "ヲ",
    0xAB: "ン",
    0xAC: "ッ",
    0xAD: "ャ",
    0xAE: "ュ",
    0xAF: "ョ",
    0xB0: "ィ",
    0xB1: "あ",
    0xB2: "い",
    0xB3: "う",
    0xB4: "え",
    0xB5: "お",
    0xB6: "か",
    0xB7: "き",
    0xB8: "く",
    0xB9: "け",
    0xBA: "こ",
    0xBB: "さ",
    0xBC: "し",
    0xBD: "す",
    0xBE: "せ",
    0xBF: "そ",
    0xC0: "た",
    0xC1: "ち",
    0xC2: "つ",
    0xC3: "て",
    0xC4: "と",
    0xC5: "な",
    0xC6: "に",
    0xC7: "ぬ",
    0xC8: "ね",
    0xC9: "の",
    0xCA: "は",
    0xCB: "ひ",
    0xCC: "ふ",
    0xCD: "へ",
    0xCE: "ほ",
    0xCF: "ま",
    0xD0: "み",
    0xD1: "む",
    0xD2: "め",
    0xD3: "も",
    0xD4: "や",
    0xD5: "ゆ",
    0xD6: "よ",
    0xD7: "ら",
    0xD8: "り",
    0xD9: "る",
    0xDA: "れ",
    0xDB: "ろ",
    0xDC: "わ",
    0xDD: "を",
    0xDE: "ん",
    0xDF: "っ",
    0xE0: "ゃ",
    0xE1: "ゅ",
    0xE2: "ょ",
    0xE3: "ー",
})

#some of the japanese characters can probably fit into the english table
#without overriding any of the other mappings.
for key, value in jap_chars.items():
    if key not in chars.keys():
        chars[key] = value

def map_name_cleaner(input):
    """generate a valid asm label for a given map name"""
    return input.replace(":", "").\
                 replace("(", "").\
                 replace(")", "").\
                 replace("'", "").\
                 replace("/", "").\
                 replace(".", "").\
                 replace("Pokémon Center", "PokeCenter").\
                 replace(" ", "")

class RomStr(str):
    """simple wrapper to prevent a giant rom from being shown on screen"""
    def __repr__(self):
        return "RomStr(too long)"

def grouper(some_list, count=2):
    """splits a list into sublists
    given: [1, 2, 3, 4]
    returns: [[1, 2], [3, 4]]"""
    return [some_list[i:i+count] for i in range(0, len(some_list), count)]

def load_rom(filename="../baserom.gbc"):
    """loads bytes into memory"""
    global rom
    file_handler = open(filename, "r")
    rom = RomStr(file_handler.read())
    file_handler.close()
    return rom

def rom_interval(offset, length, strings=True):
    """returns hex values for the rom starting at offset until offset+length"""
    global rom
    returnable = []
    for byte in rom[offset:offset+length]:
        if strings:
            returnable.append(hex(ord(byte)))
        else:
            returnable.append(ord(byte))
    return returnable

def rom_until(offset, byte, strings=True):
    """returns hex values from rom starting at offset until the given byte"""
    global rom
    return rom_interval(offset, rom.find(chr(byte), offset) - offset, strings=strings)

def load_map_group_offsets():
    """reads the map group table for the list of pointers"""
    global map_group_pointer_table, map_group_count, map_group_offsets
    global rom
    data = rom_interval(map_group_pointer_table, map_group_count*2, strings=False)
    data = grouper(data)
    for pointer_parts in data:
        pointer = pointer_parts[0] + (pointer_parts[1] << 8)
        offset = pointer - 0x4000 + map_group_pointer_table
        map_group_offsets.append(offset)
    return map_group_offsets

def calculate_bank(address):
    """you are too lazy to divide on your own?"""
    if type(address) == str:
        address = int(address, 16)
    return int(address) / 0x4000
def calculate_pointer(short_pointer, bank):
    """calculates the full address given a 4-byte pointer and bank byte"""
    short_pointer = int(short_pointer)
    bank = int(bank)
    pointer = short_pointer - 0x4000 + (bank * 0x4000)
    return pointer
def calculate_pointer_from_bytes_at(address, bank=False):
    """calculates a pointer from 2 bytes at a location
    or 3-byte pointer [bank][2-byte pointer] if bank=True"""
    if bank == True:
        bank = ord(rom[address])
        address += 1
    elif bank == False:
        bank = calculate_bank(address)
    elif bank == "reverse" or bank == "reversed":
        bank = ord(rom[address+2])
    else:
        raise "bad bank given to calculate_pointer_from_bytes_at"
    byte1 = ord(rom[address])
    byte2 = ord(rom[address+1])
    temp  = byte1 + (byte2 << 8)
    return calculate_pointer(temp, bank)

def clean_up_long_info(long_info):
    """cleans up some data from parse_script_engine_script_at formatting issues"""
    long_info = str(long_info)
    #get rid of the first newline
    if long_info[0] == "\n":
        long_info = long_info[1:]
    #get rid of the last newline and any leftover space
    if long_info.count("\n") > 0:
        if long_info[long_info.rindex("\n")+1:].isspace():
            long_info = long_info[:long_info.rindex("\n")]
        #remove spaces+hash from the front of each line
        new_lines = []
        for line in long_info.split("\n"):
            line = line.strip()
            if line[0] == "#":
                line = line[1:]
            new_lines.append(line)
        long_info = "\n".join(new_lines)
    return long_info

def command_debug_information(command_byte=None, map_group=None, map_id=None, address=None, info=None, long_info=None):
    info1 = "parsing command byte " + hex(command_byte) + " for map " + \
          str(map_group) + "." + str(map_id) + " at " + hex(address)
    info1 += "\tinfo: " + str(info)
    info1 += "\tlong_info: " + long_info
    return info1

def parse_text_engine_script_at(address):
    """parses a text-engine script ("in-text scripts")
    http://hax.iimarck.us/files/scriptingcodes_eng.htm#InText
    """
    global rom
    if rom == None:
        load_rom()
    commands = {}
    return commands

def parse_script_engine_script_at(address, map_group=None, map_id=None):
    """parses a script-engine script"""
    global rom
    if rom == None:
        load_rom()

    commands = {}
    offset = address
    end = False
    while not end:
        info, long_info, size = None, None, 0
        command_byte = ord(rom[offset])
        command = {"type": command_byte, "start_address": offset}

        #size is the total size including the command byte
        #last_byte_address is offset+size-1
        start_address = offset

        if   command_byte == 0x00: #Pointer code [2b+ret]
            info = "pointer code"
            long_info = """
            2byte pointer points to script; when pointed script ends --> return to old script
            [code][2 byte pointer]
            """
            size = 3
            start_address = offset
            last_byte_address = offset + size - 1
            command["pointer"] = calculate_pointer_from_bytes_at(start_address+1)
            #XXX should we also parse this target script?
        elif command_byte == 0x01: #Pointer code [3b+ret]
            info = "pointer code"
            long_info = """
            3byte pointer points to script; when pointed script ends --> return to old script
            [Code][resp. pointer(2byte or 3byte)]
            """
            size = 4
            info = "pointer code"
            command["pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=True)
        elif command_byte == 0x02: #Pointer code [2b+3b+ret]
            info = "pointer code"
            long_info = """
            2byte pointer points to 3byte pointer; when pointed script --> return to old script
            [Code][resp. pointer(2byte or 3byte)]
            """
            size = 3
            command["pointer"] = calculate_pointer_from_bytes_at(start_address+1)
        elif command_byte == 0x03: #Pointer code [2b]
            #XXX what does "new script is part of main script" mean?
            info = "pointer code"
            long_info = """
            2byte pointer points to script; new script is part of main script
            [Code][resp. pointer(2byte or 3byte)]
            """
            size = 3
            command["pointer"] = calculate_pointer_from_bytes_at(start_address+1)
        elif command_byte == 0x04: #Pointer code [3b]
            info = "pointer code"
            long_info = """
            3byte pointer points to script; new script is part of main script
            [Code][resp. pointer(2byte or 3byte)]
            """
            size = 4
            command["pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=True)
        elif command_byte == 0x05: #Pointer code [2b+3b]
            info = "pointer code"
            long_info = """
            2byte pointer points to 3byte pointer; new script is part of main script
            [Code][resp. pointer(2byte or 3byte)]
            """
            size = 3
            command["pointer"] = calculate_pointer_from_bytes_at(start_address+1)
        elif command_byte == 0x06: #RAM check [=byte]
            info = "RAM check [=byte]"
            long_info = """
            When the conditional is true...
            .. then go to pointed script, else resume interpreting after the pointer
            """
            size = 3
            command["pointer"] = calculate_pointer_from_bytes_at(start_address+1)
        elif command_byte == 0x07: #RAM check [<>byte]
            info = "RAM check [<>byte]"
            long_info = """
            When the conditional is true...
            .. then go to pointed script, else resume interpreting after the pointer
            """
            size = 3
            command["pointer"] = calculate_pointer_from_bytes_at(start_address+1)
        elif command_byte == 0x08: #RAM check [=0]
            info = "RAM check [=0]"
            long_info = """
            When the conditional is true...
            .. then go to pointed script, else resume interpreting after the pointer
            """
            size = 3
            command["pointer"] = calculate_pointer_from_bytes_at(start_address+1)
        elif command_byte == 0x09: #RAM check [<>0]
            info = "RAM check [<>0]"
            long_info = """
            When the conditional is true...
            .. then go to pointed script, else resume interpreting after the pointer
            """
            size = 3
            command["pointer"] = calculate_pointer_from_bytes_at(start_address+1)
        elif command_byte == 0x0A: #RAM check [<byte]
            info = "RAM check [<byte]"
            long_info = """
            When the conditional is true...
            .. then go to pointed script, else resume interpreting after the pointer
            """
            size = 3
            command["pointer"] = calculate_pointer_from_bytes_at(start_address+1)
        elif command_byte == 0x0B: #RAM check [>byte]
            info = "RAM check [>byte]"
            long_info = """
            When the conditional is true...
            .. then go to pointed script, else resume interpreting after the pointer
            """
            size = 3
            command["pointer"] = calculate_pointer_from_bytes_at(start_address+1)
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
        elif command_byte == 0x4C: #Display text [2b]
            info = "Display text by pointer [xxyy]"
            long_info = """
            #Opens a text box and writes text. Doesn't load font.
            #[4C][2byte text pointer]
            """
            size = 3
            command["pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=False)
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
            command["text_pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=False)
        elif command_byte == 0x52: #Text2 code [2b]
            info = "Display text (by pointer) and end [xxyy]"
            long_info = """
            #Displays a text. Afterwards there is no other script interpreted.
            #Corresponds to 47 + 4C + 53 + 49 + 90
            #[52][2byte textpointer]
            """
            size = 3
            end = True
            command["text_pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=False)
        elif command_byte == 0x53: #Close text box code
            info = "Close text box"
            long_info = "Closes a text box which was opened by 47 resp. 4B/4C/4D."
            size = 1
        elif command_byte == 0x54: #Keep text box open code
            info = "Keep text box open"
            long_info = "Keeps a text box open which was opened by 47 resp. 4B/4C/4D."
            size = 1
        elif command_byte == 0x55: #Pokémon picture code [xx]
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
        elif command_byte == 0x56: #Pokémon picture YES/NO code
            info = "?? Display a pokemon picture and a yes/no box"
            long_info = """
            #Displays a YES/NO box at X08/Y05.
            #feedback:
            #   00 = no chosen
            #   01 = yes chosen
            """
            size = 1
        elif command_byte == 0x57: #Menu interpreter 1
            info = "Menu interpreter 1 (see menu loader)"
            long_info = """
            #Interprets menu data loaded by 4F.
            #see also http://hax.iimarck.us/files/scriptingcodes_eng.htm#ZusatzDatA57
            """
            size = 1
        elif command_byte == 0x58: #Menu interpreter 2
            info = "Menu interpreter 2 (see menu loader)"
            long_info = """
            #Interprets menu data loaded by 4F.
            #see also http://hax.iimarck.us/files/scriptingcodes_eng.htm#Marke57
            #see also http://hax.iimarck.us/files/scriptingcodes_eng.htm#ZusatzDatA58
            """
            size = 1
        elif command_byte == 0x59: #Load Pikachu data
            info = "Load pikachu data"
            long_info = "Loads 0x19 (Pikachu) to PokéRAM and level 5 to LevelRAM."
            size = 1
        elif command_byte == 0x5A: #Delete FightRAM/reset person check
            info = "? Disable fleeing from battle"
            long_info = """
            #Deletes the value in BattleRAM.
            #Turns off the check if the battle was started by entering
            #a trainer's area of view.
            """
            size = 1
        elif command_byte == 0x5B: #Load trainer data1
            info = "Load trainer from RAM"
            long_info = """
            #Loads trainer data when HIRO is in a trainer's range of sight.
            #Trainer group is read from CF2E and written to
            #TrRAM1, the trainer number is read from CF2F and written to
            #TrRAM2. 81 is written to BattleRAM.
            """
            size = 1
        elif command_byte == 0x5C: #Load Pokémon data [xxyy]
            info = "Loads pokemon by id and level for BattleRAM [xx][yy]"
            long_info = """
            #Loads Pokémon data. Writes 80 to BattleRAM.
            #[5C][Poke no][Level]
            """
            size = 3
            command["pokemon_id"] = ord(rom[start_address+1])
            command["pokemon_level"] = ord(rom[start_address+2])
        elif command_byte == 0x5D: #Load trainer data2 [xxyy]
            info = "Load trainer by group/id for BattleRAM [xx][yy]"
            long_info = """
            #Loads trainer data. Trainer group --> TrRAM1,
            #trainer number --> TrRAM2. Writes 81 to BattleRAM.
            #[5D][Trainer group][Trainer no]
            """
            size = 3
            command["trainer_group"] = ord(rom[start_address+1])
            command["trainer_id"] = ord(rom[start_address+2])
        elif command_byte == 0x5E: #Start battle
            info = "Start pre-configured battle"
            long_info = """
            #Starts trainer or Pokémon battle. BattleRAM: 80 = Poké battle; 81 = Trainer battle.
            #feedback:
            #   00 = win
            #   01 = lose
            """
            size = 1
        elif command_byte == 0x5F: #Return to In game engine after battle
            info = "Return to in-game engine after battle"
            long_info = "Returns to ingame engine and evaluates battle. When lost then return to last Pokémon Center etc."
            size = 1
        elif command_byte == 0x60: #Learn how to catch PKMN [xx]
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
        elif command_byte == 0x61: #Trainer text code
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
        elif command_byte == 0x62: #Trainer status code [xx]
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
        elif command_byte == 0x63: #Pointer Win/Lose [2b + 2b]
            info = "Set win/lose pointers for battle [xxyy][xxyy]"
            long_info = """
            #Writes the win/lose pointer of a battle into the ram.
            #[63][2byte pointer to text Win][2byte pointer to text Loss*]
            #* When pointer = 0000 then "Blackout" instead of return to gameplay.
            """
            size = 5
            command["won_pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=False)
            command["lost_pointer"] = calculate_pointer_from_bytes_at(start_address+3, bank=False)
        elif command_byte == 0x64: #Script talk-after
            #XXX this is a really poor description of whatever this is
            info = "? Load the trainer talk-after script"
            long_info = """
            #Interprets which script is going to be run, when a in the event-structure-defined
            #trainer is talked to again.
            #see http://hax.iimarck.us/files/scriptingcodes_eng.htm#Eventaufbau
            #[64]
            """
            size = 1
        elif command_byte == 0x65: #Script talk-after-cancel
            info = "Disable/cancel trainer after-battle text"
            long_info = """
            #Cancels the talk-after script of the in the event-structure-defined
            #trainer when talk-after script is executed just after the battle.
            #[65]
            """
            size = 1
        elif command_byte == 0x66: #Script talk-after-check
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
        elif command_byte == 0x67: #Set talked-to person [xx]
            info = "Set last talked-to person [xx]"
            long_info = """
            #Sets the number of the last person talked to.
            #[67][person]
            """
            size = 2
            command["person_id"] = ord(rom[start_address+1])
        elif command_byte == 0x68: #Moving code [xx + 2b]
            info = "Move person (by id) with moving data (by pointer) [id][xxyy]"
            long_info = """
            #Moves the person using moving data.
            #[68][Person][2byte pointer to moving data]
            #see also http://hax.iimarck.us/files/scriptingcodes_eng.htm#ZusatzB68bis69
            """
            size = 4
            command["person_id"] = ord(rom[start_address+1])
            command["moving_data_pointer"] = calculate_pointer_from_bytes_at(start_address+2, bank=False)
        elif command_byte == 0x69: #Moving code for talked-to person [2b]
            info = "Move talked-to person with moving data (by pointer) [xxyy]"
            long_info = """
            #Moves talked-to person using moving data.
            #[69][2byte pointer to moving data]
            """
            size = 3
            command["moving_data_pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=False)
        elif command_byte == 0x6A: #Talk-to facing code
            info = "Move talked-to person's facing direction to HIRO"
            long_info = """
            #Turns the heads of the talked-to persons to HIRO.
            #[6A]
            """
            size = 1
        elif command_byte == 0x6B: #Facing of people code [xxyy]
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
        elif command_byte == 0x6C: #Variable sprites [xxyy]
            info = "Store value in variable sprite RAM location x by id Y [xx][yy]"
            long_info = """
            #Writes a number to the variable sprite RAM from D555 to D564 (see Compendium on the sprite system).
            #[6C][xx][Sprite no]
            #xx: Number between 0x00 and 0x0F
            """
            size = 3
            command["number"] = ord(rom[start_address+1])
            command["sprite_id"] = ord(rom[start_address+2])
        elif command_byte == 0x6D: #Hide person [xx]
            info = "Hide person by id [xx]"
            long_info = """
            #Hides a person.
            #[6D][person id]
            """
            size = 2
            command["person_id"] = ord(rom[start_address+1])
        elif command_byte == 0x6E: #Show person [xx]
            info = "Show person by id [xx]"
            long_info = """
            #Shows a hidden person again.
            #[6E][person id]
            """
            size = 2
            command["person_id"] = ord(rom[start_address+1])
        elif command_byte == 0x6F: #Following code1 [xxyy]
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
        elif command_byte == 0x70: #Stop following code
            info = "Stop all follow code"
            long_info = "Ends all current follow codes."
            size = 1
        elif command_byte == 0x71: #Move person [xxyyzz]
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
        elif command_byte == 0x72: #Write person location [xx] (lock person location?)
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
        elif command_byte == 0x73: #Load emoticons [xx]
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
        elif command_byte == 0x74: #Display emoticon [xxyyzz]
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
        elif command_byte == 0x75: #Change facing [xxyy]
            info = "Set facing direction of person [person][facing]"
            long_info = """
            #Changes the facing direction of a person.
            #[75][person][facing]
            """
            size = 3
            command["person_id"] = ord(rom[start_address+1])
            command["facing"] = ord(rom[start_address+2])
        elif command_byte == 0x76: #Following code2 [xxyy]
            info = "Following code2 [leader id][follower id]"
            long_info = """
            #A person1 follows a person2. The following person1 automatically clings to person2.
            #Person1 just follows person2, but doesn't make the exact same movements at person2.
            #[76][Leader Person2][Follower Person1]
            """
            size = 3
            command["leader_person_id"] = ord(rom[start_address+1])
            command["follower_person_id"] = ord(rom[start_address+2])
        elif command_byte == 0x77: #Earth quake [xx]
            info = "Earthquake [xx]"
            long_info = """
            #The screen shakes. xx gives time as well as displacement of the screen.
            #[77][xx]
            """
            size = 2
            command["shake_byte"] = ord(rom[start_address+1])
        elif command_byte == 0x78: #Exchange map [3b]
            info = "Draw map data over current map [bank][pointer]"
            long_info = """
            #This code draws another whole map as wide and high as the
            #current map over the current map.
            #The 3byte pointer points to the new map.
            #[78][3byte pointer to new map data]
            """
            size = 4
            command["map_data_pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=True)
        elif command_byte == 0x79: #Change block code [xxyyzz]
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
        elif command_byte == 0x7A: #Reload map code
            info = "Reload/redisplay map"
            long_info = """
            #Reloads and re-displays the map completely.
            #Loads tileset and all map data anew. Screen gets light.
            #[7A]
            """
            size = 1
        elif command_byte == 0x7B: #Reload map part code
            info = "Reload/redisplay map portion occupied by HIRO"
            long_info = """
            #Reloads and re-displays the part of the map HIRO is on,
            #without reloading any other map data or the tileset.
            #[7B]
            """
            size = 1
        elif command_byte == 0x7C: #Write command queue
            info = "Write command queue [xxyy]"
            long_info = """
            #Writes a command queue to the next free slot in ram.
            #Max 4 command queues à 5 bytes. This code is buggy (bug fix: 25:7C74 --> 12).
            #[7C][2byte pointer to 5byte command queue]
            #see http://hax.iimarck.us/files/scriptingcodes_eng.htm#ZusatzDok25_7CC9
            """
            size = 3
            command["command_queue_pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=False)
        elif command_byte == 0x7D: #Delete command queue
            info = "Delete command queue"
            long_info = """
            #Deletes a command queue and frees a slot in ram.
            #[7D][First command of the resp. queue]
            """
            #XXX wtf?
            size = 2
            command["first_command"] = ord(rom[start_address+1])
        elif command_byte == 0x7E: #Song code1 [xxyy]
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
        elif command_byte == 0x7F: #Song code2
            info = "Song code2"
            long_info = """
            #Plays the music of the trainer group in TrRAM1.
            #Takes music numbers from list at 3A:5027.
            #[7F]
            """
            size = 1
        elif command_byte == 0x80: #Music fade-out code [xxyy][zz]
            info = "Music fade-out then play next [xxyy][time]"
            long_info = """
            #The current music is faded out and the new music is played afterwards.
            #[80][Music no (2byte)][Time to fade out (00-7F)]
            """
            size = 4
            command["music_number"] = rom_interval(start_address+1, 2, strings=False)
            command["fade_time"] = ord(rom[start_address+3])
        elif command_byte == 0x81: #Play map music code
            info = "Play map's music"
            long_info = """
            #Starts playing the original map music.
            #Includes special check for surfer and bug contest song.
            #[81]
            """
            size = 1
        elif command_byte == 0x82: #Map reload music code
            info = "Reload map music"
            long_info = """
            #After a map reload no music is played.
            #[82]
            """
            size = 1
        elif command_byte == 0x83: #Cry code [xx00]
            info = "Play cry by id or RAM [cry][00]"
            long_info = """
            #Plays the Pokémon's cry.
            #[83][Cry no][00]
            #If the cry no = 00 then the number is taken from RAM.
            """
            size = 3
            command["cry_number"] = ord(rom[start_address+1])
            command["other_byte"] = ord(rom[start_address+2])
        elif command_byte == 0x84: #Sound code [xxyy]
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
        elif command_byte == 0x85: #Key-down code
            info = "Wait for key-down"
            long_info = """
            #Waits for the Player to press a button.
            #[85]
            """
            size = 1
        elif command_byte == 0x86: #Warp sound
            info = "Warp sound"
            long_info = """
            #Evaluates which sound is played when HIRO enters a Warp field.
            #Usage via script ingame is rather not useful.
            #[86]
            """
            size = 1
        elif command_byte == 0x87: #Special sound
            info = "Special sound if TM was last checked"
            long_info = """
            #When last given/checked Item was a TM then it plays sound 0x9B. If not, then 0x01.
            #[87]
            """
            size = 1
        elif command_byte == 0x88: #Engine remote control [2b]
            info = "Engine remote control [bb][xxyy]"
            long_info = """
            #This code controls the engine via "data stream".
            #[88][3byte pointer to control structure]
            #see http://hax.iimarck.us/files/scriptingcodes_eng.htm#ZusatzDatA88
            """
            size = 4
            command["data_stream_pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=True)
        elif command_byte == 0x89: #Load map anew [xx]
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
        elif command_byte == 0x8A: #Waiting code [xx]
            info = "Wait code"
            long_info = """
            #This code lets the game wait for 2 * xx time intervals.
            #[8A][xx]
            #xx: Numbers from 0x01 to 0xFF.
            #If 0x00 is chosen then the time can be manipulated by previously loading a number to RAM2.
            """
            size = 2
            command["time"] = ord(rom[start_address+1])
        elif command_byte == 0x8B: #Deactivate static facing [xx]
            info = "Deactive static facing after time [xx]"
            long_info = """
            #Deactivates static facings on all persons on the screen after a time xx.
            #[8B][xx]
            """
            size = 2
            command["time"] = ord(rom[start_address+1])
        elif command_byte == 0x8C: #Priority jump1 [2b]
            info = "Priority jump to script by pointer [xxyy]"
            long_info = """
            #The pointer acts like code 00, but with this higher
            #functions like the bike etc. are not paid attention to,
            #while the script is running.
            #[8C][2byte pointer to script]
            """
            size = 3
            command["script_pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=False)
        elif command_byte == 0x8D: #Warp check
            info = "Reactive all engine checks if player is warping"
            long_info = """
            #If HIRO is entering or leaving a warp then this code reactivates all the engine-checks.
            #[8D]
            """
            size = 1
        elif command_byte == 0x8E: #Priority jump2 [2b]
            info = "Priority jump to script by pointer (after 1st cycle) [xxyy]"
            long_info = """
            #The pointer acts like code 03, but with this code all
            #higher functions wait for a cycle before the script gets interpreted.
            #[8E][2byte pointer to script]
            """
            size = 3
            command["script_pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=False)
        elif command_byte == 0x8F: #Return code1
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
        elif command_byte == 0x90: #Return code2
            info = "Return code 2"
            long_info = """
            #Ends the current script and loads the backup offset for "linked"
            #scripts if applicable.  The sophisticated functions get reset if
            #no backup offset was loaded. This code is used to end most scripts.
            #[90]
            """
            size = 1
            end = True
        elif command_byte == 0x91: #Return code3
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
        elif command_byte == 0x92: #Reset sophisticated functions
            info = "Reset sophisticated functions"
            long_info = """
            #Resets all sophisticated functions to 0.
            #[92]
            """
            size = 1
        elif command_byte == 0x93: #Mart menu [xxyyzz]
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
        elif command_byte == 0x94: #Elevator menu [2b]
            info = "Display elevator menu by pointer [xxyy]"
            long_info = """
            #Displays a whole elevator menu, but it doesn't load font to ram.
            #Only works with warps with warp-to = 0xFF.
            #[94][2byte pointer to floor list]
            """
            size = 3
            command["floor_list_pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=False)
        elif command_byte == 0x95: #Trade menu [xx]
            info = "Display trade menu by trade id [xx]"
            long_info = """
            #Displays a whole trade menu, but it doesn't load font to ram.
            #[95][trade no]
            #see http://hax.iimarck.us/files/scriptingcodes_eng.htm#ZusatzDokTausch
            """
            size = 2
            command["trade_number"] = ord(rom[start_address+1])
        elif command_byte == 0x96: #Give cell phone number with YES/NO [xx]
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
        elif command_byte == 0x97: #Call code [2b]
            info = "Call code pointing to name of caller [xxyy]"
            long_info = """
            #Displays the upper cell phone box and displays a freely selectable name.
            #[97][2byte pointer to name of caller]
            """
            size = 3
            command["caller_name_pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=False)
        elif command_byte == 0x98: #Hang-up code
            info = "Hang-up phone"
            long_info = """
            #Simulates the hanging-up.
            #[98]
            """
            size = 1
        elif command_byte == 0x99: #Decoration code [xx]
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
        elif command_byte == 0x9A: #Berry tree code [xx]
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
        elif command_byte == 0x9B: #Cell phone call code [xx00]
            info = "Cell phone call [call id][00]"
            long_info = """
            #Initiates with the next step on a outer world map (permission byte) a phone call.
            #[9B][Call no][00]
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
            command["byte"] = ord(rom[start_address+2])
        elif command_byte == 0x9C: #Check cell phone call code
            info = "Check if/which a phone call is active"
            long_info = """
            #Checks if a phone call is "in the line".
            #feedback:
            #   00 = no
            # <>00 = call number
            #[9C]
            """
            size = 1
        elif command_byte == 0x9D: #Commented give item code [xxyy]
            info = "Give item by id and quantity with 'put in pocket' text [id][qty]"
            long_info = """
            #The same as 0x1F but this code comments where
            #HIRO puts what item in a short monologue.
            #[9D][Item][Amount]
            """
            size = 3
            command["item_id"] = ord(rom[start_address+1])
            command["quantity"] = ord(rom[start_address+2])
        elif command_byte == 0x9E: #Load special wild PKMN data [xxyy]
            info = "Load wild pokemon data for a remote map [map group][map id]"
            long_info = """
            #Activates the checks in the special tables for the wild pokémon data.
            #[9E][map group][map id]
            #see also http://hax.iimarck.us/files/scriptingcodes_eng.htm#ZusatzDok3E_66ED
            """
            size = 3
            command["map_group"] = ord(rom[start_address+1])
            command["map_id"] = ord(rom[start_address+2])
        elif command_byte == 0x9F: #Hall of Fame code
            info = "Hall of Fame"
            long_info = """
            #Saves and enters HIRO's complete Team in the Hall of Fame.
            #Shows the credits and restarts the game with HIRO located in New Bark Town.
            #[9F]
            """
            size = 1
        elif command_byte == 0xA0: #Credits code
            info = "Credits"
            long_info = """
            #Shows the credits and HIRO is located on the Silver mountain plateau.
            #[A0]
            """
            size = 1
        elif command_byte == 0xA1: #Facing warp
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
        elif command_byte == 0xA2: #MEMORY code [2b + Bank + xx]
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
        elif command_byte == 0xA3: #Display any location name [xx]
            info = "Copy the name of a location (by id) to TEMPMEMORY1"
            long_info = """
            #By the location number the name of that location is written to TEMPMEMORY1.
            #[A3][Location no]
            """
            size = 2
            command["location_number"] = ord(rom[start_address+1])
        else:
            end = True
            #raise NotImplementedError, "command byte is " + hex(command_byte) + " at " + hex(offset) + " on map " + str(map_group) + "." + str(map_id)
        long_info = clean_up_long_info(long_info)
        print command_debug_information(command_byte=command_byte, map_group=map_group, map_id=map_id, address=offset, info=info, long_info=long_info)
        
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
    return commands

def parse_warp_bytes(some_bytes):
    """parse some number of warps from the data"""
    assert len(some_bytes) % warp_byte_size == 0, "wrong number of bytes"
    warps = []
    for bytes in grouper(some_bytes, count=warp_byte_size):
        y = int(bytes[0], 16)
        x = int(bytes[1], 16)
        warp_to = int(bytes[2], 16)
        map_group = int(bytes[3], 16)
        map_id = int(bytes[4], 16)
        warps.append({
            "y": y,
            "x": x,
            "warp_to": warp_to,
            "map_group": map_group,
            "map_id": map_id,
        })
    return warps
def parse_xy_trigger_bytes(some_bytes, bank=None, map_group=None, map_id=None):
    """parse some number of triggers from the data"""
    assert len(some_bytes) % trigger_byte_size == 0, "wrong number of bytes"
    triggers = []
    for bytes in grouper(some_bytes, count=trigger_byte_size):
        trigger_number = int(bytes[0], 16)
        y = int(bytes[1], 16)
        x = int(bytes[2], 16)
        unknown1 = int(bytes[3], 16) #XXX probably 00?
        script_ptr_byte1 = int(bytes[4], 16)
        script_ptr_byte2 = int(bytes[5], 16)
        script_ptr = script_ptr_byte1 + (script_ptr_byte2 << 8)
        script_address = None
        script = None
        if bank:
            script_address = calculate_pointer(script_ptr, bank)
            print "******* parsing xy trigger byte scripts... x=" + str(x) + " y=" + str(y)
            script = parse_script_engine_script_at(script_address, map_group=map_group, map_id=map_id)
        
        triggers.append({
            "trigger_number": trigger_number,
            "y": y,
            "x": x,
            "unknown1": unknown1, #probably 00
            "script_ptr": script_ptr,
            "script_pointer": {"1": script_ptr_byte1, "2": script_ptr_byte2},
            "script_address": script_address,
            "script": script,
        })
    return triggers
def parse_signpost_bytes(some_bytes, bank=None, map_group=None, map_id=None):
    """parse some number of signposts from the data

    [Y position][X position][Function][Script pointer (2byte)]

    functions:
        00      Sign can be read from all directions
                script pointer to: script
        01      Sign can only be read from below
                script pointer to: script
        02      Sign can only be read from above
                script pointer to: script
        03      Sign can only be read from right
                script pointer to: script
        04      Sign can only be read from left
                script pointer to: script
        05      If bit of BitTable1 is set then pointer is interpreted
                script pointer to: [Bit-Nr. (2byte)][2byte pointer to script]
        06      If bit of BitTable1 is not set then pointer is interpreted
                script pointer to: [Bit-Nr. (2byte)][2byte pointer to script]
        07      If bit of BitTable1 is set then item is given
                script pointer to: [Bit-Nr. (2byte)][Item no.]
        08      No Action
                script pointer to: [Bit-Nr. (2byte)][??]
    """
    assert len(some_bytes) % signpost_byte_size == 0, "wrong number of bytes"
    signposts = []
    for bytes in grouper(some_bytes, count=signpost_byte_size):
        y = int(bytes[0], 16)
        x = int(bytes[1], 16)
        func = int(bytes[2], 16)
        script_ptr_byte1 = int(bytes[3], 16)
        script_ptr_byte2 = int(bytes[4], 16)
        script_pointer = script_ptr_byte1 + (script_ptr_byte2 << 8)
        script_address = None
        script = None
        if bank:
            print "******* parsing signpost script.. signpost is at: x=" + str(x) + " y=" + str(y)
            script_address = calculate_pointer(script_pointer, bank)
            script = parse_script_engine_script_at(script_address, map_group=map_group, map_id=map_id)
        signposts.append({
            "y": y,
            "x": x,
            "func": func,
            "script_ptr": script_pointer,
            "script_pointer": {"1": script_ptr_byte1, "2": script_ptr_byte2},
            "script_address": script_address,
            "script": script,
        })
    return signposts
def parse_people_event_bytes(some_bytes, address=None, map_group=None, map_id=None): #max of 14 people per map?
    """parse some number of people-events from the data
    see http://hax.iimarck.us/files/scriptingcodes_eng.htm#Scripthdr

    For example, map 1.1 (group 1 map 1) has four person-events.
    
        37 05 07 06 00 FF FF 00 00 02 40 FF FF
        3B 08 0C 05 01 FF FF 00 00 05 40 FF FF
        3A 07 06 06 00 FF FF A0 00 08 40 FF FF
        29 05 0B 06 00 FF FF 00 00 0B 40 FF FF
    """
    assert len(some_bytes) % people_event_byte_size == 0, "wrong number of bytes"

    #address is not actually required for this function to work...
    bank = None
    if address:
        bank = calculate_bank(address)

    people_events = []
    for bytes in grouper(some_bytes, count=people_event_byte_size):
        pict = int(bytes[0], 16)
        y = int(bytes[1], 16)    #y from top + 4
        x = int(bytes[2], 16)    #x from left + 4
        face = int(bytes[3], 16) #0-4 for regular, 6-9 for static facing
        move = int(bytes[4], 16)
        clock_time_byte1 = int(bytes[5], 16)
        clock_time_byte2 = int(bytes[6], 16)
        color_function_byte = int(bytes[7], 16) #Color|Function
        trainer_sight_range = int(bytes[8], 16)
        
        #goldmap called these next two bytes "text_block" and "text_bank"?
        script_pointer_byte1 = int(bytes[9], 16)
        script_pointer_byte2 = int(bytes[10], 16)
        script_pointer = script_pointer_byte1 + (script_pointer_byte2 << 8)
        #calculate the full address by assuming it's in the current bank
        #but what if it's not in the same bank?
        script_address = None
        script = None
        if bank:
            print "parsing a person-script at x=" + str(x) + " y=" + str(y)
            script_address = calculate_pointer(script_pointer, bank)
            script = parse_script_engine_script_at(script_address, map_group=map_group, map_id=map_id)

        #take the script pointer

        #XXX not sure what's going on here
        #bit no. of bit table 1 (hidden if set)
        #note: FFFF for none
        when_byte = int(bytes[11], 16)
        hide = int(bytes[12], 16)

        people_events.append({
            "pict": pict,
            "y": y,                      #y from top + 4
            "x": x,                      #x from left + 4
            "face": face,                #0-4 for regular, 6-9 for static facing
            "move": move,
            "clock_time": {"1": clock_time_byte1,
                           "2": clock_time_byte2},       #clock/time setting byte 1
            "color_function_byte": color_function_byte,  #Color|Function
            "trainer_sight_range": trainer_sight_range,  #trainer range of sight
            "script_pointer": {"1": script_pointer_byte1,
                               "2": script_pointer_byte2},
            "script_address": script_address,
            "script": script,            #parsed script.. hah!
            #"text_block": text_block,   #script pointer byte 1
            #"text_bank": text_bank,     #script pointer byte 2
            "when_byte": when_byte,      #bit no. of bit table 1 (hidden if set)
            "hide": hide,                #note: FFFF for none
        })
    return people_events

class MapEventElement():
    def __init__(self, *args, **kwargs):
        if len(args) == 1:
            if isinstance(args[0], list):
                if len(args[0]) != self.__class__.standard_size:
                    raise "input has the wrong size"
                #convert all of the list elements to integers
                ints = []
                for byte in args[0]:
                    ints.append(int(byte, 16))
                #parse using the class default method
                events = self.__class__.parse_func(ints)
                for key, value in events[0]:
                    setattr(self, key, value)
            else:
                raise "dunno how to handle this positional input"
        elif len(kwargs.keys()) != 0:
            for key, value in kwargs.items():
                setattr(self, key, value)
        else:
            raise "dunno how to handle given input"
class Warp(MapEventElement):
    standard_size = warp_byte_size
    parse_func    = parse_warp_bytes
class Trigger(MapEventElement):
    standard_size = trigger_byte_size
    parse_func    = parse_xy_trigger_bytes
class Signpost(MapEventElement):
    standard_size = signpost_byte_size
    parse_func    = parse_signpost_bytes
class PeopleEvent(MapEventElement):
    standard_size = people_event_byte_size
    parse_func    = parse_people_event_bytes

def parse_map_header_at(address, map_group=None, map_id=None):
    """parses an arbitrary map header at some address"""
    bytes = rom_interval(address, map_header_byte_size, strings=False)
    bank = bytes[0]
    tileset = bytes[1]
    permission = bytes[2]
    second_map_header_address = calculate_pointer(bytes[3] + (bytes[4] << 8), 0x25)
    location_on_world_map = bytes[5] #pokégear world map location
    music = bytes[6]
    time_of_day = bytes[7]
    fishing_group = bytes[8]

    map_header = {
        "bank": bank,
        "tileset": tileset,
        "permission": permission, #map type?
        "second_map_header_pointer": {"1": bytes[3], "2": bytes[4]},
        "second_map_header_address": second_map_header_address,
        "location_on_world_map": location_on_world_map, #area
        "music": music,
        "time_of_day": time_of_day,
        "fishing": fishing_group,
    }
    map_header.update(parse_second_map_header_at(second_map_header_address))
    map_header.update(parse_map_event_header_at(map_header["event_address"], map_group=map_group, map_id=map_id))
    #maybe this next one should be under the "scripts" key?
    map_header.update(parse_map_script_header_at(map_header["script_address"], map_group=map_group, map_id=map_id))
    return map_header

def parse_second_map_header_at(address, map_group=None, map_id=None):
    """each map has a second map header"""
    bytes = rom_interval(address, second_map_header_byte_size, strings=False)
    border_block = bytes[0]
    height = bytes[1]
    width = bytes[2]
    blockdata_bank = bytes[3]
    blockdata_pointer = bytes[4] + (bytes[5] << 8)
    blockdata_address = calculate_pointer(blockdata_pointer, blockdata_bank)
    script_bank = bytes[6]
    script_pointer = bytes[7] + (bytes[8] << 8)
    script_address = calculate_pointer(script_pointer, script_bank)
    event_bank = script_bank
    event_pointer = bytes[9] + (bytes[10] << 8)
    event_address = calculate_pointer(event_pointer, event_bank)
    connections = bytes[11]
    return {
        "border_block": border_block,
        "height": height,
        "width": width,
        "blockdata_bank": blockdata_bank,
        "blockdata_pointer": {"1": bytes[4], "2": bytes[5]},
        "blockdata_address": blockdata_address,
        "script_bank": script_bank,
        "script_pointer": {"1": bytes[7], "2": bytes[8]},
        "script_address": script_address,
        "event_bank": event_bank,
        "event_pointer": {"1": bytes[9], "2": bytes[10]},
        "event_address": event_address,
        "connections": connections,
    }

def parse_map_event_header_at(address, map_group=None, map_id=None):
    """parse crystal map event header byte structure thing"""
    returnable = {}

    bank = calculate_bank(address)

    print "event header address is: " + hex(address)
    filler1 = ord(rom[address])
    filler2 = ord(rom[address+1])
    returnable.update({"1": filler1, "2": filler2})
    
    #warps
    warp_count = ord(rom[address+2])
    warp_byte_count = warp_byte_size * warp_count
    warps = rom_interval(address+3, warp_byte_count)
    after_warps = address + 3 + warp_byte_count
    returnable.update({"warp_count": warp_count, "warps": parse_warp_bytes(warps)})
    
    #triggers (based on xy location)
    trigger_count = ord(rom[after_warps])
    trigger_byte_count = trigger_byte_size * trigger_count
    triggers = rom_interval(after_warps+1, trigger_byte_count)
    after_triggers = after_warps + 1 + trigger_byte_count
    returnable.update({"xy_trigger_count": trigger_count, "xy_triggers": parse_xy_trigger_bytes(triggers, bank=bank, map_group=map_group, map_id=map_id)})
    
    #signposts
    signpost_count = ord(rom[after_triggers])
    signpost_byte_count = signpost_byte_size * signpost_count
    signposts = rom_interval(after_triggers+1, signpost_byte_count)
    after_signposts = after_triggers + 1 + signpost_byte_count
    returnable.update({"signpost_count": signpost_count, "signposts": parse_signpost_bytes(signposts, bank=bank, map_group=map_group, map_id=map_id)})
  
    print "skipping event data... (oops)"
    #raise NotImplementedError, "holy mother of god"
    #XXX parse trainer data too.. this changes the structure of people events...
    #people events
    #people_event_count = ord(rom[after_signposts])
    #people_event_byte_count = people_event_byte_size * people_event_count
    #people_events = rom_interval(after_signposts+1, people_event_byte_count)
    #returnable.update({"people_event_count": people_event_count, "people_events": parse_people_event_bytes(people_events, address=after_signposts+1, map_group=map_group, map_id=map_id)})

    return returnable

def parse_map_script_header_at(address, map_group=None, map_id=None):
    """parses a script header
    
    This structure allows the game to have e.g. one-time only events on a map
    or first enter events or permanent changes to the map or permanent script
    calls.

    This header a combination of a trigger script section and a callback script
    section. I don't know if these 'trigger scripts' are the same as the others
    referenced in the map event header, so this might need to be renamed very
    soon.

    trigger scripts: 
    [[Number1 of pointers] Number1 * [2byte pointer to script][00][00]]

    callback scripts:
    [[Number2 of pointers] Number2 * [hook number][2byte pointer to script]]

    hook byte choices:
        01 - map data has already been loaded to ram, tileset and sprites still missing
            map change (3rd step)
            loading (2nd step)
            map connection (3rd step)
            after battle (1st step)
        02 - map data, tileset and sprites are all loaded
            map change (5th step)
        03 - neither map data not tilesets nor sprites are loaded
            map change (2nd step)
            loading (1st step)
            map connection (2nd step)
        04 - map data and tileset loaded, sprites still missing
            map change (4th step)
            loading (3rd step)
            sprite reload (1st step)
            map connection (4th step)
            after battle (2nd step)
        05 - neither map data not tilesets nor sprites are loaded
            map change (1st step)
            map connection (1st step)

    When certain events occur, the call backs will be called in this order (same info as above):
        map change:
            05, 03, 01, 04, 02
        loading:
            03, 01, 04
        sprite reload:
            04
        map connection:
            05, 03, 01, 04 note that #2 is not called (unlike "map change")
        after battle:
            01, 04
    """
    #[[Number1 of pointers] Number1 * [2byte pointer to script][00][00]]
    ptr_line_size = 4 #[2byte pointer to script][00][00]
    trigger_ptr_cnt = ord(rom[address])
    trigger_pointers = grouper(rom_interval(address+1, trigger_ptr_cnt * ptr_line_size, strings=False), count=ptr_line_size)
    triggers = {}
    for index, trigger_pointer in enumerate(trigger_pointers):
        byte1 = trigger_pointer[0]
        byte2 = trigger_pointer[1]
        ptr   = byte1 + (byte2 << 8)
        trigger_address = calculate_pointer(ptr, calculate_bank(address))
        trigger_script  = parse_script_engine_script_at(trigger_address, map_group=map_group, map_id=map_id)
        triggers[index] = {
            "script": trigger_script,
            "address": trigger_address,
            "pointer": {"1": byte1, "2": byte2},
        }
    
    #bump ahead in the byte stream
    address += trigger_ptr_cnt * ptr_line_size + 1
    
    #[[Number2 of pointers] Number2 * [hook number][2byte pointer to script]]
    callback_ptr_line_size = 3
    callback_ptr_cnt = ord(rom[address])
    callback_ptrs = grouper(rom_interval(address+1, callback_ptr_cnt * callback_ptr_line_size, strings=False), count=callback_ptr_line_size)
    callback_pointers = {}
    callbacks = {}
    for index, callback_line in enumerate(callback_ptrs):
        hook_byte = callback_line[0] #1, 2, 3, 4, 5
        callback_byte1 = callback_line[1]
        callback_byte2 = callback_line[2]
        callback_ptr = callback_byte1 + (callback_byte2 << 8)
        callback_address = calculate_pointer(callback_ptr, calculate_bank(address))
        callback_script = parse_script_engine_script_at(callback_address)
        callback_pointers[len(callback_pointers.keys())] = [hook_byte, callback_ptr]
        callbacks[index] = {
            "script": callback_script,
            "address": callback_address,
            "pointer": {"1": callback_byte1, "2": callback_byte2},
        }
    
    #XXX do these triggers/callbacks call asm or script engine scripts?
    return {
        #"trigger_ptr_cnt": trigger_ptr_cnt,
        "trigger_pointers": trigger_pointers,
        #"callback_ptr_cnt": callback_ptr_cnt,
        #"callback_ptr_scripts": callback_ptrs,
        "callback_pointers": callback_pointers,
        "trigger_scripts": triggers,
        "callback_scripts": callbacks,
    }

def parse_all_map_headers():
    """calls parse_map_header_at for each map in each map group"""
    global map_names
    if not map_names[1].has_key("offset"):
        raise "dunno what to do - map_names should have groups with pre-calculated offsets by now"
    for group_id, group_data in map_names.items():
        offset = group_data["offset"]
        #we only care about the maps
        del group_data["offset"]
        for map_id, map_data in group_data.items():
            map_header_offset = offset + ((map_id - 1) * map_header_byte_size)
            print "map_group is: " + str(group_id) + "  map_id is: " + str(map_id)
            parsed_map = parse_map_header_at(map_header_offset, map_group=group_id, map_id=map_id)
            map_names[group_id][map_id].update(parsed_map)
            map_names[group_id][map_id]["header_offset"] = map_header_offset

#map names with no labels will be generated at the end of the structure 
map_names = {
    1: {
        0x1: {"name": "Olivine Pokémon Center 1F",
              "label": "OlivinePokeCenter1F"},
        0x2: {"name": "Olivine Gym"},
        0x3: {"name": "Olivine Voltorb House"},
        0x4: {"name": "Olivine House Beta"},
        0x5: {"name": "Olivine Punishment Speech House"},
        0x6: {"name": "Olivine Good Rod House"},
        0x7: {"name": "Olivine Cafe"},
        0x8: {"name": "Olivine Mart"},
        0x9: {"name": "Route 38 Ecruteak Gate"},
        0xA: {"name": "Route 39 Barn"},
        0xB: {"name": "Route 39 Farmhouse"},
        0xC: {"name": "Route 38"},
        0xD: {"name": "Route 39"},
        0xE: {"name": "Olivine City"},
       },
    2: {
        0x1: {"name": "Mahogany Red Gyarados Speech House"},
        0x2: {"name": "Mahogany Gym"},
        0x3: {"name": "Mahogany Pokémon Center 1F",
              "label": "MahoganyPokeCenter1F"},
        0x4: {"name": "Route 42 Ecruteak Gate"},
        0x5: {"name": "Route 42"},
        0x6: {"name": "Route 44"},
        0x7: {"name": "Mahogany Town"},
    },
    3: {
        0x1: {"name": "Sprout Tower 1F"},
        0x2: {"name": "Sprout Tower 2F"},
        0x3: {"name": "Sprout Tower 3F"},
        0x4: {"name": "Tin Tower 1F"},
        0x5: {"name": "Tin Tower 2F"},
        0x6: {"name": "Tin Tower 3F"},
        0x7: {"name": "Tin Tower 4F"},
        0x8: {"name": "Tin Tower 5F"},
        0x9: {"name": "Tin Tower 6F"},
        0xA: {"name": "Tin Tower 7F"},
        0xB: {"name": "Tin Tower 8F"},
        0xC: {"name": "Tin Tower 9F"},
        0xD: {"name": "Bured Tower 1F"},
        0xE: {"name": "Burned Tower B1F"},
        0xF: {"name": "National Park"},
        0x10: {"name": "National Park Bug Contest"},
        0x11: {"name": "Radio Tower 1F"},
        0x12: {"name": "Radio Tower 2F"},
        0x13: {"name": "Radio Tower 3F"},
        0x14: {"name": "Radio Tower 4F"},
        0x15: {"name": "Radio Tower 5F"},
        0x16: {"name": "Ruins of Alph Outside"},
        0x17: {"name": "Ruins of Alph Ho-oh Chamber"},
        0x18: {"name": "Ruins of Alph Kabuto Chamber"},
        0x19: {"name": "Ruins of Alph Omanyte Chamber"},
        0x1A: {"name": "Ruins of Alph Aerodactyl Chamber"},
        0x1B: {"name": "Ruins of Alph Inner Chamber"},
        0x1C: {"name": "Ruins of Alph Research Center"},
        0x1D: {"name": "Ruins of Alph Ho-oh Item Room"},
        0x1E: {"name": "Ruins of Alph Kabuto Item Room"},
        0x1F: {"name": "Ruins of Alph Omanyte Item Room"},
        0x20: {"name": "Ruins of Alph Aerodactyl Item Room"},
        0x21: {"name": "Ruins of Alph Ho-Oh Word Room"},
        0x22: {"name": "Ruins of Alph Kabuto Word Room"},
        0x23: {"name": "Ruins of Alph Omanyte Word Room"},
        0x24: {"name": "Ruins of Alph Aerodactyl Word Room"},
        0x25: {"name": "Union Cave 1F"},
        0x26: {"name": "Union Cave B1F"},
        0x27: {"name": "Union Cave B2F"},
        0x28: {"name": "Slowpoke Well B1F"},
        0x29: {"name": "Slowpoke Well B2F"},
        0x2A: {"name": "Olivine Lighthouse 1F"},
        0x2B: {"name": "Olivine Lighthouse 2F"},
        0x2C: {"name": "Olivine Lighthouse 3F"},
        0x2D: {"name": "Olivine Lighthouse 4F"},
        0x2E: {"name": "Olivine Lighthouse 5F"},
        0x2F: {"name": "Olivine Lighthouse 6F"},
        0x30: {"name": "Mahogany Mart 1F"},
        0x31: {"name": "Team Rocket Base B1F"},
        0x32: {"name": "Team Rocket Base B2F"},
        0x33: {"name": "Team Rocket Base B3F"},
        0x34: {"name": "Ilex Forest"},
        0x35: {"name": "Warehouse Entrance"},
        0x36: {"name": "Underground Path Switch Room Entrances"},
        0x37: {"name": "Goldenrod Dept Store B1F"},
        0x38: {"name": "Underground Warehouse"},
        0x39: {"name": "Mount Mortar 1F Outside"},
        0x3A: {"name": "Mount Mortar 1F Inside"},
        0x3B: {"name": "Mount Mortar 2F Inside"},
        0x3C: {"name": "Mount Mortar B1F"},
        0x3D: {"name": "Ice Path 1F"},
        0x3E: {"name": "Ice Path B1F"},
        0x3F: {"name": "Ice Path B2F Mahogany Side"},
        0x40: {"name": "Ice Path B2F Blackthorn Side"},
        0x41: {"name": "Ice Path B3F"},
        0x42: {"name": "Whirl Island NW"},
        0x43: {"name": "Whirl Island NE"},
        0x44: {"name": "Whirl Island SW"},
        0x45: {"name": "Whirl Island Cave"},
        0x46: {"name": "Whirl Island SE"},
        0x47: {"name": "Whirl Island B1F"},
        0x48: {"name": "Whirl Island B2F"},
        0x49: {"name": "Whirl Island Lugia Chamber"},
        0x4A: {"name": "Silver Cave Room 1"},
        0x4B: {"name": "Silver Cave Room 2"},
        0x4C: {"name": "Silver Cave Room 3"},
        0x4D: {"name": "Silver Cave Item Rooms"},
        0x4E: {"name": "Dark Cave Violet Entrance"},
        0x4F: {"name": "Dark Cave Blackthorn Entrance"},
        0x50: {"name": "Dragon's Den 1F"},
        0x51: {"name": "Dragon's Den B1F"},
        0x52: {"name": "Dragon Shrine"},
        0x53: {"name": "Tohjo Falls"},
        0x54: {"name": "Diglett's Cave"},
        0x55: {"name": "Mount Moon"},
        0x56: {"name": "Underground"},
        0x57: {"name": "Rock Tunnel 1F"},
        0x58: {"name": "Rock Tunnel B1F"},
        0x59: {"name": "Safari Zone Fuchsia Gate Beta"},
        0x5A: {"name": "Safari Zone Beta"},
        0x5B: {"name": "Victory Road"},
    },
    4: {
        0x1: {"name": "Ecruteak House"}, #passage to Tin Tower
        0x2: {"name": "Wise Trio's Room"},
        0x3: {"name": "Ecruteak Pokémon Center 1F",
              "label": "EcruteakPokeCenter1F"},
        0x4: {"name": "Ecruteak Lugia Speech House"},
        0x5: {"name": "Dance Theatre"},
        0x6: {"name": "Ecruteak Mart"},
        0x7: {"name": "Ecruteak Gym"},
        0x8: {"name": "Ecruteak Itemfinder House"},
        0x9: {"name": "Ecruteak City"},
    },
    5: {
        0x1: {"name": "Blackthorn Gym 1F"},
        0x2: {"name": "Blackthorn Gym 2F"},
        0x3: {"name": "Blackthorn Dragon Speech House"},
        0x4: {"name": "Blackthorn Dodrio Trade House"},
        0x5: {"name": "Blackthorn Mart"},
        0x6: {"name": "Blackthorn Pokémon Center 1F",
              "label": "BlackthornPokeCenter1F"},
        0x7: {"name": "Move Deleter's House"},
        0x8: {"name": "Route 45"},
        0x9: {"name": "Route 46"},
        0xA: {"name": "Blackthorn City"},
    },
    6: {
        0x1: {"name": "Cinnabar Pokémon Center 1F",
              "label": "CinnabarPokeCenter1F"},
        0x2: {"name": "Cinnabar Pokémon Center 2F Beta",
              "label": "CinnabarPokeCenter2FBeta"},
        0x3: {"name": "Route 19 - Fuchsia Gate"},
        0x4: {"name": "Seafoam Gym"},
        0x5: {"name": "Route 19"},
        0x6: {"name": "Route 20"},
        0x7: {"name": "Route 21"},
        0x8: {"name": "Cinnabar Island"},
    },
    7: {
        0x1: {"name": "Cerulean Gym Badge Speech House"},
        0x2: {"name": "Cerulean Police Station"},
        0x3: {"name": "Cerulean Trade Speech House"},
        0x4: {"name": "Cerulean Pokémon Center 1F",
              "label": "CeruleanPokeCenter1F"},
        0x5: {"name": "Cerulean Pokémon Center 2F Beta",
              "label": "CeruleanPokeCenter2FBeta"},
        0x6: {"name": "Cerulean Gym"},
        0x7: {"name": "Cerulean Mart"},
        0x8: {"name": "Route 10 Pokémon Center 1F",
              "label": "Route10PokeCenter1F"},
        0x9: {"name": "Route 10 Pokémon Center 2F Beta",
              "label": "Route10PokeCenter2FBeta"},
        0xA: {"name": "Power Plant"},
        0xB: {"name": "Bill's House"},
        0xC: {"name": "Route 4"},
        0xD: {"name": "Route 9"},
        0xE: {"name": "Route 10"},
        0xF: {"name": "Route 24"},
        0x10: {"name": "Route 25"},
        0x11: {"name": "Cerulean City"},
    },
    8: {
        0x1: {"name": "Azalea Pokémon Center 1F",
              "label": "AzaleaPokeCenter1F"},
        0x2: {"name": "Charcoal Kiln"},
        0x3: {"name": "Azalea Mart"},
        0x4: {"name": "Kurt's House"},
        0x5: {"name": "Azalea Gym"},
        0x6: {"name": "Route 33"},
        0x7: {"name": "Azalea Town"},
    },
    9: {
        0x1: {"name": "Lake of Rage Hidden Power House"},
        0x2: {"name": "Lake of Rage Magikarp House"},
        0x3: {"name": "Route 43 Mahogany Gate"},
        0x4: {"name": "Route 43 Gate"},
        0x5: {"name": "Route 43"},
        0x6: {"name": "Lake of Rage"},
    },
    10: {
        0x1: {"name": "Route 32"},
        0x2: {"name": "Route 35"},
        0x3: {"name": "Route 36"},
        0x4: {"name": "Route 37"},
        0x5: {"name": "Violet City"},
        0x6: {"name": "Violet Mart"},
        0x7: {"name": "Violet Gym"},
        0x8: {"name": "Earl's Pokémon Academy",
              "label": "EarlsPokemonAcademy"},
        0x9: {"name": "Violet Nickname Speech House"},
        0xA: {"name": "Violet Pokémon Center 1F",
              "label": "VioletPokeCenter1F"},
        0xB: {"name": "Violet Onix Trade House"},
        0xC: {"name": "Route 32 Ruins of Alph Gate"},
        0xD: {"name": "Route 32 Pokémon Center 1F",
              "label": "Route32PokeCenter1F"},
        0xE: {"name": "Route 35 Goldenrod gate"},
        0xF: {"name": "Route 35 National Park gate"},
        0x10: {"name": "Route 36 Ruins of Alph gate"},
        0x11: {"name": "Route 36 National Park gate"},
    },
    11: {
        0x1: {"name": "Route 34"},
        0x2: {"name": "Goldenrod City"},
        0x3: {"name": "Goldenrod Gym"},
        0x4: {"name": "Goldenrod Bike Shop"},
        0x5: {"name": "Goldenrod Happiness Rater"},
        0x6: {"name": "Goldenrod Bill's House"},
        0x7: {"name": "Goldenrod Magnet Train Station"},
        0x8: {"name": "Goldenrod Flower Shop"},
        0x9: {"name": "Goldenrod PP Speech House"},
        0xA: {"name": "Goldenrod Name Rater's House"},
        0xB: {"name": "Goldenrod Dept Store 1F"},
        0xC: {"name": "Goldenrod Dept Store 2F"},
        0xD: {"name": "Goldenrod Dept Store 3F"},
        0xE: {"name": "Goldenrod Dept Store 4F"},
        0xF: {"name": "Goldenrod Dept Store 5F"},
        0x10: {"name": "Goldenrod Dept Store 6F"},
        0x11: {"name": "Goldenrod Dept Store Elevator"},
        0x12: {"name": "Goldenrod Dept Store Roof"},
        0x13: {"name": "Goldenrod Game Corner"},
        0x14: {"name": "Goldenrod Pokémon Center 1F",
               "label": "GoldenrodPokeCenter1F"},
        0x15: {"name": "Goldenrod PokéCom Center 2F Mobile",
               "label": "GoldenrodPokeComCenter2FMobile"},
        0x16: {"name": "Ilex Forest Azalea Gate"},
        0x17: {"name": "Route 34 Ilex Forest Gate"},
        0x18: {"name": "Day Care"},
    },
    12: {
        0x1: {"name": "Route 6"},
        0x2: {"name": "Route 11"},
        0x3: {"name": "Vermilion City"},
        0x4: {"name": "Vermilion House Fishing Speech House"},
        0x5: {"name": "Vermilion Pokémon Center 1F",
              "label": "VermilionPokeCenter1F"},
        0x6: {"name": "Vermilion Pokémon Center 2F Beta",
              "label": "VermilionPokeCenter2FBeta"},
        0x7: {"name": "Pokémon Fan Club"},
        0x8: {"name": "Vermilion Magnet Train Speech House"},
        0x9: {"name": "Vermilion Mart"},
        0xA: {"name": "Vermilion House Diglett's Cave Speech House"},
        0xB: {"name": "Vermilion Gym"},
        0xC: {"name": "Route 6 Saffron Gate"},
        0xD: {"name": "Route 6 Underground Entrance"},
    },
    13: {
        0x1: {"name": "Route 1"},
        0x2: {"name": "Pallet Town"},
        0x3: {"name": "Red's House 1F"},
        0x4: {"name": "Red's House 2F"},
        0x5: {"name": "Blue's House"},
        0x6: {"name": "Oak's Lab"},
    },
    14: {
        0x1: {"name": "Route 3"},
        0x2: {"name": "Pewter City"},
        0x3: {"name": "Pewter Nidoran Speech House"},
        0x4: {"name": "Pewter Gym"},
        0x5: {"name": "Pewter Mart"},
        0x6: {"name": "Pewter Pokémon Center 1F",
              "label": "PewterPokeCenter1F"},
        0x7: {"name": "Pewter Pokémon Center 2F Beta",
              "label": "PewterPokeCEnter2FBeta"},
        0x8: {"name": "Pewter Snooze Speech House"},
    },
    15: {
        0x1: {"name": "Olivine Port"},
        0x2: {"name": "Vermilion Port"},
        0x3: {"name": "Fast Ship 1F"},
        0x4: {"name": "Fast Ship Cabins NNW, NNE, NE",
              "label": "FastShipCabins_NNW_NNE_NE"},
        0x5: {"name": "Fast Ship Cabins SW, SSW, NW",
              "label": "FastShipCabins_SW_SSW_NW"},
        0x6: {"name": "Fast Ship Cabins SE, SSE, Captain's Cabin",
              "label": "FastShipCabins_SE_SSE_CaptainsCabin"},
        0x7: {"name": "Fast Ship B1F"},
        0x8: {"name": "Olivine Port Passage"},
        0x9: {"name": "Vermilion Port Passage"},
        0xA: {"name": "Mount Moon Square"},
        0xB: {"name": "Mount Moon Gift Shop"},
        0xC: {"name": "Tin Tower Roof"},
    },
    16: {
        0x1: {"name": "Route 23"},
        0x2: {"name": "Indigo Plateau Pokémon Center 1F",
              "label": "IndigoPlateauPokeCenter1F"},
        0x3: {"name": "Will's Room"},
        0x4: {"name": "Koga's Room"},
        0x5: {"name": "Bruno's Room"},
        0x6: {"name": "Karen's Room"},
        0x7: {"name": "Lance's Room"},
        0x8: {"name": "Hall of Fame",
              "label": "HallOfFame"},
    },
    17: {
        0x1: {"name": "Route 13"},
        0x2: {"name": "Route 14"},
        0x3: {"name": "Route 15"},
        0x4: {"name": "Route 18"},
        0x5: {"name": "Fuchsia City"},
        0x6: {"name": "Fuchsia Mart"},
        0x7: {"name": "Safari Zone Main Office"},
        0x8: {"name": "Fuchsia Gym"},
        0x9: {"name": "Fuchsia Bill Speech House"},
        0xA: {"name": "Fuchsia Pokémon Center 1F",
              "label": "FuchsiaPokeCenter1F"},
        0xB: {"name": "Fuchsia Pokémon Center 2F Beta",
              "label": "FuchsiaPokeCenter2FBeta"},
        0xC: {"name": "Safari Zone Warden's Home"},
        0xD: {"name": "Route 15 Fuchsia Gate"},
    },
    18: {
        0x1: {"name": "Route 8"},
        0x2: {"name": "Route 12"},
        0x3: {"name": "Route 10"},
        0x4: {"name": "Lavender Town"},
        0x5: {"name": "Lavender Pokémon Center 1F",
              "label": "LavenderPokeCenter1F"},
        0x6: {"name": "Lavender Pokémon Center 2F Beta",
              "label": "LavenderPokeCenter2FBeta"},
        0x7: {"name": "Mr. Fuji's House"},
        0x8: {"name": "Lavender Town Speech House"},
        0x9: {"name": "Lavender Name Rater"},
        0xA: {"name": "Lavender Mart"},
        0xB: {"name": "Soul House"},
        0xC: {"name": "Lav Radio Tower 1F"},
        0xD: {"name": "Route 8 Saffron Gate"},
        0xE: {"name": "Route 12 Super Rod House"},
    },
    19: {
        0x1: {"name": "Route 28"},
        0x2: {"name": "Silver Cave Outside"},
        0x3: {"name": "Silver Cave Pokémon Center 1F",
              "label": "SilverCavePokeCenter1F"},
        0x4: {"name": "Route 28 Famous Speech House"},
    },
    20: {
        0x1: {"name": "Pokémon Center 2F",
              "label": "PokeCenter2F"},
        0x2: {"name": "Trade Center"},
        0x3: {"name": "Colosseum"},
        0x4: {"name": "Time Capsule"},
        0x5: {"name": "Mobile Trade Room Mobile"},
        0x6: {"name": "Mobile Battle Room"},
    },
    21: {
        0x1: {"name": "Route 7"},
        0x2: {"name": "Route 16"},
        0x3: {"name": "Route 17"},
        0x4: {"name": "Celadon City"},
        0x5: {"name": "Celadon Dept Store 1F"},
        0x6: {"name": "Celadon Dept Store 2F"},
        0x7: {"name": "Celadon Dept Store 3F"},
        0x8: {"name": "Celadon Dept Store 4F"},
        0x9: {"name": "Celadon Dept Store 5F"},
        0xA: {"name": "Celadon Dept Store 6F"},
        0xB: {"name": "Celadon Dept Store Elevator"},
        0xC: {"name": "Celadon Mansion 1F"},
        0xD: {"name": "Celadon Mansion 2F"},
        0xE: {"name": "Celadon Mansion 3F"},
        0xF: {"name": "Celadon Mansion Roof"},
        0x10: {"name": "Celadon Mansion Roof House"},
        0x11: {"name": "Celadon Pokémon Center 1F",
               "label": "CeladonPokeCenter1F"},
        0x12: {"name": "Celadon Pokémon Center 2F Beta",
               "label": "CeladonPokeCenter2FBeta"},
        0x13: {"name": "Celadon Game Corner"},
        0x14: {"name": "Celadon Game Corner Prize Room"},
        0x15: {"name": "Celadon Gym"},
        0x16: {"name": "Celadon Cafe"},
        0x17: {"name": "Route 16 Fuchsia Speech House"},
        0x18: {"name": "Route 16 Gate"},
        0x19: {"name": "Route 7 Saffron Gate"},
        0x1A: {"name": "Route 17 18 Gate"},
    },
    22: {
        0x1: {"name": "Route 40"},
        0x2: {"name": "Route 41"},
        0x3: {"name": "Cianwood City"},
        0x4: {"name": "Mania's House"},
        0x5: {"name": "Cianwood Gym"},
        0x6: {"name": "Cianwood Pokémon Center 1F",
              "label": "CianwoodPokeCenter1F"},
        0x7: {"name": "Cianwood Pharmacy"},
        0x8: {"name": "Cianwood City Photo Studio"},
        0x9: {"name": "Cianwood Lugia Speech House"},
        0xA: {"name": "Poke Seer's House"},
        0xB: {"name": "Battle Tower 1F"},
        0xC: {"name": "Battle Tower Battle Room"},
        0xD: {"name": "Battle Tower Elevator"},
        0xE: {"name": "Battle Tower Hallway"},
        0xF: {"name": "Route 40 Battle Tower Gate"},
        0x10: {"name": "Battle Tower Outside"},
    },
    23: {
        0x1: {"name": "Route 2"},
        0x2: {"name": "Route 22"},
        0x3: {"name": "Viridian City"},
        0x4: {"name": "Viridian Gym"},
        0x5: {"name": "Viridian Nickname Speech House"},
        0x6: {"name": "Trainer House 1F"},
        0x7: {"name": "Trainer House B1F"},
        0x8: {"name": "Viridian Mart"},
        0x9: {"name": "Viridian Pokémon Center 1F",
              "label": "ViridianPokeCenter1F"},
        0xA: {"name": "Viridian Pokémon Center 2F Beta",
              "label": "ViridianPokeCenter2FBeta"},
        0xB: {"name": "Route 2 Nugget Speech House"},
        0xC: {"name": "Route 2 Gate"},
        0xD: {"name": "Victory Road Gate"},
    },
    24: {
        0x1: {"name": "Route 26"},
        0x2: {"name": "Route 27"},
        0x3: {"name": "Route 29"},
        0x4: {"name": "New Bark Town"},
        0x5: {"name": "Elm's Lab"},
        0x6: {"name": "Kris's House 1F"},
        0x7: {"name": "Kris's House 2F"},
        0x8: {"name": "Kris's Neighbor's House"},
        0x9: {"name": "Elm's House"},
        0xA: {"name": "Route 26 Heal Speech House"},
        0xB: {"name": "Route 26 Day of Week Siblings House"},
        0xC: {"name": "Route 27 Sandstorm House"},
        0xD: {"name": "Route 29 46 Gate"},
    },
    25: {
        0x1: {"name": "Route 5"},
        0x2: {"name": "Saffron City"},
        0x3: {"name": "Fighting Dojo"},
        0x4: {"name": "Saffron Gym"},
        0x5: {"name": "Saffron Mart"},
        0x6: {"name": "Saffron Pokémon Center 1F",
              "label": "SaffronPokeCenter1F"},
        0x7: {"name": "Saffron Pokémon Center 2F Beta",
              "label": "SaffronPokeCenter2FBeta"},
        0x8: {"name": "Mr. Psychic's House"},
        0x9: {"name": "Saffron Train Station"},
        0xA: {"name": "Silph Co. 1F"},
        0xB: {"name": "Copycat's House 1F"},
        0xC: {"name": "Copycat's House 2F"},
        0xD: {"name": "Route 5 Underground Entrance"},
        0xE: {"name": "Route 5 Saffron City Gate"},
        0xF: {"name": "Route 5 Cleanse Tag Speech House"},
    },
    26: {
        0x1: {"name": "Route 30"},
        0x2: {"name": "Route 31"},
        0x3: {"name": "Cherrygrove City"},
        0x4: {"name": "Cherrygrove Mart"},
        0x5: {"name": "Cherrygrove Pokémon Center 1F",
              "label": "CherrygrovePokeCenter1F"},
        0x6: {"name": "Cherrygrove Gym Speech House"},
        0x7: {"name": "Guide Gent's House"},
        0x8: {"name": "Cherrygrove Evolution Speech House"},
        0x9: {"name": "Route 30 Berry Speech House"},
        0xA: {"name": "Mr. Pokémon's House"},
        0xB: {"name": "Route 31 Violet Gate"},
    },
}
#generate labels for each map name
for map_group_id in map_names.keys():
    map_group = map_names[map_group_id]
    for map_id in map_group.keys():
        #skip if we maybe already have the 'offset' label set in this map group
        if map_id == "offset": continue
        #skip if we provided a pre-set value for the map's label
        if map_group[map_id].has_key("label"): continue
        #convience alias
        map_data = map_group[map_id]
        #clean up the map name to be an asm label
        cleaned_name = map_name_cleaner(map_data["name"])
        #set the value in the original dictionary
        map_names[map_group_id][map_id]["label"] = cleaned_name
#read the rom and figure out the offsets for maps
load_rom()
load_map_group_offsets()
#add the offsets into our map structure, why not (johto maps only)
[map_names[map_group_id+1].update({"offset": offset}) for map_group_id, offset in enumerate(map_group_offsets)]
#parse map header bytes for each map
parse_all_map_headers()

if __name__ == "__main__":
    load_rom()
    load_map_group_offsets()
