RadioTower2F_MapScriptHeader: ; 0x5d6fb
	; trigger count
	db 0

	; callback count
	db 0
; 0x5d6fd

UnknownScript_0x5d6fd: ; 0x5d6fd
	end
; 0x5d6fe

SuperNerdScript_0x5d6fe: ; 0x5d6fe
	jumptextfaceplayer UnknownText_0x5d924
; 0x5d701

TeacherScript_0x5d701: ; 0x5d701
	faceplayer
	loadfont
	checkbit2 $0013
	iftrue UnknownScript_0x5d70f
	2writetext UnknownText_0x5d956
	closetext
	loadmovesprites
	end
; 0x5d70f

UnknownScript_0x5d70f: ; 0x5d70f
	2writetext UnknownText_0x5d983
	closetext
	loadmovesprites
	end
; 0x5d715

JigglypuffScript_0x5d715: ; 0x5d715
	loadfont
	2writetext UnknownText_0x5d9b6
	cry JIGGLYPUFF
	closetext
	loadmovesprites
	end
; 0x5d71f

BlackBeltScript_0x5d71f: ; 0x5d71f
	jumptextfaceplayer UnknownText_0x5d9cb
; 0x5d722

BlackBeltScript_0x5d722: ; 0x5d722
	jumptextfaceplayer UnknownText_0x5da44
; 0x5d725

TrainerGruntM4: ; 0x5d725
	; bit/flag number
	dw $4f4

	; trainer group && trainer id
	db GRUNTM, 4

	; text when seen
	dw GruntM4SeenText

	; text when trainer beaten
	dw GruntM4BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntM4Script
; 0x5d731

GruntM4Script: ; 0x5d731
	talkaftercancel
	loadfont
	2writetext UnknownText_0x5db07
	closetext
	loadmovesprites
	end
; 0x5d739

TrainerGruntM5: ; 0x5d739
	; bit/flag number
	dw $4f5

	; trainer group && trainer id
	db GRUNTM, 5

	; text when seen
	dw GruntM5SeenText

	; text when trainer beaten
	dw GruntM5BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntM5Script
; 0x5d745

GruntM5Script: ; 0x5d745
	talkaftercancel
	loadfont
	2writetext UnknownText_0x5db99
	closetext
	loadmovesprites
	end
; 0x5d74d

TrainerGruntM6: ; 0x5d74d
	; bit/flag number
	dw $4f6

	; trainer group && trainer id
	db GRUNTM, 6

	; text when seen
	dw GruntM6SeenText

	; text when trainer beaten
	dw GruntM6BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntM6Script
; 0x5d759

GruntM6Script: ; 0x5d759
	talkaftercancel
	loadfont
	2writetext UnknownText_0x5dc00
	closetext
	loadmovesprites
	end
; 0x5d761

TrainerGruntF2: ; 0x5d761
	; bit/flag number
	dw $511

	; trainer group && trainer id
	db GRUNTF, 2

	; text when seen
	dw GruntF2SeenText

	; text when trainer beaten
	dw GruntF2BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntF2Script
; 0x5d76d

GruntF2Script: ; 0x5d76d
	talkaftercancel
	loadfont
	2writetext UnknownText_0x5dcd0
	closetext
	loadmovesprites
	end
; 0x5d775

BuenaScript_0x5d775: ; 0x5d775
	faceplayer
	loadfont
	checkbit2 $0013
	iftrue UnknownScript_0x5d865
	checkevent EVENT_MET_BUENA
	iffalse UnknownScript_0x5d800
	checkbit2 $0060
	iftrue UnknownScript_0x5d82f
	checkcode $a
	if_greater_than $12, UnknownScript_0x5d893
	checkbit2 $005f
	iffalse UnknownScript_0x5d80a
	checkitem BLUE_CARD
	iffalse UnknownScript_0x5d86b
	checkcode $18
	if_equal $1e, UnknownScript_0x5d87f
	playmusic $0060
	2writetext UnknownText_0x5de35
	special $00a3
	iffalse UnknownScript_0x5d81e
	2writetext UnknownText_0x5de84
	closetext
	loadmovesprites
	spriteface $b, $3
	checkcode $9
	if_not_equal $3, UnknownScript_0x5d7be
	applymovement $0, MovementData_0x5d921
