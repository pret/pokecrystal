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
	spriteface $2, RIGHT
	loadfont
	writetext UnknownText_0x78fb6
UnknownScript_0x78b9b: ; 0x78b9b
	yesorno
	iftrue UnknownScript_0x78ba5
	writetext UnknownText_0x7911a
	jump UnknownScript_0x78b9b
; 0x78ba5

UnknownScript_0x78ba5: ; 0x78ba5
	writetext UnknownText_0x790fa
	keeptextopen
	writetext UnknownText_0x7913a
	closetext
	loadmovesprites
	playsound SFX_GLASS_TING
	pause 30
	showemote $0, $2, 10
	spriteface $2, DOWN
	loadfont
	writetext UnknownText_0x791ae
	closetext
	loadmovesprites
	loadfont
	spriteface $2, RIGHT
	writetext UnknownText_0x791df
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x78fa0
	spriteface $0, UP
	applymovement $2, MovementData_0x78fa2
	spriteface $0, RIGHT
	loadfont
	writetext UnknownText_0x792ff
	closetext
	dotrigger $1
	loadmovesprites
	end
; 0x78be0

ProfElmScript: ; 0x78be0
	faceplayer
	loadfont
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftrue UnknownScript_0x78bee
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue ElmGiveTicketScript
UnknownScript_0x78bee: ; 0x78bee
	checkevent EVENT_GOT_MASTER_BALL_FROM_ELM
	iftrue UnknownScript_0x78bfa
	checkflag $0022
	iftrue ElmGiveMasterBallScript
UnknownScript_0x78bfa: ; 0x78bfa
	checkevent EVENT_GOT_EVERSTONE_FROM_ELM
	iftrue UnknownScript_0x78e16
	checkevent EVENT_SHOWED_TOGEPI_TO_ELM
	iftrue UnknownScript_0x78e03
	checkevent EVENT_TOLD_ELM_ABOUT_TOGEPI_OVER_THE_PHONE
	iffalse UnknownScript_0x78c35
	writebyte TOGEPI
	special Functionc284
	iftrue ShowElmTogepiScript
	writebyte TOGETIC
	special Functionc284
	iftrue ShowElmTogepiScript
	writetext UnknownText_0x79a40
	closetext
	loadmovesprites
	end
; 0x78c22

UnknownScript_0x78c22: ; 0x78c22
	writebyte TOGEPI
	special Functionc284
	iftrue ShowElmTogepiScript
	writebyte TOGETIC
	special Functionc284
	iftrue ShowElmTogepiScript
	jump UnknownScript_0x78c41
; 0x78c35

UnknownScript_0x78c35: ; 0x78c35
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iffalse UnknownScript_0x78c41
	checkevent EVENT_TOGEPI_HATCHED
	iftrue UnknownScript_0x78c22
UnknownScript_0x78c41: ; 0x78c41
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE ; why are we checking it again?
	iftrue ElmWaitingEggHatchScript
	checkflag $001b
	iftrue ElmAideHasEggScript
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue ElmStudyingEggScript
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue ElmAfterTheftScript
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue ElmDescribesMrPokemonScript
	writetext UnknownText_0x79375
	closetext
	loadmovesprites
	end
; 0x78c65

LabTryToLeaveScript: ; 0x78c65
	spriteface $2, DOWN
	loadfont
	writetext LabWhereGoingText
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x78f70
	end
; 0x78c73

CyndaquilPokeBallScript: ; 0x78c73
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	spriteface $2, DOWN
	refreshscreen $0
	pokepic CYNDAQUIL
	cry CYNDAQUIL
	closetext
	pokepicyesorno
	loadfont
	writetext TakeCyndaquilText
	yesorno
	iffalse DidntChooseStarterScript
	disappear $4
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext ChoseStarterText
	keeptextopen
	waitbutton
	pokenamemem CYNDAQUIL, $0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitbutton
	keeptextopen
	givepoke CYNDAQUIL, 5, BERRY, 0
	loadmovesprites
	checkcode $9
	if_equal $3, ElmDirectionsScript
	applymovement $0, AfterCyndaquilMovement
	jump ElmDirectionsScript
; 0x78cb5

