const_value set 2
	const CELADONDEPTSTORE5F_CLERK1
	const CELADONDEPTSTORE5F_CLERK2
	const CELADONDEPTSTORE5F_GENTLEMAN
	const CELADONDEPTSTORE5F_SAILOR
	const CELADONDEPTSTORE5F_TEACHER

CeladonDeptStore5F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x71004:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_CELADON_5F_1
	closetext
	end

ClerkScript_0x7100c:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_CELADON_5F_2
	closetext
	end

CeladonDeptStore5FGentlemanScript:
	jumptextfaceplayer CeladonDeptStore5FGentlemanText

CeladonDeptStore5FSailorScript:
	jumptextfaceplayer CeladonDeptStore5FSailorText

CeladonDeptStore5FTeacherScript:
	jumptextfaceplayer CeladonDeptStore5FTeacherText

CeladonDeptStore5FDirectory:
	jumptext CeladonDeptStore5FDirectoryText

CeladonDeptStore5FElevatorButton:
	jumpstd elevatorbutton

CeladonDeptStore5FGentlemanText:
	text "I want to buy some"
	line "items that raise"

	para "#MON stats, but"
	line "I don't have"
	cont "enough money…"
	done

CeladonDeptStore5FSailorText:
	text "I want PP UP, so I"
	line "can raise the PP"

	para "of moves. But you"
	line "can't buy it…"
	done

CeladonDeptStore5FTeacherText:
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
	person_event SPRITE_CLERK, 5, 7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, ClerkScript_0x71004, -1
	person_event SPRITE_CLERK, 5, 8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, ClerkScript_0x7100c, -1
	person_event SPRITE_GENTLEMAN, 5, 13, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, CeladonDeptStore5FGentlemanScript, -1
	person_event SPRITE_SAILOR, 4, 3, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, CeladonDeptStore5FSailorScript, -1
	person_event SPRITE_TEACHER, 7, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, PERSONTYPE_SCRIPT, 0, CeladonDeptStore5FTeacherScript, -1
