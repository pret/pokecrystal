const_value set 2 ; object constants
	const VERMILIONPORTPASSAGE_TEACHER

VermilionPortPassage_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VermilionPortPassageTeacherScript:
	jumptextfaceplayer VermilionPortPassageTeacherText

VermilionPortPassageTeacherText:
	text "The FAST SHIP"
	line "sails on Wednes-"
	cont "days and Sundays"
	cont "every week."
	done

VermilionPortPassage_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 15, 0, 8, VERMILION_CITY
	warp_event 16, 0, 9, VERMILION_CITY
	warp_event 15, 4, 4, VERMILION_PORT_PASSAGE
	warp_event 3, 2, 3, VERMILION_PORT_PASSAGE
	warp_event 3, 14, 1, VERMILION_PORT

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 17, 1, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionPortPassageTeacherScript, -1