TotodilePokeBallScript: ; 0x78cb5
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	spriteface $2, DOWN
	refreshscreen $0
	pokepic TOTODILE
	cry TOTODILE
	closetext
	pokepicyesorno
	loadfont
	writetext TakeTotodileText
	yesorno
	iffalse DidntChooseStarterScript
	disappear $5
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext ChoseStarterText
	keeptextopen
	waitbutton
	pokenamemem TOTODILE, $0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitbutton
	keeptextopen
	givepoke TOTODILE, 5, BERRY, 0
	loadmovesprites
	applymovement $0, AfterTotodileMovement
	jump ElmDirectionsScript
; 0x78cf1

ChikoritaPokeBallScript: ; 0x78cf1
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	spriteface $2, DOWN
	refreshscreen $0
	pokepic CHIKORITA
	cry CHIKORITA
	closetext
	pokepicyesorno
	loadfont
	writetext TakeChikoritaText
	yesorno
	iffalse DidntChooseStarterScript
	disappear $6
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext ChoseStarterText
	keeptextopen
	waitbutton
	pokenamemem CHIKORITA, $0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitbutton
	keeptextopen
	givepoke CHIKORITA, 5, BERRY, 0
	loadmovesprites
	applymovement $0, AfterChikoritaMovement
	jump ElmDirectionsScript
; 0x78d2d

DidntChooseStarterScript: ; 0x78d2d
	writetext DidntChooseStarterText
	closetext
	loadmovesprites
	end
; 0x78d33

ElmDirectionsScript: ; 0x78d33
	spriteface $0, UP
	loadfont
	writetext ElmDirectionsText1
	closetext
	loadmovesprites
	addcellnum $4
	loadfont
	writetext GotElmsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitbutton
	closetext
	loadmovesprites
	spriteface $2, LEFT
	loadfont
	writetext ElmDirectionsText2
	closetext
	loadmovesprites
	spriteface $2, DOWN
	loadfont
	writetext ElmDirectionsText3
	closetext
	loadmovesprites
	setevent EVENT_GOT_A_POKEMON_FROM_ELM
	setevent $06be
	dotrigger $5
	domaptrigger GROUP_NEW_BARK_TOWN, MAP_NEW_BARK_TOWN, $1
	end
; 0x78d67

ElmDescribesMrPokemonScript: ; 0x78d67
	writetext ElmDescribesMrPokemonText
	closetext
	loadmovesprites
	end
; 0x78d6d

LookAtElmPokeBallScript: ; 0x78d6d
	loadfont
	writetext ElmPokeBallText
	closetext
	loadmovesprites
	end
; 0x78d74

ElmsLabHealingMachine:
	loadfont
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .CanHeal
	writetext ElmsLabHealingMachineText1
	closetext
	loadmovesprites
	end

.CanHeal
	writetext ElmsLabHealingMachineText2
	yesorno
	iftrue UnknownScript_0x78d8a
	loadmovesprites
	end
; 0x78d8a

UnknownScript_0x78d8a: ; 0x78d8a
	special Function1060a2
	special HealParty
	playmusic MUSIC_NONE
	writebyte $1
	special HealMachineAnim
	pause 30
	special RestartMapMusic
	loadmovesprites
	end
; 0x78d9f

ElmAfterTheftDoneScript: ; 0x78d9f
	closetext
	loadmovesprites
	end
; 0x78da2

ElmAfterTheftScript: ; 0x78da2
	writetext ElmAfterTheftText1
	checkitem MYSTERY_EGG
	iffalse ElmAfterTheftDoneScript
	keeptextopen
	writetext ElmAfterTheftText2
	closetext
	takeitem MYSTERY_EGG, 1
	scall ElmJumpBackScript1
	writetext ElmAfterTheftText3
	closetext
	scall ElmJumpBackScript2
	writetext ElmAfterTheftText4
	keeptextopen
	writetext ElmAfterTheftText5
	keeptextopen
	setevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	setflag $0010
	domaptrigger GROUP_ROUTE_29, MAP_ROUTE_29, $1
	clearevent $0715
	setevent $0714
	writetext ElmAfterTheftText6
	closetext
	loadmovesprites
	dotrigger $6
	end
; 0x78ddc

ElmStudyingEggScript: ; 0x78ddc
	writetext ElmStudyingEggText
	closetext
	loadmovesprites
	end
; 0x78de2

ElmAideHasEggScript: ; 0x78de2
	writetext ElmAideHasEggText
	closetext
	loadmovesprites
	end
; 0x78de8

