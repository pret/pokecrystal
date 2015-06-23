GoldenrodPPSpeechHouse_MapScriptHeader: ; 0x55648
	; trigger count
	db 0

	; callback count
	db 0
; 0x5564a

FisherScript_0x5564a: ; 0x5564a
	jumptextfaceplayer UnknownText_0x55659
; 0x5564d

LassScript_0x5564d: ; 0x5564d
	jumptextfaceplayer UnknownText_0x556ca
; 0x55650

MapGoldenrodPPSpeechHouseSignpost1Script: ; 0x55650
	jumpstd difficultbookshelf
; 0x55653

MapGoldenrodPPSpeechHouseSignpost0Script: ; 0x55653
	jumpstd magazinebookshelf
; 0x55656

MapGoldenrodPPSpeechHouseSignpost2Script: ; 0x55656
	jumpstd radio2
; 0x55659

UnknownText_0x55659: ; 0x55659
	text "Once while I was"
	line "battling, my"

	para "#MON couldn't"
	line "make any moves."

	para "The POWER POINTS,"
	line "or PP, of its"

	para "moves were all"
	line "gone."
	done
; 0x556ca

UnknownText_0x556ca: ; 0x556ca
	text "Sometimes, a"
	line "healthy #MON"

	para "may be unable to"
	line "use its moves."

	para "If that happens,"
	line "heal it at a #-"
	cont "MON CENTER or use"
	cont "an item."
	done
; 0x55741

GoldenrodPPSpeechHouse_MapEventHeader: ; 0x55741
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
	signpost 1, 0, $0, MapGoldenrodPPSpeechHouseSignpost0Script
	signpost 1, 1, $0, MapGoldenrodPPSpeechHouseSignpost1Script
	signpost 1, 7, $0, MapGoldenrodPPSpeechHouseSignpost2Script

	; people-events
	db 2
	person_event SPRITE_FISHER, 8, 6, $4, $10, 255, 255, $a0, 0, FisherScript_0x5564a, $ffff
	person_event SPRITE_LASS, 7, 9, $8, $10, 255, 255, $0, 0, LassScript_0x5564d, $ffff
; 0x5577a
