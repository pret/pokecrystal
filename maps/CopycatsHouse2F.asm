CopycatsHouse2F_MapScriptHeader: ; 0x18ae9a
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x18ae9f
; 0x18ae9f

UnknownScript_0x18ae9f: ; 0x18ae9f
	checkflag $0063
	iftrue UnknownScript_0x18aeac
	disappear $7
	appear $2
	2jump UnknownScript_0x18aeb0
; 0x18aeac

UnknownScript_0x18aeac: ; 0x18aeac
	disappear $2
	appear $7
UnknownScript_0x18aeb0: ; 0x18aeb0
	return
; 0x18aeb1

CopycatScript_0x18aeb1: ; 0x18aeb1
	faceplayer
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iftrue UnknownScript_0x18af6f
	checkevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	iftrue UnknownScript_0x18af5b
	checkitem LOST_ITEM
	iftrue UnknownScript_0x18af4a
	checkflag $0063
	iftrue UnknownScript_0x18aed4
	applymovement $2, MovementData_0x18afd0
	faceplayer
	variablesprite $b, $1
	2jump UnknownScript_0x18aedc
; 0x18aed4

UnknownScript_0x18aed4: ; 0x18aed4
	applymovement $7, MovementData_0x18afd0
	faceplayer
	variablesprite $b, $60
UnknownScript_0x18aedc: ; 0x18aedc
	special $005e
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x18af16
	loadfont
	checkflag $0063
	iftrue UnknownScript_0x18aef2
	2writetext UnknownText_0x18afda
	2jump UnknownScript_0x18aef5
; 0x18aef2

UnknownScript_0x18aef2: ; 0x18aef2
	2writetext UnknownText_0x18b316
UnknownScript_0x18aef5: ; 0x18aef5
	closetext
	loadmovesprites
	checkflag $0063
	iftrue UnknownScript_0x18af04
	applymovement $2, MovementData_0x18afd0
	2jump UnknownScript_0x18af08
; 0x18af04

UnknownScript_0x18af04: ; 0x18af04
	applymovement $7, MovementData_0x18afd0
UnknownScript_0x18af08: ; 0x18af08
	faceplayer
	variablesprite $b, $28
	special $005e
	loadfont
	2writetext UnknownText_0x18b028
	closetext
	loadmovesprites
	end
; 0x18af16

UnknownScript_0x18af16: ; 0x18af16
	loadfont
	checkflag $0063
	iftrue UnknownScript_0x18af23
	2writetext UnknownText_0x18b064
	2jump UnknownScript_0x18af26
; 0x18af23

UnknownScript_0x18af23: ; 0x18af23
	2writetext UnknownText_0x18b366
UnknownScript_0x18af26: ; 0x18af26
	closetext
	loadmovesprites
	checkflag $0063
	iftrue UnknownScript_0x18af35
	applymovement $2, MovementData_0x18afd0
	2jump UnknownScript_0x18af39
; 0x18af35

UnknownScript_0x18af35: ; 0x18af35
	applymovement $7, MovementData_0x18afd0
UnknownScript_0x18af39: ; 0x18af39
	faceplayer
	variablesprite $b, $28
	special $005e
	loadfont
	2writetext UnknownText_0x18b116
	closetext
	loadmovesprites
	setevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	end
; 0x18af4a

UnknownScript_0x18af4a: ; 0x18af4a
	loadfont
	2writetext UnknownText_0x18b17f
	keeptextopen
	takeitem LOST_ITEM, 1
	setevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	clearevent $0773
	2jump UnknownScript_0x18af5c
; 0x18af5b

UnknownScript_0x18af5b: ; 0x18af5b
	loadfont
UnknownScript_0x18af5c: ; 0x18af5c
	2writetext UnknownText_0x18b1e2
	keeptextopen
	verbosegiveitem PASS, 1
	iffalse UnknownScript_0x18afba
	setevent EVENT_GOT_PASS_FROM_COPYCAT
	2writetext UnknownText_0x18b214
	closetext
	loadmovesprites
	end
; 0x18af6f

UnknownScript_0x18af6f: ; 0x18af6f
	checkflag $0063
	iftrue UnknownScript_0x18af80
	applymovement $2, MovementData_0x18afd0
	faceplayer
	variablesprite $b, $1
	2jump UnknownScript_0x18af88
; 0x18af80

UnknownScript_0x18af80: ; 0x18af80
	applymovement $7, MovementData_0x18afd0
	faceplayer
	variablesprite $b, $60
UnknownScript_0x18af88: ; 0x18af88
	special $005e
	loadfont
	checkflag $0063
	iftrue UnknownScript_0x18af98
	2writetext UnknownText_0x18b298
	2jump UnknownScript_0x18af9b