ElmWaitingEggHatchScript: ; 0x78de8
	writetext ElmWaitingEggHatchText
	closetext
	loadmovesprites
	end
; 0x78dee

ShowElmTogepiScript: ; 0x78dee
	writetext ShowElmTogepiText1
	closetext
	loadmovesprites
	showemote $0, $2, 15
	setevent EVENT_SHOWED_TOGEPI_TO_ELM
	loadfont
	writetext ShowElmTogepiText2
	keeptextopen
	writetext ShowElmTogepiText3
	keeptextopen
UnknownScript_0x78e03: ; 0x78e03
	writetext ElmGiveEverstoneText1
	keeptextopen
	verbosegiveitem EVERSTONE, 1
	iffalse UnknownScript_0x78e1a
	writetext ElmGiveEverstoneText2
	closetext
	loadmovesprites
	setevent EVENT_GOT_EVERSTONE_FROM_ELM
	end
; 0x78e16

UnknownScript_0x78e16: ; 0x78e16
	writetext UnknownText_0x79c37
	closetext
UnknownScript_0x78e1a: ; 0x78e1a
	loadmovesprites
	end
; 0x78e1c

ElmGiveMasterBallScript: ; 0x78e1c
	writetext ElmGiveMasterBallText1
	keeptextopen
	verbosegiveitem MASTER_BALL, 1
	iffalse .notdone
	setevent EVENT_GOT_MASTER_BALL_FROM_ELM
	writetext ElmGiveMasterBallText2
	closetext
.notdone
	loadmovesprites
	end
; 0x78e2f

ElmGiveTicketScript: ; 0x78e2f
	writetext ElmGiveTicketText1
	keeptextopen
	verbosegiveitem S_S_TICKET, 1
	setevent EVENT_GOT_SS_TICKET_FROM_ELM
	writetext ElmGiveTicketText2
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
	spriteface $0, DOWN
	scall UnknownScript_0x78e9d
	applymovement $3, MovementData_0x78f87
	end
; 0x78e8e

UnknownScript_0x78e8e: ; 0x78e8e
	applymovement $3, MovementData_0x78f82
	spriteface $0, DOWN
	scall UnknownScript_0x78e9d
	applymovement $3, MovementData_0x78f8b
	end
; 0x78e9d

UnknownScript_0x78e9d: ; 0x78e9d
	loadfont
	writetext UnknownText_0x79f38
	keeptextopen
	verbosegiveitem POTION, 1
	writetext UnknownText_0x79f65
	closetext
	loadmovesprites
	dotrigger $2
	end
; 0x78ead

UnknownScript_0x78ead: ; 0x78ead
	applymovement $3, MovementData_0x78f7e
	spriteface $0, DOWN
	scall UnknownScript_0x78ecb
	applymovement $3, MovementData_0x78f87
	end
; 0x78ebc

UnknownScript_0x78ebc: ; 0x78ebc
	applymovement $3, MovementData_0x78f82
	spriteface $0, DOWN
	scall UnknownScript_0x78ecb
	applymovement $3, MovementData_0x78f8b
	end
; 0x78ecb

UnknownScript_0x78ecb: ; 0x78ecb
	loadfont
	writetext UnknownText_0x7a078
	keeptextopen
	itemtotext POKE_BALL, $1
	scall UnknownScript_0x78ee2
	giveitem POKE_BALL, $5
	writetext UnknownText_0x7a09a
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
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iftrue UnknownScript_0x78f0c
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue UnknownScript_0x78f06
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue UnknownScript_0x78f00
	writetext UnknownText_0x79f65
	closetext
	loadmovesprites
	end
; 0x78f00

UnknownScript_0x78f00: ; 0x78f00
	writetext UnknownText_0x79f95
	closetext
	loadmovesprites
	end
; 0x78f06

UnknownScript_0x78f06: ; 0x78f06
	writetext UnknownText_0x7a09a
	closetext
	loadmovesprites
	end
; 0x78f0c

UnknownScript_0x78f0c: ; 0x78f0c
	writetext UnknownText_0x79c65
	closetext
	loadmovesprites
	end
; 0x78f12

UnknownScript_0x78f12: ; 0x78f12
	applymovement $0, MovementData_0x78f72

MeetCopScript: ; 0x78f16
	applymovement $0, MovementData_0x78f74
