const_value set 2
	const RADIOTOWER5F_DIRECTOR
	const RADIOTOWER5F_ROCKET
	const RADIOTOWER5F_ROCKET_GIRL
	const RADIOTOWER5F_ROCKER
	const RADIOTOWER5F_POKE_BALL

RadioTower5F_MapScriptHeader:
.MapTriggers:
	db 3

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1
	maptrigger .Trigger2

.MapCallbacks:
	db 0

.Trigger0:
	end

.Trigger1:
	end

.Trigger2:
	end

FakeDirectorScript:
	spriteface RADIOTOWER5F_DIRECTOR, UP
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
	loadtrainer EXECUTIVEM, 3
	startbattle
	reloadmapafterbattle
	opentext
	writetext FakeDirectorTextAfter
	buttonsound
	verbosegiveitem BASEMENT_KEY
	closetext
	dotrigger $1
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
	trainer EVENT_BEAT_ROCKET_EXECUTIVEF_1, EXECUTIVEF, 1, Executivef1SeenText, Executivef1BeatenText, 0, Executivef1Script

Executivef1Script:
	end_if_just_battled
	opentext
	writetext Executivef1AfterText
	waitbutton
	closetext
	end

RadioTower5FRocketBossTrigger:
	applymovement PLAYER, MovementData_0x60125
	playmusic MUSIC_ROCKET_ENCOUNTER
	spriteface RADIOTOWER5F_ROCKET, RIGHT
	opentext
	writetext RadioTower5FRocketBossBeforeText
	waitbutton
	closetext
	winlosstext RadioTower5FRocketBossWinText, 0
	setlasttalked RADIOTOWER5F_ROCKET
	loadtrainer EXECUTIVEM, 1
	startbattle
	reloadmapafterbattle
	opentext
	writetext RadioTower5FRocketBossAfterText
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear RADIOTOWER5F_ROCKET
	disappear RADIOTOWER5F_ROCKET_GIRL
	pause 15
	special Special_FadeInQuickly
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
	setevent EVENT_BLACKTHORN_CITY_SUPER_NERD_BLOCKS_GYM
	clearevent EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	special PlayMapMusic
	disappear RADIOTOWER5F_DIRECTOR
	moveperson RADIOTOWER5F_DIRECTOR, $c, $0
	appear RADIOTOWER5F_DIRECTOR
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksIn
	spriteface PLAYER, RIGHT
	opentext
	writetext RadioTower5FDirectorThankYouText
	buttonsound
	verbosegiveitem CLEAR_BELL
	writetext RadioTower5FDirectorDescribeClearBellText
	waitbutton
	closetext
	dotrigger $2
	domaptrigger ECRUTEAK_HOUSE, $0
	setevent EVENT_GOT_CLEAR_BELL
	setevent EVENT_TEAM_ROCKET_DISBANDED
	jump .UselessJump

.UselessJump:
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksOut
	playsound SFX_EXIT_BUILDING
	disappear RADIOTOWER5F_DIRECTOR
	end

Ben:
	jumptextfaceplayer BenText

RadioTower5FUltraBall:
	itemball ULTRA_BALL

MapRadioTower5FSignpost0Script:
	jumptext SignpostRadioTower5FOffice

MapRadioTower5FSignpost2Script:
	jumptext SignpostRadioTower5FStudio

RadioTower5FBookshelf:
	jumpstd magazinebookshelf

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

MovementData_0x60125:
	step LEFT
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

Executivef1AfterText:
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

SignpostRadioTower5FOffice:
	text "5F DIRECTOR'S"
	line "   OFFICE"
	done

SignpostRadioTower5FStudio:
	text "5F STUDIO 1"
	done

RadioTower5F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $0, $0, 1, RADIO_TOWER_4F
	warp_def $0, $c, 3, RADIO_TOWER_4F

.XYTriggers:
	db 2
	xy_trigger 0, $3, $0, $0, FakeDirectorScript, $0, $0
	xy_trigger 1, $5, $10, $0, RadioTower5FRocketBossTrigger, $0, $0

.Signposts:
	db 5
	signpost 0, 3, SIGNPOST_READ, MapRadioTower5FSignpost0Script
	signpost 0, 11, SIGNPOST_READ, MapRadioTower5FSignpost2Script
	signpost 0, 15, SIGNPOST_READ, MapRadioTower5FSignpost2Script
	signpost 1, 16, SIGNPOST_READ, RadioTower5FBookshelf
	signpost 1, 17, SIGNPOST_READ, RadioTower5FBookshelf

.PersonEvents:
	db 5
	person_event SPRITE_GENTLEMAN, 6, 3, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Director, -1
	person_event SPRITE_ROCKET, 5, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_ROCKET_GIRL, 2, 17, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerExecutivef1, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_ROCKER, 5, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Ben, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	person_event SPRITE_POKE_BALL, 5, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, RadioTower5FUltraBall, EVENT_RADIO_TOWER_5F_ULTRA_BALL
