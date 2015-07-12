AzaleaGym_MapScriptHeader:
	; trigger count
	db 0

	; callback count
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
	; bit/flag number
	dw EVENT_BEAT_TWINS_AMY_AND_MAY

	; trainer group && trainer id
	db TWINS, AMYANDMAY1

	; text when seen
	dw TwinsAmyandmay1SeenText

	; text when trainer beaten
	dw TwinsAmyandmay1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw TwinsAmyandmay1Script

TwinsAmyandmay1Script:
	talkaftercancel
	loadfont
	writetext UnknownText_0x18f1fc
	closetext
	loadmovesprites
	end

TrainerTwinsAmyandmay2:
	; bit/flag number
	dw EVENT_BEAT_TWINS_AMY_AND_MAY

	; trainer group && trainer id
	db TWINS, AMYANDMAY2

	; text when seen
	dw TwinsAmyandmay2SeenText

	; text when trainer beaten
	dw TwinsAmyandmay2BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw TwinsAmyandmay2Script

TwinsAmyandmay2Script:
	talkaftercancel
	loadfont
	writetext UnknownText_0x18f269
	closetext
	loadmovesprites
	end

TrainerBug_catcherBug_catcher_benny:
	; bit/flag number
	dw EVENT_BEAT_BUG_CATCHER_BENNY

	; trainer group && trainer id
	db BUG_CATCHER, BUG_CATCHER_BENNY

	; text when seen
	dw Bug_catcherBug_catcher_bennySeenText

	; text when trainer beaten
	dw Bug_catcherBug_catcher_bennyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bug_catcherBug_catcher_bennyScript

Bug_catcherBug_catcher_bennyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x18f053
	closetext
	loadmovesprites
	end

TrainerBug_catcherAl:
	; bit/flag number
	dw EVENT_BEAT_BUG_CATCHER_AL

	; trainer group && trainer id
	db BUG_CATCHER, AL

	; text when seen
	dw Bug_catcherAlSeenText

	; text when trainer beaten
	dw Bug_catcherAlBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bug_catcherAlScript

Bug_catcherAlScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x18f0d3
	closetext
	loadmovesprites
	end

TrainerBug_catcherJosh:
	; bit/flag number
	dw EVENT_BEAT_BUG_CATCHER_JOSH

	; trainer group && trainer id
	db BUG_CATCHER, JOSH

	; text when seen
	dw Bug_catcherJoshSeenText

	; text when trainer beaten
	dw Bug_catcherJoshBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bug_catcherJoshScript

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

	; warps
	db 2
	warp_def $f, $4, 5, GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN
	warp_def $f, $5, 5, GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 13, 3, $0, AzaleaGymStatue
	signpost 13, 6, $0, AzaleaGymStatue

	; people-events
	db 7
	person_event SPRITE_BUGSY, 11, 9, $3, $0, 255, 255, $a0, 0, BugsyScript_0x18ec1e, EVENT_ALWAYS_THERE
	person_event SPRITE_BUG_CATCHER, 7, 9, $a, $0, 255, 255, $b2, 2, TrainerBug_catcherBug_catcher_benny, EVENT_ALWAYS_THERE
	person_event SPRITE_BUG_CATCHER, 12, 12, $6, $0, 255, 255, $b2, 3, TrainerBug_catcherAl, EVENT_ALWAYS_THERE
	person_event SPRITE_BUG_CATCHER, 6, 4, $6, $0, 255, 255, $b2, 3, TrainerBug_catcherJosh, EVENT_ALWAYS_THERE
	person_event SPRITE_TWIN, 14, 8, $6, $0, 255, 255, $82, 1, TrainerTwinsAmyandmay1, EVENT_ALWAYS_THERE
	person_event SPRITE_TWIN, 14, 9, $6, $0, 255, 255, $82, 1, TrainerTwinsAmyandmay2, EVENT_ALWAYS_THERE
	person_event SPRITE_GYM_GUY, 17, 11, $6, $0, 255, 255, $80, 0, AzaleaGymGuyScript, EVENT_ALWAYS_THERE
