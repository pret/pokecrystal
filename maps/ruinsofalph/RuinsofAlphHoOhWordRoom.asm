RuinsofAlphHoOhWordRoom_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

RuinsofAlphHoOhWordRoom_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $9, $9, 3, RUINS_OF_ALPH_HO_OH_ITEM_ROOM
	warp_def $9, $a, 4, RUINS_OF_ALPH_HO_OH_ITEM_ROOM
	warp_def $15, $11, 2, RUINS_OF_ALPH_INNER_CHAMBER

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 0
