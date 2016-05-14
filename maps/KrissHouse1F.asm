const_value set 2
	const KRISSHOUSE1F_MOM1
	const KRISSHOUSE1F_MOM2
	const KRISSHOUSE1F_MOM3
	const KRISSHOUSE1F_MOM4
	const KRISSHOUSE1F_POKEFAN_F

KrissHouse1F_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x7a4d6, 0
	dw UnknownScript_0x7a4d7, 0

.MapCallbacks:
	db 0

UnknownScript_0x7a4d6:
	end

UnknownScript_0x7a4d7:
	end

UnknownScript_0x7a4d8:
	setevent EVENT_GAVE_KURT_APRICORNS

UnknownScript_0x7a4db:
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, KRISSHOUSE1F_MOM1, 15
	spriteface PLAYER, LEFT
	checkevent EVENT_GAVE_KURT_APRICORNS
	iffalse UnknownScript_0x7a4f2
	applymovement KRISSHOUSE1F_MOM1, MovementData_0x7a5fc
	jump UnknownScript_0x7a4f6

UnknownScript_0x7a4f2:
	applymovement KRISSHOUSE1F_MOM1, MovementData_0x7a5fe
UnknownScript_0x7a4f6:
	opentext
	writetext UnknownText_0x7a604
	buttonsound
	stringtotext GearName, $1
	scall UnknownScript_0x7a57e
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	addcellnum PHONE_MOM
	dotrigger $1
	setevent EVENT_KRISS_HOUSE_MOM_1
	clearevent EVENT_KRISS_HOUSE_MOM_2
	writetext UnknownText_0x7a6bd
	buttonsound
	special Special_SetDayOfWeek
UnknownScript_0x7a519:
	writetext UnknownText_0x7a742
	yesorno
	iffalse UnknownScript_0x7a52a
	special Special_InitialSetDSTFlag
	yesorno
	iffalse UnknownScript_0x7a519
	jump UnknownScript_0x7a531

UnknownScript_0x7a52a:
	special Special_InitialClearDSTFlag
	yesorno
	iffalse UnknownScript_0x7a519
UnknownScript_0x7a531:
	writetext UnknownText_0x7a763
	yesorno
	iffalse UnknownScript_0x7a542
	jump UnknownScript_0x7a53b

UnknownScript_0x7a53b:
	writetext UnknownText_0x7a7cb
	buttonsound
	jump UnknownScript_0x7a549

UnknownScript_0x7a542:
	writetext UnknownText_0x7a807
	buttonsound
	jump UnknownScript_0x7a549

UnknownScript_0x7a549:
	writetext UnknownText_0x7a850
	waitbutton
	closetext
	checkevent EVENT_GAVE_KURT_APRICORNS
	iftrue UnknownScript_0x7a55d
	checkevent EVENT_RECEIVED_BALLS_FROM_KURT
	iffalse UnknownScript_0x7a564
	jump UnknownScript_0x7a56b

UnknownScript_0x7a55d:
	applymovement KRISSHOUSE1F_MOM1, MovementData_0x7a600
	jump UnknownScript_0x7a56b

UnknownScript_0x7a564:
	applymovement KRISSHOUSE1F_MOM1, MovementData_0x7a602
	jump UnknownScript_0x7a56b

UnknownScript_0x7a56b:
	special RestartMapMusic
	spriteface KRISSHOUSE1F_MOM1, LEFT
	end

UnknownScript_0x7a572:
	playmusic MUSIC_MOM
	jump UnknownScript_0x7a4f6

GearName:
	db "#GEAR@"

UnknownScript_0x7a57e:
	jumpstd receiveitem
	end

MomScript_0x7a582:
	faceplayer
	setevent EVENT_RECEIVED_BALLS_FROM_KURT
	checktriggers
	iffalse UnknownScript_0x7a572
	opentext
	checkevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	iftrue UnknownScript_0x7a5af
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue UnknownScript_0x7a5b8
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue UnknownScript_0x7a5b5
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue UnknownScript_0x7a5a9
	writetext UnknownText_0x7a8b5
	waitbutton
	closetext
	end

UnknownScript_0x7a5a9:
	writetext UnknownText_0x7a8e5
	waitbutton
	closetext
	end

UnknownScript_0x7a5af:
	writetext UnknownText_0x7a957
	waitbutton
	closetext
	end

UnknownScript_0x7a5b5:
	setevent EVENT_FIRST_TIME_BANKING_WITH_MOM
UnknownScript_0x7a5b8:
	setevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	special Special_BankOfMom
	waitbutton
	closetext
	end

NeighborScript:
	faceplayer
	opentext
	checkmorn
	iftrue .MornScript
	checkday
	iftrue .DayScript
	checknite
	iftrue .NiteScript

.MornScript:
	writetext NeighborMornIntroText
	buttonsound
	jump .Main

.DayScript:
	writetext NeighborDayIntroText
	buttonsound
	jump .Main

.NiteScript:
	writetext NeighborNiteIntroText
	buttonsound
	jump .Main

.Main:
	writetext NeighborText
	waitbutton
	closetext
	spriteface KRISSHOUSE1F_POKEFAN_F, RIGHT
	end

TVScript:
	jumptext TVText

StoveScript:
	jumptext StoveText