CopScript: ; 0x78f1a
	spriteface $7, LEFT
	loadfont
	writetext UnknownText_0x7a0f0
	keeptextopen
	special SpecialNameRival
	writetext UnknownText_0x7a1c0
	closetext
	loadmovesprites
	applymovement $7, MovementData_0x78f78
	disappear $7
	dotrigger $2
	end
; 0x78f33

ElmsLabWindow:
	loadfont
	checkflag $0043
	iftrue .Normal
	checkevent EVENT_ELM_CALLED_ABOUT_STOLEN_POKEMON
	iftrue .BreakIn
	jump .Normal

.BreakIn
	writetext ElmsLabWindowText2
	closetext
	loadmovesprites
	end
; 0x78f49

.Normal
	writetext ElmsLabWindowText1
	closetext
	loadmovesprites
	end
; 0x78f4f

ElmsLabTravelTip1:
	jumptext ElmsLabTravelTip1Text

ElmsLabTravelTip2:
	jumptext ElmsLabTravelTip2Text

ElmsLabTravelTip3:
	jumptext ElmsLabTravelTip3Text

ElmsLabTravelTip4:
	jumptext ElmsLabTravelTip4Text

ElmsLabTrashcan:
	jumptext ElmsLabTrashcanText

ElmsLabPC: ; 0x78f5e
	jumptext ElmsLabPCText
; 0x78f61

ElmsLabTrashcan2:
; unused
	jumpstd trashcan

ElmsLabBookshelf:
	jumpstd difficultbookshelf

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
	text "ELM: ", $14, "!"
	line "There you are!"

	para "I needed to ask"
	line "you a favor."

	para "I'm conducting new"
	line "#MON research"

	para "right now. I was"
	line "wondering if you"

	para "could help me with"
	line "it, ", $14, "."

	para "You see…"

	para "I'm writing a"
	line "paper that I want"

	para "to present at a"
	line "conference."

	para "But there are some"
	line "things I don't"

	para "quite understand"
	line "yet."

	para "So!"

	para "I'd like you to"
	line "raise a #MON"

	para "that I recently"
	line "caught."
	done
; 0x790fa

UnknownText_0x790fa: ; 0x790fa
	text "Thanks, ", $14, "!"

	para "You're a great"
	line "help!"
	done
; 0x7911a

UnknownText_0x7911a: ; 0x7911a
	text "But… Please, I"
	line "need your help!"
	done
; 0x7913a

UnknownText_0x7913a: ; 0x7913a
	text "When I announce my"
	line "findings, I'm sure"

	para "we'll delve a bit"
	line "deeper into the"

	para "many mysteries of"
	line "#MON."

	para "You can count on"
	line "it!"
	done
; 0x791ae

UnknownText_0x791ae: ; 0x791ae
	text "Oh, hey! I got an"
	line "e-mail!"

	para $56, $56, $56
	line "Hm… Uh-huh…"

	para "Okay…"
	done
; 0x791df

UnknownText_0x791df: ; 0x791df
	text "Hey, listen."

	para "I have an acquain-"
	line "tance called MR."
	cont "#MON."

	para "He keeps finding"
	line "weird things and"

	para "raving about his"
	line "discoveries."

	para "Anyway, I just got"
	line "an e-mail from him"

	para "saying that this"
	line "time it's real."

	para "It is intriguing,"
	line "but we're busy"

	para "with our #MON"
	line "research…"

	para "Wait!"

	para "I know!"

	para $14, ", can you"
	line "go in our place?"
	done
; 0x792ff

UnknownText_0x792ff: ; 0x792ff
	text "I want you to"
	line "raise one of the"

	para "#MON contained"
	line "in these BALLS."

	para "You'll be that"
	line "#MON's first"
	cont "partner, ", $14, "!"

	para "Go on. Pick one!"
	done
; 0x79375

UnknownText_0x79375: ; 0x79375
	text "If a wild #MON"
	line "appears, let your"
	cont "#MON battle it!"
	done
; 0x793a7

LabWhereGoingText: ; 0x793a7
	text "ELM: Wait! Where"
	line "are you going?"
	done
; 0x793c8

TakeCyndaquilText: ; 0x793c8
	text "ELM: You'll take"
	line "CYNDAQUIL, the"
	cont "fire #MON?"
	done
; 0x793f3

TakeTotodileText: ; 0x793f3
	text "ELM: Do you want"
	line "TOTODILE, the"
	cont "water #MON?"
	done
