Route35NationalParkgate_MapScriptHeader: ; 0x6a189
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
; 0x6a19d

UnknownScript_0x6a19d: ; 0x6a19d
	end
; 0x6a19e

UnknownScript_0x6a19e: ; 0x6a19e
	end
; 0x6a19f

UnknownScript_0x6a19f: ; 0x6a19f
	priorityjump UnknownScript_0x6a1d1
	end
; 0x6a1a3

UnknownScript_0x6a1a3: ; 0x6a1a3
	checkflag $0011
	iftrue UnknownScript_0x6a1ac
	dotrigger $0
	return
; 0x6a1ac

UnknownScript_0x6a1ac: ; 0x6a1ac
	dotrigger $2
	return
; 0x6a1af

UnknownScript_0x6a1af: ; 0x6a1af
	checkcode $b
	if_equal TUESDAY, UnknownScript_0x6a1ca
	if_equal THURSDAY, UnknownScript_0x6a1ca
	if_equal SATURDAY, UnknownScript_0x6a1ca
	checkflag $0011
	iftrue UnknownScript_0x6a1ac
	disappear $2
	appear $3
	appear $4
	return
; 0x6a1ca

UnknownScript_0x6a1ca: ; 0x6a1ca
	appear $2
	disappear $3
	disappear $4
	return
; 0x6a1d1

UnknownScript_0x6a1d1: ; 0x6a1d1
	applymovement $0, MovementData_0x6a2e2
	spriteface $2, $3
	loadfont
	checkcode $11
	addvar $1
	RAM2MEM $0
	2writetext UnknownText_0x6a79a
	yesorno
	iffalse UnknownScript_0x6a1ee
	2writetext UnknownText_0x6a7db
	closetext
	loadmovesprites
	jumpstd $0016
; 0x6a1ee

UnknownScript_0x6a1ee: ; 0x6a1ee
	2writetext UnknownText_0x6a823
	closetext
	loadmovesprites
	2call UnknownScript_0x6a261
	playsound $001f
	special $002e
	waitbutton
	warpfacing $1, GROUP_NATIONAL_PARK_BUG_CONTEST, MAP_NATIONAL_PARK_BUG_CONTEST, $a, $2f
	end
; 0x6a204

OfficerScript_0x6a204: ; 0x6a204
	checkcode $b
	if_equal SUNDAY, UnknownScript_0x6a2c7
	if_equal MONDAY, UnknownScript_0x6a2c7
	if_equal WEDNESDAY, UnknownScript_0x6a2c7
	if_equal FRIDAY, UnknownScript_0x6a2c7
	faceplayer
	loadfont
	checkflag $0051
	iftrue UnknownScript_0x6a2c1
	2call UnknownScript_0x6a2de
	2writetext UnknownText_0x6a2eb
	yesorno
	iffalse UnknownScript_0x6a2a3
	checkcode $1
	if_greater_than $1, UnknownScript_0x6a271
	special $0016
	clearevent $0308
UnknownScript_0x6a234: ; 0x6a234
	setflag $0011
	special $003c
	2writetext UnknownText_0x6a39d
	keeptextopen
	2writetext UnknownText_0x6a3c7
	playsound $0001
	waitbutton
	2writetext UnknownText_0x6a3e2
	closetext
	loadmovesprites
	special $0018
	2call UnknownScript_0x6a261
	playsound $001f
	special $002e
	waitbutton
	special $0047
	warpfacing $1, GROUP_NATIONAL_PARK_BUG_CONTEST, MAP_NATIONAL_PARK_BUG_CONTEST, $a, $2f
	end
; 0x6a261

UnknownScript_0x6a261: ; 0x6a261
	checkcode $9
	if_equal $2, UnknownScript_0x6a26c
	applymovement $0, MovementData_0x6a2e5
	end
; 0x6a26c

UnknownScript_0x6a26c: ; 0x6a26c
	applymovement $0, MovementData_0x6a2e9
	end
; 0x6a271

UnknownScript_0x6a271: ; 0x6a271
	checkcode $1
	if_less_than $6, UnknownScript_0x6a27d
	checkcode $10
	if_equal $0, UnknownScript_0x6a2b5

UnknownScript_0x6a27d: ; 6a27d
	special $005a
	if_equal $1, UnknownScript_0x6a2bb
	2writetext UnknownText_0x6a4c6
	yesorno
	iffalse UnknownScript_0x6a2a9
	special $0016
	iftrue UnknownScript_0x6a2af
	setevent $0308
	2writetext UnknownText_0x6a537
	keeptextopen
	2writetext UnknownText_0x6a56b
	playsound $000c
	waitbutton
	keeptextopen
	2jump UnknownScript_0x6a234
; 0x6a2a3

UnknownScript_0x6a2a3: ; 0x6a2a3
	2writetext UnknownText_0x6a5dc
	closetext
	loadmovesprites
	end
; 0x6a2a9

UnknownScript_0x6a2a9: ; 0x6a2a9
	2writetext UnknownText_0x6a597
	closetext
	loadmovesprites
	end
; 0x6a2af

UnknownScript_0x6a2af: ; 0x6a2af
	2writetext UnknownText_0x6a608
	closetext
	loadmovesprites
	end
; 0x6a2b5

