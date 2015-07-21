GoldenrodDeptStore3F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x55db8:
	faceplayer
	loadfont
	pokemart $0, $0007
	loadmovesprites
	end

SuperNerdScript_0x55dc0:
	jumptextfaceplayer UnknownText_0x55dcc

RockerScript_0x55dc3:
	jumptextfaceplayer UnknownText_0x55e15

GoldenrodDeptStore3FDirectory:
	jumptext GoldenrodDeptStore3FDirectoryText

GoldenrodDeptStore3FElevatorButton:
	jumpstd elevatorbutton

UnknownText_0x55dcc:
	text "I, I, I'm really"
	line "impatient!"

	para "I use X SPEED in"
	line "battle to speed up"
	cont "my #MON."
	done

UnknownText_0x55e15:
	text "Hey! When you bat-"
	line "tle, do you use X"
	cont "SPECIAL?"

	para "It's awesome. It"
	line "really jacks up"
	cont "SPECIAL ATTACK!"
	done

GoldenrodDeptStore3FDirectoryText:
	text "For Victory"
	line "Seekers"

	para "3F BATTLE"
	line "   COLLECTION"
	done

GoldenrodDeptStore3F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $0, $c, 1, GROUP_GOLDENROD_DEPT_STORE_2F, MAP_GOLDENROD_DEPT_STORE_2F
	warp_def $0, $f, 2, GROUP_GOLDENROD_DEPT_STORE_4F, MAP_GOLDENROD_DEPT_STORE_4F
	warp_def $0, $2, 1, GROUP_GOLDENROD_DEPT_STORE_ELEVATOR, MAP_GOLDENROD_DEPT_STORE_ELEVATOR

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 0, 14, SIGNPOST_READ, GoldenrodDeptStore3FDirectory
	signpost 0, 3, SIGNPOST_READ, GoldenrodDeptStore3FElevatorButton

.PersonEvents:
	db 3
	person_event SPRITE_CLERK, 5, 10, OW_UP | $2, $0, -1, -1, $0, 0, ClerkScript_0x55db8, -1
	person_event SPRITE_SUPER_NERD, 9, 16, OW_LEFT | $2, $10, -1, -1, (PAL_OW_RED << 4) | $80, 0, SuperNerdScript_0x55dc0, -1
	person_event SPRITE_ROCKER, 9, 6, OW_UP | $0, $10, -1, -1, $0, 0, RockerScript_0x55dc3, -1
