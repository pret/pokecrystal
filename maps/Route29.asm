Route29_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x1a0f59, $0000
	dw UnknownScript_0x1a0f5a, $0000

.MapCallbacks:
	db 1

	; callbacks

	dbw 2, TuscanyCallback

UnknownScript_0x1a0f59:
	end

UnknownScript_0x1a0f5a:
	end

TuscanyCallback:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .DoesTuscanyAppear

.TuscanyDisappears
	disappear $8
	return

.DoesTuscanyAppear
	checkcode VAR_WEEKDAY
	if_not_equal TUESDAY, .TuscanyDisappears
	appear $8
	return

UnknownScript_0x1a0f6d:
	spriteface $2, UP
	showemote EMOTE_SHOCK, $2, 15
	applymovement $2, MovementData_0x1a108d
	spriteface $0, LEFT
	setevent EVENT_DUDE_TALKED_TO_YOU
	loadfont
	writetext UnknownText_0x1a10df
	yesorno
	iffalse UnknownScript_0x1a0fd9
	loadmovesprites
	follow $2, $0
	applymovement $2, MovementData_0x1a109a
	stopfollow
	loadpokedata RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	spriteface $2, UP
	loadfont
	writetext UnknownText_0x1a114d
	closetext
	loadmovesprites
	dotrigger $0
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

UnknownScript_0x1a0fa3:
	spriteface $2, UP
	showemote EMOTE_SHOCK, $2, 15
	applymovement $2, MovementData_0x1a1094
	spriteface $0, LEFT
	setevent EVENT_DUDE_TALKED_TO_YOU
	loadfont
	writetext UnknownText_0x1a10df
	yesorno
	iffalse UnknownScript_0x1a0fe5
	loadmovesprites
	follow $2, $0
	applymovement $2, MovementData_0x1a10a1
	stopfollow
	loadpokedata RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	spriteface $2, UP
	loadfont
	writetext UnknownText_0x1a114d
	closetext
	loadmovesprites
	dotrigger $0
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

UnknownScript_0x1a0fd9:
	writetext UnknownText_0x1a1197
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x1a109a
	dotrigger $0
	end

UnknownScript_0x1a0fe5:
	writetext UnknownText_0x1a1197
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x1a10a1
	dotrigger $0
	end

CooltrainerMScript_0x1a0ff1:
	faceplayer
	loadfont
	checkcode VAR_BOXSPACE
	if_equal $0, UnknownScript_0x1a101c
	checkevent EVENT_LEARNED_TO_CATCH_POKEMON
	iftrue UnknownScript_0x1a101c
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalse UnknownScript_0x1a101c
	writetext UnknownText_0x1a11e3
	yesorno
	iffalse UnknownScript_0x1a1022
	loadmovesprites
	loadpokedata RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	loadfont
	writetext UnknownText_0x1a114d
	closetext
	loadmovesprites
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

UnknownScript_0x1a101c:
	writetext UnknownText_0x1a10a7
	closetext
	loadmovesprites
	end

UnknownScript_0x1a1022:
	writetext UnknownText_0x1a1197
	closetext
	loadmovesprites
	end

YoungsterScript_0x1a1028:
	jumptextfaceplayer UnknownText_0x1a1214

TeacherScript_0x1a102b:
	jumptextfaceplayer UnknownText_0x1a126c

FisherScript_0x1a102e:
	jumptextfaceplayer UnknownText_0x1a12d9

CooltrainerMScript_0x1a1031:
	faceplayer
	loadfont
	checkday
	iftrue UnknownScript_0x1a103d
	checknite
	iftrue UnknownScript_0x1a1043
UnknownScript_0x1a103d:
	writetext UnknownText_0x1a134c
	closetext
	loadmovesprites
	end

UnknownScript_0x1a1043:
	writetext UnknownText_0x1a137c
	closetext
	loadmovesprites
	end

TuscanyScript:
	faceplayer
	loadfont
	checkevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	iftrue TuscanyTuesdayScript
	checkcode VAR_WEEKDAY
	if_not_equal TUESDAY, TuscanyNotTuesdayScript
	checkevent EVENT_MET_TUSCANY_OF_TUESDAY
	iftrue .MetTuscany
	writetext MeetTuscanyText
	keeptextopen
	setevent EVENT_MET_TUSCANY_OF_TUESDAY
.MetTuscany
	writetext TuscanyGivesGiftText
	keeptextopen
	verbosegiveitem PINK_BOW, 1
	iffalse TuscanyDoneScript
	setevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	writetext TuscanyGaveGiftText
	closetext
	loadmovesprites
	end

TuscanyTuesdayScript:
	writetext TuscanyTuesdayText
	closetext
TuscanyDoneScript:
	loadmovesprites
	end

TuscanyNotTuesdayScript:
	writetext TuscanyNotTuesdayText
	closetext
	loadmovesprites
	end

MapRoute29Signpost0Script:
	jumptext UnknownText_0x1a158e

MapRoute29Signpost1Script:
	jumptext UnknownText_0x1a15b9

FruitTreeScript_0x1a1089:
	fruittree $1

ItemFragment_0x1a108b:
	db POTION, 1

MovementData_0x1a108d:
	step_up
	step_up
	step_up
	step_up
	step_right
	step_right
	step_end

