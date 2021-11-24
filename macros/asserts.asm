; Macros to verify assumptions about the data or code

table_width: MACRO
CURRENT_TABLE_WIDTH = \1
if _NARG == 2
REDEF CURRENT_TABLE_START EQUS "\2"
else
REDEF CURRENT_TABLE_START EQUS "._table_width\@"
{CURRENT_TABLE_START}:
endc
ENDM

assert_table_length: MACRO
x = \1
	assert x * CURRENT_TABLE_WIDTH == @ - {CURRENT_TABLE_START}, \
		"{CURRENT_TABLE_START}: expected {d:x} entries, each {d:CURRENT_TABLE_WIDTH} bytes"
ENDM

list_start: MACRO
list_index = 0
if _NARG == 1
REDEF CURRENT_LIST_START EQUS "\1"
else
REDEF CURRENT_LIST_START EQUS "._list_start\@"
{CURRENT_LIST_START}:
endc
ENDM

li: MACRO
	assert !STRIN(\1, "@"), STRCAT("String terminator \"@\" in list entry: ", \1)
	db \1, "@"
list_index += 1
ENDM

assert_list_length: MACRO
x = \1
	assert x == list_index, \
		"{CURRENT_LIST_START}: expected {d:x} entries, got {d:list_index}"
ENDM

def_grass_wildmons: MACRO
;\1: map id
REDEF CURRENT_GRASS_WILDMONS_MAP EQUS "\1"
REDEF CURRENT_GRASS_WILDMONS_LABEL EQUS "._def_grass_wildmons_\1"
{CURRENT_GRASS_WILDMONS_LABEL}:
	map_id \1
ENDM

end_grass_wildmons: MACRO
	assert GRASS_WILDDATA_LENGTH == @ - {CURRENT_GRASS_WILDMONS_LABEL}, \
		"def_grass_wildmons {CURRENT_GRASS_WILDMONS_MAP}: expected {d:GRASS_WILDDATA_LENGTH} bytes"
ENDM

def_water_wildmons: MACRO
;\1: map id
REDEF CURRENT_WATER_WILDMONS_MAP EQUS "\1"
REDEF CURRENT_WATER_WILDMONS_LABEL EQUS "._def_water_wildmons_\1"
{CURRENT_WATER_WILDMONS_LABEL}:
	map_id \1
ENDM

end_water_wildmons: MACRO
	assert WATER_WILDDATA_LENGTH == @ - {CURRENT_WATER_WILDMONS_LABEL}, \
		"def_water_wildmons {CURRENT_WATER_WILDMONS_MAP}: expected {d:WATER_WILDDATA_LENGTH} bytes"
ENDM