SinkScript:
	jumptext SinkText

FridgeScript:
	jumptext FridgeText

MovementData_0x7a5fc:
	turn_head RIGHT
	step_end

MovementData_0x7a5fe:
	slow_step RIGHT
	step_end

MovementData_0x7a600:
	turn_head LEFT
	step_end

MovementData_0x7a602:
	slow_step LEFT
	step_end

UnknownText_0x7a604:
	text "Oh, <PLAYER>…! Our"
	line "neighbor, PROF."

	para "ELM, was looking"
	line "for you."

	para "He said he wanted"
	line "you to do some-"
	cont "thing for him."

	para "Oh! I almost for-"
	line "got! Your #MON"

	para "GEAR is back from"
	line "the repair shop."

	para "Here you go!"
	done

UnknownText_0x7a6bd:
	text "#MON GEAR, or"
	line "just #GEAR."

	para "It's essential if"
	line "you want to be a"
	cont "good trainer."

	para "Oh, the day of the"
	line "week isn't set."

	para "You mustn't forget"
	line "that!"
	done

UnknownText_0x7a742:
	text "Is it Daylight"
	line "Saving Time now?"
	done

UnknownText_0x7a763:
	text "Come home to"
	line "adjust your clock"

	para "for Daylight"
	line "Saving Time."

	para "By the way, do you"
	line "know how to use"
	cont "the PHONE?"
	done

UnknownText_0x7a7cb:
	text "Don't you just"
	line "turn the #GEAR"

	para "on and select the"
	line "PHONE icon?"
	done

UnknownText_0x7a807:
	text "I'll read the"
	line "instructions."

	para "Turn the #GEAR"
	line "on and select the"
	cont "PHONE icon."
	done

UnknownText_0x7a850:
	text "Phone numbers are"
	line "stored in memory."

	para "Just choose a name"
	line "you want to call."

	para "Gee, isn't that"
	line "convenient?"
	done

UnknownText_0x7a8b5:
	text "PROF.ELM is wait-"
	line "ing for you."

	para "Hurry up, baby!"
	done

UnknownText_0x7a8e5:
	text "So, what was PROF."
	line "ELM's errand?"

	para "…"

	para "That does sound"
	line "challenging."

	para "But, you should be"
	line "proud that people"
	cont "rely on you."
	done

UnknownText_0x7a957:
	text "<PLAYER>, do it!"

	para "I'm behind you all"
	line "the way!"
	done

NeighborMornIntroText:
	text "Good morning,"
	line "<PLAY_G>!"

	para "I'm visiting!"
	done

NeighborDayIntroText:
	text "Hello, <PLAY_G>!"
	line "I'm visiting!"
	done

NeighborNiteIntroText:
	text "Good evening,"
	line "<PLAY_G>!"

	para "I'm visiting!"
	done

NeighborText:
	text "<PLAY_G>, have you"
	line "heard?"

	para "My daughter is"
	line "adamant about"

	para "becoming PROF."
	line "ELM's assistant."

	para "She really loves"
	line "#MON!"
	done

StoveText:
	text "Mom's specialty!"

	para "CINNABAR VOLCANO"
	line "BURGER!"
	done

SinkText:
	text "The sink is spot-"
	line "less. Mom likes it"
	cont "clean."
	done

FridgeText:
	text "Let's see what's"
	line "in the fridge…"

	para "FRESH WATER and"
	line "tasty LEMONADE!"
	done

TVText:
	text "There's a movie on"
	line "TV: Stars dot the"

	para "sky as two boys"
	line "ride on a train…"

	para "I'd better get"
	line "rolling too!"
	done

KrissHouse1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $6, 2, NEW_BARK_TOWN
	warp_def $7, $7, 2, NEW_BARK_TOWN
	warp_def $0, $9, 1, KRISS_HOUSE_2F

.XYTriggers:
	db 2
	xy_trigger 0, $4, $8, $0, UnknownScript_0x7a4d8, $0, $0
	xy_trigger 0, $4, $9, $0, UnknownScript_0x7a4db, $0, $0

.Signposts:
	db 4
	signpost 1, 0, SIGNPOST_READ, StoveScript
	signpost 1, 1, SIGNPOST_READ, SinkScript
	signpost 1, 2, SIGNPOST_READ, FridgeScript
	signpost 1, 4, SIGNPOST_READ, TVScript

.PersonEvents:
	db 5
	person_event SPRITE_MOM, 4, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MomScript_0x7a582, EVENT_KRISS_HOUSE_MOM_1
	person_event SPRITE_MOM, 2, 2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 1, 0, PERSONTYPE_SCRIPT, 0, MomScript_0x7a582, EVENT_KRISS_HOUSE_MOM_2
	person_event SPRITE_MOM, 4, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 2, 0, PERSONTYPE_SCRIPT, 0, MomScript_0x7a582, EVENT_KRISS_HOUSE_MOM_2
	person_event SPRITE_MOM, 2, 0, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 4, 0, PERSONTYPE_SCRIPT, 0, MomScript_0x7a582, EVENT_KRISS_HOUSE_MOM_2
	person_event SPRITE_POKEFAN_F, 4, 4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, NeighborScript, EVENT_KRISS_HOUSE_1F_NEIGHBOR
