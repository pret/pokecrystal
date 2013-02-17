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
	checkbit2 $0011
	iftrue UnknownScript_0x6ab20
	dotrigger $0
	return
; 0x6ab20

UnknownScript_0x6ab20: ; 0x6ab20
	dotrigger $2
	return
; 0x6ab23

UnknownScript_0x6ab23: ; 0x6ab23
	checkbit1 $02d2
	iftrue UnknownScript_0x6ab46
	checkcode $b
	if_equal TUESDAY, UnknownScript_0x6ab42
	if_equal THURSDAY, UnknownScript_0x6ab42
	if_equal SATURDAY, UnknownScript_0x6ab42
	checkbit2 $0011
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
	playsound $0023
	special $002e
	waitbutton
	warpfacing $2, GROUP_NATIONAL_PARK_BUG_CONTEST, MAP_NATIONAL_PARK_BUG_CONTEST, $21, $12
	end
; 0x6ab8c

UnknownScript_0x6ab8c: ; 0x6ab8c
	checkbit1 $0716
	iftrue UnknownScript_0x6ab94
	appear $3
UnknownScript_0x6ab94: ; 0x6ab94
	checkbit1 $0717
	iftrue UnknownScript_0x6ab9c
	appear $4
UnknownScript_0x6ab9c: ; 0x6ab9c
	checkbit1 $0718
	iftrue UnknownScript_0x6aba4
	appear $5
UnknownScript_0x6aba4: ; 0x6aba4
	checkbit1 $0719
	iftrue UnknownScript_0x6abac
	appear $6
UnknownScript_0x6abac: ; 0x6abac
	checkbit1 $071a
	iftrue UnknownScript_0x6abb4
	appear $7
UnknownScript_0x6abb4: ; 0x6abb4
	checkbit1 $071b
	iftrue UnknownScript_0x6abbc
	appear $8
UnknownScript_0x6abbc: ; 0x6abbc
	checkbit1 $071c
	iftrue UnknownScript_0x6abc4
	appear $9
UnknownScript_0x6abc4: ; 0x6abc4
	checkbit1 $071d
	iftrue UnknownScript_0x6abcc
	appear $a
UnknownScript_0x6abcc: ; 0x6abcc
	checkbit1 $071e
	iftrue UnknownScript_0x6abd4
	appear $b
UnknownScript_0x6abd4: ; 0x6abd4
	checkbit1 $071f
	iftrue UnknownScript_0x6abdc
	appear $c
UnknownScript_0x6abdc: ; 0x6abdc
	special $0037
	end
; 0x6abe0

UnknownScript_0x6abe0: ; 0x6abe0
	checkcode $b
	if_equal SUNDAY, UnknownScript_0x6acf1
	if_equal MONDAY, UnknownScript_0x6acf1
	if_equal WEDNESDAY, UnknownScript_0x6acf1
	if_equal FRIDAY, UnknownScript_0x6acf1
	faceplayer
	loadfont
	checkbit2 $0051
	iftrue UnknownScript_0x6ac91
	2call UnknownScript_0x6ad02
	2writetext UnknownText_0x6add5
	yesorno
	iffalse UnknownScript_0x6ac73
	checkcode $1
	if_less_than $1, UnknownScript_0x6ac41
	special $0016
	clearbit1 $0308
UnknownScript_0x6ac10: ; 0x6ac10
	setbit2 $0011
	special $003c
	2writetext UnknownText_0x6ae87
	keeptextopen
	waitbutton
	2writetext UnknownText_0x6aeb1
	playsound $0001
	waitbutton
	2writetext UnknownText_0x6aecc
	closetext
	loadmovesprites
	setbit2 $0011
	special $0018
	spriteface $0, $2
	playsound $0023
	special $002e
	waitbutton
	special $0047
	warpfacing $2, GROUP_NATIONAL_PARK_BUG_CONTEST, MAP_NATIONAL_PARK_BUG_CONTEST, $21, $12
	end
; 0x6ac41

