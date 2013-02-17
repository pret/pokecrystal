GoldenrodPPSpeechHouse_MapScriptHeader: ; 0x55648
	; trigger count
	db 0

	; callback count
	db 0
; 0x5564a

UnknownScript_0x5564a: ; 0x5564a
	jumptextfaceplayer UnknownText_0x55659
; 0x5564d

UnknownScript_0x5564d: ; 0x5564d
	jumptextfaceplayer UnknownText_0x556ca
; 0x55650

MapGoldenrodPPSpeechHouseSignpost1Script: ; 0x55650
	jumpstd $0001
; 0x55653

MapGoldenrodPPSpeechHouseSignpost0Script: ; 0x55653
	jumpstd $0003
; 0x55656

MapGoldenrodPPSpeechHouseSignpost2Script: ; 0x55656
	jumpstd $000c
; 0x55659

UnknownText_0x55659: ; 0x55659
	db $0, "Once while I was", $4f
	db "battling, my", $51
	db "#MON couldn't", $4f
	db "make any moves.", $51
	db "The POWER POINTS,", $4f
	db "or PP, of its", $51
	db "moves were all", $4f
	db "gone.", $57
; 0x556ca

UnknownText_0x556ca: ; 0x556ca
	db $0, "Sometimes, a", $4f
	db "healthy #MON", $51
	db "may be unable to", $4f
	db "use its moves.", $51
	db "If that happens,", $4f
	db "heal it at a #-", $55
	db "MON CENTER or use", $55
	db "an item.", $57
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
	person_event $3a, 8, 6, $4, $10, 255, 255, $a0, 0, UnknownScript_0x5564a, $ffff
	person_event $28, 7, 9, $8, $10, 255, 255, $0, 0, UnknownScript_0x5564d, $ffff
; 0x5577a

