TinTower9F_MapScriptHeader: ; 0x185b86
	; trigger count
	db 0

	; callback count
	db 0
; 0x185b88

ItemFragment_0x185b88: ; 0x185b88
	db HP_UP, 1
; 0x185b8a

UnknownText_0x185b8a: ; 0x185b8a
	text "HO-OH: Shaoooh!"
	done
; 0x185b9b

UnknownText_0x185b9b: ; 0x185b9b
	text "LUGIA: Gyaaan!"
	done
; 0x185bab

TinTower9F_MapEventHeader: ; 0x185bab
	; filler
	db 0, 0

	; warps
	db 7
	warp_def $3, $c, 2, GROUP_TIN_TOWER_8F, MAP_TIN_TOWER_8F
	warp_def $5, $2, 3, GROUP_TIN_TOWER_8F, MAP_TIN_TOWER_8F
	warp_def $7, $c, 4, GROUP_TIN_TOWER_8F, MAP_TIN_TOWER_8F
	warp_def $9, $7, 1, GROUP_TIN_TOWER_ROOF, MAP_TIN_TOWER_ROOF
	warp_def $7, $10, 5, GROUP_TIN_TOWER_7F, MAP_TIN_TOWER_7F
	warp_def $d, $6, 5, GROUP_TIN_TOWER_8F, MAP_TIN_TOWER_8F
	warp_def $d, $8, 6, GROUP_TIN_TOWER_8F, MAP_TIN_TOWER_8F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_POKE_BALL, 5, 13, $1, $0, 255, 255, $1, 0, ItemFragment_0x185b88, $07c7
; 0x185be1

