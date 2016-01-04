const_value set 2
	const TINTOWER9F_POKE_BALL

TinTower9F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TinTower9FHPUp:
	itemball HP_UP

UnknownText_0x185b8a:
	text "HO-OH: Shaoooh!"
	done

UnknownText_0x185b9b:
	text "LUGIA: Gyaaan!"
	done

TinTower9F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 7
	warp_def $3, $c, 2, TIN_TOWER_8F
	warp_def $5, $2, 3, TIN_TOWER_8F
	warp_def $7, $c, 4, TIN_TOWER_8F
	warp_def $9, $7, 1, TIN_TOWER_ROOF
	warp_def $7, $10, 5, TIN_TOWER_7F
	warp_def $d, $6, 5, TIN_TOWER_8F
	warp_def $d, $8, 6, TIN_TOWER_8F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_POKE_BALL, 1, 9, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TinTower9FHPUp, EVENT_TIN_TOWER_9F_HP_UP
