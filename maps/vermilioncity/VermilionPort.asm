const_value set 2
	const VERMILIONPORT_SAILOR1
	const VERMILIONPORT_SAILOR2
	const VERMILIONPORT_SUPER_NERD

VermilionPort_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1

.MapCallbacks:
	db 1

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.Trigger0:
	end

.Trigger1:
	priorityjump UnknownScript_0x74da6
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_VERMILION
	return

UnknownScript_0x74da6:
	applymovement PLAYER, MovementData_0x74ef3
	appear VERMILIONPORT_SAILOR1
	dotrigger $0
	setevent EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_1
	setevent EVENT_FAST_SHIP_CABINS_SE_SSE_GENTLEMAN
	setevent EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	clearevent EVENT_OLIVINE_PORT_PASSAGE_POKEFAN_M
	setevent EVENT_FAST_SHIP_FIRST_TIME
	setevent EVENT_GAVE_KURT_APRICORNS
	blackoutmod VERMILION_CITY
	end

SailorScript_0x74dc4:
	faceplayer
	opentext
	checkevent EVENT_GAVE_KURT_APRICORNS
	iftrue UnknownScript_0x74e1a
	writetext UnknownText_0x74f06
	waitbutton
	closetext
	spriteface VERMILIONPORT_SAILOR1, DOWN
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear VERMILIONPORT_SAILOR1
	waitsfx
	applymovement PLAYER, MovementData_0x74ef1
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	setevent EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	clearevent EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	clearevent EVENT_BEAT_POKEMANIAC_ETHAN
	clearevent EVENT_BEAT_BURGLAR_COREY
	clearevent EVENT_BEAT_BUG_CATCHER_KEN
	clearevent EVENT_BEAT_GUITARIST_CLYDE
	clearevent EVENT_BEAT_POKEFANM_JEREMY
	clearevent EVENT_BEAT_POKEFANF_GEORGIA
	clearevent EVENT_BEAT_SAILOR_KENNETH
	clearevent EVENT_BEAT_TEACHER_SHIRLEY
	clearevent EVENT_BEAT_SCHOOLBOY_NATE
	clearevent EVENT_BEAT_SCHOOLBOY_RICKY
	setevent EVENT_FAST_SHIP_DESTINATION_OLIVINE
	appear VERMILIONPORT_SAILOR1
	domaptrigger FAST_SHIP_1F, $1
	warp FAST_SHIP_1F, $19, $1
	end

UnknownScript_0x74e1a:
	writetext UnknownText_0x74f31
	waitbutton
	closetext
	end

UnknownScript_0x74e20:
	spriteface VERMILIONPORT_SAILOR2, RIGHT
	checkevent EVENT_GAVE_KURT_APRICORNS
	iftrue UnknownScript_0x74e86
	checkevent EVENT_RECEIVED_BALLS_FROM_KURT
	iftrue UnknownScript_0x74e86
	spriteface PLAYER, LEFT
	opentext
	checkcode VAR_WEEKDAY
	if_equal MONDAY, UnknownScript_0x74e72
	if_equal TUESDAY, UnknownScript_0x74e72
	if_equal THURSDAY, UnknownScript_0x74e7c
	if_equal FRIDAY, UnknownScript_0x74e7c
	if_equal SATURDAY, UnknownScript_0x74e7c
	writetext UnknownText_0x74f4d
	yesorno
	iffalse UnknownScript_0x74e8d
	writetext UnknownText_0x74f8b
	buttonsound
	checkitem S_S_TICKET
	iffalse UnknownScript_0x74e68
	writetext UnknownText_0x74fc2
	waitbutton
	closetext
	setevent EVENT_RECEIVED_BALLS_FROM_KURT
	applymovement PLAYER, MovementData_0x74ef8
	jump SailorScript_0x74dc4

UnknownScript_0x74e68:
	writetext UnknownText_0x74ff2
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74ef5
	end

UnknownScript_0x74e72:
	writetext UnknownText_0x75059
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74ef5
	end

UnknownScript_0x74e7c:
	writetext UnknownText_0x75080
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74ef5
	end

UnknownScript_0x74e86:
	end

UnknownScript_0x74e87:
	writetext UnknownText_0x74fa7
	waitbutton
	closetext
	end

