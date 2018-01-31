	const_def 2 ; object constants
	const TINTOWER9F_POKE_BALL

TinTower9F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TinTower9FHPUp:
	itemball HP_UP

; unused
TinTower9FUnusedHoOhText:
	text "HO-OH: Shaoooh!"
	done

; unused
TinTower9FUnusedLugiaText:
	text "LUGIA: Gyaaan!"
	done

TinTower9F_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 12, 3, 2, TIN_TOWER_8F
	warp_event 2, 5, 3, TIN_TOWER_8F
	warp_event 12, 7, 4, TIN_TOWER_8F
	warp_event 7, 9, 1, TIN_TOWER_ROOF
	warp_event 16, 7, 5, TIN_TOWER_7F
	warp_event 6, 13, 5, TIN_TOWER_8F
	warp_event 8, 13, 6, TIN_TOWER_8F

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 9, 1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower9FHPUp, EVENT_TIN_TOWER_9F_HP_UP
