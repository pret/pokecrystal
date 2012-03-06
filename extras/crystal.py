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

def parse_script_at(address):
    """parses a script-engine script"""
    return {}

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
def parse_xy_trigger_bytes(some_bytes, bank=None):
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
            script = parse_script_at(script_address)
        
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
def parse_signpost_bytes(some_bytes, bank=None):
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
            script_address = calculate_pointer(script_pointer, bank)
            script = parse_script_at(script)
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
def parse_people_event_bytes(some_bytes, address=None): #max of 14 people per map?
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
            script_address = calculate_pointer(script_pointer, bank)
            script = parse_script_at(script_address)

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

def parse_map_header_at(address):
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
    map_header.update(parse_map_event_header_at(map_header["event_address"]))
    #maybe this next one should be under the "scripts" key?
    map_header.update(parse_map_script_header_at(map_header["script_address"]))
    return map_header

def parse_second_map_header_at(address):
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

def parse_map_event_header_at(address):
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
    returnable.update({"xy_trigger_count": trigger_count, "xy_triggers": parse_xy_trigger_bytes(triggers, bank=bank)})
    
    #signposts
    signpost_count = ord(rom[after_triggers])
    signpost_byte_count = signpost_byte_size * signpost_count
    signposts = rom_interval(after_triggers+1, signpost_byte_count)
    after_signposts = after_triggers + 1 + signpost_byte_count
    returnable.update({"signpost_count": signpost_count, "signposts": parse_signpost_bytes(signposts, bank=bank)})
    
    #people events
    people_event_count = ord(rom[after_signposts])
    people_event_byte_count = people_event_byte_size * people_event_count
    people_events = rom_interval(after_signposts+1, people_event_byte_count)
    returnable.update({"people_event_count": people_event_count, "people_events": parse_people_event_bytes(people_events, address=after_signposts+1)})

    return returnable

def parse_map_script_header_at(address):
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
        trigger_script  = parse_script_at(trigger_address)
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
        callback_script = parse_script_at(callback_address)
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
            parsed_map = parse_map_header_at(map_header_offset)
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
        0x6: {"name": "Route 43"},
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
