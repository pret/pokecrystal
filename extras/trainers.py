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
0x09: {"name": "Silver1"},
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
0x2A: {"name": "Silver2"},
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
        self.address = trainer_group_pointer_table_address
        self.bank = calculate_bank(trainer_group_pointer_table_address)
        self.label = Label(name="TrainerGroupPointerTable", address=self.address, object=self)
        self.size = None
        self.last_address = None
        self.dependencies = None
        self.headers = []
        self.parse()

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
        self.label = Label(name=group_name+"TrainerGroupHeader", address=self.address, object=self)
        self.parse()

    def get_dependencies(self, recompute=False, global_dependencies=set()):
        """ TrainerGroupHeader has no dependencies.
        """
        return []

    def parse(self):
        size = 0
        raise NotImplementedError
        # how do i know when there's no more data for this header?
        # do a global analysis of the rom and figure out the max ids i guess
        # this wont work for rom hacks of course

    def to_asm(self):
        pass

