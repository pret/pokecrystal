PewterPokeCEnter2FBeta_MapScriptHeader: ; 0x1a304a
	; trigger count
	db 0

	; callback count
	db 0
; 0x1a304c

PewterPokeCEnter2FBeta_MapEventHeader: ; 0x1a304c
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $7, $0, 3, GROUP_PEWTER_POKECENTER_1F, MAP_PEWTER_POKECENTER_1F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 0
; 0x1a3057

