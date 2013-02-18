TinTower3F_MapScriptHeader: ; 0x185a35
	; trigger count
	db 0

	; callback count
	db 0
; 0x185a37

ItemFragment_0x185a37: ; 0x185a37
	db FULL_HEAL, 1
; 0x185a39

TinTower3F_MapEventHeader: ; 0x185a39
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
	person_event $54, 18, 7, $1, $0, 255, 255, $1, 0, ItemFragment_0x185a37, $064b
; 0x185a56

