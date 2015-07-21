AzaleaGym_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

BugsyScript_0x18ec1e:
	faceplayer
	loadfont
	checkevent EVENT_BEAT_BUGSY
	iftrue .FightDone
	writetext UnknownText_0x18ed0b
	closetext
	loadmovesprites
	winlosstext UnknownText_0x18edae, $0000
	loadtrainer BUGSY, 1
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_BUGSY
	loadfont
	writetext UnknownText_0x18ee14
	playsound SFX_GET_BADGE
	waitbutton
	setflag ENGINE_HIVEBADGE
	checkcode VAR_BADGES
	scall AzaleaGymTriggerRockets
.FightDone
	checkevent EVENT_GOT_TM49_FURY_CUTTER
	iftrue UnknownScript_0x18ec6d
	setevent EVENT_BEAT_TWINS_AMY_AND_MAY
	setevent EVENT_BEAT_BUG_CATCHER_BENNY
	setevent EVENT_BEAT_BUG_CATCHER_AL
	setevent EVENT_BEAT_BUG_CATCHER_JOSH
	writetext UnknownText_0x18ee2b
	keeptextopen
	verbosegiveitem TM_FURY_CUTTER, 1
	iffalse UnknownScript_0x18ec71
	setevent EVENT_GOT_TM49_FURY_CUTTER
	writetext UnknownText_0x18eefa
	closetext
	loadmovesprites
	end

UnknownScript_0x18ec6d:
	writetext UnknownText_0x18ef98
	closetext
UnknownScript_0x18ec71:
	loadmovesprites
	end

AzaleaGymTriggerRockets:
	if_equal 7, .RadioTowerRockets
	if_equal 6, .GoldenrodRockets
	end

.GoldenrodRockets
	jumpstd goldenrodrockets

.RadioTowerRockets
	jumpstd radiotowerrockets

TrainerTwinsAmyandmay1:
	trainer EVENT_BEAT_TWINS_AMY_AND_MAY, TWINS, AMYANDMAY1, TwinsAmyandmay1SeenText, TwinsAmyandmay1BeatenText, $0000, TwinsAmyandmay1Script

TwinsAmyandmay1Script:
	talkaftercancel
	loadfont
	writetext UnknownText_0x18f1fc
	closetext
	loadmovesprites
	end

TrainerTwinsAmyandmay2:
	trainer EVENT_BEAT_TWINS_AMY_AND_MAY, TWINS, AMYANDMAY2, TwinsAmyandmay2SeenText, TwinsAmyandmay2BeatenText, $0000, TwinsAmyandmay2Script

TwinsAmyandmay2Script:
	talkaftercancel
	loadfont
	writetext UnknownText_0x18f269
	closetext
	loadmovesprites
	end

TrainerBug_catcherBug_catcher_benny:
	trainer EVENT_BEAT_BUG_CATCHER_BENNY, BUG_CATCHER, BUG_CATCHER_BENNY, Bug_catcherBug_catcher_bennySeenText, Bug_catcherBug_catcher_bennyBeatenText, $0000, Bug_catcherBug_catcher_bennyScript

Bug_catcherBug_catcher_bennyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x18f053
	closetext
	loadmovesprites
	end

TrainerBug_catcherAl:
	trainer EVENT_BEAT_BUG_CATCHER_AL, BUG_CATCHER, AL, Bug_catcherAlSeenText, Bug_catcherAlBeatenText, $0000, Bug_catcherAlScript

Bug_catcherAlScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x18f0d3
	closetext
	loadmovesprites
	end

TrainerBug_catcherJosh:
	trainer EVENT_BEAT_BUG_CATCHER_JOSH, BUG_CATCHER, JOSH, Bug_catcherJoshSeenText, Bug_catcherJoshBeatenText, $0000, Bug_catcherJoshScript

Bug_catcherJoshScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x18f17e
	closetext
	loadmovesprites
	end

AzaleaGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_BUGSY
	iftrue .AzaleaGymGuyWinScript
	loadfont
	writetext AzaleaGymGuyText
	closetext
	loadmovesprites
	end

.AzaleaGymGuyWinScript
	loadfont
	writetext AzaleaGymGuyWinText
	closetext
	loadmovesprites
	end

AzaleaGymStatue:
	checkflag ENGINE_HIVEBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten
	trainertotext BUGSY, 1, $1
	jumpstd gymstatue2

UnknownText_0x18ed0b:
	text "I'm BUGSY!"
	line "I never lose when"

	para "it comes to bug"
	line "#MON."

	para "My research is"
	line "going to make me"

	para "the authority on"
	line "bug #MON!"

	para "Let me demonstrate"
	line "what I've learned"
	cont "from my studies."
	done

UnknownText_0x18edae:
	text "Whoa, amazing!"
	line "You're an expert"
	cont "on #MON!"

	para "My research isn't"
	line "complete yet."

	para "OK, you win. Take"
	line "this BADGE."
	done

