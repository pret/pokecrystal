WiseTriosRoom_MapScriptHeader: ; 0x98565
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x98572, $0000
	dw UnknownScript_0x98573, $0000

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x98574
; 0x98572

UnknownScript_0x98572: ; 0x98572
	end
; 0x98573

UnknownScript_0x98573: ; 0x98573
	end
; 0x98574

UnknownScript_0x98574: ; 0x98574
	checkevent EVENT_FOUGHT_SUICUNE
	iftrue UnknownScript_0x98593
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue UnknownScript_0x9858c
	checkitem CLEAR_BELL
	iftrue UnknownScript_0x9858c
	clearevent $07ab
	setevent $07ac
	return
; 0x9858c

UnknownScript_0x9858c: ; 0x9858c
	setevent $07ab
	clearevent $07ac
	return
; 0x98593

UnknownScript_0x98593: ; 0x98593
	setevent $07ab
	setevent $07ac
	return
; 0x9859a

SageScript_0x9859a: ; 0x9859a
	jumptextfaceplayer UnknownText_0x9862b
; 0x9859d

SageScript_0x9859d: ; 0x9859d
	jumptextfaceplayer UnknownText_0x9868b
; 0x985a0

SageScript_0x985a0: ; 0x985a0
	jumptextfaceplayer UnknownText_0x987af
; 0x985a3

UnknownScript_0x985a3: ; 0x985a3
	spriteface $4, $1
	spriteface $0, $0
	showemote $0, $4, 20
	follow $0, $4
	applymovement $0, MovementData_0x98622
	stopfollow
	spriteface $0, $3
	loadfont
	writetext UnknownText_0x98712
	closetext
	loadmovesprites
	applymovement $4, MovementData_0x98625
	spriteface $4, $2
	end
; 0x985c6

TrainerSageGaku: ; 0x985c6
	; bit/flag number
	dw $5c9

	; trainer group && trainer id
	db SAGE, GAKU

	; text when seen
	dw SageGakuSeenText

	; text when trainer beaten
	dw SageGakuBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SageGakuScript
; 0x985d2

SageGakuScript: ; 0x985d2
	loadfont
	writetext UnknownText_0x98938
	closetext
	loadmovesprites
	end
; 0x985d9

TrainerSageMasa: ; 0x985d9
	; bit/flag number
	dw $5ca

	; trainer group && trainer id
	db SAGE, MASA

	; text when seen
	dw SageMasaSeenText

	; text when trainer beaten
	dw SageMasaBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SageMasaScript
; 0x985e5

SageMasaScript: ; 0x985e5
	loadfont
	writetext UnknownText_0x98a35
	closetext
	loadmovesprites
	end
; 0x985ec

TrainerSageKoji: ; 0x985ec
	; bit/flag number
	dw $5cb

	; trainer group && trainer id
	db SAGE, KOJI

	; text when seen
	dw SageKojiSeenText

	; text when trainer beaten
	dw SageKojiBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SageKojiScript
; 0x985f8

SageKojiScript: ; 0x985f8
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue UnknownScript_0x9861b
	pause 10
	showemote $0, $7, 20
	loadfont
	writetext UnknownText_0x98c6c
	keeptextopen
	writetext UnknownText_0x98cac
	closetext
	loadmovesprites
	applymovement $7, MovementData_0x98628
	spriteface $7, $1
	setevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	dotrigger $1
	end
; 0x9861b

UnknownScript_0x9861b: ; 0x9861b
	loadfont
	writetext UnknownText_0x98db5
	closetext
	loadmovesprites
	end
; 0x98622

MovementData_0x98622: ; 0x98622
	step_left
	step_left
	step_end
; 0x98625

MovementData_0x98625: ; 0x98625
	step_right
	step_down
	step_end
; 0x98628

MovementData_0x98628: ; 0x98628
	step_right
	step_down
	step_end
; 0x9862b

UnknownText_0x9862b: ; 0x9862b
	text "Astounding…"

	para "SUICUNE, ENTEI and"
	line "RAIKOU have arisen"
	cont "from their sleep…"

	para "Is the legend"
	line "coming true?"
	done
; 0x9868b

UnknownText_0x9868b: ; 0x9868b
	text "We train at the"
	line "BURNED TOWER, but"

	para "we've never heard"
	line "of a hole opening"

	para "up there before."
	line "It must have been"

	para "deliberately made"
	line "by someone."
	done
; 0x98712

UnknownText_0x98712: ; 0x98712
	text "TIN TOWER may be"
	line "entered by those"

	para "bearing ECRUTEAK's"
	line "GYM BADGE."

	para "However, now that"
	line "SUICUNE, RAIKOU"

	para "and ENTEI have"
	line "arisen, I ask you"

	para "to refrain from"
	line "entering!"
	done
; 0x987af