UnknownScript_0x5d7be: ; 0x5d7be
	spriteface $0, $3
	loadfont
	2writetext UnknownText_0x5dedd
	closetext
	loadmovesprites
	spriteface $b, $0
	refreshscreen $0
	special $0092
	loadmovesprites
	iffalse UnknownScript_0x5d845
	loadfont
	2writetext UnknownText_0x5dfc1
	closetext
	loadmovesprites
	checkcode $18
	addvar $1
	writevarcode $18
	waitbutton
	playsound $0022
	setbit2 $0060
	pause 20
	spriteface $b, $3
	loadfont
	2writetext UnknownText_0x5e054
	closetext
	loadmovesprites
	special $006a
	pause 20
	special $003d
	checkcode $18
	if_equal $1e, UnknownScript_0x5d8a4
	end
; 0x5d800

UnknownScript_0x5d800: ; 0x5d800
	2writetext UnknownText_0x5dcf4
	keeptextopen
	setevent EVENT_MET_BUENA
	verbosegiveitem BLUE_CARD, 1
UnknownScript_0x5d80a: ; 0x5d80a
	2writetext UnknownText_0x5de10
	closetext
	loadmovesprites
	checkcellnum $25
	iftrue UnknownScript_0x5d81a
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue UnknownScript_0x5d8cc
UnknownScript_0x5d81a: ; 0x5d81a
	spriteface $b, $3
	end
; 0x5d81e

UnknownScript_0x5d81e: ; 0x5d81e
	2writetext UnknownText_0x5df29
	closetext
	loadmovesprites
	spriteface $b, $3
	special $006a
	pause 20
	special $003d
	end
; 0x5d82f

UnknownScript_0x5d82f: ; 0x5d82f
	2writetext UnknownText_0x5df6c
	closetext
	loadmovesprites
	checkcellnum $25
	iftrue UnknownScript_0x5d83f
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue UnknownScript_0x5d8cc
UnknownScript_0x5d83f: ; 0x5d83f
	spriteface $b, $3
	pause 10
	end
; 0x5d845

UnknownScript_0x5d845: ; 0x5d845
	setbit2 $0060
	loadfont
	2writetext UnknownText_0x5e01c
	closetext
	loadmovesprites
	spriteface $b, $3
	pause 20
	loadfont
	2writetext UnknownText_0x5e054
	closetext
	loadmovesprites
	spriteface $b, $3
	special $006a
	pause 20
	special $003d
	end
; 0x5d865

UnknownScript_0x5d865: ; 0x5d865
	2writetext UnknownText_0x5e0c2
	closetext
	loadmovesprites
	end
; 0x5d86b

UnknownScript_0x5d86b: ; 0x5d86b
	2writetext UnknownText_0x5e192
	closetext
	loadmovesprites
	checkcellnum $25
	iftrue UnknownScript_0x5d87b
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue UnknownScript_0x5d8cc
UnknownScript_0x5d87b: ; 0x5d87b
	spriteface $b, $3
	end
; 0x5d87f

UnknownScript_0x5d87f: ; 0x5d87f
	2writetext UnknownText_0x5e0f1
	closetext
	loadmovesprites
	checkcellnum $25
	iftrue UnknownScript_0x5d88f
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue UnknownScript_0x5d8cc
UnknownScript_0x5d88f: ; 0x5d88f
	spriteface $b, $3
	end
; 0x5d893

