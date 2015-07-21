CianwoodLugiaSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TeacherScript_0x9e1b0:
	jumptextfaceplayer UnknownText_0x9e1bc

LassScript_0x9e1b3:
	jumptextfaceplayer UnknownText_0x9e23f

TwinScript_0x9e1b6:
	jumptextfaceplayer UnknownText_0x9e2a9

CianwoodLugiaSpeechHouseBookshelf:
	jumpstd picturebookshelf

UnknownText_0x9e1bc:
	text "You came from"
	line "OLIVINE?"

	para "Do you remember"
	line "the four islands"
	cont "along the way?"

	para "I heard that a "
	line "mythical sea crea-"
	cont "ture is hiding in"
	cont "them."
	done

UnknownText_0x9e23f:
	text "I heard that you"
	line "can only see it if"

	para "you have a SILVER"
	line "WING."

	para "It must have the"
	line "same scent as the"
	cont "creature."
	done

UnknownText_0x9e2a9:
	text "I've heard that"
	line "the whirlpools"

	para "around the islands"
	line "are caused by the"
	cont "sea creature."

	para "You might need a"
	line "special move to"
	cont "get past them."
	done

CianwoodLugiaSpeechHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 6, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY
	warp_def $7, $3, 6, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, CianwoodLugiaSpeechHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, CianwoodLugiaSpeechHouseBookshelf

.PersonEvents:
	db 3
	person_event SPRITE_TEACHER, 8, 6, OW_UP | $2, $0, -1, -1, $0, 0, TeacherScript_0x9e1b0, -1
	person_event SPRITE_LASS, 9, 10, OW_UP | $1, $1, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, LassScript_0x9e1b3, -1
	person_event SPRITE_TWIN, 6, 4, OW_UP | $3, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, TwinScript_0x9e1b6, -1
