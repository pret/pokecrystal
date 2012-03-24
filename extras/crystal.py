# -*- coding: utf-8 -*-
#utilities to help disassemble pokémon crystal
import sys, os, inspect, md5
from copy import copy

#for IntervalMap
from bisect import bisect_left, bisect_right
from itertools import izip

#for testing all this crap
import unittest2 as unittest

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

max_texts = 3
text_count = 0
texts = []

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

class IntervalMap(object):
    """
    This class maps a set of intervals to a set of values.

    >>> i = IntervalMap()
    >>> i[0:5] = "hello world"
    >>> i[6:10] = "hello cruel world"
    >>> print i[4]
    "hello world"
    """
    def __init__(self):
        """initializes an empty IntervalMap"""
        self._bounds = []
        self._items = []
        self._upperitem = None
    def __setitem__(self, _slice, _value):
        """sets an interval mapping"""
        assert isinstance(_slice, slice), 'The key must be a slice object'
    
        if _slice.start is None:
            start_point = -1
        else:
            start_point = bisect_left(self._bounds, _slice.start)
        
        if _slice.stop is None:
            end_point = -1
        else:
            end_point = bisect_left(self._bounds, _slice.stop)
        
        if start_point>=0:
            if start_point < len(self._bounds) and self._bounds[start_point]<_slice.start:
                start_point += 1 

            if end_point>=0:        
                self._bounds[start_point:end_point] = [_slice.start, _slice.stop]
                if start_point < len(self._items):
                    self._items[start_point:end_point] = [self._items[start_point], _value]
                else:
                    self._items[start_point:end_point] = [self._upperitem, _value]
            else:
                self._bounds[start_point:] = [_slice.start]
                if start_point < len(self._items):
                    self._items[start_point:] = [self._items[start_point], _value]
                else:
                    self._items[start_point:] = [self._upperitem]
                self._upperitem = _value
        else:
            if end_point>=0:
                self._bounds[:end_point] = [_slice.stop]
                self._items[:end_point] = [_value]
            else:
                self._bounds[:] = []
                self._items[:] = []
                self._upperitem = _value
    def __getitem__(self,_point):
        """gets a value from the mapping"""
        assert not isinstance(_point, slice), 'The key cannot be a slice object'  
            
        index = bisect_right(self._bounds, _point)
        if index < len(self._bounds):
            return self._items[index]
        else:
            return self._upperitem
    def items(self):
        """returns an iterator with each item being
        ((low_bound, high_bound), value)
        these items are returned in order"""
        previous_bound = None
        for (b, v) in izip(self._bounds, self._items):
            if v is not None:
                yield (previous_bound, b), v
            previous_bound = b
        if self._upperitem is not None:
            yield (previous_bound, None), self._upperitem
    def values(self):
        """returns an iterator with each item being a stored value
        the items are returned in order"""
        for v in self._items:
            if v is not None:
                yield v
        if self._upperitem is not None:
            yield self._upperitem
    def __repr__(self):
        s = []
        for b,v in self.items():
            if v is not None:
                s.append('[%r, %r] => %r'%(
                    b[0],
                    b[1],
                    v
                ))
        return '{'+', '.join(s)+'}'

#keys are intervals "500..555" of byte addresses for each script
#last byte is not inclusive
#this is how to make sure scripts are not recalculated
script_parse_table = IntervalMap()

def is_script_already_parsed_at(address):
    """looks up whether or not a script is parsed at a certain address"""
    if script_parse_table[address] == None: return False
    return True

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
    def length(self):
        """len(self)"""
        return len(self)
    def __repr__(self):
        return "RomStr(too long)"
def load_rom(filename="../baserom.gbc"):
    """loads bytes into memory"""
    global rom
    file_handler = open(filename, "r")
    rom = RomStr(file_handler.read())
    file_handler.close()
    return rom

class AsmList(list):
    """simple wrapper to prevent all asm lines from being shown on screen"""
    def length(self):
        """len(self)"""
        return len(self)
    def __repr__(self):
        return "AsmList(too long)"
def load_asm(filename="../main.asm"):
    """loads the asm source code into memory"""
    global asm
    asm = open(filename, "r").read().split("\n")
    asm = AsmList(asm)
    return asm

def grouper(some_list, count=2):
    """splits a list into sublists
    given: [1, 2, 3, 4]
    returns: [[1, 2], [3, 4]]"""
    return [some_list[i:i+count] for i in range(0, len(some_list), count)]

def rom_interval(offset, length, strings=True, debug=True):
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

def how_many_until(byte, starting):
    index = rom.find(byte, starting)
    return index - starting

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
    if 0x4000 <= address <= 0x7FFF:
        raise Exception, "bank 1 does not exist"
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
    elif type(bank) == int:
        pass
    else:
        raise "bad bank given to calculate_pointer_from_bytes_at"
    byte1 = ord(rom[address])
    byte2 = ord(rom[address+1])
    temp  = byte1 + (byte2 << 8)
    if temp == 0:
        return None
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

def command_debug_information(command_byte=None, map_group=None, map_id=None, address=0, info=None, long_info=None, pksv_name=None):
    "used to help debug in parse_script_engine_script_at"
    info1 = "parsing command byte " + hex(command_byte) + " for map " + \
          str(map_group) + "." + str(map_id) + " at " + hex(address)
    info1 += "    pksv: " + str(pksv_name)
    #info1 += "    info: " + str(info)
    #info1 += "    long_info: " + long_info
    return info1