UnknownScript_0x5d893: ; 0x5d893
	2writetext UnknownText_0x5e131
	closetext
	loadmovesprites
	checkcellnum $25
	iftrue UnknownScript_0x5d8a3
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue UnknownScript_0x5d8cc
UnknownScript_0x5d8a3: ; 0x5d8a3
	end
; 0x5d8a4

UnknownScript_0x5d8a4: ; 0x5d8a4
	checkcellnum $25
	iftrue UnknownScript_0x5d8fe
	pause 20
	spriteface $b, $0
	pause 15
	spriteface $0, $1
	pause 15
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue UnknownScript_0x5d8cc
	showemote $0, $b, 15
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	loadfont
	2writetext UnknownText_0x5e1ee
	2jump UnknownScript_0x5d8d0
; 0x5d8cc

UnknownScript_0x5d8cc: ; 0x5d8cc
	loadfont
	2writetext UnknownText_0x5e2bf
UnknownScript_0x5d8d0: ; 0x5d8d0
	askforphonenumber $25
	if_equal $1, UnknownScript_0x5d8f6
	if_equal $2, UnknownScript_0x5d8ed
	2writetext UnknownText_0x5e2f3
	playsound $0093
	waitbutton
	keeptextopen
	2writetext UnknownText_0x5e310
	closetext
	loadmovesprites
	spriteface $b, $3
	addcellnum $25
	end
; 0x5d8ed

UnknownScript_0x5d8ed: ; 0x5d8ed
	2writetext UnknownText_0x5e33c
	closetext
	loadmovesprites
	spriteface $b, $3
	end
; 0x5d8f6

UnknownScript_0x5d8f6: ; 0x5d8f6
	2writetext UnknownText_0x5e35e
	closetext
	loadmovesprites
	spriteface $b, $3
UnknownScript_0x5d8fe: ; 0x5d8fe
	end
; 0x5d8ff

ReceptionistScript_0x5d8ff: ; 0x5d8ff
	faceplayer
	loadfont
	checkitem BLUE_CARD
	iffalse UnknownScript_0x5d90f
	2writetext UnknownText_0x5e392
	keeptextopen
	special $0093
	loadmovesprites
	end
; 0x5d90f

UnknownScript_0x5d90f: ; 0x5d90f
	2writetext UnknownText_0x5e3d8
	keeptextopen
	loadmovesprites
	end
; 0x5d915

MapRadioTower2FSignpost0Script: ; 0x5d915
	jumptext UnknownText_0x5e426
; 0x5d918

MapRadioTower2FSignpost1Script: ; 0x5d918
	jumptext UnknownText_0x5e430
; 0x5d91b

MapRadioTower2FSignpost5Script: ; 0x5d91b
	jumptext UnknownText_0x5e463
; 0x5d91e

MapRadioTower2FSignpost4Script: ; 0x5d91e
	jumpstd $0003
; 0x5d921

MovementData_0x5d921: ; 0x5d921
	slow_step_down
	slow_step_right
	step_end
; 0x5d924

UnknownText_0x5d924: ; 0x5d924
	db $0, "You can listen to", $4f
	db "the radio any-", $55
	db "where. Tune in!", $57
; 0x5d956

UnknownText_0x5d956: ; 0x5d956
	db $0, "Lullabies on the", $4f
	db "radio may make", $55
	db "#MON sleep.", $57
; 0x5d983

UnknownText_0x5d983: ; 0x5d983
	db $0, "Why would they", $4f
	db "want to take over", $55
	db "the RADIO TOWER?", $57
; 0x5d9b6

UnknownText_0x5d9b6: ; 0x5d9b6
	db $0, "JIGGLYPUFF:", $4f
	db "Jiggly…", $57
; 0x5d9cb

UnknownText_0x5d9cb: ; 0x5d9cb
	db $0, "Sorry. Authorized", $4f
	db "personnel only", $55
	db "beyond this point.", $51
	db "It wasn't that way", $4f
	db "before.", $51
	db "There's something", $4f
	db "wrong with the", $55
	db "DIRECTOR…", $57