UnknownScript_0x6a2b5: ; 0x6a2b5
	2writetext UnknownText_0x6a67c
	closetext
	loadmovesprites
	end
; 0x6a2bb

UnknownScript_0x6a2bb: ; 0x6a2bb
	2writetext UnknownText_0x6a71f
	closetext
	loadmovesprites
	end
; 0x6a2c1

UnknownScript_0x6a2c1: ; 0x6a2c1
	2writetext UnknownText_0x6a84f
	closetext
	loadmovesprites
	end
; 0x6a2c7

UnknownScript_0x6a2c7: ; 0x6a2c7
	jumptextfaceplayer UnknownText_0x6a894
; 0x6a2ca

OfficerScript_0x6a2ca: ; 0x6a2ca
	faceplayer
	loadfont
	checkflag $0051
	iftrue UnknownScript_0x6a2c1
	2writetext UnknownText_0x6a894
	closetext
	loadmovesprites
	end
; 0x6a2d8

YoungsterScript_0x6a2d8: ; 0x6a2d8
	jumptextfaceplayer UnknownText_0x6a8d8
; 0x6a2db

MapRoute36NationalParkgateSignpost0Script: ; 0x6a2db
	jumptext UnknownText_0x6a90e
; 0x6a2de

UnknownScript_0x6a2de: ; 0x6a2de
	jumpstd $0015
	end
; 0x6a2e2

MovementData_0x6a2e2: ; 0x6a2e2
	step_down
	turn_head_left
	step_end
; 0x6a2e5

MovementData_0x6a2e5: ; 0x6a2e5
	step_right
	step_up
	step_up
	step_end
; 0x6a2e9

MovementData_0x6a2e9: ; 0x6a2e9
	step_up
	step_end
; 0x6a2eb

UnknownText_0x6a2eb: ; 0x6a2eb
	text "Today's @"
	text_from_ram $d099
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
; 0x6a39d

UnknownText_0x6a39d: ; 0x6a39d
	text "Here are the PARK"
	line "BALLS for the"
	cont "Contest."
	done
; 0x6a3c7

UnknownText_0x6a3c7: ; 0x6a3c7
	text $52, " received"
	line "20 PARK BALLS."
	done
; 0x6a3e2

UnknownText_0x6a3e2: ; 0x6a3e2
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
; 0x6a4c6

UnknownText_0x6a4c6: ; 0x6a4c6
	text "Uh-oh…"

	para "You have more than"
	line "one #MON."

	para "You'll have to use"
	line "@"
	text_from_ram $d099
	text ", the"

	para "first #MON in"
	line "your party."

	para "Is that OK with"
	line "you?"
	done
; 0x6a537

UnknownText_0x6a537: ; 0x6a537
	text "Fine, we'll hold"
	line "your other #MON"
	cont "while you compete."
	done
; 0x6a56b

UnknownText_0x6a56b: ; 0x6a56b
	text $52, "'s #MON"
	line "were left with the"
	cont "CONTEST HELPER."
	done
; 0x6a597

UnknownText_0x6a597: ; 0x6a597
	text "Please choose the"
	line "#MON to be used"

	para "in the Contest,"
	line "then come see me."
	done
; 0x6a5dc

UnknownText_0x6a5dc: ; 0x6a5dc
	text "OK. We hope you'll"
	line "take part in the"
	cont "future."
	done
; 0x6a608

UnknownText_0x6a608: ; 0x6a608
	text "Uh-oh…"
	line "The first #MON"

	para "in your party"
	line "can't battle."

	para "Please switch it"
	line "with the #MON"

	para "you want to use,"
	line "then come see me."
	done
; 0x6a67c

UnknownText_0x6a67c: ; 0x6a67c
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
; 0x6a71f

UnknownText_0x6a71f: ; 0x6a71f
	text "Uh-oh…"
	line "You have an EGG as"

	para "the first #MON"
	line "in your party."

	para "Please switch it"
	line "with the #MON"

	para "you want to use,"
	line "then come see me."
	done
; 0x6a79a

UnknownText_0x6a79a: ; 0x6a79a
	text "You still have @"
	text_from_ram $d099
	db $0
	line "minute(s) left."

	para "Do you want to"
	line "finish now?"
	done
; 0x6a7db

UnknownText_0x6a7db: ; 0x6a7db
	text "OK. Please wait at"
	line "the North Gate for"

	para "the announcement"
	line "of the winners."
	done
; 0x6a823

UnknownText_0x6a823: ; 0x6a823
	text "OK. Please get"
	line "back outside and"
	cont "finish up."
	done
; 0x6a84f

UnknownText_0x6a84f: ; 0x6a84f
	text "Today's Contest is"
	line "over. We hope you"

	para "will participate"
	line "in the future."
	done
; 0x6a894

UnknownText_0x6a894: ; 0x6a894
	text "We hold Contests"
	line "regularly in the"

	para "PARK. You should"
	line "give it a shot."
	done
; 0x6a8d8

UnknownText_0x6a8d8: ; 0x6a8d8
	text "When is the next"
	line "Bug-Catching Con-"
	cont "test going to be?"
	done
; 0x6a90e

UnknownText_0x6a90e: ; 0x6a90e
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
; 0x6a9d2

Route35NationalParkgate_MapEventHeader: ; 0x6a9d2
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
; 0x6aa18