MovementData_0x1a1094:
	step_up
	step_up
	step_up
	step_right
	step_right
	step_end

MovementData_0x1a109a:
	step_left
	step_left
	step_down
	step_down
	step_down
	step_down
	step_end

MovementData_0x1a10a1:
	step_left
	step_left
	step_down
	step_down
	step_down
	step_end

UnknownText_0x1a10a7:
	text "#MON hide in"
	line "the grass. Who"

	para "knows when they'll"
	line "pop out…"
	done

UnknownText_0x1a10df:
	text "I've seen you a"
	line "couple times. How"

	para "many #MON have"
	line "you caught?"

	para "Would you like me"
	line "to show you how to"
	cont "catch #MON?"
	done

UnknownText_0x1a114d:
	text "That's how you do"
	line "it."

	para "If you weaken them"
	line "first, #MON are"
	cont "easier to catch."
	done

UnknownText_0x1a1197:
	text "Oh. Fine, then."

	para "Anyway, if you"
	line "want to catch"

	para "#MON, you have"
	line "to walk a lot."
	done

UnknownText_0x1a11e3:
	text "Huh? You want me"
	line "to show you how to"
	cont "catch #MON?"
	done

UnknownText_0x1a1214:
	text "Yo. How are your"
	line "#MON?"

	para "If they're weak"
	line "and not ready for"

	para "battle, keep out"
	line "of the grass."
	done

UnknownText_0x1a126c:
	text "See those ledges?"
	line "It's scary to jump"
	cont "off them."

	para "But you can go to"
	line "NEW BARK without"

	para "walking through"
	line "the grass."
	done

UnknownText_0x1a12d9:
	text "I wanted to take a"
	line "break, so I saved"

	para "to record my"
	line "progress."
	done

; possibly unused
UnknownText_0x1a1316:
	text "I'm waiting for"
	line "#MON that"

	para "appear only in the"
	line "daytime."
	done

UnknownText_0x1a134c:
	text "I'm waiting for"
	line "#MON that"

	para "appear only at"
	line "night."
	done

UnknownText_0x1a137c:
	text "I'm waiting for"
	line "#MON that"

	para "appear only in the"
	line "morning."
	done

MeetTuscanyText:
	text "TUSCANY: I do be-"
	line "lieve that this is"

	para "the first time"
	line "we've met?"

	para "Please allow me to"
	line "introduce myself."

	para "I am TUSCANY of"
	line "Tuesday."
	done

TuscanyGivesGiftText:
	text "By way of intro-"
	line "duction, please"

	para "accept this gift,"
	line "a PINK BOW."
	done

TuscanyGaveGiftText:
	text "TUSCANY: Wouldn't"
	line "you agree that it"
	cont "is most adorable?"

	para "It strengthens"
	line "normal-type moves."

	para "I am certain it"
	line "will be of use."
	done

TuscanyTuesdayText:
	text "TUSCANY: Have you"
	line "met MONICA, my"
	cont "older sister?"

	para "Or my younger"
	line "brother, WESLEY?"

	para "I am the second of"
	line "seven children."
	done

TuscanyNotTuesdayText:
	text "TUSCANY: Today is"
	line "not Tuesday. That"
	cont "is unfortunate…"
	done

UnknownText_0x1a158e:
	text "ROUTE 29"

	para "CHERRYGROVE CITY -"
	line "NEW BARK TOWN"
	done

UnknownText_0x1a15b9:
	text "ROUTE 29"

	para "CHERRYGROVE CITY -"
	line "NEW BARK TOWN"
	done

Route29_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def $1, $1b, 3, GROUP_ROUTE_29_46_GATE, MAP_ROUTE_29_46_GATE

.XYTriggers:
	db 2
	xy_trigger 1, $8, $35, $0, UnknownScript_0x1a0f6d, $0, $0
	xy_trigger 1, $9, $35, $0, UnknownScript_0x1a0fa3, $0, $0

.Signposts:
	db 2
	signpost 7, 51, SIGNPOST_READ, MapRoute29Signpost0Script
	signpost 5, 3, SIGNPOST_READ, MapRoute29Signpost1Script

.PersonEvents:
	db 8
	person_event SPRITE_COOLTRAINER_M, 16, 54, OW_DOWN | $3, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, CooltrainerMScript_0x1a0ff1, -1
	person_event SPRITE_YOUNGSTER, 20, 31, OW_UP | $0, $10, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, YoungsterScript_0x1a1028, -1
	person_event SPRITE_TEACHER, 15, 19, OW_UP | $1, $1, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, TeacherScript_0x1a102b, -1
	person_event SPRITE_FRUIT_TREE, 6, 16, OW_DOWN | $1, $0, -1, -1, $0, 0, FruitTreeScript_0x1a1089, -1
	person_event SPRITE_FISHER, 7, 29, OW_UP | $3, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, FisherScript_0x1a102e, -1
	person_event SPRITE_COOLTRAINER_M, 8, 17, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, CooltrainerMScript_0x1a1031, -1
	person_event SPRITE_TEACHER, 16, 33, OW_DOWN | $3, $0, -1, -1, $0, 0, TuscanyScript, EVENT_ROUTE_29_TUSCANY_OF_TUESDAY
	person_event SPRITE_POKE_BALL, 6, 52, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x1a108b, EVENT_ROUTE_29_POTION