; 0x5da44

UnknownText_0x5da44: ; 0x5da44
	db $0, "Feel free to look", $4f
	db "around anywhere.", $51
	db "The DIRECTOR is", $4f
	db "nice again, just", $55
	db "as he was before.", $57
; 0x5da9b

GruntM4SeenText: ; 0x5da9b
	db $0, "Three years ago,", $4f
	db "TEAM ROCKET was", $55
	db "forced to disband.", $51
	db "But we're making a", $4f
	db "comeback here!", $57
; 0x5daf1

GruntM4BeatenText: ; 0x5daf1
	db $0, "Gwah! Don't get", $4f
	db "cute!", $57
; 0x5db07

UnknownText_0x5db07: ; 0x5db07
	db $0, "We won't let you", $4f
	db "ruin our plans", $55
	db "for our comeback!", $57
; 0x5db39

GruntM5SeenText: ; 0x5db39
	db $0, "We're TEAM ROCKET,", $4f
	db "the exploiters of", $55
	db "#MON!", $51
	db "We love being", $4f
	db "evil! Scared?", $57
; 0x5db80

GruntM5BeatenText: ; 0x5db80
	db $0, "You think you're a", $4f
	db "hero?", $57
; 0x5db99

UnknownText_0x5db99: ; 0x5db99
	db $0, "We're not always", $4f
	db "evil. We just do", $55
	db "whatever we like.", $57
; 0x5dbcd

GruntM6SeenText: ; 0x5dbcd
	db $0, "Hey, hey! Keep out", $4f
	db "of our way!", $57
; 0x5dbed

GruntM6BeatenText: ; 0x5dbed
	db $0, "Arggh. I give up.", $57
; 0x5dc00

UnknownText_0x5dc00: ; 0x5dc00
	db $0, "Our EXECUTIVES are", $4f
	db "trying to take", $55
	db "this place over.", $51
	db "They have some big", $4f
	db "plan. I wonder", $55
	db "what that is?", $57
; 0x5dc64

GruntF2SeenText: ; 0x5dc64
	db $0, "Hahaha!", $51
	db "How boring.", $4f
	db "It was far too", $51
	db "easy to take over", $4f
	db "this place!", $51
	db "Come on, keep me", $4f
	db "amused!", $57
; 0x5dcbf

GruntF2BeatenText: ; 0x5dcbf
	db $0, "Wh-who are you?", $57
; 0x5dcd0

UnknownText_0x5dcd0: ; 0x5dcd0
	db $0, "You beat me, and", $4f
	db "I won't forget it!", $57
; 0x5dcf4

UnknownText_0x5dcf4: ; 0x5dcf4
	db $0, "BUENA: Hi! I'm", $4f
	db "BUENA!", $51
	db "Do you know about", $4f
	db "a radio program", $55
	db "called PASSWORD?", $51
	db "If you can tell me", $4f
	db "the password from", $51
	db "the program, you", $4f
	db "will earn points.", $51
	db "Save up those", $4f
	db "points and trade", $51
	db "them to that sweet", $4f
	db "young lady over", $51
	db "there for some", $4f
	db "choice prizes!", $51
	db "Here you go!", $51
	db "It's your very own", $4f
	db "point card!", $57
; 0x5de10

UnknownText_0x5de10: ; 0x5de10
	db $0, "BUENA: Tune in to", $4f
	db "my PASSWORD SHOW!", $57
; 0x5de35

UnknownText_0x5de35: ; 0x5de35
	db $0, "BUENA: Hi!", $4f
	db "Did you tune in to", $55
	db "my radio show?", $51
	db "Do you remember", $4f
	db "today's password?", $57
; 0x5de84

UnknownText_0x5de84: ; 0x5de84
	db $0, "BUENA: Oh, wow!", $4f
	db "Thank you!", $51
	db "What was your name", $4f
	db "again?", $51
	db "…", $14, ", OK!", $51
	db "Come on, ", $14, ".", $4f
	db "Join the show.", $57