UnknownScript_0x74e8d:
	writetext UnknownText_0x74fa7
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74ef5
	end

SailorScript_0x74e97:
	faceplayer
	opentext
	checkevent EVENT_GAVE_KURT_APRICORNS
	iftrue UnknownScript_0x74e1a
	checkcode VAR_WEEKDAY
	if_equal MONDAY, UnknownScript_0x74eda
	if_equal TUESDAY, UnknownScript_0x74eda
	if_equal THURSDAY, UnknownScript_0x74ee0
	if_equal FRIDAY, UnknownScript_0x74ee0
	if_equal SATURDAY, UnknownScript_0x74ee0
	writetext UnknownText_0x74f4d
	yesorno
	iffalse UnknownScript_0x74e87
	writetext UnknownText_0x74f8b
	buttonsound
	checkitem S_S_TICKET
	iffalse UnknownScript_0x74ed4
	writetext UnknownText_0x74fc2
	waitbutton
	closetext
	setevent EVENT_RECEIVED_BALLS_FROM_KURT
	applymovement PLAYER, MovementData_0x74efe
	jump SailorScript_0x74dc4

UnknownScript_0x74ed4:
	writetext UnknownText_0x74ff2
	waitbutton
	closetext
	end

UnknownScript_0x74eda:
	writetext UnknownText_0x75059
	waitbutton
	closetext
	end

UnknownScript_0x74ee0:
	writetext UnknownText_0x75080
	waitbutton
	closetext
	end

SuperNerdScript_0x74ee6:
	faceplayer
	opentext
	writetext UnknownText_0x750a6
	waitbutton
	closetext
	end

VermilionPortHiddenIron:
	dwb EVENT_VERMILION_PORT_HIDDEN_IRON, IRON


MovementData_0x74ef1:
	step DOWN
	step_end

MovementData_0x74ef3:
	step UP
	step_end

MovementData_0x74ef5:
	step RIGHT
	turn_head LEFT
	step_end

MovementData_0x74ef8:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x74efe:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

UnknownText_0x74f06:
	text "We're departing"
	line "soon. Please get"
	cont "on board."
	done

UnknownText_0x74f31:
	text "Sorry. You can't"
	line "board now."
	done

UnknownText_0x74f4d:
	text "Welcome to FAST"
	line "SHIP S.S.AQUA."

	para "Will you be board-"
	line "ing today?"
	done

UnknownText_0x74f8b:
	text "May I see your"
	line "S.S.TICKET?"
	done

UnknownText_0x74fa7:
	text "We hope to see you"
	line "again!"
	done

UnknownText_0x74fc2:
	text "<PLAYER> flashed"
	line "the S.S.TICKET."

	para "That's it."
	line "Thank you!"
	done

UnknownText_0x74ff2:
	text "<PLAYER> tried to"
	line "show the S.S."
	cont "TICKET…"

	para "…But no TICKET!"

	para "Sorry!"
	line "You may board only"

	para "if you have an"
	line "S.S.TICKET."
	done

UnknownText_0x75059:
	text "The FAST SHIP will"
	line "sail on Wednesday."
	done

UnknownText_0x75080:
	text "The FAST SHIP will"
	line "sail next Sunday."
	done

UnknownText_0x750a6:
	text "You came from"
	line "JOHTO?"

	para "I hear many rare"
	line "#MON live over"
	cont "there."
	done

VermilionPort_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $5, $9, 5, VERMILION_PORT_PASSAGE
	warp_def $11, $7, 1, FAST_SHIP_1F

.XYTriggers:
	db 1
	xy_trigger 0, $b, $7, $0, UnknownScript_0x74e20, $0, $0

.Signposts:
	db 1
	signpost 13, 16, SIGNPOST_ITEM, VermilionPortHiddenIron

.PersonEvents:
	db 3
	person_event SPRITE_SAILOR, 17, 7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SailorScript_0x74dc4, EVENT_VERMILION_PORT_SAILOR_AT_GANGWAY
	person_event SPRITE_SAILOR, 11, 6, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SailorScript_0x74e97, -1
	person_event SPRITE_SUPER_NERD, 11, 11, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SuperNerdScript_0x74ee6, -1
