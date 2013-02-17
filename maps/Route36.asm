Route36_MapScriptHeader: ; 0x194000
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x19400d, $0000
	dw UnknownScript_0x19400e, $0000

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x19400f
; 0x19400d

UnknownScript_0x19400d: ; 0x19400d
	end
; 0x19400e

UnknownScript_0x19400e: ; 0x19400e
	end
; 0x19400f

UnknownScript_0x19400f: ; 0x19400f
	checkcode $b
	if_equal THURSDAY, UnknownScript_0x194018
	disappear $8
	return
; 0x194018

UnknownScript_0x194018: ; 0x194018
	appear $8
	return
; 0x19401b

UnknownScript_0x19401b: ; 0x19401b
	showemote $0, $0, 15
	pause 15
	playsound $0014
	spriteface $0, $1
	applymovement $a, MovementData_0x194262
	disappear $a
	spriteface $0, $0
	pause 10
	dotrigger $0
	clearbit1 $07ae
	domaptrigger GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY, $1
	end
; 0x19403c

UnknownScript_0x19403c: ; 0x19403c
	checkitem SQUIRTBOTTLE
	iftrue UnknownScript_0x19404a
	waitbutton
	playsound $006d
	applymovement $4, MovementData_0x194249
	end
; 0x19404a

UnknownScript_0x19404a: ; 0x19404a
	loadfont
	2writetext UnknownText_0x19426b
	yesorno
	iffalse UnknownScript_0x194079
	loadmovesprites
	loadfont
	2writetext UnknownText_0x194290
	closetext
	loadmovesprites
	waitbutton
	playsound $006d
	applymovement $4, MovementData_0x194249
	loadfont
	2writetext UnknownText_0x1942aa
	closetext
	loadmovesprites
	loadpokedata SUDOWOODO, 20
	startbattle
	setbit1 $002a
	if_equal $2, UnknownScript_0x19407b
	disappear $4
	variablesprite $4, $26
	returnafterbattle
	end
; 0x194079

UnknownScript_0x194079: ; 0x194079
	loadmovesprites
	end
; 0x19407b

UnknownScript_0x19407b: ; 0x19407b
	returnafterbattle
	applymovement $4, MovementData_0x19424b
	disappear $4
	variablesprite $4, $26
	special $005e
	special $009e
	end
; 0x19408c

UnknownScript_0x19408c: ; 0x19408c
	faceplayer
	loadfont
	checkbit1 $00ba
	iftrue UnknownScript_0x1940b3
	setbit1 $00b9
	2writetext UnknownText_0x1942f1
	closetext
	loadmovesprites
	clearbit1 $0768
	checkcode $9
	if_equal $1, UnknownScript_0x1940ac
	applymovement $9, MovementData_0x19424e
	disappear $9
	end
; 0x1940ac

UnknownScript_0x1940ac: ; 0x1940ac
	applymovement $9, MovementData_0x194258
	disappear $9
	end
; 0x1940b3

UnknownScript_0x1940b3: ; 0x1940b3
	2writetext UnknownText_0x1943ed
	closetext
	loadmovesprites
	end
; 0x1940b9

UnknownScript_0x1940b9: ; 0x1940b9
	faceplayer
	loadfont
	checkbit1 $004b
	iftrue UnknownScript_0x1940da
	checkbit1 $002a
	iftrue UnknownScript_0x1940cd
	2writetext UnknownText_0x19446f
	closetext
	loadmovesprites
	end
; 0x1940cd

UnknownScript_0x1940cd: ; 0x1940cd
	2writetext UnknownText_0x1944d0
	keeptextopen
	verbosegiveitem TM_08, 1
	iffalse UnknownScript_0x1940de
	setbit1 $004b
UnknownScript_0x1940da: ; 0x1940da
	2writetext UnknownText_0x19452c
	closetext
UnknownScript_0x1940de: ; 0x1940de
	loadmovesprites
	end
; 0x1940e0

UnknownScript_0x1940e0: ; 0x1940e0
	faceplayer
	loadfont
	checkbit1 $002a
	iftrue UnknownScript_0x1940ee
	2writetext UnknownText_0x194626
	closetext
	loadmovesprites
	end
; 0x1940ee

UnknownScript_0x1940ee: ; 0x1940ee
	2writetext UnknownText_0x19469e
	closetext
	loadmovesprites
	end
