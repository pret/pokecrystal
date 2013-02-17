ElmsLab_MapScriptHeader: ; 0x78b5d
	; trigger count
	db 6

	; triggers
	dw UnknownScript_0x78b7a, $0000
	dw UnknownScript_0x78b7e, $0000
	dw UnknownScript_0x78b7f, $0000
	dw UnknownScript_0x78b80, $0000
	dw UnknownScript_0x78b81, $0000
	dw UnknownScript_0x78b82, $0000

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x78b83
; 0x78b7a

UnknownScript_0x78b7a: ; 0x78b7a
	priorityjump UnknownScript_0x78b8c
	end
; 0x78b7e

UnknownScript_0x78b7e: ; 0x78b7e
	end
; 0x78b7f

UnknownScript_0x78b7f: ; 0x78b7f
	end
; 0x78b80

UnknownScript_0x78b80: ; 0x78b80
	end
; 0x78b81

UnknownScript_0x78b81: ; 0x78b81
	end
; 0x78b82

UnknownScript_0x78b82: ; 0x78b82
	end
; 0x78b83

UnknownScript_0x78b83: ; 0x78b83
	checktriggers
	iftrue UnknownScript_0x78b8b
	moveperson $2, $3, $4
UnknownScript_0x78b8b: ; 0x78b8b
	return
; 0x78b8c

UnknownScript_0x78b8c: ; 0x78b8c
	applymovement $0, MovementData_0x78f67
	showemote $0, $2, 15
	spriteface $2, $3
	loadfont
	2writetext UnknownText_0x78fb6
UnknownScript_0x78b9b: ; 0x78b9b
	yesorno
	iftrue UnknownScript_0x78ba5
	2writetext UnknownText_0x7911a
	2jump UnknownScript_0x78b9b
; 0x78ba5

UnknownScript_0x78ba5: ; 0x78ba5
	2writetext UnknownText_0x790fa
	keeptextopen
	2writetext UnknownText_0x7913a
	closetext
	loadmovesprites
	playsound $00bc
	pause 30
	showemote $0, $2, 10
	spriteface $2, $0
	loadfont
	2writetext UnknownText_0x791ae
	closetext
	loadmovesprites
	loadfont
	spriteface $2, $3
	2writetext UnknownText_0x791df
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x78fa0
	spriteface $0, $1
	applymovement $2, MovementData_0x78fa2
	spriteface $0, $3
	loadfont
	2writetext UnknownText_0x792ff
	closetext
	dotrigger $1
	loadmovesprites
	end
; 0x78be0

ProfElmScript: ; 0x78be0
	faceplayer
	loadfont
	checkbit1 $0024
	iftrue UnknownScript_0x78bee
	checkbit1 $0044
	iftrue ElmGiveTicketScript
UnknownScript_0x78bee: ; 0x78bee
	checkbit1 $007c
	iftrue UnknownScript_0x78bfa
	checkbit2 $0022
	iftrue ElmGiveMasterBallScript
UnknownScript_0x78bfa: ; 0x78bfa
	checkbit1 $0056
	iftrue UnknownScript_0x78e16
	checkbit1 $0055
	iftrue UnknownScript_0x78e03
	checkbit1 $0077
	iffalse UnknownScript_0x78c35
	writebyte TOGEPI
	special $0043
	iftrue ShowElmTogepiScript
	writebyte TOGETIC
	special $0043
	iftrue ShowElmTogepiScript
	2writetext UnknownText_0x79a40
	closetext
	loadmovesprites
	end
; 0x78c22

UnknownScript_0x78c22: ; 0x78c22
	writebyte TOGEPI
	special $0043
	iftrue ShowElmTogepiScript
	writebyte TOGETIC
	special $0043
	iftrue ShowElmTogepiScript
	2jump UnknownScript_0x78c41
; 0x78c35

UnknownScript_0x78c35: ; 0x78c35
	checkbit1 $002d
	iffalse UnknownScript_0x78c41
	checkbit1 $0054
	iftrue UnknownScript_0x78c22
UnknownScript_0x78c41: ; 0x78c41
	checkbit1 $002d ; why are we checking it again?
	iftrue ElmWaitingEggHatchScript
	checkbit2 $001b
	iftrue ElmAideHasEggScript
	checkbit1 $001f
	iftrue ElmStudyingEggScript
	checkbit1 $001e
	iftrue ElmAfterTheftScript
	checkbit1 $001a
	iftrue ElmDescribesMrPokemonScript
	2writetext UnknownText_0x79375
	closetext
	loadmovesprites
	end
; 0x78c65

LabTryToLeaveScript: ; 0x78c65
	spriteface $2, $0
	loadfont
	2writetext LabWhereGoingText
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x78f70
	end
; 0x78c73

