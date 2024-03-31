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
	checkevent EVENT_BEAT_SAGE_LI
	iffalse .GoSproutTower
; player has beaten Sage Li 
	checkevent EVENT_BEAT_FALKNER
	iftrue .FightDone
	writetext FalknerIntroText
	waitbutton
	closetext
	winlosstext FalknerWinLossText, 0
	loadtrainer FALKNER, FALKNER1
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	startbattle
	reloadmapafterbattle
	setevent EVENT_ROUTE_37_SUPER_NERD_BLOCKS_PASSAGE
	setmapscene ROUTE_37, SCENE_ROUTE37_NOOP_2
	setevent EVENT_BEAT_FALKNER
	opentext
	writetext ReceivedZephyrBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_ZEPHYRBADGE
	readvar VAR_BADGES
	scall VioletGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM31_MUD_SLAP
	iftrue .SpeechAfterTM
	loadmem wLevelCap, 36
	setevent EVENT_BEAT_BIRD_KEEPER_ROD
	setevent EVENT_BEAT_BIRD_KEEPER_ABE
	writetext FalknerZephyrBadgeText
	promptbutton
	verbosegiveitem TM_STEEL_WING
	iffalse .NoRoomForMudSlap
	setevent EVENT_GOT_TM31_MUD_SLAP
	writetext FalknerTMMudSlapText
	waitbutton
	closetext
	end 
	
.GoSproutTower:
    writetext FaceSages
	waitbutton 
	closetext
	end 

.SpeechAfterTM:
    checkevent EVENT_BEAT_CHAMPION_LANCE
    iftrue .OfferRematch
; player hasn't beaten the champion yet
    writetext FalknerFightDoneText
    waitbutton
    closetext
    end
	
.OfferRematch:
    writetext FalknerRematchText
    yesorno
    iftrue .DoRematch
    ; keep going if false
	
.DontDoRematch:
    writetext FalknerRematchRefuseText
    waitbutton
    closetext
    end
	
.DoRematch:
    checkevent EVENT_BEAT_RED
	iftrue .DoRematch2
; player hasn't beaten Red yet 
    writetext FalknerRematchAcceptText
    waitbutton
    closetext
    winlosstext FalknerRematchLossText, 0
    loadtrainer FALKNER, FALKNER2
    loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
    startbattle
    reloadmapafterbattle
    setevent EVENT_BEAT_FALKNER
    opentext
    writetext FalknerRematchAfterText
    waitbutton
    closetext
    end
	
.DoRematch2:
    writetext FalknerRematchAcceptText
	waitbutton
    closetext
    winlosstext FalknerRematchLossText, 0
	loadtrainer FALKNER, FALKNER3
    loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
    startbattle
    reloadmapafterbattle
    setevent EVENT_BEAT_FALKNER
    opentext
    writetext FalknerRematchAfterText
    waitbutton
    closetext
	end 
			
.NoRoomForMudSlap:
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
	
FaceSages:
    text "You're a rookie"
	line "trainer, aren't"
	cont "you?"
	
	para "If we were to"
	line "fight you wouldn't"
	cont "stand a chance."
	
	para "Go to the SPROUT"
	line "TOWER and face the"
	cont "SAGES there first."
	
	para "They will take a"
	line "beginner like you"
	cont "under their wing."
	done 

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
	text "It enables"
	line "#MON to use"

	para "FLASH, if they"
	line "have it, anytime."

	para "Here--take this"
	line "too."
	
	para "This is my"
	line "favorite TM."
	done

FalknerTMMudSlapText:
	text "TM47 contains"
	line "STEEL WING."

	para "Not only does it"
	line "deal damage, but"
	cont "it also has a"
	cont "chance to in-"
	cont "-crease the user's"
	cont "defense stat."

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
	cont "ECRUTEAK CITY"
	cont "next."

	para "I'm going to train"
	line "harder to become"

	para "the greatest bird"
	line "master!"
	done
	
FalknerRematchText:
    text "<PLAY_G>!"
	line "Congratulations on"
	cont "becoming champion."
	
	para "But you're not the"
	line "only one who's been"
	cont "flying high."
	
	para "I've worked hard"
	line "since our last" 
	cont "battle."
	
	para "Now my #MON"
	line "are in top shape."
	
	para "How about" 
	line "a rematch?"
	done 

FalknerRematchAcceptText:
    text "I'll show you the"
	line "real power of the"

	para "magnificent bird"
	line "#MON!"
	done 

FalknerRematchRefuseText:
    text "I'll wait until"
	line "you're ready."
	done 
	
FalknerRematchLossText:
    text "I understand…"
	line "I'll bow out"
	cont "gracefully."
	done
	
FalknerRematchAfterText:
    text "That was an"
	line "intense battle!"
	
	para "We've fought hard,"
	line "but you're as tough"
	cont "as ever."
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
	text "Yo! CHAMP in"
	line "making!"

	para "This GYM"
	line "specializes in"
	cont "flying-type"
	cont "#MON."
	
	para "FALKNER may not"
	line "like it, but"
	cont "electric types"
	cont "are sure to be"
	cont "a shock to their"
	cont "system!"
	
	para "Ice and Rock"
	line "types work too!"
	done

VioletGymGuideWinText:
	text "Beating FALKNER"
	line "is a big feat!"
	
	para "You sure are"
	line "flying high!"
	
	para "Keep it up, and"
	line "you'll be the"
	cont "CHAMP in no time!"
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