; 0x1940f4

TrainerSchoolboyAlan1: ; 0x1940f4
	; bit/flag number
	dw $46e

	; trainer group && trainer id
	db SCHOOLBOY, ALAN1

	; text when seen
	dw SchoolboyAlan1SeenText

	; text when trainer beaten
	dw SchoolboyAlan1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SchoolboyAlan1Script
; 0x194100

SchoolboyAlan1Script: ; 0x194100
	writecode $17, $18
	talkaftercancel
	loadfont
	checkbit2 $0073
	iftrue UnknownScript_0x194140
	checkbit2 $0081
	iftrue UnknownScript_0x1941b4
	checkcellnum $18
	iftrue UnknownScript_0x1941d5
	checkbit1 $0285
	iftrue UnknownScript_0x194129
	2writetext UnknownText_0x1947aa
	keeptextopen
	setbit1 $0285
	2call UnknownScript_0x1941c9
	2jump UnknownScript_0x19412c
; 0x194129

UnknownScript_0x194129: ; 0x194129
	2call UnknownScript_0x1941cd
UnknownScript_0x19412c: ; 0x19412c
	askforphonenumber $18
	if_equal $1, UnknownScript_0x1941dd
	if_equal $2, UnknownScript_0x1941d9
	trainertotext SCHOOLBOY, ALAN1, $0
	2call UnknownScript_0x1941d1
	2jump UnknownScript_0x1941d5
; 0x194140

UnknownScript_0x194140: ; 0x194140
	2call UnknownScript_0x1941e1
	winlosstext SchoolboyAlan1BeatenText, $0000
	copybytetovar $da02
	if_equal $4, UnknownScript_0x19415f
	if_equal $3, UnknownScript_0x194165
	if_equal $2, UnknownScript_0x19416b
	if_equal $1, UnknownScript_0x194171
	if_equal $0, UnknownScript_0x194177
UnknownScript_0x19415f: ; 0x19415f
	checkbit1 $00cd
	iftrue UnknownScript_0x1941ab
UnknownScript_0x194165: ; 0x194165
	checkbit1 $0044
	iftrue UnknownScript_0x19419e
UnknownScript_0x19416b: ; 0x19416b
	checkbit2 $004b
	iftrue UnknownScript_0x194191
UnknownScript_0x194171: ; 0x194171
	checkbit2 $0047
	iftrue UnknownScript_0x194184
UnknownScript_0x194177: ; 0x194177
	loadtrainer SCHOOLBOY, ALAN1
	startbattle
	returnafterbattle
	loadvar $da02, $1
	clearbit2 $0073
	end
; 0x194184

UnknownScript_0x194184: ; 0x194184
	loadtrainer SCHOOLBOY, ALAN2
	startbattle
	returnafterbattle
	loadvar $da02, $2
	clearbit2 $0073
	end
; 0x194191

UnknownScript_0x194191: ; 0x194191
	loadtrainer SCHOOLBOY, ALAN3
	startbattle
	returnafterbattle
	loadvar $da02, $3
	clearbit2 $0073
	end
; 0x19419e

UnknownScript_0x19419e: ; 0x19419e
	loadtrainer SCHOOLBOY, ALAN4
	startbattle
	returnafterbattle
	loadvar $da02, $4
	clearbit2 $0073
	end
; 0x1941ab

UnknownScript_0x1941ab: ; 0x1941ab
	loadtrainer SCHOOLBOY, ALAN5
	startbattle
	returnafterbattle
	clearbit2 $0073
	end
; 0x1941b4

UnknownScript_0x1941b4: ; 0x1941b4
	2call UnknownScript_0x1941e5
	verbosegiveitem FIRE_STONE, 1
	iffalse UnknownScript_0x1941c6
	clearbit2 $0081
	setbit1 $0101
	2jump UnknownScript_0x1941d5
; 0x1941c6

UnknownScript_0x1941c6: ; 0x1941c6
	2jump UnknownScript_0x1941e9
; 0x1941c9

UnknownScript_0x1941c9: ; 0x1941c9
	jumpstd $0019
	end
; 0x1941cd

UnknownScript_0x1941cd: ; 0x1941cd
	jumpstd $001a
	end
; 0x1941d1

