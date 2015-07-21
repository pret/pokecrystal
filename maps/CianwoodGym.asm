CianwoodGym_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ChuckScript_0x9d60f:
	faceplayer
	loadfont
	checkevent EVENT_BEAT_CHUCK
	iftrue .FightDone
	writetext UnknownText_0x9d6f9
	closetext
	loadmovesprites
	spriteface $2, RIGHT
	loadfont
	writetext UnknownText_0x9d76f
	closetext
	loadmovesprites
	applymovement $7, MovementData_0x9d6f3
	playsound SFX_STRENGTH
	earthquake 80
	disappear $7
	pause 30
	faceplayer
	loadfont
	writetext UnknownText_0x9d78a
	closetext
	loadmovesprites
	winlosstext UnknownText_0x9d7f6, $0000
	loadtrainer CHUCK, 1
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_CHUCK
	loadfont
	writetext UnknownText_0x9d835
	playsound SFX_GET_BADGE
	waitbutton
	setflag ENGINE_STORMBADGE
	checkcode VAR_BADGES
	scall CianwoodGymTriggerRockets
.FightDone
	checkevent EVENT_GOT_TM01_DYNAMICPUNCH
	iftrue UnknownScript_0x9d67b
	setevent EVENT_BEAT_BLACKBELT_YOSHI
	setevent EVENT_BEAT_BLACKBELT_LAO
	setevent EVENT_BEAT_BLACKBELT_NOB
	setevent EVENT_BEAT_BLACKBELT_LUNG
	writetext UnknownText_0x9d84d
	keeptextopen
	verbosegiveitem TM_DYNAMICPUNCH, 1
	iffalse UnknownScript_0x9d67f
	setevent EVENT_GOT_TM01_DYNAMICPUNCH
	writetext UnknownText_0x9d8da
	closetext
	loadmovesprites
	end

UnknownScript_0x9d67b:
	writetext UnknownText_0x9d930
	closetext
UnknownScript_0x9d67f:
	loadmovesprites
	end

CianwoodGymTriggerRockets:
	if_equal 7, .RadioTowerRockets
	if_equal 6, .GoldenrodRockets
	end

.GoldenrodRockets
	jumpstd goldenrodrockets

.RadioTowerRockets
	jumpstd radiotowerrockets

TrainerBlackbeltYoshi:
	trainer EVENT_BEAT_BLACKBELT_YOSHI, BLACKBELT_T, YOSHI, BlackbeltYoshiSeenText, BlackbeltYoshiBeatenText, $0000, BlackbeltYoshiScript

BlackbeltYoshiScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x9d9fa
	closetext
	loadmovesprites
	end

TrainerBlackbeltLao:
	trainer EVENT_BEAT_BLACKBELT_LAO, BLACKBELT_T, LAO, BlackbeltLaoSeenText, BlackbeltLaoBeatenText, $0000, BlackbeltLaoScript

BlackbeltLaoScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x9da61
	closetext
	loadmovesprites
	end

TrainerBlackbeltNob:
	trainer EVENT_BEAT_BLACKBELT_NOB, BLACKBELT_T, NOB, BlackbeltNobSeenText, BlackbeltNobBeatenText, $0000, BlackbeltNobScript

BlackbeltNobScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x9dac0
	closetext
	loadmovesprites
	end

TrainerBlackbeltLung:
	trainer EVENT_BEAT_BLACKBELT_LUNG, BLACKBELT_T, LUNG, BlackbeltLungSeenText, BlackbeltLungBeatenText, $0000, BlackbeltLungScript

BlackbeltLungScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x9db14
	closetext
	loadmovesprites
	end

CianwoodGymBoulder:
	jumpstd strengthboulder

CianwoodGymStatue:
	checkflag ENGINE_STORMBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten
	trainertotext CHUCK, 1, $1
	jumpstd gymstatue2

MovementData_0x9d6f3:
	db $39 ; movement
	big_step_left
	big_step_up
	fast_jump_step_right
	db $38 ; movement
	step_end

UnknownText_0x9d6f9:
	text "WAHAHAH!"

	para "So you've come"
	line "this far!"

	para "Let me tell you,"
	line "I'm tough!"

	para "My #MON will"
	line "crush stones and"
	cont "shatter bones!"

	para "Watch this!"
	done

