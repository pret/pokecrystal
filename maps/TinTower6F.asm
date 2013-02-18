TinTower6F_MapScriptHeader: ; 0x185ae2
	; trigger count
	db 0

	; callback count
	db 0
; 0x185ae4

ItemFragment_0x185ae4: ; 0x185ae4
	db MAX_POTION, 1
; 0x185ae6

TinTower6F_MapEventHeader: ; 0x185ae6
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
	person_event $54, 12, 12, $1, $0, 255, 255, $1, 0, ItemFragment_0x185ae4, $07c6
; 0x185b03