UnknownScript_0x1941d1: ; 0x1941d1
	jumpstd $001b
	end
; 0x1941d5

UnknownScript_0x1941d5: ; 0x1941d5
	jumpstd $001c
	end
; 0x1941d9

UnknownScript_0x1941d9: ; 0x1941d9
	jumpstd $001d
	end
; 0x1941dd

UnknownScript_0x1941dd: ; 0x1941dd
	jumpstd $001e
	end
; 0x1941e1

UnknownScript_0x1941e1: ; 0x1941e1
	jumpstd $001f
	end
; 0x1941e5

UnknownScript_0x1941e5: ; 0x1941e5
	jumpstd $0020
	end
; 0x1941e9

UnknownScript_0x1941e9: ; 0x1941e9
	jumpstd $0021
	end
; 0x1941ed

TrainerPsychicMark: ; 0x1941ed
	; bit/flag number
	dw $440

	; trainer group && trainer id
	db PSYCHIC_T, MARK

	; text when seen
	dw PsychicMarkSeenText

	; text when trainer beaten
	dw PsychicMarkBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PsychicMarkScript
; 0x1941f9

PsychicMarkScript: ; 0x1941f9
	talkaftercancel
	loadfont
	2writetext UnknownText_0x19471e
	closetext
	loadmovesprites
	end
; 0x194201

UnknownScript_0x194201: ; 0x194201
	faceplayer
	loadfont
	checkbit1 $0067
	iftrue UnknownScript_0x19422f
	checkcode $b
	if_not_equal THURSDAY, UnknownScript_0x194235
	checkbit1 $0066
	iftrue UnknownScript_0x19421c
	2writetext UnknownText_0x194800
	keeptextopen
	setbit1 $0066
UnknownScript_0x19421c: ; 0x19421c
	2writetext UnknownText_0x19482d
	keeptextopen
	verbosegiveitem HARD_STONE, 1
	iffalse UnknownScript_0x194233
	setbit1 $0067
	2writetext UnknownText_0x194847
	closetext
	loadmovesprites
	end
; 0x19422f

UnknownScript_0x19422f: ; 0x19422f
	2writetext UnknownText_0x1948aa
	closetext
UnknownScript_0x194233: ; 0x194233
	loadmovesprites
	end
; 0x194235

UnknownScript_0x194235: ; 0x194235
	2writetext UnknownText_0x1948f3
	closetext
	loadmovesprites
	end
; 0x19423b

MapRoute36Signpost2Script: ; 0x19423b
	jumptext UnknownText_0x194924
; 0x19423e

MapRoute36Signpost1Script: ; 0x19423e
	jumptext UnknownText_0x19492e
; 0x194241

MapRoute36Signpost3Script: ; 0x194241
	jumptext UnknownText_0x19494c
; 0x194244

MapRoute36Signpost0Script: ; 0x194244
	jumptext UnknownText_0x1949ee
; 0x194247

UnknownScript_0x194247: ; 0x194247
	fruittree $d
; 0x194249

MovementData_0x194249: ; 0x194249
	db $56 ; movement
	step_end
; 0x19424b

MovementData_0x19424b: ; 0x19424b
	fast_jump_step_up
	fast_jump_step_up
	step_end
; 0x19424e

MovementData_0x19424e: ; 0x19424e
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end
; 0x194258

MovementData_0x194258: ; 0x194258
	step_left
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end
; 0x194262

MovementData_0x194262: ; 0x194262
	db $39 ; movement
	fast_jump_step_down
	fast_jump_step_down
	fast_jump_step_down
	fast_jump_step_right
	fast_jump_step_right
	fast_jump_step_right
	db $38 ; movement
	step_end
; 0x19426b

UnknownText_0x19426b: ; 0x19426b
	db $0, "It's a weird tree.", $4f
	db "Use SQUIRTBOTTLE?", $57
; 0x194290

UnknownText_0x194290: ; 0x194290
	db $0, $52, " used the", $4f
	db "SQUIRTBOTTLE.", $57
; 0x1942aa

UnknownText_0x1942aa: ; 0x1942aa
	db $0, "The weird tree", $4f
	db "doesn't like the", $55
	db "SQUIRTBOTTLE!", $51
	db "The weird tree", $4f
	db "attacked!", $57
; 0x1942f1

