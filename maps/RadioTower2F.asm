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
	checkflag $0013
	iftrue UnknownScript_0x5d70f
	writetext UnknownText_0x5d956
	closetext
	loadmovesprites
	end
; 0x5d70f

UnknownScript_0x5d70f: ; 0x5d70f
	writetext UnknownText_0x5d983
	closetext
	loadmovesprites
	end
; 0x5d715

JigglypuffScript_0x5d715: ; 0x5d715
	loadfont
	writetext UnknownText_0x5d9b6
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
	writetext UnknownText_0x5db07
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
	writetext UnknownText_0x5db99
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
	writetext UnknownText_0x5dc00
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
	writetext UnknownText_0x5dcd0
	closetext
	loadmovesprites
	end
; 0x5d775

BuenaScript_0x5d775: ; 0x5d775
	faceplayer
	loadfont
	checkflag $0013
	iftrue UnknownScript_0x5d865
	checkevent EVENT_MET_BUENA
	iffalse UnknownScript_0x5d800
	checkflag $0060
	iftrue UnknownScript_0x5d82f
	checkcode $a
	if_less_than $12, UnknownScript_0x5d893
	checkflag $005f
	iffalse UnknownScript_0x5d80a
	checkitem BLUE_CARD
	iffalse UnknownScript_0x5d86b
	checkcode $18
	if_equal $1e, UnknownScript_0x5d87f
	playmusic MUSIC_BUENAS_PASSWORD
	writetext UnknownText_0x5de35
	special Function4ae12
	iffalse UnknownScript_0x5d81e
	writetext UnknownText_0x5de84
	closetext
	loadmovesprites
	spriteface $b, $3
	checkcode $9
	if_not_equal $3, UnknownScript_0x5d7be
	applymovement $0, MovementData_0x5d921
UnknownScript_0x5d7be: ; 0x5d7be
	spriteface $0, $3
	loadfont
	writetext UnknownText_0x5dedd
	closetext
	loadmovesprites
	spriteface $b, $0
	refreshscreen $0
	special SpecialBuenasPassword
	loadmovesprites
	iffalse UnknownScript_0x5d845
	loadfont
	writetext UnknownText_0x5dfc1
	closetext
	loadmovesprites
	checkcode $18
	addvar $1
	writevarcode $18
	waitbutton
	playsound SFX_TRANSACTION
	setflag $0060
	pause 20
	spriteface $b, $3
	loadfont
	writetext UnknownText_0x5e054
	closetext
	loadmovesprites
	special Functionc48f
	pause 20
	special RestartMapMusic
	checkcode $18
	if_equal $1e, UnknownScript_0x5d8a4
	end
; 0x5d800

UnknownScript_0x5d800: ; 0x5d800
	writetext UnknownText_0x5dcf4
	keeptextopen
	setevent EVENT_MET_BUENA
	verbosegiveitem BLUE_CARD, 1
UnknownScript_0x5d80a: ; 0x5d80a
	writetext UnknownText_0x5de10
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
	writetext UnknownText_0x5df29
	closetext
	loadmovesprites
	spriteface $b, $3
	special Functionc48f
	pause 20
	special RestartMapMusic
	end
; 0x5d82f

UnknownScript_0x5d82f: ; 0x5d82f
	writetext UnknownText_0x5df6c
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
	setflag $0060
	loadfont
	writetext UnknownText_0x5e01c
	closetext
	loadmovesprites
	spriteface $b, $3
	pause 20
	loadfont
	writetext UnknownText_0x5e054
	closetext
	loadmovesprites
	spriteface $b, $3
	special Functionc48f
	pause 20
	special RestartMapMusic
	end
; 0x5d865

UnknownScript_0x5d865: ; 0x5d865
	writetext UnknownText_0x5e0c2
	closetext
	loadmovesprites
	end
; 0x5d86b

UnknownScript_0x5d86b: ; 0x5d86b
	writetext UnknownText_0x5e192
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
	writetext UnknownText_0x5e0f1
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
	writetext UnknownText_0x5e131
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
	writetext UnknownText_0x5e1ee
	jump UnknownScript_0x5d8d0
; 0x5d8cc

UnknownScript_0x5d8cc: ; 0x5d8cc
	loadfont
	writetext UnknownText_0x5e2bf
UnknownScript_0x5d8d0: ; 0x5d8d0
	askforphonenumber $25
	if_equal $1, UnknownScript_0x5d8f6
	if_equal $2, UnknownScript_0x5d8ed
	writetext UnknownText_0x5e2f3
	playsound SFX_REGISTER_PHONE_NUMBER
	waitbutton
	keeptextopen
	writetext UnknownText_0x5e310
	closetext
	loadmovesprites
	spriteface $b, $3
	addcellnum $25
	end
