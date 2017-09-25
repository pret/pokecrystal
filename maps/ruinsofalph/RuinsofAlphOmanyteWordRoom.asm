RuinsofAlphOmanyteWordRoom_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

RuinsofAlphOmanyteWordRoom_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $9, 3, RUINS_OF_ALPH_OMANYTE_ITEM_ROOM
	warp_def $7, $a, 4, RUINS_OF_ALPH_OMANYTE_ITEM_ROOM
	warp_def $d, $11, 6, RUINS_OF_ALPH_INNER_CHAMBER

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 0
