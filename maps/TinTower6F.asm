TinTower6F_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

ItemFragment_0x185ae4:
	db MAX_POTION, 1

TinTower6F_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $9, $3, 1, GROUP_TIN_TOWER_7F, MAP_TIN_TOWER_7F
	warp_def $f, $b, 1, GROUP_TIN_TOWER_5F, MAP_TIN_TOWER_5F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_POKE_BALL, 12, 12, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x185ae4, EVENT_TIN_TOWER_6F_MAX_POTION
