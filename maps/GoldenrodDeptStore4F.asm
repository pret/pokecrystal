GoldenrodDeptStore4F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x55ee9:
	faceplayer
	loadfont
	pokemart $0, $0008
	loadmovesprites
	end

CooltrainerMScript_0x55ef1:
	jumptextfaceplayer UnknownText_0x55f08

BugCatcherScript_0x55ef4:
	jumptextfaceplayer UnknownText_0x55f52

GameboyKidScript_0x55ef7:
	faceplayer
	loadfont
	writetext UnknownText_0x55f74
	closetext
	loadmovesprites
	spriteface $5, DOWN
	end

GoldenrodDeptStore4FDirectory:
	jumptext GoldenrodDeptStore4FDirectoryText

GoldenrodDeptStore4FElevatorButton:
	jumpstd elevatorbutton

UnknownText_0x55f08:
	text "Hey. I love strong"
	line "#MON."

	para "I feed them PRO-"
	line "TEIN to crank up"
	cont "their ATTACK."
	done

UnknownText_0x55f52:
	text "IRON adds to your"
	line "#MON's DEFENSE."
	done

UnknownText_0x55f74:
	text "Some #MON"
	line "evolve only by"

	para "being traded via a"
	line "Game Link cable."

	para "I know of four:"
	line "MACHOKE, KADABRA,"

	para "HAUNTER and, um,"
	line "GRAVELER."

	para "I heard there are"
	line "others too."
	done

GoldenrodDeptStore4FDirectoryText:
	text "Let Us Pump Up"
	line "Your #MON!"

	para "4F MEDICINE BOX"
	done

GoldenrodDeptStore4F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $0, $c, 1, GROUP_GOLDENROD_DEPT_STORE_5F, MAP_GOLDENROD_DEPT_STORE_5F
	warp_def $0, $f, 2, GROUP_GOLDENROD_DEPT_STORE_3F, MAP_GOLDENROD_DEPT_STORE_3F
	warp_def $0, $2, 1, GROUP_GOLDENROD_DEPT_STORE_ELEVATOR, MAP_GOLDENROD_DEPT_STORE_ELEVATOR

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 0, 14, SIGNPOST_READ, GoldenrodDeptStore4FDirectory
	signpost 0, 3, SIGNPOST_READ, GoldenrodDeptStore4FElevatorButton

.PersonEvents:
	db 4
	person_event SPRITE_CLERK, 9, 17, OW_UP | $3, $0, -1, -1, $0, 0, ClerkScript_0x55ee9, -1
	person_event SPRITE_COOLTRAINER_M, 11, 15, OW_LEFT | $1, $0, -1, -1, $0, 0, CooltrainerMScript_0x55ef1, -1
	person_event SPRITE_BUG_CATCHER, 6, 11, OW_UP | $1, $1, -1, -1, $0, 0, BugCatcherScript_0x55ef4, -1
	person_event SPRITE_GAMEBOY_KID, 5, 9, OW_UP | $2, $0, -1, -1, $0, 0, GameboyKidScript_0x55ef7, -1
