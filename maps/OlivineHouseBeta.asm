OlivineHouseBeta_MapScriptHeader: ; 0x9c58d
	; trigger count
	db 0

	; callback count
	db 0
; 0x9c58f

TeacherScript_0x9c58f: ; 0x9c58f
	jumptextfaceplayer UnknownText_0x9c5a2
; 0x9c592

RhydonScript_0x9c592: ; 0x9c592
	loadfont
	2writetext UnknownText_0x9c5f0
	cry RHYDON
	closetext
	loadmovesprites
	end
; 0x9c59c

MapOlivineHouseBetaSignpost0Script: ; 0x9c59c
	jumpstd $0002
; 0x9c59f

MapOlivineHouseBetaSignpost1Script: ; 0x9c59f
	jumpstd $0003
; 0x9c5a2

UnknownText_0x9c5a2: ; 0x9c5a2
	text "When my #MON"
	line "got sick, the"

	para "PHARMACIST in"
	line "ECRUTEAK made some"
	cont "medicine for me."
	done
; 0x9c5f0

UnknownText_0x9c5f0: ; 0x9c5f0
	text "RHYDON: Gugooh!"
	done
; 0x9c601

OlivineHouseBeta_MapEventHeader: ; 0x9c601
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
	signpost 1, 0, $0, MapOlivineHouseBetaSignpost0Script
	signpost 1, 1, $0, MapOlivineHouseBetaSignpost1Script

	; people-events
	db 2
	person_event SPRITE_TEACHER, 7, 6, $3, $0, 255, 255, $0, 0, TeacherScript_0x9c58f, $ffff
	person_event SPRITE_RHYDON, 8, 10, $4, $20, 255, 255, $0, 0, RhydonScript_0x9c592, $ffff
; 0x9c635

