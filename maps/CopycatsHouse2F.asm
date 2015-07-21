CopycatsHouse2F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw 2, CopycatsHouse2FCallback

CopycatsHouse2FCallback:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Part1
	disappear $7
	appear $2
	jump .Done
.Part1
	disappear $2
	appear $7
.Done
	return

Copycat:
	faceplayer
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iftrue .Part15
	checkevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	iftrue .Part13
	checkitem LOST_ITEM
	iftrue .Part12
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Part1
	applymovement $2, MovementData_0x18afd0
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_CHRIS
	jump .Part2

.Part1
	applymovement $7, MovementData_0x18afd0
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_KRIS
.Part2
	special RunCallback_04
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .Part7
	loadfont
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Part3
	writetext UnknownText_0x18afda
	jump .Part4

.Part3
	writetext UnknownText_0x18b316
.Part4
	closetext
	loadmovesprites
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Part5
	applymovement $2, MovementData_0x18afd0
	jump .Part6

.Part5
	applymovement $7, MovementData_0x18afd0
.Part6
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special RunCallback_04
	loadfont
	writetext UnknownText_0x18b028
	closetext
	loadmovesprites
	end

.Part7
	loadfont
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Part8
	writetext UnknownText_0x18b064
	jump .Part9

.Part8
	writetext UnknownText_0x18b366
.Part9
	closetext
	loadmovesprites
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Part10
	applymovement $2, MovementData_0x18afd0
	jump .Part11

.Part10
	applymovement $7, MovementData_0x18afd0
.Part11
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special RunCallback_04
	loadfont
	writetext UnknownText_0x18b116
	closetext
	loadmovesprites
	setevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	end

.Part12
	loadfont
	writetext UnknownText_0x18b17f
	keeptextopen
	takeitem LOST_ITEM, 1
	setevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	clearevent EVENT_COPYCATS_HOUSE_2F_DOLL
	jump .Part14

.Part13
	loadfont
.Part14
	writetext UnknownText_0x18b1e2
	keeptextopen
	verbosegiveitem PASS, 1
	iffalse .Part22
	setevent EVENT_GOT_PASS_FROM_COPYCAT
	writetext UnknownText_0x18b214
	closetext
	loadmovesprites
	end

.Part15
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Part16
	applymovement $2, MovementData_0x18afd0
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_CHRIS
	jump .Part17

.Part16
	applymovement $7, MovementData_0x18afd0
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_KRIS
.Part17
	special RunCallback_04
	loadfont
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Part18
	writetext UnknownText_0x18b298
	jump .Part19

.Part18
	writetext UnknownText_0x18b415
.Part19
	closetext
	loadmovesprites
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Part20
	applymovement $2, MovementData_0x18afd0
	jump .Part21

.Part20
	applymovement $7, MovementData_0x18afd0
.Part21
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special RunCallback_04
	loadfont
	writetext UnknownText_0x18b2f5
	closetext
.Part22
	loadmovesprites
	end

CopycatsDodrio:
	loadfont
	writetext CopycatsDodrioText1
	cry DODRIO
	keeptextopen
	writetext CopycatsDodrioText2
	closetext
	loadmovesprites
	end

CopycatsHouse2FDoll:
	jumptext CopycatsHouse2FDollText

CopycatsHouse2FBookshelf:
	jumpstd picturebookshelf

MovementData_0x18afd0:
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	step_end

UnknownText_0x18afda:
	text "<PLAYER>: Hi! Do"
	line "you like #MON?"

	para "<PLAYER>: Uh, no, I"
	line "just asked you."

	para "<PLAYER>: Huh?"
	line "You're strange!"
	done

UnknownText_0x18b028:
	text "COPYCAT: Hmm?"
	line "Quit mimicking?"

	para "But that's my"
	line "favorite hobby!"
	done

UnknownText_0x18b064:
	text "<PLAYER>: Hi!"
	line "I heard that you"

	para "lost your favorite"
	line "# DOLL."

	para "<PLAYER>: If I find"
	line "it, you'll give me"
	cont "a rail PASS?"

	para "<PLAYER>: I'll go"
	line "find it for you."

	para "You think you lost"
	line "it when you went"
	cont "to VERMILION CITY?"
	done

