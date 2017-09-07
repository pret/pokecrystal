const_value set 2
	const AZALEAGYM_BUGSY
	const AZALEAGYM_BUG_CATCHER1
	const AZALEAGYM_BUG_CATCHER2
	const AZALEAGYM_BUG_CATCHER3
	const AZALEAGYM_TWIN1
	const AZALEAGYM_TWIN2
	const AZALEAGYM_GYM_GUY

AzaleaGym_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

BugsyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BUGSY
	iftrue .FightDone
	writetext BugsyText_INeverLose
	waitbutton
	closetext
	winlosstext BugsyText_ResearchIncomplete, 0
	loadtrainer BUGSY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BUGSY
	opentext
	writetext Text_ReceivedHiveBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_HIVEBADGE
	checkcode VAR_BADGES
	scall AzaleaGymTriggerRockets
.FightDone:
	checkevent EVENT_GOT_TM49_FURY_CUTTER
	iftrue .GotFuryCutter
	setevent EVENT_BEAT_TWINS_AMY_AND_MAY
	setevent EVENT_BEAT_BUG_CATCHER_BENNY
	setevent EVENT_BEAT_BUG_CATCHER_AL
	setevent EVENT_BEAT_BUG_CATCHER_JOSH
	writetext BugsyText_HiveBadgeSpeech
	buttonsound
	verbosegiveitem TM_FURY_CUTTER
	iffalse .NoRoomForFuryCutter
	setevent EVENT_GOT_TM49_FURY_CUTTER
	writetext BugsyText_FuryCutterSpeech
	waitbutton
	closetext
	end

.GotFuryCutter:
	writetext BugsyText_BugMonsAreDeep
	waitbutton
.NoRoomForFuryCutter:
	closetext
	end

AzaleaGymTriggerRockets:
	if_equal 7, .RadioTowerRockets
	if_equal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerTwinsAmyandmay1:
	trainer EVENT_BEAT_TWINS_AMY_AND_MAY, TWINS, AMYANDMAY1, TwinsAmyandmay1SeenText, TwinsAmyandmay1BeatenText, 0, .AfterScript

.AfterScript:
	end_if_just_battled
	opentext
	writetext TwinsAmyandmay1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsAmyandmay2:
	trainer EVENT_BEAT_TWINS_AMY_AND_MAY, TWINS, AMYANDMAY2, TwinsAmyandmay2SeenText, TwinsAmyandmay2BeatenText, 0, .AfterScript

.AfterScript:
	end_if_just_battled
	opentext
	writetext TwinsAmyandmay2AfterBattleText
	waitbutton
	closetext
	end

TrainerBug_catcherbenny:
	trainer EVENT_BEAT_BUG_CATCHER_BENNY, BUG_CATCHER, BUG_CATCHER_BENNY, Bug_catcherbennySeenText, Bug_catcherbennyBeatenText, 0, .AfterScript

.AfterScript:
	end_if_just_battled
	opentext
	writetext Bug_catcherbennyAfterBattleText
	waitbutton
	closetext
	end

TrainerBug_catcherAl:
	trainer EVENT_BEAT_BUG_CATCHER_AL, BUG_CATCHER, AL, Bug_catcherAlSeenText, Bug_catcherAlBeatenText, 0, .AfterScript

.AfterScript:
	end_if_just_battled
	opentext
	writetext Bug_catcherAlAfterBattleText
	waitbutton
	closetext
	end

TrainerBug_catcherJosh:
	trainer EVENT_BEAT_BUG_CATCHER_JOSH, BUG_CATCHER, JOSH, Bug_catcherJoshSeenText, Bug_catcherJoshBeatenText, 0, .AfterScript

.AfterScript:
	end_if_just_battled
	opentext
	writetext Bug_catcherJoshAfterBattleText
	waitbutton
	closetext
	end

AzaleaGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_BUGSY
	iftrue .AzaleaGymGuyWinScript
	opentext
	writetext AzaleaGymGuyText
	waitbutton
	closetext
	end

.AzaleaGymGuyWinScript:
	opentext
	writetext AzaleaGymGuyWinText
	waitbutton
	closetext
	end

AzaleaGymStatue:
	checkflag ENGINE_HIVEBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext BUGSY, 1, $1
	jumpstd gymstatue2

BugsyText_INeverLose:
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

BugsyText_ResearchIncomplete:
	text "Whoa, amazing!"
	line "You're an expert"
	cont "on #MON!"

	para "My research isn't"
	line "complete yet."

	para "OK, you win. Take"
	line "this BADGE."
	done

Text_ReceivedHiveBadge:
	text "<PLAYER> received"
	line "HIVEBADGE."
	done

BugsyText_HiveBadgeSpeech:
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

BugsyText_FuryCutterSpeech:
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

BugsyText_BugMonsAreDeep:
	text "Bug #MON are"
	line "deep. There are"

	para "many mysteries to"
	line "be explored."

	para "Study your favor-"
	line "ites thoroughly."
	done

Bug_catcherbennySeenText:
	text "Bug #MON evolve"
	line "young. So they get"

	para "stronger that much"
	line "faster."
	done

Bug_catcherbennyBeatenText:
	text "Just evolving"
	line "isn't enough!"
	done

Bug_catcherbennyAfterBattleText:
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

Bug_catcherAlAfterBattleText:
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

Bug_catcherJoshAfterBattleText:
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

TwinsAmyandmay1AfterBattleText:
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

TwinsAmyandmay2AfterBattleText:
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
	warp_def $f, $4, 5, AZALEA_TOWN
	warp_def $f, $5, 5, AZALEA_TOWN

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 13, 3, SIGNPOST_READ, AzaleaGymStatue
	signpost 13, 6, SIGNPOST_READ, AzaleaGymStatue

.PersonEvents:
	db 7
	person_event SPRITE_BUGSY, 7, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, BugsyScript, -1
	person_event SPRITE_BUG_CATCHER, 3, 5, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 2, TrainerBug_catcherbenny, -1
	person_event SPRITE_BUG_CATCHER, 8, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 3, TrainerBug_catcherAl, -1
	person_event SPRITE_BUG_CATCHER, 2, 0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 3, TrainerBug_catcherJosh, -1
	person_event SPRITE_TWIN, 10, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerTwinsAmyandmay1, -1
	person_event SPRITE_TWIN, 10, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerTwinsAmyandmay2, -1
	person_event SPRITE_GYM_GUY, 13, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, AzaleaGymGuyScript, -1
