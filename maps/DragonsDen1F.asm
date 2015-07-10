DragonsDen1F_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

DragonsDen1F_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $5, $3, 8, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY
	warp_def $3, $3, 4, GROUP_DRAGONS_DEN_1F, MAP_DRAGONS_DEN_1F
	warp_def $f, $5, 1, GROUP_DRAGONS_DEN_B1F, MAP_DRAGONS_DEN_B1F
	warp_def $d, $5, 2, GROUP_DRAGONS_DEN_1F, MAP_DRAGONS_DEN_1F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 0