UnknownText_0x18b116:
	text "COPYCAT: Pardon?"

	para "I shouldn't decide"
	line "what you should"
	cont "do?"

	para "But I'm really"
	line "worried… What if"
	cont "someone finds it?"
	done

UnknownText_0x18b17f:
	text "COPYCAT: Yay!"
	line "That's my CLEFAIRY"
	cont "# DOLL!"

	para "See the tear where"
	line "the right leg is"

	para "sewn on? That's"
	line "proof!"
	done

UnknownText_0x18b1e2:
	text "OK. Here's the"
	line "MAGNET TRAIN PASS"
	cont "like I promised!"
	done

UnknownText_0x18b214:
	text "COPYCAT: That's"
	line "the PASS for the"
	cont "MAGNET TRAIN."

	para "The rail company"
	line "man gave me that"

	para "when they tore"
	line "down our old house"
	cont "for the STATION."
	done

UnknownText_0x18b298:
	text "<PLAYER>: Hi!"
	line "Thanks a lot for"
	cont "the rail PASS!"

	para "<PLAYER>: Pardon?"

	para "<PLAYER>: Is it"
	line "that fun to mimic"
	cont "my every move?"
	done

UnknownText_0x18b2f5:
	text "COPYCAT: You bet!"
	line "It's a scream!"
	done

UnknownText_0x18b316:
	text "<PLAYER>: Hi. You"
	line "must like #MON."

	para "<PLAYER>: No, not"
	line "me. I asked you."

	para "<PLAYER>: Pardon?"
	line "You're weird!"
	done

UnknownText_0x18b366:
	text "<PLAYER>: Hi. Did"
	line "you really lose"
	cont "your # DOLL?"

	para "<PLAYER>: You'll"
	line "really give me a"

	para "rail PASS if I"
	line "find it for you?"

	para "<PLAYER>: Sure,"
	line "I'll look for it!"

	para "You think you lost"
	line "it when you were"
	cont "in VERMILION?"
	done

UnknownText_0x18b415:
	text "<PLAYER>: Thank you"
	line "for the rail PASS!"

	para "<PLAYER>: …Pardon?"

	para "<PLAYER>: Is it"
	line "really that fun to"

	para "copy what I say"
	line "and do?"
	done

CopycatsDodrioText1:
	text "DODRIO: Gii giii!"
	done

CopycatsDodrioText2:
	text "MIRROR, MIRROR ON"
	line "THE WALL, WHO'S"

	para "THE FAIREST ONE OF"
	line "ALL?"
	done

CopycatsHouse2FDollText:
	text "This is a rare"
	line "#MON! Huh?"

	para "It's only a doll…"
	done

CopycatsHouse2F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def $0, $3, 3, GROUP_COPYCATS_HOUSE_1F, MAP_COPYCATS_HOUSE_1F

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, CopycatsHouse2FBookshelf
	signpost 1, 1, SIGNPOST_READ, CopycatsHouse2FBookshelf

.PersonEvents:
	db 6
	person_event SPRITE_COPYCAT, 7, 8, OW_LEFT | $0, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, Copycat, EVENT_COPYCAT_1
	person_event SPRITE_MOLTRES, 8, 10, OW_UP | $12, $0, -1, -1, (PAL_OW_BROWN << 4) | $80, 0, CopycatsDodrio, -1
	person_event SPRITE_FAIRY, 5, 10, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, CopycatsHouse2FDoll, EVENT_COPYCATS_HOUSE_2F_DOLL
	person_event SPRITE_MONSTER, 5, 6, OW_UP | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, CopycatsHouse2FDoll, -1
	person_event SPRITE_BIRD, 5, 11, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, CopycatsHouse2FDoll, -1
	person_event SPRITE_COPYCAT, 7, 8, OW_LEFT | $0, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, Copycat, EVENT_COPYCAT_2
