; Used in tilesets/*.asm

tilepal: MACRO
; vram bank, pals
x = \1 << OAM_TILE_BANK
rept (_NARG +- 1) / 2
	dn (x | PAL_BG_\3), (x | PAL_BG_\2)
	shift
	shift
endr
ENDM

tilecoll: MACRO
	db COLL_\1, COLL_\2, COLL_\3, COLL_\4
ENDM