class TextScript():
    "a text is a sequence of commands different from a script-engine script"
    def to_asm(self): raise NotImplementedError, bryan_message
    @staticmethod
    def find_addresses():
        """returns a list of text pointers
        useful for testing parse_text_engine_script_at
        
        Note that this list is not exhaustive. There are some texts that
        are only pointed to from some script that a current script just
        points to. So find_all_text_pointers_in_script_engine_script will
        have to recursively follow through each script to find those.
        .. it does this now :)
        """
        addresses = set()
        #for each map group
        for map_group in map_names:
            #for each map id
            for map_id in map_names[map_group]:
                #skip the offset key
                if map_id == "offset": continue
                #dump this into smap
                smap = map_names[map_group][map_id]
                #signposts
                signposts = smap["signposts"]
                #for each signpost
                for signpost in signposts:
                    if signpost["func"] in [0, 1, 2, 3, 4]:
                        #dump this into script
                        script = signpost["script"]
                    elif signpost["func"] in [05, 06]:
                        script = signpost["script"]
                    else: continue
                    #skip signposts with no bytes
                    if len(script) == 0: continue
                    #find all text pointers in script
                    texts = find_all_text_pointers_in_script_engine_script(script, smap["event_bank"])
                    #dump these addresses in
                    addresses.update(texts)
                #xy triggers
                xy_triggers = smap["xy_triggers"]
                #for each xy trigger
                for xy_trigger in xy_triggers:
                    #dump this into script
                    script = xy_trigger["script"]
                    #find all text pointers in script
                    texts = find_all_text_pointers_in_script_engine_script(script, smap["event_bank"])
                    #dump these addresses in
                    addresses.update(texts)
                #trigger scripts
                triggers = smap["trigger_scripts"]
                #for each trigger
                for (i, trigger) in triggers.items():
                    #dump this into script
                    script = trigger["script"]
                    #find all text pointers in script
                    texts = find_all_text_pointers_in_script_engine_script(script, calculate_bank(trigger["address"]))
                    #dump these addresses in
                    addresses.update(texts)
                #callback scripts
                callbacks = smap["callback_scripts"]
                #for each callback
                for (k, callback) in callbacks.items():
                    #dump this into script
                    script = callback["script"]
                    #find all text pointers in script
                    texts = find_all_text_pointers_in_script_engine_script(script, calculate_bank(callback["address"]))
                    #dump these addresses in
                    addresses.update(texts)
                #people-events
                events = smap["people_events"]
                #for each event
                for event in events:
                    if event["event_type"] == "script":
                        #dump this into script
                        script = event["script"]
                        #find all text pointers in script
                        texts = find_all_text_pointers_in_script_engine_script(script, smap["event_bank"])
                        #dump these addresses in
                        addresses.update(texts)
                    if event["event_type"] == "trainer":
                        trainer_data = event["trainer_data"]
                        addresses.update([trainer_data["text_when_seen_ptr"]])
                        addresses.update([trainer_data["text_when_trainer_beaten_ptr"]])
                        trainer_bank = calculate_bank(event["trainer_data_address"])
                        script1 = trainer_data["script_talk_again"]
                        texts1 = find_all_text_pointers_in_script_engine_script(script1, trainer_bank)
                        addresses.update(texts1)
                        script2 = trainer_data["script_when_lost"]
                        texts2 = find_all_text_pointers_in_script_engine_script(script2, trainer_bank)
                        addresses.update(texts2)
        return addresses
    @staticmethod
    def parse_text_at(address, map_group=None, map_id=None, debug=True, show=True):
        """parses a text-engine script ("in-text scripts")
        http://hax.iimarck.us/files/scriptingcodes_eng.htm#InText
    
        This is presently very broken.
    
        see parse_text_at2, parse_text_at, and process_00_subcommands
        """
        global rom, text_count, max_texts, texts
        if rom == None:
            load_rom()
        if address == None:
            return "not a script"
        commands = {}
    
        total_text_commands = 0
        command_counter = 0
        original_address = address
        offset = address
        end = False
        while not end:
            address = offset
            command = {}
            command_byte = ord(rom[address])
            print "parse_text_engine_script_at has encountered a command byte " + hex(command_byte) + " at " + hex(address)
            end_address = address + 1
            if  command_byte == 0:
                #read until $57, $50 or $58
                jump57 = how_many_until(chr(0x57), offset)
                jump50 = how_many_until(chr(0x50), offset)
                jump58 = how_many_until(chr(0x58), offset)
         
                #whichever command comes first
                jump = min([jump57, jump50, jump58])
    
                end_address = offset + jump - 1 #we want the address before $57
    
                lines = process_00_subcommands(offset+1, end_address)
    
                if show:
                    text = parse_text_at2(offset+1, end_address-offset+1)
                    texts.append(text)
                    print text
    
                command = {"type": command_byte,
                           "start_address": offset,
                           "end_address": end_address,
                           "size": jump,
                           "lines": lines,
                          }   
    
                offset += jump
            elif command_byte == 0x17:
                #TX_FAR [pointer][bank]
                pointer_byte1 = ord(rom[offset+1])
                pointer_byte2 = ord(rom[offset+2])
                pointer_bank = ord(rom[offset+3])
    
                pointer = (pointer_byte1 + (pointer_byte2 << 8))
                pointer = extract_maps.calculate_pointer(pointer, pointer_bank)
    
                command = {"type": command_byte,
                           "start_address": offset,
                           "end_address": offset + 3, #last byte belonging to this command
                           "pointer": pointer, #parameter
                          }
    
                offset += 3 + 1
            elif command_byte == 0x50 or command_byte == 0x57 or command_byte == 0x58: #end text
                command = {"type": command_byte,
                           "start_address": offset,
                           "end_address": offset,
                          }
    
                #this byte simply indicates to end the script
                end = True
    
                #this byte simply indicates to end the script
                if command_byte == 0x50 and ord(rom[offset+1]) == 0x50: #$50$50 means end completely
                    end = True
                    commands[command_counter+1] = command
    
                    #also save the next byte, before we quit
                    commands[command_counter+1]["start_address"] += 1
                    commands[command_counter+1]["end_address"] += 1
                    add_command_byte_to_totals(command_byte)
                elif command_byte == 0x50: #only end if we started with $0
                    if len(commands.keys()) > 0:
                        if commands[0]["type"] == 0x0: end = True
                elif command_byte == 0x57 or command_byte == 0x58: #end completely
                    end = True
                    offset += 1 #go past this 0x50
            elif command_byte == 0x1:
                #01 = text from RAM. [01][2-byte pointer]
                size = 3 #total size, including the command byte
                pointer_byte1 = ord(rom[offset+1])
                pointer_byte2 = ord(rom[offset+2])
    
                command = {"type": command_byte,
                           "start_address": offset+1,
                           "end_address": offset+2, #last byte belonging to this command
                           "pointer": [pointer_byte1, pointer_byte2], #RAM pointer
                          }
    
                #view near these bytes
                #subsection = rom[offset:offset+size+1] #peak ahead
                #for x in subsection:
                #    print hex(ord(x))
                #print "--"
    
                offset += 2 + 1 #go to the next byte
    
                #use this to look at the surrounding bytes
                if debug:
                    print "next command is: " + hex(ord(rom[offset])) + " ... we are at command number: " + str(command_counter) + " near " + hex(offset) + " on map_id=" + str(map_id)
            elif command_byte == 0x7:
                #07 = shift texts 1 row above (2nd line becomes 1st line); address for next text = 2nd line. [07]
                size = 1
                command = {"type": command_byte,
                           "start_address": offset,
                           "end_address": offset,
                          }
                offset += 1
            elif command_byte == 0x3:
                #03 = set new address in RAM for text. [03][2-byte RAM address]
                size = 3
                command = {"type": command_byte, "start_address": offset, "end_address": offset+2}
                offset += size
            elif command_byte == 0x4: #draw box
                #04 = draw box. [04][2-Byte pointer][height Y][width X]
                size = 5 #including the command
                command = {
                            "type": command_byte,
                            "start_address": offset,
                            "end_address": offset + size,
                            "pointer_bytes": [ord(rom[offset+1]), ord(rom[offset+2])],
                            "y": ord(rom[offset+3]),
                            "x": ord(rom[offset+4]),
                          }
                offset += size + 1
            elif command_byte == 0x5:
                #05 = write text starting at 2nd line of text-box. [05][text][ending command]
                #read until $57, $50 or $58
                jump57 = how_many_until(chr(0x57), offset)
                jump50 = how_many_until(chr(0x50), offset)
                jump58 = how_many_until(chr(0x58), offset)
    
                #whichever command comes first
                jump = min([jump57, jump50, jump58])
    
                end_address = offset + jump - 1 #we want the address before $57
                lines = process_00_subcommands(offset+1, end_address)
                
                if show:
                    text = parse_text_at2(offset+1, end_address-offset+1)
                    texts.append(text)
                    print text
    
                command = {"type": command_byte,
                           "start_address": offset,
                           "end_address": end_address,
                           "size": jump,
                           "lines": lines,
                          }
                offset = end_address + 1
            elif command_byte == 0x6:
                #06 = wait for keypress A or B (put blinking arrow in textbox). [06]
                command = {"type": command_byte, "start_address": offset, "end_address": offset}
                offset += 1
            elif command_byte == 0x7:
                #07 = shift texts 1 row above (2nd line becomes 1st line); address for next text = 2nd line. [07]
                command = {"type": command_byte, "start_address": offset, "end_address": offset}
                offset += 1
            elif command_byte == 0x8:
                #08 = asm until whenever
                command = {"type": command_byte, "start_address": offset, "end_address": offset}
                offset += 1
                end = True
            elif command_byte == 0x9:
                #09 = write hex-to-dec number from RAM to textbox [09][2-byte RAM address][byte bbbbcccc]
                #  bbbb = how many bytes to read (read number is big-endian)
                #  cccc = how many digits display (decimal)
                #(note: max of decimal digits is 7,i.e. max number correctly displayable is 9999999)
                ram_address_byte1 = ord(rom[offset+1])
                ram_address_byte2 = ord(rom[offset+2])
                read_byte = ord(rom[offset+3])
    
                command = {
                            "type": command_byte,
                            "address": [ram_address_byte1, ram_address_byte2],
                            "read_byte": read_byte, #split this up when we make a macro for this
                          }
    
                offset += 4
            else:
                #if len(commands) > 0:
                #   print "Unknown text command " + hex(command_byte) + " at " + hex(offset) + ", script began with " + hex(commands[0]["type"])
                if debug:
                    print "Unknown text command at " + hex(offset) + " - command: " + hex(ord(rom[offset])) + " on map_id=" + str(map_id)
    
                #end at the first unknown command
                end = True
            commands[command_counter] = command
            command_counter += 1
        total_text_commands += len(commands)
        
        text_count += 1
        #if text_count >= max_texts:
        #    sys.exit()
        
        return commands
    @staticmethod
    def to_asm_at(address, label="SomeLabel"):
        #parse the text script
        commands = TextScript.parse_text_at(start_address)
        #apparently this isn't important anymore?
        needs_to_begin_with_0 = True
        #start with zero please
        byte_count = 0 
        #where we store all output
        output = ""
        had_text_end_byte = False
        had_text_end_byte_57_58 = False
        had_db_last = False
        #reset this pretty fast..
        first_line = True
        #for each command..
        for this_command in commands.keys():
            if not "lines" in commands[this_command].keys():
                command = commands[this_command]
                if not "type" in command.keys():
                    print "ERROR in command: " + str(command)
                    continue #dunno what to do here?
    
                if   command["type"] == 0x1: #TX_RAM
                    if first_line:
                        output = "\n"
                        output += label + ": ; " + hex(start_address)
                        first_line = False
                    p1 = command["pointer"][0]
                    p2 = command["pointer"][1]
    
                    #remember to account for big endian -> little endian
                    output += "\n" + spacing + "TX_RAM $%.2x%.2x" %(p2, p1)
                    byte_count += 3
                    had_db_last = False
                elif command["type"] == 0x17: #TX_FAR
                    if first_line:
                        output = "\n"
                        output += label + ": ; " + hex(start_address)
                        first_line = False
                    #p1 = command["pointer"][0]
                    #p2 = command["pointer"][1]
                    output += "\n" + spacing + "TX_FAR _" + label + " ; " + hex(command["pointer"])
                    byte_count += 4 #$17, bank, address word
                    had_db_last = False
                elif command["type"] == 0x9: #TX_RAM_HEX2DEC
                    if first_line:
                        output = "\n" + label + ": ; " + hex(start_address)
                        first_line = False
                    #address, read_byte
                    output += "\n" + spacing + "TX_NUM $%.2x%.2x, $%.2x" % (command["address"][1], command["address"][0], command["read_byte"])
                    had_db_last = False
                    byte_count += 4
                elif command["type"] == 0x50 and not had_text_end_byte:
                    #had_text_end_byte helps us avoid repeating $50s
                    if first_line:
                        output = "\n" + label + ": ; " + hex(start_address)
                        first_line = False
                    if had_db_last:
                        output += ", $50"
                    else:
                        output += "\n" + spacing + "db $50"
                    byte_count += 1
                    had_db_last = True
                elif command["type"] in [0x57, 0x58] and not had_text_end_byte_57_58:
                    if first_line: #shouldn't happen, really
                        output = "\n" + label + ": ; " + hex(start_address)
                        first_line = False
                    if had_db_last:
                        output += ", $%.2x" % (command["type"])
                    else:
                        output += "\n" + spacing + "db $%.2x" % (command["type"])
                    byte_count += 1
                    had_db_last = True
                elif command["type"] in [0x57, 0x58] and had_text_end_byte_57_58:
                    pass #this is ok
                elif command["type"] == 0x50 and had_text_end_byte:
                    pass #this is also ok
                elif command["type"] == 0x0b:
                    if first_line:
                        output = "\n" + label + ": ; " + hex(start_address)
                        first_line = False
                    if had_db_last:
                        output += ", $0b"
                    else:
                        output += "\n" + spacing + "db $0B"
                    byte_count += 1
                    had_db_last = True
                elif command["type"] == 0x11:
                    if first_line:
                        output = "\n" + label + ": ; " + hex(start_address)
                        first_line = False
                    if had_db_last:
                        output += ", $11"
                    else:
                        output += "\n" + spacing + "db $11"
                    byte_count += 1
                    had_db_last = True
                elif command["type"] == 0x6: #wait for keypress
                    if first_line:
                        output = "\n" + label + ": ; " + hex(start_address)
                        first_line = False
                    if had_db_last:
                        output += ", $6"
                    else:
                        output += "\n" + spacing + "db $6"
                    byte_count += 1
                    had_db_last = True
                else:
                    print "ERROR in command: " + hex(command["type"])
                    had_db_last = False
    
                #everything else is for $0s, really
                continue
            lines = commands[this_command]["lines"]
    
            #reset this in case we have non-$0s later
            had_db_last = False
    
            #add the ending byte to the last line- always seems $57
            #this should already be in there, but it's not because of a bug in the text parser
            lines[len(lines.keys())-1].append(commands[len(commands.keys())-1]["type"])
    
            if first_line:
                output  = "\n"
                output += label + ": ; " + hex(start_address) + "\n"
                first_line = False
            else:
                output += "\n"
    
            first = True #first byte
            for line_id in lines:
                line = lines[line_id]
                output += spacing + "db "
                if first and needs_to_begin_with_0:
                    output += "$0, "
                    first = False
                    byte_count += 1
    
                quotes_open = False
                first_byte = True
                was_byte = False
                for byte in line:
                    if byte == 0x50:
                        had_text_end_byte = True #don't repeat it
                    if byte in [0x58, 0x57]:
                        had_text_end_byte_57_58 = True
    
                    if byte in txt_bytes:
                        if not quotes_open and not first_byte: #start text
                            output += ", \""
                            quotes_open = True
                            first_byte = False
                        if not quotes_open and first_byte: #start text
                            output += "\""
                            quotes_open = True
                        output += txt_bytes[byte]
                    elif byte in constant_abbreviation_bytes:
                        if quotes_open:
                            output += "\""
                            quotes_open = False
                        if not first_byte:
                            output += ", "
                        output += constant_abbreviation_bytes[byte]
                    else:
                        if quotes_open:
                            output += "\""
                            quotes_open = False
    
                        #if you want the ending byte on the last line
                        #if not (byte == 0x57 or byte == 0x50 or byte == 0x58):
                        if not first_byte:
                            output += ", "
    
                        output += "$" + hex(byte)[2:]
                        was_byte = True
    
                        #add a comma unless it's the end of the line
                        #if byte_count+1 != len(line):
                        #    output += ", "
    
                    first_byte = False
                    byte_count += 1
                #close final quotes
                if quotes_open:
                    output += "\""
                    quotes_open = False
    
                output += "\n"
        include_newline = "\n"
        if len(output)!=0 and output[-1] == "\n":
            include_newline = ""
        output += include_newline + "; " + hex(start_address) + " + " + str(byte_count) + " bytes = " + hex(start_address + byte_count)
        print output
        return (output, byte_count)