UnknownScript_0x6ac41: ; 0x6ac41
	checkcode $1
	if_greater_than $6, UnknownScript_0x6ac4d
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
	setbit1 $0308
	2writetext UnknownText_0x6b021
	keeptextopen
	2writetext UnknownText_0x6b055
	playsound $000c
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
	checkbit1 $0313
	iftrue UnknownScript_0x6acaf
	checkbit1 $0314
	iftrue UnknownScript_0x6acbe
	checkbit1 $0315
	iftrue UnknownScript_0x6accd
	checkbit1 $0316
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
	clearbit1 $0313
	loadmovesprites
	end
; 0x6acbe

UnknownScript_0x6acbe: ; 0x6acbe
	2writetext UnknownText_0x6b97f
	keeptextopen
	verbosegiveitem EVERSTONE, 1
	iffalse UnknownScript_0x6aceb
	clearbit1 $0314
	loadmovesprites
	end
; 0x6accd

UnknownScript_0x6accd: ; 0x6accd
	2writetext UnknownText_0x6b97f
	keeptextopen
	verbosegiveitem GOLD_BERRY, 1
	iffalse UnknownScript_0x6aceb
	clearbit1 $0315
	loadmovesprites
	end
; 0x6acdc

UnknownScript_0x6acdc: ; 0x6acdc
	2writetext UnknownText_0x6b97f
	keeptextopen
	verbosegiveitem BERRY, 1
	iffalse UnknownScript_0x6aceb
	clearbit1 $0316
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

UnknownScript_0x6acf4: ; 0x6acf4
	faceplayer
	loadfont
	checkbit2 $0051
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

UnknownScript_0x6ad06: ; 0x6ad06
	faceplayer
	loadfont
	checkbit1 $0000
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

UnknownScript_0x6ad1a: ; 0x6ad1a
	faceplayer
	loadfont
	checkbit1 $0000
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

UnknownScript_0x6ad2e: ; 0x6ad2e
	faceplayer
	loadfont
	checkbit1 $0000
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

UnknownScript_0x6ad42: ; 0x6ad42
	faceplayer
	loadfont
	checkbit1 $0000
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

UnknownScript_0x6ad56: ; 0x6ad56
	faceplayer
	loadfont
	checkbit1 $0000
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

UnknownScript_0x6ad6a: ; 0x6ad6a
	faceplayer
	loadfont
	checkbit1 $0000
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

UnknownScript_0x6ad7e: ; 0x6ad7e
	faceplayer
	loadfont
	checkbit1 $0000
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

UnknownScript_0x6ad92: ; 0x6ad92
	faceplayer
	loadfont
	checkbit1 $0000
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

UnknownScript_0x6ada6: ; 0x6ada6
	faceplayer
	loadfont
	checkbit1 $0000
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

UnknownScript_0x6adba: ; 0x6adba
	faceplayer
	loadfont
	checkbit1 $0000
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
; 0x6ae87

UnknownText_0x6ae87: ; 0x6ae87
	db $0, "Here are the PARK", $4f
	db "BALLS for the", $55
	db "Contest.", $57
; 0x6aeb1

UnknownText_0x6aeb1: ; 0x6aeb1
	db $0, $52, " received", $4f
	db "20 PARK BALLS.", $57
; 0x6aecc

UnknownText_0x6aecc: ; 0x6aecc
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
; 0x6afb0

UnknownText_0x6afb0: ; 0x6afb0
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
; 0x6b021

UnknownText_0x6b021: ; 0x6b021
	db $0, "Fine, we'll hold", $4f
	db "your other #MON", $55
	db "while you compete.", $57
; 0x6b055

UnknownText_0x6b055: ; 0x6b055
	db $0, $52, "'s #MON", $4f
	db "were left with the", $55
	db "CONTEST HELPER.", $57
; 0x6b081

UnknownText_0x6b081: ; 0x6b081
	db $0, "Please choose the", $4f
	db "#MON to be used", $51
	db "in the Contest,", $4f
	db "then come see me.", $57
; 0x6b0c6

UnknownText_0x6b0c6: ; 0x6b0c6
	db $0, "OK. We hope you'll", $4f
	db "take part in the", $55
	db "future.", $57
; 0x6b0f2