UnknownText_0x1942f1: ; 0x1942f1
	db $0, "I'm the FLOWER", $4f
	db "SHOP's FLORIA!", $51
	db "Listen, listen!", $51
	db "When I sprinkled", $4f
	db "water on that", $51
	db "wiggly tree, it", $4f
	db "jumped right up!", $51
	db "It just has to be", $4f
	db "a #MON.", $51
	db "I bet it would be", $4f
	db "shocked out of its", $51
	db "disguise if you", $4f
	db "soaked it!", $51
	db "I know! I'll tell", $4f
	db "my sis and borrow", $55
	db "her water bottle!", $57
; 0x1943ed

UnknownText_0x1943ed: ; 0x1943ed
	db $0, "When I told my sis", $4f
	db "about the jiggly", $51
	db "tree, she said", $4f
	db "it's dangerous.", $51
	db "If I beat WHITNEY,", $4f
	db "I wonder if she'll", $51
	db "lend me her water", $4f
	db "bottle…", $57
; 0x19446f

UnknownText_0x19446f: ; 0x19446f
	db $0, "Wa-hey!", $51
	db "I was going to", $4f
	db "snap that tree", $51
	db "with my straight-", $4f
	db "arm punch.", $51
	db "But I couldn't!", $4f
	db "I'm a failure!", $57
; 0x1944d0

UnknownText_0x1944d0: ; 0x1944d0
	db $0, "Did you clear that", $4f
	db "wretched tree?", $51
	db "I'm impressed!", $4f
	db "I want you to", $55
	db "have this.", $57
; 0x19451a

UnknownText_0x19451a: ; 0x19451a
	db $0, $52, " received", $4f
	db "TM08.", $57
; 0x19452c

UnknownText_0x19452c: ; 0x19452c
	db $0, "That happens to be", $4f
	db "ROCK SMASH.", $51
	db "You can shatter", $4f
	db "rocks with just a", $51
	db "single well-aimed", $4f
	db "smack.", $51
	db "If any rocks are", $4f
	db "in your way, just", $55
	db "smash 'em up!", $57
; 0x1945b8

UnknownText_0x1945b8: ; 0x1945b8
	db $0, "An odd tree is", $4f
	db "blocking the way", $55
	db "to GOLDENROD CITY.", $51
	db "I wanted to go see", $4f
	db "the huge #MON", $51
	db "CENTER they just", $4f
	db "opened…", $57
; 0x194626

UnknownText_0x194626: ; 0x194626
	db $0, "An odd tree is", $4f
	db "blocking the way", $55
	db "to GOLDENROD CITY.", $51
	db "It's preventing", $4f
	db "me from shopping.", $51
	db "Something should", $4f
	db "be done about it.", $57
; 0x19469e

UnknownText_0x19469e: ; 0x19469e
	db $0, "That odd tree dis-", $4f
	db "appeared without a", $55
	db "trace.", $51
	db "Oh! That tree was", $4f
	db "really a #MON?", $57
; 0x1946ed

PsychicMarkSeenText: ; 0x1946ed
	db $0, "I'm going to read", $4f
	db "your thoughts!", $57
; 0x19470e

PsychicMarkBeatenText: ; 0x19470e
	db $0, "I misread you!", $57
; 0x19471e

UnknownText_0x19471e: ; 0x19471e
	db $0, "I'd be strong if", $4f
	db "only I could tell", $51
	db "what my opponent", $4f
	db "was thinking.", $57
; 0x194760

SchoolboyAlan1SeenText: ; 0x194760
	db $0, "Thanks to my stud-", $4f
	db "ies, I'm ready for", $55
	db "any #MON!", $57
; 0x194790

SchoolboyAlan1BeatenText: ; 0x194790
	db $0, "Oops! Computation", $4f
	db "error?", $57
; 0x1947aa

UnknownText_0x1947aa: ; 0x1947aa
	db $0, "Darn. I study five", $4f
	db "hours a day too.", $51
	db "There's more to", $4f
	db "learning than just", $55
	db "reading books.", $57
; 0x194800

UnknownText_0x194800: ; 0x194800
	db $0, "ARTHUR: Who are", $4f
	db "you?", $51
	db "I'm ARTHUR of", $4f
	db "Thursday.", $57
; 0x19482d

