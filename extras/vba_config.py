#!/usr/bin/jython
# -*- encoding: utf-8 -*-
import os

# by default we assume the user has things in their $HOME
home = os.path.expanduser("~") # or System.getProperty("user.home")

# and that the pokecrystal project folder is in there somewhere
project_path = os.path.join(home, os.path.join("code", "pokecrystal"))

# save states are in ~/code/pokecrystal/save-states/
save_state_path = os.path.join(project_path, "save-states")

# where is your rom?
rom_path = os.path.join(project_path, "baserom.gbc")