def parse_text_engine_script_at(address, map_group=None, map_id=None, debug=True, show=True):
    """parses a text-engine script ("in-text scripts")
    http://hax.iimarck.us/files/scriptingcodes_eng.htm#InText
    see parse_text_at2, parse_text_at, and process_00_subcommands
    """
    return TextScript.parse_text_at(address, map_group=map_group, map_id=map_id, debug=debug, show=show)
def find_text_addresses():
    """returns a list of text pointers
    useful for testing parse_text_engine_script_at"""
    return TextScript.find_addresses()

class EncodedText():
    """a sequence of bytes that, when decoded, represent readable text
    based on the chars table from textpre.py and other places"""
    def to_asm(self): raise NotImplementedError, bryan_message
    @staticmethod
    def process_00_subcommands(start_address, end_address):
        """split this text up into multiple lines
        based on subcommands ending each line"""
        print "process_00_subcommands(" + hex(start_address) + ", " + hex(end_address) + ")"
        lines = {}
        subsection = rom[start_address:end_address]
    
        line_count = 0
        current_line = []
        for pbyte in subsection:
            byte = ord(pbyte)
            current_line.append(byte)
            if  byte == 0x4f or byte == 0x51 or byte == 0x55:
                lines[line_count] = current_line
                current_line = []
                line_count += 1
    
        #don't forget the last line
        lines[line_count] = current_line
        line_count += 1
        return lines
    @staticmethod
    def from_bytes(bytes):
        """assembles a string based on bytes looked up in the chars table"""
        line = ""
        for byte in bytes:
            if type(byte) != int:
                byte = ord(byte)
            if byte in chars.keys():
                line += chars[byte]
            else:
                print "byte not known: " + hex(byte)
        return line
    @staticmethod
    def parse_text_at(address, count=10):
        """returns a string of text from an address
        this does not handle text commands"""
        output = ""
        commands = process_00_subcommands(address, address+count)
        for (line_id, line) in commands.items():
            output += parse_text_from_bytes(line)
            output += "\n"
        return output
def process_00_subcommands(start_address, end_address):
    """split this text up into multiple lines
    based on subcommands ending each line"""
    return EncodedText.process_00_subcommands(start_address, end_address)
def parse_text_from_bytes(bytes):
    """assembles a string based on bytes looked up in the chars table"""
    return EncodedText.from_bytes(bytes)
def parse_text_at(address, count=10):
    """returns a list of bytes from an address
    see parse_text_at2 for pretty printing"""
    return parse_text_from_bytes(rom_interval(address, count, strings=False))
def parse_text_at2(address, count=10):
    """returns a string of text from an address
    this does not handle text commands"""
    return EncodedText.parse_text_at(address, count)

def rom_text_at(address, count=10):
    """prints out raw text from the ROM
    like for 0x112110"""
    return "".join([chr(x) for x in rom_interval(address, count, strings=False)])

def find_all_text_pointers_in_script_engine_script(script, bank):
    """returns a list of text pointers
    based on each script-engine script command"""
    #TODO: recursively follow any jumps in the script
    if script == None: return []
    addresses = set()
    for (k, command) in script.items():
        if   command["type"] == 0x4B:
            addresses.add(command["pointer"])
        elif command["type"] == 0x4C:
            addresses.add(command["pointer"])
        elif command["type"] == 0x51:
            addresses.add(command["pointer"])
        elif command["type"] == 0x53:
            addresses.add(command["pointer"])
        elif command["type"] == 0x64:
            addresses.add(command["won_pointer"])
            addresses.add(command["lost_pointer"])
    return addresses

def translate_command_byte(crystal=None, gold=None):
    """takes a command byte from either crystal or gold
    returns the command byte in the other (non-given) game

    The new commands are values 0x52 and 0x9F. This means:
        Crystal's 0x00–0x51 correspond to Gold's 0x00–0x51
        Crystal's 0x53–0x9E correspond to Gold's 0x52–0x9D
        Crystal's 0xA0–0xA5 correspond to Gold's 0x9E–0xA3

    see: http://www.pokecommunity.com/showpost.php?p=4347261
    """
    if crystal != None: #convert to gold
        if crystal <= 0x51: return crystal
        if crystal == 0x52: return None
        if 0x53 <= crystal <= 0x9E: return crystal-1
        if crystal == 0x9F: return None
        if 0xA0 <= crystal <= 0xA5: return crystal-2
        if crystal > 0xA5: raise Exception, "dunno yet if crystal has new insertions after crystal:0xA5 (gold:0xA3)"
    elif gold != None: #convert to crystal
        if gold <= 0x51: return gold
        if 0x52 <= gold <= 0x9D: return gold+1
        if 0x9E <= gold <= 0xA3: return gold+2
        if gold > 0xA3: raise Exception, "dunno yet if crystal has new insertions after gold:0xA3 (crystal:0xA5)"
    else: raise Exception, "translate_command_byte needs either a crystal or gold command"

