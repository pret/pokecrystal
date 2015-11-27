const_value set 2
	const ROUTE36RUINSOFALPHGATE_OFFICER
	const ROUTE36RUINSOFALPHGATE_GRAMPS

Route36RuinsofAlphgate_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

OfficerScript_0x6aa1a:
	jumptextfaceplayer UnknownText_0x6aa20

GrampsScript_0x6aa1d:
	jumptextfaceplayer UnknownText_0x6aa5b

UnknownText_0x6aa20:
	text "Don't you wonder"
	line "who'd make some-"
	cont "thing like this?"
	cont "And why?"
	done

UnknownText_0x6aa5b:
	text "Did you see that"
	line "strange tree in"
	cont "the road?"

	para "That may explain"
	line "why fewer people"

	para "are visiting the"
	line "RUINS OF ALPH."
	done

Route36RuinsofAlphgate_MapEventHeader:
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
	person_event SPRITE_OFFICER, 4, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, OfficerScript_0x6aa1a, -1
	person_event SPRITE_GRAMPS, 5, 7, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, GrampsScript_0x6aa1d, -1
