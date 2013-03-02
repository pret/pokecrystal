# -*- encoding: utf-8 -*-
"""
Dump out asm for scripting things in bank $25. This script will modify main.asm
and insert all scripting commands.
"""

import crystal
from gbz80disasm import output_bank_opcodes

rom = crystal.load_rom()
roml = [ord(x) for x in rom]

script_command_table_address = 0x96cb1
script_command_count = 170

# a list of addresses for each script command
command_pointers = [crystal.calculate_pointer_from_bytes_at(script_command_table_address + (id * 2), bank=0x25) for id in range(0, 170)]

# a list of hex addresses for each script command in bank $25
command_pointers_hex = ["$%.2x" % (x % 0x4000 + 0x4000) for x in command_pointers]

commands = {}

# force data into a more usable form
for command in crystal.command_classes:
    name = "Script_" + command.macro_name
    id = command.id
    params = {}

    for (id2, param_type) in command.param_types.items():
        param = {
            "name": param_type["name"],
            "type": param_type["class"].__name__,
        }
        params[id2] = param

    if id <= 0xa9:
        commands[id] = {
            "name": name,
            "params": params,
            "address": command_pointers[id],
        }

avoid = [
    0x974b0,
    0x974be,
    0x9754b,
    0x97556,
    0x97562,
    0x9756e,
    0x97540,

    0x96f8e, # verbosegiveitem2
]

class DisassembledScriptCommand():
    """
    Just a temporary object to store information about a script command's asm.
    This is used by some of the infrastructure in crystal.py to automatically
    insert asm into main.asm, rather than having someone do it manually.
    """
    dependencies = None

    def __init__(self, label=None, id=None, address=None, params=None):
        self.id = id
        self.label = crystal.Label(name=label, address=address, object=self)
        self.address = address
        self.params = params

        max_byte_count = 0x4000

        # Some of these scripts need to be truncated before insertion, because
        # output_bank_opcodes doesn't know anything about stopping if some of
        # the local labels are not resolved yet.

        # Script_if_equal
        if address == 0x97540:
            max_byte_count = 86

        # disassemble and laso get the last address
        (asm, last_address, last_hl_address, last_a_address, used_3d97) = output_bank_opcodes(address, max_byte_count=max_byte_count, stop_at=command_pointers, include_last_address=False)

        # remove indentation
        asm = asm.replace("\n\t", "\n")
        if asm[0] == "\t":
            asm = asm[1:]

        # remove the last two newlines
        while asm[-1] == "\n":
            asm = asm[:-1]

        self.asm = asm
        self.last_address = last_address

        # make sure this gets dumped into main.asm
        #if crystal.script_parse_table[self.address] == None and crystal.script_parse_table[self.last_address] == None:
        crystal.script_parse_table[self.address : self.last_address] = self
        #else:
        #    print ".. hm, something is already at " + hex(self.address) + " for " + self.label.name

    def to_asm(self):
        #output += self.label + ": ; " + hex(self.address) + "\n"
        output = "; script command " + hex(self.id) + "\n"
        if len(self.params) > 0:
            output += "; parameters:\n"
        for (id2, param) in self.params.items():
            output += ";     " + param["name"] + " (" + param["type"] + ")\n"
        output += "\n"
        output += self.asm
        return output

    def get_dependencies(*args, **kwargs):
        return []

# make instances of DisassembledScriptCommand
for (id, command) in commands.items():
    name = command["name"]
    params = command["params"]
    address = command["address"]

    script_asm = DisassembledScriptCommand(label=name, id=id, address=address, params=params)
    #print script_asm.to_asm()
    #print crystal.to_asm(script_asm, use_asm_rules=True)

class ScriptCommandTable():
    address = script_command_table_address
    last_address = script_command_table_address + (2 * 170)
    dependencies = None

    def __init__(self):
        self.label = crystal.Label(name="ScriptCommandTable", address=self.address, object=self)

        # make sure this gets dumped into main.asm
        crystal.script_parse_table[self.address : self.last_address] = self

    def get_dependencies(*args, **kwargs):
        return []

    def to_asm(self):
        output = ""
        for (id, command) in commands.items():
            output += "dw " + command["name"] + "; " + hex(command["address"]) + "\n"
        if output[-1] == "\n":
            output = output[:-1]
        return output
script_command_table = ScriptCommandTable()
#print crystal.to_asm(script_command_table, use_asm_rules=True)

# automatic asm insertion
asm = crystal.Asm()
asm.insert_and_dump(limit=500)
