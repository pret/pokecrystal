	const_def 2 ; object constants
	const OLIVINEHOUSEBETA_TEACHER
	const OLIVINEHOUSEBETA_RHYDON

OlivineHouseBeta_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OlivineHouseBetaTeacherScript:
	jumptextfaceplayer OlivineHouseBetaTeacherText

RhydonScript_0x9c592:
	opentext
	writetext UnknownText_0x9c5f0
	cry RHYDON
	waitbutton
	closetext
	end

OlivineHouseBetaBookshelf1:
	jumpstd picturebookshelf

OlivineHouseBetaBookshelf2:
	jumpstd magazinebookshelf

OlivineHouseBetaTeacherText:
	text "When my #MON"
	line "got sick, the"

	para "PHARMACIST in"
	line "ECRUTEAK made some"
	cont "medicine for me."
	done

UnknownText_0x9c5f0:
	text "RHYDON: Gugooh!"
	done

OlivineHouseBeta_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2, 7, OLIVINE_CITY, 4
	warp_event 3, 7, OLIVINE_CITY, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event 0, 1, BGEVENT_READ, OlivineHouseBetaBookshelf1
	bg_event 1, 1, BGEVENT_READ, OlivineHouseBetaBookshelf2

	db 2 ; object events
	object_event 2, 3, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineHouseBetaTeacherScript, -1
	object_event 6, 4, SPRITE_RHYDON, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RhydonScript_0x9c592, -1
