import sys

import crystal

rom = crystal.load_rom()

addr = int(sys.argv[1], 16)
count = int(sys.argv[2]) if len(sys.argv) > 2 else 256
label_prefix = sys.argv[3] if len(sys.argv) > 3 else "UnknownString"

ex = None

for i in range(count):
    try:
        string = crystal.PokedexText(addr)
        asm = string.to_asm()
    except Exception as ex:
        break
    print label_prefix+str(i)+": ; "+hex(addr)
    print "\t"+asm
    print
    addr = string.last_address

print "; "+hex(addr)
if ex: raise ex
