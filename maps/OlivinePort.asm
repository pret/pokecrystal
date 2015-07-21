OlivinePort_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x748ac, $0000
	dw UnknownScript_0x748ad, $0000

.MapCallbacks:
	db 0

UnknownScript_0x748ac:
	end

UnknownScript_0x748ad:
	priorityjump UnknownScript_0x748b1
	end

UnknownScript_0x748b1:
	applymovement $0, MovementData_0x74a32
	appear $2
	dotrigger $0
	setevent EVENT_GAVE_KURT_APRICORNS
	blackoutmod GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY
	end

SailorScript_0x748c0:
	faceplayer
	loadfont
	checkevent EVENT_GAVE_KURT_APRICORNS
	iftrue UnknownScript_0x74919
	writetext UnknownText_0x74a55
	closetext
	loadmovesprites
	spriteface $2, DOWN
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear $2
	waitbutton
	applymovement $0, MovementData_0x74a30
	playsound SFX_EXIT_BUILDING
	special FadeBlackBGMap
	waitbutton
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iffalse UnknownScript_0x7490a
	clearevent EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	setevent EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	clearevent EVENT_BEAT_COOLTRAINERM_SEAN
	clearevent EVENT_BEAT_COOLTRAINERF_CAROL
	clearevent EVENT_BEAT_GENTLEMAN_EDWARD
	clearevent EVENT_BEAT_BEAUTY_CASSIE
	clearevent EVENT_BEAT_PSYCHIC_RODNEY
	clearevent EVENT_BEAT_SUPER_NERD_SHAWN
	clearevent EVENT_BEAT_SAILOR_GARRETT
	clearevent EVENT_BEAT_FISHER_JONAH
	clearevent EVENT_BEAT_BLACKBELT_WAI
UnknownScript_0x7490a:
	clearevent EVENT_FAST_SHIP_DESTINATION_OLIVINE
	appear $2
	domaptrigger GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F, $1
	warp GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F, $19, $1
	end

UnknownScript_0x74919:
	writetext UnknownText_0x74a80
	closetext
	loadmovesprites
	end

UnknownScript_0x7491f:
	spriteface $4, RIGHT
	checkevent EVENT_GAVE_KURT_APRICORNS
	iftrue UnknownScript_0x7498b
	checkevent EVENT_RECEIVED_BALLS_FROM_KURT
	iftrue UnknownScript_0x7498b
	spriteface $0, LEFT
	loadfont
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iffalse UnknownScript_0x7494e
	checkcode VAR_WEEKDAY
	if_equal SUNDAY, UnknownScript_0x74977
	if_equal SATURDAY, UnknownScript_0x74977
	if_equal TUESDAY, UnknownScript_0x74981
	if_equal WEDNESDAY, UnknownScript_0x74981
	if_equal THURSDAY, UnknownScript_0x74981
UnknownScript_0x7494e:
	writetext UnknownText_0x74a9c
	yesorno
	iffalse UnknownScript_0x74992
	writetext UnknownText_0x74ada
	keeptextopen
	checkitem S_S_TICKET
	iffalse UnknownScript_0x7496d
	writetext UnknownText_0x74b11
	closetext
	loadmovesprites
	setevent EVENT_RECEIVED_BALLS_FROM_KURT
	applymovement $0, MovementData_0x74a37
	jump SailorScript_0x748c0

UnknownScript_0x7496d:
	writetext UnknownText_0x74b41
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x74a34
	end

UnknownScript_0x74977:
	writetext UnknownText_0x74ba8
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x74a34
	end

UnknownScript_0x74981:
	writetext UnknownText_0x74bce
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x74a34
	end

UnknownScript_0x7498b:
	end

UnknownScript_0x7498c:
	writetext UnknownText_0x74af6
	closetext
	loadmovesprites
	end

UnknownScript_0x74992:
	writetext UnknownText_0x74af6
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x74a34
	end

SailorScript_0x7499c:
	faceplayer
	loadfont
	checkevent EVENT_GAVE_KURT_APRICORNS
	iftrue UnknownScript_0x74919
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iffalse UnknownScript_0x749c0
	checkcode VAR_WEEKDAY
	if_equal SUNDAY, UnknownScript_0x749f2
	if_equal SATURDAY, UnknownScript_0x749f2
	if_equal TUESDAY, UnknownScript_0x749f8
	if_equal WEDNESDAY, UnknownScript_0x749f8
	if_equal THURSDAY, UnknownScript_0x749f8
UnknownScript_0x749c0:
	writetext UnknownText_0x74a9c
	yesorno
	iffalse UnknownScript_0x7498c
	writetext UnknownText_0x74ada
	keeptextopen
	checkitem S_S_TICKET
	iffalse UnknownScript_0x749ec
	writetext UnknownText_0x74b11
	closetext
	loadmovesprites
	setevent EVENT_RECEIVED_BALLS_FROM_KURT
	checkcode VAR_FACING
	if_equal $3, UnknownScript_0x749e5
	applymovement $0, MovementData_0x74a3f
	jump SailorScript_0x748c0

UnknownScript_0x749e5:
	applymovement $0, MovementData_0x74a49
	jump SailorScript_0x748c0

