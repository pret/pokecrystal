TinTower7F_MapScriptHeader: ; 0x185b03
	; trigger count
	db 0

	; callback count
	db 0
; 0x185b05

ItemFragment_0x185b05: ; 0x185b05
	db MAX_REVIVE, 1
; 0x185b07

TinTower7F_MapEventHeader: ; 0x185b07
	; filler
	db 0, 0

	; warps
	db 5
	warp_def $9, $3, 1, GROUP_TIN_TOWER_6F, MAP_TIN_TOWER_6F
	warp_def $f, $a, 1, GROUP_TIN_TOWER_8F, MAP_TIN_TOWER_8F
	warp_def $7, $c, 4, GROUP_TIN_TOWER_7F, MAP_TIN_TOWER_7F
	warp_def $3, $8, 3, GROUP_TIN_TOWER_7F, MAP_TIN_TOWER_7F
	warp_def $9, $6, 5, GROUP_TIN_TOWER_9F, MAP_TIN_TOWER_9F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_POKE_BALL, 5, 20, $1, $0, 255, 255, $1, 0, ItemFragment_0x185b05, $0650
; 0x185b33
