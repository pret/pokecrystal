Route36NationalParkgate_MapScriptHeader: ; 0x6aafd
	; trigger count
	db 3

	; triggers
	dw UnknownScript_0x6ab11, $0000
	dw UnknownScript_0x6ab12, $0000
	dw UnknownScript_0x6ab13, $0000

	; callback count
	db 2

	; callbacks

	dbw 5, UnknownScript_0x6ab17

	dbw 2, UnknownScript_0x6ab23
; 0x6ab11

UnknownScript_0x6ab11: ; 0x6ab11
	end
; 0x6ab12

UnknownScript_0x6ab12: ; 0x6ab12
	end
; 0x6ab13

UnknownScript_0x6ab13: ; 0x6ab13
	priorityjump UnknownScript_0x6ab47
	end
; 0x6ab17

UnknownScript_0x6ab17: ; 0x6ab17
	checkflag $0011
	iftrue UnknownScript_0x6ab20
	dotrigger $0
	return
; 0x6ab20

UnknownScript_0x6ab20: ; 0x6ab20
	dotrigger $2
	return
; 0x6ab23

UnknownScript_0x6ab23: ; 0x6ab23
	checkevent $02d2
	iftrue UnknownScript_0x6ab46
	checkcode $b
	if_equal TUESDAY, UnknownScript_0x6ab42
	if_equal THURSDAY, UnknownScript_0x6ab42
	if_equal SATURDAY, UnknownScript_0x6ab42
	checkflag $0011
	iftrue UnknownScript_0x6ab42
	disappear $2
	appear $d
	return
; 0x6ab42

UnknownScript_0x6ab42: ; 0x6ab42
	appear $2
	disappear $d
UnknownScript_0x6ab46: ; 0x6ab46
	return
; 0x6ab47

UnknownScript_0x6ab47: ; 0x6ab47
	spriteface $0, $1
	loadfont
	checkcode $11
	addvar $1
	RAM2MEM $0
	2writetext UnknownText_0x6b284
	yesorno
	iffalse UnknownScript_0x6ab76
	2writetext UnknownText_0x6b2c5
	closetext
	loadmovesprites
	special $0030
	special $0033
	2call UnknownScript_0x6ab8c
	disappear $2
	appear $d
	applymovement $0, MovementData_0x6add1
	pause 15
	special $0032
	jumpstd $0017
; 0x6ab76

UnknownScript_0x6ab76: ; 0x6ab76
	2writetext UnknownText_0x6b300
	closetext
	loadmovesprites
	spriteface $0, $2
	playsound SFX_EXIT_BUILDING
	special $002e
	waitbutton
	warpfacing $2, GROUP_NATIONAL_PARK_BUG_CONTEST, MAP_NATIONAL_PARK_BUG_CONTEST, $21, $12
	end
; 0x6ab8c

UnknownScript_0x6ab8c: ; 0x6ab8c
	checkevent $0716
	iftrue UnknownScript_0x6ab94
	appear $3
UnknownScript_0x6ab94: ; 0x6ab94
	checkevent $0717
	iftrue UnknownScript_0x6ab9c
	appear $4
UnknownScript_0x6ab9c: ; 0x6ab9c
	checkevent $0718
	iftrue UnknownScript_0x6aba4
	appear $5
UnknownScript_0x6aba4: ; 0x6aba4
	checkevent $0719
	iftrue UnknownScript_0x6abac
	appear $6
UnknownScript_0x6abac: ; 0x6abac
	checkevent $071a
	iftrue UnknownScript_0x6abb4
	appear $7
UnknownScript_0x6abb4: ; 0x6abb4
	checkevent $071b
	iftrue UnknownScript_0x6abbc
	appear $8
UnknownScript_0x6abbc: ; 0x6abbc
	checkevent $071c
	iftrue UnknownScript_0x6abc4
	appear $9
UnknownScript_0x6abc4: ; 0x6abc4
	checkevent $071d
	iftrue UnknownScript_0x6abcc
	appear $a
UnknownScript_0x6abcc: ; 0x6abcc
	checkevent $071e
	iftrue UnknownScript_0x6abd4
	appear $b