; 0x7941f

TakeChikoritaText: ; 0x7941f
	text "ELM: So, you like"
	line "CHIKORITA, the"
	cont "grass #MON?"
	done
; 0x7944d

DidntChooseStarterText: ; 0x7944d
	text "ELM: Think it over"
	line "carefully."

	para "Your partner is"
	line "important."
	done
; 0x79487

ChoseStarterText: ; 0x79487
	text "ELM: I think"
	line "that's a great"
	cont "#MON too!"
	done
; 0x794ad

ReceivedStarterText: ; 0x794ad
	text $52, " received"
	line "@"
	text_from_ram StringBuffer3
	text "!"
	done
; 0x794c0

ElmDirectionsText1: ; 0x794c0
	text "MR.#MON lives a"
	line "little bit beyond"

	para "CHERRYGROVE, the"
	line "next city over."

	para "It's almost a"
	line "direct route"

	para "there, so you"
	line "can't miss it."

	para "But just in case,"
	line "here's my phone"

	para "number. Call me if"
	line "anything comes up!"
	done

ElmDirectionsText2: ; 0x79581
	text "If your #MON is"
	line "hurt, you should"

	para "heal it with this"
	line "machine."

	para "Feel free to use"
	line "it anytime."
	done

ElmDirectionsText3: ; 0x795db
	text $14, ", I'm"
	line "counting on you!"
	done

GotElmsNumberText: ; 0x795f3
	text $52, " got ELM's"
	line "phone number."
	done

ElmDescribesMrPokemonText: ; 0x7960d
	text "MR.#MON goes"
	line "everywhere and"
	cont "finds rarities."

	para "Too bad they're"
	line "just rare and"
	cont "not very useful…"
	done

ElmPokeBallText: ; 0x79668
	text "It contains a"
	line "#MON caught by"
	cont "PROF.ELM."
	done

ElmsLabHealingMachineText1:
	text "I wonder what this"
	line "does?"
	done

ElmsLabHealingMachineText2:
	text "Would you like to"
	line "heal your #MON?"
	done

ElmAfterTheftText1: ; 0x796cd
	text "ELM: ", $14, ", this"
	line "is terrible…"

	para "Oh, yes, what was"
	line "MR.#MON's big"
	cont "discovery?"
	done
; 0x79712

ElmAfterTheftText2: ; 0x79712
	text $52, " handed"
	line "the MYSTERY EGG to"
	cont "PROF.ELM."
	done
; 0x79739

ElmAfterTheftText3: ; 0x79739
	text "ELM: This?"
	done
; 0x79745

ElmAfterTheftText4: ; 0x79745
	text "But… Is it a"
	line "#MON EGG?"

	para "If it is, it is a"
	line "great discovery!"
	done
; 0x79780

ElmAfterTheftText5: ; 0x79780
	text "ELM: What?!?"

	para "PROF.OAK gave you"
	line "a #DEX?"

	para $14, ", is that"
	line "true? Th-that's"
	cont "incredible!"

	para "He is superb at"
	line "seeing the poten-"
	cont "tial of people as"
	cont "trainers."

	para "Wow, ", $14, ". You"
	line "may have what it"

	para "takes to become"
	line "the CHAMPION."

	para "You seem to be"
	line "getting on great"
	cont "with #MON too."

	para "You should take"
	line "the #MON GYM"
	cont "challenge."

	para "The closest GYM"
	line "would be the one"
	cont "in VIOLET CITY."
	done
; 0x798cf

ElmAfterTheftText6: ; 0x798cf
	text "…", $14, ". The"
	line "road to the"

	para "championship will"
	line "be a long one."

	para "Before you leave,"
	line "make sure that you"
	cont "talk to your mom."
	done
; 0x7993c

ElmStudyingEggText: ; 0x7993c
	text "ELM: Don't give"
	line "up! I'll call if"

	para "I learn anything"
	line "about that EGG!"
	done
; 0x7997d

ElmAideHasEggText: ; 0x7997d
	text "ELM: ", $14, "?"
	line "Didn't you meet my"
	cont "assistant?"

	para "He should have met"
	line "you with the EGG"

	para "at VIOLET CITY's"
	line "#MON CENTER."

	para "You must have just"
	line "missed him. Try to"
	cont "catch him there."
	done