UnknownText_0x9d76f:
	text "CHUCK: Urggh!"
	line "…"

	para "Oooarrgh!"
	done

UnknownText_0x9d78a:
	text "There! Scared now,"
	line "are you?"

	para "What?"
	line "It has nothing to"

	para "do with #MON?"
	line "That's true!"

	para "Come on. We shall"
	line "do battle!"
	done

UnknownText_0x9d7f6:
	text "Wha? Huh?"
	line "I lost?"

	para "How about that!"
	line "You're worthy of"
	cont "STORMBADGE!"
	done

UnknownText_0x9d835:
	text "<PLAYER> received"
	line "STORMBADGE."
	done

UnknownText_0x9d84d:
	text "STORMBADGE makes"
	line "all #MON up to"

	para "L70 obey, even"
	line "traded ones."

	para "It also lets your"
	line "#MON use FLY"

	para "when you're not in"
	line "a battle."

	para "Here, take this"
	line "too!"
	done

UnknownText_0x9d8da:
	text "That is DYNAMIC-"
	line "PUNCH."

	para "It doesn't always"
	line "hit, but when it"

	para "does, it causes"
	line "confusion!"
	done

UnknownText_0x9d930:
	text "WAHAHAH! I enjoyed"
	line "battling you!"

	para "But a loss is a"
	line "loss!"

	para "From now on, I'm"
	line "going to train 24"
	cont "hours a day!"
	done

BlackbeltYoshiSeenText:
	text "My #MON and I"
	line "are bound togeth-"
	cont "er by friendship."

	para "Our bond will"
	line "never be broken!"
	done

BlackbeltYoshiBeatenText:
	text "This isn't real!"
	done

UnknownText_0x9d9fa:
	text "You seem to have a"
	line "strong bond with"
	cont "your #MON too!"
	done

BlackbeltLaoSeenText:
	text "We martial artists"
	line "fear nothing!"
	done

BlackbeltLaoBeatenText:
	text "That's shocking!"
	done

UnknownText_0x9da61:
	text "Fighting #MON"
	line "are afraid of psy-"
	cont "chics…"
	done

BlackbeltNobSeenText:
	text "Words are useless."
	line "Let your fists do"
	cont "the talking!"
	done

BlackbeltNobBeatenText:
	text "…"
	done

UnknownText_0x9dac0:
	text "I lost! "
	line "I'm speechless!"
	done

BlackbeltLungSeenText:
	text "My raging fists"
	line "will shatter your"
	cont "#MON!"
	done

BlackbeltLungBeatenText:
	text "I got shattered!"
	done

UnknownText_0x9db14:
	text "My #MON lost…"
	line "My… my pride is"
	cont "shattered…"
	done

CianwoodGym_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $11, $4, 2, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY
	warp_def $11, $5, 2, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 15, 3, SIGNPOST_READ, CianwoodGymStatue
	signpost 15, 6, SIGNPOST_READ, CianwoodGymStatue

.PersonEvents:
	db 9
	person_event SPRITE_CHUCK, 5, 8, OW_UP | $2, $0, -1, -1, (PAL_OW_BROWN << 4) | $80, 0, ChuckScript_0x9d60f, -1
	person_event SPRITE_BLACK_BELT, 16, 6, OW_LEFT | $1, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 3, TrainerBlackbeltYoshi, -1
	person_event SPRITE_BLACK_BELT, 16, 11, OW_LEFT | $0, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 3, TrainerBlackbeltLao, -1
	person_event SPRITE_BLACK_BELT, 13, 7, OW_LEFT | $1, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 2, TrainerBlackbeltNob, -1
	person_event SPRITE_BLACK_BELT, 9, 9, OW_LEFT | $0, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 1, TrainerBlackbeltLung, -1
	person_event SPRITE_BOULDER, 5, 9, OW_LEFT | $11, $0, -1, -1, $0, 0, CianwoodGymBoulder, -1
	person_event SPRITE_BOULDER, 11, 7, OW_LEFT | $11, $0, -1, -1, $0, 0, CianwoodGymBoulder, -1
	person_event SPRITE_BOULDER, 11, 8, OW_LEFT | $11, $0, -1, -1, $0, 0, CianwoodGymBoulder, -1
	person_event SPRITE_BOULDER, 11, 9, OW_LEFT | $11, $0, -1, -1, $0, 0, CianwoodGymBoulder, -1
