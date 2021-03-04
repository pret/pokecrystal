; Macros to verify assumptions about the data or code

table_width: MACRO
CURRENT_TABLE_WIDTH = \1
if DEF(CURRENT_TABLE_START)
PURGE CURRENT_TABLE_START
endc
if _NARG == 2
CURRENT_TABLE_START EQUS "\2"
else
CURRENT_TABLE_START EQUS "._table_width\@"
CURRENT_TABLE_START:
endc
ENDM

assert_table_length: MACRO
x = \1
	assert x * CURRENT_TABLE_WIDTH == @ - CURRENT_TABLE_START, \
		"{CURRENT_TABLE_START}: expected {d:x} entries, each {d:CURRENT_TABLE_WIDTH} bytes"
ENDM
