Route29_MapScriptHeader: ; 0x1a0f4c
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x1a0f59, $0000
	dw UnknownScript_0x1a0f5a, $0000

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x1a0f5b
; 0x1a0f59

UnknownScript_0x1a0f59: ; 0x1a0f59
	end
; 0x1a0f5a

UnknownScript_0x1a0f5a: ; 0x1a0f5a
	end
; 0x1a0f5b

UnknownScript_0x1a0f5b: ; 0x1a0f5b
	checkbit2 $001b
	iftrue UnknownScript_0x1a0f64
UnknownScript_0x1a0f61: ; 0x1a0f61
	disappear $8
	return
; 0x1a0f64

UnknownScript_0x1a0f64: ; 0x1a0f64
	checkcode $b
	if_not_equal TUESDAY, UnknownScript_0x1a0f61
	appear $8
	return
; 0x1a0f6d

UnknownScript_0x1a0f6d: ; 0x1a0f6d
	spriteface $2, $1
	showemote $0, $2, 15
	applymovement $2, MovementData_0x1a108d
	spriteface $0, $2
	setbit1 $0041
	loadfont
	2writetext UnknownText_0x1a10df
	yesorno
	iffalse UnknownScript_0x1a0fd9
	loadmovesprites
	follow $2, $0
	applymovement $2, MovementData_0x1a109a
	stopfollow
	loadpokedata RATTATA, 5
	catchtutorial $3
	spriteface $2, $1
	loadfont
	2writetext UnknownText_0x1a114d
	closetext
	loadmovesprites
	dotrigger $0
	setbit1 $0042
	end
; 0x1a0fa3

UnknownScript_0x1a0fa3: ; 0x1a0fa3
	spriteface $2, $1
	showemote $0, $2, 15
	applymovement $2, MovementData_0x1a1094
	spriteface $0, $2
	setbit1 $0041
	loadfont
	2writetext UnknownText_0x1a10df
	yesorno
	iffalse UnknownScript_0x1a0fe5
	loadmovesprites
	follow $2, $0
	applymovement $2, MovementData_0x1a10a1
	stopfollow
	loadpokedata RATTATA, 5
	catchtutorial $3
	spriteface $2, $1
	loadfont
	2writetext UnknownText_0x1a114d
	closetext
	loadmovesprites
	dotrigger $0
	setbit1 $0042
	end
; 0x1a0fd9

UnknownScript_0x1a0fd9: ; 0x1a0fd9
	2writetext UnknownText_0x1a1197
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x1a109a
	dotrigger $0
	end
; 0x1a0fe5

UnknownScript_0x1a0fe5: ; 0x1a0fe5
	2writetext UnknownText_0x1a1197
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x1a10a1
	dotrigger $0
	end
; 0x1a0ff1

CooltrainerMScript_0x1a0ff1: ; 0x1a0ff1
	faceplayer
	loadfont
	checkcode $10
	if_equal $0, UnknownScript_0x1a101c
	checkbit1 $0042
	iftrue UnknownScript_0x1a101c
	checkbit1 $001f
	iffalse UnknownScript_0x1a101c
	2writetext UnknownText_0x1a11e3
	yesorno
	iffalse UnknownScript_0x1a1022
	loadmovesprites
	loadpokedata RATTATA, 5
	catchtutorial $3
	loadfont
	2writetext UnknownText_0x1a114d
	closetext
	loadmovesprites
	setbit1 $0042
	end
; 0x1a101c

UnknownScript_0x1a101c: ; 0x1a101c
	2writetext UnknownText_0x1a10a7
	closetext
	loadmovesprites
	end
; 0x1a1022

UnknownScript_0x1a1022: ; 0x1a1022
	2writetext UnknownText_0x1a1197
	closetext
	loadmovesprites
	end
; 0x1a1028

YoungsterScript_0x1a1028: ; 0x1a1028
	jumptextfaceplayer UnknownText_0x1a1214
; 0x1a102b

TeacherScript_0x1a102b: ; 0x1a102b
	jumptextfaceplayer UnknownText_0x1a126c
; 0x1a102e

FisherScript_0x1a102e: ; 0x1a102e
	jumptextfaceplayer UnknownText_0x1a12d9
; 0x1a1031

CooltrainerMScript_0x1a1031: ; 0x1a1031
	faceplayer
	loadfont
	checktime $2
	iftrue UnknownScript_0x1a103d
	checktime $4
	iftrue UnknownScript_0x1a1043
