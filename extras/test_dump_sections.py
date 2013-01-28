# -*- coding: utf-8 -*-

try:
    import unittest2 as unittest
except ImportError:
    import unittest

# check for things we need in unittest
if not hasattr(unittest.TestCase, 'setUpClass'):
    sys.stderr.write("The unittest2 module or Python 2.7 is required to run this script.")
    sys.exit(1)

from dump_sections import (
    upper_hex,
    format_bank_number,
    calculate_bank_quantity,
    dump_section,
    dump_incbin_for_section,
)

class TestDumpSections(unittest.TestCase):
    def test_upper_hex(self):
        number = 0x52
        self.assertEquals(number, int("0x" + upper_hex(number), 16))

        number = 0x1
        self.assertEquals(number, int("0x" + upper_hex(number), 16))

        number = 0x0
        self.assertEquals(number, int("0x" + upper_hex(number), 16))

        number = 0xAA
        self.assertEquals(number, int("0x" + upper_hex(number), 16))

        number = 0xFFFFAAA0000
        self.assertEquals(number, int("0x" + upper_hex(number), 16))

    def test_format_bank_number(self):
        address = 0x0
        self.assertEquals("0", format_bank_number(address))

        address = 0x4000
        self.assertEquals("1", format_bank_number(address))

        address = 0x1FC000
        self.assertEquals("7F", format_bank_number(address))

    def test_dump_section(self):
        self.assertIn("SECTION", dump_section(str(0)))
        self.assertIn("HOME", dump_section(str(0)))
        self.assertNotIn("HOME", dump_section(str(1)))
        self.assertIn("DATA", dump_section(str(2)))
        self.assertIn("BANK", dump_section(str(40)))
        self.assertNotIn("BANK", dump_section(str(0)))

    def test_dump_incbin_for_section(self):
        self.assertIn("INCBIN", dump_incbin_for_section(0))

    def test_dump_incbin_for_section_separator(self):
        separator = "\n\n"
        self.assertIn(separator, dump_incbin_for_section(0, separator=separator))

        separator = "\t\t" # dumb
        self.assertIn(separator, dump_incbin_for_section(0, separator=separator))

    def test_dump_incbin_for_section_default(self):
        rom = "baserom.gbc"
        self.assertIn(rom, dump_incbin_for_section(0))

        rom = "baserom"
        self.assertIn(rom, dump_incbin_for_section(0x4000))

if __name__ == "__main__":
    unittest.main()
