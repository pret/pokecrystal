const_value set 2
	const ROUTE26_COOLTRAINER_M1
	const ROUTE26_COOLTRAINER_M2
	const ROUTE26_COOLTRAINER_F1
	const ROUTE26_COOLTRAINER_F2
	const ROUTE26_YOUNGSTER
	const ROUTE26_FISHER
	const ROUTE26_FRUIT_TREE
	const ROUTE26_POKE_BALL

Route26_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerCooltrainermJake:
	trainer EVENT_BEAT_COOLTRAINERM_JAKE, COOLTRAINERM, JAKE, CooltrainermJakeSeenText, CooltrainermJakeBeatenText, 0, CooltrainermJakeScript

CooltrainermJakeScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a4f08
	waitbutton
	closetext
	end

TrainerCooltrainermGaven3:
	trainer EVENT_BEAT_COOLTRAINERM_GAVEN, COOLTRAINERM, GAVEN3, CooltrainermGaven3SeenText, CooltrainermGaven3BeatenText, 0, CooltrainermGaven3Script

CooltrainermGaven3Script:
	writecode VAR_CALLERID, PHONE_COOLTRAINERM_GAVEN
	end_if_just_battled
	opentext
	checkflag ENGINE_GAVEN
	iftrue UnknownScript_0x1a4d79
	checkcellnum PHONE_COOLTRAINERM_GAVEN
	iftrue UnknownScript_0x1a4dcb
	checkevent EVENT_GAVEN_ASKED_FOR_PHONE_NUMBER
	iftrue UnknownScript_0x1a4d62
	writetext UnknownText_0x1a4fe4
	buttonsound
	setevent EVENT_GAVEN_ASKED_FOR_PHONE_NUMBER
	scall UnknownScript_0x1a4dbf
	jump UnknownScript_0x1a4d65

UnknownScript_0x1a4d62:
	scall UnknownScript_0x1a4dc3
UnknownScript_0x1a4d65:
	askforphonenumber PHONE_COOLTRAINERM_GAVEN
	if_equal $1, UnknownScript_0x1a4dd3
	if_equal $2, UnknownScript_0x1a4dcf
	trainertotext COOLTRAINERM, GAVEN3, $0
	scall UnknownScript_0x1a4dc7
	jump UnknownScript_0x1a4dcb

UnknownScript_0x1a4d79:
	scall UnknownScript_0x1a4dd7
	winlosstext CooltrainermGaven3BeatenText, 0
	copybytetovar wGavenFightCount
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight2:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer COOLTRAINERM, GAVEN3
	startbattle
	reloadmapafterbattle
	loadvar wGavenFightCount, 1
	clearflag ENGINE_GAVEN
	end

.LoadFight1:
	loadtrainer COOLTRAINERM, GAVEN1
	startbattle
	reloadmapafterbattle
	loadvar wGavenFightCount, 2
	clearflag ENGINE_GAVEN
	end

.LoadFight2:
	loadtrainer COOLTRAINERM, GAVEN2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_GAVEN
	end

UnknownScript_0x1a4dbf:
	jumpstd asknumber1m
	end

UnknownScript_0x1a4dc3:
	jumpstd asknumber2m
	end

UnknownScript_0x1a4dc7:
	jumpstd registerednumberm
	end

UnknownScript_0x1a4dcb:
	jumpstd numberacceptedm
	end

UnknownScript_0x1a4dcf:
	jumpstd numberdeclinedm
	end

UnknownScript_0x1a4dd3:
	jumpstd phonefullm
	end

UnknownScript_0x1a4dd7:
	jumpstd rematchm
	end

TrainerCooltrainerfJoyce:
	trainer EVENT_BEAT_COOLTRAINERF_JOYCE, COOLTRAINERF, JOYCE, CooltrainerfJoyceSeenText, CooltrainerfJoyceBeatenText, 0, CooltrainerfJoyceScript

CooltrainerfJoyceScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a50d7
	waitbutton
	closetext
	end

