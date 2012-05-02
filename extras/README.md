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

After running those lines, `cp extras/output.txt main.asm` and run `git diff main.asm` to confirm that changes to `main.asm` have occurred. To test whether or not the newly inserted ASM compiles into the same ROM, use: `make clean && make`. This will complain very loudly if something is broken.

#### Testing

Unit tests cover most of the classes.

```python
import crystal
crystal.run_tests()
```

#### Investigating scripts from a known address

Here is a demo of how to investigate a particular script, starting with only an address to a known script (0x58043). In this case, the script calls the `2writetext` command to show some dialog. This dialog will be shown at the end of the example.

```python
import crystal

# parse the script at 0x58043 from the map event header at 0x584c3
# from the second map header at 0x958b8
# from the map header at 0x941ae
# for "Ruins of Alph Outside" (map_group=3 map_id=0x16)
script = Script(0x58043)

# show the script
print script.to_asm()

# what labels does it refer to?
# these must be present in the final asm file for rgbasm to compile the file
label_names = script.get_dependencies()
print str(label_names)

# the individual commands that make up the script
commands = script.commands
print str(commands)

# the 3rd command is 2writetext and points to a text
thirdcommand = script.commands[2]
print thirdcommand
# <crystal.2writetextCommand instance at 0x8ad4c0c>

# look at the command parameters
params = thirdcommand.params
print params
# {0: <crystal.RawTextPointerLabelParam instance at 0x8ad4b0c>}

# 2writetext always has a single parameter
definition_param_count = len(getattr(crystal, "2writetextCommand").param_types.keys())
current_param_count    = len(params.keys())
assert definition_param_count == current_param_count, "this should never " + \
       "happen: instance of a command has more parameters than the " + \
       "definition of the command allows"

# get the first parameter (the text pointer)
param = params[0]
print param
# <crystal.RawTextPointerLabelParam instance at 0x8ad4b0c>

# RawTextPointerLabelParam instances point to their text
text = param.text
print text
# <crystal.TextScript instance at 0x8ad47ec>

# now investigate this text appearing in this script in "Ruins of Alph Outside"
print text.to_asm()
```

The final output will be the following text.

```asm
db $0, "Hm? That's a #-", $4f
db "DEX, isn't it?", $55
; ...
```

However, this is not how that `TextScript` object would appear in the final ASM. To see how it would appear in `main.asm` once inserted, you would run `print crystal.to_asm(text)` to get the following.

```asm
UnknownText_0x580c7: ; 0x580c7
    db $0, "Hm? That's a #-", $4f
    db "DEX, isn't it?", $55
    db "May I see it?", $51
    db "There are so many", $4f
    db "kinds of #MON.", $51
    db "Hm? What's this?", $51
    db "What is this", $4f
    db "#MON?", $51
    db "It looks like the", $4f
    db "strange writing on", $51
    db "the walls of the", $4f
    db "RUINS.", $51
    db "If those drawings", $4f
    db "are really #-", $55
    db "MON, there should", $55
    db "be many more.", $51
    db "I know! Let me up-", $4f
    db "grade your #-", $55
    db "DEX. Follow me.", $57
; 0x581e5
```

