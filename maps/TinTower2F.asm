TinTower2F_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

TinTower2F_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $e, $a, 1, GROUP_TIN_TOWER_3F, MAP_TIN_TOWER_3F
	warp_def $2, $a, 3, GROUP_TIN_TOWER_1F, MAP_TIN_TOWER_1F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 0
