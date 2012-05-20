# -*- coding: utf-8 -*-
# url: http://hax.iimarck.us/topic/8/

# for fixing trainer_group_names
import re

trainer_group_pointer_table_address    = 0x39999
trainer_group_pointer_table_address_gs = 0x3993E

# Any trainer that appears more than once should have an id after each
# trainer name.

# "uses_numeric_trainer_ids" means never use a name for the trainer_id
trainer_group_names = {
0x01: {"name": "Falkner", "uses_numeric_trainer_ids": True},
0x02: {"name": "Whitney", "uses_numeric_trainer_ids": True},
0x03: {"name": "Bugsy", "uses_numeric_trainer_ids": True},
0x04: {"name": "Morty", "uses_numeric_trainer_ids": True},
0x05: {"name": "Pryce", "uses_numeric_trainer_ids": True},
0x06: {"name": "Jasmine", "uses_numeric_trainer_ids": True},
0x07: {"name": "Chuck", "uses_numeric_trainer_ids": True},
0x08: {"name": "Clair", "uses_numeric_trainer_ids": True},
0x09: {"name": "Rival1"},
#PokemonProf group is empty :/
0x0A: {"name": "Pokémon Prof."},
0x0B: {"name": "Elite Four Will", "uses_numeric_trainer_ids": True},
0x0C: {"name": "Special PKMN 1 [Cal]"},
0x0D: {"name": "Elite Four Bruno", "uses_numeric_trainer_ids": True},
0x0E: {"name": "Elite Four Karen", "uses_numeric_trainer_ids": True},
0x0F: {"name": "Elite Four Koga", "uses_numeric_trainer_ids": True},
0x10: {"name": "Champion"},
0x11: {"name": "Brock", "uses_numeric_trainer_ids": True},
0x12: {"name": "Misty", "uses_numeric_trainer_ids": True},
0x13: {"name": "Lt.Surge", "uses_numeric_trainer_ids": True},
0x14: {"name": "Scientist"},
0x15: {"name": "Erika", "uses_numeric_trainer_ids": True},
0x16: {"name": "Youngster"},
0x17: {"name": "Schoolboy"},
0x18: {"name": "Bird Keeper"},
0x19: {"name": "Lass"},
0x1A: {"name": "Janine", "uses_numeric_trainer_ids": True},
0x1B: {"name": "CooltrainerM"},
0x1C: {"name": "CooltrainerF"},
0x1D: {"name": "Beauty"},
0x1E: {"name": "Pokémaniac"},
0x1F: {"name": "GruntM", "uses_numeric_trainer_ids": True},
0x20: {"name": "Gentleman"},
0x21: {"name": "Skier"},
0x22: {"name": "Teacher"},
0x23: {"name": "Sabrina", "uses_numeric_trainer_ids": True},
0x24: {"name": "Bug Catcher"},
0x25: {"name": "Fisher"},
0x26: {"name": "SwimmerM"},
0x27: {"name": "SwimmerF"},
0x28: {"name": "Sailor"},
0x29: {"name": "Super Nerd"},
0x2A: {"name": "Rival2", "uses_numeric_trainer_ids": True},
0x2B: {"name": "Guitarist"},
0x2C: {"name": "Hiker"},
0x2D: {"name": "Biker"},
0x2E: {"name": "Blaine", "uses_numeric_trainer_ids": True},
0x2F: {"name": "Burglar"},
0x30: {"name": "Firebreather"},
0x31: {"name": "Juggler"},
0x32: {"name": "Blackbelt"},
0x33: {"name": "ExecutiveM", "uses_numeric_trainer_ids": True},
0x34: {"name": "Psychic"},
0x35: {"name": "Picnicker"},
0x36: {"name": "Camper"},
0x37: {"name": "ExecutiveF", "uses_numeric_trainer_ids": True},
0x38: {"name": "Sage"},
0x39: {"name": "Medium"},
0x3A: {"name": "Boarder"},
0x3B: {"name": "PokéfanM"},
0x3C: {"name": "Kimono Girl"},
0x3D: {"name": "Twins"},
0x3E: {"name": "PokéfanF"},
0x3F: {"name": "Red", "uses_numeric_trainer_ids": True},
0x40: {"name": "Blue", "uses_numeric_trainer_ids": True},
0x41: {"name": "Officer"},
0x42: {"name": "GruntF", "uses_numeric_trainer_ids": True},
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
                           .replace(" ", "")\
                           .replace("é", "e")

        # and calculate the address of the first byte of this pointer
        trainer_group_names[key] = {"name": newvalue,
                                    "pointer_address": trainer_group_pointer_table_address + (i * 2),
                                   }
        i += 1
    return trainer_group_names

# remove [Blue] from each trainer group name
remove_parentheticals_from_trainer_group_names()