; 0x18af98

UnknownScript_0x18af98: ; 0x18af98
	2writetext UnknownText_0x18b415
UnknownScript_0x18af9b: ; 0x18af9b
	closetext
	loadmovesprites
	checkflag $0063
	iftrue UnknownScript_0x18afaa
	applymovement $2, MovementData_0x18afd0
	2jump UnknownScript_0x18afae
; 0x18afaa

UnknownScript_0x18afaa: ; 0x18afaa
	applymovement $7, MovementData_0x18afd0
UnknownScript_0x18afae: ; 0x18afae
	faceplayer
	variablesprite $b, $28
	special $005e
	loadfont
	2writetext UnknownText_0x18b2f5
	closetext
UnknownScript_0x18afba: ; 0x18afba
	loadmovesprites
	end
; 0x18afbc

MoltresScript_0x18afbc: ; 0x18afbc
	loadfont
	2writetext UnknownText_0x18b476
	cry DODRIO
	keeptextopen
	2writetext UnknownText_0x18b489
	closetext
	loadmovesprites
	end
; 0x18afca

FairyScript_0x18afca:
MonsterScript_0x18afca:
BirdScript_0x18afca: ; 0x18afca
	jumptext UnknownText_0x18b4c4
; 0x18afcd

MapCopycatsHouse2FSignpost1Script: ; 0x18afcd
	jumpstd $0002
; 0x18afd0

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
	text $52, ": Hi! Do"
	line "you like #MON?"

	para $52, ": Uh, no, I"
	line "just asked you."

	para $52, ": Huh?"
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
	text $52, ": Hi!"
	line "I heard that you"

	para "lost your favorite"
	line "# DOLL."

	para $52, ": If I find"
	line "it, you'll give me"
	cont "a rail PASS?"

	para $52, ": I'll go"
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
	text $52, ": Hi!"
	line "Thanks a lot for"
	cont "the rail PASS!"

	para $52, ": Pardon?"

	para $52, ": Is it"
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
	text $52, ": Hi. You"
	line "must like #MON."

	para $52, ": No, not"
	line "me. I asked you."

	para $52, ": Pardon?"
	line "You're weird!"
	done
; 0x18b366

UnknownText_0x18b366: ; 0x18b366
	text $52, ": Hi. Did"
	line "you really lose"
	cont "your # DOLL?"

	para $52, ": You'll"
	line "really give me a"

	para "rail PASS if I"
	line "find it for you?"

	para $52, ": Sure,"
	line "I'll look for it!"

	para "You think you lost"
	line "it when you were"
	cont "in VERMILION?"
	done
; 0x18b415

UnknownText_0x18b415: ; 0x18b415
	text $52, ": Thank you"
	line "for the rail PASS!"

	para $52, ": …Pardon?"

	para $52, ": Is it"
	line "really that fun to"

	para "copy what I say"
	line "and do?"
	done
; 0x18b476

UnknownText_0x18b476: ; 0x18b476
	text "DODRIO: Gii giii!"
	done
; 0x18b489

UnknownText_0x18b489: ; 0x18b489
	text "MIRROR, MIRROR ON"
	line "THE WALL, WHO'S"

	para "THE FAIREST ONE OF"
	line "ALL?"
	done
; 0x18b4c4

UnknownText_0x18b4c4: ; 0x18b4c4
	text "This is a rare"
	line "#MON! Huh?"

	para "It's only a doll…"
	done
; 0x18b4f0

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
	signpost 1, 0, $0, MapCopycatsHouse2FSignpost1Script
	signpost 1, 1, $0, MapCopycatsHouse2FSignpost1Script

	; people-events
	db 6
	person_event SPRITE_COPYCAT, 7, 8, $8, $0, 255, 255, $80, 0, CopycatScript_0x18aeb1, $06ee
	person_event SPRITE_MOLTRES, 8, 10, $16, $0, 255, 255, $b0, 0, MoltresScript_0x18afbc, $ffff
	person_event SPRITE_FAIRY, 5, 10, $6, $0, 255, 255, $80, 0, FairyScript_0x18afca, $0773
	person_event SPRITE_MONSTER, 5, 6, $6, $0, 255, 255, $a0, 0, MonsterScript_0x18afca, $ffff
	person_event SPRITE_BIRD, 5, 11, $6, $0, 255, 255, $90, 0, BirdScript_0x18afca, $ffff
	person_event SPRITE_COPYCAT, 7, 8, $8, $0, 255, 255, $90, 0, CopycatScript_0x18aeb1, $06ef
; 0x18b553

