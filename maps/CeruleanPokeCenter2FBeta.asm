CeruleanPokeCenter2FBeta_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

CeruleanPokeCenter2FBeta_MapEventHeader:
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
