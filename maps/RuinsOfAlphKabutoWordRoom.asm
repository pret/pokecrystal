RuinsOfAlphKabutoWordRoom_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

RuinsOfAlphKabutoWordRoom_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def 9, 5, 3, RUINS_OF_ALPH_KABUTO_ITEM_ROOM
	warp_def 10, 5, 4, RUINS_OF_ALPH_KABUTO_ITEM_ROOM
	warp_def 17, 11, 4, RUINS_OF_ALPH_INNER_CHAMBER

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 0
