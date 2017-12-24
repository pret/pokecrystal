const_value set 2
	const OLIVINEHOUSEBETA_TEACHER
	const OLIVINEHOUSEBETA_RHYDON

OlivineHouseBeta_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

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

OlivineHouseBeta_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 4, OLIVINE_CITY
	warp_def $7, $3, 4, OLIVINE_CITY

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 1, 0, BGEVENT_READ, OlivineHouseBetaBookshelf1
	bg_event 1, 1, BGEVENT_READ, OlivineHouseBetaBookshelf2

.ObjectEvents:
	db 2
	object_event SPRITE_TEACHER, 3, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineHouseBetaTeacherScript, -1
	object_event SPRITE_RHYDON, 4, 6, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RhydonScript_0x9c592, -1
