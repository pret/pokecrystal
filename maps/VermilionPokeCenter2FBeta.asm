VermilionPokeCenter2FBeta_MapScriptHeader: ; 0x1917da
	; trigger count
	db 0

	; callback count
	db 0
; 0x1917dc

VermilionPokeCenter2FBeta_MapEventHeader: ; 0x1917dc
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $7, $0, 3, GROUP_VERMILION_POKECENTER_1F, MAP_VERMILION_POKECENTER_1F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 0
; 0x1917e7
