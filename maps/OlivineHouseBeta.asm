OlivineHouseBeta_MapScriptHeader:
	; trigger count
	db 0

	; callback count
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

	; warps
	db 2
	warp_def $7, $2, 4, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY
	warp_def $7, $3, 4, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, OlivineHouseBetaBookshelf1
	signpost 1, 1, $0, OlivineHouseBetaBookshelf2

	; people-events
	db 2
	person_event SPRITE_TEACHER, 7, 6, $3, $0, 255, 255, $0, 0, TeacherScript_0x9c58f, EVENT_ALWAYS_THERE
	person_event SPRITE_RHYDON, 8, 10, $4, $20, 255, 255, $0, 0, RhydonScript_0x9c592, EVENT_ALWAYS_THERE
