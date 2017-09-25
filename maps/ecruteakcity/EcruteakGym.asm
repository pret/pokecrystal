const_value set 2
	const ECRUTEAKGYM_MORTY
	const ECRUTEAKGYM_SAGE1
	const ECRUTEAKGYM_SAGE2
	const ECRUTEAKGYM_GRANNY1
	const ECRUTEAKGYM_GRANNY2
	const ECRUTEAKGYM_GYM_GUY
	const ECRUTEAKGYM_GRAMPS

EcruteakGym_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x99d53, 0
	dw UnknownScript_0x99d57, 0

.MapCallbacks:
	db 0

UnknownScript_0x99d53:
	priorityjump UnknownScript_0x99dc6
	end

UnknownScript_0x99d57:
	end

MortyScript_0x99d58:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MORTY
	iftrue .FightDone
	writetext UnknownText_0x99e65
	waitbutton
	closetext
	winlosstext UnknownText_0x9a00a, 0
	loadtrainer MORTY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MORTY
	opentext
	writetext UnknownText_0x9a043
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_FOGBADGE
	checkcode VAR_BADGES
	scall EcruteakGymTriggerRockets
	domaptrigger ECRUTEAK_HOUSE, $1
	setevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_RANG_CLEAR_BELL_2
.FightDone:
	checkevent EVENT_GOT_TM30_SHADOW_BALL
	iftrue UnknownScript_0x99db1
	setevent EVENT_BEAT_SAGE_JEFFREY
	setevent EVENT_BEAT_SAGE_PING
	setevent EVENT_BEAT_MEDIUM_MARTHA
	setevent EVENT_BEAT_MEDIUM_GRACE
	writetext UnknownText_0x9a059
	buttonsound
	verbosegiveitem TM_SHADOW_BALL
	iffalse UnknownScript_0x99db5
	setevent EVENT_GOT_TM30_SHADOW_BALL
	writetext UnknownText_0x9a0ec
	waitbutton
	closetext
	end

UnknownScript_0x99db1:
	writetext UnknownText_0x9a145
	waitbutton
UnknownScript_0x99db5:
	closetext
	end

EcruteakGymTriggerRockets:
	if_equal 7, .RadioTowerRockets
	if_equal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

UnknownScript_0x99dc6:
	applymovement PLAYER, MovementData_0x99e5d
	applymovement ECRUTEAKGYM_GRAMPS, MovementData_0x99e63
	opentext
	writetext UnknownText_0x9a49c
	waitbutton
	closetext
	follow PLAYER, ECRUTEAKGYM_GRAMPS
	applymovement PLAYER, MovementData_0x99e5f
	stopfollow
	special FadeOutPalettes
	playsound SFX_ENTER_DOOR
	waitsfx
	warp ECRUTEAK_CITY, $6, $1b
	end

TrainerSageJeffrey:
	trainer EVENT_BEAT_SAGE_JEFFREY, SAGE, JEFFREY, SageJeffreySeenText, SageJeffreyBeatenText, 0, SageJeffreyScript

SageJeffreyScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x9a263
	waitbutton
	closetext
	end

TrainerSagePing:
	trainer EVENT_BEAT_SAGE_PING, SAGE, PING, SagePingSeenText, SagePingBeatenText, 0, SagePingScript

SagePingScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x9a2b7
	waitbutton
	closetext
	end

TrainerMediumMartha:
	trainer EVENT_BEAT_MEDIUM_MARTHA, MEDIUM, MARTHA, MediumMarthaSeenText, MediumMarthaBeatenText, 0, MediumMarthaScript

MediumMarthaScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x9a318
	waitbutton
	closetext
	end

TrainerMediumGrace:
	trainer EVENT_BEAT_MEDIUM_GRACE, MEDIUM, GRACE, MediumGraceSeenText, MediumGraceBeatenText, 0, MediumGraceScript

MediumGraceScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x9a38a
	waitbutton
	closetext
	end

EcruteakGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MORTY
	iftrue .EcruteakGymGuyWinScript
	writetext EcruteakGymGuyText
	waitbutton
	closetext
	end

.EcruteakGymGuyWinScript:
	writetext EcruteakGymGuyWinText
	waitbutton
	closetext
	end

EcruteakGymStatue:
	checkflag ENGINE_FOGBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext MORTY, 1, $1
	jumpstd gymstatue2

MovementData_0x99e5d:
	step UP
	step_end

MovementData_0x99e5f:
	fix_facing
	slow_step DOWN
	remove_fixed_facing
	step_end

MovementData_0x99e63:
	slow_step DOWN
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
	warp_def $11, $4, 10, ECRUTEAK_CITY
	warp_def $11, $5, 10, ECRUTEAK_CITY
	warp_def $e, $4, 4, ECRUTEAK_GYM
	warp_def $4, $2, 3, ECRUTEAK_GYM
	warp_def $4, $3, 3, ECRUTEAK_GYM
	warp_def $4, $4, 3, ECRUTEAK_GYM
	warp_def $5, $4, 3, ECRUTEAK_GYM
	warp_def $7, $6, 3, ECRUTEAK_GYM
	warp_def $4, $7, 3, ECRUTEAK_GYM
	warp_def $6, $2, 3, ECRUTEAK_GYM
	warp_def $6, $3, 3, ECRUTEAK_GYM
	warp_def $6, $4, 3, ECRUTEAK_GYM
	warp_def $6, $5, 3, ECRUTEAK_GYM
	warp_def $6, $7, 3, ECRUTEAK_GYM
	warp_def $7, $7, 3, ECRUTEAK_GYM
	warp_def $8, $4, 3, ECRUTEAK_GYM
	warp_def $8, $5, 3, ECRUTEAK_GYM
	warp_def $8, $6, 3, ECRUTEAK_GYM
	warp_def $8, $7, 3, ECRUTEAK_GYM
	warp_def $8, $2, 3, ECRUTEAK_GYM
	warp_def $9, $2, 3, ECRUTEAK_GYM
	warp_def $a, $2, 3, ECRUTEAK_GYM
	warp_def $b, $2, 3, ECRUTEAK_GYM
	warp_def $a, $4, 3, ECRUTEAK_GYM
	warp_def $a, $5, 3, ECRUTEAK_GYM
	warp_def $c, $2, 3, ECRUTEAK_GYM
	warp_def $c, $3, 3, ECRUTEAK_GYM
	warp_def $c, $4, 3, ECRUTEAK_GYM
	warp_def $c, $5, 3, ECRUTEAK_GYM
	warp_def $a, $7, 3, ECRUTEAK_GYM
	warp_def $b, $7, 3, ECRUTEAK_GYM
	warp_def $c, $7, 3, ECRUTEAK_GYM
	warp_def $d, $7, 3, ECRUTEAK_GYM

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 15, 3, SIGNPOST_READ, EcruteakGymStatue
	signpost 15, 6, SIGNPOST_READ, EcruteakGymStatue

.PersonEvents:
	db 7
	person_event SPRITE_MORTY, 1, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, MortyScript_0x99d58, -1
	person_event SPRITE_SAGE, 7, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerSageJeffrey, -1
	person_event SPRITE_SAGE, 13, 3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSagePing, -1
	person_event SPRITE_GRANNY, 5, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 1, TrainerMediumMartha, -1
	person_event SPRITE_GRANNY, 9, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 1, TrainerMediumGrace, -1
	person_event SPRITE_GYM_GUY, 15, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, EcruteakGymGuyScript, -1
	person_event SPRITE_GRAMPS, 14, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_GYM_GRAMPS
