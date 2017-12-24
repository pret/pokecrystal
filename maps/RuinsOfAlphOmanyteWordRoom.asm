RuinsOfAlphOmanyteWordRoom_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

RuinsOfAlphOmanyteWordRoom_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $9, 3, RUINS_OF_ALPH_OMANYTE_ITEM_ROOM
	warp_def $7, $a, 4, RUINS_OF_ALPH_OMANYTE_ITEM_ROOM
	warp_def $d, $11, 6, RUINS_OF_ALPH_INNER_CHAMBER

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 0