UnknownScript_0x1a103d: ; 0x1a103d
	2writetext UnknownText_0x1a134c
	closetext
	loadmovesprites
	end
; 0x1a1043

UnknownScript_0x1a1043: ; 0x1a1043
	2writetext UnknownText_0x1a137c
	closetext
	loadmovesprites
	end
; 0x1a1049

TeacherScript_0x1a1049: ; 0x1a1049
	faceplayer
	loadfont
	checkbit1 $0065
	iftrue UnknownScript_0x1a1077
	checkcode $b
	if_not_equal TUESDAY, UnknownScript_0x1a107d
	checkbit1 $0064
	iftrue UnknownScript_0x1a1064
	2writetext UnknownText_0x1a13b2
	keeptextopen
	setbit1 $0064
UnknownScript_0x1a1064: ; 0x1a1064
	2writetext UnknownText_0x1a142f
	keeptextopen
	verbosegiveitem PINK_BOW, 1
	iffalse UnknownScript_0x1a107b
	setbit1 $0065
	2writetext UnknownText_0x1a146f
	closetext
	loadmovesprites
	end
; 0x1a1077

UnknownScript_0x1a1077: ; 0x1a1077
	2writetext UnknownText_0x1a14e7
	closetext
UnknownScript_0x1a107b: ; 0x1a107b
	loadmovesprites
	end
; 0x1a107d

UnknownScript_0x1a107d: ; 0x1a107d
	2writetext UnknownText_0x1a1559
	closetext
	loadmovesprites
	end
; 0x1a1083

MapRoute29Signpost0Script: ; 0x1a1083
	jumptext UnknownText_0x1a158e
; 0x1a1086

MapRoute29Signpost1Script: ; 0x1a1086
	jumptext UnknownText_0x1a15b9
; 0x1a1089

FruitTreeScript_0x1a1089: ; 0x1a1089
	fruittree $1
; 0x1a108b

ItemFragment_0x1a108b: ; 0x1a108b
	db POTION, 1
; 0x1a108d

MovementData_0x1a108d: ; 0x1a108d
	step_up
	step_up
	step_up
	step_up
	step_right
	step_right
	step_end
; 0x1a1094

MovementData_0x1a1094: ; 0x1a1094
	step_up
	step_up
	step_up
	step_right
	step_right
	step_end
; 0x1a109a

MovementData_0x1a109a: ; 0x1a109a
	step_left
	step_left
	step_down
	step_down
	step_down
	step_down
	step_end
; 0x1a10a1

MovementData_0x1a10a1: ; 0x1a10a1
	step_left
	step_left
	step_down
	step_down
	step_down
	step_end
; 0x1a10a7

UnknownText_0x1a10a7: ; 0x1a10a7
	db $0, "#MON hide in", $4f
	db "the grass. Who", $51
	db "knows when they'll", $4f
	db "pop out…", $57
; 0x1a10df

UnknownText_0x1a10df: ; 0x1a10df
	db $0, "I've seen you a", $4f
	db "couple times. How", $51
	db "many #MON have", $4f
	db "you caught?", $51
	db "Would you like me", $4f
	db "to show you how to", $55
	db "catch #MON?", $57
; 0x1a114d

UnknownText_0x1a114d: ; 0x1a114d
	db $0, "That's how you do", $4f
	db "it.", $51
	db "If you weaken them", $4f
	db "first, #MON are", $55
	db "easier to catch.", $57
; 0x1a1197

UnknownText_0x1a1197: ; 0x1a1197
	db $0, "Oh. Fine, then.", $51
	db "Anyway, if you", $4f
	db "want to catch", $51
	db "#MON, you have", $4f
	db "to walk a lot.", $57
; 0x1a11e3

UnknownText_0x1a11e3: ; 0x1a11e3
	db $0, "Huh? You want me", $4f
	db "to show you how to", $55
	db "catch #MON?", $57
; 0x1a1214

UnknownText_0x1a1214: ; 0x1a1214
	db $0, "Yo. How are your", $4f
	db "#MON?", $51
	db "If they're weak", $4f
	db "and not ready for", $51
	db "battle, keep out", $4f
	db "of the grass.", $57
; 0x1a126c

UnknownText_0x1a126c: ; 0x1a126c
	db $0, "See those ledges?", $4f
	db "It's scary to jump", $55
	db "off them.", $51
	db "But you can go to", $4f
	db "NEW BARK without", $51
	db "walking through", $4f
	db "the grass.", $57
; 0x1a12d9