; 0x79a1b

ElmWaitingEggHatchText: ; 0x79a1b
	text "ELM: Hey, has that"
	line "EGG changed any?"
	done
; 0x79a40

UnknownText_0x79a40: ; 0x79a40
	text $14, "? I thought"
	line "the EGG hatched."

	para "Where is the"
	line "#MON?"
	done
; 0x79a72

ShowElmTogepiText1: ; 0x79a72
	text "ELM: ", $14, ", you"
	line "look great!"
	done
; 0x79a8b

ShowElmTogepiText2: ; 0x79a8b
	text "What?"
	line "That #MON!?!"
	done
; 0x79a9f

ShowElmTogepiText3: ; 0x79a9f
	text "The EGG hatched!"
	line "So, #MON are"
	cont "born from EGGS…"

	para "No, perhaps not"
	line "all #MON are."

	para "Wow, there's still"
	line "a lot of research"
	cont "to be done."
	done
; 0x79b1c

ElmGiveEverstoneText1: ; 0x79b1c
	text "Thanks, ", $14, "!"
	line "You're helping"

	para "unravel #MON"
	line "mysteries for us!"

	para "I want you to have"
	line "this as a token of"
	cont "our appreciation."
	done
; 0x79b8d

ElmGiveEverstoneText2: ; 0x79b8d
	text "That's an"
	line "EVERSTONE."

	para "Some species of"
	line "#MON evolve"

	para "when they grow to"
	line "certain levels."

	para "A #MON holding"
	line "the EVERSTONE"
	cont "won't evolve."

	para "Give it to a #-"
	line "MON you don't want"
	cont "to evolve."
	done
; 0x79c37

UnknownText_0x79c37: ; 0x79c37
	text "ELM: ", $14, ", I'll"
	line "call you if any-"
	cont "thing comes up."
	done
; 0x79c65

UnknownText_0x79c65: ; 0x79c65
	text "…sigh… That"
	line "stolen #MON."

	para "I wonder how it's"
	line "doing."

	para "They say a #MON"
	line "raised by a bad"

	para "person turns bad"
	line "itself."
	done
; 0x79cd0

ElmGiveMasterBallText1: ; 0x79cd0
	text "ELM: Hi, ", $14, "!"
	line "Thanks to you, my"

	para "research is going"
	line "great!"

	para "Take this as a"
	line "token of my"
	cont "appreciation."
	done
; 0x79d31

ElmGiveMasterBallText2: ; 0x79d31
	text "The MASTER BALL is"
	line "the best!"

	para "It's the ultimate"
	line "BALL! It'll catch"

	para "any #MON with-"
	line "out fail."

	para "It's given only to"
	line "recognized #MON"
	cont "researchers."

	para "I think you can"
	line "make much better"

	para "use of it than I"
	line "can, ", $14, "!"
	done
; 0x79df3

ElmGiveTicketText1: ; 0x79df3
	text "ELM: ", $14, "!"
	line "There you are!"

	para "I called because I"
	line "have something for"
	cont "you."

	para "See? It's an"
	line "S.S.TICKET."

	para "Now you can catch"
	line "#MON in KANTO."
	done
; 0x79e6f

ElmGiveTicketText2: ; 0x79e6f
	text "The ship departs"
	line "from OLIVINE CITY."

	para "But you knew that"
	line "already, ", $14, "."

	para "After all, you've"
	line "traveled all over"
	cont "with your #MON."

	para "Give my regards to"
	line "PROF.OAK in KANTO!"
	done
; 0x79f0b

UnknownText_0x79f0b: ; 0x79f0b
	text "It's the #MON"
	line "EGG being studied"
	cont "by PROF.ELM."
	done
; 0x79f38

UnknownText_0x79f38: ; 0x79f38
	text $14, ", I want"
	line "you to have this"
	cont "for your errand."
	done
; 0x79f65

UnknownText_0x79f65: ; 0x79f65
	text "There are only two"
	line "of us, so we're"
	cont "always busy."
	done
; 0x79f95

UnknownText_0x79f95: ; 0x79f95
	text "There was a loud"
	line "noise outside…"

	para "When we went to"
	line "look, someone"
	cont "stole a #MON."

	para "It's unbelievable"
	line "that anyone would"
	cont "do that!"

	para "…sigh… That"
	line "stolen #MON."

	para "I wonder how it's"
	line "doing."

	para "They say a #MON"
	line "raised by a bad"

	para "person turns bad"
	line "itself."
	done
