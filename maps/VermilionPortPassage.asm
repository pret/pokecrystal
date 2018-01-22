const_value set 2
	const VERMILIONPORTPASSAGE_TEACHER

VermilionPortPassage_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

VermilionPortPassageTeacherScript:
	jumptextfaceplayer VermilionPortPassageTeacherText

VermilionPortPassageTeacherText:
	text "The FAST SHIP"
	line "sails on Wednes-"
	cont "days and Sundays"
	cont "every week."
	done

VermilionPortPassage_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def 15, 0, 8, VERMILION_CITY
	warp_def 16, 0, 9, VERMILION_CITY
	warp_def 15, 4, 4, VERMILION_PORT_PASSAGE
	warp_def 3, 2, 3, VERMILION_PORT_PASSAGE
	warp_def 3, 14, 1, VERMILION_PORT

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 1
	object_event 17, 1, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionPortPassageTeacherScript, -1
