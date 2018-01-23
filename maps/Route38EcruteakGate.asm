const_value set 2
	const ROUTE38ECRUTEAKGATE_OFFICER

Route38EcruteakGate_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

Route38EcruteakGateOfficerScript:
	jumptextfaceplayer Route38EcruteakGateOfficerText

Route38EcruteakGateOfficerText:
	text "Where did you say"
	line "you're from?"

	para "NEW BARK TOWN?"

	para "PROF.ELM lives"
	line "over there, right?"

	para "You've come a long"
	line "way to get here."
	done

Route38EcruteakGate_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def 0, 4, 1, ROUTE_38
	warp_def 0, 5, 2, ROUTE_38
	warp_def 9, 4, 14, ECRUTEAK_CITY
	warp_def 9, 5, 15, ECRUTEAK_CITY

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 1
	object_event 5, 2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route38EcruteakGateOfficerScript, -1
