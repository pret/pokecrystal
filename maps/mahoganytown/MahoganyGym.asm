const_value set 2
	const MAHOGANYGYM_PRYCE
	const MAHOGANYGYM_BUENA1
	const MAHOGANYGYM_ROCKER1
	const MAHOGANYGYM_BUENA2
	const MAHOGANYGYM_ROCKER2
	const MAHOGANYGYM_ROCKER3
	const MAHOGANYGYM_GYM_GUY

MahoganyGym_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

PryceScript_0x199a9e:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .FightDone
	writetext UnknownText_0x199b8d
	waitbutton
	closetext
	winlosstext UnknownText_0x199cb3, 0
	loadtrainer PRYCE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PRYCE
	opentext
	writetext UnknownText_0x199d3b
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_GLACIERBADGE
	checkcode VAR_BADGES
	scall MahoganyGymTriggerRockets
.FightDone:
	checkevent EVENT_GOT_TM16_ICY_WIND
	iftrue UnknownScript_0x199af0
	setevent EVENT_BEAT_SKIER_ROXANNE
	setevent EVENT_BEAT_SKIER_CLARISSA
	setevent EVENT_BEAT_BOARDER_RONALD
	setevent EVENT_BEAT_BOARDER_BRAD
	setevent EVENT_BEAT_BOARDER_DOUGLAS
	writetext UnknownText_0x199d55
	buttonsound
	verbosegiveitem TM_ICY_WIND
	iffalse UnknownScript_0x199af4
	setevent EVENT_GOT_TM16_ICY_WIND
	writetext UnknownText_0x199def
	waitbutton
	closetext
	end

UnknownScript_0x199af0:
	writetext UnknownText_0x199e59
	waitbutton
UnknownScript_0x199af4:
	closetext
	end

MahoganyGymTriggerRockets:
	if_equal 7, .RadioTowerRockets
	if_equal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerSkierRoxanne:
	trainer EVENT_BEAT_SKIER_ROXANNE, SKIER, ROXANNE, SkierRoxanneSeenText, SkierRoxanneBeatenText, 0, SkierRoxanneScript

SkierRoxanneScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19a116
	waitbutton
	closetext
	end

TrainerSkierClarissa:
	trainer EVENT_BEAT_SKIER_CLARISSA, SKIER, CLARISSA, SkierClarissaSeenText, SkierClarissaBeatenText, 0, SkierClarissaScript

SkierClarissaScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19a18f
	waitbutton
	closetext
	end

TrainerBoarderRonald:
	trainer EVENT_BEAT_BOARDER_RONALD, BOARDER, RONALD, BoarderRonaldSeenText, BoarderRonaldBeatenText, 0, BoarderRonaldScript

BoarderRonaldScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x199f2d
	waitbutton
	closetext
	end

TrainerBoarderBrad:
	trainer EVENT_BEAT_BOARDER_BRAD, BOARDER, BRAD, BoarderBradSeenText, BoarderBradBeatenText, 0, BoarderBradScript

BoarderBradScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x199fdd
	waitbutton
	closetext
	end

TrainerBoarderDouglas:
	trainer EVENT_BEAT_BOARDER_DOUGLAS, BOARDER, DOUGLAS, BoarderDouglasSeenText, BoarderDouglasBeatenText, 0, BoarderDouglasScript

BoarderDouglasScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19a047
	waitbutton
	closetext
	end

MahoganyGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .MahoganyGymGuyWinScript
	writetext MahoganyGymGuyText
	waitbutton
	closetext
	end

.MahoganyGymGuyWinScript:
	writetext MahoganyGymGuyWinText
	waitbutton
	closetext
	end

MahoganyGymStatue:
	checkflag ENGINE_GLACIERBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext PRYCE, 1, $1
	jumpstd gymstatue2

UnknownText_0x199b8d:
	text "#MON have many"
	line "experiences in"

	para "their lives, just "
	line "like we do. "

	para "I, too, have seen"
	line "and suffered much"
	cont "in my life."

	para "Since I am your"
	line "elder, let me show"
	cont "you what I mean."

	para "I have been with"
	line "#MON since"

	para "before you were"
	line "born."

	para "I do not lose"
	line "easily."

	para "I, PRYCE--the"
	line "winter trainer--"

	para "shall demonstrate"
	line "my power!"
	done

UnknownText_0x199cb3:
	text "Ah, I am impressed"
	line "by your prowess."

	para "With your strong"
	line "will, I know you"

	para "will overcome all"
	line "life's obstacles."

	para "You are worthy of"
	line "this BADGE!"
	done

