Route10PokeCenter2FBeta_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

Route10PokeCenter2FBeta_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $7, $0, 3, GROUP_ROUTE_10_POKECENTER_1F, MAP_ROUTE_10_POKECENTER_1F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 0
