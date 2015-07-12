TinTower8F_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

ItemFragment_0x185b35:
	db NUGGET, 1

ItemFragment_0x185b37:
	db MAX_ELIXER, 1

ItemFragment_0x185b39:
	db FULL_RESTORE, 1

TinTower8F_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 6
	warp_def $5, $2, 2, GROUP_TIN_TOWER_7F, MAP_TIN_TOWER_7F
	warp_def $b, $2, 1, GROUP_TIN_TOWER_9F, MAP_TIN_TOWER_9F
	warp_def $7, $10, 2, GROUP_TIN_TOWER_9F, MAP_TIN_TOWER_9F
	warp_def $3, $a, 3, GROUP_TIN_TOWER_9F, MAP_TIN_TOWER_9F
	warp_def $f, $e, 6, GROUP_TIN_TOWER_9F, MAP_TIN_TOWER_9F
	warp_def $9, $6, 7, GROUP_TIN_TOWER_9F, MAP_TIN_TOWER_9F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_POKE_BALL, 17, 11, $1, $0, 255, 255, $1, 0, ItemFragment_0x185b35, EVENT_651
	person_event SPRITE_POKE_BALL, 10, 15, $1, $0, 255, 255, $1, 0, ItemFragment_0x185b37, EVENT_652
	person_event SPRITE_POKE_BALL, 5, 7, $1, $0, 255, 255, $1, 0, ItemFragment_0x185b39, EVENT_653
