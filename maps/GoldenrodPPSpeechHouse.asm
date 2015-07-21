GoldenrodPPSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
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

.Warps:
	db 2
	warp_def $7, $2, 7, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $7, $3, 7, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY

.XYTriggers:
	db 0

.Signposts:
	db 3
	signpost 1, 0, SIGNPOST_READ, GoldenrodPPSpeechHouseBookshelf1
	signpost 1, 1, SIGNPOST_READ, GoldenrodPPSpeechHouseBookshelf2
	signpost 1, 7, SIGNPOST_READ, GoldenrodPPSpeechHouseRadio

.PersonEvents:
	db 2
	person_event SPRITE_FISHER, 8, 6, OW_UP | $0, $10, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, FisherScript_0x5564a, -1
	person_event SPRITE_LASS, 7, 9, OW_LEFT | $0, $10, -1, -1, $0, 0, LassScript_0x5564d, -1