TrainerCooltrainerfBeth1:
	trainer EVENT_BEAT_COOLTRAINERF_BETH, COOLTRAINERF, BETH1, CooltrainerfBeth1SeenText, CooltrainerfBeth1BeatenText, 0, CooltrainerfBeth1Script

CooltrainerfBeth1Script:
	writecode VAR_CALLERID, PHONE_COOLTRAINERF_BETH
	end_if_just_battled
	opentext
	checkflag ENGINE_BETH
	iftrue UnknownScript_0x1a4e35
	checkcellnum PHONE_COOLTRAINERF_BETH
	iftrue UnknownScript_0x1a4e87
	checkevent EVENT_BETH_ASKED_FOR_PHONE_NUMBER
	iftrue UnknownScript_0x1a4e1e
	writetext UnknownText_0x1a51d9
	buttonsound
	setevent EVENT_BETH_ASKED_FOR_PHONE_NUMBER
	scall UnknownScript_0x1a4e7b
	jump UnknownScript_0x1a4e21

UnknownScript_0x1a4e1e:
	scall UnknownScript_0x1a4e7f
UnknownScript_0x1a4e21:
	askforphonenumber PHONE_COOLTRAINERF_BETH
	if_equal $1, UnknownScript_0x1a4e8f
	if_equal $2, UnknownScript_0x1a4e8b
	trainertotext COOLTRAINERF, BETH1, $0
	scall UnknownScript_0x1a4e83
	jump UnknownScript_0x1a4e87

UnknownScript_0x1a4e35:
	scall UnknownScript_0x1a4e93
	winlosstext CooltrainerfBeth1BeatenText, 0
	copybytetovar wBethFightCount
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight2:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer COOLTRAINERF, BETH1
	startbattle
	reloadmapafterbattle
	loadvar wBethFightCount, 1
	clearflag ENGINE_BETH
	end

.LoadFight1:
	loadtrainer COOLTRAINERF, BETH2
	startbattle
	reloadmapafterbattle
	loadvar wBethFightCount, 2
	clearflag ENGINE_BETH
	end

.LoadFight2:
	loadtrainer COOLTRAINERF, BETH3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_BETH
	end

UnknownScript_0x1a4e7b:
	jumpstd asknumber1f
	end

UnknownScript_0x1a4e7f:
	jumpstd asknumber2f
	end

UnknownScript_0x1a4e83:
	jumpstd registerednumberf
	end

UnknownScript_0x1a4e87:
	jumpstd numberacceptedf
	end

UnknownScript_0x1a4e8b:
	jumpstd numberdeclinedf
	end

UnknownScript_0x1a4e8f:
	jumpstd phonefullf
	end

UnknownScript_0x1a4e93:
	jumpstd rematchf
	end

TrainerPsychicRichard:
	trainer EVENT_BEAT_PSYCHIC_RICHARD, PSYCHIC_T, RICHARD, PsychicRichardSeenText, PsychicRichardBeatenText, 0, PsychicRichardScript

PsychicRichardScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a5278
	waitbutton
	closetext
	end

TrainerFisherScott:
	trainer EVENT_BEAT_FISHER_SCOTT, FISHER, SCOTT, FisherScottSeenText, FisherScottBeatenText, 0, FisherScottScript

FisherScottScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a5326
	waitbutton
	closetext
	end

Route26Sign:
	jumptext Route26SignText

FruitTreeScript_0x1a4ec2:
	fruittree FRUITTREE_ROUTE_26

Route26MaxElixer:
	itemball MAX_ELIXER

CooltrainermJakeSeenText:
	text "I'm making my"
	line "final preparations"

	para "for the #MON"
	line "LEAGUE."
	done

CooltrainermJakeBeatenText:
	text "I blew it!"
	done

UnknownText_0x1a4f08:
	text "It's going to be"
	line "tough to win at"
	cont "the LEAGUE."

	para "I need to do some"
	line "more training."

	para "I hear that the"
	line "LEAGUE's ELITE"

	para "FOUR are tougher"
	line "than GYM LEADERS."
	done

