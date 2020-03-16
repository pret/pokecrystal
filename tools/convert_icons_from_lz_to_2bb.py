import os
import gfx

for filename in os.listdir("../gfx/icons"):
    if(filename.endswith(".lz")):
        gfx.decompress("../gfx/icons/" + filename)
