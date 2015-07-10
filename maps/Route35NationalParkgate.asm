Route35NationalParkgate_MapScriptHeader:
	; trigger count
	db 3

	; triggers
	dw UnknownScript_0x6a19d, $0000
	dw UnknownScript_0x6a19e, $0000
	dw UnknownScript_0x6a19f, $0000

	; callback count
	db 2

	; callbacks

	dbw 5, UnknownScript_0x6a1a3

	dbw 2, UnknownScript_0x6a1af

UnknownScript_0x6a19d:
	end

UnknownScript_0x6a19e:
	end

UnknownScript_0x6a19f:
	priorityjump UnknownScript_0x6a1d1
	end

UnknownScript_0x6a1a3:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue UnknownScript_0x6a1ac
	dotrigger $0
	return

UnknownScript_0x6a1ac:
	dotrigger $2
	return

UnknownScript_0x6a1af:
	checkcode VAR_WEEKDAY
	if_equal TUESDAY, UnknownScript_0x6a1ca
	if_equal THURSDAY, UnknownScript_0x6a1ca
	if_equal SATURDAY, UnknownScript_0x6a1ca
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue UnknownScript_0x6a1ac
	disappear $2
	appear $3
	appear $4
	return

UnknownScript_0x6a1ca:
	appear $2
	disappear $3
	disappear $4
	return

UnknownScript_0x6a1d1:
	applymovement $0, MovementData_0x6a2e2
	spriteface $2, RIGHT
	loadfont
	checkcode VAR_CONTESTMINUTES
	addvar $1
	RAM2MEM $0
	writetext UnknownText_0x6a79a
	yesorno
	iffalse UnknownScript_0x6a1ee
	writetext UnknownText_0x6a7db
	closetext
	loadmovesprites
	jumpstd bugcontestresultswarp

UnknownScript_0x6a1ee:
	writetext UnknownText_0x6a823
	closetext
	loadmovesprites
	scall UnknownScript_0x6a261
	playsound SFX_ENTER_DOOR
	special Function8c084
	waitbutton
	warpfacing $1, GROUP_NATIONAL_PARK_BUG_CONTEST, MAP_NATIONAL_PARK_BUG_CONTEST, $a, $2f
	end

OfficerScript_0x6a204:
	checkcode VAR_WEEKDAY
	if_equal SUNDAY, UnknownScript_0x6a2c7
	if_equal MONDAY, UnknownScript_0x6a2c7
	if_equal WEDNESDAY, UnknownScript_0x6a2c7
	if_equal FRIDAY, UnknownScript_0x6a2c7
	faceplayer
	loadfont
	checkflag ENGINE_51
	iftrue UnknownScript_0x6a2c1
	scall UnknownScript_0x6a2de
	writetext UnknownText_0x6a2eb
	yesorno
	iffalse UnknownScript_0x6a2a3
	checkcode VAR_PARTYCOUNT
	if_greater_than $1, UnknownScript_0x6a271
	special Function13a12
	clearevent $0308
UnknownScript_0x6a234:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext UnknownText_0x6a39d
	keeptextopen
	writetext UnknownText_0x6a3c7
	playsound SFX_ITEM
	waitbutton
	writetext UnknownText_0x6a3e2
	closetext
	loadmovesprites
	special Function135db
	scall UnknownScript_0x6a261
	playsound SFX_ENTER_DOOR
	special Function8c084
	waitbutton
	special Function139a8
	warpfacing $1, GROUP_NATIONAL_PARK_BUG_CONTEST, MAP_NATIONAL_PARK_BUG_CONTEST, $a, $2f
	end

UnknownScript_0x6a261:
	checkcode VAR_FACING
	if_equal $2, UnknownScript_0x6a26c
	applymovement $0, MovementData_0x6a2e5
	end

UnknownScript_0x6a26c:
	applymovement $0, MovementData_0x6a2e9
	end

UnknownScript_0x6a271:
	checkcode VAR_PARTYCOUNT
	if_less_than $6, UnknownScript_0x6a27d
	checkcode VAR_BOXSPACE
	if_equal $0, UnknownScript_0x6a2b5

UnknownScript_0x6a27d: ; 6a27d
	special Function71ac
	if_equal $1, UnknownScript_0x6a2bb
	writetext UnknownText_0x6a4c6
	yesorno
	iffalse UnknownScript_0x6a2a9
	special Function13a12
	iftrue UnknownScript_0x6a2af
	setevent $0308
	writetext UnknownText_0x6a537
	keeptextopen
	writetext UnknownText_0x6a56b
	playsound SFX_GOT_SAFARI_BALLS
	waitbutton
	keeptextopen
	jump UnknownScript_0x6a234

UnknownScript_0x6a2a3:
	writetext UnknownText_0x6a5dc
	closetext
	loadmovesprites
	end

UnknownScript_0x6a2a9:
	writetext UnknownText_0x6a597
	closetext
	loadmovesprites
	end

UnknownScript_0x6a2af:
	writetext UnknownText_0x6a608
	closetext
	loadmovesprites
	end

UnknownScript_0x6a2b5:
	writetext UnknownText_0x6a67c
	closetext
	loadmovesprites
	end

UnknownScript_0x6a2bb:
	writetext UnknownText_0x6a71f
	closetext
	loadmovesprites
	end

UnknownScript_0x6a2c1:
	writetext UnknownText_0x6a84f
	closetext
	loadmovesprites
	end

UnknownScript_0x6a2c7:
	jumptextfaceplayer UnknownText_0x6a894

