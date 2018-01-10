MapGroupRoofs: ; 1c021i
; entries correspond to map groups
; values are indexes for Roofs (see below)
	db -1 ; group 0 (unused)
	db  3 ; group 1 (Olivine)
	db  2 ; group 2 (Mahogany)
	db -1 ; group 3
	db  1 ; group 4 (Ecruteak)
	db  2 ; group 5 (Blackthorn)
	db -1 ; group 6
	db -1 ; group 7
	db  2 ; group 8 (Azalea)
	db  2 ; group 9 (Lake of Rage)
	db  1 ; group 10 (Violet)
	db  4 ; group 11 (Goldenrod)
	db -1 ; group 12
	db -1 ; group 13
	db -1 ; group 14
	db -1 ; group 15
	db -1 ; group 16
	db -1 ; group 17
	db -1 ; group 18
	db  0 ; group 19 (Silver Cave)
	db -1 ; group 20
	db -1 ; group 21
	db  3 ; group 22 (Cianwood)
	db -1 ; group 23
	db  0 ; group 24 (New Bark)
	db -1 ; group 25
	db  0 ; group 26 (Cherrygrove)
; 1c03c

Roofs: ; 1c03c
INCBIN "gfx/tilesets/roofs/0.2bpp"
INCBIN "gfx/tilesets/roofs/1.2bpp"
INCBIN "gfx/tilesets/roofs/2.2bpp"
INCBIN "gfx/tilesets/roofs/3.2bpp"
INCBIN "gfx/tilesets/roofs/4.2bpp"
; 1c30c