UnknownScript_0x749ec:
	writetext UnknownText_0x74b41
	closetext
	loadmovesprites
	end

UnknownScript_0x749f2:
	writetext UnknownText_0x74ba8
	closetext
	loadmovesprites
	end

UnknownScript_0x749f8:
	writetext UnknownText_0x74bce
	closetext
	loadmovesprites
	end

SailorScript_0x749fe:
	jumptextfaceplayer UnknownText_0x74cd7

FishingGuruScript_0x74a01:
	faceplayer
	loadfont
	writetext UnknownText_0x74bf4
	closetext
	loadmovesprites
	spriteface $5, UP
	end

FishingGuruScript_0x74a0c:
	faceplayer
	loadfont
	writetext UnknownText_0x74c35
	closetext
	loadmovesprites
	spriteface $6, UP
	end

YoungsterScript_0x74a17:
	faceplayer
	loadfont
	writetext UnknownText_0x74c76
	closetext
	loadmovesprites
	spriteface $7, DOWN
	end

CooltrainerFScript_0x74a22:
	faceplayer
	loadfont
	writetext UnknownText_0x74ca2
	closetext
	loadmovesprites
	spriteface $8, DOWN
	end

MapOlivinePortSignpostItem0:
	dwb EVENT_OLIVINE_PORT_HIDDEN_PROTEIN, PROTEIN
	

MovementData_0x74a30:
	step_down
	step_end

MovementData_0x74a32:
	step_up
	step_end

MovementData_0x74a34:
	step_right
	turn_head_left
	step_end

MovementData_0x74a37:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

MovementData_0x74a3f:
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

MovementData_0x74a49:
	step_up
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

UnknownText_0x74a55:
	text "We're departing"
	line "soon. Please get"
	cont "on board."
	done

UnknownText_0x74a80:
	text "Sorry. You can't"
	line "board now."
	done

UnknownText_0x74a9c:
	text "Welcome to FAST"
	line "SHIP S.S.AQUA."

	para "Will you be board-"
	line "ing today?"
	done

UnknownText_0x74ada:
	text "May I see your"
	line "S.S.TICKET?"
	done

UnknownText_0x74af6:
	text "We hope to see you"
	line "again!"
	done

UnknownText_0x74b11:
	text "<PLAYER> flashed"
	line "the S.S.TICKET."

	para "That's it."
	line "Thank you!"
	done

UnknownText_0x74b41:
	text "<PLAYER> tried to"
	line "show the S.S."
	cont "TICKET…"

	para "…But no TICKET!"

	para "Sorry!"
	line "You may board only"

	para "if you have an"
	line "S.S.TICKET."
	done

UnknownText_0x74ba8:
	text "The FAST SHIP will"
	line "sail next Monday."
	done

UnknownText_0x74bce:
	text "The FAST SHIP will"
	line "sail next Friday."
	done

UnknownText_0x74bf4:
	text "SHELLDER are easy"
	line "to catch here."

	para "They're kind of"
	line "rare elsewhere."
	done

UnknownText_0x74c35:
	text "How many RODS do"
	line "you have?"

	para "Different RODS"
	line "catch different"
	cont "#MON."
	done

UnknownText_0x74c76:
	text "S.S.AQUA uses jets"
	line "to skim over the"
	cont "waves!"
	done

UnknownText_0x74ca2:
	text "There are lots of"
	line "#MON in KANTO."

	para "I wish I could go…"
	done

UnknownText_0x74cd7:
	text "We don't want you"
	line "to fall into the"

	para "sea, so you're not"
	line "allowed in."
	done

OlivinePort_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $b, 5, GROUP_OLIVINE_PORT_PASSAGE, MAP_OLIVINE_PORT_PASSAGE
	warp_def $17, $7, 1, GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F

.XYTriggers:
	db 1
	xy_trigger 0, $f, $7, $0, UnknownScript_0x7491f, $0, $0

.Signposts:
	db 1
	signpost 22, 1, SIGNPOST_ITEM, MapOlivinePortSignpostItem0

.PersonEvents:
	db 7
	person_event SPRITE_SAILOR, 27, 11, OW_UP | $3, $0, -1, -1, $0, 0, SailorScript_0x748c0, EVENT_OLIVINE_PORT_SAILOR_AT_GANGWAY
	person_event SPRITE_SAILOR, 19, 11, OW_UP | $3, $0, -1, -1, $0, 0, SailorScript_0x749fe, EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	person_event SPRITE_SAILOR, 19, 10, OW_LEFT | $1, $0, -1, -1, $0, 0, SailorScript_0x7499c, EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
	person_event SPRITE_FISHING_GURU, 18, 8, OW_UP | $3, $0, -1, -1, $0, 0, FishingGuruScript_0x74a01, EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	person_event SPRITE_FISHING_GURU, 18, 17, OW_UP | $3, $0, -1, -1, $0, 0, FishingGuruScript_0x74a0c, EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	person_event SPRITE_YOUNGSTER, 19, 8, OW_UP | $2, $0, -1, -1, $0, 0, YoungsterScript_0x74a17, EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
	person_event SPRITE_COOLTRAINER_F, 19, 15, OW_UP | $2, $0, -1, -1, $0, 0, CooltrainerFScript_0x74a22, EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
