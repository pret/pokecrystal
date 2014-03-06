VermilionPortPassage_MapScriptHeader: ; 0x77018
	; trigger count
	db 0

	; callback count
	db 0
; 0x7701a

TeacherScript_0x7701a: ; 0x7701a
	jumptextfaceplayer UnknownText_0x7701d
; 0x7701d

UnknownText_0x7701d: ; 0x7701d
	text "The FAST SHIP"
	line "sails on Wednes-"
	cont "days and Sundays"
	cont "every week."
	done
; 0x7705a

VermilionPortPassage_MapEventHeader: ; 0x7705a
	; filler
	db 0, 0

	; warps
	db 5
	warp_def $0, $f, 8, GROUP_VERMILION_CITY, MAP_VERMILION_CITY
	warp_def $0, $10, 9, GROUP_VERMILION_CITY, MAP_VERMILION_CITY
	warp_def $4, $f, 4, GROUP_VERMILION_PORT_PASSAGE, MAP_VERMILION_PORT_PASSAGE
	warp_def $2, $3, 3, GROUP_VERMILION_PORT_PASSAGE, MAP_VERMILION_PORT_PASSAGE
	warp_def $e, $3, 1, GROUP_VERMILION_PORT, MAP_VERMILION_PORT

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_TEACHER, 5, 21, $8, $0, 255, 255, $0, 0, TeacherScript_0x7701a, $ffff
; 0x77086

