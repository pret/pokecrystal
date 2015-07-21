TinTower7F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ItemFragment_0x185b05:
	db MAX_REVIVE, 1

TinTower7F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def $9, $3, 1, GROUP_TIN_TOWER_6F, MAP_TIN_TOWER_6F
	warp_def $f, $a, 1, GROUP_TIN_TOWER_8F, MAP_TIN_TOWER_8F
	warp_def $7, $c, 4, GROUP_TIN_TOWER_7F, MAP_TIN_TOWER_7F
	warp_def $3, $8, 3, GROUP_TIN_TOWER_7F, MAP_TIN_TOWER_7F
	warp_def $9, $6, 5, GROUP_TIN_TOWER_9F, MAP_TIN_TOWER_9F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_POKE_BALL, 5, 20, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x185b05, EVENT_TIN_TOWER_7F_MAX_REVIVE
