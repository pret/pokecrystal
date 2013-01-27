# -*- coding: utf-8 -*-

import os
import sys
import inspect
from copy import copy
import hashlib
import random
import json

from interval_map import IntervalMap
from chars import chars, jap_chars

from romstr import (
    RomStr,
    AsmList,
)

from item_constants import (
    item_constants,
    find_item_label_by_id,
    generate_item_constants,
)

from pointers import (
    calculate_bank,
    calculate_pointer,
)

from pksv import (
    pksv_gs,
    pksv_crystal,
)

from crystal import (
    rom,
    load_rom,
    rom_until,
    direct_load_rom,
    parse_script_engine_script_at,
    parse_text_engine_script_at,
    parse_text_at2,
    find_all_text_pointers_in_script_engine_script,
    SingleByteParam,
    HexByte,
    MultiByteParam,
    PointerLabelParam,
    ItemLabelByte,
    DollarSignByte,
    DecimalParam,
    rom_interval,
    map_names,
    Label,
    scan_for_predefined_labels,
    all_labels,
    write_all_labels,
    parse_map_header_at,
    old_parse_map_header_at,
    process_00_subcommands,
    parse_all_map_headers,
    translate_command_byte,
    map_name_cleaner,
    load_map_group_offsets,
    load_asm,
    asm,
    is_valid_address,
    index,
    how_many_until,
    grouper,
    get_pokemon_constant_by_id,
    generate_map_constant_labels,
    get_map_constant_label_by_id,
    get_id_for_map_constant_label,
    calculate_pointer_from_bytes_at,
    isolate_incbins,
    remove_quoted_text,
    process_incbins,
    line_has_label,
    line_has_comment_address,
    get_labels_between,
    get_label_from_line,
    generate_diff_insert,
    find_labels_without_addresses,
    rom_text_at,
    get_label_for,
    split_incbin_line_into_three,
    reset_incbins,
)

# for testing all this crap
try:
    import unittest2 as unittest
except ImportError:
    import unittest

# check for things we need in unittest
if not hasattr(unittest.TestCase, 'setUpClass'):
    sys.stderr.write("The unittest2 module or Python 2.7 is required to run this script.")
    sys.exit(1)

