GoldenrodDeptStore5F_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x56090

UnknownScript_0x56090:
	checkcode VAR_WEEKDAY
	if_equal SUNDAY, UnknownScript_0x56099
	disappear $7
	return

UnknownScript_0x56099:
	appear $7
	return

ClerkScript_0x5609c:
	faceplayer
	loadfont
	checkevent EVENT_GOT_TM02_HEADBUTT
	iftrue UnknownScript_0x560ad
	checkevent EVENT_GOT_TM08_ROCK_SMASH
	iftrue UnknownScript_0x560c2
	jump UnknownScript_0x560b6

UnknownScript_0x560ad:
	checkevent EVENT_GOT_TM08_ROCK_SMASH
	iftrue UnknownScript_0x560c8
	jump UnknownScript_0x560bc

UnknownScript_0x560b6:
	pokemart $0, $0009
	loadmovesprites
	end

UnknownScript_0x560bc:
	pokemart $0, $000a
	loadmovesprites
	end

UnknownScript_0x560c2:
	pokemart $0, $000b
	loadmovesprites
	end

UnknownScript_0x560c8:
	pokemart $0, $000c
	loadmovesprites
	end

ReceptionistScript_0x560ce:
	faceplayer
	loadfont
	checkcode VAR_WEEKDAY
	if_not_equal SUNDAY, UnknownScript_0x56112
	checkflag ENGINE_GOLDENROD_MALL_5F_HAPPINESS_EVENT
	iftrue UnknownScript_0x56112
	special Function718d
	writetext UnknownText_0x56143
	keeptextopen
	if_greater_than $95, UnknownScript_0x560ee
	if_greater_than $31, UnknownScript_0x560fd
	jump UnknownScript_0x56103

UnknownScript_0x560ee:
	writetext UnknownText_0x5615a
	keeptextopen
	verbosegiveitem TM_RETURN, 1
	iffalse UnknownScript_0x56116
	setflag ENGINE_GOLDENROD_MALL_5F_HAPPINESS_EVENT
	loadmovesprites
	end

UnknownScript_0x560fd:
	writetext UnknownText_0x561a6
	closetext
	loadmovesprites
	end

UnknownScript_0x56103:
	writetext UnknownText_0x561d8
	keeptextopen
	verbosegiveitem TM_FRUSTRATION, 1
	iffalse UnknownScript_0x56116
	setflag ENGINE_GOLDENROD_MALL_5F_HAPPINESS_EVENT
	loadmovesprites
	end

UnknownScript_0x56112:
	writetext UnknownText_0x56202
	closetext
UnknownScript_0x56116:
	loadmovesprites
	end

TwinScript_0x56118:
	faceplayer
	loadfont
	special SpecialGameboyCheck
	if_not_equal $2, UnknownScript_0x5612a
	writetext UnknownText_0x56241
	closetext
	loadmovesprites
	special Function1050b9
	end

UnknownScript_0x5612a:
	writetext UnknownText_0x56279
	closetext
	loadmovesprites
	end

LassScript_0x56130:
	jumptextfaceplayer UnknownText_0x562ad

CooltrainerMScript_0x56133:
	faceplayer
	loadfont
	trade $0
	closetext
	loadmovesprites
	end

PokefanMScript_0x5613a:
	jumptextfaceplayer UnknownText_0x562f3

GoldenrodDeptStore5FDirectory:
	jumptext GoldenrodDeptStore5FDirectoryText

GoldenrodDeptStore5FElevatorButton:
	jumpstd elevatorbutton

UnknownText_0x56143:
	text "Hello. Oh, your"
	line "#MON…"
	done

UnknownText_0x5615a:
	text "It's very attached"
	line "to you."

	para "This move should"
	line "be perfect for a"
	cont "pair like you."
	done

UnknownText_0x561a6:
	text "It's adorable!"

	para "You should teach"
	line "it good TM moves."
	done

UnknownText_0x561d8:
	text "It looks evil. How"
	line "about this TM for"
	cont "it?"
	done

UnknownText_0x56202:
	text "There are sure to"
	line "be TMs that are"

	para "just perfect for"
	line "your #MON."
	done

UnknownText_0x56241:
	text "MYSTERY GIFT."

	para "With just a"
	line "little beep, you"
	cont "get a gift."
	done

UnknownText_0x56279:
	text "The MYSTERY GIFT"
	line "option requires a"
	cont "Game Boy Color."
	done

UnknownText_0x562ad:
	text "On Sundays, a lady"
	line "comes to check out"
	cont "#MON."

	para "She even gives"
	line "away TMs!"
	done

UnknownText_0x562f3:
	text "You can't rename a"
	line "#MON you get in"
	cont "a trade."

	para "The name is a re-"
	line "flection of the"

	para "original trainer's"
	line "feelings for it."
	done

GoldenrodDeptStore5FDirectoryText:
	text "Customize Your"
	line "#MON"

	para "5F TM CORNER"
	done

GoldenrodDeptStore5F_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $0, $c, 1, GROUP_GOLDENROD_DEPT_STORE_4F, MAP_GOLDENROD_DEPT_STORE_4F
	warp_def $0, $f, 1, GROUP_GOLDENROD_DEPT_STORE_6F, MAP_GOLDENROD_DEPT_STORE_6F
	warp_def $0, $2, 1, GROUP_GOLDENROD_DEPT_STORE_ELEVATOR, MAP_GOLDENROD_DEPT_STORE_ELEVATOR

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 0, 14, $0, GoldenrodDeptStore5FDirectory
	signpost 0, 3, $0, GoldenrodDeptStore5FElevatorButton

	; people-events
	db 6
	person_event SPRITE_CLERK, 9, 12, $7, $0, 255, 255, $0, 0, ClerkScript_0x5609c, -1
	person_event SPRITE_LASS, 10, 7, $2, $11, 255, 255, $0, 0, LassScript_0x56130, -1
	person_event SPRITE_COOLTRAINER_M, 7, 10, $3, $0, 255, 255, $0, 0, CooltrainerMScript_0x56133, -1
	person_event SPRITE_POKEFAN_M, 9, 17, $2, $22, 255, 255, $0, 0, PokefanMScript_0x5613a, -1
	person_event SPRITE_TWIN, 5, 13, $6, $0, 255, 255, $a0, 0, TwinScript_0x56118, -1
	person_event SPRITE_RECEPTIONIST, 9, 11, $7, $0, 255, 255, $80, 0, ReceptionistScript_0x560ce, EVENT_763
