CeruleanPokeCenter2FBeta_MapScriptHeader: ; 0x1883c2
	; trigger count
	db 0

	; callback count
	db 0
; 0x1883c4

CeruleanPokeCenter2FBeta_MapEventHeader: ; 0x1883c4
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $7, $0, 1, GROUP_CERULEAN_POKECENTER_1F, MAP_CERULEAN_POKECENTER_1F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 0
; 0x1883cf

