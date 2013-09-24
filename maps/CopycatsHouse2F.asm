CopycatsHouse2F_MapScriptHeader: ; 0x18ae9a
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x18ae9f
; 0x18ae9f

UnknownScript_0x18ae9f: ; 0x18ae9f
	checkbit2 $0063
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
	checkbit2 $0063
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
	checkbit2 $0063
	iftrue UnknownScript_0x18aef2
	2writetext UnknownText_0x18afda
	2jump UnknownScript_0x18aef5
; 0x18aef2

UnknownScript_0x18aef2: ; 0x18aef2
	2writetext UnknownText_0x18b316
UnknownScript_0x18aef5: ; 0x18aef5
	closetext
	loadmovesprites
	checkbit2 $0063
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
	checkbit2 $0063
	iftrue UnknownScript_0x18af23
	2writetext UnknownText_0x18b064
	2jump UnknownScript_0x18af26
; 0x18af23

UnknownScript_0x18af23: ; 0x18af23
	2writetext UnknownText_0x18b366
UnknownScript_0x18af26: ; 0x18af26
	closetext
	loadmovesprites
	checkbit2 $0063
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
	checkbit2 $0063
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
	checkbit2 $0063
	iftrue UnknownScript_0x18af98
	2writetext UnknownText_0x18b298
	2jump UnknownScript_0x18af9b
; 0x18af98

UnknownScript_0x18af98: ; 0x18af98
	2writetext UnknownText_0x18b415
UnknownScript_0x18af9b: ; 0x18af9b
	closetext
	loadmovesprites
	checkbit2 $0063
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
	db $0, $52, ": Hi! Do", $4f
	db "you like #MON?", $51
	db $52, ": Uh, no, I", $4f
	db "just asked you.", $51
	db $52, ": Huh?", $4f
	db "You're strange!", $57
; 0x18b028

UnknownText_0x18b028: ; 0x18b028
	db $0, "COPYCAT: Hmm?", $4f
	db "Quit mimicking?", $51
	db "But that's my", $4f
	db "favorite hobby!", $57
; 0x18b064

UnknownText_0x18b064: ; 0x18b064
	db $0, $52, ": Hi!", $4f
	db "I heard that you", $51
	db "lost your favorite", $4f
	db "# DOLL.", $51
	db $52, ": If I find", $4f
	db "it, you'll give me", $55
	db "a rail PASS?", $51
	db $52, ": I'll go", $4f
	db "find it for you.", $51
	db "You think you lost", $4f
	db "it when you went", $55
	db "to VERMILION CITY?", $57
; 0x18b116

UnknownText_0x18b116: ; 0x18b116
	db $0, "COPYCAT: Pardon?", $51
	db "I shouldn't decide", $4f
	db "what you should", $55
	db "do?", $51
	db "But I'm really", $4f
	db "worried… What if", $55
	db "someone finds it?", $57
; 0x18b17f

UnknownText_0x18b17f: ; 0x18b17f
	db $0, "COPYCAT: Yay!", $4f
	db "That's my CLEFAIRY", $55
	db "# DOLL!", $51
	db "See the tear where", $4f
	db "the right leg is", $51
	db "sewn on? That's", $4f
	db "proof!", $57
; 0x18b1e2

UnknownText_0x18b1e2: ; 0x18b1e2
	db $0, "OK. Here's the", $4f
	db "MAGNET TRAIN PASS", $55
	db "like I promised!", $57
; 0x18b214

UnknownText_0x18b214: ; 0x18b214
	db $0, "COPYCAT: That's", $4f
	db "the PASS for the", $55
	db "MAGNET TRAIN.", $51
	db "The rail company", $4f
	db "man gave me that", $51
	db "when they tore", $4f
	db "down our old house", $55
	db "for the STATION.", $57
; 0x18b298

UnknownText_0x18b298: ; 0x18b298
	db $0, $52, ": Hi!", $4f
	db "Thanks a lot for", $55
	db "the rail PASS!", $51
	db $52, ": Pardon?", $51
	db $52, ": Is it", $4f
	db "that fun to mimic", $55
	db "my every move?", $57
; 0x18b2f5

UnknownText_0x18b2f5: ; 0x18b2f5
	db $0, "COPYCAT: You bet!", $4f
	db "It's a scream!", $57
; 0x18b316

UnknownText_0x18b316: ; 0x18b316
	db $0, $52, ": Hi. You", $4f
	db "must like #MON.", $51
	db $52, ": No, not", $4f
	db "me. I asked you.", $51
	db $52, ": Pardon?", $4f
	db "You're weird!", $57
; 0x18b366

UnknownText_0x18b366: ; 0x18b366
	db $0, $52, ": Hi. Did", $4f
	db "you really lose", $55
	db "your # DOLL?", $51
	db $52, ": You'll", $4f
	db "really give me a", $51
	db "rail PASS if I", $4f
	db "find it for you?", $51
	db $52, ": Sure,", $4f
	db "I'll look for it!", $51
	db "You think you lost", $4f
	db "it when you were", $55
	db "in VERMILION?", $57
; 0x18b415

UnknownText_0x18b415: ; 0x18b415
	db $0, $52, ": Thank you", $4f
	db "for the rail PASS!", $51
	db $52, ": …Pardon?", $51
	db $52, ": Is it", $4f
	db "really that fun to", $51
	db "copy what I say", $4f
	db "and do?", $57
; 0x18b476

UnknownText_0x18b476: ; 0x18b476
	db $0, "DODRIO: Gii giii!", $57
; 0x18b489

UnknownText_0x18b489: ; 0x18b489
	db $0, "MIRROR, MIRROR ON", $4f
	db "THE WALL, WHO'S", $51
	db "THE FAIREST ONE OF", $4f
	db "ALL?", $57
; 0x18b4c4

UnknownText_0x18b4c4: ; 0x18b4c4
	db $0, "This is a rare", $4f
	db "#MON! Huh?", $51
	db "It's only a doll…", $57
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