pksv_gs = {
    0x00: "2call",
    0x01: "3call",
    0x02: "2ptcall",
    0x03: "2jump",
    0x04: "3jump",
    0x05: "2ptjump",
    0x06: "if equal",
    0x07: "if not equal",
    0x08: "if false",
    0x09: "if true",
    0x0A: "if less than",
    0x0B: "if greater than",
    0x0C: "jumpstd",
    0x0D: "callstd",
    0x0E: "3callasm",
    0x0F: "special",
    0x10: "2ptcallasm",
    0x11: "checkmaptriggers",
    0x12: "domaptrigger",
    0x13: "checktriggers",
    0x14: "dotrigger",
    0x15: "writebyte",
    0x16: "addvar",
    0x17: "random",
    0x19: "copybytetovar",
    0x1A: "copyvartobyte", #loadvar ?
    0x1C: "checkcode",
    0x1E: "writecode",
    0x1F: "giveitem",
    0x20: "takeitem",
    0x21: "checkitem",
    0x22: "givemoney",
    0x23: "takemoney",
    0x24: "checkmonkey",
    0x25: "givecoins",
    0x26: "takecoins",
    0x27: "checkcoins",
    0x2B: "checktime",
    0x2C: "checkpoke",
    0x2D: "givepoke",
    0x2E: "giveegg",
    0x2F: "givepokeitem",
    0x31: "checkbit1",
    0x32: "clearbit1",
    0x33: "setbit1",
    0x34: "checkbit2",
    0x35: "clearbit2",
    0x36: "setbit2",
    0x37: "wildoff",
    0x38: "wildon",
    0x39: "xycompare",
    0x3A: "warpmod",
    0x3B: "blackoutmod",
    0x3C: "warp",
    0x41: "itemtotext",
    0x43: "trainertotext",
    0x44: "stringtotext",
    0x45: "itemnotify",
    0x46: "pocketisfull",
    0x47: "loadfont",
    0x48: "refreshscreen",
    0x49: "loadmovesprites",
    0x4B: "3writetext",
    0x4C: "2writetext",
    0x4E: "yesorno",
    0x4F: "loadmenudata",
    0x50: "writebackup",
    0x51: "jumptextfaceplayer",
    0x52: "jumptext",
    0x53: "closetext",
    0x54: "keeptextopen",
    0x55: "pokepic",
    0x56: "pokepicyesorno",
    0x57: "interpretmenu",
    0x58: "interpretmenu2",
    0x5C: "loadpokedata",
    0x5D: "loadtrainer",
    0x5E: "startbattle",
    0x5F: "returnafterbattle",
    0x60: "catchtutorial",
    0x63: "winlosstext",
    0x65: "talkaftercancel",
    0x67: "setlasttalked",
    0x68: "applymovement",
    0x6A: "faceplayer",
    0x6B: "faceperson",
    0x6C: "variablesprite",
    0x6D: "disappear",
    0x6E: "appear",
    0x6F: "follow",
    0x70: "stopfollow",
    0x71: "moveperson",
    0x74: "showemote",
    0x75: "spriteface",
    0x76: "follownotexact",
    0x77: "earthquake",
    0x79: "changeblock",
    0x7A: "reloadmap",
    0x7B: "reloadmappart",
    0x7C: "writecmdqueue",
    0x7D: "delcmdqueue",
    0x7E: "playmusic",
    0x7F: "playrammusic",
    0x80: "musicfadeout",
    0x81: "playmapmusic",
    0x82: "reloadmapmusic",
    0x83: "cry",
    0x84: "playsound",
    0x85: "waitbutton",
    0x86: "warpsound",
    0x87: "specialsound",
    0x88: "passtoengine",
    0x89: "newloadmap",
    0x8A: "pause",
    0x8B: "deactivatefacing",
    0x8C: "priorityjump",
    0x8D: "warpcheck",
    0x8E: "ptpriorityjump",
    0x8F: "return",
    0x90: "end",
    0x91: "reloadandreturn",
    0x92: "resetfuncs",
    0x93: "pokemart",
    0x94: "elevator",
    0x95: "trade",
    0x96: "askforphonenumber",
    0x97: "phonecall",
    0x98: "hangup",
    0x99: "describedecoration",
    0x9A: "fruittree",
    0x9C: "checkphonecall",
    0x9D: "verbosegiveitem",
    0x9E: "loadwilddata",
    0x9F: "halloffame",
    0xA0: "credits",
    0xA1: "warpfacing",
    0xA2: "storetext",
    0xA3: "displaylocation",
}

#see http://www.pokecommunity.com/showpost.php?p=4347261
#NOTE: this has some updates that need to be back-ported to gold
pksv_crystal = {
    0x00: "2call",
    0x01: "3call",
    0x02: "2ptcall",
    0x03: "2jump",
    0x04: "3jump",
    0x05: "2ptjump",
    0x06: "if equal",
    0x07: "if not equal",
    0x08: "if false",
    0x09: "if true",
    0x0A: "if less than",
    0x0B: "if greater than",
    0x0C: "jumpstd",
    0x0D: "callstd",
    0x0E: "3callasm",
    0x0F: "special",
    0x10: "2ptcallasm",
    0x11: "checkmaptriggers",
    0x12: "domaptrigger",
    0x13: "checktriggers",
    0x14: "dotrigger",
    0x15: "writebyte",
    0x16: "addvar",
    0x17: "random",
    0x19: "copybytetovar",
    0x1A: "copyvartobyte", #loadvar?
    0x1C: "checkcode",
    0x1E: "writecode",
    0x1F: "giveitem",
    0x20: "takeitem",
    0x21: "checkitem",
    0x22: "givemoney",
    0x23: "takemoney",
    0x24: "checkmonkey",
    0x25: "givecoins",
    0x26: "takecoins",
    0x27: "checkcoins",
    0x2B: "checktime",
    0x2C: "checkpoke",
    0x2D: "givepoke",
    0x2E: "giveegg",
    0x2F: "givepokeitem",
    0x31: "checkbit1",
    0x32: "clearbit1",
    0x33: "setbit1",
    0x34: "checkbit2",
    0x35: "clearbit2",
    0x36: "setbit2",
    0x37: "wildoff",
    0x38: "wildon",
    0x39: "xycompare",
    0x3A: "warpmod",
    0x3B: "blackoutmod",
    0x3C: "warp",
    0x41: "itemtotext",
    0x43: "trainertotext",
    0x44: "stringtotext",
    0x45: "itemnotify",
    0x46: "pocketisfull",
    0x47: "loadfont",
    0x48: "refreshscreen",
    0x49: "loadmovesprites",
    0x4B: "3writetext",
    0x4C: "2writetext",
    0x4E: "yesorno",
    0x4F: "loadmenudata",
    0x50: "writebackup",
    0x51: "jumptextfaceplayer",
    0x53: "jumptext",
    0x54: "closetext",
    0x55: "keeptextopen",
    0x56: "pokepic",
    0x57: "pokepicyesorno",
    0x58: "interpretmenu",
    0x59: "interpretmenu2",
    0x5D: "loadpokedata",
    0x5E: "loadtrainer",
    0x5F: "startbattle",
    0x60: "returnafterbattle",
    0x61: "catchtutorial",
    0x64: "winlosstext",
    0x66: "talkaftercancel",
    0x68: "setlasttalked",
    0x69: "applymovement",
    0x6B: "faceplayer",
    0x6C: "faceperson",
    0x6D: "variablesprite",
    0x6E: "disappear",
    0x6F: "appear",
    0x70: "follow",
    0x71: "stopfollow",
    0x72: "moveperson",
    0x75: "showemote",
    0x76: "spriteface",
    0x77: "follownotexact",
    0x78: "earthquake",
    0x7A: "changeblock",
    0x7B: "reloadmap",
    0x7C: "reloadmappart",
    0x7D: "writecmdqueue",
    0x7E: "delcmdqueue",
    0x7F: "playmusic",
    0x80: "playrammusic",
    0x81: "musicfadeout",
    0x82: "playmapmusic",
    0x83: "reloadmapmusic",
    0x84: "cry",
    0x85: "playsound",
    0x86: "waitbutton",
    0x87: "warpsound",
    0x88: "specialsound",
    0x89: "passtoengine",
    0x8A: "newloadmap",
    0x8B: "pause",
    0x8C: "deactivatefacing",
    0x8D: "priorityjump",
    0x8E: "warpcheck",
    0x8F: "ptpriorityjump",
    0x90: "return",
    0x91: "end",
    0x92: "reloadandreturn",
    0x93: "resetfuncs",
    0x94: "pokemart",
    0x95: "elevator",
    0x96: "trade",
    0x97: "askforphonenumber",
    0x98: "phonecall",
    0x99: "hangup",
    0x9A: "describedecoration",
    0x9B: "fruittree",
    0x9C: "specialphonecall",
    0x9D: "checkphonecall",
    0x9E: "verbosegiveitem",
    0xA0: "loadwilddata",
    0xA1: "halloffame",
    0xA2: "credits",
    0xA3: "warpfacing",
    0xA4: "storetext",
    0xA5: "displaylocation",
}

