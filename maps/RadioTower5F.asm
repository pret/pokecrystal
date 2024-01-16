	object_const_def
	const RADIOTOWER5F_DIRECTOR
	const RADIOTOWER5F_TEAM_ROCKET
	const RADIOTOWER5F_ARIANA
	const RADIOTOWER5F_ROCKER
	const RADIOTOWER5F_POKE_BALL
	const RADIOTOWER5F_GIOVANNI

RadioTower5F_MapScripts:
	def_scene_scripts
	scene_script RadioTower5FNoop1Scene, SCENE_RADIOTOWER5F_FAKE_DIRECTOR
	scene_script RadioTower5FNoop2Scene, SCENE_RADIOTOWER5F_ROCKET_BOSS
	scene_script RadioTower5FNoop3Scene, SCENE_RADIOTOWER5F_NOOP

	def_callbacks

RadioTower5FNoop1Scene:
	end

RadioTower5FNoop2Scene:
	end

RadioTower5FNoop3Scene:
	end

FakeDirectorScript:
    disappear RADIOTOWER5F_GIOVANNI
	turnobject RADIOTOWER5F_DIRECTOR, UP
	showemote EMOTE_SHOCK, RADIOTOWER5F_DIRECTOR, 15
	opentext
	writetext FakeDirectorTextBefore1
	waitbutton
	closetext
	applymovement RADIOTOWER5F_DIRECTOR, FakeDirectorMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext FakeDirectorTextBefore2
	waitbutton
	closetext
	winlosstext FakeDirectorWinText, 0
	setlasttalked RADIOTOWER5F_DIRECTOR
	loadtrainer EXECUTIVEM, EXECUTIVEM_3
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	startbattle
	reloadmapafterbattle
	opentext
	writetext FakeDirectorTextAfter
	promptbutton
	verbosegiveitem BASEMENT_KEY
	closetext
	setscene SCENE_RADIOTOWER5F_ROCKET_BOSS
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_3
	end

Director:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .TrueDirector
	writetext FakeDirectorTextAfter
	waitbutton
	closetext
	end

.TrueDirector:
	writetext RadioTower5FDirectorText
	waitbutton
	closetext
	end

TrainerExecutivef1:
	trainer EXECUTIVEF, EXECUTIVEF_1, EVENT_BEAT_ROCKET_EXECUTIVEF_1, Executivef1SeenText, Executivef1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Executivef1AfterBattleText
	waitbutton
	closetext
	end

RadioTower5FRocketBossScript:
	applymovement PLAYER, RadioTower5FPlayerTwoStepsLeftMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject RADIOTOWER5F_TEAM_ROCKET, RIGHT
	opentext
	writetext RadioTower5FRocketBossBeforeText
	waitbutton
	closetext
	winlosstext RadioTower5FRocketBossWinText, 0
	setlasttalked RADIOTOWER5F_TEAM_ROCKET
	loadtrainer TEAM_ROCKET, ARCHER
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	startbattle
	reloadmapafterbattle
	special HealParty
	opentext
	writetext RadioTower5FRocketBossAfterText
	waitbutton
	closetext
	playsound SFX_EXIT_BUILDING
	; Giovanni Event
	moveobject RADIOTOWER5F_GIOVANNI, 12, 0
	appear RADIOTOWER5F_GIOVANNI
	applymovement RADIOTOWER5F_GIOVANNI, GiovanniWalksIn
	special FadeOutMusic
	faceobject PLAYER, RADIOTOWER5F_GIOVANNI
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, RIGHT
	opentext
	writetext GiovanniBeforeText
	waitbutton 
	closetext
	winlosstext GiovanniWinText, 0 
	loadtrainer GIOVANNI, GIOVANNI1
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	startbattle
	reloadmapafterbattle
	opentext
	writetext GiovanniAferText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playsound SFX_EXIT_BUILDING
	disappear RADIOTOWER5F_TEAM_ROCKET
	disappear RADIOTOWER5F_ARIANA
	disappear RADIOTOWER5F_GIOVANNI
	disappear RADIOTOWER5F_GIOVANNI, 12, 0
	pause 20
	special FadeInQuickly
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_1
	setevent EVENT_CLEARED_RADIO_TOWER
	clearflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	setevent EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	setevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_MAHOGANY_MART_OWNERS
	clearflag ENGINE_ROCKETS_IN_MAHOGANY
	clearevent EVENT_GOLDENROD_CITY_CIVILIANS
	clearevent EVENT_RADIO_TOWER_CIVILIANS_AFTER
	special PlayMapMusic
	disappear RADIOTOWER5F_DIRECTOR
	moveobject RADIOTOWER5F_DIRECTOR, 12, 0
	appear RADIOTOWER5F_DIRECTOR
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksIn
	opentext
	writetext RadioTower5FDirectorThankYouText
	promptbutton
	verbosegiveitem CLEAR_BELL
	writetext RadioTower5FDirectorDescribeClearBellText
	waitbutton
	closetext
	setscene SCENE_RADIOTOWER5F_NOOP
	setmapscene ECRUTEAK_TIN_TOWER_ENTRANCE, SCENE_ECRUTEAKTINTOWERENTRANCE_SAGE_BLOCKS
	setevent EVENT_GOT_CLEAR_BELL
	setevent EVENT_TEAM_ROCKET_DISBANDED
	sjump .UselessJump