UnknownText_0x987af: ; 0x987af
	text "We, the WISE TRIO,"
	line "are the protectors"

	para "of the legendary"
	line "#MON."
	done
; 0x987ed

SageGakuSeenText: ; 0x987ed
	text "Legend has it that"
	line "upon the emergence"

	para "of a trainer who"
	line "has the ability to"

	para "touch the souls of"
	line "#MON, a #MON"

	para "will come forth to"
	line "put that trainer"

	para "to test at the TIN"
	line "TOWER."

	para "The legend has"
	line "come true!"

	para "The legendary"
	line "#MON SUICUNE"
	cont "has arrived!"

	para "We, the WISE TRIO,"
	line "shall test your"

	para "worthiness to go"
	line "inside!"
	done
; 0x98914

SageGakuBeatenText: ; 0x98914
	text "Stronger than we"
	line "thought? Perhaps…"
	done
; 0x98938

UnknownText_0x98938: ; 0x98938
	text "Ah, so it is you"
	line "who claim to have"

	para "seen SUICUNE,"
	line "ENTEI and RAIKOU"
	cont "while they slept?"

	para "Unbelievable!"

	para "Legend has it that"
	line "they can't be seen"
	cont "while they sleep…"
	done
; 0x989d2

SageMasaSeenText: ; 0x989d2
	text "Can you be trusted"
	line "with the truth?"

	para "I must ascertain"
	line "your worthiness."
	done
; 0x98a18

SageMasaBeatenText: ; 0x98a18
	text "…I will tell you"
	line "the truth…"
	done
; 0x98a35

UnknownText_0x98a35: ; 0x98a35
	text "In the past, there"
	line "were two nine-tier"
	cont "towers here."

	para "The BRASS TOWER,"
	line "which was said to"

	para "awaken #MON,"
	line "and the TIN TOWER,"

	para "where #MON were"
	line "said to rest."

	para "The view from the"
	line "tops of the TOWERS"

	para "must have been"
	line "magnificent."

	para "At the time, an"
	line "immense, silver-"

	para "colored #MON"
	line "was said to make"

	para "its roost atop the"
	line "BRASS TOWER."

	para "However…"

	para "About 150 years"
	line "ago, a lightning"

	para "bolt struck one of"
	line "the TOWERS."

	para "It was engulfed in"
	line "flames that raged"
	cont "for three days."

	para "A sudden downpour"
	line "finally put out"
	cont "the blaze."

	para "And that is how"
	line "the BURNED TOWER"
	cont "came to be."
	done
; 0x98c42

SageKojiSeenText: ; 0x98c42
	text "Let me see your"
	line "power!"
	done
; 0x98c5a

SageKojiBeatenText: ; 0x98c5a
	text "Too strong!"
	line "Why?"
	done
; 0x98c6c

UnknownText_0x98c6c: ; 0x98c6c
	text "You… Are you the"
	line "trainer who is"

	para "awaited by the"
	line "legendary #MON?"
	done
; 0x98cac

UnknownText_0x98cac: ; 0x98cac
	text "I see…"

	para "We, the WISE TRIO,"
	line "have been given "

	para "the responsibility"
	line "of protecting the"

	para "legendary #MON."
	line "We are to allow"

	para "passage only to"
	line "those people who"

	para "possess the power"
	line "and soul of truth."

	para "Please, do go on"
	line "and enter the TIN"
	cont "TOWER ahead."

	para "SUICUNE will put"
	line "you to the test."
	done
; 0x98db5

UnknownText_0x98db5: ; 0x98db5
	text "Please, do go on."

	para "SUICUNE will put"
	line "you to the test."
	done
; 0x98dea

WiseTriosRoom_MapEventHeader: ; 0x98dea
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $4, $7, 4, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $5, $7, 5, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $4, $1, 5, GROUP_ECRUTEAK_HOUSE, MAP_ECRUTEAK_HOUSE

	; xy triggers
	db 1
	xy_trigger 0, $4, $7, $0, UnknownScript_0x985a3, $0, $0

	; signposts
	db 0

	; people-events
	db 6
	person_event SPRITE_SAGE, 6, 10, $3, $0, 255, 255, $0, 0, SageScript_0x9859a, $07ab
	person_event SPRITE_SAGE, 11, 10, $5, $1, 255, 255, $0, 0, SageScript_0x9859d, $07ab
	person_event SPRITE_SAGE, 9, 11, $8, $0, 255, 255, $0, 0, SageScript_0x985a0, $07ab
	person_event SPRITE_SAGE, 6, 8, $6, $0, 255, 255, $2, 2, TrainerSageGaku, $07ac
	person_event SPRITE_SAGE, 10, 8, $7, $0, 255, 255, $2, 2, TrainerSageMasa, $07ac
	person_event SPRITE_SAGE, 8, 10, $8, $0, 255, 255, $2, 2, TrainerSageKoji, $07ac
; 0x98e55

