WiseTriosRoom_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x98572, $0000
	dw UnknownScript_0x98573, $0000

.MapCallbacks:
	db 1

	; callbacks

	dbw 2, UnknownScript_0x98574

UnknownScript_0x98572:
	end

UnknownScript_0x98573:
	end

UnknownScript_0x98574:
	checkevent EVENT_FOUGHT_SUICUNE
	iftrue UnknownScript_0x98593
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue UnknownScript_0x9858c
	checkitem CLEAR_BELL
	iftrue UnknownScript_0x9858c
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	return

UnknownScript_0x9858c:
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	return

UnknownScript_0x98593:
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	return

SageScript_0x9859a:
	jumptextfaceplayer UnknownText_0x9862b

SageScript_0x9859d:
	jumptextfaceplayer UnknownText_0x9868b

SageScript_0x985a0:
	jumptextfaceplayer UnknownText_0x987af

UnknownScript_0x985a3:
	spriteface $4, UP
	spriteface $0, DOWN
	showemote EMOTE_SHOCK, $4, 20
	follow $0, $4
	applymovement $0, MovementData_0x98622
	stopfollow
	spriteface $0, RIGHT
	loadfont
	writetext UnknownText_0x98712
	closetext
	loadmovesprites
	applymovement $4, MovementData_0x98625
	spriteface $4, LEFT
	end

TrainerSageGaku:
	trainer EVENT_BEAT_SAGE_GAKU, SAGE, GAKU, SageGakuSeenText, SageGakuBeatenText, $0000, SageGakuScript

SageGakuScript:
	loadfont
	writetext UnknownText_0x98938
	closetext
	loadmovesprites
	end

TrainerSageMasa:
	trainer EVENT_BEAT_SAGE_MASA, SAGE, MASA, SageMasaSeenText, SageMasaBeatenText, $0000, SageMasaScript

SageMasaScript:
	loadfont
	writetext UnknownText_0x98a35
	closetext
	loadmovesprites
	end

TrainerSageKoji:
	trainer EVENT_BEAT_SAGE_KOJI, SAGE, KOJI, SageKojiSeenText, SageKojiBeatenText, $0000, SageKojiScript

SageKojiScript:
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue UnknownScript_0x9861b
	pause 10
	showemote EMOTE_SHOCK, $7, 20
	loadfont
	writetext UnknownText_0x98c6c
	keeptextopen
	writetext UnknownText_0x98cac
	closetext
	loadmovesprites
	applymovement $7, MovementData_0x98628
	spriteface $7, UP
	setevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	dotrigger $1
	end

UnknownScript_0x9861b:
	loadfont
	writetext UnknownText_0x98db5
	closetext
	loadmovesprites
	end

MovementData_0x98622:
	step_left
	step_left
	step_end

MovementData_0x98625:
	step_right
	step_down
	step_end

MovementData_0x98628:
	step_right
	step_down
	step_end

UnknownText_0x9862b:
	text "Astounding…"

	para "SUICUNE, ENTEI and"
	line "RAIKOU have arisen"
	cont "from their sleep…"

	para "Is the legend"
	line "coming true?"
	done

UnknownText_0x9868b:
	text "We train at the"
	line "BURNED TOWER, but"

	para "we've never heard"
	line "of a hole opening"

	para "up there before."
	line "It must have been"

	para "deliberately made"
	line "by someone."
	done

UnknownText_0x98712:
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

UnknownText_0x987af:
	text "We, the WISE TRIO,"
	line "are the protectors"

	para "of the legendary"
	line "#MON."
	done

SageGakuSeenText:
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

SageGakuBeatenText:
	text "Stronger than we"
	line "thought? Perhaps…"
	done

UnknownText_0x98938:
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

SageMasaSeenText:
	text "Can you be trusted"
	line "with the truth?"

	para "I must ascertain"
	line "your worthiness."
	done

SageMasaBeatenText:
	text "…I will tell you"
	line "the truth…"
	done

UnknownText_0x98a35:
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

SageKojiSeenText:
	text "Let me see your"
	line "power!"
	done

SageKojiBeatenText:
	text "Too strong!"
	line "Why?"
	done

UnknownText_0x98c6c:
	text "You… Are you the"
	line "trainer who is"

	para "awaited by the"
	line "legendary #MON?"
	done

UnknownText_0x98cac:
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

UnknownText_0x98db5:
	text "Please, do go on."

	para "SUICUNE will put"
	line "you to the test."
	done

WiseTriosRoom_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $4, $7, 4, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $5, $7, 5, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $4, $1, 5, GROUP_ECRUTEAK_HOUSE, MAP_ECRUTEAK_HOUSE

.XYTriggers:
	db 1
	xy_trigger 0, $4, $7, $0, UnknownScript_0x985a3, $0, $0

.Signposts:
	db 0

.PersonEvents:
	db 6
	person_event SPRITE_SAGE, 6, 10, OW_DOWN | $3, $0, -1, -1, $0, 0, SageScript_0x9859a, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	person_event SPRITE_SAGE, 11, 10, OW_UP | $1, $1, -1, -1, $0, 0, SageScript_0x9859d, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	person_event SPRITE_SAGE, 9, 11, OW_LEFT | $0, $0, -1, -1, $0, 0, SageScript_0x985a0, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	person_event SPRITE_SAGE, 6, 8, OW_UP | $2, $0, -1, -1, $2, 2, TrainerSageGaku, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	person_event SPRITE_SAGE, 10, 8, OW_UP | $3, $0, -1, -1, $2, 2, TrainerSageMasa, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	person_event SPRITE_SAGE, 8, 10, OW_LEFT | $0, $0, -1, -1, $2, 2, TrainerSageKoji, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
