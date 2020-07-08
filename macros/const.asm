; Enumerate constants

const_def: MACRO
if _NARG >= 1
const_value = \1
else
const_value = 0
endc
if _NARG >= 2
const_inc = \2
else
const_inc = 1
endc
ENDM

const: MACRO
\1 EQU const_value
const_value = const_value + const_inc
ENDM

shift_const: MACRO
\1 EQU (1 << const_value)
const_value = const_value + const_inc
ENDM
