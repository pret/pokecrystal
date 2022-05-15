	object_const_def
	const OLIVINEGYM_JASMINE
	const OLIVINEGYM_GYM_GUIDE

OlivineGym_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineGymJasmineScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_JASMINE
	iftrue .FightDone
	writetext Jasmine_SteelTypeIntro
	waitbutton
	closetext
	winlosstext Jasmine_BetterTrainer, 0
	loadtrainer JASMINE, JASMINE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JASMINE
	clearflag ENGINE_JASMINE_REMATCH_FIGHT
	opentext
	writetext Text_ReceivedMineralBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MINERALBADGE
	readvar VAR_BADGES
	scall OlivineGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM23_IRON_TAIL
	iftrue .GotIronTail
	writetext Jasmine_BadgeSpeech
	promptbutton
	verbosegiveitem TM_IRON_TAIL
	iffalse .NoRoomForIronTail
	setevent EVENT_GOT_TM23_IRON_TAIL
	writetext Jasmine_IronTailSpeech
	waitbutton
	closetext
	end

.GotIronTail:
	checkflag ENGINE_JASMINE_REMATCH_FIGHT
	iftrue .PostRematch
	checkevent EVENT_BEAT_CHAMPION_LANCE
	iffalse .PostInitialFight
	readvar VAR_WEEKDAY	
	ifnotequal WEDNESDAY, .PostInitialFight
	checktime DAY
	iffalse .PostInitialFight
	writetext JasmineText_AskRematch
	yesorno
	iftrue .JasmineRematch
	writetext JasmineText_RematchDeclined
	waitbutton
	closetext
	end
.PostInitialFight:
	writetext Jasmine_GoodLuck
	waitbutton
.NoRoomForIronTail:
	closetext
	end

.JasmineRematch:
	writetext JasmineText_RematchAccepted
	waitbutton
	winlosstext JasmineText_RematchDefeat, 0
	readmem wJasmineFightCount
	ifequal 5, .LoadFight5
	ifequal 4, .LoadFight4
	ifequal 3, .LoadFight3
	ifequal 2, .LoadFight2
	ifequal 1, .LoadFight1

.LoadFight1:
	loadtrainer JASMINE, JASMINE2
	startbattle
	reloadmapafterbattle
	loadmem wJasmineFightCount, 2
	setflag ENGINE_JASMINE_REMATCH_FIGHT
	opentext
	writetext JasmineText_TrueToYourReputation
	waitbutton
	closetext
	end

.LoadFight2:
	loadtrainer JASMINE, JASMINE3
	startbattle
	reloadmapafterbattle
	loadmem wJasmineFightCount, 3
	setflag ENGINE_JASMINE_REMATCH_FIGHT
	opentext
	writetext JasmineText_TrueToYourReputation
	waitbutton
	closetext
	end

.LoadFight3:
	loadtrainer JASMINE, JASMINE4
	startbattle
	reloadmapafterbattle
	loadmem wJasmineFightCount, 4
	setflag ENGINE_JASMINE_REMATCH_FIGHT
	opentext
	writetext JasmineText_TrueToYourReputation
	waitbutton
	closetext
	end

.LoadFight4:
	loadtrainer JASMINE, JASMINE5
	startbattle
	reloadmapafterbattle
	loadmem wJasmineFightCount, 4
	setflag ENGINE_JASMINE_REMATCH_FIGHT
	opentext
	writetext JasmineText_TrueToYourReputation
	waitbutton
	closetext
	end

.LoadFight5:
	checkevent EVENT_OPENED_MT_SILVER
	iffalse .LoadFight4
	loadtrainer JASMINE, JASMINE6
	startbattle
	reloadmapafterbattle
	loadmem wJasmineFightCount, 4
	setflag ENGINE_JASMINE_REMATCH_FIGHT
	opentext
	writetext JasmineText_TrueToYourReputation
	waitbutton
	closetext
	end

