const_value set 2
	const ROUTE29_COOLTRAINER_M1
	const ROUTE29_YOUNGSTER
	const ROUTE29_TEACHER1
	const ROUTE29_FRUIT_TREE
	const ROUTE29_FISHER
	const ROUTE29_COOLTRAINER_M2
	const ROUTE29_TEACHER2
	const ROUTE29_POKE_BALL

Route29_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x1a0f59, 0
	dw UnknownScript_0x1a0f5a, 0

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
	disappear ROUTE29_TEACHER2
	return

.DoesTuscanyAppear
	checkcode VAR_WEEKDAY
	if_not_equal TUESDAY, .TuscanyDisappears
	appear ROUTE29_TEACHER2
	return

UnknownScript_0x1a0f6d:
	spriteface ROUTE29_COOLTRAINER_M1, UP
	showemote EMOTE_SHOCK, ROUTE29_COOLTRAINER_M1, 15
	applymovement ROUTE29_COOLTRAINER_M1, MovementData_0x1a108d
	spriteface PLAYER, LEFT
	setevent EVENT_DUDE_TALKED_TO_YOU
	loadfont
	writetext UnknownText_0x1a10df
	yesorno
	iffalse UnknownScript_0x1a0fd9
	closetext
	follow ROUTE29_COOLTRAINER_M1, PLAYER
	applymovement ROUTE29_COOLTRAINER_M1, MovementData_0x1a109a
	stopfollow
	scriptedpokedata RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	spriteface ROUTE29_COOLTRAINER_M1, UP
	loadfont
	writetext UnknownText_0x1a114d
	waitbutton
	closetext
	dotrigger $0
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

UnknownScript_0x1a0fa3:
	spriteface ROUTE29_COOLTRAINER_M1, UP
	showemote EMOTE_SHOCK, ROUTE29_COOLTRAINER_M1, 15
	applymovement ROUTE29_COOLTRAINER_M1, MovementData_0x1a1094
	spriteface PLAYER, LEFT
	setevent EVENT_DUDE_TALKED_TO_YOU
	loadfont
	writetext UnknownText_0x1a10df
	yesorno
	iffalse UnknownScript_0x1a0fe5
	closetext
	follow ROUTE29_COOLTRAINER_M1, PLAYER
	applymovement ROUTE29_COOLTRAINER_M1, MovementData_0x1a10a1
	stopfollow
	scriptedpokedata RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	spriteface ROUTE29_COOLTRAINER_M1, UP
	loadfont
	writetext UnknownText_0x1a114d
	waitbutton
	closetext
	dotrigger $0
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

UnknownScript_0x1a0fd9:
	writetext UnknownText_0x1a1197
	waitbutton
	closetext
	applymovement ROUTE29_COOLTRAINER_M1, MovementData_0x1a109a
	dotrigger $0
	end

UnknownScript_0x1a0fe5:
	writetext UnknownText_0x1a1197
	waitbutton
	closetext
	applymovement ROUTE29_COOLTRAINER_M1, MovementData_0x1a10a1
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
	closetext
	scriptedpokedata RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	loadfont
	writetext UnknownText_0x1a114d
	waitbutton
	closetext
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

UnknownScript_0x1a101c:
	writetext UnknownText_0x1a10a7
	waitbutton
	closetext
	end

UnknownScript_0x1a1022:
	writetext UnknownText_0x1a1197
	waitbutton
	closetext
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
	waitbutton
	closetext
	end

UnknownScript_0x1a1043:
	writetext UnknownText_0x1a137c
	waitbutton
	closetext
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
	buttonsound
	setevent EVENT_MET_TUSCANY_OF_TUESDAY
.MetTuscany
	writetext TuscanyGivesGiftText
	buttonsound
	verbosegiveitem PINK_BOW
	iffalse TuscanyDoneScript
	setevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	writetext TuscanyGaveGiftText
	waitbutton
	closetext
	end

TuscanyTuesdayScript:
	writetext TuscanyTuesdayText
	waitbutton
TuscanyDoneScript:
	closetext
	end

TuscanyNotTuesdayScript:
	writetext TuscanyNotTuesdayText
	waitbutton
	closetext
	end

MapRoute29Signpost0Script:
	jumptext UnknownText_0x1a158e

MapRoute29Signpost1Script:
	jumptext UnknownText_0x1a15b9

FruitTreeScript_0x1a1089:
	fruittree FRUITTREE_ROUTE_29

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
	warp_def $1, $1b, 3, ROUTE_29_46_GATE

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
	person_event SPRITE_COOLTRAINER_M, 12, 50, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CooltrainerMScript_0x1a0ff1, -1
	person_event SPRITE_YOUNGSTER, 16, 27, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x1a1028, -1
	person_event SPRITE_TEACHER, 11, 15, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TeacherScript_0x1a102b, -1
	person_event SPRITE_FRUIT_TREE, 2, 12, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FruitTreeScript_0x1a1089, -1
	person_event SPRITE_FISHER, 3, 25, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FisherScript_0x1a102e, -1
	person_event SPRITE_COOLTRAINER_M, 4, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CooltrainerMScript_0x1a1031, -1
	person_event SPRITE_TEACHER, 12, 29, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TuscanyScript, EVENT_ROUTE_29_TUSCANY_OF_TUESDAY
	person_event SPRITE_POKE_BALL, 2, 48, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMFRAGMENT, 0, ItemFragment_0x1a108b, EVENT_ROUTE_29_POTION
