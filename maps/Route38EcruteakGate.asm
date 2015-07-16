Route38EcruteakGate_MapScriptHeader:
	; trigger count
	db 0

	; callback count
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

	; warps
	db 4
	warp_def $4, $0, 1, GROUP_ROUTE_38, MAP_ROUTE_38
	warp_def $5, $0, 2, GROUP_ROUTE_38, MAP_ROUTE_38
	warp_def $4, $9, 14, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $5, $9, 15, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_OFFICER, 6, 9, UP << 2 | $2, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, OfficerScript_0x9cbd7, -1
