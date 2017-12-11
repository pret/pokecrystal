tilepal: MACRO
; vram bank, pals
x = \1 << OAM_TILE_BANK
rept (_NARG +- 1) / 2
	dn (x | PAL_BG_\3), (x | PAL_BG_\2)
	shift
	shift
endr
endm
