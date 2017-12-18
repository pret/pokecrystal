const_value set 2
	const ROUTE32RUINSOFALPHGATE_OFFICER
	const ROUTE32RUINSOFALPHGATE_POKEFAN_M
	const ROUTE32RUINSOFALPHGATE_YOUNGSTER

Route32RuinsOfAlphGate_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

Route32RuinsOfAlphGateOfficerScript:
	jumptextfaceplayer Route32RuinsOfAlphGateOfficerText

Route32RuinsOfAlphGatePokefanMScript:
	jumptextfaceplayer Route32RuinsOfAlphGatePokefanMText

Route32RuinsOfAlphGateYoungsterScript:
	jumptextfaceplayer Route32RuinsOfAlphGateYoungsterText

Route32RuinsOfAlphGateOfficerText:
	text "RUINS OF ALPH"

	para "A Look-and-Touch"
	line "Tourist Site"

	para "Try the sliding"
	line "stone panels!"
	done

Route32RuinsOfAlphGatePokefanMText:
	text "You're studying"
	line "the RUINS?"

	para "I see a scientist"
	line "in the making."
	done

Route32RuinsOfAlphGateYoungsterText:
	text "There are drawings"
	line "on stone panels."

	para "I tried moving"
	line "them. I wonder"
	cont "what they are."
	done

Route32RuinsOfAlphGate_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $4, $0, 10, RUINS_OF_ALPH_OUTSIDE
	warp_def $5, $0, 11, RUINS_OF_ALPH_OUTSIDE
	warp_def $4, $9, 2, ROUTE_32
	warp_def $5, $9, 3, ROUTE_32

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, Route32RuinsOfAlphGateOfficerScript, -1
	person_event SPRITE_POKEFAN_M, 2, 8, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, Route32RuinsOfAlphGatePokefanMScript, -1
	person_event SPRITE_YOUNGSTER, 6, 1, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, PERSONTYPE_SCRIPT, 0, Route32RuinsOfAlphGateYoungsterScript, -1
