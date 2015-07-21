BlackthornGym1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks
	dbw 1, .Boulders

.Boulders
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_1
	iffalse .skip1
	changeblock $8, $2, $3b
.skip1
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_2
	iffalse .skip2
	changeblock $2, $4, $3a
.skip2
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_3
	iffalse .skip3
	changeblock $8, $6, $3b
.skip3
	return

ClairScript_0x194e24:
	faceplayer
	loadfont
	checkflag ENGINE_RISINGBADGE
	iftrue UnknownScript_0x194e69
	checkevent EVENT_BEAT_CLAIR
	iftrue .FightDone
	writetext UnknownText_0x194efa
	closetext
	loadmovesprites
	winlosstext UnknownText_0x194fd6, $0000
	loadtrainer CLAIR, 1
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_CLAIR
	loadfont
	writetext UnknownText_0x19500e
	closetext
	loadmovesprites
	setevent EVENT_BEAT_COOLTRAINERM_PAUL
	setevent EVENT_BEAT_COOLTRAINERM_CODY
	setevent EVENT_BEAT_COOLTRAINERM_MIKE
	setevent EVENT_BEAT_COOLTRAINERF_FRAN
	setevent EVENT_BEAT_COOLTRAINERF_LOLA
	clearevent EVENT_MAHOGANY_MART_OWNERS
	setevent EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
	clearevent EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	end
.FightDone
	writetext UnknownText_0x195162
	closetext
	loadmovesprites
	end

UnknownScript_0x194e69:
	checkevent EVENT_GOT_TM24_DRAGONBREATH
	iftrue UnknownScript_0x194e94
	writetext UnknownText_0x195196
	keeptextopen
	giveitem TM_DRAGONBREATH, $1
	iffalse UnknownScript_0x194e8e
	itemtotext TM_DRAGONBREATH, $0
	writetext UnknownText_0x1951bf
	playsound SFX_ITEM
	waitbutton
	itemnotify
	setevent EVENT_GOT_TM24_DRAGONBREATH
	writetext UnknownText_0x1951d1
	keeptextopen
	jump UnknownScript_0x194e94

UnknownScript_0x194e8e:
	writetext UnknownText_0x19524f
	closetext
	loadmovesprites
	end

UnknownScript_0x194e94:
	writetext UnknownText_0x195272
	closetext
	loadmovesprites
	end

TrainerCooltrainermPaul:
	trainer EVENT_BEAT_COOLTRAINERM_PAUL, COOLTRAINERM, PAUL, CooltrainermPaulSeenText, CooltrainermPaulBeatenText, $0000, CooltrainermPaulScript

CooltrainermPaulScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1953f1
	closetext
	loadmovesprites
	end

TrainerCooltrainermMike:
	trainer EVENT_BEAT_COOLTRAINERM_MIKE, COOLTRAINERM, MIKE, CooltrainermMikeSeenText, CooltrainermMikeBeatenText, $0000, CooltrainermMikeScript

CooltrainermMikeScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x195467
	closetext
	loadmovesprites
	end

TrainerCooltrainerfLola:
	trainer EVENT_BEAT_COOLTRAINERF_LOLA, COOLTRAINERF, LOLA, CooltrainerfLolaSeenText, CooltrainerfLolaBeatenText, $0000, CooltrainerfLolaScript

CooltrainerfLolaScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x195516
	closetext
	loadmovesprites
	end

BlackthornGymGuyScript:
	faceplayer
	loadfont
	checkevent EVENT_BEAT_CLAIR
	iftrue .BlackthornGymGuyWinScript
	writetext BlackthornGymGuyText
	closetext
	loadmovesprites
	end

.BlackthornGymGuyWinScript
	writetext BlackthornGymGuyWinText
	closetext
	loadmovesprites
	end

BlackthornGymStatue:
	checkflag ENGINE_RISINGBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten
	trainertotext CLAIR, 1, $1
	jumpstd gymstatue2

UnknownText_0x194efa:
	text "I am CLAIR."

	para "The world's best"
	line "dragon master."

	para "I can hold my own"
	line "against even the"

	para "#MON LEAGUE's"
	line "ELITE FOUR."

	para "Do you still want"
	line "to take me on?"

	para "…Fine."
	line "Let's do it!"

	para "As a GYM LEADER,"
	line "I will use my full"

	para "power against any"
	line "opponent!"
	done

UnknownText_0x194fd6:
	text "I lost?"

	para "I don't believe"
	line "it. There must be"
	cont "some mistake…"
	done

UnknownText_0x19500e:
	text "I won't admit"
	line "this."

	para "I may have lost,"
	line "but you're still"

	para "not ready for the"
	line "#MON LEAGUE."

	para "I know. You should"
	line "take the dragon"
	cont "user challenge."

	para "Behind this GYM is"
	line "a place called"
	cont "DRAGON'S DEN."

	para "There is a small"
	line "shrine at its"

	para "center."
	line "Go there."

	para "If you can prove"
	line "that you've lost"

	para "your lazy ideals,"
	line "I will recognize"

	para "you as a trainer"
	line "worthy of a GYM"
	cont "BADGE!"
	done