CyndaquilPokeBallScript: ; 0x78c73
	checkbit1 $001a
	iftrue LookAtElmPokeBallScript
	spriteface $2, $0
	refreshscreen $0
	pokepic CYNDAQUIL
	cry CYNDAQUIL
	closetext
	pokepicyesorno
	loadfont
	2writetext TakeCyndaquilText
	yesorno
	iffalse DidntChooseStarterScript
	disappear $4
	setbit1 $001b
	2writetext ChoseStarterText
	keeptextopen
	waitbutton
	pokenamemem CYNDAQUIL, $0
	2writetext ReceivedStarterText
	playsound $0002
	waitbutton
	keeptextopen
	givepoke CYNDAQUIL, 5, BERRY, 0
	loadmovesprites
	checkcode $9
	if_equal $3, ElmDirectionsScript
	applymovement $0, AfterCyndaquilMovement
	2jump ElmDirectionsScript
; 0x78cb5

TotodilePokeBallScript: ; 0x78cb5
	checkbit1 $001a
	iftrue LookAtElmPokeBallScript
	spriteface $2, $0
	refreshscreen $0
	pokepic TOTODILE
	cry TOTODILE
	closetext
	pokepicyesorno
	loadfont
	2writetext TakeTotodileText
	yesorno
	iffalse DidntChooseStarterScript
	disappear $5
	setbit1 $001c
	2writetext ChoseStarterText
	keeptextopen
	waitbutton
	pokenamemem TOTODILE, $0
	2writetext ReceivedStarterText
	playsound $0002
	waitbutton
	keeptextopen
	givepoke TOTODILE, 5, BERRY, 0
	loadmovesprites
	applymovement $0, AfterTotodileMovement
	2jump ElmDirectionsScript
; 0x78cf1

ChikoritaPokeBallScript: ; 0x78cf1
	checkbit1 $001a
	iftrue LookAtElmPokeBallScript
	spriteface $2, $0
	refreshscreen $0
	pokepic CHIKORITA
	cry CHIKORITA
	closetext
	pokepicyesorno
	loadfont
	2writetext TakeChikoritaText
	yesorno
	iffalse DidntChooseStarterScript
	disappear $6
	setbit1 $001d
	2writetext ChoseStarterText
	keeptextopen
	waitbutton
	pokenamemem CHIKORITA, $0
	2writetext ReceivedStarterText
	playsound $0002
	waitbutton
	keeptextopen
	givepoke CHIKORITA, 5, BERRY, 0
	loadmovesprites
	applymovement $0, AfterChikoritaMovement
	2jump ElmDirectionsScript
; 0x78d2d

DidntChooseStarterScript: ; 0x78d2d
	2writetext DidntChooseStarterText
	closetext
	loadmovesprites
	end
; 0x78d33

ElmDirectionsScript: ; 0x78d33
	spriteface $0, $1
	loadfont
	2writetext ElmDirectionsText1
	closetext
	loadmovesprites
	addcellnum $4
	loadfont
	2writetext GotElmsNumberText
	playsound $0093
	waitbutton
	closetext
	loadmovesprites
	spriteface $2, $2
	loadfont
	2writetext ElmDirectionsText2
	closetext
	loadmovesprites
	spriteface $2, $0
	loadfont
	2writetext ElmDirectionsText3
	closetext
	loadmovesprites
	setbit1 $001a
	setbit1 $06be
	dotrigger $5
	domaptrigger GROUP_NEW_BARK_TOWN, MAP_NEW_BARK_TOWN, $1
	end
; 0x78d67

ElmDescribesMrPokemonScript: ; 0x78d67
	2writetext ElmDescribesMrPokemonText
	closetext
	loadmovesprites
	end
; 0x78d6d

LookAtElmPokeBallScript: ; 0x78d6d
	loadfont
	2writetext ElmPokeBallText
	closetext
	loadmovesprites
	end
; 0x78d74

MapElmsLabSignpost0Script: ; 0x78d74
	loadfont
	checkbit1 $001a
	iftrue UnknownScript_0x78d81
	2writetext UnknownText_0x79690
	closetext
	loadmovesprites
	end
; 0x78d81

UnknownScript_0x78d81: ; 0x78d81
	2writetext UnknownText_0x796aa
	yesorno
	iftrue UnknownScript_0x78d8a
	loadmovesprites
	end
; 0x78d8a

UnknownScript_0x78d8a: ; 0x78d8a
	special $009d
	special $001b
	playmusic $0000
	writebyte $1
	special $003e
	pause 30
	special $003d
	loadmovesprites
	end
; 0x78d9f

ElmAfterTheftDoneScript: ; 0x78d9f
	closetext
	loadmovesprites
	end
; 0x78da2

ElmAfterTheftScript: ; 0x78da2
	2writetext ElmAfterTheftText1
	checkitem MYSTERY_EGG
	iffalse ElmAfterTheftDoneScript
	keeptextopen
	2writetext ElmAfterTheftText2
	closetext
	takeitem MYSTERY_EGG, 1
	2call ElmJumpBackScript1
	2writetext ElmAfterTheftText3
	closetext
	2call ElmJumpBackScript2
	2writetext ElmAfterTheftText4
	keeptextopen
	2writetext ElmAfterTheftText5
	keeptextopen
	setbit1 $001f
	setbit2 $0010
	domaptrigger GROUP_ROUTE_29, MAP_ROUTE_29, $1
	clearbit1 $0715
	setbit1 $0714
	2writetext ElmAfterTheftText6
	closetext
	loadmovesprites
	dotrigger $6
	end
