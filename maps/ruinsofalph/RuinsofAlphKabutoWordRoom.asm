RuinsofAlphKabutoWordRoom_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

RuinsofAlphKabutoWordRoom_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $5, $9, 3, RUINS_OF_ALPH_KABUTO_ITEM_ROOM
	warp_def $5, $a, 4, RUINS_OF_ALPH_KABUTO_ITEM_ROOM
	warp_def $b, $11, 4, RUINS_OF_ALPH_INNER_CHAMBER

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 0
