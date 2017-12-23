const_value set 2
	const CELADONDEPTSTORE4F_CLERK
	const CELADONDEPTSTORE4F_SUPER_NERD
	const CELADONDEPTSTORE4F_YOUNGSTER

CeladonDeptStore4F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x70f0d:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_CELADON_4F
	closetext
	end

CeladonDeptStore4FSuperNerdScript:
	jumptextfaceplayer CeladonDeptStore4FSuperNerdText

CeladonDeptStore4FYoungsterScript:
	jumptextfaceplayer CeladonDeptStore4FYoungsterText

CeladonDeptStore4FDirectory:
	jumptext CeladonDeptStore4FDirectoryText

CeladonDeptStore4FElevatorButton:
	jumpstd elevatorbutton

CeladonDeptStore4FSuperNerdText:
	text "I'm here to buy"
	line "SURF MAIL to send"
	cont "to my girlfriend."
	done

CeladonDeptStore4FYoungsterText:
	text "This is the only"
	line "place where you"

	para "can buy LOVELY"
	line "MAIL."
	done

CeladonDeptStore4FDirectoryText:
	text "Express Yourself"
	line "With Gifts!"

	para "4F: WISEMAN GIFTS"
	done

CeladonDeptStore4F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $0, $c, 1, CELADON_DEPT_STORE_5F
	warp_def $0, $f, 2, CELADON_DEPT_STORE_3F
	warp_def $0, $2, 1, CELADON_DEPT_STORE_ELEVATOR

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 0, 14, SIGNPOST_READ, CeladonDeptStore4FDirectory
	signpost 0, 3, SIGNPOST_READ, CeladonDeptStore4FElevatorButton

.PersonEvents:
	db 3
	person_event SPRITE_CLERK, 5, 13, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, ClerkScript_0x70f0d, -1
	person_event SPRITE_SUPER_NERD, 6, 7, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_NPC_GREEN, PERSONTYPE_SCRIPT, 0, CeladonDeptStore4FSuperNerdScript, -1
	person_event SPRITE_YOUNGSTER, 2, 8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CeladonDeptStore4FYoungsterScript, -1
