# -*- coding: utf-8 -*-
# url: http://hax.iimarck.us/topic/8/

# for fixing trainer_group_names
import re

trainer_group_pointer_table_address    = 0x39999
trianer_group_pointer_table_address_gs = 0x3993E

# TODO: check if "é", ".", "♂", "♀" are okay in the output
trainer_group_names = {
0x01: {"name": "Leader [Falkner]"},
0x02: {"name": "Leader [Whitney]"},
0x03: {"name": "Leader [Bugsy]"},
0x04: {"name": "Leader [Morty]"},
0x05: {"name": "Leader [Pryce]"},
0x06: {"name": "Leader [Jasmine]"},
0x07: {"name": "Leader [Chuck]"},
0x08: {"name": "Leader [Clair]"},
0x09: {"name": "Rival1"},
0x0A: {"name": "Pokémon Prof."},
0x0B: {"name": "Elite Four [Will]"},
0x0C: {"name": "PKMN Trainer [Cal]"},
0x0D: {"name": "Elite Four [Bruno]"},
0x0E: {"name": "Elite Four [Karen]"},
0x0F: {"name": "Elite Four [Koga]"},
0x10: {"name": "Champion"},
0x11: {"name": "Leader [Brock]"},
0x12: {"name": "Leader [Misty]"},
0x13: {"name": "Leader [Lt.Surge]"},
0x14: {"name": "Scientist"},
0x15: {"name": "Leader [Erika]"},
0x16: {"name": "Youngster"},
0x17: {"name": "Schoolboy"},
0x18: {"name": "Bird Keeper"},
0x19: {"name": "Lass"},
0x1A: {"name": "Leader [Janine]"},
0x1B: {"name": "CooltrainerM"},
0x1C: {"name": "CooltrainerF"},
0x1D: {"name": "Beauty"},
0x1E: {"name": "Pokémaniac"},
0x1F: {"name": "GruntM"},
0x20: {"name": "Gentleman"},
0x21: {"name": "Skier"},
0x22: {"name": "Teacher"},
0x23: {"name": "Leader [Sabrina]"},
0x24: {"name": "Bug Catcher"},
0x25: {"name": "Fisher"},
0x26: {"name": "SwimmerM"},
0x27: {"name": "SwimmerF"},
0x28: {"name": "Sailor"},
0x29: {"name": "Super Nerd"},
0x2A: {"name": "Rival2"},
0x2B: {"name": "Guitarist"},
0x2C: {"name": "Hiker"},
0x2D: {"name": "Biker"},
0x2E: {"name": "Leader [Blaine]"},
0x2F: {"name": "Burglar"},
0x30: {"name": "Firebreather"},
0x31: {"name": "Juggler"},
0x32: {"name": "Blackbelt"},
0x33: {"name": "ExecutiveM"},
0x34: {"name": "Psychic"},
0x35: {"name": "Picnicker"},
0x36: {"name": "Camper"},
0x37: {"name": "ExecutiveF"},
0x38: {"name": "Sage"},
0x39: {"name": "Medium"},
0x3A: {"name": "Boarder"},
0x3B: {"name": "PokéfanM"},
0x3C: {"name": "Kimono Girl"},
0x3D: {"name": "Twins"},
0x3E: {"name": "PokéfanF"},
0x3F: {"name": "PKMN Trainer [Red]"},
0x40: {"name": "Leader [Blue]"},
0x41: {"name": "Officer"},
0x42: {"name": "RocketF"},
0x43: {"name": "Mysticalman [Eusine]"}, # crystal only
}

def remove_parentheticals_from_trainer_group_names():
    """ Clean up the trainer group names.
    """
    i = 0
    for (key, value) in trainer_group_names.items():
        # remove the brackets and inner contents from each name
        newvalue = re.sub(r'\[[^\)]*\]', '', value["name"]).strip()

        # clean up some characters
        newvalue = newvalue.replace("♀", "F")\
                           .replace("♂", "M")\
                           .replace(".", "")\
                           .replace(" ", "_")\
                           .replace("é", "e")

        # and calculate the address of the first byte of this pointer
        trainer_group_names[key] = {"name": newvalue,
                                    "pointer_address": trainer_group_pointer_table_address + (i * 2),
                                   }
        i += 1
    return trainer_group_names

# remove [Blue] from each trainer group name
remove_parentheticals_from_trainer_group_names()

