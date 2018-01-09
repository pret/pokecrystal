const_value set 2
	const SAFFRONTRAINSTATION_OFFICER
	const SAFFRONTRAINSTATION_GYM_GUY
	const SAFFRONTRAINSTATION_TEACHER
	const SAFFRONTRAINSTATION_LASS

SaffronTrainStation_MapScriptHeader:
.SceneScripts:
	db 1
	scene_script .DummyScene

.MapCallbacks:
	db 0

.DummyScene:
	end

OfficerScript_0x18a81e:
	faceplayer
	opentext
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .MagnetTrainToGoldenrod
	writetext UnknownText_0x18a8a9
	waitbutton
	closetext
	end

.MagnetTrainToGoldenrod:
	writetext UnknownText_0x18a8dd
	yesorno
	iffalse .DecidedNotToRide
	checkitem PASS
	iffalse .PassNotInBag
	writetext UnknownText_0x18a917
	waitbutton
	closetext
	applymovement SAFFRONTRAINSTATION_OFFICER, MovementData_0x18a88f
	applymovement PLAYER, MovementData_0x18a898
	writebyte $1
	special Special_MagnetTrain
	warpcheck
	newloadmap MAPSETUP_TRAIN
	applymovement PLAYER, .MovementBoardTheTrain
	wait 20
	end

.MovementBoardTheTrain:
	turn_head DOWN
	step_end

.PassNotInBag:
	writetext UnknownText_0x18a956
	waitbutton
	closetext
	end

.DecidedNotToRide:
	writetext UnknownText_0x18a978
	waitbutton
	closetext
	end

Script_ArriveFromGoldenrod:
	applymovement SAFFRONTRAINSTATION_OFFICER, MovementData_0x18a88f
	applymovement PLAYER, MovementData_0x18a8a1
	applymovement SAFFRONTRAINSTATION_OFFICER, MovementData_0x18a894
	opentext
	writetext UnknownText_0x18a993
	waitbutton
	closetext
	end

GymGuyScript_0x18a875:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x18a883
	writetext UnknownText_0x18a9ca
	waitbutton
	closetext
	end

UnknownScript_0x18a883:
	writetext UnknownText_0x18aa61
	waitbutton
	closetext
	end

SaffronTrainStationTeacherScript:
	jumptextfaceplayer SaffronTrainStationTeacherText

SaffronTrainStationLassScript:
	jumptextfaceplayer SaffronTrainStationLassText

MovementData_0x18a88f:
	step UP
	step UP
	step RIGHT
	turn_head LEFT
	step_end

MovementData_0x18a894:
	step LEFT
	step DOWN
	step DOWN
	step_end

MovementData_0x18a898:
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

MovementData_0x18a8a1:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	turn_head UP
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

SaffronTrainStationTeacherText:
	text "Before the MAGNET"
	line "TRAIN STATION was"

	para "built, there was a"
	line "house there."

	para "A little girl"
	line "named COPYCAT used"
	cont "to live there."
	done

SaffronTrainStationLassText:
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
	warp_def 8, 17, 6, SAFFRON_CITY
	warp_def 9, 17, 6, SAFFRON_CITY
	warp_def 6, 5, 4, GOLDENROD_MAGNET_TRAIN_STATION
	warp_def 11, 5, 3, GOLDENROD_MAGNET_TRAIN_STATION

.CoordEvents:
	db 1
	coord_event 11, 6, 0, Script_ArriveFromGoldenrod

.BGEvents:
	db 0

.ObjectEvents:
	db 4
	object_event 9, 9, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OfficerScript_0x18a81e, -1
	object_event 10, 14, SPRITE_GYM_GUY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GymGuyScript_0x18a875, -1
	object_event 6, 11, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronTrainStationTeacherScript, EVENT_SAFFRON_TRAIN_STATION_POPULATION
	object_event 6, 10, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronTrainStationLassScript, EVENT_SAFFRON_TRAIN_STATION_POPULATION
