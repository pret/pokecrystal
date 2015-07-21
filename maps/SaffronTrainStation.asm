SaffronTrainStation_MapScriptHeader:
.MapTriggers:
	db 1

	; triggers
	dw UnknownScript_0x18a81d, $0000

.MapCallbacks:
	db 0

UnknownScript_0x18a81d:
	end

OfficerScript_0x18a81e:
	faceplayer
	loadfont
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue UnknownScript_0x18a82c
	writetext UnknownText_0x18a8a9
	closetext
	loadmovesprites
	end

UnknownScript_0x18a82c:
	writetext UnknownText_0x18a8dd
	yesorno
	iffalse UnknownScript_0x18a85c
	checkitem PASS
	iffalse UnknownScript_0x18a856
	writetext UnknownText_0x18a917
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x18a88f
	applymovement $0, MovementData_0x18a898
	writebyte $1
	special Special_MagnetTrain
	warpcheck
	newloadmap $f9
	applymovement $0, MovementData_0x18a854
	wait $14
	end

MovementData_0x18a854:
	turn_head_down
	step_end

UnknownScript_0x18a856:
	writetext UnknownText_0x18a956
	closetext
	loadmovesprites
	end

UnknownScript_0x18a85c:
	writetext UnknownText_0x18a978
	closetext
	loadmovesprites
	end

UnknownScript_0x18a862:
	applymovement $2, MovementData_0x18a88f
	applymovement $0, MovementData_0x18a8a1
	applymovement $2, MovementData_0x18a894
	loadfont
	writetext UnknownText_0x18a993
	closetext
	loadmovesprites
	end

GymGuyScript_0x18a875:
	faceplayer
	loadfont
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x18a883
	writetext UnknownText_0x18a9ca
	closetext
	loadmovesprites
	end

UnknownScript_0x18a883:
	writetext UnknownText_0x18aa61
	closetext
	loadmovesprites
	end

TeacherScript_0x18a889:
	jumptextfaceplayer UnknownText_0x18aaab

LassScript_0x18a88c:
	jumptextfaceplayer UnknownText_0x18ab20

MovementData_0x18a88f:
	step_up
	step_up
	step_right
	turn_head_left
	step_end

MovementData_0x18a894:
	step_left
	step_down
	step_down
	step_end

MovementData_0x18a898:
	step_up
	step_up
	step_up
	step_left
	step_left
	step_left
	step_up
	step_up
	step_end

MovementData_0x18a8a1:
	step_left
	step_left
	step_down
	step_down
	step_down
	step_down
	turn_head_up
	step_end

UnknownText_0x18a8a9:
	text "I'm sorry, but the"
	line "MAGNET TRAIN isn't"
	cont "operating now."
	done

UnknownText_0x18a8dd:
	text "We'll soon depart"
	line "for GOLDENROD."

	para "Are you coming on"
	line "board?"
	done

UnknownText_0x18a917:
	text "May I see your"
	line "rail PASS, please?"

	para "OK. Right this"
	line "way, please."
	done

UnknownText_0x18a956:
	text "Sorry, but you"
	line "don't have a PASS."
	done

UnknownText_0x18a978:
	text "We hope to see you"
	line "again."
	done

UnknownText_0x18a993:
	text "We have arrived in"
	line "SAFFRON."

	para "We hope to see you"
	line "again."
	done

UnknownText_0x18a9ca:
	text "The MAGNET TRAIN"
	line "is a super-modern"

	para "rail liner that"
	line "uses electricity"

	para "and magnets to"
	line "attain incredible"
	cont "speed."

	para "However, if there"
	line "isn't any elec-"
	cont "tricity…"
	done

UnknownText_0x18aa61:
	text "Whew…"

	para "How many times"
	line "have I gone back"

	para "and forth between"
	line "KANTO and JOHTO?"
	done

UnknownText_0x18aaab:
	text "Before the MAGNET"
	line "TRAIN STATION was"

	para "built, there was a"
	line "house there."

	para "A little girl"
	line "named COPYCAT used"
	cont "to live there."
	done

UnknownText_0x18ab20:
	text "Hi. Do you have a"
	line "rail PASS? I have"

	para "one. All the peo-"
	line "ple in SAFFRON who"

	para "ride the MAGNET"
	line "TRAIN have PASSES."
	done

SaffronTrainStation_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $11, $8, 6, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $11, $9, 6, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $5, $6, 4, GROUP_GOLDENROD_MAGNET_TRAIN_STATION, MAP_GOLDENROD_MAGNET_TRAIN_STATION
	warp_def $5, $b, 3, GROUP_GOLDENROD_MAGNET_TRAIN_STATION, MAP_GOLDENROD_MAGNET_TRAIN_STATION

.XYTriggers:
	db 1
	xy_trigger 0, $6, $b, $0, UnknownScript_0x18a862, $0, $0

.Signposts:
	db 0

.PersonEvents:
	db 4
	person_event SPRITE_OFFICER, 13, 13, OW_UP | $2, $0, -1, -1, $0, 0, OfficerScript_0x18a81e, -1
	person_event SPRITE_GYM_GUY, 18, 14, OW_DOWN | $2, $11, -1, -1, $0, 0, GymGuyScript_0x18a875, -1
	person_event SPRITE_TEACHER, 15, 10, OW_LEFT | $1, $0, -1, -1, $0, 0, TeacherScript_0x18a889, EVENT_SAFFRON_TRAIN_STATION_POPULATION
	person_event SPRITE_LASS, 14, 10, OW_UP | $3, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, LassScript_0x18a88c, EVENT_SAFFRON_TRAIN_STATION_POPULATION
