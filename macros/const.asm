; Enumerate constants

MACRO const_def
	if _NARG >= 1
		DEF const_value = \1
	else
		DEF const_value = 0
	endc
	if _NARG >= 2
		DEF const_inc = \2
	else
		DEF const_inc = 1
	endc
ENDM

MACRO const
	DEF \1 EQU const_value
	DEF const_value += const_inc
ENDM

MACRO shift_const
	DEF \1 EQU 1 << const_value
	DEF const_value += const_inc
ENDM

MACRO const_skip
	if _NARG >= 1
		DEF const_value += const_inc * (\1)
	else
		DEF const_value += const_inc
	endc
ENDM

MACRO const_next
	if (const_value > 0 && \1 < const_value) || (const_value < 0 && \1 > const_value)
		fail "const_next cannot go backwards from {const_value} to \1"
	else
		DEF const_value = \1
	endc
ENDM

MACRO rb_skip
	if _NARG == 1
		rsset _RS + \1
	else
		rsset _RS + 1
	endc
ENDM