UnknownScript_0x6abd4: ; 0x6abd4
	checkevent $071f
	iftrue UnknownScript_0x6abdc
	appear $c
UnknownScript_0x6abdc: ; 0x6abdc
	special $0037
	end
; 0x6abe0

OfficerScript_0x6abe0: ; 0x6abe0
	checkcode $b
	if_equal SUNDAY, UnknownScript_0x6acf1
	if_equal MONDAY, UnknownScript_0x6acf1
	if_equal WEDNESDAY, UnknownScript_0x6acf1
	if_equal FRIDAY, UnknownScript_0x6acf1
	faceplayer
	loadfont
	checkflag $0051
	iftrue UnknownScript_0x6ac91
	2call UnknownScript_0x6ad02
	2writetext UnknownText_0x6add5
	yesorno
	iffalse UnknownScript_0x6ac73
	checkcode $1
	if_greater_than $1, UnknownScript_0x6ac41
	special $0016
	clearevent $0308
UnknownScript_0x6ac10: ; 0x6ac10
	setflag $0011
	special $003c
	2writetext UnknownText_0x6ae87
	keeptextopen
	waitbutton
	2writetext UnknownText_0x6aeb1
	playsound SFX_ITEM
	waitbutton
	2writetext UnknownText_0x6aecc
	closetext
	loadmovesprites
	setflag $0011
	special $0018
	spriteface $0, $2
	playsound SFX_EXIT_BUILDING
	special $002e
	waitbutton
	special $0047
	warpfacing $2, GROUP_NATIONAL_PARK_BUG_CONTEST, MAP_NATIONAL_PARK_BUG_CONTEST, $21, $12
	end
; 0x6ac41

UnknownScript_0x6ac41: ; 0x6ac41
	checkcode $1
	if_less_than $6, UnknownScript_0x6ac4d
	checkcode $10
	if_equal $0, UnknownScript_0x6ac85
UnknownScript_0x6ac4d: ; 0x6ac4d
	special $005a
	if_equal $1, UnknownScript_0x6ac8b
	2writetext UnknownText_0x6afb0
	yesorno
	iffalse UnknownScript_0x6ac79
	special $0016
	iftrue UnknownScript_0x6ac7f
	setevent $0308
	2writetext UnknownText_0x6b021
	keeptextopen
	2writetext UnknownText_0x6b055
	playsound SFX_GOT_SAFARI_BALLS
	waitbutton
	keeptextopen
	2jump UnknownScript_0x6ac10
; 0x6ac73

UnknownScript_0x6ac73: ; 0x6ac73
	2writetext UnknownText_0x6b0c6
	closetext
	loadmovesprites
	end
; 0x6ac79

UnknownScript_0x6ac79: ; 0x6ac79
	2writetext UnknownText_0x6b081
	closetext
	loadmovesprites
	end
; 0x6ac7f

UnknownScript_0x6ac7f: ; 0x6ac7f
	2writetext UnknownText_0x6b0f2
	closetext
	loadmovesprites
	end
; 0x6ac85

UnknownScript_0x6ac85: ; 0x6ac85
	2writetext UnknownText_0x6b166
	closetext
	loadmovesprites
	end
; 0x6ac8b

UnknownScript_0x6ac8b: ; 0x6ac8b
	2writetext UnknownText_0x6b209
	closetext
	loadmovesprites
	end
; 0x6ac91

UnknownScript_0x6ac91: ; 0x6ac91
	checkevent $0313
	iftrue UnknownScript_0x6acaf
	checkevent $0314
	iftrue UnknownScript_0x6acbe
	checkevent $0315
	iftrue UnknownScript_0x6accd
	checkevent $0316
	iftrue UnknownScript_0x6acdc
	2writetext UnknownText_0x6b32b
	closetext
	loadmovesprites
	end
; 0x6acaf

UnknownScript_0x6acaf: ; 0x6acaf
	2writetext UnknownText_0x6b97f
	keeptextopen
	verbosegiveitem SUN_STONE, 1
	iffalse UnknownScript_0x6aceb
	clearevent $0313
	loadmovesprites
	end
