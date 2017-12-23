RGB: MACRO
rept _NARG / 3
	dw ((\3) << 10) + ((\2) << 5) + (\1)
	shift
	shift
	shift
endr
ENDM

palettes EQUS "* 8"
palette  EQUS "+ 8 *"

palred   EQUS "$0001 *"
palgreen EQUS "$0020 *"
palblue  EQUS "$0400 *"
