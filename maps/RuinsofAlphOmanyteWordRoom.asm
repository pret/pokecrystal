RuinsofAlphOmanyteWordRoom_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

RuinsofAlphOmanyteWordRoom_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $9, 3, GROUP_RUINS_OF_ALPH_OMANYTE_ITEM_ROOM, MAP_RUINS_OF_ALPH_OMANYTE_ITEM_ROOM
	warp_def $7, $a, 4, GROUP_RUINS_OF_ALPH_OMANYTE_ITEM_ROOM, MAP_RUINS_OF_ALPH_OMANYTE_ITEM_ROOM
	warp_def $d, $11, 6, GROUP_RUINS_OF_ALPH_INNER_CHAMBER, MAP_RUINS_OF_ALPH_INNER_CHAMBER

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 0
