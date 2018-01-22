const_value set 2
	const OLIVINEPORT_SAILOR1
	const OLIVINEPORT_SAILOR2
	const OLIVINEPORT_SAILOR3
	const OLIVINEPORT_FISHING_GURU1
	const OLIVINEPORT_FISHING_GURU2
	const OLIVINEPORT_YOUNGSTER
	const OLIVINEPORT_COOLTRAINER_F

OlivinePort_MapScripts:
.SceneScripts:
	db 2
	scene_script .DummyScene0
	scene_script .LeaveFastShip

.MapCallbacks:
	db 0

.DummyScene0:
	end

.LeaveFastShip:
	priorityjump .LeaveFastShipScript
	end

.LeaveFastShipScript:
	applymovement PLAYER, MovementData_0x74a32
	appear OLIVINEPORT_SAILOR1
	setscene 0
	setevent EVENT_GAVE_KURT_APRICORNS
	blackoutmod OLIVINE_CITY
	end

SailorScript_0x748c0:
	faceplayer
	opentext
	checkevent EVENT_GAVE_KURT_APRICORNS
	iftrue UnknownScript_0x74919
	writetext UnknownText_0x74a55
	waitbutton
	closetext
	spriteface OLIVINEPORT_SAILOR1, DOWN
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear OLIVINEPORT_SAILOR1
	waitsfx
	applymovement PLAYER, MovementData_0x74a30
	playsound SFX_EXIT_BUILDING
	special Special_FadeOutPalettes
	waitsfx
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
	appear OLIVINEPORT_SAILOR1
	setmapscene FAST_SHIP_1F, 1
	warp FAST_SHIP_1F, 25, 1
	end

UnknownScript_0x74919:
	writetext UnknownText_0x74a80
	waitbutton
	closetext
	end

UnknownScript_0x7491f:
	spriteface OLIVINEPORT_SAILOR3, RIGHT
	checkevent EVENT_GAVE_KURT_APRICORNS
	iftrue UnknownScript_0x7498b
	checkevent EVENT_RECEIVED_BALLS_FROM_KURT
	iftrue UnknownScript_0x7498b
	spriteface PLAYER, LEFT
	opentext
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
	buttonsound
	checkitem S_S_TICKET
	iffalse UnknownScript_0x7496d
	writetext UnknownText_0x74b11
	waitbutton
	closetext
	setevent EVENT_RECEIVED_BALLS_FROM_KURT
	applymovement PLAYER, MovementData_0x74a37
	jump SailorScript_0x748c0

UnknownScript_0x7496d:
	writetext UnknownText_0x74b41
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end

UnknownScript_0x74977:
	writetext UnknownText_0x74ba8
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end

UnknownScript_0x74981:
	writetext UnknownText_0x74bce
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end

UnknownScript_0x7498b:
	end

UnknownScript_0x7498c:
	writetext UnknownText_0x74af6
	waitbutton
	closetext
	end

UnknownScript_0x74992:
	writetext UnknownText_0x74af6
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end

SailorScript_0x7499c:
	faceplayer
	opentext
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
	buttonsound
	checkitem S_S_TICKET
	iffalse UnknownScript_0x749ec
	writetext UnknownText_0x74b11
	waitbutton
	closetext
	setevent EVENT_RECEIVED_BALLS_FROM_KURT
	checkcode VAR_FACING
	if_equal RIGHT, UnknownScript_0x749e5
	applymovement PLAYER, MovementData_0x74a3f
	jump SailorScript_0x748c0

UnknownScript_0x749e5:
	applymovement PLAYER, MovementData_0x74a49
	jump SailorScript_0x748c0

UnknownScript_0x749ec:
	writetext UnknownText_0x74b41
	waitbutton
	closetext
	end

UnknownScript_0x749f2:
	writetext UnknownText_0x74ba8
	waitbutton
	closetext
	end

UnknownScript_0x749f8:
	writetext UnknownText_0x74bce
	waitbutton
	closetext
	end

OlivinePortSailorScript:
	jumptextfaceplayer OlivinePortSailorText

FishingGuruScript_0x74a01:
	faceplayer
	opentext
	writetext UnknownText_0x74bf4
	waitbutton
	closetext
	spriteface OLIVINEPORT_FISHING_GURU1, UP
	end

FishingGuruScript_0x74a0c:
	faceplayer
	opentext
	writetext UnknownText_0x74c35
	waitbutton
	closetext
	spriteface OLIVINEPORT_FISHING_GURU2, UP
	end

YoungsterScript_0x74a17:
	faceplayer
	opentext
	writetext UnknownText_0x74c76
	waitbutton
	closetext
	spriteface OLIVINEPORT_YOUNGSTER, DOWN
	end

CooltrainerFScript_0x74a22:
	faceplayer
	opentext
	writetext UnknownText_0x74ca2
	waitbutton
	closetext
	spriteface OLIVINEPORT_COOLTRAINER_F, DOWN
	end

OlivinePortHiddenProtein:
	hiddenitem EVENT_OLIVINE_PORT_HIDDEN_PROTEIN, PROTEIN

MovementData_0x74a30:
	step DOWN
	step_end

MovementData_0x74a32:
	step UP
	step_end

MovementData_0x74a34:
	step RIGHT
	turn_head LEFT
	step_end

MovementData_0x74a37:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x74a3f:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x74a49:
	step UP
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
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

OlivinePortSailorText:
	text "We don't want you"
	line "to fall into the"

	para "sea, so you're not"
	line "allowed in."
	done

OlivinePort_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 11, 7, 5, OLIVINE_PORT_PASSAGE
	warp_def 7, 23, 1, FAST_SHIP_1F

.CoordEvents:
	db 1
	coord_event 7, 15, 0, UnknownScript_0x7491f

.BGEvents:
	db 1
	bg_event 1, 22, BGEVENT_ITEM, OlivinePortHiddenProtein

.ObjectEvents:
	db 7
	object_event 7, 23, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SailorScript_0x748c0, EVENT_OLIVINE_PORT_SAILOR_AT_GANGWAY
	object_event 7, 15, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePortSailorScript, EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event 6, 15, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SailorScript_0x7499c, EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
	object_event 4, 14, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FishingGuruScript_0x74a01, EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event 13, 14, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FishingGuruScript_0x74a0c, EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event 4, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, YoungsterScript_0x74a17, EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
	object_event 11, 15, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CooltrainerFScript_0x74a22, EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
