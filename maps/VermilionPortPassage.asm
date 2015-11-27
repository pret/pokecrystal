const_value set 2
	const VERMILIONPORTPASSAGE_TEACHER

VermilionPortPassage_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TeacherScript_0x7701a:
	jumptextfaceplayer UnknownText_0x7701d

UnknownText_0x7701d:
	text "The FAST SHIP"
	line "sails on Wednes-"
	cont "days and Sundays"
	cont "every week."
	done

VermilionPortPassage_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def $0, $f, 8, VERMILION_CITY
	warp_def $0, $10, 9, VERMILION_CITY
	warp_def $4, $f, 4, VERMILION_PORT_PASSAGE
	warp_def $2, $3, 3, VERMILION_PORT_PASSAGE
	warp_def $e, $3, 1, VERMILION_PORT

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_TEACHER, 1, 17, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TeacherScript_0x7701a, -1