UnknownText_0x6b0f2: ; 0x6b0f2
	db $0, "Uh-oh…", $4f
	db "The first #MON", $51
	db "in your party", $4f
	db "can't battle.", $51
	db "Please switch it", $4f
	db "with the #MON", $51
	db "you want to use,", $4f
	db "then come see me.", $57
; 0x6b166

UnknownText_0x6b166: ; 0x6b166
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
; 0x6b209

UnknownText_0x6b209: ; 0x6b209
	db $0, "Uh-oh…", $4f
	db "You have an EGG as", $51
	db "the first #MON", $4f
	db "in your party.", $51
	db "Please switch it", $4f
	db "with the #MON", $51
	db "you want to use,", $4f
	db "then come see me.", $57
; 0x6b284

UnknownText_0x6b284: ; 0x6b284
	db $0, "You still have @"
	text_from_ram $d099
	db $0, $4f
	db "minute(s) left.", $51
	db "Do you want to", $4f
	db "finish now?", $57
; 0x6b2c5

UnknownText_0x6b2c5: ; 0x6b2c5
	db $0, "OK. Please wait", $4f
	db "here for the", $51
	db "announcement of", $4f
	db "the winners.", $57
; 0x6b300

UnknownText_0x6b300: ; 0x6b300
	db $0, "OK. Please go back", $4f
	db "outside and finish", $55
	db "up.", $57
; 0x6b32b

UnknownText_0x6b32b: ; 0x6b32b
	db $0, "Today's Contest is", $4f
	db "over. We hope you", $51
	db "will participate", $4f
	db "in the future.", $57
; 0x6b370

UnknownText_0x6b370: ; 0x6b370
	db $0, "Some #MON can", $4f
	db "only be seen in", $55
	db "the PARK.", $57
; 0x6b399

UnknownText_0x6b399: ; 0x6b399
	db $0, "DON: Wow, you beat", $4f
	db "me. You're pretty", $55
	db "good.", $57
; 0x6b3c4

UnknownText_0x6b3c4: ; 0x6b3c4
	db $0, "DON: Luck plays a", $4f
	db "big part in this.", $51
	db "You never know", $4f
	db "what #MON will", $55
	db "appear.", $57
; 0x6b40f

UnknownText_0x6b40f: ; 0x6b40f
	db $0, "ED: I envy you.", $4f
	db "I just couldn't", $55
	db "do it this time.", $57
; 0x6b440

UnknownText_0x6b440: ; 0x6b440
	db $0, "ED: Maybe you win", $4f
	db "with big #MON?", $57
; 0x6b462

UnknownText_0x6b462: ; 0x6b462
	db $0, "NICK: Well done!", $4f
	db "I'm going to raise", $55
	db "my #MON better.", $57
; 0x6b496

UnknownText_0x6b496: ; 0x6b496
	db $0, "NICK: Maybe you", $4f
	db "get a higher score", $51
	db "for a #MON of", $4f
	db "an unusual color.", $57
; 0x6b4da

UnknownText_0x6b4da: ; 0x6b4da
	db $0, "WILLIAM: You're", $4f
	db "the winner? What", $55
	db "did you catch?", $57
; 0x6b50a

UnknownText_0x6b50a: ; 0x6b50a
	db $0, "WILLIAM: Well, I'm", $4f
	db "satisfied because", $51
	db "I caught a #MON", $4f
	db "that I wanted.", $57
; 0x6b54e

UnknownText_0x6b54e: ; 0x6b54e
	db $0, "BENNY: Congrats!", $4f
	db "You have earned my", $55
	db "respect!", $57
; 0x6b57c

UnknownText_0x6b57c: ; 0x6b57c
	db $0, "BENNY: I caught a", $4f
	db "SCYTHER before,", $55
	db "but I didn't win.", $57
; 0x6b5b0

UnknownText_0x6b5b0: ; 0x6b5b0
	db $0, "BARRY: That #-", $4f
	db "MON you caught…", $55
	db "it's awesome!", $57
; 0x6b5dd

UnknownText_0x6b5dd: ; 0x6b5dd
	db $0, "BARRY: It's easier", $4f
	db "to win if you get", $51
	db "a high-level bug", $4f
	db "#MON.", $51
	db "But I think they", $4f
	db "also consider some", $55
	db "other points.", $57
; 0x6b64b

