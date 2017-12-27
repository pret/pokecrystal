VRAM_Begin EQU $8000
VRAM_End   EQU $a000

GLOBAL VRAM_Begin, VRAM_End


SECTION "VRAM0", VRAM

VTiles0:: ds $800
VTiles1:: ds $800
VTiles2:: ds $800
VBGMap0:: ds $400
VBGMap1:: ds $400


SECTION "VRAM1", VRAM

VTiles3:: ds $800
VTiles4:: ds $800
VTiles5:: ds $800
VBGMap2:: ds $400
VBGMap3:: ds $400