; 0x5d8ed

UnknownScript_0x5d8ed: ; 0x5d8ed
	writetext UnknownText_0x5e33c
	closetext
	loadmovesprites
	spriteface $b, $3
	end
; 0x5d8f6

UnknownScript_0x5d8f6: ; 0x5d8f6
	writetext UnknownText_0x5e35e
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
	writetext UnknownText_0x5e392
	keeptextopen
	special SpecialBuenaPrize
	loadmovesprites
	end
; 0x5d90f

UnknownScript_0x5d90f: ; 0x5d90f
	writetext UnknownText_0x5e3d8
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
	text "You can listen to"
	line "the radio any-"
	cont "where. Tune in!"
	done
; 0x5d956

UnknownText_0x5d956: ; 0x5d956
	text "Lullabies on the"
	line "radio may make"
	cont "#MON sleep."
	done
; 0x5d983

UnknownText_0x5d983: ; 0x5d983
	text "Why would they"
	line "want to take over"
	cont "the RADIO TOWER?"
	done
; 0x5d9b6

UnknownText_0x5d9b6: ; 0x5d9b6
	text "JIGGLYPUFF:"
	line "Jiggly…"
	done
; 0x5d9cb

UnknownText_0x5d9cb: ; 0x5d9cb
	text "Sorry. Authorized"
	line "personnel only"
	cont "beyond this point."

	para "It wasn't that way"
	line "before."

	para "There's something"
	line "wrong with the"
	cont "DIRECTOR…"
	done
; 0x5da44

UnknownText_0x5da44: ; 0x5da44
	text "Feel free to look"
	line "around anywhere."

	para "The DIRECTOR is"
	line "nice again, just"
	cont "as he was before."
	done
; 0x5da9b

GruntM4SeenText: ; 0x5da9b
	text "Three years ago,"
	line "TEAM ROCKET was"
	cont "forced to disband."

	para "But we're making a"
	line "comeback here!"
	done
; 0x5daf1

GruntM4BeatenText: ; 0x5daf1
	text "Gwah! Don't get"
	line "cute!"
	done
; 0x5db07

UnknownText_0x5db07: ; 0x5db07
	text "We won't let you"
	line "ruin our plans"
	cont "for our comeback!"
	done
; 0x5db39

GruntM5SeenText: ; 0x5db39
	text "We're TEAM ROCKET,"
	line "the exploiters of"
	cont "#MON!"

	para "We love being"
	line "evil! Scared?"
	done
; 0x5db80

GruntM5BeatenText: ; 0x5db80
	text "You think you're a"
	line "hero?"
	done
; 0x5db99

UnknownText_0x5db99: ; 0x5db99
	text "We're not always"
	line "evil. We just do"
	cont "whatever we like."
	done
; 0x5dbcd

GruntM6SeenText: ; 0x5dbcd
	text "Hey, hey! Keep out"
	line "of our way!"
	done
; 0x5dbed

GruntM6BeatenText: ; 0x5dbed
	text "Arggh. I give up."
	done
; 0x5dc00

UnknownText_0x5dc00: ; 0x5dc00
	text "Our EXECUTIVES are"
	line "trying to take"
	cont "this place over."

	para "They have some big"
	line "plan. I wonder"
	cont "what that is?"
	done
; 0x5dc64

GruntF2SeenText: ; 0x5dc64
	text "Hahaha!"

	para "How boring."
	line "It was far too"

	para "easy to take over"
	line "this place!"

	para "Come on, keep me"
	line "amused!"
	done
; 0x5dcbf

GruntF2BeatenText: ; 0x5dcbf
	text "Wh-who are you?"
	done
; 0x5dcd0

UnknownText_0x5dcd0: ; 0x5dcd0
	text "You beat me, and"
	line "I won't forget it!"
	done
; 0x5dcf4

UnknownText_0x5dcf4: ; 0x5dcf4
	text "BUENA: Hi! I'm"
	line "BUENA!"

	para "Do you know about"
	line "a radio program"
	cont "called PASSWORD?"

	para "If you can tell me"
	line "the password from"

	para "the program, you"
	line "will earn points."

	para "Save up those"
	line "points and trade"

	para "them to that sweet"
	line "young lady over"

	para "there for some"
	line "choice prizes!"

	para "Here you go!"

	para "It's your very own"
	line "point card!"
	done
; 0x5de10

UnknownText_0x5de10: ; 0x5de10
	text "BUENA: Tune in to"
	line "my PASSWORD SHOW!"
	done
; 0x5de35

UnknownText_0x5de35: ; 0x5de35
	text "BUENA: Hi!"
	line "Did you tune in to"
	cont "my radio show?"

	para "Do you remember"
	line "today's password?"
	done
; 0x5de84