; 0x7a078

UnknownText_0x7a078: ; 0x7a078
	text $14, "!"

	para "Use these on your"
	line "#DEX quest!"
	done
; 0x7a09a

UnknownText_0x7a09a: ; 0x7a09a
	text "To add to your"
	line "#DEX, you have"
	cont "to catch #MON."

	para "Throw # BALLS"
	line "at wild #MON"
	cont "to get them."
	done
; 0x7a0f0

UnknownText_0x7a0f0: ; 0x7a0f0
	text "I heard a #MON"
	line "was stolen here…"

	para "I was just getting"
	line "some information"
	cont "from PROF.ELM."

	para "Apparently, it was"
	line "a young male with"
	cont "long, red hair…"

	para "What?"

	para "You battled a"
	line "trainer like that?"

	para "Did you happen to"
	line "get his name?"
	done
; 0x7a1c0

UnknownText_0x7a1c0: ; 0x7a1c0
	text "OK! So ", $53
	line "was his name."

	para "Thanks for helping"
	line "my investigation!"
	done
; 0x7a1fd

ElmsLabWindowText1:
	text "The window's open."

	para "A pleasant breeze"
	line "is blowing in."
	done

ElmsLabWindowText2:
	text "He broke in"
	line "through here!"
	done

ElmsLabTravelTip1Text:
	text $52, " opened a"
	line "book."

	para "Travel Tip 1:"

	para "Press START to"
	line "open the MENU."
	done

ElmsLabTravelTip2Text:
	text $52, " opened a"
	line "book."

	para "Travel Tip 2:"

	para "Record your trip"
	line "with SAVE!"
	done

ElmsLabTravelTip3Text:
	text $52, " opened a"
	line "book."

	para "Travel Tip 3:"

	para "Open your PACK and"
	line "press SELECT to"
	cont "move items."
	done

ElmsLabTravelTip4Text:
	text $52, " opened a"
	line "book."

	para "Travel Tip 4:"

	para "Check your #MON"
	line "moves. Press the"

	para "A Button to switch"
	line "moves."
	done

ElmsLabTrashcanText:
	text "The wrapper from"
	line "the snack PROF.ELM"
	cont "ate is in there…"
	done

ElmsLabPCText:
	text "OBSERVATIONS ON"
	line "#MON EVOLUTION"

	para "…It says on the"
	line "screen…"
	done

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
	signpost 1, 2, $0, ElmsLabHealingMachine
	signpost 1, 6, $0, ElmsLabBookshelf
	signpost 1, 7, $0, ElmsLabBookshelf
	signpost 1, 8, $0, ElmsLabBookshelf
	signpost 1, 9, $0, ElmsLabBookshelf
	signpost 7, 0, $0, ElmsLabTravelTip1
	signpost 7, 1, $0, ElmsLabTravelTip2
	signpost 7, 2, $0, ElmsLabTravelTip3
	signpost 7, 3, $0, ElmsLabTravelTip4
	signpost 7, 6, $0, ElmsLabBookshelf
	signpost 7, 7, $0, ElmsLabBookshelf
	signpost 7, 8, $0, ElmsLabBookshelf
	signpost 7, 9, $0, ElmsLabBookshelf
	signpost 3, 9, $0, ElmsLabTrashcan
	signpost 0, 5, $0, ElmsLabWindow
	signpost 5, 3, $2, ElmsLabPC

	; people-events
	db 6
	person_event SPRITE_ELM, 6, 9, $6, $0, 255, 255, $0, 0, ProfElmScript, $ffff
	person_event SPRITE_SCIENTIST, 13, 6, $3, $0, 255, 255, $90, 0, ElmsAideScript, $0701
	person_event SPRITE_POKE_BALL, 7, 10, $1, $0, 255, 255, $0, 0, CyndaquilPokeBallScript, $0640
	person_event SPRITE_POKE_BALL, 7, 11, $1, $0, 255, 255, $0, 0, TotodilePokeBallScript, $0641
	person_event SPRITE_POKE_BALL, 7, 12, $1, $0, 255, 255, $0, 0, ChikoritaPokeBallScript, $0642
	person_event SPRITE_OFFICER, 7, 9, $7, $0, 255, 255, $90, 0, CopScript, $0702
