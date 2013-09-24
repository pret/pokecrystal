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
	if_less_than $1, UnknownScript_0x6a271
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
	if_greater_than $6, $627d
	checkcode $10
	if_equal $0, UnknownScript_0x6a2b5
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
	db $0, "Today's @"
	text_from_ram $d099
	db $0, ".", $4f
	db "That means the", $51
	db "Bug-Catching Con-", $4f
	db "test is on today.", $51
	db "The rules are sim-", $4f
	db "ple.", $51
	db "Using one of your", $4f
	db "#MON, catch a", $51
	db "bug #MON to be", $4f
	db "judged.", $51
	db "Would you like to", $4f
	db "give it a try?", $57
; 0x6a39d

UnknownText_0x6a39d: ; 0x6a39d
	db $0, "Here are the PARK", $4f
	db "BALLS for the", $55
	db "Contest.", $57
; 0x6a3c7

UnknownText_0x6a3c7: ; 0x6a3c7
	db $0, $52, " received", $4f
	db "20 PARK BALLS.", $57
; 0x6a3e2

UnknownText_0x6a3e2: ; 0x6a3e2
	db $0, "The person who", $4f
	db "gets the strong-", $55
	db "est bug #MON", $55
	db "is the winner.", $51
	db "You have 20", $4f
	db "minutes.", $51
	db "If you run out of", $4f
	db "PARK BALLS, you're", $55
	db "done.", $51
	db "You can keep the", $4f
	db "last #MON you", $55
	db "catch as your own.", $51
	db "Go out and catch", $4f
	db "the strongest bug", $51
	db "#MON you can", $4f
	db "find!", $57
; 0x6a4c6

UnknownText_0x6a4c6: ; 0x6a4c6
	db $0, "Uh-oh…", $51
	db "You have more than", $4f
	db "one #MON.", $51
	db "You'll have to use", $4f
	db "@"
	text_from_ram $d099
	db $0, ", the", $51
	db "first #MON in", $4f
	db "your party.", $51
	db "Is that OK with", $4f
	db "you?", $57
; 0x6a537

UnknownText_0x6a537: ; 0x6a537
	db $0, "Fine, we'll hold", $4f
	db "your other #MON", $55
	db "while you compete.", $57
; 0x6a56b

UnknownText_0x6a56b: ; 0x6a56b
	db $0, $52, "'s #MON", $4f
	db "were left with the", $55
	db "CONTEST HELPER.", $57
; 0x6a597

UnknownText_0x6a597: ; 0x6a597
	db $0, "Please choose the", $4f
	db "#MON to be used", $51
	db "in the Contest,", $4f
	db "then come see me.", $57
; 0x6a5dc

UnknownText_0x6a5dc: ; 0x6a5dc
	db $0, "OK. We hope you'll", $4f
	db "take part in the", $55
	db "future.", $57
; 0x6a608

UnknownText_0x6a608: ; 0x6a608
	db $0, "Uh-oh…", $4f
	db "The first #MON", $51
	db "in your party", $4f
	db "can't battle.", $51
	db "Please switch it", $4f
	db "with the #MON", $51
	db "you want to use,", $4f
	db "then come see me.", $57
; 0x6a67c

UnknownText_0x6a67c: ; 0x6a67c
	db $0, "Uh-oh…", $4f
	db "Both your party", $51
	db "and your PC BOX", $4f
	db "are full.", $51
	db "You have no room", $4f
	db "to put the bug", $55
	db "#MON you catch.", $51
	db "Please make room", $4f
	db "in your party or", $51
	db "your PC BOX, then", $4f
	db "come see me.", $57
; 0x6a71f

UnknownText_0x6a71f: ; 0x6a71f
	db $0, "Uh-oh…", $4f
	db "You have an EGG as", $51
	db "the first #MON", $4f
	db "in your party.", $51
	db "Please switch it", $4f
	db "with the #MON", $51
	db "you want to use,", $4f
	db "then come see me.", $57
; 0x6a79a

UnknownText_0x6a79a: ; 0x6a79a
	db $0, "You still have @"
	text_from_ram $d099
	db $0, $4f
	db "minute(s) left.", $51
	db "Do you want to", $4f
	db "finish now?", $57
; 0x6a7db

UnknownText_0x6a7db: ; 0x6a7db
	db $0, "OK. Please wait at", $4f
	db "the North Gate for", $51
	db "the announcement", $4f
	db "of the winners.", $57
; 0x6a823

UnknownText_0x6a823: ; 0x6a823
	db $0, "OK. Please get", $4f
	db "back outside and", $55
	db "finish up.", $57
; 0x6a84f

UnknownText_0x6a84f: ; 0x6a84f
	db $0, "Today's Contest is", $4f
	db "over. We hope you", $51
	db "will participate", $4f
	db "in the future.", $57
; 0x6a894

UnknownText_0x6a894: ; 0x6a894
	db $0, "We hold Contests", $4f
	db "regularly in the", $51
	db "PARK. You should", $4f
	db "give it a shot.", $57
; 0x6a8d8

UnknownText_0x6a8d8: ; 0x6a8d8
	db $0, "When is the next", $4f
	db "Bug-Catching Con-", $55
	db "test going to be?", $57
; 0x6a90e

UnknownText_0x6a90e: ; 0x6a90e
	db $0, "The Bug-Catching", $4f
	db "Contest is held on", $51
	db "Tuesday, Thursday", $4f
	db "and Saturday.", $51
	db "Not only do you", $4f
	db "earn a prize just", $51
	db "for participating,", $4f
	db "you also get to", $51
	db "keep the bug", $4f
	db "#MON you may", $51
	db "have at the end of", $4f
	db "the contest.", $57
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

