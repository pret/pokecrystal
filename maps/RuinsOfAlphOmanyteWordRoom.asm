RuinsOfAlphOmanyteWordRoom_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

RuinsOfAlphOmanyteWordRoom_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def 9, 7, 3, RUINS_OF_ALPH_OMANYTE_ITEM_ROOM
	warp_def 10, 7, 4, RUINS_OF_ALPH_OMANYTE_ITEM_ROOM
	warp_def 17, 13, 6, RUINS_OF_ALPH_INNER_CHAMBER

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 0
