#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys

from extras.pokemontools.crystal import (
    command_classes,
    Warp,
    XYTrigger,
    Signpost,
    PeopleEvent,
    DataByteWordMacro,
    text_command_classes,
    movement_command_classes,
    music_classes,
    effect_classes,
)

even_more_macros = [
    Warp,
    XYTrigger,
    Signpost,
    PeopleEvent,
    DataByteWordMacro,
]

macros = command_classes
macros += even_more_macros
macros += [each[1] for each in text_command_classes]
macros += movement_command_classes
macros += music_classes
macros += effect_classes

# show lines before preprocessing in stdout
show_original_lines = False

# helpful for debugging macros
do_macro_sanity_check = False

chars = {
"ガ": 0x05,
"ギ": 0x06,
"グ": 0x07,
"ゲ": 0x08,
"ゴ": 0x09,
"ザ": 0x0A,
"ジ": 0x0B,
"ズ": 0x0C,
"ゼ": 0x0D,
"ゾ": 0x0E,
"ダ": 0x0F,
"ヂ": 0x10,
"ヅ": 0x11,
"デ": 0x12,
"ド": 0x13,
"バ": 0x19,
"ビ": 0x1A,
"ブ": 0x1B,
"ボ": 0x1C,
"が": 0x26,
"ぎ": 0x27,
"ぐ": 0x28,
"げ": 0x29,
"ご": 0x2A,
"ざ": 0x2B,
"じ": 0x2C,
"ず": 0x2D,
"ぜ": 0x2E,
"ぞ": 0x2F,
"だ": 0x30,
"ぢ": 0x31,
"づ": 0x32,
"で": 0x33,
"ど": 0x34,
"ば": 0x3A,
"び": 0x3B,
"ぶ": 0x3C,
"べ": 0x3D,
"ぼ": 0x3E,
"パ": 0x40,
"ピ": 0x41,
"プ": 0x42,
"ポ": 0x43,
"ぱ": 0x44,
"ぴ": 0x45,
"ぷ": 0x46,
"ぺ": 0x47,
"ぽ": 0x48,
"ア": 0x80,
"イ": 0x81,
"ウ": 0x82,
"エ": 0x83,
"ォ": 0x84,
"カ": 0x85,
"キ": 0x86,
"ク": 0x87,
"ケ": 0x88,
"コ": 0x89,
"サ": 0x8A,
"シ": 0x8B,
"ス": 0x8C,
"セ": 0x8D,
"ソ": 0x8E,
"タ": 0x8F,
"チ": 0x90,
"ツ": 0x91,
"テ": 0x92,
"ト": 0x93,
"ナ": 0x94,
"ニ": 0x95,
"ヌ": 0x96,
"ネ": 0x97,
"ノ": 0x98,
"ハ": 0x99,
"ヒ": 0x9A,
"フ": 0x9B,
"ホ": 0x9C,
"マ": 0x9D,
"ミ": 0x9E,
"ム": 0x9F,
"メ": 0xA0,
"モ": 0xA1,
"ヤ": 0xA2,
"ユ": 0xA3,
"ヨ": 0xA4,
"ラ": 0xA5,
"ル": 0xA6,
"レ": 0xA7,
"ロ": 0xA8,
"ワ": 0xA9,
"ヲ": 0xAA,
"ン": 0xAB,
"ッ": 0xAC,
"ャ": 0xAD,
"ュ": 0xAE,
"ョ": 0xAF,
"ィ": 0xB0,
"あ": 0xB1,
"い": 0xB2,
"う": 0xB3,
"え": 0xB4,
"お": 0xB5,
"か": 0xB6,
"き": 0xB7,
"く": 0xB8,
"け": 0xB9,
"こ": 0xBA,
"さ": 0xBB,
"し": 0xBC,
"す": 0xBD,
"せ": 0xBE,
"そ": 0xBF,
"た": 0xC0,
"ち": 0xC1,
"つ": 0xC2,
"て": 0xC3,
"と": 0xC4,
"な": 0xC5,
"に": 0xC6,
"ぬ": 0xC7,
"ね": 0xC8,
"の": 0xC9,
"は": 0xCA,
"ひ": 0xCB,
"ふ": 0xCC,
"へ": 0xCD,
"ほ": 0xCE,
"ま": 0xCF,
"み": 0xD0,
"む": 0xD1,
"め": 0xD2,
"も": 0xD3,
"や": 0xD4,
"ゆ": 0xD5,
"よ": 0xD6,
"ら": 0xD7,
"り": 0xD8,
"る": 0xD9,
"れ": 0xDA,
"ろ": 0xDB,
"わ": 0xDC,
"を": 0xDD,
"ん": 0xDE,
"っ": 0xDF,
"ゃ": 0xE0,
"ゅ": 0xE1,
"ょ": 0xE2,
"ー": 0xE3,
"ァ": 0xE9,

"@": 0x50,
"#": 0x54,
"…": 0x75,

"┌": 0x79,
"─": 0x7A,
"┐": 0x7B,
"│": 0x7C,
"└": 0x7D,
"┘": 0x7E,

"№": 0x74,

" ": 0x7F,
"A": 0x80,
"B": 0x81,
"C": 0x82,
"D": 0x83,
"E": 0x84,
"F": 0x85,
"G": 0x86,
"H": 0x87,
"I": 0x88,
"J": 0x89,
"K": 0x8A,
"L": 0x8B,
"M": 0x8C,
"N": 0x8D,
"O": 0x8E,
"P": 0x8F,
"Q": 0x90,
"R": 0x91,
"S": 0x92,
"T": 0x93,
"U": 0x94,
"V": 0x95,
"W": 0x96,
"X": 0x97,
"Y": 0x98,
"Z": 0x99,
"(": 0x9A,
")": 0x9B,
":": 0x9C,
";": 0x9D,
"[": 0x9E,
"]": 0x9F,
"a": 0xA0,
"b": 0xA1,
"c": 0xA2,
"d": 0xA3,
"e": 0xA4,
"f": 0xA5,
"g": 0xA6,
"h": 0xA7,
"i": 0xA8,
"j": 0xA9,
"k": 0xAA,
"l": 0xAB,
"m": 0xAC,
"n": 0xAD,
"o": 0xAE,
"p": 0xAF,
"q": 0xB0,
"r": 0xB1,
"s": 0xB2,
"t": 0xB3,
"u": 0xB4,
"v": 0xB5,
"w": 0xB6,
"x": 0xB7,
"y": 0xB8,
"z": 0xB9,
"Ä": 0xC0,
"Ö": 0xC1,
"Ü": 0xC2,
"ä": 0xC3,
"ö": 0xC4,
"ü": 0xC5,
"'d": 0xD0,
"'l": 0xD1,
"'m": 0xD2,
"'r": 0xD3,
"'s": 0xD4,
"'t": 0xD5,
"'v": 0xD6,
"'": 0xE0,
"-": 0xE3,
"?": 0xE6,
"!": 0xE7,
".": 0xE8,
"&": 0xE9,
"é": 0xEA,
"→": 0xEB,
"▷": 0xEC,
"▶": 0xED,
"▼": 0xEE,
"♂": 0xEF,
"¥": 0xF0,
"×": 0xF1,
"/": 0xF3,
",": 0xF4,
"♀": 0xF5,
"0": 0xF6,
"1": 0xF7,
"2": 0xF8,
"3": 0xF9,
"4": 0xFA,
"5": 0xFB,
"6": 0xFC,
"7": 0xFD,
"8": 0xFE,
"9": 0xFF
}

