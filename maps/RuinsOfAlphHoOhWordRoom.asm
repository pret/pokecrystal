RuinsOfAlphHoOhWordRoom_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RuinsOfAlphHoOhWordRoom_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 9, 9, 3, RUINS_OF_ALPH_HO_OH_ITEM_ROOM
	warp_event 10, 9, 4, RUINS_OF_ALPH_HO_OH_ITEM_ROOM
	warp_event 17, 21, 2, RUINS_OF_ALPH_INNER_CHAMBER

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
