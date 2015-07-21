OlivineHouseBeta_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TeacherScript_0x9c58f:
	jumptextfaceplayer UnknownText_0x9c5a2

RhydonScript_0x9c592:
	loadfont
	writetext UnknownText_0x9c5f0
	cry RHYDON
	closetext
	loadmovesprites
	end

OlivineHouseBetaBookshelf1:
	jumpstd picturebookshelf

OlivineHouseBetaBookshelf2:
	jumpstd magazinebookshelf

UnknownText_0x9c5a2:
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
	warp_def $7, $2, 4, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY
	warp_def $7, $3, 4, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, OlivineHouseBetaBookshelf1
	signpost 1, 1, SIGNPOST_READ, OlivineHouseBetaBookshelf2

.PersonEvents:
	db 2
	person_event SPRITE_TEACHER, 7, 6, OW_DOWN | $3, $0, -1, -1, $0, 0, TeacherScript_0x9c58f, -1
	person_event SPRITE_RHYDON, 8, 10, OW_UP | $0, $20, -1, -1, $0, 0, RhydonScript_0x9c592, -1
