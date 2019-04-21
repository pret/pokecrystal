	object_const_def ; object_event constants
	const TINTOWER9F_POKE_BALL

TinTower9F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TinTower9FHPUp:
	itemball HP_UP

TinTower9FUnusedHoOhText:
; unused
	text "HO-OH: Shaoooh!"
	done

TinTower9FUnusedLugiaText:
; unused
	text "LUGIA: Gyaaan!"
	done

TinTower9F_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 12,  3, TIN_TOWER_8F, 2
	warp_event  2,  5, TIN_TOWER_8F, 3
	warp_event 12,  7, TIN_TOWER_8F, 4
	warp_event  7,  9, TIN_TOWER_ROOF, 1
	warp_event 16,  7, TIN_TOWER_7F, 5
	warp_event  6, 13, TIN_TOWER_8F, 5
	warp_event  8, 13, TIN_TOWER_8F, 6

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  9,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower9FHPUp, EVENT_TIN_TOWER_9F_HP_UP