; 0x5dedd

UnknownText_0x5dedd: ; 0x5dedd
	db $0, "BUENA: Everyone", $4f
	db "ready?", $51
	db "I want to hear you", $4f
	db "shout out today's", $51
	db "password for", $4f
	db $14, "!", $57
; 0x5df29

UnknownText_0x5df29: ; 0x5df29
	db $0, "BUENA: Come back", $4f
	db "after you listen", $51
	db "to my show, OK?", $4f
	db "Catch ya later!", $57
; 0x5df6c

UnknownText_0x5df6c: ; 0x5df6c
	db $0, "BUENA: Sorry…", $51
	db "You get just one", $4f
	db "chance each day.", $51
	db "Come back tomorrow", $4f
	db "for another try!", $57
; 0x5dfc1

UnknownText_0x5dfc1: ; 0x5dfc1
	db $0, "BUENA: YIPPEE!", $4f
	db "That's right!", $51
	db "You did tune in!", $4f
	db "I'm so happy!", $51
	db "You earned one", $4f
	db "point! Congrats!", $57
; 0x5e01c

UnknownText_0x5e01c: ; 0x5e01c
	db $0, "BUENA: Aww…", $4f
	db "That's not it…", $51
	db "Did you forget the", $4f
	db "password?", $57
; 0x5e054

UnknownText_0x5e054: ; 0x5e054
	db $0, "BUENA: Yup! Our", $4f
	db "contestant was", $51
	db $14, ".", $4f
	db "Thanks for coming!", $51
	db "I hope all you", $4f
	db "listeners will", $51
	db "come too!", $4f
	db "I'll be waiting!", $57
; 0x5e0c2

UnknownText_0x5e0c2: ; 0x5e0c2
	db $0, "BUENA: Huh?", $4f
	db "Today's password?", $51
	db "HELP, of course!", $57
; 0x5e0f1

UnknownText_0x5e0f1: ; 0x5e0f1
	db $0, "BUENA: Your BLUE", $4f
	db "CARD's full.", $51
	db "Trade it in for a", $4f
	db "fabulous prize!", $57
; 0x5e131

UnknownText_0x5e131: ; 0x5e131
	db $0, "BUENA: Tune in to", $4f
	db "PASSWORD every", $51
	db "night from six to", $4f
	db "midnight!", $51
	db "Tune in, then drop", $4f
	db "in for a visit!", $57
; 0x5e192

UnknownText_0x5e192: ; 0x5e192
	db $0, "BUENA: Oh? You", $4f
	db "forgot to bring", $55
	db "your BLUE CARD?", $51
	db "I can't give you", $4f
	db "points if you", $55
	db "don't have it.", $57
; 0x5e1ee

UnknownText_0x5e1ee: ; 0x5e1ee
	db $0, "BUENA: Oh! Your", $4f
	db "BLUE CARD reached", $51
	db "30 points today!", $4f
	db "That's so wild!", $51
	db "Hmm… There isn't a", $4f
	db "prize for hitting", $55
	db "30 points, but…", $51
	db "You came by so", $4f
	db "often, ", $14, ".", $51
	db "I'll make you a", $4f
	db "special deal!", $51
	db "How would you like", $4f
	db "my phone number?", $57
; 0x5e2bf

UnknownText_0x5e2bf: ; 0x5e2bf
	db $0, "BUENA: ", $14, ",", $4f
	db "do you want to", $51
	db "register my phone", $4f
	db "number?", $57
; 0x5e2f3

UnknownText_0x5e2f3: ; 0x5e2f3
	db $0, $52, " registered", $4f
	db "BUENA's number.", $57
; 0x5e310

UnknownText_0x5e310: ; 0x5e310
	db $0, "BUENA: I look", $4f
	db "forward to hearing", $55
	db "from you!", $57
; 0x5e33c

