IcePathB2FMahoganySide_MapScriptHeader: ; 0x7e5a1
	; trigger count
	db 0

	; callback count
	db 0
; 0x7e5a3

UnknownScript_0x7e5a3: ; 0x7e5a3
	jumptext UnknownText_0x7e5ad
; 0x7e5a6

ItemFragment_0x7e5a6: ; 0x7e5a6
	db FULL_HEAL, 1
; 0x7e5a8

ItemFragment_0x7e5a8: ; 0x7e5a8
	db MAX_POTION, 1
; 0x7e5aa

MapIcePathB2FMahoganySideSignpostItem0: ; 0x7e5aa
	dw $0095
	db CARBOS
	
; 0x7e5ad

UnknownText_0x7e5ad: ; 0x7e5ad
	db $0, "It's immovably", $4f
	db "imbedded in ice.", $57
; 0x7e5cd

IcePathB2FMahoganySide_MapEventHeader: ; 0x7e5cd
	; filler
	db 0, 0

	; warps
	db 6
	warp_def $1, $11, 2, GROUP_ICE_PATH_B1F, MAP_ICE_PATH_B1F
	warp_def $b, $9, 1, GROUP_ICE_PATH_B3F, MAP_ICE_PATH_B3F
	warp_def $4, $b, 3, GROUP_ICE_PATH_B1F, MAP_ICE_PATH_B1F
	warp_def $6, $4, 4, GROUP_ICE_PATH_B1F, MAP_ICE_PATH_B1F
	warp_def $c, $4, 5, GROUP_ICE_PATH_B1F, MAP_ICE_PATH_B1F
	warp_def $c, $c, 6, GROUP_ICE_PATH_B1F, MAP_ICE_PATH_B1F

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 17, 0, $7, MapIcePathB2FMahoganySideSignpostItem0

	; people-events
	db 6
	person_event $5a, 7, 15, $1, $0, 255, 255, $0, 0, UnknownScript_0x7e5a3, $070d
	person_event $5a, 11, 8, $1, $0, 255, 255, $0, 0, UnknownScript_0x7e5a3, $070e
	person_event $5a, 16, 7, $1, $0, 255, 255, $0, 0, UnknownScript_0x7e5a3, $070f
	person_event $5a, 17, 16, $1, $0, 255, 255, $0, 0, UnknownScript_0x7e5a3, $0710
	person_event $54, 13, 12, $1, $0, 255, 255, $1, 0, ItemFragment_0x7e5a6, $068b
	person_event $54, 6, 4, $1, $0, 255, 255, $1, 0, ItemFragment_0x7e5a8, $068c
; 0x7e644