OfficerScript_0x6a2ca:
	faceplayer
	loadfont
	checkflag ENGINE_51
	iftrue UnknownScript_0x6a2c1
	writetext UnknownText_0x6a894
	closetext
	loadmovesprites
	end

YoungsterScript_0x6a2d8:
	jumptextfaceplayer UnknownText_0x6a8d8

MapRoute36NationalParkgateSignpost0Script:
	jumptext UnknownText_0x6a90e

UnknownScript_0x6a2de:
	jumpstd daytotext
	end

MovementData_0x6a2e2:
	step_down
	turn_head_left
	step_end

MovementData_0x6a2e5:
	step_right
	step_up
	step_up
	step_end

MovementData_0x6a2e9:
	step_up
	step_end

UnknownText_0x6a2eb:
	text "Today's @"
	text_from_ram StringBuffer3
	text "."
	line "That means the"

	para "Bug-Catching Con-"
	line "test is on today."

	para "The rules are sim-"
	line "ple."

	para "Using one of your"
	line "#MON, catch a"

	para "bug #MON to be"
	line "judged."

	para "Would you like to"
	line "give it a try?"
	done

UnknownText_0x6a39d:
	text "Here are the PARK"
	line "BALLS for the"
	cont "Contest."
	done

UnknownText_0x6a3c7:
	text "<PLAYER> received"
	line "20 PARK BALLS."
	done

UnknownText_0x6a3e2:
	text "The person who"
	line "gets the strong-"
	cont "est bug #MON"
	cont "is the winner."

	para "You have 20"
	line "minutes."

	para "If you run out of"
	line "PARK BALLS, you're"
	cont "done."

	para "You can keep the"
	line "last #MON you"
	cont "catch as your own."

	para "Go out and catch"
	line "the strongest bug"

	para "#MON you can"
	line "find!"
	done

UnknownText_0x6a4c6:
	text "Uh-oh…"

	para "You have more than"
	line "one #MON."

	para "You'll have to use"
	line "@"
	text_from_ram StringBuffer3
	text ", the"

	para "first #MON in"
	line "your party."

	para "Is that OK with"
	line "you?"
	done

UnknownText_0x6a537:
	text "Fine, we'll hold"
	line "your other #MON"
	cont "while you compete."
	done

UnknownText_0x6a56b:
	text "<PLAYER>'s #MON"
	line "were left with the"
	cont "CONTEST HELPER."
	done

UnknownText_0x6a597:
	text "Please choose the"
	line "#MON to be used"

	para "in the Contest,"
	line "then come see me."
	done

UnknownText_0x6a5dc:
	text "OK. We hope you'll"
	line "take part in the"
	cont "future."
	done

UnknownText_0x6a608:
	text "Uh-oh…"
	line "The first #MON"

	para "in your party"
	line "can't battle."

	para "Please switch it"
	line "with the #MON"

	para "you want to use,"
	line "then come see me."
	done

UnknownText_0x6a67c:
	text "Uh-oh…"
	line "Both your party"

	para "and your PC BOX"
	line "are full."

	para "You have no room"
	line "to put the bug"
	cont "#MON you catch."

	para "Please make room"
	line "in your party or"

	para "your PC BOX, then"
	line "come see me."
	done

UnknownText_0x6a71f:
	text "Uh-oh…"
	line "You have an EGG as"

	para "the first #MON"
	line "in your party."

	para "Please switch it"
	line "with the #MON"

	para "you want to use,"
	line "then come see me."
	done

UnknownText_0x6a79a:
	text "You still have @"
	text_from_ram StringBuffer3
	text ""
	line "minute(s) left."

	para "Do you want to"
	line "finish now?"
	done

UnknownText_0x6a7db:
	text "OK. Please wait at"
	line "the North Gate for"

	para "the announcement"
	line "of the winners."
	done

UnknownText_0x6a823:
	text "OK. Please get"
	line "back outside and"
	cont "finish up."
	done

UnknownText_0x6a84f:
	text "Today's Contest is"
	line "over. We hope you"

	para "will participate"
	line "in the future."
	done

UnknownText_0x6a894:
	text "We hold Contests"
	line "regularly in the"

	para "PARK. You should"
	line "give it a shot."
	done

UnknownText_0x6a8d8:
	text "When is the next"
	line "Bug-Catching Con-"
	cont "test going to be?"
	done

UnknownText_0x6a90e:
	text "The Bug-Catching"
	line "Contest is held on"

	para "Tuesday, Thursday"
	line "and Saturday."

	para "Not only do you"
	line "earn a prize just"

	para "for participating,"
	line "you also get to"

	para "keep the bug"
	line "#MON you may"

	para "have at the end of"
	line "the contest."
	done

Route35NationalParkgate_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $0, $3, 3, GROUP_NATIONAL_PARK, MAP_NATIONAL_PARK
	warp_def $0, $4, 4, GROUP_NATIONAL_PARK, MAP_NATIONAL_PARK
	warp_def $7, $3, 3, GROUP_ROUTE_35, MAP_ROUTE_35
	warp_def $7, $4, 3, GROUP_ROUTE_35, MAP_ROUTE_35

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 0, 5, $0, MapRoute36NationalParkgateSignpost0Script

	; people-events
	db 3
	person_event SPRITE_OFFICER, 5, 6, $6, $0, 255, 255, $a0, 0, OfficerScript_0x6a204, $0745
	person_event SPRITE_YOUNGSTER, 9, 10, $2, $11, 255, 255, $80, 0, YoungsterScript_0x6a2d8, $0734
	person_event SPRITE_OFFICER, 7, 4, $9, $0, 255, 255, $a0, 0, OfficerScript_0x6a2ca, $0746
