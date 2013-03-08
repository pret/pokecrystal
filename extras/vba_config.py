#!/usr/bin/jython
# -*- encoding: utf-8 -*-
import os

# by default we assume the user has vba in pokecrystal/extras
project_path = os.path.abspath(os.path.join(os.path.dirname( __file__ ), '..'))

# save states are in pokecrystal/save-states/
save_state_path = os.path.join(project_path, "save-states")

# where is your rom?
rom_path = os.path.join(project_path, "baserom.gbc")