UnknownText_0x5e33c: ; 0x5e33c
	db $0, "BUENA: Aww… It's a", $4f
	db "special prize…", $57
; 0x5e35e

UnknownText_0x5e35e: ; 0x5e35e
	db $0, "BUENA: ", $14, ",", $4f
	db "your phone list", $51
	db "has no room left", $4f
	db "for me…", $57
; 0x5e392

UnknownText_0x5e392: ; 0x5e392
	db $0, "You can cash in", $4f
	db "your saved points", $51
	db "for a lovely prize", $4f
	db "of your choice!", $57
; 0x5e3d8

UnknownText_0x5e3d8: ; 0x5e3d8
	db $0, "You can't trade in", $4f
	db "points without", $55
	db "your BLUE CARD.", $51
	db "Don't forget your", $4f
	db "BLUE CARD!", $57
; 0x5e426

UnknownText_0x5e426: ; 0x5e426
	db $0, "2F SALES", $57
; 0x5e430

UnknownText_0x5e430: ; 0x5e430
	db $0, "PROF.OAK'S #MON", $4f
	db "TALK", $51
	db "The Hottest Show", $4f
	db "on the Air!", $57
; 0x5e463

UnknownText_0x5e463: ; 0x5e463
	db $0, "Anywhere, Anytime", $4f
	db "#MON Radio", $57
; 0x5e481

RadioTower2F_MapEventHeader: ; 0x5e481
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $0, $0, 1, GROUP_RADIO_TOWER_3F, MAP_RADIO_TOWER_3F
	warp_def $0, $f, 3, GROUP_RADIO_TOWER_1F, MAP_RADIO_TOWER_1F

	; xy triggers
	db 0

	; signposts
	db 6
	signpost 0, 3, $0, MapRadioTower2FSignpost0Script
	signpost 0, 5, $0, MapRadioTower2FSignpost1Script
	signpost 1, 9, $0, MapRadioTower2FSignpost4Script
	signpost 1, 10, $0, MapRadioTower2FSignpost4Script
	signpost 1, 11, $0, MapRadioTower2FSignpost4Script
	signpost 0, 13, $0, MapRadioTower2FSignpost5Script

	; people-events
	db 11
	person_event SPRITE_SUPER_NERD, 10, 10, $8, $0, 255, 255, $a0, 0, SuperNerdScript_0x5d6fe, $06cf
	person_event SPRITE_TEACHER, 6, 21, $5, $1, 255, 255, $80, 0, TeacherScript_0x5d701, $ffff
	person_event SPRITE_ROCKET, 8, 5, $7, $0, 255, 255, $2, 3, TrainerGruntM4, $06ce
	person_event SPRITE_ROCKET, 8, 12, $6, $0, 255, 255, $2, 3, TrainerGruntM5, $06ce
	person_event SPRITE_ROCKET, 5, 8, $6, $0, 255, 255, $2, 2, TrainerGruntM6, $06ce
	person_event SPRITE_ROCKET_GIRL, 9, 14, $7, $0, 255, 255, $82, 3, TrainerGruntF2, $06ce
	person_event SPRITE_BLACK_BELT, 5, 4, $6, $0, 255, 255, $0, 0, BlackBeltScript_0x5d71f, $06d1
	person_event SPRITE_BLACK_BELT, 5, 5, $6, $0, 255, 255, $0, 0, BlackBeltScript_0x5d722, $06d0
	person_event SPRITE_JIGGLYPUFF, 5, 16, $16, $0, 255, 255, $0, 0, JigglypuffScript_0x5d715, $ffff
	person_event SPRITE_BUENA, 9, 18, $9, $0, 255, 255, $80, 0, BuenaScript_0x5d775, $ffff
	person_event SPRITE_RECEPTIONIST, 11, 16, $9, $0, 255, 255, $a0, 0, ReceptionistScript_0x5d8ff, $06cf
; 0x5e53e