; 0x6acbe

UnknownScript_0x6acbe: ; 0x6acbe
	2writetext UnknownText_0x6b97f
	keeptextopen
	verbosegiveitem EVERSTONE, 1
	iffalse UnknownScript_0x6aceb
	clearevent $0314
	loadmovesprites
	end
; 0x6accd

UnknownScript_0x6accd: ; 0x6accd
	2writetext UnknownText_0x6b97f
	keeptextopen
	verbosegiveitem GOLD_BERRY, 1
	iffalse UnknownScript_0x6aceb
	clearevent $0315
	loadmovesprites
	end
; 0x6acdc

UnknownScript_0x6acdc: ; 0x6acdc
	2writetext UnknownText_0x6b97f
	keeptextopen
	verbosegiveitem BERRY, 1
	iffalse UnknownScript_0x6aceb
	clearevent $0316
	loadmovesprites
	end
; 0x6aceb

UnknownScript_0x6aceb: ; 0x6aceb
	2writetext UnknownText_0x6b910
	closetext
	loadmovesprites
	end
; 0x6acf1

UnknownScript_0x6acf1: ; 0x6acf1
	jumptextfaceplayer UnknownText_0x6b370
; 0x6acf4

OfficerScript_0x6acf4: ; 0x6acf4
	faceplayer
	loadfont
	checkflag $0051
	iftrue UnknownScript_0x6ac91
	2writetext UnknownText_0x6b370
	closetext
	loadmovesprites
	end
; 0x6ad02

UnknownScript_0x6ad02: ; 0x6ad02
	jumpstd $0015
	end
; 0x6ad06

YoungsterScript_0x6ad06: ; 0x6ad06
	faceplayer
	loadfont
	checkevent $0000
	iffalse UnknownScript_0x6ad14
	2writetext UnknownText_0x6b399
	closetext
	loadmovesprites
	end
; 0x6ad14

UnknownScript_0x6ad14: ; 0x6ad14
	2writetext UnknownText_0x6b3c4
	closetext
	loadmovesprites
	end
; 0x6ad1a

YoungsterScript_0x6ad1a: ; 0x6ad1a
	faceplayer
	loadfont
	checkevent $0000
	iffalse UnknownScript_0x6ad28
	2writetext UnknownText_0x6b40f
	closetext
	loadmovesprites
	end
; 0x6ad28

UnknownScript_0x6ad28: ; 0x6ad28
	2writetext UnknownText_0x6b440
	closetext
	loadmovesprites
	end
; 0x6ad2e

RockerScript_0x6ad2e: ; 0x6ad2e
	faceplayer
	loadfont
	checkevent $0000
	iffalse UnknownScript_0x6ad3c
	2writetext UnknownText_0x6b462
	closetext
	loadmovesprites
	end
; 0x6ad3c

UnknownScript_0x6ad3c: ; 0x6ad3c
	2writetext UnknownText_0x6b496
	closetext
	loadmovesprites
	end
; 0x6ad42

PokefanMScript_0x6ad42: ; 0x6ad42
	faceplayer
	loadfont
	checkevent $0000
	iffalse UnknownScript_0x6ad50
	2writetext UnknownText_0x6b4da
	closetext
	loadmovesprites
	end
; 0x6ad50

UnknownScript_0x6ad50: ; 0x6ad50
	2writetext UnknownText_0x6b50a
	closetext
	loadmovesprites
	end
; 0x6ad56

YoungsterScript_0x6ad56: ; 0x6ad56
	faceplayer
	loadfont
	checkevent $0000
	iffalse UnknownScript_0x6ad64
	2writetext UnknownText_0x6b54e
	closetext
	loadmovesprites
	end
; 0x6ad64

UnknownScript_0x6ad64: ; 0x6ad64
	2writetext UnknownText_0x6b57c
	closetext
	loadmovesprites
	end
; 0x6ad6a

YoungsterScript_0x6ad6a: ; 0x6ad6a
	faceplayer
	loadfont
	checkevent $0000
	iffalse UnknownScript_0x6ad78
	2writetext UnknownText_0x6b5b0
	closetext
	loadmovesprites
	end