UnknownText_0x195162:
	text "What's the matter?"

	para "Is it too much to"
	line "expect of you?"
	done

UnknownText_0x195196:
	text "You've kept me"
	line "waiting!"

	para "Here! Take this!"
	done

UnknownText_0x1951bf:
	text "<PLAYER> received"
	line "TM24."
	done

UnknownText_0x1951d1:
	text "That contains"
	line "DRAGONBREATH."

	para "No, it doesn't"
	line "have anything to"
	cont "do with my breath."

	para "If you don't want"
	line "it, you don't have"
	cont "to take it."
	done

UnknownText_0x19524f:
	text "What is this? You"
	line "don't have room?"
	done

UnknownText_0x195272:
	text "What's the matter?"

	para "Aren't you headed"
	line "to the #MON"
	cont "LEAGUE?"

	para "Don't you know"
	line "where it is?"

	para "From here, go to"
	line "NEW BARK TOWN."

	para "Then SURF east."
	line "The route there is"
	cont "very tough."

	para "Don't you dare"
	line "lose at the #-"
	cont "MON LEAGUE!"

	para "If you do, I'll"
	line "feel even worse"

	para "about having lost"
	line "to you!"

	para "Give it every-"
	line "thing you've got."
	done

CooltrainermPaulSeenText:
	text "Your first battle"
	line "against dragons?"

	para "I'll show you how"
	line "tough they are!"
	done

CooltrainermPaulBeatenText:
	text "My dragon #MON"
	line "lost?"
	done

UnknownText_0x1953f1:
	text "LANCE told you"
	line "that he'd like to"

	para "see you again?"
	line "Not a chance!"
	done

CooltrainermMikeSeenText:
	text "My chance of"
	line "losing? Not even"
	cont "one percent!"
	done

CooltrainermMikeBeatenText:
	text "That's odd."
	done

UnknownText_0x195467:
	text "I know my short-"
	line "comings now."

	para "Thanks for showing"
	line "me!"
	done

CooltrainerfLolaSeenText:
	text "Dragons are sacred"
	line "#MON."

	para "They are full of"
	line "life energy."

	para "If you're not"
	line "serious, you won't"

	para "be able to beat"
	line "them."
	done

CooltrainerfLolaBeatenText:
	text "Way to go!"
	done

UnknownText_0x195516:
	text "Dragons are weak"
	line "against dragon-"
	cont "type moves."
	done

BlackthornGymGuyText:
	text "Yo! CHAMP in"
	line "making!"

	para "It's been a long"
	line "journey, but we"

	para "are almost done!"
	line "Count on me!"

	para "CLAIR uses the"
	line "mythical and sac-"
	cont "red dragon-type"
	cont "#MON."

	para "You can't damage"
	line "them very easily."

	para "But you know,"
	line "they're supposed"

	para "to be weak against"
	line "ice-type moves."
	done

BlackthornGymGuyWinText:
	text "You were great to"
	line "beat CLAIR!"

	para "All that's left is"
	line "the #MON LEAGUE"
	cont "challenge."

	para "You're on the way"
	line "to becoming the"
	cont "#MON CHAMPION!"
	done

BlackthornGym1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 7
	warp_def $11, $4, 1, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY
	warp_def $11, $5, 1, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY
	warp_def $7, $1, 1, GROUP_BLACKTHORN_GYM_2F, MAP_BLACKTHORN_GYM_2F
	warp_def $9, $7, 2, GROUP_BLACKTHORN_GYM_2F, MAP_BLACKTHORN_GYM_2F
	warp_def $6, $2, 3, GROUP_BLACKTHORN_GYM_2F, MAP_BLACKTHORN_GYM_2F
	warp_def $7, $7, 4, GROUP_BLACKTHORN_GYM_2F, MAP_BLACKTHORN_GYM_2F
	warp_def $6, $7, 5, GROUP_BLACKTHORN_GYM_2F, MAP_BLACKTHORN_GYM_2F

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 15, 3, SIGNPOST_READ, BlackthornGymStatue
	signpost 15, 6, SIGNPOST_READ, BlackthornGymStatue

.PersonEvents:
	db 5
	person_event SPRITE_CLAIR, 7, 9, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, ClairScript_0x194e24, -1
	person_event SPRITE_COOLTRAINER_M, 10, 10, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $82, 3, TrainerCooltrainermMike, -1
	person_event SPRITE_COOLTRAINER_M, 18, 5, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $82, 3, TrainerCooltrainermPaul, -1
	person_event SPRITE_COOLTRAINER_F, 6, 13, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $82, 1, TrainerCooltrainerfLola, -1
	person_event SPRITE_GYM_GUY, 19, 11, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, BlackthornGymGuyScript, -1
