CeladonDeptStore4F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x70f0d:
	faceplayer
	loadfont
	pokemart $0, $001a
	loadmovesprites
	end

SuperNerdScript_0x70f15:
	jumptextfaceplayer UnknownText_0x70f21

YoungsterScript_0x70f18:
	jumptextfaceplayer UnknownText_0x70f55

CeladonDeptStore4FDirectory:
	jumptext CeladonDeptStore4FDirectoryText

CeladonDeptStore4FElevatorButton:
	jumpstd elevatorbutton

UnknownText_0x70f21:
	text "I'm here to buy"
	line "SURF MAIL to send"
	cont "to my girlfriend."
	done

UnknownText_0x70f55:
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
	warp_def $0, $c, 1, GROUP_CELADON_DEPT_STORE_5F, MAP_CELADON_DEPT_STORE_5F
	warp_def $0, $f, 2, GROUP_CELADON_DEPT_STORE_3F, MAP_CELADON_DEPT_STORE_3F
	warp_def $0, $2, 1, GROUP_CELADON_DEPT_STORE_ELEVATOR, MAP_CELADON_DEPT_STORE_ELEVATOR

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 0, 14, SIGNPOST_READ, CeladonDeptStore4FDirectory
	signpost 0, 3, SIGNPOST_READ, CeladonDeptStore4FElevatorButton

.PersonEvents:
	db 3
	person_event SPRITE_CLERK, 9, 17, OW_UP | $3, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, ClerkScript_0x70f0d, -1
	person_event SPRITE_SUPER_NERD, 10, 11, OW_UP | $1, $1, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, SuperNerdScript_0x70f15, -1
	person_event SPRITE_YOUNGSTER, 6, 12, OW_UP | $3, $0, -1, -1, $0, 0, YoungsterScript_0x70f18, -1
