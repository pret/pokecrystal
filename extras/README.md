Pokémon Crystal utilities and extras
==============================

`crystal.py` parses the ROM into classes and objects. It prmarily parses map headers, "second" map headers, map event headers, map script headers, map triggers, map "callbacks", map blockdata, xy triggers, warps, people-events, texts and scripts. The purpose of the file is to parse the ROM into python and then spit it back out with the global `to_asm()` method.

#### Simple ASM generation example

Note: throughout these examples it is possible to use `reload(crystal)` instead of `import crystal`. Once the module is loaded a first time, it must be reloaded if the file changes and the updates are desired.

```python
import crystal

# parse the ROM
crystal.run_main()

# create a new dump
asm = crystal.Asm()

# insert the first 10 maps
x = 10
asm.insert_multiple_with_dependencies(crystal.all_map_headers[:x])

# dump to extras/output.txt
asm.dump()
```

After running those lines, `cp extras/output.asm main.asm` and run `git diff main.asm` to confirm that changes to `main.asm` have occurred. Then to test whether or not the inserted ASM compiles use: `make clean && make`. This will complain very loudly if something is broken.