; 0x6ad78

UnknownScript_0x6ad78: ; 0x6ad78
	2writetext UnknownText_0x6b5dd
	closetext
	loadmovesprites
	end
; 0x6ad7e

LassScript_0x6ad7e: ; 0x6ad7e
	faceplayer
	loadfont
	checkevent $0000
	iffalse UnknownScript_0x6ad8c
	2writetext UnknownText_0x6b64b
	closetext
	loadmovesprites
	end
; 0x6ad8c

UnknownScript_0x6ad8c: ; 0x6ad8c
	2writetext UnknownText_0x6b698
	closetext
	loadmovesprites
	end
; 0x6ad92

YoungsterScript_0x6ad92: ; 0x6ad92
	faceplayer
	loadfont
	checkevent $0000
	iffalse UnknownScript_0x6ada0
	2writetext UnknownText_0x6b6b8
	closetext
	loadmovesprites
	end
; 0x6ada0

UnknownScript_0x6ada0: ; 0x6ada0
	2writetext UnknownText_0x6b6e9
	closetext
	loadmovesprites
	end
; 0x6ada6

YoungsterScript_0x6ada6: ; 0x6ada6
	faceplayer
	loadfont
	checkevent $0000
	iffalse UnknownScript_0x6adb4
	2writetext UnknownText_0x6b71b
	closetext
	loadmovesprites
	end
; 0x6adb4

UnknownScript_0x6adb4: ; 0x6adb4
	2writetext UnknownText_0x6b740
	closetext
	loadmovesprites
	end
; 0x6adba

YoungsterScript_0x6adba: ; 0x6adba
	faceplayer
	loadfont
	checkevent $0000
	iffalse UnknownScript_0x6adc8
	2writetext UnknownText_0x6b76f
	closetext
	loadmovesprites
	end
; 0x6adc8

UnknownScript_0x6adc8: ; 0x6adc8
	2writetext UnknownText_0x6b7af
	closetext
	loadmovesprites
	end
; 0x6adce

UnknownScript_0x6adce: ; 0x6adce
	jumptext UnknownText_0x6b84c
; 0x6add1

MovementData_0x6add1: ; 0x6add1
	big_step_down
	big_step_right
	turn_head_up
	step_end
; 0x6add5

UnknownText_0x6add5: ; 0x6add5
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
; 0x6ae87

UnknownText_0x6ae87: ; 0x6ae87
	text "Here are the PARK"
	line "BALLS for the"
	cont "Contest."
	done
; 0x6aeb1

UnknownText_0x6aeb1: ; 0x6aeb1
	text $52, " received"
	line "20 PARK BALLS."
	done
; 0x6aecc

UnknownText_0x6aecc: ; 0x6aecc
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
; 0x6afb0

UnknownText_0x6afb0: ; 0x6afb0
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
; 0x6b021

UnknownText_0x6b021: ; 0x6b021
	text "Fine, we'll hold"
	line "your other #MON"
	cont "while you compete."
	done
; 0x6b055

UnknownText_0x6b055: ; 0x6b055
	text $52, "'s #MON"
	line "were left with the"
	cont "CONTEST HELPER."
	done
; 0x6b081

UnknownText_0x6b081: ; 0x6b081
	text "Please choose the"
	line "#MON to be used"

	para "in the Contest,"
	line "then come see me."
	done
; 0x6b0c6

UnknownText_0x6b0c6: ; 0x6b0c6
	text "OK. We hope you'll"
	line "take part in the"
	cont "future."
	done
; 0x6b0f2

UnknownText_0x6b0f2: ; 0x6b0f2
	text "Uh-oh…"
	line "The first #MON"

	para "in your party"
	line "can't battle."

	para "Please switch it"
	line "with the #MON"

	para "you want to use,"
	line "then come see me."
	done
; 0x6b166

UnknownText_0x6b166: ; 0x6b166
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
; 0x6b209

UnknownText_0x6b209: ; 0x6b209
	text "Uh-oh…"
	line "You have an EGG as"

	para "the first #MON"
	line "in your party."

	para "Please switch it"
	line "with the #MON"

	para "you want to use,"
	line "then come see me."
	done