.PostRematch:
	writetext JasmineText_TrueToYourReputation
	waitbutton
	closetext
	end

OlivineGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

OlivineGymGuideScript:
	faceplayer
	checkevent EVENT_BEAT_JASMINE
	iftrue .OlivineGymGuideWinScript
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iffalse .OlivineGymGuidePreScript
	opentext
	writetext OlivineGymGuideText
	waitbutton
	closetext
	end

.OlivineGymGuideWinScript:
	opentext
	writetext OlivineGymGuideWinText
	waitbutton
	closetext
	end

.OlivineGymGuidePreScript:
	opentext
	writetext OlivineGymGuidePreText
	waitbutton
	closetext
	end

OlivineGymStatue:
	checkflag ENGINE_MINERALBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, JASMINE, JASMINE1
	jumpstd GymStatue2Script

Jasmine_SteelTypeIntro:
	text "…Thank you for"
	line "your help at the"
	cont "LIGHTHOUSE…"

	para "But this is dif-"
	line "ferent. Please"

	para "allow me to intro-"
	line "duce myself."

	para "I am JASMINE, a"
	line "GYM LEADER. I use"
	cont "the steel-type."

	para "…Do you know about"
	line "the steel-type?"

	para "It's a type that"
	line "was only recently"
	cont "discovered."

	para "…Um… May I begin?"
	done

Jasmine_BetterTrainer:
	text "…You are a better"
	line "trainer than me,"

	para "in both skill and"
	line "kindness."

	para "In accordance with"
	line "LEAGUE rules, I"

	para "confer upon you"
	line "this BADGE."
	done

Text_ReceivedMineralBadge:
	text "<PLAYER> received"
	line "MINERALBADGE."
	done

Jasmine_BadgeSpeech:
	text "MINERALBADGE"
	line "raises #MON's"
	cont "DEFENSE."

	para "…Um… Please take"
	line "this too…"
	done

Text_ReceivedTM09: ; unreferenced
	text "<PLAYER> received"
	line "TM09."
	done

Jasmine_IronTailSpeech:
	text "…You could use"
	line "that TM to teach"
	cont "IRON TAIL."
	done

Jasmine_GoodLuck:
	text "Um… I don't know"
	line "how to say this,"
	cont "but good luck…"
	done

JasmineText_AskRematch:
	text "…Hello. How are"
	line "you?"

	para "AMPHY's gotten"
	line "better lately."

	para "I've also been"
	line "able to take some"
	cont "time to myself."

	para "What do you think?"

	para "Would you like to"
	line "battle me again?"
	done

JasmineText_RematchAccepted:
	text "Ok… Are you pre-"
	line "pared?"
	done

JasmineText_RematchDeclined:
	text "I see…"
	done

JasmineText_RematchDefeat:
	text "Well done…"
	done

JasmineText_TrueToYourReputation:
	text "True to your rep-"
	line "utation…"
	done

OlivineGymGuideText:
	text "JASMINE uses the"
	line "newly discovered"
	cont "steel-type."

	para "I don't know very"
	line "much about it."
	done

OlivineGymGuideWinText:
	text "That was awesome."

	para "The steel-type,"
	line "huh?"

	para "That was a close"
	line "encounter of an"
	cont "unknown kind!"
	done

OlivineGymGuidePreText:
	text "JASMINE, the GYM"
	line "LEADER, is at the"
	cont "LIGHTHOUSE."

	para "She's been tending"
	line "to a sick #MON."

	para "A strong trainer"
	line "has to be compas-"
	cont "sionate."
	done

OlivineGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 15, OLIVINE_CITY, 2
	warp_event  5, 15, OLIVINE_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, OlivineGymStatue
	bg_event  6, 13, BGEVENT_READ, OlivineGymStatue

	def_object_events
	object_event  5,  3, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymJasmineScript, EVENT_OLIVINE_GYM_JASMINE
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymGuideScript, -1
