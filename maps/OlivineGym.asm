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
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JASMINE
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
    checkevent EVENT_BEAT_CHAMPION_LANCE
    iftrue .OfferRematch
; player hasn't beaten the champion yet
	writetext Jasmine_GoodLuck
	waitbutton
.NoRoomForIronTail:
	closetext
	end
	
.OfferRematch:
    writetext JasmineRematchText
    yesorno
    iftrue .DoRematch
    ; keep going if false
	
.DontDoRematch:
    writetext JasmineRematchRefuseText
    waitbutton
    closetext
    end
	
.DoRematch:
    writetext JasmineRematchAcceptText
    waitbutton
    closetext
    winlosstext JasmineRematchLossText, 0
	readvar VAR_BADGES
	if_greater_than 15, .DoRematch2
    loadtrainer JASMINE, JASMINE2
    loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
    startbattle
    reloadmapafterbattle
    setevent EVENT_BEAT_JASMINE
    opentext
    writetext JasmineRematchAfterText
    waitbutton
    closetext
    end
	
.DoRematch2:
    winlosstext JasmineRematchLossText, 0
	loadtrainer JASMINE, JASMINE3
    loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
    startbattle
    reloadmapafterbattle
    setevent EVENT_BEAT_JASMINE
    opentext
    writetext JasmineRematchAfterText
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
    text "…MINERALBADGE"
	line "lets #MON use"

	para "STRENGTH outside"
	line "of battle."	
	
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
	
JasmineRematchText:
    text "Um… hello again."
	
	para "AMPHY's doing"
	line "better now, so"
	cont "we had more"
	cont "time to train."
	
	para "Can I ask you"
	line "for a rematch?"
	done 
	
JasmineRematchAcceptText:
    text "…Thank you. May"
	line "we get started?"
	done 
	
JasmineRematchRefuseText:
    text "Oh… I understand."
	done 
	
JasmineRematchLossText:
    text "Well done…"
	done 
	
JasmineRematchAfterText:
    text "You are truly"
	line "remarkable."
	
	para "I'll have to"
	line "try much"
	cont "harder too."
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