#these have no pksv names as of pksv 2.1.1
pksv_crystal_unknowns = [
    0x9F,
    0xA6, 0xA7, 0xA8, 0xA9, 0xAA, 0xAB, 0xAC, 0xAD, 0xAE, 0xAF,
    0xB0, 0xB1, 0xB2, 0xB3, 0xB4, 0xB5, 0xB6, 0xB7, 0xB8,
    0xCC, 0xCD,
    0xD1, 0xD2, 0xD3, 0xD4, 0xD5, 0xD6, 
    0xE4, 0xE5, 0xE6, 0xE7, 0xE8, 0xE9, 0xEA, 0xEB, 0xEC, 0xED, 0xEE, 0xEF,
    0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0xF7, 0xF8,
    0xFA, 0xFB, 0xFC, 0xFD, 0xFE, 0xFF,
]

#use this to keep track of commands without pksv names
pksv_no_names = {}
def pretty_print_pksv_no_names():
    """just some nice debugging output
    use this to keep track of commands without pksv names
    pksv_no_names is created in parse_script_engine_script_at"""
    for (command_byte, addresses) in pksv_no_names.items():
        if command_byte in pksv_crystal_unknowns: continue
        print hex(command_byte) + " appearing in these scripts: "
        for address in addresses:
            print "    " + hex(address)

recursive_scripts = set([])
def rec_parse_script_engine_script_at(address, origin=None, debug=True):
    """this is called in parse_script_engine_script_at for recursion
    when this works it should be flipped back to using the regular
    parser."""
    recursive_scripts.add((address, origin))
    return parse_script_engine_script_at(address, origin=origin, debug=debug)
def find_broken_recursive_scripts(output=False, debug=True):
    """well.. these at least have a chance of maybe being broken?"""
    for r in list(recursive_scripts):
        script = {}
        length = "not counted here"
        if is_script_already_parsed_at(r[0]):
            script = script_parse_table[r[0]]
            length = str(len(script))
        if len(script) > 20 or script == {}:
            print "******************* begin"
            print "script at " + hex(r[0]) + " from main script " + hex(r[1]) + " with length: " + length
            if output:
                parse_script_engine_script_at(r[0], force=True, debug=True)
            print "==================== end"

stop_points = [0x1aafa2,
               0x9f58f, #battle tower
               0x9f62f, #battle tower
              ]