class TestCram(unittest.TestCase):
    "this is where i cram all of my unit tests together"

    @classmethod
    def setUpClass(cls):
        global rom
        cls.rom = direct_load_rom()
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

    def test_direct_load_rom(self):
        rom = self.rom
        self.assertEqual(len(rom), 2097152)
        self.failUnless(isinstance(rom, RomStr))

    def test_load_rom(self):
        global rom
        rom = None
        load_rom()
        self.failIf(rom == None)
        rom = RomStr(None)
        load_rom()
        self.failIf(rom == RomStr(None))

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
        md5 = hashlib.md5()
        md5.update(rom)
        md5sum = md5.hexdigest()
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
        # for offset <= 0x4000
        self.assertEqual(calculate_pointer(0x0000), 0x0000)
        self.assertEqual(calculate_pointer(0x3FFF), 0x3FFF)
        # for 0x4000 <= offset <= 0x7FFFF
        self.assertEqual(calculate_pointer(0x430F, bank=5), 0x1430F)
        # for offset >= 0x7FFF
        self.assertEqual(calculate_pointer(0x8FFF, bank=6), calculate_pointer(0x8FFF, bank=7))

    def test_calculate_pointer_from_bytes_at(self):
        addr1 = calculate_pointer_from_bytes_at(0x100, bank=False)
        self.assertEqual(addr1, 0xc300)
        addr2 = calculate_pointer_from_bytes_at(0x100, bank=True)
        self.assertEqual(addr2, 0x2ec3)

    def test_rom_text_at(self):
        self.assertEquals(rom_text_at(0x112116, 8), "HTTP/1.0")

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

    def test_load_map_group_offsets(self):
        addresses = load_map_group_offsets()
        self.assertEqual(len(addresses), 26, msg="there should be 26 map groups")
        addresses = load_map_group_offsets()
        self.assertEqual(len(addresses), 26, msg="there should still be 26 map groups")
        self.assertIn(0x94034, addresses)
        for address in addresses:
            self.assertGreaterEqual(address, 0x4000)
            self.failIf(0x4000 <= address <= 0x7FFF)
            self.failIf(address <= 0x4000)

    def test_index(self):
        self.assertTrue(index([1,2,3,4], lambda f: True) == 0)
        self.assertTrue(index([1,2,3,4], lambda f: f==3) == 2)

    def test_get_pokemon_constant_by_id(self):
        x = get_pokemon_constant_by_id
        self.assertEqual(x(1), "BULBASAUR")
        self.assertEqual(x(151), "MEW")
        self.assertEqual(x(250), "HO_OH")

    def test_find_item_label_by_id(self):
        x = find_item_label_by_id
        self.assertEqual(x(249), "HM_07")
        self.assertEqual(x(173), "BERRY")
        self.assertEqual(x(45), None)

    def test_generate_item_constants(self):
        x = generate_item_constants
        r = x()
        self.failUnless("HM_07" in r)
        self.failUnless("EQU" in r)

    def test_get_label_for(self):
        global all_labels
        temp = copy(all_labels)
        # this is basd on the format defined in get_labels_between
        all_labels = [{"label": "poop", "address": 0x5,
                       "offset": 0x5, "bank": 0,
                       "line_number": 2
                     }]
        self.assertEqual(get_label_for(5), "poop")
        all_labels = temp

    def test_generate_map_constant_labels(self):
        ids = generate_map_constant_labels()
        self.assertEqual(ids[0]["label"], "OLIVINE_POKECENTER_1F")
        self.assertEqual(ids[1]["label"], "OLIVINE_GYM")

    def test_get_id_for_map_constant_label(self):
        global map_internal_ids
        map_internal_ids = generate_map_constant_labels()
        self.assertEqual(get_id_for_map_constant_label("OLIVINE_GYM"), 1)
        self.assertEqual(get_id_for_map_constant_label("OLIVINE_POKECENTER_1F"), 0)

    def test_get_map_constant_label_by_id(self):
        global map_internal_ids
        map_internal_ids = generate_map_constant_labels()
        self.assertEqual(get_map_constant_label_by_id(0), "OLIVINE_POKECENTER_1F")
        self.assertEqual(get_map_constant_label_by_id(1), "OLIVINE_GYM")

    def test_is_valid_address(self):
        self.assertTrue(is_valid_address(0))
        self.assertTrue(is_valid_address(1))
        self.assertTrue(is_valid_address(10))
        self.assertTrue(is_valid_address(100))
        self.assertTrue(is_valid_address(1000))
        self.assertTrue(is_valid_address(10000))
        self.assertFalse(is_valid_address(2097153))
        self.assertFalse(is_valid_address(2098000))
        addresses = [random.randrange(0,2097153) for i in range(0, 9+1)]
        for address in addresses:
            self.assertTrue(is_valid_address(address))

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

    def test_rom_interval(self):
        global rom
        load_rom()
        address = 0x100
        interval = 10
        correct_strings = ['0x0', '0xc3', '0x6e', '0x1', '0xce',
                           '0xed', '0x66', '0x66', '0xcc', '0xd']
        byte_strings = rom.interval(address, interval, strings=True)
        self.assertEqual(byte_strings, correct_strings)
        correct_ints = [0, 195, 110, 1, 206, 237, 102, 102, 204, 13]
        ints = rom.interval(address, interval, strings=False)
        self.assertEqual(ints, correct_ints)

    def test_rom_until(self):
        global rom
        load_rom()
        address = 0x1337
        byte = 0x13
        bytes = rom.until(address, byte, strings=True)
        self.failUnless(len(bytes) == 3)
        self.failUnless(bytes[0] == '0xd5')
        bytes = rom.until(address, byte, strings=False)
        self.failUnless(len(bytes) == 3)
        self.failUnless(bytes[0] == 0xd5)

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

    def test_remove_quoted_text(self):
        x = remove_quoted_text
        self.assertEqual(x("hello world"), "hello world")
        self.assertEqual(x("hello \"world\""), "hello ")
        input = 'hello world "testing 123"'
        self.assertNotEqual(x(input), input)
        input = "hello world 'testing 123'"
        self.assertNotEqual(x(input), input)
        self.failIf("testing" in x(input))

    def test_line_has_comment_address(self):
        x = line_has_comment_address
        self.assertFalse(x(""))
        self.assertFalse(x(";"))
        self.assertFalse(x(";;;"))
        self.assertFalse(x(":;"))
        self.assertFalse(x(":;:"))
        self.assertFalse(x(";:"))
        self.assertFalse(x(" "))
        self.assertFalse(x("".join(" " * 5)))
        self.assertFalse(x("".join(" " * 10)))
        self.assertFalse(x("hello world"))
        self.assertFalse(x("hello_world"))
        self.assertFalse(x("hello_world:"))
        self.assertFalse(x("hello_world:;"))
        self.assertFalse(x("hello_world: ;"))
        self.assertFalse(x("hello_world: ; "))
        self.assertFalse(x("hello_world: ;" + "".join(" " * 5)))
        self.assertFalse(x("hello_world: ;" + "".join(" " * 10)))
        self.assertTrue(x(";1"))
        self.assertTrue(x(";F"))
        self.assertTrue(x(";$00FF"))
        self.assertTrue(x(";0x00FF"))
        self.assertTrue(x("; 0x00FF"))
        self.assertTrue(x(";$3:$300"))
        self.assertTrue(x(";0x3:$300"))
        self.assertTrue(x(";$3:0x300"))
        self.assertTrue(x(";3:300"))
        self.assertTrue(x(";3:FFAA"))
        self.assertFalse(x('hello world "how are you today;0x1"'))
        self.assertTrue(x('hello world "how are you today:0x1";1'))
        returnable = {}
        self.assertTrue(x("hello_world: ; 0x4050", returnable=returnable, bank=5))
        self.assertTrue(returnable["address"] == 0x14050)

    def test_line_has_label(self):
        x = line_has_label
        self.assertTrue(x("hi:"))
        self.assertTrue(x("Hello: "))
        self.assertTrue(x("MyLabel: ; test xyz"))
        self.assertFalse(x(":"))
        self.assertFalse(x(";HelloWorld:"))
        self.assertFalse(x("::::"))
        self.assertFalse(x(":;:;:;:::"))

    def test_get_label_from_line(self):
        x = get_label_from_line
        self.assertEqual(x("HelloWorld: "), "HelloWorld")
        self.assertEqual(x("HiWorld:"), "HiWorld")
        self.assertEqual(x("HiWorld"), None)

    def test_find_labels_without_addresses(self):
        global asm
        asm = ["hello_world: ; 0x1", "hello_world2: ;"]
        labels = find_labels_without_addresses()
        self.failUnless(labels[0]["label"] == "hello_world2")
        asm = ["hello world: ;1", "hello_world: ;2"]
        labels = find_labels_without_addresses()
        self.failUnless(len(labels) == 0)
        asm = None

    def test_get_labels_between(self):
        global asm
        x = get_labels_between#(start_line_id, end_line_id, bank)
        asm = ["HelloWorld: ;1",
               "hi:",
               "no label on this line",
              ]
        labels = x(0, 2, 0x12)
        self.assertEqual(len(labels), 1)
        self.assertEqual(labels[0]["label"], "HelloWorld")
        del asm

    # this test takes a lot of time :(
    def xtest_scan_for_predefined_labels(self):
        # label keys: line_number, bank, label, offset, address
        load_asm()
        all_labels = scan_for_predefined_labels()
        label_names = [x["label"] for x in all_labels]
        self.assertIn("GetFarByte", label_names)
        self.assertIn("AddNTimes", label_names)
        self.assertIn("CheckShininess", label_names)

    def test_write_all_labels(self):
        """dumping json into a file"""
        filename = "test_labels.json"
        # remove the current file
        if os.path.exists(filename):
            os.system("rm " + filename)
        # make up some labels
        labels = []
        # fake label 1
        label = {"line_number": 5, "bank": 0, "label": "SomeLabel", "address": 0x10}
        labels.append(label)
        # fake label 2
        label = {"line_number": 15, "bank": 2, "label": "SomeOtherLabel", "address": 0x9F0A}
        labels.append(label)
        # dump to file
        write_all_labels(labels, filename=filename)
        # open the file and read the contents
        file_handler = open(filename, "r")
        contents = file_handler.read()
        file_handler.close()
        # parse into json
        obj = json.read(contents)
        # begin testing
        self.assertEqual(len(obj), len(labels))
        self.assertEqual(len(obj), 2)
        self.assertEqual(obj, labels)

    def test_isolate_incbins(self):
        global asm
        asm = ["123", "456", "789", "abc", "def", "ghi",
               'INCBIN "baserom.gbc",$12DA,$12F8 - $12DA',
               "jkl",
               'INCBIN "baserom.gbc",$137A,$13D0 - $137A']
        lines = isolate_incbins()
        self.assertIn(asm[6], lines)
        self.assertIn(asm[8], lines)
        for line in lines:
            self.assertIn("baserom", line)

    def test_process_incbins(self):
        global incbin_lines, processed_incbins, asm
        incbin_lines = ['INCBIN "baserom.gbc",$12DA,$12F8 - $12DA',
                        'INCBIN "baserom.gbc",$137A,$13D0 - $137A']
        asm = copy(incbin_lines)
        asm.insert(1, "some other random line")
        processed_incbins = process_incbins()
        self.assertEqual(len(processed_incbins), len(incbin_lines))
        self.assertEqual(processed_incbins[0]["line"], incbin_lines[0])
        self.assertEqual(processed_incbins[2]["line"], incbin_lines[1])

    def test_reset_incbins(self):
        global asm, incbin_lines, processed_incbins
        # temporarily override the functions
        global load_asm, isolate_incbins, process_incbins
        temp1, temp2, temp3 = load_asm, isolate_incbins, process_incbins
        def load_asm(): pass
        def isolate_incbins(): pass
        def process_incbins(): pass
        # call reset
        reset_incbins()
        # check the results
        self.assertTrue(asm == [] or asm == None)
        self.assertTrue(incbin_lines == [])
        self.assertTrue(processed_incbins == {})
        # reset the original functions
        load_asm, isolate_incbins, process_incbins = temp1, temp2, temp3

    def test_find_incbin_to_replace_for(self):
        global asm, incbin_lines, processed_incbins
        asm = ['first line', 'second line', 'third line',
               'INCBIN "baserom.gbc",$90,$200 - $90',
               'fifth line', 'last line']
        isolate_incbins()
        process_incbins()
        line_num = find_incbin_to_replace_for(0x100)
        # must be the 4th line (the INBIN line)
        self.assertEqual(line_num, 3)

    def test_split_incbin_line_into_three(self):
        global asm, incbin_lines, processed_incbins
        asm = ['first line', 'second line', 'third line',
               'INCBIN "baserom.gbc",$90,$200 - $90',
               'fifth line', 'last line']
        isolate_incbins()
        process_incbins()
        content = split_incbin_line_into_three(3, 0x100, 10)
        # must end up with three INCBINs in output
        self.failUnless(content.count("INCBIN") == 3)

    def test_analyze_intervals(self):
        global asm, incbin_lines, processed_incbins
        asm, incbin_lines, processed_incbins = None, [], {}
        asm = ['first line', 'second line', 'third line',
               'INCBIN "baserom.gbc",$90,$200 - $90',
               'fifth line', 'last line',
               'INCBIN "baserom.gbc",$33F,$4000 - $33F']
        isolate_incbins()
        process_incbins()
        largest = analyze_intervals()
        self.assertEqual(largest[0]["line_number"], 6)
        self.assertEqual(largest[0]["line"], asm[6])
        self.assertEqual(largest[1]["line_number"], 3)
        self.assertEqual(largest[1]["line"], asm[3])

    def test_generate_diff_insert(self):
        global asm
        asm = ['first line', 'second line', 'third line',
               'INCBIN "baserom.gbc",$90,$200 - $90',
               'fifth line', 'last line',
               'INCBIN "baserom.gbc",$33F,$4000 - $33F']
        diff = generate_diff_insert(0, "the real first line", debug=False)
        self.assertIn("the real first line", diff)
        self.assertIn("INCBIN", diff)
        self.assertNotIn("No newline at end of file", diff)
        self.assertIn("+"+asm[1], diff)