.UselessJump:
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksOut
	playsound SFX_EXIT_BUILDING
	disappear RADIOTOWER5F_DIRECTOR
	end

Ben:
	jumptextfaceplayer BenText

RadioTower5FUltraBall:
	itemball ULTRA_BALL

RadioTower5FDirectorsOfficeSign:
	jumptext RadioTower5FDirectorsOfficeSignText

RadioTower5FStudio1Sign:
	jumptext RadioTower5FStudio1SignText

RadioTower5FBookshelf:
	jumpstd MagazineBookshelfScript

FakeDirectorMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

RadioTower5FDirectorWalksIn:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step_end

RadioTower5FDirectorWalksOut:
	step RIGHT
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

RadioTower5FPlayerTwoStepsLeftMovement:
	step LEFT
	step LEFT
	step_end
	
GiovanniWalksIn:
    step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step_end

FakeDirectorTextBefore1:
	text "Y-you! You came to"
	line "rescue me?"
	done

FakeDirectorTextBefore2:
	text "Is that what you"
	line "were expecting?"

	para "Wrong!"
	line "I'm an imposter!"

	para "I pretended to be"
	line "the real thing to"

	para "prepare for our"
	line "takeover."

	para "Do you want to"
	line "know where we hid"
	cont "the real DIRECTOR?"

	para "Sure, I'll tell"
	line "you. But only if"
	cont "you can beat me!"
	done

FakeDirectorWinText:
	text "OK, OK. I'll tell"
	line "you where he is."
	done

FakeDirectorTextAfter:
	text "We stashed the"
	line "real DIRECTOR in"

	para "the UNDERGROUND"
	line "WAREHOUSE."

	para "It's at the far"
	line "end of the UNDER-"
	cont "GROUND."

	para "But I doubt you'll"
	line "get that far."
	done

Executivef1SeenText:
	text "Remember me from"
	line "the HIDEOUT in"
	cont "MAHOGANY TOWN?"

	para "I lost then, but I"
	line "won't this time."
	done

Executivef1BeatenText:
	text "This can't be"
	line "happening!"

	para "I fought hard, but"
	line "I still lost…"
	done

Executivef1AfterBattleText:
	text "<PLAYER>, isn't it?"

	para "A brat like you"
	line "won't appreciate"

	para "the magnificence"
	line "of TEAM ROCKET."

	para "That's too bad."
	line "I really admire"
	cont "your power."
	done

RadioTower5FRocketBossBeforeText:
	text "Oh? You managed to"
	line "get this far?"

	para "You must be quite"
	line "the trainer."

	para "We intend to take"
	line "over this RADIO"

	para "STATION and an-"
	line "nounce our come-"
	cont "back."

	para "That should bring"
	line "our boss GIOVANNI"

	para "back from his solo"
	line "training."

	para "We are going to"
	line "regain our former"
	cont "glory."

	para "I won't allow you"
	line "to interfere with"
	cont "our plans."
	done

RadioTower5FRocketBossWinText:
	text "No! Forgive me,"
	line "GIOVANNI!"
	done

RadioTower5FRocketBossAfterText:
	text "How could this be?"

	para "Our dreams have"
	line "come to naught."

	para "I wasn't up to the"
	line "task after all."

	para "Like GIOVANNI did"
	line "before me, I will"

	para "disband TEAM"
	line "ROCKET here today."

	para "Farewell."
	
	para "???: TEAM ROCKET"
	line "is disbanded?"
	
	para "ARCHER, know your"
	line "place."
	done 
	
