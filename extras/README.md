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

#### Parsing a script at a known address

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
objdeps = script.get_dependencies()
print str(objdeps)

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

#### Figuring out where a script appears based on a known address

Another approach is to parse the entire ROM, then check a script at a particular address. This has the advantage that the script object will have the `map_group` and `map_id` variables set.

```python
import crystal

# parse the ROM
crystal.run_main()

# get the parsed script
script = crystal.script_parse_table[0x58043]

# read its attributes to figure out map group / map id
map_group = script.map_group
map_id = script.map_id

# MapHeader is not given all the info yet
# in the mean time "map_names" contains some metadata
map_dict = crystal.map_names[map_group][map_name]
map_header = map_dict["header_new"]

print map_dict["name"]
# Ruins of Alph Outside
```

While the above doesn't show this, it turns out that the script at 0x58043 is referenced in the `MapEventHeader` as a person-event.

```python
print map_header.second_map_header.event_header.to_asm()
```

This will show a structure roughly like:

```asm
person_event $3c, 19, 15, $7, $0, 255, 255, $0, 0, UnknownScript_0x58043, $0703
```

within this:

```asm
MapEventHeader_0x584c3: ; 0x584c3
    ; filler
    db 0, 0

    ; warps
    db 11
    warp_def $11, $2, 1, GROUP_RUINS_OF_ALPH_HO_OH_CHAMBER, MAP_RUINS_OF_ALPH_HO_OH_CHAMBER
    warp_def $7, $e, 1, GROUP_RUINS_OF_ALPH_KABUTO_CHAMBER, MAP_RUINS_OF_ALPH_KABUTO_CHAMBER
    warp_def $1d, $2, 1, GROUP_RUINS_OF_ALPH_OMANYTE_CHAMBER, MAP_RUINS_OF_ALPH_OMANYTE_CHAMBER
    warp_def $21, $10, 1, GROUP_RUINS_OF_ALPH_AERODACTYL_CHAMBER, MAP_RUINS_OF_ALPH_AERODACTYL_CHAMBER
    warp_def $d, $a, 1, GROUP_RUINS_OF_ALPH_INNER_CHAMBER, MAP_RUINS_OF_ALPH_INNER_CHAMBER
    warp_def $b, $11, 1, GROUP_RUINS_OF_ALPH_RESEARCH_CENTER, MAP_RUINS_OF_ALPH_RESEARCH_CENTER
    warp_def $13, $6, 1, GROUP_UNION_CAVE_B1F, MAP_UNION_CAVE_B1F
    warp_def $1b, $6, 2, GROUP_UNION_CAVE_B1F, MAP_UNION_CAVE_B1F
    warp_def $5, $7, 3, GROUP_ROUTE_36_RUINS_OF_ALPH_GATE, MAP_ROUTE_36_RUINS_OF_ALPH_GATE
    warp_def $14, $d, 1, GROUP_ROUTE_32_RUINS_OF_ALPH_GATE, MAP_ROUTE_32_RUINS_OF_ALPH_GATE
    warp_def $15, $d, 2, GROUP_ROUTE_32_RUINS_OF_ALPH_GATE, MAP_ROUTE_32_RUINS_OF_ALPH_GATE

    ; xy triggers
    db 2
    xy_trigger 1, $e, $b, $0, UnknownScript_0x58031, $0, $0
    xy_trigger 1, $f, $a, $0, UnknownScript_0x5803a, $0, $0

    ; signposts
    db 3
    signpost 8, 16, $0, UnknownScript_0x580b1
    signpost 16, 12, $0, UnknownScript_0x580b4
    signpost 12, 18, $0, UnknownScript_0x580b7

    ; people-events
    db 5
    person_event $27, 24, 8, $6, $0, 255, 255, $2, 1, Trainer_0x58089, $ffff
    person_event $3c, 19, 15, $7, $0, 255, 255, $0, 0, UnknownScript_0x58043, $0703
    person_event $3a, 21, 17, $3, $0, 255, 255, $a0, 0, UnknownScript_0x58061, $078e
    person_event $27, 15, 18, $2, $11, 255, 255, $b0, 0, UnknownScript_0x58076, $078f
    person_event $27, 12, 16, $7, $0, 255, 255, $80, 0, UnknownScript_0x5807e, $078f
; 0x58560
```