class TestMapParsing(unittest.TestCase):
    def test_parse_all_map_headers(self):
        global parse_map_header_at, old_parse_map_header_at, counter
        counter = 0
        for k in map_names.keys():
            if "offset" not in map_names[k].keys():
                map_names[k]["offset"] = 0
        temp = parse_map_header_at
        temp2 = old_parse_map_header_at
        def parse_map_header_at(address, map_group=None, map_id=None, debug=False):
            global counter
            counter += 1
            return {}
        old_parse_map_header_at = parse_map_header_at
        parse_all_map_headers(debug=False)
        # parse_all_map_headers is currently doing it 2x
        # because of the new/old map header parsing routines
        self.assertEqual(counter, 388 * 2)
        parse_map_header_at = temp
        old_parse_map_header_at = temp2

class TestTextScript(unittest.TestCase):
    """for testing 'in-script' commands, etc."""
    #def test_to_asm(self):
    #    pass # or raise NotImplementedError, bryan_message
    #def test_find_addresses(self):
    #    pass # or raise NotImplementedError, bryan_message
    #def test_parse_text_at(self):
    #    pass # or raise NotImplementedError, bryan_message

class TestEncodedText(unittest.TestCase):
    """for testing chars-table encoded text chunks"""

    def test_process_00_subcommands(self):
        g = process_00_subcommands(0x197186, 0x197186+601, debug=False)
        self.assertEqual(len(g), 42)
        self.assertEqual(len(g[0]), 13)
        self.assertEqual(g[1], [184, 174, 180, 211, 164, 127, 20, 231, 81])

    def test_parse_text_at2(self):
        oakspeech = parse_text_at2(0x197186, 601, debug=False)
        self.assertIn("encyclopedia", oakspeech)
        self.assertIn("researcher", oakspeech)
        self.assertIn("dependable", oakspeech)

    def test_parse_text_engine_script_at(self):
        p = parse_text_engine_script_at(0x197185, debug=False)
        self.assertEqual(len(p.commands), 2)
        self.assertEqual(len(p.commands[0]["lines"]), 41)

    # don't really care about these other two
    def test_parse_text_from_bytes(self): pass
    def test_parse_text_at(self): pass