; 0x78ddc

ElmStudyingEggScript: ; 0x78ddc
	2writetext ElmStudyingEggText
	closetext
	loadmovesprites
	end
; 0x78de2

ElmAideHasEggScript: ; 0x78de2
	2writetext ElmAideHasEggText
	closetext
	loadmovesprites
	end
; 0x78de8

ElmWaitingEggHatchScript: ; 0x78de8
	2writetext ElmWaitingEggHatchText
	closetext
	loadmovesprites
	end
; 0x78dee

ShowElmTogepiScript: ; 0x78dee
	2writetext ShowElmTogepiText1
	closetext
	loadmovesprites
	showemote $0, $2, 15
	setbit1 $0055
	loadfont
	2writetext ShowElmTogepiText2
	keeptextopen
	2writetext ShowElmTogepiText3
	keeptextopen
UnknownScript_0x78e03: ; 0x78e03
	2writetext ElmGiveEverstoneText1
	keeptextopen
	verbosegiveitem EVERSTONE, 1
	iffalse UnknownScript_0x78e1a
	2writetext ElmGiveEverstoneText2
	closetext
	loadmovesprites
	setbit1 $0056
	end
; 0x78e16

UnknownScript_0x78e16: ; 0x78e16
	2writetext UnknownText_0x79c37
	closetext
UnknownScript_0x78e1a: ; 0x78e1a
	loadmovesprites
	end
; 0x78e1c

ElmGiveMasterBallScript: ; 0x78e1c
	2writetext ElmGiveMasterBallText1
	keeptextopen
	verbosegiveitem MASTER_BALL, 1
	iffalse .notdone
	setbit1 $007c
	2writetext ElmGiveMasterBallText2
	closetext
.notdone
	loadmovesprites
	end
; 0x78e2f

ElmGiveTicketScript: ; 0x78e2f
	2writetext ElmGiveTicketText1
	keeptextopen
	verbosegiveitem S_S_TICKET, 1
	setbit1 $0024
	2writetext ElmGiveTicketText2
	closetext
	loadmovesprites
	end
; 0x78e3f

ElmJumpBackScript1: ; 0x78e3f
	loadmovesprites
	checkcode $9
	if_equal $0, UnknownScript_0x78e6d
	if_equal $1, UnknownScript_0x78e67
	if_equal $2, UnknownScript_0x78e73
	if_equal $3, UnknownScript_0x78e79
	end
; 0x78e53

ElmJumpBackScript2: ; 0x78e53
	loadmovesprites
	checkcode $9
	if_equal $0, UnknownScript_0x78e67
	if_equal $1, UnknownScript_0x78e6d
	if_equal $2, UnknownScript_0x78e79
	if_equal $3, UnknownScript_0x78e73
	end
; 0x78e67

UnknownScript_0x78e67: ; 0x78e67
	applymovement $2, MovementData_0x78f90
	loadfont
	end
; 0x78e6d

UnknownScript_0x78e6d: ; 0x78e6d
	applymovement $2, MovementData_0x78f94
	loadfont
	end
; 0x78e73

UnknownScript_0x78e73: ; 0x78e73
	applymovement $2, MovementData_0x78f98
	loadfont
	end
; 0x78e79

UnknownScript_0x78e79: ; 0x78e79
	applymovement $2, MovementData_0x78f9c
	loadfont
	end
; 0x78e7f

UnknownScript_0x78e7f: ; 0x78e7f
	applymovement $3, MovementData_0x78f7e
	spriteface $0, $0
	2call UnknownScript_0x78e9d
	applymovement $3, MovementData_0x78f87
	end
; 0x78e8e

UnknownScript_0x78e8e: ; 0x78e8e
	applymovement $3, MovementData_0x78f82
	spriteface $0, $0
	2call UnknownScript_0x78e9d
	applymovement $3, MovementData_0x78f8b
	end
; 0x78e9d

UnknownScript_0x78e9d: ; 0x78e9d
	loadfont
	2writetext UnknownText_0x79f38
	keeptextopen
	verbosegiveitem POTION, 1
	2writetext UnknownText_0x79f65
	closetext
	loadmovesprites
	dotrigger $2
	end
; 0x78ead

UnknownScript_0x78ead: ; 0x78ead
	applymovement $3, MovementData_0x78f7e
	spriteface $0, $0
	2call UnknownScript_0x78ecb
	applymovement $3, MovementData_0x78f87
	end
; 0x78ebc

UnknownScript_0x78ebc: ; 0x78ebc
	applymovement $3, MovementData_0x78f82
	spriteface $0, $0
	2call UnknownScript_0x78ecb
	applymovement $3, MovementData_0x78f8b
	end
; 0x78ecb

UnknownScript_0x78ecb: ; 0x78ecb
	loadfont
	2writetext UnknownText_0x7a078
	keeptextopen
	itemtotext POKE_BALL, $1
	2call UnknownScript_0x78ee2
	giveitem POKE_BALL, $5
	2writetext UnknownText_0x7a09a
	keeptextopen
	itemnotify
	loadmovesprites
	dotrigger $2
	end
