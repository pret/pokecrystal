CeladonPokeCenter2FBeta_MapScriptHeader: ; 0x7210e
	; trigger count
	db 0

	; callback count
	db 0
; 0x72110

CeladonPokeCenter2FBeta_MapEventHeader: ; 0x72110
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $7, $0, 3, GROUP_CELADON_POKECENTER_1F, MAP_CELADON_POKECENTER_1F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 0
; 0x7211b

