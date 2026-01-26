; Macros to verify assumptions about the data or code

MACRO? _redef_current_label
	if DEF(\1)
		PURGE \1
	endc
	if _NARG > 2
		DEF \1 EQUS "\3"
	elif STRLEN(#__SCOPE__)
		if {{__SCOPE__}} - @ == 0
			DEF \1 EQUS #{__SCOPE__}
		endc
	endc
	if !DEF(\1)
		DEF \1 EQUS \2
		{\1}:
	endc
ENDM

MACRO? table_width
	DEF CURRENT_TABLE_WIDTH = \1
	shift
	_redef_current_label CURRENT_TABLE_START, "._table_width\@", \#
ENDM

MACRO? assert_table_length
	DEF w = \1
	DEF x = w * CURRENT_TABLE_WIDTH
	DEF y = @ - {CURRENT_TABLE_START}
	assert x == y, "{CURRENT_TABLE_START}: expected {d:w} entries, each {d:CURRENT_TABLE_WIDTH} " ++ \
		"bytes, for {d:x} total; but got {d:y} bytes"
ENDM

MACRO? list_start
	DEF list_index = 0
	DEF list_item_length = 0
	if _NARG > 0
		DEF list_item_length = \1
		shift
	endc
	_redef_current_label CURRENT_LIST_START, "._list_start\@", \#
ENDM

MACRO? li
	assert STRFIND(\1, "@") == -1, "String terminator \"@\" in list entry: \1"
	if list_item_length
		assert CHARLEN(\1) <= list_item_length, \
			"List entry longer than {d:list_item_length} characters: \1"
	endc
	db \1, "@"
	DEF list_index += 1
ENDM

MACRO? assert_list_length
	DEF x = \1
	assert x == list_index, \
		"{CURRENT_LIST_START}: expected {d:x} entries, got {d:list_index}"
ENDM

MACRO? def_grass_wildmons
;\1: map id
	REDEF CURRENT_GRASS_WILDMONS_MAP EQUS "\1"
	REDEF CURRENT_GRASS_WILDMONS_LABEL EQUS "._def_grass_wildmons_\1"
{CURRENT_GRASS_WILDMONS_LABEL}:
	map_id \1
ENDM

MACRO? end_grass_wildmons
	DEF x = @ - {CURRENT_GRASS_WILDMONS_LABEL}
	assert GRASS_WILDDATA_LENGTH == x, \
		"def_grass_wildmons {CURRENT_GRASS_WILDMONS_MAP}: expected {d:GRASS_WILDDATA_LENGTH} bytes, got {d:x}"
ENDM

MACRO? def_water_wildmons
;\1: map id
	REDEF CURRENT_WATER_WILDMONS_MAP EQUS "\1"
	REDEF CURRENT_WATER_WILDMONS_LABEL EQUS "._def_water_wildmons_\1"
{CURRENT_WATER_WILDMONS_LABEL}:
	map_id \1
ENDM

MACRO? end_water_wildmons
	DEF x = @ - {CURRENT_WATER_WILDMONS_LABEL}
	assert WATER_WILDDATA_LENGTH == x, \
		"def_water_wildmons {CURRENT_WATER_WILDMONS_MAP}: expected {d:WATER_WILDDATA_LENGTH} bytes, got {d:x}"
ENDM