CooltrainermGaven3SeenText:
	text "By experiencing"
	line "tough battles, you"
	cont "gain power."
	done

CooltrainermGaven3BeatenText:
	text "Gaah! Life is even"
	line "tougher!"
	done

UnknownText_0x1a4fe4:
	text "To get to #MON"
	line "LEAGUE, you have"

	para "to get through"
	line "VICTORY ROAD."

	para "But VICTORY ROAD"
	line "is tough."

	para "Practically nobody"
	line "goes there!"
	done

CooltrainerfJoyceSeenText:
	text "Since you've come"
	line "this far, you must"
	cont "be good."

	para "I'm going to give"
	line "this battle every-"
	cont "thing I've got!"
	done

CooltrainerfJoyceBeatenText:
	text "No! I don't"
	line "believe this!"
	done

UnknownText_0x1a50d7:
	text "I've defeated"
	line "eight GYM LEADERS,"

	para "so I was feeling"
	line "confident."

	para "I'll have to try"
	line "harder next time."
	done

CooltrainerfBeth1SeenText:
	text "I lost to a train-"
	line "er named <RIVAL>."

	para "He was really"
	line "strong, but…"

	para "It was as if he"
	line "absolutely had to"
	cont "win at any cost."

	para "I felt sorry for"
	line "his #MON."
	done

CooltrainerfBeth1BeatenText:
	text "#MON aren't"
	line "tools of war."
	done

UnknownText_0x1a51d9:
	text "#MON are in-"
	line "valuable, lifelong"
	cont "partners."
	done

PsychicRichardSeenText:
	text "Wow, look at all"
	line "those BADGES!"
	cont "I'm impressed."

	para "But you're not"
	line "satisfied by just"

	para "collecting them,"
	line "right?"
	done

PsychicRichardBeatenText:
	text "Good battle!"
	done

UnknownText_0x1a5278:
	text "People and #MON"
	line "grow from their"
	cont "experiences."

	para "Don't get lazy and"
	line "complacent."
	done

FisherScottSeenText:
	text "I'm feeling great"
	line "today!"

	para "I feel like I"
	line "could boot even"
	cont "the LEAGUE CHAMP!"
	done

FisherScottBeatenText:
	text "No! Not in this"
	line "battle!"
	done

UnknownText_0x1a5326:
	text "Just like in fish-"
	line "ing, it's all over"

	para "in #MON if you"
	line "give up."
	done

Route26SignText:
	text "ROUTE 26"

	para "#MON LEAGUE"
	line "RECEPTION GATE"
	done

Route26_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $5, $7, 3, VICTORY_ROAD_GATE
	warp_def $39, $f, 1, ROUTE_26_HEAL_SPEECH_HOUSE
	warp_def $47, $5, 1, ROUTE_26_DAY_OF_WEEK_SIBLINGS_HOUSE

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 6, 8, SIGNPOST_READ, Route26Sign

.PersonEvents:
	db 8
	person_event SPRITE_COOLTRAINER_M, 24, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 2, TrainerCooltrainermJake, -1
	person_event SPRITE_COOLTRAINER_M, 38, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerCooltrainermGaven3, -1
	person_event SPRITE_COOLTRAINER_F, 56, 10, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerCooltrainerfJoyce, -1
	person_event SPRITE_COOLTRAINER_F, 8, 5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 4, TrainerCooltrainerfBeth1, -1
	person_event SPRITE_YOUNGSTER, 79, 13, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerPsychicRichard, -1
	person_event SPRITE_FISHER, 92, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 3, TrainerFisherScott, -1
	person_event SPRITE_FRUIT_TREE, 54, 14, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FruitTreeScript_0x1a4ec2, -1
	person_event SPRITE_POKE_BALL, 15, 9, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route26MaxElixer, EVENT_ROUTE_26_MAX_ELIXER
