RGB: MACRO
rept _NARG / 3
	dw palred (\1) + palgreen (\2) + palblue (\3)
	shift
	shift
	shift
endr
ENDM

palred   EQUS "(1 << 0) *"
palgreen EQUS "(1 << 5) *"
palblue  EQUS "(1 << 10) *"

palettes EQUS "* 8"
palette  EQUS "+ 8 *"
