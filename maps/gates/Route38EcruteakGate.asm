const_value set 2
	const ROUTE38ECRUTEAKGATE_OFFICER

Route38EcruteakGate_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

OfficerScript_0x9cbd7:
	jumptextfaceplayer UnknownText_0x9cbda

UnknownText_0x9cbda:
	text "Where did you say"
	line "you're from?"

	para "NEW BARK TOWN?"

	para "PROF.ELM lives"
	line "over there, right?"

	para "You've come a long"
	line "way to get here."
	done

Route38EcruteakGate_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $4, $0, 1, ROUTE_38
	warp_def $5, $0, 2, ROUTE_38
	warp_def $4, $9, 14, ECRUTEAK_CITY
	warp_def $5, $9, 15, ECRUTEAK_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, OfficerScript_0x9cbd7, -1
