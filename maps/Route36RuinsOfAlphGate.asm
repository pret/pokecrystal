const_value set 2
	const ROUTE36RUINSOFALPHGATE_OFFICER
	const ROUTE36RUINSOFALPHGATE_GRAMPS

Route36RuinsOfAlphGate_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

Route36RuinsOfAlphGateOfficerScript:
	jumptextfaceplayer Route36RuinsOfAlphGateOfficerText

Route36RuinsOfAlphGateGrampsScript:
	jumptextfaceplayer Route36RuinsOfAlphGateGrampsText

Route36RuinsOfAlphGateOfficerText:
	text "Don't you wonder"
	line "who'd make some-"
	cont "thing like this?"
	cont "And why?"
	done

Route36RuinsOfAlphGateGrampsText:
	text "Did you see that"
	line "strange tree in"
	cont "the road?"

	para "That may explain"
	line "why fewer people"

	para "are visiting the"
	line "RUINS OF ALPH."
	done

Route36RuinsOfAlphGate_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $0, $4, 3, ROUTE_36
	warp_def $0, $5, 4, ROUTE_36
	warp_def $7, $4, 9, RUINS_OF_ALPH_OUTSIDE
	warp_def $7, $5, 9, RUINS_OF_ALPH_OUTSIDE

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_OFFICER, 4, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, Route36RuinsOfAlphGateOfficerScript, -1
	person_event SPRITE_GRAMPS, 5, 7, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, Route36RuinsOfAlphGateGrampsScript, -1
