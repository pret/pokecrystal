LavenderPokeCenter2FBeta_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

LavenderPokeCenter2FBeta_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $7, $0, 3, GROUP_LAVENDER_POKECENTER_1F, MAP_LAVENDER_POKECENTER_1F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 0