UnknownText_0x6b64b: ; 0x6b64b
	db $0, "CINDY: You won?", $4f
	db "That's great!", $51
	db "Do you feel like", $4f
	db "looking for bug", $55
	db "#MON with me?", $57
; 0x6b698

UnknownText_0x6b698: ; 0x6b698
	db $0, "CINDY: I really", $4f
	db "love bug #MON!", $57
; 0x6b6b8

UnknownText_0x6b6b8: ; 0x6b6b8
	db $0, "JOSH: I… I can't", $4f
	db "believe I lost at", $55
	db "bug-catching…", $57
; 0x6b6e9

UnknownText_0x6b6e9: ; 0x6b6e9
	db $0, "JOSH: I heard that", $4f
	db "somebody won with", $55
	db "a CATERPIE!", $57
; 0x6b71b

UnknownText_0x6b71b: ; 0x6b71b
	db $0, "SAMUEL: Next time,", $4f
	db "I'm going to win.", $57
; 0x6b740

UnknownText_0x6b740: ; 0x6b740
	db $0, "SAMUEL: Darn.", $4f
	db "I thought I would", $55
	db "score higher…", $57
; 0x6b76f

UnknownText_0x6b76f: ; 0x6b76f
	db $0, "KIPP: Could you", $4f
	db "give me some tips?", $51
	db "I want to study", $4f
	db "your style.", $57
; 0x6b7af

UnknownText_0x6b7af: ; 0x6b7af
	db $0, "KIPP: I study a", $4f
	db "lot, but that's", $51
	db "not good enough to", $4f
	db "win.", $57
; 0x6b7e7

; This text is unused and unreferenced in the final game.
; The tree Pokémon is Sudowoodo.
; The Silph Scope 2 was later reworked into the Squirtbottle.

UnusedSudowoodoText: ; 0x6b7e7
	db 0, "I hear there's a", $4f
	db "#MON that looks", $55
	db "just like a tree.", $51
	db "You can reveal its", $4f
	db "identity using a", $55
	db "SILPHSCOPE 2.", $57

UnknownText_0x6b84c: ; 0x6b84c
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
; 0x6b910

UnknownText_0x6b910: ; 0x6b910
	db $0, "Uh-oh… Your PACK", $4f
	db "is full.", $51
	db "We'll hold on to", $4f
	db "your prize, but", $55
	db "only for today.", $51
	db "Please make room,", $4f
	db "then come see me.", $57
; 0x6b97f

UnknownText_0x6b97f: ; 0x6b97f
	db $0, $52, "?", $51
	db "Here's the prize", $4f
	db "we were holding", $55
	db "for you.", $57
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
	person_event $43, 7, 4, $6, $0, 255, 255, $a0, 0, UnknownScript_0x6abe0, $0747
	person_event $27, 9, 6, $7, $0, 255, 255, $80, 0, UnknownScript_0x6ad06, $0720
	person_event $27, 9, 8, $7, $0, 255, 255, $a0, 0, UnknownScript_0x6ad1a, $0721
	person_event $2c, 10, 6, $7, $0, 255, 255, $90, 0, UnknownScript_0x6ad2e, $0722
	person_event $2d, 9, 10, $7, $0, 255, 255, $b0, 0, UnknownScript_0x6ad42, $0723
	person_event $27, 11, 6, $7, $0, 255, 255, $80, 0, UnknownScript_0x6ad56, $0724
	person_event $27, 10, 9, $7, $0, 255, 255, $a0, 0, UnknownScript_0x6ad6a, $0725
	person_event $28, 10, 7, $7, $0, 255, 255, $90, 0, UnknownScript_0x6ad7e, $0726
	person_event $27, 11, 8, $7, $0, 255, 255, $80, 0, UnknownScript_0x6ad92, $0727
	person_event $27, 11, 10, $7, $0, 255, 255, $a0, 0, UnknownScript_0x6ada6, $0728
	person_event $27, 10, 10, $7, $0, 255, 255, $90, 0, UnknownScript_0x6adba, $0729
	person_event $43, 6, 7, $6, $0, 255, 255, $a0, 0, UnknownScript_0x6acf4, $0748
; 0x6ba67