UnknownText_0x199d3b:
	text "<PLAYER> received"
	line "GLACIERBADGE."
	done

UnknownText_0x199d55:
	text "That BADGE will"
	line "raise the SPECIAL"
	cont "stats of #MON."

	para "It also lets your"
	line "#MON use WHIRL-"
	cont "POOL to get across"
	cont "real whirlpools."

	para "And this… This is"
	line "a gift from me!"
	done

UnknownText_0x199def:
	text "That TM contains"
	line "ICY WIND."

	para "It inflicts damage"
	line "and lowers speed."

	para "It demonstrates"
	line "the harshness of"
	cont "winter."
	done

UnknownText_0x199e59:
	text "When the ice and"
	line "snow melt, spring"
	cont "arrives."

	para "You and your #-"
	line "MON will be to-"

	para "gether for many"
	line "years to come."

	para "Cherish your time"
	line "together!"
	done

BoarderRonaldSeenText:
	text "I'll freeze your"
	line "#MON, so you"
	cont "can't do a thing!"
	done

BoarderRonaldBeatenText:
	text "Darn. I couldn't"
	line "do a thing."
	done

UnknownText_0x199f2d:
	text "I think there's a"
	line "move a #MON"

	para "can use while it's"
	line "frozen."
	done

BoarderBradSeenText:
	text "This GYM has a"
	line "slippery floor."

	para "It's fun, isn't"
	line "it?"

	para "But hey--we're"
	line "not playing games"
	cont "here!"
	done

BoarderBradBeatenText:
	text "Do you see how"
	line "serious we are?"
	done

UnknownText_0x199fdd:
	text "This GYM is great."
	line "I love boarding"
	cont "with my #MON!"
	done

BoarderDouglasSeenText:
	text "I know PRYCE's"
	line "secret."
	done

BoarderDouglasBeatenText:
	text "OK. I'll tell you"
	line "PRYCE's secret."
	done

UnknownText_0x19a047:
	text "The secret behind"
	line "PRYCE's power…"

	para "He meditates under"
	line "a waterfall daily"

	para "to strengthen his"
	line "mind and body."
	done

SkierRoxanneSeenText:
	text "To get to PRYCE,"
	line "our GYM LEADER,"

	para "you need to think"
	line "before you skate."
	done

SkierRoxanneBeatenText:
	text "I wouldn't lose to"
	line "you in skiing!"
	done

UnknownText_0x19a116:
	text "If you don't skate"
	line "with precision,"

	para "you won't get far"
	line "in this GYM."
	done

SkierClarissaSeenText:
	text "Check out my"
	line "parallel turn!"
	done

SkierClarissaBeatenText:
	text "No! You made me"
	line "wipe out!"
	done

UnknownText_0x19a18f:
	text "I shouldn't have"
	line "been bragging"
	cont "about my skiing…"
	done

MahoganyGymGuyText:
	text "PRYCE is a veteran"
	line "who has trained"

	para "#MON for some"
	line "50 years."

	para "He's said to be"
	line "good at freezing"

	para "opponents with"
	line "ice-type moves."

	para "That means you"
	line "should melt him"

	para "with your burning"
	line "ambition!"
	done

MahoganyGymGuyWinText:
	text "PRYCE is some-"
	line "thing, but you're"
	cont "something else!"

	para "That was a hot"
	line "battle that"

	para "bridged the gen-"
	line "eration gap!"
	done

MahoganyGym_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $11, $4, 3, MAHOGANY_TOWN
	warp_def $11, $5, 3, MAHOGANY_TOWN

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 15, 3, SIGNPOST_READ, MahoganyGymStatue
	signpost 15, 6, SIGNPOST_READ, MahoganyGymStatue

.PersonEvents:
	db 7
	person_event SPRITE_PRYCE, 3, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, PryceScript_0x199a9e, -1
	person_event SPRITE_BUENA, 6, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerSkierRoxanne, -1
	person_event SPRITE_ROCKER, 17, 0, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerBoarderRonald, -1
	person_event SPRITE_BUENA, 17, 9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerSkierClarissa, -1
	person_event SPRITE_ROCKER, 9, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerBoarderBrad, -1
	person_event SPRITE_ROCKER, 4, 2, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerBoarderDouglas, -1
	person_event SPRITE_GYM_GUY, 15, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MahoganyGymGuyScript, -1