; 0x78ee2

UnknownScript_0x78ee2: ; 0x78ee2
	jumpstd $002f
	end
; 0x78ee6

ElmsAideScript: ; 0x78ee6
	faceplayer
	loadfont
	checkbit1 $002d
	iftrue UnknownScript_0x78f0c
	checkbit1 $001f
	iftrue UnknownScript_0x78f06
	checkbit1 $001e
	iftrue UnknownScript_0x78f00
	2writetext UnknownText_0x79f65
	closetext
	loadmovesprites
	end
; 0x78f00

UnknownScript_0x78f00: ; 0x78f00
	2writetext UnknownText_0x79f95
	closetext
	loadmovesprites
	end
; 0x78f06

UnknownScript_0x78f06: ; 0x78f06
	2writetext UnknownText_0x7a09a
	closetext
	loadmovesprites
	end
; 0x78f0c

UnknownScript_0x78f0c: ; 0x78f0c
	2writetext UnknownText_0x79c65
	closetext
	loadmovesprites
	end
; 0x78f12

UnknownScript_0x78f12: ; 0x78f12
	applymovement $0, MovementData_0x78f72
; 0x78f16

MeetCopScript: ; 0x78f16
	applymovement $0, MovementData_0x78f74
	spriteface $7, $2
	loadfont
	2writetext UnknownText_0x7a0f0
	keeptextopen
	special $0024
	2writetext UnknownText_0x7a1c0
	closetext
	loadmovesprites
	applymovement $7, MovementData_0x78f78
	disappear $7
	dotrigger $2
	end
; 0x78f33

MapElmsLabSignpost14Script: ; 0x78f33
	loadfont
	checkbit2 $0043
	iftrue UnknownScript_0x78f49
	checkbit1 $0043
	iftrue UnknownScript_0x78f43
	2jump UnknownScript_0x78f49
; 0x78f43

UnknownScript_0x78f43: ; 0x78f43
	2writetext UnknownText_0x7a231
	closetext
	loadmovesprites
	end
; 0x78f49

UnknownScript_0x78f49: ; 0x78f49
	2writetext UnknownText_0x7a1fd
	closetext
	loadmovesprites
	end
; 0x78f4f

MapElmsLabSignpost5Script: ; 0x78f4f
	jumptext UnknownText_0x7a24c
; 0x78f52

MapElmsLabSignpost6Script: ; 0x78f52
	jumptext UnknownText_0x7a28a
; 0x78f55

MapElmsLabSignpost7Script: ; 0x78f55
	jumptext UnknownText_0x7a2c6
; 0x78f58

MapElmsLabSignpost8Script: ; 0x78f58
	jumptext UnknownText_0x7a315
; 0x78f5b

MapElmsLabSignpost13Script: ; 0x78f5b
	jumptext UnknownText_0x7a370
; 0x78f5e

MapElmsLabSignpost15Script: ; 0x78f5e
	jumptext UnknownText_0x7a3a6
; 0x78f61

UnknownScript_0x78f61: ; 0x78f61
	jumpstd $000d
; 0x78f64

MapElmsLabSignpost12Script: ; 0x78f64
	jumpstd $0001
; 0x78f67

MovementData_0x78f67: ; 0x78f67
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	turn_head_left
	step_end
; 0x78f70

MovementData_0x78f70: ; 0x78f70
	step_up
	step_end
; 0x78f72

MovementData_0x78f72: ; 0x78f72
	step_left
	step_end
; 0x78f74

MovementData_0x78f74: ; 0x78f74
	step_up
	step_up
	turn_head_right
	step_end
; 0x78f78

MovementData_0x78f78: ; 0x78f78
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end
; 0x78f7e

MovementData_0x78f7e: ; 0x78f7e
	step_right
	step_right
	turn_head_up
	step_end
; 0x78f82

MovementData_0x78f82: ; 0x78f82
	step_right
	step_right
	step_right
	turn_head_up
	step_end
; 0x78f87

MovementData_0x78f87: ; 0x78f87
	step_left
	step_left
	turn_head_down
	step_end
; 0x78f8b

MovementData_0x78f8b: ; 0x78f8b
	step_left
	step_left
	step_left
	turn_head_down
	step_end
; 0x78f90

MovementData_0x78f90: ; 0x78f90
	fix_facing
	big_step_up
	remove_fixed_facing
	step_end
; 0x78f94

MovementData_0x78f94: ; 0x78f94
	fix_facing
	big_step_down
	remove_fixed_facing
	step_end
; 0x78f98

MovementData_0x78f98: ; 0x78f98
	fix_facing
	big_step_left
	remove_fixed_facing
	step_end
; 0x78f9c

MovementData_0x78f9c: ; 0x78f9c
	fix_facing
	big_step_right
	remove_fixed_facing
	step_end
; 0x78fa0

MovementData_0x78fa0: ; 0x78fa0
	step_up
	step_end
; 0x78fa2

