TinTower3F_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

ItemFragment_0x185a37:
	db FULL_HEAL, 1

TinTower3F_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $e, $a, 1, GROUP_TIN_TOWER_2F, MAP_TIN_TOWER_2F
	warp_def $2, $10, 2, GROUP_TIN_TOWER_4F, MAP_TIN_TOWER_4F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_POKE_BALL, 18, 7, DOWN << 2 | $1, $0, -1, -1, $1, 0, ItemFragment_0x185a37, EVENT_TIN_TOWER_3F_FULL_HEAL
