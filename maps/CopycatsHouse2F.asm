CopycatsHouse2F_MapScriptHeader: ; 0x18ae9a
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 2, CopycatsHouse2FCallback
; 0x18ae9f

CopycatsHouse2FCallback:
	checkflag $0063
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
	checkflag $0063
	iftrue .Part1
	applymovement $2, MovementData_0x18afd0
	faceplayer
	variablesprite $b, $1
	jump .Part2

.Part1
	applymovement $7, MovementData_0x18afd0
	faceplayer
	variablesprite $b, $60
.Part2
	special Function14209
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .Part7
	loadfont
	checkflag $0063
	iftrue .Part3
	writetext UnknownText_0x18afda
	jump .Part4

.Part3
	writetext UnknownText_0x18b316
.Part4
	closetext
	loadmovesprites
	checkflag $0063
	iftrue .Part5
	applymovement $2, MovementData_0x18afd0
	jump .Part6

.Part5
	applymovement $7, MovementData_0x18afd0
.Part6
	faceplayer
	variablesprite $b, $28
	special Function14209
	loadfont
	writetext UnknownText_0x18b028
	closetext
	loadmovesprites
	end

.Part7
	loadfont
	checkflag $0063
	iftrue .Part8
	writetext UnknownText_0x18b064
	jump .Part9

.Part8
	writetext UnknownText_0x18b366
.Part9
	closetext
	loadmovesprites
	checkflag $0063
	iftrue .Part10
	applymovement $2, MovementData_0x18afd0
	jump .Part11

.Part10
	applymovement $7, MovementData_0x18afd0
.Part11
	faceplayer
	variablesprite $b, $28
	special Function14209
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
	clearevent $0773
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
	checkflag $0063
	iftrue .Part16
	applymovement $2, MovementData_0x18afd0
	faceplayer
	variablesprite $b, $1
	jump .Part17

.Part16
	applymovement $7, MovementData_0x18afd0
	faceplayer
	variablesprite $b, $60
.Part17
	special Function14209
	loadfont
	checkflag $0063
	iftrue .Part18
	writetext UnknownText_0x18b298
	jump .Part19

.Part18
	writetext UnknownText_0x18b415
.Part19
	closetext
	loadmovesprites
	checkflag $0063
	iftrue .Part20
	applymovement $2, MovementData_0x18afd0
	jump .Part21

.Part20
	applymovement $7, MovementData_0x18afd0
.Part21
	faceplayer
	variablesprite $b, $28
	special Function14209
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

MovementData_0x18afd0: ; 0x18afd0
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
; 0x18afda

UnknownText_0x18afda: ; 0x18afda
	text "<PLAYER>: Hi! Do"
	line "you like #MON?"

	para "<PLAYER>: Uh, no, I"
	line "just asked you."

	para "<PLAYER>: Huh?"
	line "You're strange!"
	done
; 0x18b028

UnknownText_0x18b028: ; 0x18b028
	text "COPYCAT: Hmm?"
	line "Quit mimicking?"

	para "But that's my"
	line "favorite hobby!"
	done
; 0x18b064

UnknownText_0x18b064: ; 0x18b064
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
; 0x18b116

UnknownText_0x18b116: ; 0x18b116
	text "COPYCAT: Pardon?"

	para "I shouldn't decide"
	line "what you should"
	cont "do?"

	para "But I'm really"
	line "worried… What if"
	cont "someone finds it?"
	done
; 0x18b17f

UnknownText_0x18b17f: ; 0x18b17f
	text "COPYCAT: Yay!"
	line "That's my CLEFAIRY"
	cont "# DOLL!"

	para "See the tear where"
	line "the right leg is"

	para "sewn on? That's"
	line "proof!"
	done
; 0x18b1e2

UnknownText_0x18b1e2: ; 0x18b1e2
	text "OK. Here's the"
	line "MAGNET TRAIN PASS"
	cont "like I promised!"
	done
; 0x18b214

UnknownText_0x18b214: ; 0x18b214
	text "COPYCAT: That's"
	line "the PASS for the"
	cont "MAGNET TRAIN."

	para "The rail company"
	line "man gave me that"

	para "when they tore"
	line "down our old house"
	cont "for the STATION."
	done
; 0x18b298

UnknownText_0x18b298: ; 0x18b298
	text "<PLAYER>: Hi!"
	line "Thanks a lot for"
	cont "the rail PASS!"

	para "<PLAYER>: Pardon?"

	para "<PLAYER>: Is it"
	line "that fun to mimic"
	cont "my every move?"
	done
; 0x18b2f5

UnknownText_0x18b2f5: ; 0x18b2f5
	text "COPYCAT: You bet!"
	line "It's a scream!"
	done
; 0x18b316

UnknownText_0x18b316: ; 0x18b316
	text "<PLAYER>: Hi. You"
	line "must like #MON."

	para "<PLAYER>: No, not"
	line "me. I asked you."

	para "<PLAYER>: Pardon?"
	line "You're weird!"
	done
; 0x18b366

UnknownText_0x18b366: ; 0x18b366
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
; 0x18b415

UnknownText_0x18b415: ; 0x18b415
	text "<PLAYER>: Thank you"
	line "for the rail PASS!"

	para "<PLAYER>: …Pardon?"

	para "<PLAYER>: Is it"
	line "really that fun to"

	para "copy what I say"
	line "and do?"
	done
; 0x18b476

CopycatsDodrioText1: ; 0x18b476
	text "DODRIO: Gii giii!"
	done
; 0x18b489

CopycatsDodrioText2: ; 0x18b489
	text "MIRROR, MIRROR ON"
	line "THE WALL, WHO'S"

	para "THE FAIREST ONE OF"
	line "ALL?"
	done
; 0x18b4c4

CopycatsHouse2FDollText:
	text "This is a rare"
	line "#MON! Huh?"

	para "It's only a doll…"
	done

CopycatsHouse2F_MapEventHeader: ; 0x18b4f0
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $0, $3, 3, GROUP_COPYCATS_HOUSE_1F, MAP_COPYCATS_HOUSE_1F

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, CopycatsHouse2FBookshelf
	signpost 1, 1, $0, CopycatsHouse2FBookshelf

	; people-events
	db 6
	person_event SPRITE_COPYCAT, 7, 8, $8, $0, 255, 255, $80, 0, Copycat, $06ee
	person_event SPRITE_MOLTRES, 8, 10, $16, $0, 255, 255, $b0, 0, CopycatsDodrio, $ffff
	person_event SPRITE_FAIRY, 5, 10, $6, $0, 255, 255, $80, 0, CopycatsHouse2FDoll, $0773
	person_event SPRITE_MONSTER, 5, 6, $6, $0, 255, 255, $a0, 0, CopycatsHouse2FDoll, $ffff
	person_event SPRITE_BIRD, 5, 11, $6, $0, 255, 255, $90, 0, CopycatsHouse2FDoll, $ffff
	person_event SPRITE_COPYCAT, 7, 8, $8, $0, 255, 255, $90, 0, Copycat, $06ef
; 0x18b553