class TrainerGroupTable:
    """ A list of pointers.
    """

    def __init__(self):
        assert 0x43 in trainer_group_maximums.keys(), "TrainerGroupTable should onyl be created after all the trainers have been found"
        self.address = trainer_group_pointer_table_address
        self.bank = calculate_bank(trainer_group_pointer_table_address)
        self.label = Label(name="TrainerGroupPointerTable", address=self.address, object=self)
        self.size = None
        self.last_address = None
        self.dependencies = None
        self.headers = []
        self.parse()

        # TODO: add this to script_parse_table
        #script_parse_table[address : self.last_address] = self

    def get_dependencies(self, recompute=False, global_dependencies=set()):
        global_dependencies.update(self.headers)
        if recompute == True and self.dependencies != None and self.dependencies != []:
            return self.dependencies
        dependencies = [self.headers]
        for header in self.headers:
            dependencies += header.get_dependencies(recompute=recompute, global_dependencies=global_dependencies)
        return dependencies

    def parse(self):
        size = 0
        for (key, kvalue) in trainer_group_names.items():
            # calculate the location of this trainer group header from its pointer
            pointer_bytes_location = kvalue["pointer_address"]
            parsed_address = calculate_pointer_from_bytes_at(pointer_bytes_location, bank=self.bank)
            trainer_group_names[key]["parsed_address"] = parsed_address

            # parse the trainer group header at this location
            name = kvalue["name"]
            trainer_group_header = TrainerGroupHeader(address=parsed_address, group_id=key, group_name=name)
            trainer_group_names[key]["header"] = trainer_group_header
            self.headers.append(trainer_group_header)

            # keep track of the size of this pointer table
            size += 2
        self.size = size
        self.last_address = self.address + self.size

    def to_asm(self):
        output = "".join([str("dw "+get_label_for(header.address)+"\n") for header in self.headers])
        return output

class TrainerGroupHeader:
    """
    A trainer group header is a repeating list of individual trainer headers.

    <Trainer Name> <0x50> <Data type> <Pokémon Data>+ <0xFF>

    Data type <0x00>: Pokémon Data is <Level> <Species>. Used by most trainers.
    Data type <0x01>: Pokémon Data is <Level> <Pokémon> <Move1> <Move2> <Move3> <Move4>. Used often for Gym Leaders.
    Data type <0x02>: Pokémon Data is <Level> <Pokémon> <Held Item>. Used mainly by Pokéfans.
    Data type <0x03>: Pokémon Data is <Level> <Pokémon> <Held Item> <Move1> <Move2> <Move3> <Move4>. Used by a few Cooltrainers.
    """

    def __init__(self, address=None, group_id=None, group_name=None):
        assert address!=None, "TrainerGroupHeader requires an address"
        assert group_id!=None, "TrainerGroupHeader requires a group_id"
        assert group_name!=None, "TrainerGroupHeader requires a group_name"

        self.address = address
        self.group_id = group_id
        self.group_name = group_name
        self.dependencies = None
        self.individual_trainer_headers = []
        self.label = Label(name=group_name+"TrainerGroupHeader", address=self.address, object=self)
        self.parse()

        # TODO: add this to script_parse_table
        #script_parse_table[address : self.last_address] = self

    def get_dependencies(self, recompute=False, global_dependencies=set()):
        """ TrainerGroupHeader has no dependencies.
        """
        # TODO: possibly include self.individual_trainer_headers
        if recompute or self.dependencies == None:
            self.dependencies = []
        return self.dependencies

    def parse(self):
        """
        how do i know when there's no more data for this header?
         do a global analysis of the rom and figure out the max ids
         this wont work for rom hacks of course
        see find_trainer_ids_from_scripts
        """
        size = 0
        current_address = self.address

        # create an IndividualTrainerHeader for each id in range(min id, max id + 1)
        min_id = min(trainer_group_maximums[self.group_id])
        max_id = max(trainer_group_maximums[self.group_id])

        for trainer_id in range(min_id, max_id+1):
            trainer_header = TrainerHeader(address=current_address, trainer_group_id=self.group_id, trainer_id=trainer_id, parent=self)
            current_address += trainer_header.size
            size += trainer_header.size

        self.last_address = current_address
        self.size = size

    def to_asm(self):
        raise NotImplementedError
        output += "

