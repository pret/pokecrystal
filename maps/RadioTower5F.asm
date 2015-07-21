RadioTower5F_MapScriptHeader:
.MapTriggers:
	db 3

	; triggers
	dw UnknownScript_0x6000e, $0000
	dw UnknownScript_0x6000f, $0000
	dw UnknownScript_0x60010, $0000

.MapCallbacks:
	db 0

UnknownScript_0x6000e:
	end

UnknownScript_0x6000f:
	end

UnknownScript_0x60010:
	end

UnknownScript_0x60011:
	spriteface $2, UP
	showemote EMOTE_SHOCK, $2, 15
	loadfont
	writetext UnknownText_0x60128
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x60109
	playmusic MUSIC_ROCKET_ENCOUNTER
	loadfont
	writetext UnknownText_0x60147
	closetext
	loadmovesprites
	winlosstext UnknownText_0x60223, $0000
	setlasttalked $2
	loadtrainer EXECUTIVEM, 3
	startbattle
	returnafterbattle
	loadfont
	writetext UnknownText_0x60246
	keeptextopen
	verbosegiveitem BASEMENT_KEY, 1
	loadmovesprites
	dotrigger $1
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_3
	end

Director:
	faceplayer
	loadfont
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x60054
	writetext UnknownText_0x60246
	closetext
	loadmovesprites
	end

UnknownScript_0x60054:
	writetext UnknownText_0x60824
	closetext
	loadmovesprites
	end

TrainerExecutivef1:
	trainer EVENT_BEAT_ROCKET_EXECUTIVEF_1, EXECUTIVEF, 1, Executivef1SeenText, Executivef1BeatenText, $0000, Executivef1Script

Executivef1Script:
	talkaftercancel
	loadfont
	writetext UnknownText_0x60358
	closetext
	loadmovesprites
	end

UnknownScript_0x6006e:
	applymovement $0, MovementData_0x60125
	playmusic MUSIC_ROCKET_ENCOUNTER
	spriteface $3, RIGHT
	loadfont
	writetext UnknownText_0x603d1
	closetext
	loadmovesprites
	winlosstext UnknownText_0x604f3, $0000
	setlasttalked $3
	loadtrainer EXECUTIVEM, 1
	startbattle
	returnafterbattle
	loadfont
	writetext UnknownText_0x6050e
	closetext
	loadmovesprites
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear $3
	disappear $4
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
	disappear $2
	moveperson $2, $c, $0
	appear $2
	applymovement $2, MovementData_0x6010f
	spriteface $0, RIGHT
	loadfont
	writetext UnknownText_0x605b2
	keeptextopen
	verbosegiveitem CLEAR_BELL, 1
	writetext UnknownText_0x6062c
	closetext
	loadmovesprites
	dotrigger $2
	domaptrigger GROUP_ECRUTEAK_HOUSE, MAP_ECRUTEAK_HOUSE, $0
	setevent EVENT_GOT_CLEAR_BELL
	setevent EVENT_TEAM_ROCKET_DISBANDED
	jump UnknownScript_0x600f1

UnknownScript_0x600f1:
	applymovement $2, MovementData_0x6011a
	playsound SFX_EXIT_BUILDING
	disappear $2
	end

Ben:
	jumptextfaceplayer BenText

ItemFragment_0x600fe:
	db ULTRA_BALL, 1

MapRadioTower5FSignpost0Script:
	jumptext UnknownText_0x608e0

MapRadioTower5FSignpost2Script:
	jumptext UnknownText_0x608f9

RadioTower5FBookshelf:
	jumpstd magazinebookshelf

MovementData_0x60109:
	step_left
	step_left
	step_left
	step_up
	step_up
	step_end

MovementData_0x6010f:
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_down
	step_down
	step_down
	step_left
	step_end

MovementData_0x6011a:
	step_right
	step_up
	step_up
	step_up
	step_left
	step_left
	step_left
	step_left
	step_up
	step_up
	step_end

MovementData_0x60125:
	step_left
	step_left
	step_end

UnknownText_0x60128:
	text "Y-you! You came to"
	line "rescue me?"
	done

UnknownText_0x60147:
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

UnknownText_0x60223:
	text "OK, OK. I'll tell"
	line "you where he is."
	done

UnknownText_0x60246:
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

UnknownText_0x60358:
	text "<PLAYER>, isn't it?"

	para "A brat like you"
	line "won't appreciate"

	para "the magnificence"
	line "of TEAM ROCKET."

	para "That's too bad."
	line "I really admire"
	cont "your power."
	done

UnknownText_0x603d1:
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

UnknownText_0x604f3:
	text "No! Forgive me,"
	line "GIOVANNI!"
	done

UnknownText_0x6050e:
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

UnknownText_0x605b2:
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

UnknownText_0x6062c:
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

UnknownText_0x60824:
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

UnknownText_0x608e0:
	text "5F DIRECTOR'S"
	line "   OFFICE"
	done

UnknownText_0x608f9:
	text "5F STUDIO 1"
	done

RadioTower5F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $0, $0, 1, GROUP_RADIO_TOWER_4F, MAP_RADIO_TOWER_4F
	warp_def $0, $c, 3, GROUP_RADIO_TOWER_4F, MAP_RADIO_TOWER_4F

.XYTriggers:
	db 2
	xy_trigger 0, $3, $0, $0, UnknownScript_0x60011, $0, $0
	xy_trigger 1, $5, $10, $0, UnknownScript_0x6006e, $0, $0

.Signposts:
	db 5
	signpost 0, 3, SIGNPOST_READ, MapRadioTower5FSignpost0Script
	signpost 0, 11, SIGNPOST_READ, MapRadioTower5FSignpost2Script
	signpost 0, 15, SIGNPOST_READ, MapRadioTower5FSignpost2Script
	signpost 1, 16, SIGNPOST_READ, RadioTower5FBookshelf
	signpost 1, 17, SIGNPOST_READ, RadioTower5FBookshelf

.PersonEvents:
	db 5
	person_event SPRITE_GENTLEMAN, 10, 7, OW_DOWN | $3, $0, -1, -1, $0, 0, Director, -1
	person_event SPRITE_ROCKET, 9, 17, OW_LEFT | $0, $0, -1, -1, $0, 0, ObjectEvent, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_ROCKET_GIRL, 6, 21, OW_LEFT | $0, $0, -1, -1, (PAL_OW_RED << 4) | $82, 1, TrainerExecutivef1, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_ROCKER, 9, 17, OW_LEFT | $0, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, Ben, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	person_event SPRITE_POKE_BALL, 9, 12, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x600fe, EVENT_RADIO_TOWER_5F_ULTRA_BALL
