TinTower3F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ItemFragment_0x185a37:
	db FULL_HEAL, 1

TinTower3F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $e, $a, 1, GROUP_TIN_TOWER_2F, MAP_TIN_TOWER_2F
	warp_def $2, $10, 2, GROUP_TIN_TOWER_4F, MAP_TIN_TOWER_4F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_POKE_BALL, 18, 7, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x185a37, EVENT_TIN_TOWER_3F_FULL_HEAL
