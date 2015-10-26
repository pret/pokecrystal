TinTower8F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
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

.Warps:
	db 6
	warp_def $5, $2, 2, TIN_TOWER_7F
	warp_def $b, $2, 1, TIN_TOWER_9F
	warp_def $7, $10, 2, TIN_TOWER_9F
	warp_def $3, $a, 3, TIN_TOWER_9F
	warp_def $f, $e, 6, TIN_TOWER_9F
	warp_def $9, $6, 7, TIN_TOWER_9F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_POKE_BALL, 13, 7, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x185b35, EVENT_TIN_TOWER_8F_NUGGET
	person_event SPRITE_POKE_BALL, 6, 11, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x185b37, EVENT_TIN_TOWER_8F_MAX_ELIXER
	person_event SPRITE_POKE_BALL, 1, 3, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x185b39, EVENT_TIN_TOWER_8F_FULL_RESTORE
