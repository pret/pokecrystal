RuinsofAlphHoOhWordRoom_MapScriptHeader: ; 0x59b3e
	; trigger count
	db 0

	; callback count
	db 0
; 0x59b40

RuinsofAlphHoOhWordRoom_MapEventHeader: ; 0x59b40
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $9, $9, 3, GROUP_RUINS_OF_ALPH_HO_OH_ITEM_ROOM, MAP_RUINS_OF_ALPH_HO_OH_ITEM_ROOM
	warp_def $9, $a, 4, GROUP_RUINS_OF_ALPH_HO_OH_ITEM_ROOM, MAP_RUINS_OF_ALPH_HO_OH_ITEM_ROOM
	warp_def $15, $11, 2, GROUP_RUINS_OF_ALPH_INNER_CHAMBER, MAP_RUINS_OF_ALPH_INNER_CHAMBER

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 0
; 0x59b55
