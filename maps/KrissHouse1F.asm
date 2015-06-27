KrissHouse1F_MapScriptHeader: ; 0x7a4cc
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x7a4d6, $0000
	dw UnknownScript_0x7a4d7, $0000

	; callback count
	db 0
; 0x7a4d6

UnknownScript_0x7a4d6: ; 0x7a4d6
	end
; 0x7a4d7

UnknownScript_0x7a4d7: ; 0x7a4d7
	end
; 0x7a4d8

UnknownScript_0x7a4d8: ; 0x7a4d8
	setevent $0000
; 0x7a4db

UnknownScript_0x7a4db: ; 0x7a4db
	playmusic MUSIC_MOM
	showemote $0, $2, 15
	spriteface $0, LEFT
	checkevent $0000
	iffalse UnknownScript_0x7a4f2
	applymovement $2, MovementData_0x7a5fc
	jump UnknownScript_0x7a4f6
; 0x7a4f2

UnknownScript_0x7a4f2: ; 0x7a4f2
	applymovement $2, MovementData_0x7a5fe
UnknownScript_0x7a4f6: ; 0x7a4f6
	loadfont
	writetext UnknownText_0x7a604
	keeptextopen
	stringtotext GearName, $1
	scall UnknownScript_0x7a57e
	setflag $0004
	setflag $0002
	addcellnum $1
	dotrigger $1
	setevent $06c7
	clearevent $06c8
	writetext UnknownText_0x7a6bd
	keeptextopen
	special Function90913
UnknownScript_0x7a519: ; 0x7a519
	writetext UnknownText_0x7a742
	yesorno
	iffalse UnknownScript_0x7a52a
	special Function90a54
	yesorno
	iffalse UnknownScript_0x7a519
	jump UnknownScript_0x7a531
; 0x7a52a

UnknownScript_0x7a52a: ; 0x7a52a
	special Function90a88
	yesorno
	iffalse UnknownScript_0x7a519
UnknownScript_0x7a531: ; 0x7a531
	writetext UnknownText_0x7a763
	yesorno
	iffalse UnknownScript_0x7a542
	jump UnknownScript_0x7a53b
; 0x7a53b

UnknownScript_0x7a53b: ; 0x7a53b
	writetext UnknownText_0x7a7cb
	keeptextopen
	jump UnknownScript_0x7a549
; 0x7a542

UnknownScript_0x7a542: ; 0x7a542
	writetext UnknownText_0x7a807
	keeptextopen
	jump UnknownScript_0x7a549
; 0x7a549

UnknownScript_0x7a549: ; 0x7a549
	writetext UnknownText_0x7a850
	closetext
	loadmovesprites
	checkevent $0000
	iftrue UnknownScript_0x7a55d
	checkevent $0001
	iffalse UnknownScript_0x7a564
	jump UnknownScript_0x7a56b
; 0x7a55d

UnknownScript_0x7a55d: ; 0x7a55d
	applymovement $2, MovementData_0x7a600
	jump UnknownScript_0x7a56b
; 0x7a564

UnknownScript_0x7a564: ; 0x7a564
	applymovement $2, MovementData_0x7a602
	jump UnknownScript_0x7a56b
; 0x7a56b

UnknownScript_0x7a56b: ; 0x7a56b
	special RestartMapMusic
	spriteface $2, LEFT
	end
; 0x7a572

UnknownScript_0x7a572: ; 0x7a572
	playmusic MUSIC_MOM
	jump UnknownScript_0x7a4f6
; 0x7a578

GearName: ; 0x7a578
	db $54, "GEAR@"
; 0x7a57e

UnknownScript_0x7a57e: ; 0x7a57e
	jumpstd $002f
	end
; 0x7a582

MomScript_0x7a582: ; 0x7a582
	faceplayer
	setevent $0001
	checktriggers
	iffalse UnknownScript_0x7a572
	loadfont
	checkevent $0076
	iftrue UnknownScript_0x7a5af
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue UnknownScript_0x7a5b8
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue UnknownScript_0x7a5b5
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue UnknownScript_0x7a5a9
	writetext UnknownText_0x7a8b5
	closetext
	loadmovesprites
	end
; 0x7a5a9

UnknownScript_0x7a5a9: ; 0x7a5a9
	writetext UnknownText_0x7a8e5
	closetext
	loadmovesprites
	end
; 0x7a5af

UnknownScript_0x7a5af: ; 0x7a5af
	writetext UnknownText_0x7a957
	closetext
	loadmovesprites
	end
; 0x7a5b5

UnknownScript_0x7a5b5: ; 0x7a5b5
	setevent $0076
UnknownScript_0x7a5b8: ; 0x7a5b8
	setevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	special Function16218
	closetext
	loadmovesprites
	end
; 0x7a5c1

NeighborScript:
	faceplayer
	loadfont
	checkmorn
	iftrue .MornScript
	checkday
	iftrue .DayScript
	checknite
	iftrue .NiteScript