UnknownText_0x1a12d9: ; 0x1a12d9
	db $0, "I wanted to take a", $4f
	db "break, so I saved", $51
	db "to record my", $4f
	db "progress.", $57
; 0x1a1316

; possibly unused
UnknownText_0x1a1316: ; 0x1a1316
	db $0, "I'm waiting for", $4f
	db "#MON that", $51
	db "appear only in the", $4f
	db "daytime.", $57
; 0x1a134c

UnknownText_0x1a134c: ; 0x1a134c
	db $0, "I'm waiting for", $4f
	db "#MON that", $51
	db "appear only at", $4f
	db "night.", $57
; 0x1a137c

UnknownText_0x1a137c: ; 0x1a137c
	db $0, "I'm waiting for", $4f
	db "#MON that", $51
	db "appear only in the", $4f
	db "morning.", $57
; 0x1a13b2

UnknownText_0x1a13b2: ; 0x1a13b2
	db $0, "TUSCANY: I do be-", $4f
	db "lieve that this is", $51
	db "the first time", $4f
	db "we've met?", $51
	db "Please allow me to", $4f
	db "introduce myself.", $51
	db "I am TUSCANY of", $4f
	db "Tuesday.", $57
; 0x1a142f

UnknownText_0x1a142f: ; 0x1a142f
	db $0, "By way of intro-", $4f
	db "duction, please", $51
	db "accept this gift,", $4f
	db "a PINK BOW.", $57
; 0x1a146f

UnknownText_0x1a146f: ; 0x1a146f
	db $0, "TUSCANY: Wouldn't", $4f
	db "you agree that it", $55
	db "is most adorable?", $51
	db "It strengthens", $4f
	db "normal-type moves.", $51
	db "I am certain it", $4f
	db "will be of use.", $57
; 0x1a14e7

UnknownText_0x1a14e7: ; 0x1a14e7
	db $0, "TUSCANY: Have you", $4f
	db "met MONICA, my", $55
	db "older sister?", $51
	db "Or my younger", $4f
	db "brother, WESLEY?", $51
	db "I am the second of", $4f
	db "seven children.", $57
; 0x1a1559

UnknownText_0x1a1559: ; 0x1a1559
	db $0, "TUSCANY: Today is", $4f
	db "not Tuesday. That", $55
	db "is unfortunate…", $57
; 0x1a158e

UnknownText_0x1a158e: ; 0x1a158e
	db $0, "ROUTE 29", $51
	db "CHERRYGROVE CITY -", $4f
	db "NEW BARK TOWN", $57
; 0x1a15b9

UnknownText_0x1a15b9: ; 0x1a15b9
	db $0, "ROUTE 29", $51
	db "CHERRYGROVE CITY -", $4f
	db "NEW BARK TOWN", $57
; 0x1a15e4

Route29_MapEventHeader: ; 0x1a15e4
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $1, $1b, 3, GROUP_ROUTE_29_46_GATE, MAP_ROUTE_29_46_GATE

	; xy triggers
	db 2
	xy_trigger 1, $8, $35, $0, UnknownScript_0x1a0f6d, $0, $0
	xy_trigger 1, $9, $35, $0, UnknownScript_0x1a0fa3, $0, $0

	; signposts
	db 2
	signpost 7, 51, $0, MapRoute29Signpost0Script
	signpost 5, 3, $0, MapRoute29Signpost1Script

	; people-events
	db 8
	person_event SPRITE_COOLTRAINER_M, 16, 54, $3, $0, 255, 255, $80, 0, CooltrainerMScript_0x1a0ff1, $ffff
	person_event SPRITE_YOUNGSTER, 20, 31, $4, $10, 255, 255, $a0, 0, YoungsterScript_0x1a1028, $ffff
	person_event SPRITE_TEACHER, 15, 19, $5, $1, 255, 255, $a0, 0, TeacherScript_0x1a102b, $ffff
	person_event SPRITE_FRUIT_TREE, 6, 16, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x1a1089, $ffff
	person_event SPRITE_FISHER, 7, 29, $7, $0, 255, 255, $90, 0, FisherScript_0x1a102e, $ffff
	person_event SPRITE_COOLTRAINER_M, 8, 17, $6, $0, 255, 255, $80, 0, CooltrainerMScript_0x1a1031, $ffff
	person_event SPRITE_TEACHER, 16, 33, $3, $0, 255, 255, $0, 0, TeacherScript_0x1a1049, $0759
	person_event SPRITE_POKE_BALL, 6, 52, $1, $0, 255, 255, $1, 0, ItemFragment_0x1a108b, $06ad
; 0x1a1671