MovementData_0x78fa2: ; 0x78fa2
	step_right
	step_right
	step_up
	turn_head_down
	step_end
; 0x78fa7

AfterCyndaquilMovement: ; 0x78fa7
	step_left
	step_up
	turn_head_up
	step_end
; 0x78fab

AfterTotodileMovement: ; 0x78fab
	step_left
	step_left
	step_up
	turn_head_up
	step_end
; 0x78fb0

AfterChikoritaMovement: ; 0x78fb0
	step_left
	step_left
	step_left
	step_up
	turn_head_up
	step_end
; 0x78fb6

UnknownText_0x78fb6: ; 0x78fb6
	db $0, "ELM: ", $14, "!", $4f
	db "There you are!", $51
	db "I needed to ask", $4f
	db "you a favor.", $51
	db "I'm conducting new", $4f
	db "#MON research", $51
	db "right now. I was", $4f
	db "wondering if you", $51
	db "could help me with", $4f
	db "it, ", $14, ".", $51
	db "You see…", $51
	db "I'm writing a", $4f
	db "paper that I want", $51
	db "to present at a", $4f
	db "conference.", $51
	db "But there are some", $4f
	db "things I don't", $51
	db "quite understand", $4f
	db "yet.", $51
	db "So!", $51
	db "I'd like you to", $4f
	db "raise a #MON", $51
	db "that I recently", $4f
	db "caught.", $57
; 0x790fa

UnknownText_0x790fa: ; 0x790fa
	db $0, "Thanks, ", $14, "!", $51
	db "You're a great", $4f
	db "help!", $57
; 0x7911a

UnknownText_0x7911a: ; 0x7911a
	db $0, "But… Please, I", $4f
	db "need your help!", $57
; 0x7913a

UnknownText_0x7913a: ; 0x7913a
	db $0, "When I announce my", $4f
	db "findings, I'm sure", $51
	db "we'll delve a bit", $4f
	db "deeper into the", $51
	db "many mysteries of", $4f
	db "#MON.", $51
	db "You can count on", $4f
	db "it!", $57
; 0x791ae

UnknownText_0x791ae: ; 0x791ae
	db $0, "Oh, hey! I got an", $4f
	db "e-mail!", $51
	db $56, $56, $56, $4f
	db "Hm… Uh-huh…", $51
	db "Okay…", $57
; 0x791df

UnknownText_0x791df: ; 0x791df
	db $0, "Hey, listen.", $51
	db "I have an acquain-", $4f
	db "tance called MR.", $55
	db "#MON.", $51
	db "He keeps finding", $4f
	db "weird things and", $51
	db "raving about his", $4f
	db "discoveries.", $51
	db "Anyway, I just got", $4f
	db "an e-mail from him", $51
	db "saying that this", $4f
	db "time it's real.", $51
	db "It is intriguing,", $4f
	db "but we're busy", $51
	db "with our #MON", $4f
	db "research…", $51
	db "Wait!", $51
	db "I know!", $51
	db $14, ", can you", $4f
	db "go in our place?", $57
; 0x792ff

UnknownText_0x792ff: ; 0x792ff
	db $0, "I want you to", $4f
	db "raise one of the", $51
	db "#MON contained", $4f
	db "in these BALLS.", $51
	db "You'll be that", $4f
	db "#MON's first", $55
	db "partner, ", $14, "!", $51
	db "Go on. Pick one!", $57
; 0x79375

UnknownText_0x79375: ; 0x79375
	db $0, "If a wild #MON", $4f
	db "appears, let your", $55
	db "#MON battle it!", $57
; 0x793a7

LabWhereGoingText: ; 0x793a7
	db $0, "ELM: Wait! Where", $4f
	db "are you going?", $57
; 0x793c8

TakeCyndaquilText: ; 0x793c8
	db $0, "ELM: You'll take", $4f
	db "CYNDAQUIL, the", $55
	db "fire #MON?", $57
; 0x793f3

TakeTotodileText: ; 0x793f3
	db $0, "ELM: Do you want", $4f
	db "TOTODILE, the", $55
	db "water #MON?", $57
; 0x7941f

TakeChikoritaText: ; 0x7941f
	db $0, "ELM: So, you like", $4f
	db "CHIKORITA, the", $55
	db "grass #MON?", $57
; 0x7944d

DidntChooseStarterText: ; 0x7944d
	db $0, "ELM: Think it over", $4f
	db "carefully.", $51
	db "Your partner is", $4f
	db "important.", $57
; 0x79487

ChoseStarterText: ; 0x79487
	db $0, "ELM: I think", $4f
	db "that's a great", $55
	db "#MON too!", $57
; 0x794ad

ReceivedStarterText: ; 0x794ad
	db $0, $52, " received", $4f
	db "@"
	text_from_ram $d099
	db $0, "!", $57
; 0x794c0

ElmDirectionsText1: ; 0x794c0
	db $0, "MR.#MON lives a", $4f
	db "little bit beyond", $51
	db "CHERRYGROVE, the", $4f
	db "next city over.", $51
	db "It's almost a", $4f
	db "direct route", $51
	db "there, so you", $4f
	db "can't miss it.", $51
	db "But just in case,", $4f
	db "here's my phone", $51
	db "number. Call me if", $4f
	db "anything comes up!", $57