GiovanniBeforeText:
    text "ARCHER: GIOVANNI,"
	line "sir, you've"
	cont "returned!"
	
	para "GIOVANNI: An"
	line "EXECUTIVE losing"
	cont "losing to a child?"
	
	para "Disgraceful."
	
	para "<PLAY_G>, is it?"
	
	para "You've gotten"
	line "yourself involved"
	cont "in grown-up"
	cont "matters."
	
	para "I will not repeat"
	line "the same mistakes"
	cont "as 3 years ago."
	
	para "Prepare to"
	line "experience a"
	cont "world of pain!"
	done 
	
GiovanniWinText:
    text "What in the world"
	line "are you?"
	done 

GiovanniAferText:
    text "Yet again, I am"
	line "defeated." 
	
	para "Have the past 3"
	line "years been a" 
	cont "waste?"
	
	para "Our precious dream"
	line "has become little"
	cont "more than"
	cont "an illusion."
	
	para "As of today, TEAM"
	line "ROCKET is finished"
	cont "forever."
	
	para "...."
	done 

RadioTower5FDirectorThankYouText:
	text "DIRECTOR: <PLAY_G>,"
	line "thank you!"

	para "Your courageous"
	line "actions have saved"

	para "#MON nation-"
	line "wide."

	para "I know it's not"
	line "much, but please"
	cont "take this."
	done

RadioTower5FDirectorDescribeClearBellText:
	text "There used to be a"
	line "tower right here"
	cont "in GOLDENROD CITY."

	para "But it was old and"
	line "creaky."

	para "So we replaced it"
	line "with our RADIO"
	cont "TOWER."

	para "We dug up that"
	line "bell during"
	cont "construction."

	para "I heard that all"
	line "sorts of #MON"

	para "lived in GOLDENROD"
	line "in the past."

	para "Perhaps…"

	para "That bell has some"
	line "connection to the"

	para "TIN TOWER in"
	line "ECRUTEAK CITY…"

	para "Ah!"

	para "That reminds me…"

	para "I overheard TEAM"
	line "ROCKET whispering."

	para "Apparently, some-"
	line "thing is going on"
	cont "at the TIN TOWER."

	para "I have no idea"
	line "what is happening,"

	para "but you might look"
	line "into it."

	para "OK, I better go to"
	line "my OFFICE."
	done

RadioTower5FDirectorText:
	text "DIRECTOR: Hello,"
	line "<PLAY_G>!"

	para "You know, I love"
	line "#MON."

	para "I built this RADIO"
	line "TOWER so I could"

	para "express my love"
	line "of #MON."

	para "It would be nice"
	line "if people enjoyed"
	cont "our programs."
	done

BenText:
	text "BEN: Do you listen"
	line "to our music?"
	done

RadioTower5FDirectorsOfficeSignText:
	text "5F DIRECTOR'S"
	line "   OFFICE"
	done

RadioTower5FStudio1SignText:
	text "5F STUDIO 1"
	done

RadioTower5F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_4F, 1
	warp_event 12,  0, RADIO_TOWER_4F, 3

	def_coord_events
	coord_event  0,  3, SCENE_RADIOTOWER5F_FAKE_DIRECTOR, FakeDirectorScript
	coord_event 16,  5, SCENE_RADIOTOWER5F_ROCKET_BOSS, RadioTower5FRocketBossScript

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, RadioTower5FDirectorsOfficeSign
	bg_event 11,  0, BGEVENT_READ, RadioTower5FStudio1Sign
	bg_event 15,  0, BGEVENT_READ, RadioTower5FStudio1Sign
	bg_event 16,  1, BGEVENT_READ, RadioTower5FBookshelf
	bg_event 17,  1, BGEVENT_READ, RadioTower5FBookshelf

	def_object_events
	object_event  3,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Director, -1
	object_event 13,  5, SPRITE_TEAM_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 17,  2, SPRITE_ARIANA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerExecutivef1, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 13,  5, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Ben, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event  8,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RadioTower5FUltraBall, EVENT_RADIO_TOWER_5F_ULTRA_BALL
	object_event 23, 13, SPRITE_GIOVANNI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RADIO_TOWER_GIOVANNI
