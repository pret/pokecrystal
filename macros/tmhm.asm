define: MACRO
if !DEF(\1)
\1 EQUS \2
endc
ENDM


; Used in constants/item_constants.asm

const_value = 0

add_tm: MACRO
if !DEF(TM01)
TM01 = const_value
	enum_start 1
endc
	define _\@_1, "TM_\1"
	const _\@_1
	enum \1_TMNUM
ENDM

add_hm: MACRO
if !DEF(HM01)
HM01 = const_value
endc
	define _\@_1, "HM_\1"
	const _\@_1
	enum \1_TMNUM
ENDM

add_mt: MACRO
	enum \1_TMNUM
ENDM


; Used in data/pokemon/base_stats/*.asm

; N TMs/HMs need (N+7)/8 bytes for their bit flags.
; The rgbasm integers tms1, tms2, tms3 each hold 3 bytes, or 24 bits.
tmhm: MACRO
tms1 = 0
tms2 = 0
tms3 = 0
rept _NARG
	if DEF(\1_TMNUM)
	if \1_TMNUM < 24 + 1
tms1 = tms1 | (1 << ((\1_TMNUM) - 1))
	elif \1_TMNUM < 48 + 1
tms2 = tms2 | (1 << ((\1_TMNUM) - 1 - 24))
	else
tms3 = tms3 | (1 << ((\1_TMNUM) - 1 - 48))
	endc
	else
		fail "\1 is not a TM, HM, or move tutor move"
	endc
	shift
endr

rept 3
	db tms1 & $ff
tms1 = tms1 >> 8
endr
rept 3
	db tms2 & $ff
tms2 = tms2 >> 8
endr
rept 2
	db tms3 & $ff
tms3 = tms3 >> 8
endr
ENDM