; 0x79581

ElmDirectionsText2: ; 0x79581
	db $0, "If your #MON is", $4f
	db "hurt, you should", $51
	db "heal it with this", $4f
	db "machine.", $51
	db "Feel free to use", $4f
	db "it anytime.", $57
; 0x795db

ElmDirectionsText3: ; 0x795db
	db $0, $14, ", I'm", $4f
	db "counting on you!", $57
; 0x795f3

GotElmsNumberText: ; 0x795f3
	db $0, $52, " got ELM's", $4f
	db "phone number.", $57
; 0x7960d

ElmDescribesMrPokemonText: ; 0x7960d
	db $0, "MR.#MON goes", $4f
	db "everywhere and", $55
	db "finds rarities.", $51
	db "Too bad they're", $4f
	db "just rare and", $55
	db "not very useful…", $57
; 0x79668

ElmPokeBallText: ; 0x79668
	db $0, "It contains a", $4f
	db "#MON caught by", $55
	db "PROF.ELM.", $57
; 0x79690

UnknownText_0x79690: ; 0x79690
	db $0, "I wonder what this", $4f
	db "does?", $57
; 0x796aa

UnknownText_0x796aa: ; 0x796aa
	db $0, "Would you like to", $4f
	db "heal your #MON?", $57
; 0x796cd

ElmAfterTheftText1: ; 0x796cd
	db $0, "ELM: ", $14, ", this", $4f
	db "is terrible…", $51
	db "Oh, yes, what was", $4f
	db "MR.#MON's big", $55
	db "discovery?", $57
; 0x79712

ElmAfterTheftText2: ; 0x79712
	db $0, $52, " handed", $4f
	db "the MYSTERY EGG to", $55
	db "PROF.ELM.", $57
; 0x79739

ElmAfterTheftText3: ; 0x79739
	db $0, "ELM: This?", $57
; 0x79745

ElmAfterTheftText4: ; 0x79745
	db $0, "But… Is it a", $4f
	db "#MON EGG?", $51
	db "If it is, it is a", $4f
	db "great discovery!", $57
; 0x79780

ElmAfterTheftText5: ; 0x79780
	db $0, "ELM: What?!?", $51
	db "PROF.OAK gave you", $4f
	db "a #DEX?", $51
	db $14, ", is that", $4f
	db "true? Th-that's", $55
	db "incredible!", $51
	db "He is superb at", $4f
	db "seeing the poten-", $55
	db "tial of people as", $55
	db "trainers.", $51
	db "Wow, ", $14, ". You", $4f
	db "may have what it", $51
	db "takes to become", $4f
	db "the CHAMPION.", $51
	db "You seem to be", $4f
	db "getting on great", $55
	db "with #MON too.", $51
	db "You should take", $4f
	db "the #MON GYM", $55
	db "challenge.", $51
	db "The closest GYM", $4f
	db "would be the one", $55
	db "in VIOLET CITY.", $57
; 0x798cf

ElmAfterTheftText6: ; 0x798cf
	db $0, "…", $14, ". The", $4f
	db "road to the", $51
	db "championship will", $4f
	db "be a long one.", $51
	db "Before you leave,", $4f
	db "make sure that you", $55
	db "talk to your mom.", $57
; 0x7993c

ElmStudyingEggText: ; 0x7993c
	db $0, "ELM: Don't give", $4f
	db "up! I'll call if", $51
	db "I learn anything", $4f
	db "about that EGG!", $57
; 0x7997d

ElmAideHasEggText: ; 0x7997d
	db $0, "ELM: ", $14, "?", $4f
	db "Didn't you meet my", $55
	db "assistant?", $51
	db "He should have met", $4f
	db "you with the EGG", $51
	db "at VIOLET CITY's", $4f
	db "#MON CENTER.", $51
	db "You must have just", $4f
	db "missed him. Try to", $55
	db "catch him there.", $57
; 0x79a1b

ElmWaitingEggHatchText: ; 0x79a1b
	db $0, "ELM: Hey, has that", $4f
	db "EGG changed any?", $57
; 0x79a40

UnknownText_0x79a40: ; 0x79a40
	db $0, $14, "? I thought", $4f
	db "the EGG hatched.", $51
	db "Where is the", $4f
	db "#MON?", $57
; 0x79a72

ShowElmTogepiText1: ; 0x79a72
	db $0, "ELM: ", $14, ", you", $4f
	db "look great!", $57
; 0x79a8b

ShowElmTogepiText2: ; 0x79a8b
	db $0, "What?", $4f
	db "That #MON!?!", $57
; 0x79a9f

ShowElmTogepiText3: ; 0x79a9f
	db $0, "The EGG hatched!", $4f
	db "So, #MON are", $55
	db "born from EGGS…", $51
	db "No, perhaps not", $4f
	db "all #MON are.", $51
	db "Wow, there's still", $4f
	db "a lot of research", $55
	db "to be done.", $57
; 0x79b1c

