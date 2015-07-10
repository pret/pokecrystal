GoldenrodPPSpeechHouse_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

FisherScript_0x5564a:
	jumptextfaceplayer UnknownText_0x55659

LassScript_0x5564d:
	jumptextfaceplayer UnknownText_0x556ca

GoldenrodPPSpeechHouseBookshelf2:
	jumpstd difficultbookshelf

GoldenrodPPSpeechHouseBookshelf1:
	jumpstd magazinebookshelf

GoldenrodPPSpeechHouseRadio:
	jumpstd radio2

UnknownText_0x55659:
	text "Once while I was"
	line "battling, my"

	para "#MON couldn't"
	line "make any moves."

	para "The POWER POINTS,"
	line "or PP, of its"

	para "moves were all"
	line "gone."
	done

UnknownText_0x556ca:
	text "Sometimes, a"
	line "healthy #MON"

	para "may be unable to"
	line "use its moves."

	para "If that happens,"
	line "heal it at a #-"
	cont "MON CENTER or use"
	cont "an item."
	done

GoldenrodPPSpeechHouse_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 7, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $7, $3, 7, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 1, 0, $0, GoldenrodPPSpeechHouseBookshelf1
	signpost 1, 1, $0, GoldenrodPPSpeechHouseBookshelf2
	signpost 1, 7, $0, GoldenrodPPSpeechHouseRadio

	; people-events
	db 2
	person_event SPRITE_FISHER, 8, 6, $4, $10, 255, 255, $a0, 0, FisherScript_0x5564a, $ffff
	person_event SPRITE_LASS, 7, 9, $8, $10, 255, 255, $0, 0, LassScript_0x5564d, $ffff