; 0x6b284

UnknownText_0x6b284: ; 0x6b284
	text "You still have @"
	text_from_ram $d099
	db $0
	line "minute(s) left."

	para "Do you want to"
	line "finish now?"
	done
; 0x6b2c5

UnknownText_0x6b2c5: ; 0x6b2c5
	text "OK. Please wait"
	line "here for the"

	para "announcement of"
	line "the winners."
	done
; 0x6b300

UnknownText_0x6b300: ; 0x6b300
	text "OK. Please go back"
	line "outside and finish"
	cont "up."
	done
; 0x6b32b

UnknownText_0x6b32b: ; 0x6b32b
	text "Today's Contest is"
	line "over. We hope you"

	para "will participate"
	line "in the future."
	done
; 0x6b370

UnknownText_0x6b370: ; 0x6b370
	text "Some #MON can"
	line "only be seen in"
	cont "the PARK."
	done
; 0x6b399

UnknownText_0x6b399: ; 0x6b399
	text "DON: Wow, you beat"
	line "me. You're pretty"
	cont "good."
	done
; 0x6b3c4

UnknownText_0x6b3c4: ; 0x6b3c4
	text "DON: Luck plays a"
	line "big part in this."

	para "You never know"
	line "what #MON will"
	cont "appear."
	done
; 0x6b40f

UnknownText_0x6b40f: ; 0x6b40f
	text "ED: I envy you."
	line "I just couldn't"
	cont "do it this time."
	done
; 0x6b440

UnknownText_0x6b440: ; 0x6b440
	text "ED: Maybe you win"
	line "with big #MON?"
	done
; 0x6b462

UnknownText_0x6b462: ; 0x6b462
	text "NICK: Well done!"
	line "I'm going to raise"
	cont "my #MON better."
	done
; 0x6b496

UnknownText_0x6b496: ; 0x6b496
	text "NICK: Maybe you"
	line "get a higher score"

	para "for a #MON of"
	line "an unusual color."
	done
; 0x6b4da

UnknownText_0x6b4da: ; 0x6b4da
	text "WILLIAM: You're"
	line "the winner? What"
	cont "did you catch?"
	done
; 0x6b50a

UnknownText_0x6b50a: ; 0x6b50a
	text "WILLIAM: Well, I'm"
	line "satisfied because"

	para "I caught a #MON"
	line "that I wanted."
	done
; 0x6b54e

UnknownText_0x6b54e: ; 0x6b54e
	text "BENNY: Congrats!"
	line "You have earned my"
	cont "respect!"
	done
; 0x6b57c

UnknownText_0x6b57c: ; 0x6b57c
	text "BENNY: I caught a"
	line "SCYTHER before,"
	cont "but I didn't win."
	done
; 0x6b5b0

UnknownText_0x6b5b0: ; 0x6b5b0
	text "BARRY: That #-"
	line "MON you caught…"
	cont "it's awesome!"
	done
; 0x6b5dd

UnknownText_0x6b5dd: ; 0x6b5dd
	text "BARRY: It's easier"
	line "to win if you get"

	para "a high-level bug"
	line "#MON."

	para "But I think they"
	line "also consider some"
	cont "other points."
	done
; 0x6b64b

UnknownText_0x6b64b: ; 0x6b64b
	text "CINDY: You won?"
	line "That's great!"

	para "Do you feel like"
	line "looking for bug"
	cont "#MON with me?"
	done
; 0x6b698

UnknownText_0x6b698: ; 0x6b698
	text "CINDY: I really"
	line "love bug #MON!"
	done
; 0x6b6b8

UnknownText_0x6b6b8: ; 0x6b6b8
	text "JOSH: I… I can't"
	line "believe I lost at"
	cont "bug-catching…"
	done
; 0x6b6e9

UnknownText_0x6b6e9: ; 0x6b6e9
	text "JOSH: I heard that"
	line "somebody won with"
	cont "a CATERPIE!"
	done
; 0x6b71b

