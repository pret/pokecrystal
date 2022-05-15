	object_const_def
	const VIOLETGYM_FALKNER
	const VIOLETGYM_YOUNGSTER1
	const VIOLETGYM_YOUNGSTER2
	const VIOLETGYM_GYM_GUIDE

VioletGym_MapScripts:
	def_scene_scripts

	def_callbacks

VioletGymFalknerScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .FightDone
	writetext FalknerIntroText
	waitbutton
	closetext
	winlosstext FalknerWinLossText, 0
	loadtrainer FALKNER, FALKNER1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_FALKNER
	clearflag ENGINE_FALKNER_REMATCH_FIGHT
	opentext
	writetext ReceivedZephyrBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_ZEPHYRBADGE
	readvar VAR_BADGES
	scall VioletGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM31_MUD_SLAP
	iftrue .GotMudSlap
	setevent EVENT_BEAT_BIRD_KEEPER_ROD
	setevent EVENT_BEAT_BIRD_KEEPER_ABE
	setmapscene ELMS_LAB, SCENE_ELMSLAB_NOTHING
	specialphonecall SPECIALCALL_ASSISTANT
	writetext FalknerZephyrBadgeText
	promptbutton
	verbosegiveitem TM_MUD_SLAP
	iffalse .NoRoomForMudSlap
	setevent EVENT_GOT_TM31_MUD_SLAP
	writetext FalknerTMMudSlapText
	waitbutton
	closetext
	end

.GotMudSlap:
	checkflag ENGINE_FALKNER_REMATCH_FIGHT
	iftrue .PostRematch
	checkevent EVENT_BEAT_CHAMPION_LANCE
	iffalse .PostInitialFight
	readvar VAR_WEEKDAY	
	ifnotequal SATURDAY, .PostInitialFight
	checktime MORN
	iffalse .PostInitialFight
	writetext FalknerText_AskRematch
	yesorno
	iftrue .FalknerRematch
	writetext FalknerText_RematchDeclined
	waitbutton
	closetext
	end
.PostInitialFight:
	writetext FalknerFightDoneText
	waitbutton
.NoRoomForMudSlap:
	closetext
	end

.FalknerRematch:
	writetext FalknerText_RematchAccepted
	waitbutton
	winlosstext FalknerText_RematchDefeat, 0
	readmem wFalknerFightCount
	ifequal 5, .LoadFight5
	ifequal 4, .LoadFight4
	ifequal 3, .LoadFight3
	ifequal 2, .LoadFight2
	ifequal 1, .LoadFight1

.LoadFight1:
	loadtrainer FALKNER, FALKNER2
	startbattle
	reloadmapafterbattle
	loadmem wFalknerFightCount, 2
	setflag ENGINE_FALKNER_REMATCH_FIGHT
	opentext
	writetext FalknerText_ItsStillALongWay
	waitbutton
	closetext
	end

.LoadFight2:
	loadtrainer FALKNER, FALKNER3
	startbattle
	reloadmapafterbattle
	loadmem wFalknerFightCount, 3
	setflag ENGINE_FALKNER_REMATCH_FIGHT
	opentext
	writetext FalknerText_ItsStillALongWay
	waitbutton
	closetext
	end

.LoadFight3:
	loadtrainer FALKNER, FALKNER4
	startbattle
	reloadmapafterbattle
	loadmem wFalknerFightCount, 4
	setflag ENGINE_FALKNER_REMATCH_FIGHT
	opentext
	writetext FalknerText_ItsStillALongWay
	waitbutton
	closetext
	end

.LoadFight4:
	loadtrainer FALKNER, FALKNER5
	startbattle
	reloadmapafterbattle
	loadmem wFalknerFightCount, 5
	setflag ENGINE_FALKNER_REMATCH_FIGHT
	opentext
	writetext FalknerText_ItsStillALongWay
	waitbutton
	closetext
	end

.LoadFight5:
	checkevent EVENT_OPENED_MT_SILVER
	iffalse .LoadFight4
	loadtrainer FALKNER, FALKNER6
	startbattle
	reloadmapafterbattle
	setflag ENGINE_FALKNER_REMATCH_FIGHT
	opentext
	writetext FalknerText_ItsStillALongWay
	waitbutton
	closetext
	end

.PostRematch:
	writetext FalknerText_ItsStillALongWay
	waitbutton
	closetext
	end

VioletGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerBirdKeeperRod:
	trainer BIRD_KEEPER, ROD, EVENT_BEAT_BIRD_KEEPER_ROD, BirdKeeperRodSeenText, BirdKeeperRodBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRodAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperAbe:
	trainer BIRD_KEEPER, ABE, EVENT_BEAT_BIRD_KEEPER_ABE, BirdKeeperAbeSeenText, BirdKeeperAbeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperAbeAfterBattleText
	waitbutton
	closetext
	end

VioletGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .VioletGymGuideWinScript
	writetext VioletGymGuideText
	waitbutton
	closetext
	end

.VioletGymGuideWinScript:
	writetext VioletGymGuideWinText
	waitbutton
	closetext
	end

VioletGymStatue:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, FALKNER, FALKNER1
	jumpstd GymStatue2Script

FalknerIntroText:
	text "I'm FALKNER, the"
	line "VIOLET #MON GYM"
	cont "leader!"

	para "People say you can"
	line "clip flying-type"

	para "#MON's wings"
	line "with a jolt of"
	cont "electricity…"

	para "I won't allow such"
	line "insults to bird"
	cont "#MON!"

	para "I'll show you the"
	line "real power of the"

	para "magnificent bird"
	line "#MON!"
	done

FalknerWinLossText:
	text "…Darn! My dad's"
	line "cherished bird"
	cont "#MON…"

	para "All right."
	line "Take this."

	para "It's the official"
	line "#MON LEAGUE"
	cont "ZEPHYRBADGE."
	done

ReceivedZephyrBadgeText:
	text "<PLAYER> received"
	line "ZEPHYRBADGE."
	done

FalknerZephyrBadgeText:
	text "ZEPHYRBADGE"
	line "raises the attack"
	cont "power of #MON."

	para "It also enables"
	line "#MON to use"

	para "FLASH, if they"
	line "have it, anytime."

	para "Here--take this"
	line "too."
	done

FalknerTMMudSlapText:
	text "By using a TM, a"
	line "#MON will"

	para "instantly learn a"
	line "new move."

	para "Think before you"
	line "act--a TM can be"
	cont "used only once."

	para "TM31 contains"
	line "MUD-SLAP."

	para "It reduces the"
	line "enemy's accuracy"

	para "while it causes"
	line "damage."

	para "In other words, it"
	line "is both defensive"
	cont "and offensive."
	done

FalknerFightDoneText:
	text "There are #MON"
	line "GYMS in cities and"
	cont "towns ahead."

	para "You should test"
	line "your skills at"
	cont "these GYMS."

	para "I'm going to train"
	line "harder to become"

	para "the greatest bird"
	line "master!"
	done

FalknerText_AskRematch:
	text "Hello."
	line "I'm in top form."

	para "I was hoping to"
	line "see you!"

	para "We're battling"
	line "again, correct?"
	done

FalknerText_RematchAccepted:
	text "It's a pleasure to"
	line "be able to battle"
	cont "you again!"
	done

FalknerText_RematchDeclined:
	text "Sure, sure… I know"
	line "you've got a busy"
	cont "schedule…"
	done

FalknerText_RematchDefeat:
	text "I understand…"

	para "I'll bow out gra-"
	line "cefully."
	done

FalknerText_ItsStillALongWay:
	text "Mmm… It's still a"
	line "long way to"

	para "become the best"
	line "trainer…"
	done

BirdKeeperRodSeenText:
	text "The keyword is"
	line "guts!"

	para "Those here are"
	line "training night and"

	para "day to become bird"
	line "#MON masters."

	para "Come on!"
	done

BirdKeeperRodBeatenText:
	text "Gaaah!"
	done

BirdKeeperRodAfterBattleText:
	text "FALKNER's skills"
	line "are for real!"

	para "Don't get cocky"
	line "just because you"
	cont "beat me!"
	done

BirdKeeperAbeSeenText:
	text "Let me see if you"
	line "are good enough to"
	cont "face FALKNER!"
	done

BirdKeeperAbeBeatenText:
	text "This can't be"
	line "true!"
	done

BirdKeeperAbeAfterBattleText:
	text "This is pathetic,"
	line "losing to some"
	cont "rookie trainer…"
	done

VioletGymGuideText:
	text "Hey! I'm no train-"
	line "er but I can give"
	cont "some advice!"

	para "Believe me!"
	line "If you believe, a"

	para "championship dream"
	line "can come true."

	para "You believe?"
	line "Then listen."

	para "The grass-type is"
	line "weak against the"

	para "flying-type. Keep"
	line "this in mind."
	done

VioletGymGuideWinText:
	text "Nice battle! Keep"
	line "it up, and you'll"

	para "be the CHAMP in no"
	line "time at all!"
	done

VioletGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 15, VIOLET_CITY, 2
	warp_event  5, 15, VIOLET_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, VioletGymStatue
	bg_event  6, 13, BGEVENT_READ, VioletGymStatue

	def_object_events
	object_event  5,  1, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletGymFalknerScript, -1
	object_event  7,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRod, -1
	object_event  2, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperAbe, -1
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletGymGuideScript, -1
