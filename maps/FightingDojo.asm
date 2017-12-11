const_value set 2
	const FIGHTINGDOJO_BLACK_BELT
	const FIGHTINGDOJO_POKE_BALL

FightingDojo_MapScriptHeader:
.MapTriggers:
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

FightingDojo_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $b, $4, 1, SAFFRON_CITY
	warp_def $b, $5, 1, SAFFRON_CITY

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 0, 4, SIGNPOST_READ, MapFightingDojoSignpost0Script
	signpost 0, 5, SIGNPOST_READ, MapFightingDojoSignpost1Script

.PersonEvents:
	db 2
	person_event SPRITE_BLACK_BELT, 4, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, FightingDojoBlackBelt, -1
	person_event SPRITE_POKE_BALL, 1, 3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, FightingDojoFocusBand, EVENT_PICKED_UP_FOCUS_BAND