UnknownText_0x6b71b: ; 0x6b71b
	text "SAMUEL: Next time,"
	line "I'm going to win."
	done
; 0x6b740

UnknownText_0x6b740: ; 0x6b740
	text "SAMUEL: Darn."
	line "I thought I would"
	cont "score higher…"
	done
; 0x6b76f

UnknownText_0x6b76f: ; 0x6b76f
	text "KIPP: Could you"
	line "give me some tips?"

	para "I want to study"
	line "your style."
	done
; 0x6b7af

UnknownText_0x6b7af: ; 0x6b7af
	text "KIPP: I study a"
	line "lot, but that's"

	para "not good enough to"
	line "win."
	done
; 0x6b7e7

; This text is unused and unreferenced in the final game.
; The tree Pokémon is Sudowoodo.
; The Silph Scope 2 was later reworked into the Squirtbottle.

UnusedSudowoodoText: ; 0x6b7e7
	text "I hear there's a"
	line "#MON that looks"
	cont "just like a tree."

	para "You can reveal its"
	line "identity using a"
	cont "SILPHSCOPE 2."
	done

UnknownText_0x6b84c: ; 0x6b84c
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
; 0x6b910

UnknownText_0x6b910: ; 0x6b910
	text "Uh-oh… Your PACK"
	line "is full."

	para "We'll hold on to"
	line "your prize, but"
	cont "only for today."

	para "Please make room,"
	line "then come see me."
	done
; 0x6b97f

UnknownText_0x6b97f: ; 0x6b97f
	text $52, "?"

	para "Here's the prize"
	line "we were holding"
	cont "for you."
	done
; 0x6b9ac

Route36NationalParkgate_MapEventHeader: ; 0x6b9ac
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $4, $0, 1, GROUP_NATIONAL_PARK, MAP_NATIONAL_PARK
	warp_def $5, $0, 2, GROUP_NATIONAL_PARK, MAP_NATIONAL_PARK
	warp_def $4, $9, 1, GROUP_ROUTE_36, MAP_ROUTE_36
	warp_def $5, $9, 2, GROUP_ROUTE_36, MAP_ROUTE_36

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 0, 6, $0, MapRoute36NationalParkgateSignpost0Script

	; people-events
	db 12
	person_event SPRITE_OFFICER, 7, 4, $6, $0, 255, 255, $a0, 0, OfficerScript_0x6abe0, $0747
	person_event SPRITE_YOUNGSTER, 9, 6, $7, $0, 255, 255, $80, 0, YoungsterScript_0x6ad06, $0720
	person_event SPRITE_YOUNGSTER, 9, 8, $7, $0, 255, 255, $a0, 0, YoungsterScript_0x6ad1a, $0721
	person_event SPRITE_ROCKER, 10, 6, $7, $0, 255, 255, $90, 0, RockerScript_0x6ad2e, $0722
	person_event SPRITE_POKEFAN_M, 9, 10, $7, $0, 255, 255, $b0, 0, PokefanMScript_0x6ad42, $0723
	person_event SPRITE_YOUNGSTER, 11, 6, $7, $0, 255, 255, $80, 0, YoungsterScript_0x6ad56, $0724
	person_event SPRITE_YOUNGSTER, 10, 9, $7, $0, 255, 255, $a0, 0, YoungsterScript_0x6ad6a, $0725
	person_event SPRITE_LASS, 10, 7, $7, $0, 255, 255, $90, 0, LassScript_0x6ad7e, $0726
	person_event SPRITE_YOUNGSTER, 11, 8, $7, $0, 255, 255, $80, 0, YoungsterScript_0x6ad92, $0727
	person_event SPRITE_YOUNGSTER, 11, 10, $7, $0, 255, 255, $a0, 0, YoungsterScript_0x6ada6, $0728
	person_event SPRITE_YOUNGSTER, 10, 10, $7, $0, 255, 255, $90, 0, YoungsterScript_0x6adba, $0729
	person_event SPRITE_OFFICER, 6, 7, $6, $0, 255, 255, $a0, 0, OfficerScript_0x6acf4, $0748
; 0x6ba67