class TestScript(unittest.TestCase):
    """for testing parse_script_engine_script_at and script parsing in
    general. Script should be a class."""
    #def test_parse_script_engine_script_at(self):
    #    pass # or raise NotImplementedError, bryan_message

    def test_find_all_text_pointers_in_script_engine_script(self):
        address = 0x197637 # 0x197634
        script = parse_script_engine_script_at(address, debug=False)
        bank = calculate_bank(address)
        r = find_all_text_pointers_in_script_engine_script(script, bank=bank, debug=False)
        results = list(r)
        self.assertIn(0x197661, results)

class TestLabel(unittest.TestCase):
    def test_label_making(self):
        line_number = 2
        address = 0xf0c0
        label_name = "poop"
        l = Label(name=label_name, address=address, line_number=line_number)
        self.failUnless(hasattr(l, "name"))
        self.failUnless(hasattr(l, "address"))
        self.failUnless(hasattr(l, "line_number"))
        self.failIf(isinstance(l.address, str))
        self.failIf(isinstance(l.line_number, str))
        self.failUnless(isinstance(l.name, str))
        self.assertEqual(l.line_number, line_number)
        self.assertEqual(l.name, label_name)
        self.assertEqual(l.address, address)

class TestByteParams(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        load_rom()
        cls.address = 10
        cls.sbp = SingleByteParam(address=cls.address)

    @classmethod
    def tearDownClass(cls):
        del cls.sbp

    def test__init__(self):
        self.assertEqual(self.sbp.size, 1)
        self.assertEqual(self.sbp.address, self.address)

    def test_parse(self):
        self.sbp.parse()
        self.assertEqual(str(self.sbp.byte), str(45))

    def test_to_asm(self):
        self.assertEqual(self.sbp.to_asm(), "$2d")
        self.sbp.should_be_decimal = True
        self.assertEqual(self.sbp.to_asm(), str(45))

    # HexByte and DollarSignByte are the same now
    def test_HexByte_to_asm(self):
        h = HexByte(address=10)
        a = h.to_asm()
        self.assertEqual(a, "$2d")

    def test_DollarSignByte_to_asm(self):
        d = DollarSignByte(address=10)
        a = d.to_asm()
        self.assertEqual(a, "$2d")

    def test_ItemLabelByte_to_asm(self):
        i = ItemLabelByte(address=433)
        self.assertEqual(i.byte, 54)
        self.assertEqual(i.to_asm(), "COIN_CASE")
        self.assertEqual(ItemLabelByte(address=10).to_asm(), "$2d")

    def test_DecimalParam_to_asm(self):
        d = DecimalParam(address=10)
        x = d.to_asm()
        self.assertEqual(x, str(0x2d))

class TestMultiByteParam(unittest.TestCase):
    def setup_for(self, somecls, byte_size=2, address=443, **kwargs):
        self.cls = somecls(address=address, size=byte_size, **kwargs)
        self.assertEqual(self.cls.address, address)
        self.assertEqual(self.cls.bytes, rom_interval(address, byte_size, strings=False))
        self.assertEqual(self.cls.size, byte_size)

    def test_two_byte_param(self):
        self.setup_for(MultiByteParam, byte_size=2)
        self.assertEqual(self.cls.to_asm(), "$f0c0")

    def test_three_byte_param(self):
        self.setup_for(MultiByteParam, byte_size=3)

    def test_PointerLabelParam_no_bank(self):
        self.setup_for(PointerLabelParam, bank=None)
        # assuming no label at this location..
        self.assertEqual(self.cls.to_asm(), "$f0c0")
        global all_labels
        # hm.. maybe all_labels should be using a class?
        all_labels = [{"label": "poop", "address": 0xf0c0,
                       "offset": 0xf0c0, "bank": 0,
                       "line_number": 2
                     }]
        self.assertEqual(self.cls.to_asm(), "poop")

class TestPostParsing: #(unittest.TestCase):
    """tests that must be run after parsing all maps"""
    @classmethod
    def setUpClass(cls):
        run_main()

    def test_signpost_counts(self):
        self.assertEqual(len(map_names[1][1]["signposts"]), 0)
        self.assertEqual(len(map_names[1][2]["signposts"]), 2)
        self.assertEqual(len(map_names[10][5]["signposts"]), 7)

    def test_warp_counts(self):
        self.assertEqual(map_names[10][5]["warp_count"], 9)
        self.assertEqual(map_names[18][5]["warp_count"], 3)
        self.assertEqual(map_names[15][1]["warp_count"], 2)

    def test_map_sizes(self):
        self.assertEqual(map_names[15][1]["height"], 18)
        self.assertEqual(map_names[15][1]["width"], 10)
        self.assertEqual(map_names[7][1]["height"], 4)
        self.assertEqual(map_names[7][1]["width"], 4)

    def test_map_connection_counts(self):
        self.assertEqual(map_names[7][1]["connections"], 0)
        self.assertEqual(map_names[10][1]["connections"], 12)
        self.assertEqual(map_names[10][2]["connections"], 12)
        self.assertEqual(map_names[11][1]["connections"], 9) # or 13?

    def test_second_map_header_address(self):
        self.assertEqual(map_names[11][1]["second_map_header_address"], 0x9509c)
        self.assertEqual(map_names[1][5]["second_map_header_address"], 0x95bd0)

    def test_event_address(self):
        self.assertEqual(map_names[17][5]["event_address"], 0x194d67)
        self.assertEqual(map_names[23][3]["event_address"], 0x1a9ec9)

    def test_people_event_counts(self):
        self.assertEqual(len(map_names[23][3]["people_events"]), 4)
        self.assertEqual(len(map_names[10][3]["people_events"]), 9)

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
        # i guess it would have to be for this to be running?
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
        # the return type must be an iterable
        self.failUnless(hasattr(untested, "__iter__"))
        #.. basically, a list
        self.failUnless(isinstance(untested, list))

    def test_find_untested_methods_method(self):
        """create a function and see if it is found"""
        # setup a function in the global namespace
        global some_random_test_method
        # define the method
        def some_random_test_method(): pass
        # first make sure it is in the global scope
        members = inspect.getmembers(sys.modules[__name__], inspect.isfunction)
        func_names = [functuple[0] for functuple in members]
        self.assertIn("some_random_test_method", func_names)
        # test whether or not it is found by find_untested_methods
        untested = find_untested_methods()
        self.assertIn("some_random_test_method", untested)
        # remove the test method from the global namespace
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
    avoid_funcs = ["main", "run_tests", "run_main", "copy", "deepcopy"]
    test_funcs = []
    # get a list of all classes in this module
    classes = inspect.getmembers(sys.modules[__name__], inspect.isclass)
    # for each class..
    for (name, klass) in classes:
        # only look at those that have tests
        if issubclass(klass, unittest.TestCase):
            # look at this class' methods
            funcs = inspect.getmembers(klass, inspect.ismethod)
            # for each method..
            for (name2, func) in funcs:
                # store the ones that begin with test_
                if "test_" in name2 and name2[0:5] == "test_":
                    test_funcs.append([name2, func])
    # assemble a list of all test method names (test_x, test_y, ..)
    tested_names = [funcz[0] for funcz in test_funcs]
    # now get a list of all functions in this module
    funcs = inspect.getmembers(sys.modules[__name__], inspect.isfunction)
    # for each function..
    for (name, func) in funcs:
        # we don't care about some of these
        if name in avoid_funcs: continue
        # skip functions beginning with _
        if name[0] == "_": continue
        # check if this function has a test named after it
        has_test = check_has_test(name, tested_names)
        if not has_test:
            untested.append(name)
    return untested

def report_untested():
    untested = find_untested_methods()
    output = "NOT TESTED: ["
    first = True
    for name in untested:
        if first:
            output += name
            first = False
        else: output += ", "+name
    output += "]\n"
    output += "total untested: " + str(len(untested))
    return output

def run_tests(): # rather than unittest.main()
    loader = unittest.TestLoader()
    suite = load_tests(loader, None, None)
    unittest.TextTestRunner(verbosity=2).run(suite)
    print report_untested()

# run the unit tests when this file is executed directly
if __name__ == "__main__":
    run_tests()

