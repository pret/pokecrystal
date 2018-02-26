RuinsOfAlphOmanyteWordRoom_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RuinsOfAlphOmanyteWordRoom_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  9,  7, RUINS_OF_ALPH_OMANYTE_ITEM_ROOM, 3
	warp_event 10,  7, RUINS_OF_ALPH_OMANYTE_ITEM_ROOM, 4
	warp_event 17, 13, RUINS_OF_ALPH_INNER_CHAMBER, 6

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
