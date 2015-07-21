EcruteakGym_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x99d53, $0000
	dw UnknownScript_0x99d57, $0000

.MapCallbacks:
	db 0

UnknownScript_0x99d53:
	priorityjump UnknownScript_0x99dc6
	end

UnknownScript_0x99d57:
	end

MortyScript_0x99d58:
	faceplayer
	loadfont
	checkevent EVENT_BEAT_MORTY
	iftrue .FightDone
	writetext UnknownText_0x99e65
	closetext
	loadmovesprites
	winlosstext UnknownText_0x9a00a, $0000
	loadtrainer MORTY, 1
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_MORTY
	loadfont
	writetext UnknownText_0x9a043
	playsound SFX_GET_BADGE
	waitbutton
	setflag ENGINE_FOGBADGE
	checkcode VAR_BADGES
	scall EcruteakGymTriggerRockets
	domaptrigger GROUP_ECRUTEAK_HOUSE, MAP_ECRUTEAK_HOUSE, $1
	setevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_RANG_CLEAR_BELL_2
.FightDone
	checkevent EVENT_GOT_TM30_SHADOW_BALL
	iftrue UnknownScript_0x99db1
	setevent EVENT_BEAT_SAGE_JEFFREY
	setevent EVENT_BEAT_SAGE_PING
	setevent EVENT_BEAT_MEDIUM_MARTHA
	setevent EVENT_BEAT_MEDIUM_GRACE
	writetext UnknownText_0x9a059
	keeptextopen
	verbosegiveitem TM_SHADOW_BALL, 1
	iffalse UnknownScript_0x99db5
	setevent EVENT_GOT_TM30_SHADOW_BALL
	writetext UnknownText_0x9a0ec
	closetext
	loadmovesprites
	end

UnknownScript_0x99db1:
	writetext UnknownText_0x9a145
	closetext
UnknownScript_0x99db5:
	loadmovesprites
	end

EcruteakGymTriggerRockets:
	if_equal 7, .RadioTowerRockets
	if_equal 6, .GoldenrodRockets
	end

.GoldenrodRockets
	jumpstd goldenrodrockets

.RadioTowerRockets
	jumpstd radiotowerrockets

UnknownScript_0x99dc6:
	applymovement $0, MovementData_0x99e5d
	applymovement $8, MovementData_0x99e63
	loadfont
	writetext UnknownText_0x9a49c
	closetext
	loadmovesprites
	follow $0, $8
	applymovement $0, MovementData_0x99e5f
	stopfollow
	special FadeBlackBGMap
	playsound SFX_ENTER_DOOR
	waitbutton
	warp GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY, $6, $1b
	end

TrainerSageJeffrey:
	trainer EVENT_BEAT_SAGE_JEFFREY, SAGE, JEFFREY, SageJeffreySeenText, SageJeffreyBeatenText, $0000, SageJeffreyScript

SageJeffreyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x9a263
	closetext
	loadmovesprites
	end

TrainerSagePing:
	trainer EVENT_BEAT_SAGE_PING, SAGE, PING, SagePingSeenText, SagePingBeatenText, $0000, SagePingScript

SagePingScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x9a2b7
	closetext
	loadmovesprites
	end

TrainerMediumMartha:
	trainer EVENT_BEAT_MEDIUM_MARTHA, MEDIUM, MARTHA, MediumMarthaSeenText, MediumMarthaBeatenText, $0000, MediumMarthaScript

MediumMarthaScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x9a318
	closetext
	loadmovesprites
	end

TrainerMediumGrace:
	trainer EVENT_BEAT_MEDIUM_GRACE, MEDIUM, GRACE, MediumGraceSeenText, MediumGraceBeatenText, $0000, MediumGraceScript

MediumGraceScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x9a38a
	closetext
	loadmovesprites
	end

EcruteakGymGuyScript:
	faceplayer
	loadfont
	checkevent EVENT_BEAT_MORTY
	iftrue .EcruteakGymGuyWinScript
	writetext EcruteakGymGuyText
	closetext
	loadmovesprites
	end

.EcruteakGymGuyWinScript
	writetext EcruteakGymGuyWinText
	closetext
	loadmovesprites
	end

EcruteakGymStatue:
	checkflag ENGINE_FOGBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten
	trainertotext MORTY, 1, $1
	jumpstd gymstatue2

MovementData_0x99e5d:
	step_up
	step_end

MovementData_0x99e5f:
	fix_facing
	slow_step_down
	remove_fixed_facing
	step_end

MovementData_0x99e63:
	slow_step_down
	step_end

UnknownText_0x99e65:
	text "Good of you to"
	line "have come."

	para "Here in ECRUTEAK,"
	line "#MON have been"
	cont "revered."

	para "It's said that a"
	line "rainbow-colored"

	para "#MON will come"
	line "down to appear"

	para "before a truly"
	line "powerful trainer."

	para "I believed that"
	line "tale, so I have"

	para "secretly trained"
	line "here all my life."

	para "As a result, I can"
	line "now see what"
	cont "others cannot."

	para "Just a bit more…"

	para "With a little"
	line "more, I could see"

	para "a future in which"
	line "I meet the #MON"
	cont "of rainbow colors."

	para "You're going to"
	line "help me reach that"
	cont "level!"
	done

