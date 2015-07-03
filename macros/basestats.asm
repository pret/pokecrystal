define: macro
if !def(\1)
\1 equs \2
endc
endm

const_value = 0

add_tm: MACRO
if !def(TM01)
TM01 = const_value
	enum_start 1
endc
	define _\@_1, "TM_\1"
	const _\@_1
	enum \1_TMNUM
ENDM

add_hm: MACRO
if !def(HM01)
HM01 = const_value
endc
	define _\@_1, "HM_\1"
	const _\@_1
	enum \1_TMNUM
ENDM

add_mt: MACRO
	enum \1_TMNUM
ENDM

tmhm: MACRO
x = 0
y = 0
w = 0
	rept _NARG
	if def(\1_TMNUM)
	if \1_TMNUM < 25
x = x | (1 << ((\1_TMNUM) - 1))
	else
	if \1_TMNUM < 49
y = y | (1 << ((\1_TMNUM) - 1 - 24))
	else
w = w | (1 << ((\1_TMNUM) - 1 - 48))
	endc
	endc
	else
		fail "\1 is not a TM, HM, or move tutor move"
	endc

	shift
	endr

	rept 3
	db x & $ff
x = x >> 8
	endr
	rept 3
	db y & $ff
y = y >> 8
	endr
	rept 2
	db w & $ff
w = w >> 8
	endr
ENDM
