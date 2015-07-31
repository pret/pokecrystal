CeladonDeptStore5F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x71004:
	faceplayer
	loadfont
	pokemart $0, $001b
	loadmovesprites
	end

ClerkScript_0x7100c:
	faceplayer
	loadfont
	pokemart $0, $001c
	loadmovesprites
	end

GentlemanScript_0x71014:
	jumptextfaceplayer UnknownText_0x71023

SailorScript_0x71017:
	jumptextfaceplayer UnknownText_0x71072

TeacherScript_0x7101a:
	jumptextfaceplayer UnknownText_0x710b6

CeladonDeptStore5FDirectory:
	jumptext CeladonDeptStore5FDirectoryText

CeladonDeptStore5FElevatorButton:
	jumpstd elevatorbutton

UnknownText_0x71023:
	text "I want to buy some"
	line "items that raise"

	para "#MON stats, but"
	line "I don't have"
	cont "enough money…"
	done

UnknownText_0x71072:
	text "I want PP UP, so I"
	line "can raise the PP"

	para "of moves. But you"
	line "can't buy it…"
	done

UnknownText_0x710b6:
	text "Using items on"
	line "them makes #-"
	cont "MON happy."

	para "They hate certain"
	line "items, though…"
	done

CeladonDeptStore5FDirectoryText:
	text "5F: DRUG STORE"
	done

CeladonDeptStore5F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $0, $c, 1, CELADON_DEPT_STORE_4F
	warp_def $0, $f, 1, CELADON_DEPT_STORE_6F
	warp_def $0, $2, 1, CELADON_DEPT_STORE_ELEVATOR

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 0, 14, SIGNPOST_READ, CeladonDeptStore5FDirectory
	signpost 0, 3, SIGNPOST_READ, CeladonDeptStore5FElevatorButton

.PersonEvents:
	db 5
	person_event SPRITE_CLERK, 9, 11, $7, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, ClerkScript_0x71004, -1
	person_event SPRITE_CLERK, 9, 12, $7, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, ClerkScript_0x7100c, -1
	person_event SPRITE_GENTLEMAN, 9, 17, $2, 1, 1, -1, -1, 8 + PAL_OW_RED, 0, 0, GentlemanScript_0x71014, -1
	person_event SPRITE_SAILOR, 8, 7, $2, 1, 1, -1, -1, 8 + PAL_OW_BLUE, 0, 0, SailorScript_0x71017, -1
	person_event SPRITE_TEACHER, 11, 5, $9, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, TeacherScript_0x7101a, -1