class TrainerHeader:
    """
    <Trainer Name> <0x50> <Data type> <Pokémon Data>+ <0xFF>

    Data type <0x00>: Pokémon Data is <Level> <Species>. Used by most trainers.
    Data type <0x01>: Pokémon Data is <Level> <Pokémon> <Move1> <Move2> <Move3> <Move4>. Used often for Gym Leaders.
    Data type <0x02>: Pokémon Data is <Level> <Pokémon> <Held Item>. Used mainly by Pokéfans.
    Data type <0x03>: Pokémon Data is <Level> <Pokémon> <Held Item> <Move1> <Move2> <Move3> <Move4>. Used by a few Cooltrainers.
    """

    def __init__(self, address=None, trainer_group_id=None, trainer_id=None, parent=None):
        self.parent = parent
        self.address = address
        self.trainer_group_id = trainer_group_id
        self.trainer_id = trainer_id
        self.dependencies = []
        self.size = None
        self.last_address = None
        self.parse()
        self.label = Label(name=self.make_name(), address=self.address, object=self)
        # this shouldn't be added to script_parse_table because
        # TrainerGroupHeader covers its address range

    def make_name(self):
        """ Must occur after parse() is called.
        Constructs a name based on self.parent.group_name and self.name.
        """
        return self.parent.group_name + "_" + self.name

    def get_dependencies(self, recompute=False, global_dependencies=set()):
        if recompute or self.dependencies == None:
            self.dependencies = []
        return self.dependencies

    def parse(self):
        address = self.address

        # figure out how many bytes until 0x50 "@"
        jump = how_many_until(chr(0x50), address)

        # parse the "@" into the name
        self.name = parse_text_at(address, jump+1)

        # where is the next byte?
        current_address = address + jump + 1

        # figure out the pokemon data type
        self.data_type = ord(rom[current_address])

        current_address += 1

        # figure out which partymon parser to use for this trainer header
        party_mon_parser = None
        for monparser in trainer_party_mon_parsers:
            if monparser.id == self.data_type:
                party_mon_parser = monparser
                break

        if party_mon_parser == None:
            raise Exception, "no trainer party mon parser found to parse data type " + hex(self.data_type)

        self.party_mons = party_mon_parser(address=current_address, group_id=self.trainer_group_id, trainer_id=self.trainer_id, parent=self)

        # let's have everything in trainer_party_mon_parsers handle the last $FF
        self.size = self.party_mons.size + 1 + len(self.name)
        self.last_address = self.party_mons.last_address

    def to_asm(self):
        output = "db \""+self.name+"\"\n"
        output += "; data type\n"
        output += "db $%.2x\n"%(self.data_byte)
        output += self.party_mons.to_asm()
        return output

class TrainerPartyMonParser:
    """ Just a generic trainer party mon parser.
    Don't use this directly. Only use the child classes.
    """
    id = None
    dependencies = None
    params = []
    param_types = None

    # could go either way on this one.. TrainerGroupHeader.parse would need to be changed
    # so as to not increase current_address by one after reading "data_type"
    override_byte_check = True

    def __init__(self, address=None, group_id=None, trainer_id=None, parent=None):
        self.address = address
        self.group_id = group_id
        self.trainer_id = trainer_id
        self.parent = parent
        self.parse()

        # pick up the $FF at the end
        self.size += 1
        self.last_address += 1

    parse = Command.parse

    def to_asm(self):
        output = "; " + ", ".join([param_type["name"] for param_type in self.param_types]) + "\n"
        output += "db " + ", ".join([param.to_asm() for (name, param) in self.params.items()])
        output += "\n"
        output += "db $FF ; end trainer party mons"
        return output

class TrainerPartyMonParser0(TrainerPartyMonParser):
    """ Data type <0x00>: Pokémon Data is <Level> <Species>. Used by most trainers. """
    id = 0
    size = 2 + 1
    param_types = {
        0: {"name": "level", "class": DecimalParam},
        1: {"name": "species", "class": PokemonParam},
    }
class TrainerPartyMonParser1(TrainerPartyMonParser):
    """ Data type <0x01>: Pokémon Data is <Level> <Pokémon> <Move1> <Move2> <Move3> <Move4>. Used often for Gym Leaders."""
    id = 1
    size = 6 + 1
    param_types = {
        0: {"name": "level", "class": DecimalParam},
        1: {"name": "species", "class": PokemonParam},
        2: {"name": "move1", "class": MoveParam},
        3: {"name": "move2", "class": MoveParam},
        4: {"name": "move3", "class": MoveParam},
        5: {"name": "move4", "class": MoveParam},
    }
class TrainerPartyMonParser2(TrainerPartyMonParser):
    """ Data type <0x02>: Pokémon Data is <Level> <Pokémon> <Held Item>. Used mainly by Pokéfans. """
    id = 2
    size = 3 + 1
    param_types = {
        0: {"name": "level", "class": DecimalParam},
        1: {"name": "species", "class": PokemonParam},
        2: {"name": "item", "class": ItemLabelByte},
    }
class TrainerPartyMonParser3(TrainerPartyMonParser):
    """ Data type <0x03>: Pokémon Data is <Level> <Pokémon> <Held Item> <Move1> <Move2> <Move3> <Move4>.
    Used by a few Cooltrainers. """
    id = 3
    size = 7 + 1
    param_types = {
        0: {"name": "level", "class": DecimalParam},
        1: {"name": "species", "class": PokemonParam},
        2: {"name": "item", "class": ItemLabelByte},
        3: {"name": "move1", "class": MoveParam},
        4: {"name": "move2", "class": MoveParam},
        5: {"name": "move3", "class": MoveParam},
        6: {"name": "move4", "class": MoveParam},
    }

trainer_party_mon_parsers = [TrainerPartyMonParser0, TrainerPartyMonParser1, TrainerPartyMonParser2, TrainerPartyMonParser3]