.MornScript
	writetext NeighborMornIntroText
	keeptextopen
	jump .Main

.DayScript
	writetext NeighborDayIntroText
	keeptextopen
	jump .Main

.NiteScript
	writetext NeighborNiteIntroText
	keeptextopen
	jump .Main

.Main
	writetext NeighborText
	closetext
	loadmovesprites
	spriteface $6, RIGHT
	end

TVScript:
	jumptext TVText

StoveScript:
	jumptext StoveText

SinkScript:
	jumptext SinkText

FridgeScript:
	jumptext FridgeText

MovementData_0x7a5fc: ; 0x7a5fc
	turn_head_right
	step_end
; 0x7a5fe

MovementData_0x7a5fe: ; 0x7a5fe
	slow_step_right
	step_end
; 0x7a600

MovementData_0x7a600: ; 0x7a600
	turn_head_left
	step_end
; 0x7a602

MovementData_0x7a602: ; 0x7a602
	slow_step_left
	step_end
; 0x7a604

UnknownText_0x7a604: ; 0x7a604
	text "Oh, ", $52, "…! Our"
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
; 0x7a6bd

UnknownText_0x7a6bd: ; 0x7a6bd
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
; 0x7a742

UnknownText_0x7a742: ; 0x7a742
	text "Is it Daylight"
	line "Saving Time now?"
	done
; 0x7a763

UnknownText_0x7a763: ; 0x7a763
	text "Come home to"
	line "adjust your clock"

	para "for Daylight"
	line "Saving Time."

	para "By the way, do you"
	line "know how to use"
	cont "the PHONE?"
	done
; 0x7a7cb

UnknownText_0x7a7cb: ; 0x7a7cb
	text "Don't you just"
	line "turn the #GEAR"

	para "on and select the"
	line "PHONE icon?"
	done
; 0x7a807

UnknownText_0x7a807: ; 0x7a807
	text "I'll read the"
	line "instructions."

	para "Turn the #GEAR"
	line "on and select the"
	cont "PHONE icon."
	done
; 0x7a850

UnknownText_0x7a850: ; 0x7a850
	text "Phone numbers are"
	line "stored in memory."

	para "Just choose a name"
	line "you want to call."

	para "Gee, isn't that"
	line "convenient?"
	done
; 0x7a8b5

UnknownText_0x7a8b5: ; 0x7a8b5
	text "PROF.ELM is wait-"
	line "ing for you."

	para "Hurry up, baby!"
	done
; 0x7a8e5

UnknownText_0x7a8e5: ; 0x7a8e5
	text "So, what was PROF."
	line "ELM's errand?"

	para "…"

	para "That does sound"
	line "challenging."

	para "But, you should be"
	line "proud that people"
	cont "rely on you."
	done
; 0x7a957

UnknownText_0x7a957: ; 0x7a957
	text $52, ", do it!"

	para "I'm behind you all"
	line "the way!"
	done
; 0x7a97d

NeighborMornIntroText:
	text "Good morning,"
	line $14, "!"

	para "I'm visiting!"
	done

NeighborDayIntroText:
	text "Hello, ", $14, "!"
	line "I'm visiting!"
	done

NeighborNiteIntroText:
	text "Good evening,"
	line $14, "!"

	para "I'm visiting!"
	done

NeighborText:
	text $14, ", have you"
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

KrissHouse1F_MapEventHeader: ; 0x7ab31
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $6, 2, GROUP_NEW_BARK_TOWN, MAP_NEW_BARK_TOWN
	warp_def $7, $7, 2, GROUP_NEW_BARK_TOWN, MAP_NEW_BARK_TOWN
	warp_def $0, $9, 1, GROUP_KRISS_HOUSE_2F, MAP_KRISS_HOUSE_2F

	; xy triggers
	db 2
	xy_trigger 0, $4, $8, $0, UnknownScript_0x7a4d8, $0, $0
	xy_trigger 0, $4, $9, $0, UnknownScript_0x7a4db, $0, $0

	; signposts
	db 4
	signpost 1, 0, $0, StoveScript
	signpost 1, 1, $0, SinkScript
	signpost 1, 2, $0, FridgeScript
	signpost 1, 4, $0, TVScript

	; people-events
	db 5
	person_event SPRITE_MOM, 8, 11, $8, $0, 255, 255, $0, 0, MomScript_0x7a582, $06c7
	person_event SPRITE_MOM, 6, 6, $7, $0, 255, 1, $0, 0, MomScript_0x7a582, $06c8
	person_event SPRITE_MOM, 8, 11, $8, $0, 255, 2, $0, 0, MomScript_0x7a582, $06c8
	person_event SPRITE_MOM, 6, 4, $7, $0, 255, 4, $0, 0, MomScript_0x7a582, $06c8
	person_event SPRITE_POKEFAN_F, 8, 8, $9, $0, 255, 255, $80, 0, NeighborScript, $0792
; 0x7abab