def parse_script_engine_script_at(address, map_group=None, map_id=None, force=False, debug=True, origin=False):
    """parses a script-engine script
    force=True if you want to re-parse and get the debug information"""
    global rom
    if rom == None:
        load_rom()
    
    if address in stop_points:
        print "got " + hex(address) + ".. map_group=" + str(map_group) + " map_id=" + str(map_id)
        return {}
    if address < 0x4000 and address not in [0x26ef, 0x114, 0x1108]:
        print "address is less than 0x4000.. address is: " + hex(address)
        sys.exit()
    
    #max number of commands in a 'recursive' script
    max_cmds = 150

    #check if work is being repeated
    if is_script_already_parsed_at(address) and not force:
        return script_parse_table[address]
    original_start_address = address
    #this next line stops the same script from being re-parsed multiple times
    #for instance.. maybe there's a script jump, then a jump back
    #the original script should only be parsed once
    script_parse_table[original_start_address:original_start_address+1] = "incomplete"
    #set up some variables
    commands = {}
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
            command["pointer"] = pointer
            print "in script starting at "+hex(original_start_address)+\
                  " about to parse script at "+hex(pointer)+\
                  " called by "+info+" byte="+hex(command_byte)
            script = rec_parse_script_engine_script_at(pointer, original_start_address)
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
            print "in script starting at "+hex(original_start_address)+\
                  " about to parse script at "+hex(pointer)+\
                  " called by "+info+" byte="+hex(command_byte)
            script = rec_parse_script_engine_script_at(pointer, original_start_address)
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
            print "in script starting at "+hex(original_start_address)+\
                  " about to parse script at "+hex(pointer)+\
                  " called by "+info+" byte="+hex(command_byte)
            script = rec_parse_script_engine_script_at(pointer, original_start_address)
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
            print "in script starting at "+hex(original_start_address)+\
                  " about to parse script at "+hex(pointer)+\
                  " called by "+info+" byte="+hex(command_byte)
            script = rec_parse_script_engine_script_at(pointer, original_start_address)
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
            print "in script starting at "+hex(original_start_address)+\
                  " about to parse script at "+hex(pointer)+\
                  " called by "+info+" byte="+hex(command_byte)
            script = rec_parse_script_engine_script_at(pointer, original_start_address)
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
            print "in script starting at "+hex(original_start_address)+\
                  " about to parse script at "+hex(command["target_pointer"])+\
                  " called by "+info+" byte="+hex(command_byte)
            script = rec_parse_script_engine_script_at(command["target_pointer"], original_start_address)
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
            print "in script starting at "+hex(original_start_address)+\
                  " about to parse script at "+hex(pointer)+\
                  " called by "+info+" byte="+hex(command_byte)
            script = rec_parse_script_engine_script_at(pointer, original_start_address)
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
            print "in script starting at "+hex(original_start_address)+\
                  " about to parse script at "+hex(pointer)+\
                  " called by "+info+" byte="+hex(command_byte)
            script = rec_parse_script_engine_script_at(pointer, original_start_address)
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
            print "in script starting at "+hex(original_start_address)+\
                  " about to parse script at "+hex(pointer)+\
                  " called by "+info+" byte="+hex(command_byte)
            script = rec_parse_script_engine_script_at(pointer, original_start_address)
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
            print "in script starting at "+hex(original_start_address)+\
                  " about to parse script at "+hex(pointer)+\
                  " called by "+info+" byte="+hex(command_byte)
            script = rec_parse_script_engine_script_at(pointer, original_start_address)
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
            print "in script starting at "+hex(original_start_address)+\
                  " about to parse script at "+hex(pointer)+\
                  " called by "+info+" byte="+hex(command_byte)
            script = rec_parse_script_engine_script_at(pointer, original_start_address)
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
            print "in script starting at "+hex(original_start_address)+\
                  " about to parse script at "+hex(pointer)+\
                  " called by "+info+" byte="+hex(command_byte)
            script = rec_parse_script_engine_script_at(pointer, original_start_address)
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
            command["text"] = parse_text_engine_script_at(command["pointer"], map_group=map_group, map_id=map_id)
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
            command["text"] = parse_text_engine_script_at(command["pointer"], map_group=map_group, map_id=map_id)
        elif command_byte == 0x4C: #Display text [2b]
            info = "Display text by pointer [xxyy]"
            long_info = """
            #Opens a text box and writes text. Doesn't load font.
            #[4C][2byte text pointer]
            """
            size = 3
            command["pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=False)
            command["text"] = parse_text_engine_script_at(command["pointer"], map_group=map_group, map_id=map_id)
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
            command["text"] = parse_text_engine_script_at(command["pointer"], map_group=map_id, map_id=map_id)
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
            command["text"] = parse_text_engine_script_at(command["pointer"], map_group=map_id, map_id=map_id)
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
            command["won_pointer"] = calculate_pointer_from_bytes_at(start_address+1, bank=False)
            command["lost_pointer"] = calculate_pointer_from_bytes_at(start_address+3, bank=False)
            command["text_won"] = parse_text_engine_script_at(command["won_pointer"], map_group=map_id, map_id=map_id)
            command["text_lost"] = parse_text_engine_script_at(command["lost_pointer"], map_group=map_id, map_id=map_id)
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
            print "in script starting at "+hex(original_start_address)+\
                  " about to parse script at "+hex(script_pointer)+\
                  " called by "+info+" byte="+hex(command_byte)
            script = rec_parse_script_engine_script_at(script_pointer, original_start_address)
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
            print "in script starting at "+hex(original_start_address)+\
                  " about to parse script at "+hex(script_pointer)+\
                  " called by "+info+" byte="+hex(command_byte)
            script = rec_parse_script_engine_script_at(script_pointer, original_start_address)
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

    script_parse_table[original_start_address : offset-1] = commands    
    return commands

def parse_warp_bytes(some_bytes, debug=True):
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
def parse_xy_trigger_bytes(some_bytes, bank=None, map_group=None, map_id=None, debug=True):
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
def parse_signpost_bytes(some_bytes, bank=None, map_group=None, map_id=None, debug=True):
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

        additional = {}
        if func in [0, 1, 2, 3, 4]:
            print "******* parsing signpost script.. signpost is at: x=" + str(x) + " y=" + str(y)
            script_ptr_byte1 = int(bytes[3], 16)
            script_ptr_byte2 = int(bytes[4], 16)
            script_pointer = script_ptr_byte1 + (script_ptr_byte2 << 8)
        
            script_address = None
            script = None
        
            script_address = calculate_pointer(script_pointer, bank)
            script = parse_script_engine_script_at(script_address, map_group=map_group, map_id=map_id)

            additional = {
            "script_ptr": script_pointer,
            "script_pointer": {"1": script_ptr_byte1, "2": script_ptr_byte2},
            "script_address": script_address,
            "script": script,
            }
        elif func in [5, 6]:
            print "******* parsing signpost script.. signpost is at: x=" + str(x) + " y=" + str(y)
            ptr_byte1 = int(bytes[3], 16)
            ptr_byte2 = int(bytes[4], 16)
            pointer = ptr_byte1 + (ptr_byte2 << 8)
            address = calculate_pointer(pointer, bank)
            bit_table_byte1 = ord(rom[address])
            bit_table_byte2 = ord(rom[address+1])
            script_ptr_byte1 = ord(rom[address+2])
            script_ptr_byte2 = ord(rom[address+3])
            script_address = calculate_pointer_from_bytes_at(address+2, bank=bank)
            script = parse_script_engine_script_at(script_address, map_group=map_group, map_id=map_id)
            
            additional = {
            "bit_table_bytes": {"1": bit_table_byte1, "2": bit_table_byte2},
            "script_ptr": script_ptr_byte1 + (script_ptr_byte2 << 8),
            "script_pointer": {"1": script_ptr_byte1, "2": script_ptr_byte2},
            "script_address": script_address,
            "script": script,
            }
        else:
            print ".. type 7 or 8 signpost not parsed yet."
        
        spost = {
            "y": y,
            "x": x,
            "func": func,
        }
        spost.update(additional)
        signposts.append(spost)
    return signposts
def parse_trainer_header_at(address, map_group=None, map_id=None, debug=True):
    """
    [Bit no. (2byte)][Trainer group][Trainer]
    [2byte pointer to Text when seen]
    [2byte pointer to text when trainer beaten]
    [2byte pointer to script when lost (0000=Blackout)]
    [2byte pointer to script if won/talked to again]
     
    The bit number tell the game later on if the trainer has been
    beaten already (bit = 1) or not (bit = 0). All Bit number of BitTable1.
     
    03 = Nothing
    04 = Nothing
    05 = Nothing
    06 = Nothing
    """
    bank = calculate_bank(address)
    bytes = rom_interval(address, 12, strings=False)
    bit_number = bytes[0] + (bytes[1] << 8)
    trainer_group = bytes[2]
    trainer_id = bytes[3]
    text_when_seen_ptr = calculate_pointer_from_bytes_at(address+4, bank=bank)
    text_when_seen = parse_text_engine_script_at(text_when_seen_ptr, map_group=map_group, map_id=map_id)
    text_when_trainer_beaten_ptr = calculate_pointer_from_bytes_at(address+6, bank=bank)
    text_when_trainer_beaten = parse_text_engine_script_at(text_when_trainer_beaten_ptr, map_group=map_group, map_id=map_id)

    if [ord(rom[address+8]), ord(rom[address+9])] == [0, 0]:
        script_when_lost_ptr = 0
        script_when_lost = None
    else:
        print "parsing script-when-lost"
        script_when_lost_ptr = calculate_pointer_from_bytes_at(address+8, bank=bank)
        script_when_lost = None
        silver_avoids = [0xfa53]
        if script_when_lost_ptr > 0x4000 and not script_when_lost_ptr in silver_avoids:
            script_when_lost = parse_script_engine_script_at(script_when_lost_ptr, map_group=map_group, map_id=map_id)
    
    print "parsing script-talk-again" #or is this a text?
    script_talk_again_ptr = calculate_pointer_from_bytes_at(address+10, bank=bank)
    script_talk_again = None
    if script_talk_again_ptr > 0x4000:
        script_talk_again = parse_script_engine_script_at(script_talk_again_ptr, map_group=map_group, map_id=map_id)
    
    return {
        "bit_number": bit_number,
        "trainer_group": trainer_group,
        "trainer_id": trainer_id,
        "text_when_seen_ptr": text_when_seen_ptr,
        "text_when_seen": text_when_seen,
        "text_when_trainer_beaten_ptr": text_when_trainer_beaten_ptr,
        "text_when_trainer_beaten": text_when_trainer_beaten,
        "script_when_lost_ptr": script_when_lost_ptr,
        "script_when_lost": script_when_lost,
        "script_talk_again_ptr": script_talk_again_ptr,
        "script_talk_again": script_talk_again,
    }
    
def parse_people_event_bytes(some_bytes, address=None, map_group=None, map_id=None, debug=True): #max of 14 people per map?
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
        
        lower_bits = color_function_byte & 0xF
        #lower_bits_high = lower_bits >> 2
        #lower_bits_low = lower_bits & 3
        higher_bits = color_function_byte >> 4
        #higher_bits_high = higher_bits >> 2
        #higher_bits_low = higher_bits & 3

        is_regular_script = lower_bits == 00
        #pointer points to script
        is_give_item = lower_bits == 01
        #pointer points to [Item no.][Amount]
        is_trainer = lower_bits == 02
        #pointer points to trainer header

        #goldmap called these next two bytes "text_block" and "text_bank"?
        script_pointer_byte1 = int(bytes[9], 16)
        script_pointer_byte2 = int(bytes[10], 16)
        script_pointer = script_pointer_byte1 + (script_pointer_byte2 << 8)
        #calculate the full address by assuming it's in the current bank
        #but what if it's not in the same bank?
        extra_portion = {}
        if bank:
            ptr_address = calculate_pointer(script_pointer, bank)
            if is_regular_script:
                print "parsing a person-script at x=" + str(x-4) + " y=" + str(y-4)
                script = parse_script_engine_script_at(ptr_address, map_group=map_group, map_id=map_id)
                extra_portion = {
                    "script_address": ptr_address,
                    "script": script,
                    "event_type": "script",
                }
            if is_give_item:
                print "... not parsing give item event... [item id][quantity]"
                extra_portion = {
                    "event_type": "give_item",
                    "give_item_data_address": ptr_address,
                    "item_id": ord(rom[ptr_address]),
                    "item_qty": ord(rom[ptr_address+1]),
                }
            if is_trainer:
                print "parsing a trainer (person-event) at x=" + str(x) + " y=" + str(y)
                parsed_trainer = parse_trainer_header_at(ptr_address, map_group=map_group, map_id=map_id)
                extra_portion = {
                    "event_type": "trainer",
                    "trainer_data_address": ptr_address,
                    "trainer_data": parsed_trainer,
                }
        
        #XXX not sure what's going on here
        #bit no. of bit table 1 (hidden if set)
        #note: FFFF for none
        when_byte = int(bytes[11], 16)
        hide = int(bytes[12], 16)

        bit_number_of_bit_table1_byte2 = int(bytes[11], 16)
        bit_number_of_bit_table1_byte1 = int(bytes[12], 16)
        bit_number_of_bit_table1 = bit_number_of_bit_table1_byte1 + (bit_number_of_bit_table1_byte2 << 8)

        people_event = {
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

            #"text_block": text_block,   #script pointer byte 1
            #"text_bank": text_bank,     #script pointer byte 2
            "when_byte": when_byte,      #bit no. of bit table 1 (hidden if set)
            "hide": hide,                #note: FFFF for none

            "is_trainer": is_trainer,
            "is_regular_script": is_regular_script,
            "is_give_item": is_give_item,
        }
        people_event.update(extra_portion)
        people_events.append(people_event)
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

def parse_map_header_at(address, map_group=None, map_id=None, debug=True):
    """parses an arbitrary map header at some address"""
    print "parsing a map header at: " + hex(address)
    bytes = rom_interval(address, map_header_byte_size, strings=False, debug=debug)
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
    print "second map header address is: " + hex(second_map_header_address)
    map_header.update(parse_second_map_header_at(second_map_header_address, debug=debug))
    map_header.update(parse_map_event_header_at(map_header["event_address"], map_group=map_group, map_id=map_id, debug=debug))
    #maybe this next one should be under the "scripts" key?
    map_header.update(parse_map_script_header_at(map_header["script_address"], map_group=map_group, map_id=map_id, debug=debug))
    return map_header

def parse_second_map_header_at(address, map_group=None, map_id=None, debug=True):
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

def parse_map_event_header_at(address, map_group=None, map_id=None, debug=True):
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
  
    #people events
    people_event_count = ord(rom[after_signposts])
    people_event_byte_count = people_event_byte_size * people_event_count
    people_events_bytes = rom_interval(after_signposts+1, people_event_byte_count)
    people_events = parse_people_event_bytes(people_events_bytes, address=after_signposts+1, map_group=map_group, map_id=map_id)
    returnable.update({"people_event_count": people_event_count, "people_events": people_events})

    return returnable

def parse_map_script_header_at(address, map_group=None, map_id=None, debug=True):
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
    print "starting to parse the map's script header.."
    #[[Number1 of pointers] Number1 * [2byte pointer to script][00][00]]
    ptr_line_size = 4 #[2byte pointer to script][00][00]
    trigger_ptr_cnt = ord(rom[address])
    trigger_pointers = grouper(rom_interval(address+1, trigger_ptr_cnt * ptr_line_size, strings=False), count=ptr_line_size)
    triggers = {}
    for index, trigger_pointer in enumerate(trigger_pointers):
        print "parsing a trigger header..."
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
        print "parsing a callback header..."
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

def parse_map_header_by_id(*args, **kwargs):
    """convenience function to parse a specific map"""
    map_group, map_id = None, None
    if "map_group" in kwargs.keys():
        map_group = kwargs["map_group"]
    if "map_id" in kwargs.keys():
        map_id = kwargs["map_id"]
    if (map_group == None and map_id != None) or \
       (map_group != None and map_id == None):
        raise Exception, "map_group and map_id must both be provided"
    elif map_group == None and map_id == None and len(args) == 0:
        raise Exception, "must be given an argument"
    elif len(args) == 1 and type(args[0]) == str:
        map_group = int(args[0].split(".")[0])
        map_id = int(args[0].split(".")[1])
    else:
        raise Exception, "dunno what to do with input"
    offset = map_names[map_group]["offset"]
    map_header_offset = offset + ((map_id - 1) * map_header_byte_size)
    return parse_map_header_at(map_header_offset, map_group=map_group, map_id=map_id)

def parse_all_map_headers(debug=True):
    """calls parse_map_header_at for each map in each map group"""
    global map_names
    if not map_names[1].has_key("offset"):
        raise Exception, "dunno what to do - map_names should have groups with pre-calculated offsets by now"
    for group_id, group_data in map_names.items():
        offset = group_data["offset"]
        #we only care about the maps
        #del group_data["offset"]
        for map_id, map_data in group_data.items():
            if map_id == "offset": continue #skip the "offset" address for this map group
            if debug: print "map_group is: " + str(group_id) + "  map_id is: " + str(map_id)
            map_header_offset = offset + ((map_id - 1) * map_header_byte_size)
            parsed_map = parse_map_header_at(map_header_offset, map_group=group_id, map_id=map_id, debug=debug)
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
        0xD: {"name": "Burned Tower 1F"},
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

#### generic testing ####

class TestCram(unittest.TestCase):
    "this is where i cram all of my unit tests together"
    @classmethod
    def setUpClass(cls):
        global rom
        cls.rom = load_rom()
        rom = cls.rom
    @classmethod
    def tearDownClass(cls):
        del cls.rom
    def test_generic_useless(self):
        "do i know how to write a test?"
        self.assertEqual(1, 1)
    def test_map_name_cleaner(self):
        name = "hello world"
        cleaned_name = map_name_cleaner(name)
        self.assertNotEqual(name, cleaned_name)
        self.failUnless(" " not in cleaned_name)
        name = "Some Random Pokémon Center"
        cleaned_name = map_name_cleaner(name)
        self.assertNotEqual(name, cleaned_name)
        self.failIf(" " in cleaned_name)
        self.failIf("é" in cleaned_name)
    def test_grouper(self):
        data = range(0, 10)
        groups = grouper(data, count=2)
        self.assertEquals(len(groups), 5)
        data = range(0, 20)
        groups = grouper(data, count=2)
        self.assertEquals(len(groups), 10)
        self.assertNotEqual(data, groups)
        self.assertNotEqual(len(data), len(groups))
    def test_load_rom(self):
        rom = self.rom
        self.assertEqual(len(rom), 2097152)
        self.failUnless(isinstance(rom, RomStr))
    def test_load_asm(self):
        asm = load_asm()
        joined_lines = "\n".join(asm)
        self.failUnless("SECTION" in joined_lines)
        self.failUnless("bank" in joined_lines)
        self.failUnless(isinstance(asm, AsmList))
    def test_rom_file_existence(self):
        "ROM file must exist"
        self.failUnless("baserom.gbc" in os.listdir("../"))
    def test_rom_md5(self):
        "ROM file must have the correct md5 sum"
        rom = self.rom
        correct = "9f2922b235a5eeb78d65594e82ef5dde"
        md5sum = md5.md5(rom).hexdigest()
        self.assertEqual(md5sum, correct)
    def test_bizarre_http_presence(self):
        rom_segment = self.rom[0x112116:0x112116+8]
        self.assertEqual(rom_segment, "HTTP/1.0")
    def test_rom_interval(self):
        address = 0x100
        interval = 10
        correct_strings = ['0x0', '0xc3', '0x6e', '0x1', '0xce',
                           '0xed', '0x66', '0x66', '0xcc', '0xd']
        byte_strings = rom_interval(address, interval, strings=True)
        self.assertEqual(byte_strings, correct_strings)
        correct_ints = [0, 195, 110, 1, 206, 237, 102, 102, 204, 13]
        ints = rom_interval(address, interval, strings=False)
        self.assertEqual(ints, correct_ints)
    def test_rom_until(self):
        address = 0x1337
        byte = 0x13
        bytes = rom_until(address, byte, strings=True)
        self.failUnless(len(bytes) == 3)
        self.failUnless(bytes[0] == '0xd5')
        bytes = rom_until(address, byte, strings=False)
        self.failUnless(len(bytes) == 3)
        self.failUnless(bytes[0] == 0xd5)
    def test_how_many_until(self):
        how_many = how_many_until(chr(0x13), 0x1337)
        self.assertEqual(how_many, 3)
    def test_calculate_bank(self):
        self.failUnless(calculate_bank(0x8000) == 2)
        self.failUnless(calculate_bank("0x9000") == 2)
        self.failUnless(calculate_bank(0) == 0)
        for address in [0x4000, 0x5000, 0x6000, 0x7000]:
            self.assertRaises(Exception, calculate_bank, address)
    def test_calculate_pointer(self):
        pass #or raise NotImplementedError, bryan_message
    def test_calculate_pointer_from_bytes_at(self):
        pass #or raise NotImplementedError, bryan_message
    def test_rom_text_at(self):
        self.assertEquals(rom_text_at(0x112116, 8), "HTTP/1.0")
    def test_find_all_text_pointers_in_script_engine_script(self):
        "finds text pointers from scripts"
        pass #or raise NotImplementedError, bryan_message
    def test_translate_command_byte(self):
        self.failUnless(translate_command_byte(crystal=0x0) == 0x0)
        self.failUnless(translate_command_byte(crystal=0x10) == 0x10)
        self.failUnless(translate_command_byte(crystal=0x40) == 0x40)
        self.failUnless(translate_command_byte(gold=0x0) == 0x0)
        self.failUnless(translate_command_byte(gold=0x10) == 0x10)
        self.failUnless(translate_command_byte(gold=0x40) == 0x40)
        self.assertEqual(translate_command_byte(gold=0x0), translate_command_byte(crystal=0x0))
        self.failUnless(translate_command_byte(gold=0x52) == 0x53)
        self.failUnless(translate_command_byte(gold=0x53) == 0x54)
        self.failUnless(translate_command_byte(crystal=0x53) == 0x52)
        self.failUnless(translate_command_byte(crystal=0x52) == None)
        self.assertRaises(Exception, translate_command_byte, None, gold=0xA4)
    def test_pksv_integrity(self):
        "does pksv_gs look okay?"
        self.assertEqual(pksv_gs[0x00], "2call")
        self.assertEqual(pksv_gs[0x2D], "givepoke")
        self.assertEqual(pksv_gs[0x85], "waitbutton")
        self.assertEqual(pksv_crystal[0x00], "2call")
        self.assertEqual(pksv_crystal[0x86], "waitbutton")
        self.assertEqual(pksv_crystal[0xA2], "credits")
    def test_chars_integrity(self):
        self.assertEqual(chars[0x80], "A")
        self.assertEqual(chars[0xA0], "a")
        self.assertEqual(chars[0xF0], "¥")
        self.assertEqual(jap_chars[0x44], "ぱ")
    def test_map_names_integrity(self):
        def map_name(map_group, map_id): return map_names[map_group][map_id]["name"]
        self.assertEqual(map_name(2, 7), "Mahogany Town")
        self.assertEqual(map_name(3, 0x34), "Ilex Forest")
        self.assertEqual(map_name(7, 0x11), "Cerulean City")
class TestIntervalMap(unittest.TestCase):
    def test_intervals(self):
        i = IntervalMap()
        first = "hello world"
        second = "testing 123"
        i[0:5] = first
        i[5:10] = second
        self.assertEqual(i[0], first)
        self.assertEqual(i[1], first)
        self.assertNotEqual(i[5], first)
        self.assertEqual(i[6], second)
        i[3:10] = second
        self.assertEqual(i[3], second)
        self.assertNotEqual(i[4], first)
    def test_items(self):
        i = IntervalMap()
        first = "hello world"
        second = "testing 123"
        i[0:5] = first
        i[5:10] = second
        results = list(i.items())
        self.failUnless(len(results) == 2)
        self.assertEqual(results[0], ((0, 5), "hello world"))
        self.assertEqual(results[1], ((5, 10), "testing 123"))
class TestRomStr(unittest.TestCase):
    """RomStr is a class that should act exactly like str()
    except that it never shows the contents of it string
    unless explicitly forced"""
    sample_text = "hello world!"
    sample = None
    def setUp(self):
        if self.sample == None:
            self.__class__.sample = RomStr(self.sample_text)
    def test_equals(self):
        "check if RomStr() == str()"
        self.assertEquals(self.sample_text, self.sample)
    def test_not_equal(self):
        "check if RomStr('a') != RomStr('b')"
        self.assertNotEqual(RomStr('a'), RomStr('b'))
    def test_appending(self):
        "check if RomStr()+'a'==str()+'a'"
        self.assertEquals(self.sample_text+'a', self.sample+'a')
    def test_conversion(self):
        "check if RomStr() -> str() works"
        self.assertEquals(str(self.sample), self.sample_text)
    def test_inheritance(self):
        self.failUnless(issubclass(RomStr, str))
    def test_length(self):
        self.assertEquals(len(self.sample_text), len(self.sample))
        self.assertEquals(len(self.sample_text), self.sample.length())
        self.assertEquals(len(self.sample), self.sample.length())
class TestAsmList(unittest.TestCase):
    """AsmList is a class that should act exactly like list()
    except that it never shows the contents of its list
    unless explicitly forced"""
    def test_equals(self):
        base = [1,2,3]
        asm = AsmList(base)
        self.assertEquals(base, asm)
        self.assertEquals(asm, base)
        self.assertEquals(base, list(asm))
    def test_inheritance(self):
        self.failUnless(issubclass(AsmList, list))
    def test_length(self):
        base = range(0, 10)
        asm = AsmList(base)
        self.assertEquals(len(base), len(asm))
        self.assertEquals(len(base), asm.length())
        self.assertEquals(len(base), len(list(asm)))
        self.assertEquals(len(asm), asm.length())
class TestMapParsing(unittest.TestCase):
    def test_parse_warp_bytes(self):
        pass #or raise NotImplementedError, bryan_message
    def test_parse_xy_trigger_bytes(self):
        pass #or raise NotImplementedError, bryan_message
    def test_parse_signpost_bytes(self):
        pass #or raise NotImplementedError, bryan_message
    def test_parse_people_event_bytes(self):
        pass #or raise NotImplementedError, bryan_message
    def test_parse_trainer_header_at(self):
        pass #or raise NotImplementedError, bryan_message
    def test_parse_map_header_at(self):
        pass #or raise NotImplementedError, bryan_message
    def test_parse_second_map_header_at(self):
        pass #or raise NotImplementedError, bryan_message
    def test_parse_map_event_header_at(self):
        pass #or raise NotImplementedError, bryan_message
    def test_parse_map_script_header_at(self):
        pass #or raise NotImplementedError, bryan_message
    def test_parse_map_header_by_id(self):
        pass #or raise NotImplementedError, bryan_message
    def test_parse_all_map_headers(self):
        global parse_map_header_at, counter
        counter = 0
        for k in map_names.keys():
            if "offset" not in map_names[k].keys():
                map_names[k]["offset"] = 0
        temp = parse_map_header_at
        def parse_map_header_at(address, map_group=None, map_id=None, debug=False):
            global counter
            counter += 1
            return {}
        parse_all_map_headers(debug=False)
        self.assertEqual(counter, 388)
        parse_map_header_at = temp
class TestTextScript(unittest.TestCase):
    def test_to_asm(self):
        pass #or raise NotImplementedError, bryan_message
    def test_find_addresses(self):
        pass #or raise NotImplementedError, bryan_message
    def test_parse_text_at(self):
        pass #or raise NotImplementedError, bryan_message
    def test_to_asm_at(self):
        pass #or raise NotImplementedError, bryan_message
class TestEncodedText(unittest.TestCase):
    def test_to_asm(self):
        pass #or raise NotImplementedError, bryan_message
    def test_process_00_subcommands(self):
        pass #or raise NotImplementedError, bryan_message
    def test_from_bytes(self):
        pass #or raise NotImplementedError, bryan_message
    def test_parse_text_at(self):
        pass #or raise NotImplementedError, bryan_message
class TestScript(unittest.TestCase):
    """for testing parse_script_engine_script_at
    and script parsing in general.
    Script should be a class?"""
    def test_parse_script_engine_script_at(self):
        pass #or raise NotImplementedError, bryan_message
class TestMetaTesting(unittest.TestCase):
    """test whether or not i am finding at least
    some of the tests in this file"""
    tests = None
    def setUp(self):
        if self.tests == None:
            self.__class__.tests = assemble_test_cases()
    def test_assemble_test_cases_count(self):
        "does assemble_test_cases find some tests?"
        self.failUnless(len(self.tests) > 0)
    def test_assemble_test_cases_inclusion(self):
        "is this class found by assemble_test_cases?"
        #i guess it would have to be for this to be running?
        self.failUnless(self.__class__ in self.tests)
    def test_assemble_test_cases_others(self):
        "test other inclusions for assemble_test_cases"
        self.failUnless(TestRomStr in self.tests)
        self.failUnless(TestCram in self.tests)
    def test_check_has_test(self):
        self.failUnless(check_has_test("beaver", ["test_beaver"]))
        self.failUnless(check_has_test("beaver", ["test_beaver_2"]))
        self.failIf(check_has_test("beaver_1", ["test_beaver"]))
    def test_find_untested_methods(self):
        untested = find_untested_methods()
        #the return type must be an iterable
        self.failUnless(hasattr(untested, "__iter__"))
        #.. basically, a list
        self.failUnless(isinstance(untested, list))
    def test_find_untested_methods_method(self):
        """create a function and see if it is found"""
        #setup a function in the global namespace
        global some_random_test_method
        #define the method
        def some_random_test_method(): pass
        #first make sure it is in the global scope
        members = inspect.getmembers(sys.modules[__name__], inspect.isfunction)
        func_names = [functuple[0] for functuple in members]
        self.assertIn("some_random_test_method", func_names)
        #test whether or not it is found by find_untested_methods
        untested = find_untested_methods()
        self.assertIn("some_random_test_method", untested)
        #remove the test method from the global namespace
        del some_random_test_method
    def test_load_tests(self):
        loader = unittest.TestLoader()
        suite = load_tests(loader, None, None)
        suite._tests[0]._testMethodName
        membership_test = lambda member: \
            inspect.isclass(member) and issubclass(member, unittest.TestCase)
        tests = inspect.getmembers(sys.modules[__name__], membership_test)
        classes = [x[1] for x in tests]
        for test in suite._tests:
            self.assertIn(test.__class__, classes)
    def test_report_untested(self):
        untested = find_untested_methods()
        output = report_untested()
        if len(untested) > 0:
            self.assertIn("NOT TESTED", output)
            for name in untested:
                self.assertIn(name, output)
        elif len(untested) == 0:
            self.assertNotIn("NOT TESTED", output)
def assemble_test_cases():
    """finds classes that inherit from unittest.TestCase
    because i am too lazy to remember to add them to a 
    global list of tests for the suite runner"""
    classes = []
    clsmembers = inspect.getmembers(sys.modules[__name__], inspect.isclass)
    for (name, some_class) in clsmembers:
        if issubclass(some_class, unittest.TestCase):
            classes.append(some_class)
    return classes
def load_tests(loader, tests, pattern):
    suite = unittest.TestSuite()
    for test_class in assemble_test_cases():
        tests = loader.loadTestsFromTestCase(test_class)
        suite.addTests(tests)
    return suite
def check_has_test(func_name, tested_names):
    """checks if there is a test dedicated to this function"""
    if "test_"+func_name in tested_names:
        return True
    for name in tested_names:
        if "test_"+func_name in name:
            return True
    return False
def find_untested_methods():
    """finds all untested functions in this module
    by searching for method names in test case
    method names."""
    untested = []
    avoid_funcs = ["main", "run_tests", "copy", "deepcopy"]
    test_funcs = []
    #get a list of all classes in this module
    classes = inspect.getmembers(sys.modules[__name__], inspect.isclass)
    #for each class..
    for (name, klass) in classes:
        #only look at those that have tests
        if issubclass(klass, unittest.TestCase):
            #look at this class' methods
            funcs = inspect.getmembers(klass, inspect.ismethod)
            #for each method..
            for (name2, func) in funcs:
                #store the ones that begin with test_
                if "test_" in name2 and name2[0:5] == "test_":
                    test_funcs.append([name2, func])
    #assemble a list of all test method names (test_x, test_y, ..)
    tested_names = [funcz[0] for funcz in test_funcs]
    #now get a list of all functions in this module
    funcs = inspect.getmembers(sys.modules[__name__], inspect.isfunction)
    #for each function..
    for (name, func) in funcs:
        #we don't care about some of these
        if name in avoid_funcs: continue
        #check if this function has a test named after it
        has_test = check_has_test(name, tested_names)
        if not has_test:
            untested.append(name)
    return untested
def report_untested():
    untested = find_untested_methods()
    output = "NOT TESTED: " + str(untested)
    return output

#### ways to run this file ####

def run_tests(): #rather than unittest.main()
    loader = unittest.TestLoader()
    suite = load_tests(loader, None, None)
    unittest.TextTestRunner(verbosity=2).run(suite)
    print report_untested()
def run_main():
    #read the rom and figure out the offsets for maps
    load_rom()
    load_map_group_offsets()
    #add the offsets into our map structure, why not (johto maps only)
    [map_names[map_group_id+1].update({"offset": offset}) for map_group_id, offset in enumerate(map_group_offsets)]
    #parse map header bytes for each map
    parse_all_map_headers()
#just a helpful alias
main=run_main
#when you run the file.. do unit tests
if __name__ == "__main__":
    run_tests()
#when you load the module.. parse everything
elif __name__ == "crystal": pass
    #run_main()
