# -*- coding: utf-8 -*-
"""
Various label/line-related functions.
"""

from pointers import (
    calculate_pointer,
    calculate_bank,
)

def remove_quoted_text(line):
    """get rid of content inside quotes
    and also removes the quotes from the input string"""
    while line.count("\"") % 2 == 0 and line.count("\"") > 0: 
        first = line.find("\"")
        second = line.find("\"", first+1)
        line = line[0:first] + line[second+1:]
    while line.count("\'") % 2 == 0 and line.count("'") > 0: 
        first = line.find("\'")
        second = line.find("\'", first+1)
        line = line[0:first] + line[second+1:]
    return line

def line_has_comment_address(line, returnable={}, bank=None):
    """checks that a given line has a comment
    with a valid address, and returns the address in the object.
    Note: bank is required if you have a 4-letter-or-less address,
    because otherwise there is no way to figure out which bank
    is curretly being scanned."""
    #first set the bank/offset to nada
    returnable["bank"] = None
    returnable["offset"] = None
    returnable["address"] = None
    #only valid characters are 0-9a-fA-F
    valid = [str(x) for x in range(10)] + \
            [chr(x) for x in range(ord('a'), ord('f')+1)] + \
            [chr(x) for x in range(ord('A'), ord('F')+1)]
    #check if there is a comment in this line
    if ";" not in line:
        return False
    #first throw away anything in quotes
    if (line.count("\"") % 2 == 0 and line.count("\"")!=0) \
       or (line.count("\'") % 2 == 0 and line.count("\'")!=0):
        line = remove_quoted_text(line)
    #check if there is still a comment in this line after quotes removed
    if ";" not in line:
        return False
    #but even if there's a semicolon there must be later text
    if line[-1] == ";":
        return False
    #and just a space doesn't count
    if line[-2:] == "; ":
        return False
    #and multiple whitespace doesn't count either
    line = line.rstrip(" ").lstrip(" ")
    if line[-1] == ";":
        return False
    #there must be more content after the semicolon
    if len(line)-1 == line.find(";"):
        return False
    #split it up into the main comment part
    comment = line[line.find(";")+1:]
    #don't want no leading whitespace
    comment = comment.lstrip(" ").rstrip(" ")
    #split up multi-token comments into single tokens
    token = comment
    if " " in comment:
        #use the first token in the comment
        token = comment.split(" ")[0]
    if token in ["0x", "$", "x", ":"]:
        return False
    offset = None
    #process a token with a A:B format
    if ":" in token: #3:3F0A, $3:$3F0A, 0x3:0x3F0A, 3:3F0A
        #split up the token
        bank_piece = token.split(":")[0].lower()
        offset_piece = token.split(":")[1].lower()
        #filter out blanks/duds
        if bank_piece in ["$", "0x", "x"] \
        or offset_piece in ["$", "0x", "x"]:
            return False
        #they can't have both "$" and "x"
        if "$" in bank_piece and "x" in bank_piece:
            return False
        if "$" in offset_piece and "x" in offset_piece:
            return False
        #process the bank piece
        if "$" in bank_piece:
            bank_piece = bank_piece.replace("$", "0x")
        #check characters for validity?
        for c in bank_piece.replace("x", ""):
            if c not in valid:
                return False
        bank = int(bank_piece, 16)
        #process the offset piece
        if "$" in offset_piece:
            offset_piece = offset_piece.replace("$", "0x")
        #check characters for validity?
        for c in offset_piece.replace("x", ""):
            if c not in valid:
                return False
        if len(offset_piece) == 0:
            return None
        offset = int(offset_piece, 16)
    #filter out blanks/duds
    elif token in ["$", "0x", "x"]:
        return False
    #can't have both "$" and "x" in the number
    elif "$" in token and "x" in token:
        return False
    elif "x" in token and not "0x" in token: #it should be 0x
        return False
    elif "$" in token and not "x" in token:
        token = token.replace("$", "0x")
        offset = int(token, 16)
    elif "0x" in token and not "$" in token:
        offset = int(token, 16)
    else: #might just be "1" at this point
        token = token.lower()
        #check if there are bad characters
        for c in token:
            if c not in valid:
                return False
        offset = int(token, 16)
    if offset == None and bank == None:
        return False
    if bank == None:
        bank = calculate_bank(offset)
    returnable["bank"] = bank
    returnable["offset"] = offset
    returnable["address"] = calculate_pointer(offset, bank=bank)
    return True

def get_address_from_line_comment(line, bank=None):
    """
    wrapper for line_has_comment_address
    """
    returnable = {}
    result = line_has_comment_address(line, returnable=returnable, bank=bank)
    if not result:
        return False
    return returnable["address"]

def line_has_label(line):
    """returns True if the line has an asm label"""
    if not isinstance(line, str):
        raise Exception, "can't check this type of object"
    line = line.rstrip(" ").lstrip(" ")
    line = remove_quoted_text(line)
    if ";" in line:
        line = line.split(";")[0]
    if 0 <= len(line) <= 1:
        return False
    if ":" not in line:
        return False
    if line[0] == ";": 
        return False
    if line[0] == "\"":
        return False
    if "::" in line:
        return False
    return True

def get_label_from_line(line):
    """returns the label from the line"""
    #check if the line has a label
    if not line_has_label(line):
        return None
    #split up the line
    label = line.split(":")[0]
    return label