UnknownText_0x18ee14:
	text "<PLAYER> received"
	line "HIVEBADGE."
	done

UnknownText_0x18ee2b:
	text "Do you know the"
	line "benefits of HIVE-"
	cont "BADGE?"

	para "If you have it,"
	line "#MON up to L30"

	para "will obey you,"
	line "even traded ones."

	para "#MON that know"
	line "CUT will be able"

	para "to use it outside"
	line "of battle too."

	para "Here, I also want"
	line "you to have this."
	done

UnknownText_0x18eefa:
	text "TM49 contains"
	line "FURY CUTTER."

	para "If you don't miss,"
	line "it gets stronger"
	cont "every turn."

	para "The longer your"
	line "battle goes, the"
	cont "better it gets."

	para "Isn't that great?"
	line "I discovered it!"
	done

UnknownText_0x18ef98:
	text "Bug #MON are"
	line "deep. There are"

	para "many mysteries to"
	line "be explored."

	para "Study your favor-"
	line "ites thoroughly."
	done

Bug_catcherBug_catcher_bennySeenText:
	text "Bug #MON evolve"
	line "young. So they get"

	para "stronger that much"
	line "faster."
	done

Bug_catcherBug_catcher_bennyBeatenText:
	text "Just evolving"
	line "isn't enough!"
	done

UnknownText_0x18f053:
	text "#MON become"
	line "stronger if they"
	cont "evolve. Really!"
	done

Bug_catcherAlSeenText:
	text "Bug #MON are"
	line "cool and tough!"

	para "I'll prove it to"
	line "you!"
	done

Bug_catcherAlBeatenText:
	text "You proved how"
	line "tough you are…"
	done

UnknownText_0x18f0d3:
	text "They're so cool,"
	line "but most girls"

	para "don't like bug"
	line "#MON."

	para "I don't know why…"
	done

Bug_catcherJoshSeenText:
	text "You saved all the"
	line "SLOWPOKE? Whew,"
	cont "you're mighty!"

	para "But my grown-up"
	line "#MON are pretty"
	cont "tough too!"
	done

Bug_catcherJoshBeatenText:
	text "Urrgggh!"
	done

UnknownText_0x18f17e:
	text "I guess I should"
	line "teach them better"
	cont "moves…"
	done

TwinsAmyandmay1SeenText:
	text "AMY: Hi! Are you"
	line "challenging the"
	cont "LEADER? No way!"
	done

TwinsAmyandmay1BeatenText:
	text "AMY & MAY: Oh,"
	line "double goodness!"
	done

UnknownText_0x18f1fc:
	text "AMY: You're"
	line "really strong!"
	done

TwinsAmyandmay2SeenText:
	text "MAY: You want to"
	line "see the LEADER?"
	cont "We come first!"
	done

TwinsAmyandmay2BeatenText:
	text "AMY & MAY: Oh,"
	line "double goodness!"
	done

UnknownText_0x18f269:
	text "MAY: Our bug #-"
	line "MON lost! Oh, what"
	cont "a shame."
	done

AzaleaGymGuyText:
	text "Yo, challenger!"

	para "BUGSY's young, but"
	line "his knowledge of"

	para "bug #MON is for"
	line "real."

	para "It's going to be"
	line "tough without my"
	cont "advice."

	para "Let's see… Bug"
	line "#MON don't like"
	cont "fire."

	para "Flying-type moves"
	line "are super-effec-"
	cont "tive too."
	done

AzaleaGymGuyWinText:
	text "Well done! That"
	line "was a great clash"

	para "of talented young"
	line "trainers."

	para "With people like"
	line "you, the future of"
	cont "#MON is bright!"
	done

AzaleaGym_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $f, $4, 5, GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN
	warp_def $f, $5, 5, GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 13, 3, SIGNPOST_READ, AzaleaGymStatue
	signpost 13, 6, SIGNPOST_READ, AzaleaGymStatue

.PersonEvents:
	db 7
	person_event SPRITE_BUGSY, 11, 9, OW_DOWN | $3, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, BugsyScript_0x18ec1e, -1
	person_event SPRITE_BUG_CATCHER, 7, 9, OW_LEFT | $2, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 2, TrainerBug_catcherBug_catcher_benny, -1
	person_event SPRITE_BUG_CATCHER, 12, 12, OW_UP | $2, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 3, TrainerBug_catcherAl, -1
	person_event SPRITE_BUG_CATCHER, 6, 4, OW_UP | $2, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 3, TrainerBug_catcherJosh, -1
	person_event SPRITE_TWIN, 14, 8, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $82, 1, TrainerTwinsAmyandmay1, -1
	person_event SPRITE_TWIN, 14, 9, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $82, 1, TrainerTwinsAmyandmay2, -1
	person_event SPRITE_GYM_GUY, 17, 11, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, AzaleaGymGuyScript, -1
