const_value set 2
	const CELADONDEPTSTORE1F_RECEPTIONIST
	const CELADONDEPTSTORE1F_GENTLEMAN
	const CELADONDEPTSTORE1F_TEACHER

CeladonDeptStore1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ReceptionistScript_0x709e0:
	jumptextfaceplayer UnknownText_0x709ef

GentlemanScript_0x709e3:
	jumptextfaceplayer UnknownText_0x70a35

TeacherScript_0x709e6:
	jumptextfaceplayer UnknownText_0x70aa9

CeladonDeptStore1FDirectory:
	jumptext CeladonDeptStore1FDirectoryText

CeladonDeptStore1FElevatorButton:
	jumpstd elevatorbutton

UnknownText_0x709ef:
	text "Hello! Welcome to"
	line "CELADON DEPT."
	cont "STORE!"

	para "The directory is"
	line "on the wall."
	done

UnknownText_0x70a35:
	text "This DEPT.STORE is"
	line "part of the same"

	para "chain as the one"
	line "in GOLDENROD CITY."

	para "They were both"
	line "renovated at the"
	cont "same time."
	done

UnknownText_0x70aa9:
	text "This is my first"
	line "time here."

	para "It's so big…"

	para "I'm afraid I'll"
	line "get lost."
	done

CeladonDeptStore1FDirectoryText:
	text "1F: SERVICE"
	line "    COUNTER"

	para "2F: TRAINER'S"
	line "    MARKET"

	para "3F: TM SHOP"

	para "4F: WISEMAN GIFTS"

	para "5F: DRUG STORE"

	para "6F: ROOFTOP"
	line "    SQUARE"
	done

CeladonDeptStore1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $7, $7, 1, CELADON_CITY
	warp_def $7, $8, 1, CELADON_CITY
	warp_def $0, $f, 2, CELADON_DEPT_STORE_2F
	warp_def $0, $2, 1, CELADON_DEPT_STORE_ELEVATOR

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 0, 14, SIGNPOST_READ, CeladonDeptStore1FDirectory
	signpost 0, 3, SIGNPOST_READ, CeladonDeptStore1FElevatorButton

.PersonEvents:
	db 3
	person_event SPRITE_RECEPTIONIST, 1, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ReceptionistScript_0x709e0, -1
	person_event SPRITE_GENTLEMAN, 4, 11, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GentlemanScript_0x709e3, -1
	person_event SPRITE_TEACHER, 3, 5, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TeacherScript_0x709e6, -1