ElmGiveEverstoneText1: ; 0x79b1c
	db $0, "Thanks, ", $14, "!", $4f
	db "You're helping", $51
	db "unravel #MON", $4f
	db "mysteries for us!", $51
	db "I want you to have", $4f
	db "this as a token of", $55
	db "our appreciation.", $57
; 0x79b8d

ElmGiveEverstoneText2: ; 0x79b8d
	db $0, "That's an", $4f
	db "EVERSTONE.", $51
	db "Some species of", $4f
	db "#MON evolve", $51
	db "when they grow to", $4f
	db "certain levels.", $51
	db "A #MON holding", $4f
	db "the EVERSTONE", $55
	db "won't evolve.", $51
	db "Give it to a #-", $4f
	db "MON you don't want", $55
	db "to evolve.", $57
; 0x79c37

UnknownText_0x79c37: ; 0x79c37
	db $0, "ELM: ", $14, ", I'll", $4f
	db "call you if any-", $55
	db "thing comes up.", $57
; 0x79c65

UnknownText_0x79c65: ; 0x79c65
	db $0, "…sigh… That", $4f
	db "stolen #MON.", $51
	db "I wonder how it's", $4f
	db "doing.", $51
	db "They say a #MON", $4f
	db "raised by a bad", $51
	db "person turns bad", $4f
	db "itself.", $57
; 0x79cd0

ElmGiveMasterBallText1: ; 0x79cd0
	db $0, "ELM: Hi, ", $14, "!", $4f
	db "Thanks to you, my", $51
	db "research is going", $4f
	db "great!", $51
	db "Take this as a", $4f
	db "token of my", $55
	db "appreciation.", $57
; 0x79d31

ElmGiveMasterBallText2: ; 0x79d31
	db $0, "The MASTER BALL is", $4f
	db "the best!", $51
	db "It's the ultimate", $4f
	db "BALL! It'll catch", $51
	db "any #MON with-", $4f
	db "out fail.", $51
	db "It's given only to", $4f
	db "recognized #MON", $55
	db "researchers.", $51
	db "I think you can", $4f
	db "make much better", $51
	db "use of it than I", $4f
	db "can, ", $14, "!", $57
; 0x79df3

ElmGiveTicketText1: ; 0x79df3
	db $0, "ELM: ", $14, "!", $4f
	db "There you are!", $51
	db "I called because I", $4f
	db "have something for", $55
	db "you.", $51
	db "See? It's an", $4f
	db "S.S.TICKET.", $51
	db "Now you can catch", $4f
	db "#MON in KANTO.", $57
; 0x79e6f

ElmGiveTicketText2: ; 0x79e6f
	db $0, "The ship departs", $4f
	db "from OLIVINE CITY.", $51
	db "But you knew that", $4f
	db "already, ", $14, ".", $51
	db "After all, you've", $4f
	db "traveled all over", $55
	db "with your #MON.", $51
	db "Give my regards to", $4f
	db "PROF.OAK in KANTO!", $57
; 0x79f0b

UnknownText_0x79f0b: ; 0x79f0b
	db $0, "It's the #MON", $4f
	db "EGG being studied", $55
	db "by PROF.ELM.", $57
; 0x79f38

UnknownText_0x79f38: ; 0x79f38
	db $0, $14, ", I want", $4f
	db "you to have this", $55
	db "for your errand.", $57
; 0x79f65

UnknownText_0x79f65: ; 0x79f65
	db $0, "There are only two", $4f
	db "of us, so we're", $55
	db "always busy.", $57
; 0x79f95

UnknownText_0x79f95: ; 0x79f95
	db $0, "There was a loud", $4f
	db "noise outside…", $51
	db "When we went to", $4f
	db "look, someone", $55
	db "stole a #MON.", $51
	db "It's unbelievable", $4f
	db "that anyone would", $55
	db "do that!", $51
	db "…sigh… That", $4f
	db "stolen #MON.", $51
	db "I wonder how it's", $4f
	db "doing.", $51
	db "They say a #MON", $4f
	db "raised by a bad", $51
	db "person turns bad", $4f
	db "itself.", $57
; 0x7a078

UnknownText_0x7a078: ; 0x7a078
	db $0, $14, "!", $51
	db "Use these on your", $4f
	db "#DEX quest!", $57
; 0x7a09a

UnknownText_0x7a09a: ; 0x7a09a
	db $0, "To add to your", $4f
	db "#DEX, you have", $55
	db "to catch #MON.", $51
	db "Throw # BALLS", $4f
	db "at wild #MON", $55
	db "to get them.", $57
; 0x7a0f0

UnknownText_0x7a0f0: ; 0x7a0f0
	db $0, "I heard a #MON", $4f
	db "was stolen here…", $51
	db "I was just getting", $4f
	db "some information", $55
	db "from PROF.ELM.", $51
	db "Apparently, it was", $4f
	db "a young male with", $55
	db "long, red hair…", $51
	db "What?", $51
	db "You battled a", $4f
	db "trainer like that?", $51
	db "Did you happen to", $4f
	db "get his name?", $57
