RuinsOfAlphHoOhWordRoom_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

RuinsOfAlphHoOhWordRoom_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def 9, 9, 3, RUINS_OF_ALPH_HO_OH_ITEM_ROOM
	warp_def 10, 9, 4, RUINS_OF_ALPH_HO_OH_ITEM_ROOM
	warp_def 17, 21, 2, RUINS_OF_ALPH_INNER_CHAMBER

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 0
