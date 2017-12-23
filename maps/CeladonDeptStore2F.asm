const_value set 2
	const CELADONDEPTSTORE2F_CLERK1
	const CELADONDEPTSTORE2F_CLERK2
	const CELADONDEPTSTORE2F_POKEFAN_M
	const CELADONDEPTSTORE2F_YOUNGSTER

CeladonDeptStore2F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x70bad:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_CELADON_2F_1
	closetext
	end

ClerkScript_0x70bb5:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_CELADON_2F_2
	closetext
	end

CeladonDeptStore2FPokefanMScript:
	jumptextfaceplayer CeladonDeptStore2FPokefanMText

CeladonDeptStore2FYoungsterScript:
	jumptextfaceplayer CeladonDeptStore2FYoungsterText

CeladonDeptStore2FDirectory:
	jumptext CeladonDeptStore2FDirectoryText

CeladonDeptStore2FElevatorButton:
	jumpstd elevatorbutton

CeladonDeptStore2FPokefanMText:
	text "I just recently"
	line "became a trainer."

	para "My son encouraged"
	line "me to do it."

	para "I'm impressed by"
	line "the selection of"
	cont "convenient items."
	done

CeladonDeptStore2FYoungsterText:
	text "My dad's having a"
	line "hard time learning"

	para "the names of items"
	line "and how they are"

	para "supposed to be"
	line "used…"
	done

CeladonDeptStore2FDirectoryText:
	text "Top Grade Items"
	line "for Trainers!"

	para "2F: TRAINER'S"
	line "    MARKET"
	done

CeladonDeptStore2F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $0, $c, 1, CELADON_DEPT_STORE_3F
	warp_def $0, $f, 3, CELADON_DEPT_STORE_1F
	warp_def $0, $2, 1, CELADON_DEPT_STORE_ELEVATOR

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 0, 14, SIGNPOST_READ, CeladonDeptStore2FDirectory
	signpost 0, 3, SIGNPOST_READ, CeladonDeptStore2FElevatorButton

.PersonEvents:
	db 4
	person_event SPRITE_CLERK, 5, 13, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, ClerkScript_0x70bad, -1
	person_event SPRITE_CLERK, 5, 14, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, ClerkScript_0x70bb5, -1
	person_event SPRITE_POKEFAN_M, 2, 5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, CeladonDeptStore2FPokefanMScript, -1
	person_event SPRITE_YOUNGSTER, 2, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, PERSONTYPE_SCRIPT, 0, CeladonDeptStore2FYoungsterScript, -1
