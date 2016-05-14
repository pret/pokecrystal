const_value set 2
	const WISETRIOSROOM_SAGE1
	const WISETRIOSROOM_SAGE2
	const WISETRIOSROOM_SAGE3
	const WISETRIOSROOM_SAGE4
	const WISETRIOSROOM_SAGE5
	const WISETRIOSROOM_SAGE6

WiseTriosRoom_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x98572, 0
	dw UnknownScript_0x98573, 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_OBJECTS, UnknownScript_0x98574

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
	spriteface WISETRIOSROOM_SAGE3, UP
	spriteface PLAYER, DOWN
	showemote EMOTE_SHOCK, WISETRIOSROOM_SAGE3, 20
	follow PLAYER, WISETRIOSROOM_SAGE3
	applymovement PLAYER, MovementData_0x98622
	stopfollow
	spriteface PLAYER, RIGHT
	opentext
	writetext UnknownText_0x98712
	waitbutton
	closetext
	applymovement WISETRIOSROOM_SAGE3, MovementData_0x98625
	spriteface WISETRIOSROOM_SAGE3, LEFT
	end

TrainerSageGaku:
	trainer EVENT_BEAT_SAGE_GAKU, SAGE, GAKU, SageGakuSeenText, SageGakuBeatenText, 0, SageGakuScript

SageGakuScript:
	opentext
	writetext UnknownText_0x98938
	waitbutton
	closetext
	end

TrainerSageMasa:
	trainer EVENT_BEAT_SAGE_MASA, SAGE, MASA, SageMasaSeenText, SageMasaBeatenText, 0, SageMasaScript

SageMasaScript:
	opentext
	writetext UnknownText_0x98a35
	waitbutton
	closetext
	end

TrainerSageKoji:
	trainer EVENT_BEAT_SAGE_KOJI, SAGE, KOJI, SageKojiSeenText, SageKojiBeatenText, 0, SageKojiScript

SageKojiScript:
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue UnknownScript_0x9861b
	pause 10
	showemote EMOTE_SHOCK, WISETRIOSROOM_SAGE6, 20
	opentext
	writetext UnknownText_0x98c6c
	buttonsound
	writetext UnknownText_0x98cac
	waitbutton
	closetext
	applymovement WISETRIOSROOM_SAGE6, MovementData_0x98628
	spriteface WISETRIOSROOM_SAGE6, UP
	setevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	dotrigger $1
	end

UnknownScript_0x9861b:
	opentext
	writetext UnknownText_0x98db5
	waitbutton
	closetext
	end

MovementData_0x98622:
	step LEFT
	step LEFT
	step_end

MovementData_0x98625:
	step RIGHT
	step DOWN
	step_end

MovementData_0x98628:
	step RIGHT
	step DOWN
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
	warp_def $4, $7, 4, ECRUTEAK_CITY
	warp_def $5, $7, 5, ECRUTEAK_CITY
	warp_def $4, $1, 5, ECRUTEAK_HOUSE

.XYTriggers:
	db 1
	xy_trigger 0, $4, $7, $0, UnknownScript_0x985a3, $0, $0

.Signposts:
	db 0

.PersonEvents:
	db 6
	person_event SPRITE_SAGE, 2, 6, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SageScript_0x9859a, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	person_event SPRITE_SAGE, 7, 6, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SageScript_0x9859d, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	person_event SPRITE_SAGE, 5, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SageScript_0x985a0, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	person_event SPRITE_SAGE, 2, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 2, TrainerSageGaku, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	person_event SPRITE_SAGE, 6, 4, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 2, TrainerSageMasa, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	person_event SPRITE_SAGE, 4, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 2, TrainerSageKoji, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
