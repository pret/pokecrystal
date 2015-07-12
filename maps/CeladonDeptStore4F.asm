CeladonDeptStore4F_MapScriptHeader:
	; trigger count
	db 0

	; callback count
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

	; warps
	db 3
	warp_def $0, $c, 1, GROUP_CELADON_DEPT_STORE_5F, MAP_CELADON_DEPT_STORE_5F
	warp_def $0, $f, 2, GROUP_CELADON_DEPT_STORE_3F, MAP_CELADON_DEPT_STORE_3F
	warp_def $0, $2, 1, GROUP_CELADON_DEPT_STORE_ELEVATOR, MAP_CELADON_DEPT_STORE_ELEVATOR

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 0, 14, $0, CeladonDeptStore4FDirectory
	signpost 0, 3, $0, CeladonDeptStore4FElevatorButton

	; people-events
	db 3
	person_event SPRITE_CLERK, 9, 17, $7, $0, 255, 255, $90, 0, ClerkScript_0x70f0d, EVENT_ALWAYS_THERE
	person_event SPRITE_SUPER_NERD, 10, 11, $5, $1, 255, 255, $a0, 0, SuperNerdScript_0x70f15, EVENT_ALWAYS_THERE
	person_event SPRITE_YOUNGSTER, 6, 12, $7, $0, 255, 255, $0, 0, YoungsterScript_0x70f18, EVENT_ALWAYS_THERE