class PreprocessorException(Exception):
    """
    There was a problem in the preprocessor.
    """

class MacroException(PreprocessorException):
    """
    There was a problem with a macro.
    """

def separate_comment(l):
    """
    Separates asm and comments on a single line.
    """
    in_quotes  = False
    for i in xrange(len(l)):
        if not in_quotes:
            if l[i] == ";":
                break
        if l[i] == "\"":
            in_quotes = not in_quotes
    return l[:i], l[i:] or None

def quote_translator(asm):
    """
    Writes asm with quoted text translated into bytes.
    """

    # split by quotes
    asms = asm.split('"')

    # skip asm that actually does use ASCII in quotes
    if "SECTION" in asms[0]\
    or "INCBIN"  in asms[0]\
    or "INCLUDE" in asms[0]:
        return asm

    print_macro = False
    if asms[0].strip() == 'print':
        asms[0] = asms[0].replace('print','db 0,')
        print_macro = True

    output = ''
    even = False
    for token in asms:
        if even:
            characters = []
            # token is a string to convert to byte values
            while len(token):
                # read a single UTF-8 codepoint
                char = token[0]
                if ord(char) < 0xc0:
                    token = token[1:]
                    # certain apostrophe-letter pairs are considered a single character
                    if char == "'" and token:
                        if token[0] in 'dlmrstv':
                            char += token[0]
                            token = token[1:]
                elif ord(char) < 0xe0:
                    char = char + token[1:2]
                    token = token[2:]
                elif ord(char) < 0xf0:
                    char = char + token[1:3]
                    token = token[3:]
                elif ord(char) < 0xf8:
                    char = char + token[1:4]
                    token = token[4:]
                elif ord(char) < 0xfc:
                    char = char + token[1:5]
                    token = token[5:]
                else:
                    char = char + token[1:6]
                    token = token[6:]
                characters += [char]

            if print_macro:
                line = 0
                while len(characters):
                    last_char = 1
                    if len(characters) > 18 and characters[-1] != '@':
                        for i, char in enumerate(characters):
                            last_char = i + 1
                            if ' ' not in characters[i+1:18]: break
                        output += ", ".join("${0:02X}".format(chars[char]) for char in characters[:last_char-1])
                        if characters[last_char-1] != " ":
                            output += ", ${0:02X}".format(characters[last_char-1])
                        if not line & 1:
                           line_ending = 0x4f
                        else:
                           line_ending = 0x51
                        output += ", ${0:02X}".format(line_ending)
                        line += 1
                    else:
                        output += ", ".join(["${0:02X}".format(chars[char]) for char in characters[:last_char]])
                    characters = characters[last_char:]
                    if len(characters): output += ", "
                # end text
                line_ending = 0x57
                output += ", ${0:02X}".format(line_ending)

            output += ", ".join(["${0:02X}".format(chars[char]) for char in characters])

        else:
            output += token

        even = not even

    return output

