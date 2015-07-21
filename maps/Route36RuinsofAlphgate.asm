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
	warp_def $0, $4, 3, GROUP_ROUTE_36, MAP_ROUTE_36
	warp_def $0, $5, 4, GROUP_ROUTE_36, MAP_ROUTE_36
	warp_def $7, $4, 9, GROUP_RUINS_OF_ALPH_OUTSIDE, MAP_RUINS_OF_ALPH_OUTSIDE
	warp_def $7, $5, 9, GROUP_RUINS_OF_ALPH_OUTSIDE, MAP_RUINS_OF_ALPH_OUTSIDE

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_OFFICER, 8, 4, OW_LEFT | $1, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, OfficerScript_0x6aa1a, -1
	person_event SPRITE_GRAMPS, 9, 11, OW_DOWN | $2, $21, -1, -1, (PAL_OW_BROWN << 4) | $80, 0, GrampsScript_0x6aa1d, -1
