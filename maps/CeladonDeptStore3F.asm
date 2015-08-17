CeladonDeptStore3F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x70d29:
	faceplayer
	loadfont
	pokemart $0, $0019
	loadmovesprites
	end

YoungsterScript_0x70d31:
	jumptextfaceplayer UnknownText_0x70d53

GameboyKidScript_0x70d34:
	faceplayer
	loadfont
	writetext UnknownText_0x70d86
	closetext
	loadmovesprites
	spriteface $4, DOWN
	end

GameboyKidScript_0x70d3f:
	faceplayer
	loadfont
	writetext UnknownText_0x70dc7
	closetext
	loadmovesprites
	spriteface $5, DOWN
	end

SuperNerdScript_0x70d4a:
	jumptextfaceplayer UnknownText_0x70e61

CeladonDeptStore3FElevatorButton:
	jumpstd elevatorbutton

CeladonDeptStore3FDirectory:
	jumptext CeladonDeptStore3FDirectoryText

UnknownText_0x70d53:
	text "I can't decide"
	line "which #MON I"

	para "should use this TM"
	line "on…"
	done

UnknownText_0x70d86:
	text "Uh-oh! I traded my"
	line "#MON without"

	para "removing the UP-"
	line "GRADE from it."
	done

UnknownText_0x70dc7:
	text "Yeah! I'm finally"
	line "getting a PORYGON!"

	para "I'm no good at the"
	line "slots, so I could"

	para "never get enough"
	line "coins…"

	para "…Huh?"

	para "The traded PORYGON"
	line "turned into a dif-"
	cont "ferent #MON!"
	done

UnknownText_0x70e61:
	text "The TM SHOP sells"
	line "some rare moves."
	done

CeladonDeptStore3FDirectoryText:
	text "3F: TM SHOP"

	para "Make Your #MON"
	line "Stronger!"
	done

CeladonDeptStore3F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $0, $c, 1, CELADON_DEPT_STORE_2F
	warp_def $0, $f, 2, CELADON_DEPT_STORE_4F
	warp_def $0, $2, 1, CELADON_DEPT_STORE_ELEVATOR

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 0, 14, SIGNPOST_READ, CeladonDeptStore3FDirectory
	signpost 0, 3, SIGNPOST_READ, CeladonDeptStore3FElevatorButton

.PersonEvents:
	db 5
	person_event SPRITE_CLERK, 5, 11, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, ClerkScript_0x70d29, -1
	person_event SPRITE_YOUNGSTER, 8, 10, $4, 1, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, YoungsterScript_0x70d31, -1
	person_event SPRITE_GAMEBOY_KID, 5, 13, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, GameboyKidScript_0x70d34, -1
	person_event SPRITE_GAMEBOY_KID, 5, 14, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, GameboyKidScript_0x70d3f, -1
	person_event SPRITE_SUPER_NERD, 8, 17, $2, 1, 1, -1, -1, 8 + PAL_OW_RED, 0, 0, SuperNerdScript_0x70d4a, -1