UnknownText_0x5de84: ; 0x5de84
	text "BUENA: Oh, wow!"
	line "Thank you!"

	para "What was your name"
	line "again?"

	para "…", $14, ", OK!"

	para "Come on, ", $14, "."
	line "Join the show."
	done
; 0x5dedd

UnknownText_0x5dedd: ; 0x5dedd
	text "BUENA: Everyone"
	line "ready?"

	para "I want to hear you"
	line "shout out today's"

	para "password for"
	line $14, "!"
	done
; 0x5df29

UnknownText_0x5df29: ; 0x5df29
	text "BUENA: Come back"
	line "after you listen"

	para "to my show, OK?"
	line "Catch ya later!"
	done
; 0x5df6c

UnknownText_0x5df6c: ; 0x5df6c
	text "BUENA: Sorry…"

	para "You get just one"
	line "chance each day."

	para "Come back tomorrow"
	line "for another try!"
	done
; 0x5dfc1

UnknownText_0x5dfc1: ; 0x5dfc1
	text "BUENA: YIPPEE!"
	line "That's right!"

	para "You did tune in!"
	line "I'm so happy!"

	para "You earned one"
	line "point! Congrats!"
	done
; 0x5e01c

UnknownText_0x5e01c: ; 0x5e01c
	text "BUENA: Aww…"
	line "That's not it…"

	para "Did you forget the"
	line "password?"
	done
; 0x5e054

UnknownText_0x5e054: ; 0x5e054
	text "BUENA: Yup! Our"
	line "contestant was"

	para $14, "."
	line "Thanks for coming!"

	para "I hope all you"
	line "listeners will"

	para "come too!"
	line "I'll be waiting!"
	done
; 0x5e0c2

UnknownText_0x5e0c2: ; 0x5e0c2
	text "BUENA: Huh?"
	line "Today's password?"

	para "HELP, of course!"
	done
; 0x5e0f1

UnknownText_0x5e0f1: ; 0x5e0f1
	text "BUENA: Your BLUE"
	line "CARD's full."

	para "Trade it in for a"
	line "fabulous prize!"
	done
; 0x5e131

UnknownText_0x5e131: ; 0x5e131
	text "BUENA: Tune in to"
	line "PASSWORD every"

	para "night from six to"
	line "midnight!"

	para "Tune in, then drop"
	line "in for a visit!"
	done
; 0x5e192

UnknownText_0x5e192: ; 0x5e192
	text "BUENA: Oh? You"
	line "forgot to bring"
	cont "your BLUE CARD?"

	para "I can't give you"
	line "points if you"
	cont "don't have it."
	done
; 0x5e1ee

UnknownText_0x5e1ee: ; 0x5e1ee
	text "BUENA: Oh! Your"
	line "BLUE CARD reached"

	para "30 points today!"
	line "That's so wild!"

	para "Hmm… There isn't a"
	line "prize for hitting"
	cont "30 points, but…"

	para "You came by so"
	line "often, ", $14, "."

	para "I'll make you a"
	line "special deal!"

	para "How would you like"
	line "my phone number?"
	done
; 0x5e2bf

UnknownText_0x5e2bf: ; 0x5e2bf
	text "BUENA: ", $14, ","
	line "do you want to"

	para "register my phone"
	line "number?"
	done
; 0x5e2f3

UnknownText_0x5e2f3: ; 0x5e2f3
	text $52, " registered"
	line "BUENA's number."
	done
; 0x5e310

UnknownText_0x5e310: ; 0x5e310
	text "BUENA: I look"
	line "forward to hearing"
	cont "from you!"
	done
; 0x5e33c

UnknownText_0x5e33c: ; 0x5e33c
	text "BUENA: Aww… It's a"
	line "special prize…"
	done
; 0x5e35e

UnknownText_0x5e35e: ; 0x5e35e
	text "BUENA: ", $14, ","
	line "your phone list"

	para "has no room left"
	line "for me…"
	done
; 0x5e392

UnknownText_0x5e392: ; 0x5e392
	text "You can cash in"
	line "your saved points"

	para "for a lovely prize"
	line "of your choice!"
	done
; 0x5e3d8

UnknownText_0x5e3d8: ; 0x5e3d8
	text "You can't trade in"
	line "points without"
	cont "your BLUE CARD."

	para "Don't forget your"
	line "BLUE CARD!"
	done
; 0x5e426

UnknownText_0x5e426: ; 0x5e426
	text "2F SALES"
	done
; 0x5e430

UnknownText_0x5e430: ; 0x5e430
	text "PROF.OAK'S #MON"
	line "TALK"

	para "The Hottest Show"
	line "on the Air!"
	done
; 0x5e463

UnknownText_0x5e463: ; 0x5e463
	text "Anywhere, Anytime"
	line "#MON Radio"
	done
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