def extract_token(asm):
    return asm.split(" ")[0].strip()

def make_macro_table(macros):
    return dict(((macro.macro_name, macro) for macro in macros))

def macro_test(asm, macro_table):
    """
    Returns a matching macro, or None/False.
    """
    # macros are determined by the first symbol on the line
    token = extract_token(asm)

    # skip db and dw since rgbasm handles those and they aren't macros
    if token not in ["db", "dw"]:
        # check against all names
        if token in macro_table:
            return (macro_table[token], token)

    return (None, None)

def is_based_on(something, base):
    """
    Checks whether or not 'something' is a class that is a subclass of a class
    by name. This is a terrible hack but it removes a direct dependency on
    existing macros.

    Used by macro_translator.
    """
    options = [str(klass.__name__) for klass in something.__bases__]
    options += [something.__name__]
    return (base in options)

def macro_translator(macro, token, line):
    """
    Converts a line with a macro into a rgbasm-compatible line.
    """

    if macro.macro_name != token:
        raise MacroException("macro/token mismatch")

    original_line = line

    # remove trailing newline
    if line[-1] == "\n":
        line = line[:-1]
    else:
        original_line += "\n"

    # remove first tab
    has_tab = False
    if line[0] == "\t":
        has_tab = True
        line = line[1:]

    # remove duplicate whitespace (also trailing)
    line = " ".join(line.split())

    params = []

    # check if the line has params
    if " " in line:
        # split the line into separate parameters
        params = line.replace(token, "").split(",")

        # check if there are no params (redundant)
        if len(params) == 1 and params[0] == "":
            raise Exception, "macro has no params?"

    # write out a comment showing the original line
    if show_original_lines:
        sys.stdout.write("; original_line: " + original_line)

    # rgbasm can handle "db" so no preprocessing is required, plus this wont be
    # reached because of earlier checks in macro_test.
    if macro.macro_name in ["db", "dw"]:
        sys.stdout.write(original_line)
        return

    # certain macros don't need an initial byte written
    # do: all scripting macros
    # don't: signpost, warp_def, person_event, xy_trigger
    if not macro.override_byte_check:
        sys.stdout.write("db ${0:02X}\n".format(macro.id))

    # --- long-winded sanity check goes here ---

    if do_macro_sanity_check:

        # sanity check... this won't work because PointerLabelBeforeBank shows
        # up as two params, so these two lengths will always be different.
        #assert len(params) == len(macro.param_types), \
        #       "mismatched number of parameters on this line: " + \
        #       original_line

        # v2 sanity check :) although it sorta sucks that this loop happens twice?
        allowed_length = 0
        for (index, param_type) in macro.param_types.items():
            param_klass = param_type["class"]

            if param_klass.byte_type == "db":
                allowed_length += 1 # just one value
            elif param_klass.byte_type == "dw":
                if param_klass.size == 2:
                    allowed_length += 1 # just label
                elif param_klass.size == 3:
                    allowed_length += 2 # bank and label
                else:
                    raise Exception, "dunno what to do with a macro param with a size > 3"
            else:
                raise Exception, "dunno what to do with this non db/dw macro param: " + \
                                 str(param_klass) + " in line: " + original_line

        # sometimes the allowed length can vary
        if hasattr(macro, "allowed_lengths"):
            allowed_lengths = macro.allowed_lengths + [allowed_length]
        else:
            allowed_lengths = [allowed_length]

        assert len(params) in allowed_lengths, \
               "mismatched number of parameters on this line: " + \
               original_line

    # --- end of ridiculously long sanity check ---

    # used for storetext
    correction = 0

    output = ""

    index = 0
    while index < len(params):
        param_type  = macro.param_types[index - correction]
        description = param_type["name"]
        param_klass = param_type["class"]
        byte_type   = param_klass.byte_type # db or dw
        size        = param_klass.size
        param       = params[index].strip()

        # param_klass.to_asm() won't work here because it doesn't
        # include db/dw.

        # some parameters are really multiple types of bytes
        if (byte_type == "dw" and size != 2) or \
           (byte_type == "db" and size != 1):

            output += ("; " + description + "\n")

            if   size == 3 and is_based_on(param_klass, "PointerLabelBeforeBank"):
                # write the bank first
                output += ("db " + param + "\n")
                # write the pointer second
                output += ("dw " + params[index+1].strip() + "\n")
                index += 2
                correction += 1
            elif size == 3 and is_based_on(param_klass, "PointerLabelAfterBank"):
                # write the pointer first
                output += ("dw " + param + "\n")
                # write the bank second
                output += ("db " + params[index+1].strip() + "\n")
                index += 2
                correction += 1
            elif size == 3 and "from_asm" in dir(param_klass):
                output += ("db " + param_klass.from_asm(param) + "\n")
                index += 1
            else:
                raise Exception, "dunno what to do with this macro " + \
                "param (" + str(param_klass) + ") " + "on this line: " + \
                original_line

        # or just print out the byte
        else:
            output += (byte_type + " " + param + " ; " + description + "\n")

            index += 1

    sys.stdout.write(output)

