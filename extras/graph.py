# -*- coding: utf-8 -*-

import networkx as nx

from romstr import (
    RomStr,
    relative_jumps,
    call_commands,
    relative_unconditional_jumps,
)

class RomGraph(nx.DiGraph):
    """
    Graphs various functions pointing to each other.

        TODO: Bank switches are nasty. They should be detected. Otherwise,
        functions will point to non-functions within the same bank. Another way
        to detect bankswitches is retroactively. By disassembling one function
        after another within the function banks, it can be roughly assumed that
        anything pointing to something else (within the same bank) is really
        actually a bankswitch. An even better method to handle bankswitches
        would be to just detect those situations in the asm (but I presently
        forget how bankswitches are performed in pokecrystal).
    """

    # some areas shouldn't be parsed as asm
    exclusions = []

    # where is the first function located?
    start_address = 0x150

    # and where is a good place to stop?
    end_address = 0x4000 * 0x03 # only do the first bank? sure..

    # where is the rom stored?
    rompath = "../baserom.gbc"

    def __init__(self, rom=None, **kwargs):
        """
        Loads and parses the ROM into a function graph.
        """
        # continue the initialization
        nx.DiGraph.__init__(self, **kwargs)

        # load the graph
        if rom == None:
            self.load_rom()
        else:
            self.rom = rom

        # start parsing the ROM
        self.parse()

    def load_rom(self):
        """
        Creates a RomStr from rompath.
        """
        file_handler = open(self.rompath, "r")
        self.rom = RomStr(file_handler.read())
        file_handler.close()

    def parse(self):
        """
        Parses the ROM starting with the first function address. Each
            function is disassembled and parsed to find where else it leads to.
        """
        functions = {}

        address = self.start_address

        other_addresses = set()

        count = 0

        while True:
            if count > 3000:
                break

            if address < self.end_address and (address not in functions.keys()) and address >= 0x150:
                # address is okay to parse at, keep going
                pass
            elif len(other_addresses) > 0:
                # parse some other address possibly in a remote bank
                address = other_addresses.pop()
            else:
                # no more addresses detected- exit loop
                break

            # parse the asm
            func = self.rom.to_asm(address)

            # check if there are any nops (probably not a function)
            nops = 0
            for (id, command) in func.asm_commands.items():
                if command.has_key("id") and command["id"] == 0x0:
                    nops += 1

                    # skip this function
                    if nops > 1:
                        address = 0
                        continue

            # store this parsed function
            functions[address] = func

            # where does this function jump to?
            used_addresses = set(func.used_addresses())

            # add this information to the graph
            for used_address in used_addresses:
                # only add this remote address if it's not yet parsed
                if used_address not in functions.keys():
                    other_addresses.update([used_address])

                # add this other address to the graph
                if used_address > 100:
                    self.add_node(used_address)

                # add this as an edge between the two nodes
                self.add_edge(address, used_address)

            # setup the next function to be parsed
            address = func.last_address

            count += 1

        self.functions = functions

    def pretty_printer(self):
        """
        Shows some text output describing which nodes point to which other
        nodes.
        """
        print self.edges()

    def to_d3(self):
        """
        Exports to d3.js because we're gangster like that.
        """
        import networkx.readwrite.json_graph as json_graph
        content = json_graph.dumps(self)
        fh = open("crystal/crystal.json", "w")
        fh.write(content)
        fh.close()

    def to_gephi(self):
        """
        Generates a gexf file.
        """
        nx.write_gexf(self, "graph.gexf")

class RedGraph(RomGraph):
    """
    Not implemented. Go away.
    """

    rompath = "../pokered-baserom.gbc"

class CryGraph(RomGraph):
    exclusions = [
        [0x000, 0x149],
    ]

    rompath = "../baserom.gbc"

if __name__ == "__main__":
    crygraph = CryGraph()
    crygraph.pretty_printer()
    crygraph.to_gephi()