UnknownText_0x9a00a:
	text "I'm not good"
	line "enough yet…"

	para "All right. This"
	line "BADGE is yours."
	done

UnknownText_0x9a043:
	text "<PLAYER> received"
	line "FOGBADGE."
	done

UnknownText_0x9a059:
	text "By having FOG-"
	line "BADGE, #MON up"

	para "to L50 will obey"
	line "you."

	para "Also, #MON that"
	line "know SURF will be"

	para "able to use that"
	line "move anytime."

	para "I want you to have"
	line "this too."
	done

UnknownText_0x9a0ec:
	text "It's SHADOW BALL."
	line "It causes damage"

	para "and may reduce"
	line "SPCL.DEF."

	para "Use it if it"
	line "appeals to you."
	done

UnknownText_0x9a145:
	text "I see…"

	para "Your journey has"
	line "taken you to far-"
	cont "away places."

	para "And you have wit-"
	line "nessed much more"
	cont "than I."

	para "I envy you for"
	line "that…"
	done

SageJeffreySeenText:
	text "I spent the spring"
	line "with my #MON."

	para "Then summer, fall"
	line "and winter…"

	para "Then spring came"
	line "again. We have"

	para "lived together"
	line "for a long time."
	done

SageJeffreyBeatenText:
	text "Wins and losses, I"
	line "experienced both."
	done

UnknownText_0x9a263:
	text "Where did #MON"
	line "come from?"
	done

SagePingSeenText:
	text "Can you inflict"
	line "any damage on our"
	cont "#MON?"
	done

SagePingBeatenText:
	text "Ah! Well done!"
	done

UnknownText_0x9a2b7:
	text "We use only ghost-"
	line "type #MON."

	para "No normal-type"
	line "attack can harm"
	cont "them!"
	done

MediumMarthaSeenText:
	text "I shall win!"
	done

MediumMarthaBeatenText:
	text "I, I, I lost!"
	done

UnknownText_0x9a318:
	text "The one who wants"
	line "to win most--will!"
	done

MediumGraceSeenText:
	text "Stumped by our in-"
	line "visible floor?"

	para "Defeat me if you"
	line "want a hint!"
	done

MediumGraceBeatenText:
	text "Wha-what?"
	done

UnknownText_0x9a38a:
	text "Fine. I shall tell"
	line "you the secret of"

	para "the invisible"
	line "floor."

	para "The path is right"
	line "before our eyes!"
	done

EcruteakGymGuyText:
	text "The trainers here"
	line "have secret mo-"
	cont "tives."

	para "If you win, they"
	line "may tell you some"

	para "deep secrets about"
	line "ECRUTEAK."
	done

EcruteakGymGuyWinText:
	text "Whew, <PLAYER>."
	line "You did great!"

	para "I was cowering in"
	line "the corner out of"
	cont "pure terror!"
	done

UnknownText_0x9a49c:
	text "MORTY, the GYM"
	line "LEADER, is absent."

	para "Sorry, but you'll"
	line "have to leave."

	para "Hohohoho."
	done

EcruteakGym_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 33
	warp_def $11, $4, 10, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $11, $5, 10, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $e, $4, 4, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $4, $2, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $4, $3, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $4, $4, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $5, $4, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $7, $6, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $4, $7, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $6, $2, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $6, $3, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $6, $4, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $6, $5, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $6, $7, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $7, $7, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $8, $4, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $8, $5, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $8, $6, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $8, $7, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $8, $2, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $9, $2, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $a, $2, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $b, $2, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $a, $4, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $a, $5, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $c, $2, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $c, $3, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $c, $4, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $c, $5, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $a, $7, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $b, $7, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $c, $7, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $d, $7, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 15, 3, SIGNPOST_READ, EcruteakGymStatue
	signpost 15, 6, SIGNPOST_READ, EcruteakGymStatue

.PersonEvents:
	db 7
	person_event SPRITE_MORTY, 5, 9, OW_UP | $2, $0, -1, -1, (PAL_OW_BROWN << 4) | $80, 0, MortyScript_0x99d58, -1
	person_event SPRITE_SAGE, 11, 6, OW_LEFT | $1, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 1, TrainerSageJeffrey, -1
	person_event SPRITE_SAGE, 17, 7, OW_LEFT | $1, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 3, TrainerSagePing, -1
	person_event SPRITE_GRANNY, 9, 11, OW_LEFT | $0, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 1, TrainerMediumMartha, -1
	person_event SPRITE_GRANNY, 13, 11, OW_LEFT | $0, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 1, TrainerMediumGrace, -1
	person_event SPRITE_GYM_GUY, 19, 11, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, EcruteakGymGuyScript, -1
	person_event SPRITE_GRAMPS, 18, 8, OW_UP | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, ObjectEvent, EVENT_ECRUTEAK_GYM_GRAMPS