; 0x7a1c0

UnknownText_0x7a1c0: ; 0x7a1c0
	db $0, "OK! So ", $53, $4f
	db "was his name.", $51
	db "Thanks for helping", $4f
	db "my investigation!", $57
; 0x7a1fd

UnknownText_0x7a1fd: ; 0x7a1fd
	db $0, "The window's open.", $51
	db "A pleasant breeze", $4f
	db "is blowing in.", $57
; 0x7a231

UnknownText_0x7a231: ; 0x7a231
	db $0, "He broke in", $4f
	db "through here!", $57
; 0x7a24c

UnknownText_0x7a24c: ; 0x7a24c
	db $0, $52, " opened a", $4f
	db "book.", $51
	db "Travel Tip 1:", $51
	db "Press START to", $4f
	db "open the MENU.", $57
; 0x7a28a

UnknownText_0x7a28a: ; 0x7a28a
	db $0, $52, " opened a", $4f
	db "book.", $51
	db "Travel Tip 2:", $51
	db "Record your trip", $4f
	db "with SAVE!", $57
; 0x7a2c6

UnknownText_0x7a2c6: ; 0x7a2c6
	db $0, $52, " opened a", $4f
	db "book.", $51
	db "Travel Tip 3:", $51
	db "Open your PACK and", $4f
	db "press SELECT to", $55
	db "move items.", $57
; 0x7a315

UnknownText_0x7a315: ; 0x7a315
	db $0, $52, " opened a", $4f
	db "book.", $51
	db "Travel Tip 4:", $51
	db "Check your #MON", $4f
	db "moves. Press the", $51
	db "A Button to switch", $4f
	db "moves.", $57
; 0x7a370

UnknownText_0x7a370: ; 0x7a370
	db $0, "The wrapper from", $4f
	db "the snack PROF.ELM", $55
	db "ate is in there…", $57
; 0x7a3a6

UnknownText_0x7a3a6: ; 0x7a3a6
	db $0, "OBSERVATIONS ON", $4f
	db "#MON EVOLUTION", $51
	db "…It says on the", $4f
	db "screen…", $57
; 0x7a3de

ElmsLab_MapEventHeader: ; 0x7a3de
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $b, $4, 1, GROUP_NEW_BARK_TOWN, MAP_NEW_BARK_TOWN
	warp_def $b, $5, 1, GROUP_NEW_BARK_TOWN, MAP_NEW_BARK_TOWN

	; xy triggers
	db 8
	xy_trigger 1, $6, $4, $0, LabTryToLeaveScript, $0, $0
	xy_trigger 1, $6, $5, $0, LabTryToLeaveScript, $0, $0
	xy_trigger 3, $5, $4, $0, MeetCopScript, $0, $0
	xy_trigger 3, $5, $5, $0, UnknownScript_0x78f12, $0, $0
	xy_trigger 5, $8, $4, $0, UnknownScript_0x78e7f, $0, $0
	xy_trigger 5, $8, $5, $0, UnknownScript_0x78e8e, $0, $0
	xy_trigger 6, $8, $4, $0, UnknownScript_0x78ead, $0, $0
	xy_trigger 6, $8, $5, $0, UnknownScript_0x78ebc, $0, $0

	; signposts
	db 16
	signpost 1, 2, $0, MapElmsLabSignpost0Script
	signpost 1, 6, $0, MapElmsLabSignpost12Script
	signpost 1, 7, $0, MapElmsLabSignpost12Script
	signpost 1, 8, $0, MapElmsLabSignpost12Script
	signpost 1, 9, $0, MapElmsLabSignpost12Script
	signpost 7, 0, $0, MapElmsLabSignpost5Script
	signpost 7, 1, $0, MapElmsLabSignpost6Script
	signpost 7, 2, $0, MapElmsLabSignpost7Script
	signpost 7, 3, $0, MapElmsLabSignpost8Script
	signpost 7, 6, $0, MapElmsLabSignpost12Script
	signpost 7, 7, $0, MapElmsLabSignpost12Script
	signpost 7, 8, $0, MapElmsLabSignpost12Script
	signpost 7, 9, $0, MapElmsLabSignpost12Script
	signpost 3, 9, $0, MapElmsLabSignpost13Script
	signpost 0, 5, $0, MapElmsLabSignpost14Script
	signpost 5, 3, $2, MapElmsLabSignpost15Script

	; people-events
	db 6
	person_event $10, 6, 9, $6, $0, 255, 255, $0, 0, ProfElmScript, $ffff
	person_event $3c, 13, 6, $3, $0, 255, 255, $90, 0, ElmsAideScript, $0701
	person_event $54, 7, 10, $1, $0, 255, 255, $0, 0, CyndaquilPokeBallScript, $0640
	person_event $54, 7, 11, $1, $0, 255, 255, $0, 0, TotodilePokeBallScript, $0641
	person_event $54, 7, 12, $1, $0, 255, 255, $0, 0, ChikoritaPokeBallScript, $0642
	person_event $43, 7, 9, $7, $0, 255, 255, $90, 0, $4f1a, $0702
; 0x7a4cc

