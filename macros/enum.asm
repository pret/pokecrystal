; Enumerate variables

enum_start: macro
if _NARG >= 1
__enum__ = \1
else
__enum__ = 0
endc
if _NARG >= 2
__enumdir__ = \2
else
__enumdir__ = +1
endc
endm

enum: macro
\1 = __enum__
__enum__ = __enum__ + __enumdir__
endm

enum_set: macro
__enum__ = \1
endm


; Enumerate constants

const_def: MACRO
const_value = 0
ENDM

const: MACRO
\1 EQU const_value
const_value = const_value + 1
ENDM

shift_const: MACRO
\1 EQU (1 << const_value)
const_value = const_value + 1
ENDM