UnknownText_0x19482d: ; 0x19482d
	db $0, "Here. You can have", $4f
	db "this.", $57
; 0x194847

UnknownText_0x194847: ; 0x194847
	db $0, "ARTHUR: A #MON", $4f
	db "that uses rock-", $51
	db "type moves should", $4f
	db "hold on to that.", $51
	db "It pumps up rock-", $4f
	db "type attacks.", $57
; 0x1948aa

UnknownText_0x1948aa: ; 0x1948aa
	db $0, "ARTHUR: I'm ARTHUR", $4f
	db "of Thursday. I'm", $51
	db "the second son out", $4f
	db "of seven children.", $57
; 0x1948f3

UnknownText_0x1948f3: ; 0x1948f3
	db $0, "ARTHUR: Today's", $4f
	db "not Thursday. How", $55
	db "disappointing.", $57
; 0x194924

UnknownText_0x194924: ; 0x194924
	db $0, "ROUTE 36", $57
; 0x19492e

UnknownText_0x19492e: ; 0x19492e
	db $0, "RUINS OF ALPH", $4f
	db "NORTH ENTRANCE", $57
; 0x19494c

UnknownText_0x19494c: ; 0x19494c
	db $0, "TRAINER TIPS", $51
	db "#MON stats", $4f
	db "vary--even within", $55
	db "the same species.", $51
	db "Their stats may be", $4f
	db "similar at first.", $51
	db "However, differ-", $4f
	db "ences will become", $51
	db "pronounced as the", $4f
	db "#MON grow.", $57
; 0x1949ee

UnknownText_0x1949ee: ; 0x1949ee
	db $0, "TRAINER TIPS", $51
	db "Use DIG to return", $4f
	db "to the entrance of", $55
	db "any place.", $51
	db "It is convenient", $4f
	db "for exploring", $51
	db "caves and other", $4f
	db "landmarks.", $57
; 0x194a66

Route36_MapEventHeader: ; 0x194a66
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $8, $12, 3, GROUP_ROUTE_36_NATIONAL_PARK_GATE, MAP_ROUTE_36_NATIONAL_PARK_GATE
	warp_def $9, $12, 4, GROUP_ROUTE_36_NATIONAL_PARK_GATE, MAP_ROUTE_36_NATIONAL_PARK_GATE
	warp_def $d, $2f, 1, GROUP_ROUTE_36_RUINS_OF_ALPH_GATE, MAP_ROUTE_36_RUINS_OF_ALPH_GATE
	warp_def $d, $30, 2, GROUP_ROUTE_36_RUINS_OF_ALPH_GATE, MAP_ROUTE_36_RUINS_OF_ALPH_GATE

	; xy triggers
	db 2
	xy_trigger 1, $7, $14, $0, UnknownScript_0x19401b, $0, $0
	xy_trigger 1, $7, $16, $0, UnknownScript_0x19401b, $0, $0

	; signposts
	db 4
	signpost 1, 29, $0, MapRoute36Signpost0Script
	signpost 11, 45, $0, MapRoute36Signpost1Script
	signpost 7, 55, $0, MapRoute36Signpost2Script
	signpost 7, 21, $0, MapRoute36Signpost3Script

	; people-events
	db 9
	person_event $27, 17, 24, $9, $0, 255, 255, $92, 3, TrainerPsychicMark, $ffff
	person_event $27, 18, 35, $8, $0, 255, 255, $92, 5, TrainerSchoolboyAlan1, $ffff
	person_event $f4, 13, 39, $17, $0, 255, 255, $0, 0, UnknownScript_0x19403c, $06f8
	person_event $28, 12, 55, $5, $2, 255, 255, $0, 0, UnknownScript_0x1940e0, $ffff
	person_event $3a, 13, 48, $8, $0, 255, 255, $0, 0, UnknownScript_0x1940b9, $ffff
	person_event $5d, 8, 25, $1, $0, 255, 255, $0, 0, UnknownScript_0x194247, $ffff
	person_event $27, 10, 50, $2, $11, 255, 255, $0, 0, UnknownScript_0x194201, $075a
	person_event $28, 16, 37, $6, $0, 255, 255, $90, 0, UnknownScript_0x19408c, $0769
	person_event $63, 10, 25, $1, $0, 255, 255, $90, 0, ObjectEvent, $07b0
; 0x194b19

