const_value set 2
	const FIGHTINGDOJO_BLACK_BELT
	const FIGHTINGDOJO_POKE_BALL

FightingDojo_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

FightingDojoBlackBelt:
	jumptextfaceplayer FightingDojoBlackBeltText

MapFightingDojoSignpost0Script:
	jumptext FightingDojoSign0Text

MapFightingDojoSignpost1Script:
	jumptext FightingDojoSign1Text

FightingDojoFocusBand:
	itemball FOCUS_BAND

FightingDojoBlackBeltText:
	text "Hello!"

	para "KARATE KING, the"
	line "FIGHTING DOJO's"

	para "master, is in a"
	line "cave in JOHTO for"
	cont "training."
	done

FightingDojoSign0Text:
	text "What goes around"
	line "comes around!"
	done

FightingDojoSign1Text:
	text "Enemies on every"
	line "side!"
	done

FightingDojo_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 4, 11, 1, SAFFRON_CITY
	warp_def 5, 11, 1, SAFFRON_CITY

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 4, 0, BGEVENT_READ, MapFightingDojoSignpost0Script
	bg_event 5, 0, BGEVENT_READ, MapFightingDojoSignpost1Script

.ObjectEvents:
	db 2
	object_event 4, 4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FightingDojoBlackBelt, -1
	object_event 3, 1, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FightingDojoFocusBand, EVENT_PICKED_UP_FOCUS_BAND
