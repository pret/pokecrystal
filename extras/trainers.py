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
0x01: {"name": "Falkner", "uses_numeric_trainer_ids": True, "constant": "FALKNER"},
0x02: {"name": "Whitney", "uses_numeric_trainer_ids": True, "constant": "WHITNEY"},
0x03: {"name": "Bugsy", "uses_numeric_trainer_ids": True, "constant": "BUGSY"},
0x04: {"name": "Morty", "uses_numeric_trainer_ids": True, "constant": "MORTY"},
0x05: {"name": "Pryce", "uses_numeric_trainer_ids": True, "constant": "PRYCE"},
0x06: {"name": "Jasmine", "uses_numeric_trainer_ids": True, "constant": "JASMINE"},
0x07: {"name": "Chuck", "uses_numeric_trainer_ids": True, "constant": "CHUCK"},
0x08: {"name": "Clair", "uses_numeric_trainer_ids": True, "constant": "CLAIR"},
0x09: {"name": "Rival1", "constant": "RIVAL1"},
#PokemonProf group is empty :/
0x0A: {"name": "Pokémon Prof.", "constant": "POKEMON_PROF"},
0x0B: {"name": "Elite Four Will", "uses_numeric_trainer_ids": True, "constant": "WILL"},
0x0C: {"name": "PKMN [Cal]", "constant": "CAL"},
0x0D: {"name": "Elite Four Bruno", "uses_numeric_trainer_ids": True, "constant": "BRUNO"},
0x0E: {"name": "Elite Four Karen", "uses_numeric_trainer_ids": True, "constant": "KAREN"},
0x0F: {"name": "Elite Four Koga", "uses_numeric_trainer_ids": True, "constant": "KOGA"},
0x10: {"name": "Champion", "constant": "CHAMPION"},
0x11: {"name": "Brock", "uses_numeric_trainer_ids": True, "constant": "BROCK"},
0x12: {"name": "Misty", "uses_numeric_trainer_ids": True, "constant": "MISTY"},
0x13: {"name": "Lt.Surge", "uses_numeric_trainer_ids": True, "constant": "LT_SURGE"},
0x14: {"name": "Scientist", "constant": "SCIENTIST"},
0x15: {"name": "Erika", "uses_numeric_trainer_ids": True, "constant": "ERIKA"},
0x16: {"name": "Youngster", "constant": "YOUNGSTER"},
0x17: {"name": "Schoolboy", "constant": "SCHOOLBOY"},
0x18: {"name": "Bird Keeper", "constant": "BIRD_KEEPER"},
0x19: {"name": "Lass", "constant": "LASS"},
0x1A: {"name": "Janine", "uses_numeric_trainer_ids": True, "constant": "JANINE"},
0x1B: {"name": "CooltrainerM", "constant": "COOLTRAINERM"},
0x1C: {"name": "CooltrainerF", "constant": "COOLTRAINERF"},
0x1D: {"name": "Beauty", "constant": "BEAUTY"},
0x1E: {"name": "Pokémaniac", "constant": "POKEMANIAC"},
0x1F: {"name": "GruntM", "uses_numeric_trainer_ids": True, "constant": "GRUNTM"},
0x20: {"name": "Gentleman", "constant": "GENTLEMAN"},
0x21: {"name": "Skier", "constant": "SKIER"},
0x22: {"name": "Teacher", "constant": "TEACHER"},
0x23: {"name": "Sabrina", "uses_numeric_trainer_ids": True, "constant": "SABRINA"},
0x24: {"name": "Bug Catcher", "constant": "BUG_CATCHER"},
0x25: {"name": "Fisher", "constant": "FISHER"},
0x26: {"name": "SwimmerM", "constant": "SWIMMERM"},
0x27: {"name": "SwimmerF", "constant": "SWIMMERF"},
0x28: {"name": "Sailor", "constant": "SAILOR"},
0x29: {"name": "Super Nerd", "constant": "SUPER_NERD"},
0x2A: {"name": "Rival2", "uses_numeric_trainer_ids": True, "constant": "RIVAL2"},
0x2B: {"name": "Guitarist", "constant": "GUITARIST"},
0x2C: {"name": "Hiker", "constant": "HIKER"},
0x2D: {"name": "Biker", "constant": "BIKER"},
0x2E: {"name": "Blaine", "uses_numeric_trainer_ids": True, "constant": "BLAINE"},
0x2F: {"name": "Burglar", "constant": "BURGLAR"},
0x30: {"name": "Firebreather", "constant": "FIREBREATHER"},
0x31: {"name": "Juggler", "constant": "JUGGLER"},
0x32: {"name": "Blackbelt_T", "constant": "BLACKBELT_T"},
0x33: {"name": "ExecutiveM", "uses_numeric_trainer_ids": True, "constant": "EXECUTIVEM"},
0x34: {"name": "Psychic_T", "constant": "PSYCHIC_T"},
0x35: {"name": "Picnicker", "constant": "PICNICKER"},
0x36: {"name": "Camper", "constant": "CAMPER"},
0x37: {"name": "ExecutiveF", "uses_numeric_trainer_ids": True, "constant": "EXECUTIVEF"},
0x38: {"name": "Sage", "constant": "SAGE"},
0x39: {"name": "Medium", "constant": "MEDIUM"},
0x3A: {"name": "Boarder", "constant": "BOARDER"},
0x3B: {"name": "PokéfanM", "constant": "POKEFANM"},
0x3C: {"name": "Kimono Girl", "constant": "KIMONO_GIRL"},
0x3D: {"name": "Twins", "constant": "TWINS"},
0x3E: {"name": "PokéfanF", "constant": "POKEFANF"},
0x3F: {"name": "Red", "uses_numeric_trainer_ids": True, "constant": "RED"},
0x40: {"name": "Blue", "uses_numeric_trainer_ids": True, "constant": "BLUE"},
0x41: {"name": "Officer", "constant": "OFFICER"},
0x42: {"name": "GruntF", "uses_numeric_trainer_ids": True, "constant": "GRUNTF"},
0x43: {"name": "Mysticalman [Eusine]", "constant": "MYSTICALMAN"}, # crystal only
}

def remove_parentheticals_from_trainer_group_names():
    """
    Clean up the trainer group names.
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
        trainer_group_names[key]["name"] = newvalue
        trainer_group_names[key]["pointer_address"] = trainer_group_pointer_table_address + (i * 2)
        i += 1
    return trainer_group_names

# remove [Blue] from each trainer group name
remove_parentheticals_from_trainer_group_names()
