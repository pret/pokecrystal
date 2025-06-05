SECTION "VRAM0", VRAM

vTiles0:: ds $80 tiles
vTiles1:: ds $80 tiles
vTiles2:: ds $80 tiles
vBGMap0:: ds SCRN_VX_B * SCRN_VY_B
vBGMap1:: ds SCRN_VX_B * SCRN_VY_B


SECTION "VRAM1", VRAM

vTiles3:: ds $80 tiles
vTiles4:: ds $80 tiles
vTiles5:: ds $80 tiles
vBGMap2:: ds SCRN_VX_B * SCRN_VY_B
vBGMap3:: ds SCRN_VX_B * SCRN_VY_B

ENDSECTION