def read_line(l, macro_table):
    """Preprocesses a given line of asm."""

    # strip comments from asm
    asm, comment = separate_comment(l)

    # export all labels
    if ':' in asm[:asm.find('"')]:
        sys.stdout.write('GLOBAL ' + asm.split(':')[0] + '\n')

    # expect preprocessed .asm files
    if "INCLUDE" in asm:
        asm = asm.replace('.asm','.tx')
        sys.stdout.write(asm)

    # ascii string macro preserves the bytes as ascii (skip the translator)
    elif len(asm) > 6 and "ascii " == asm[:6] or "\tascii " == asm[:7]:
        asm = asm.replace("ascii", "db", 1)
        sys.stdout.write(asm)

    # convert text to bytes when a quote appears (not in a comment)
    elif "\"" in asm:
        sys.stdout.write(quote_translator(asm))

    # check against other preprocessor features
    else:
        macro, token = macro_test(asm, macro_table)
        if macro:
            macro_translator(macro, token, asm)
        else:
            sys.stdout.write(asm)

    if comment: sys.stdout.write(comment)

def preprocess(macros, lines=None):
    """Main entry point for the preprocessor."""
    macro_table = make_macro_table(macros)

    if not lines:
        # read each line from stdin
        lines = (sys.stdin.readlines())
    elif not isinstance(lines, list):
        # split up the input into individual lines
        lines = lines.split("\n")

    for l in lines:
        read_line(l, macro_table)

# only run against stdin when not included as a module
if __name__ == "__main__":
    preprocess(macros)
