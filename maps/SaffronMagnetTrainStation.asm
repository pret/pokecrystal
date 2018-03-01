	const_def 2 ; object constants
	const SAFFRONMAGNETTRAINSTATION_OFFICER
	const SAFFRONMAGNETTRAINSTATION_GYM_GUY
	const SAFFRONMAGNETTRAINSTATION_TEACHER
	const SAFFRONMAGNETTRAINSTATION_LASS

SaffronMagnetTrainStation_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 0 ; callbacks

.DummyScene:
	end

SaffronMagnetTrainStationOfficerScript:
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
	applymovement SAFFRONMAGNETTRAINSTATION_OFFICER, MovementData_0x18a88f
	applymovement PLAYER, MovementData_0x18a898
	writebyte TRUE
	special MagnetTrain
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
	applymovement SAFFRONMAGNETTRAINSTATION_OFFICER, MovementData_0x18a88f
	applymovement PLAYER, MovementData_0x18a8a1
	applymovement SAFFRONMAGNETTRAINSTATION_OFFICER, MovementData_0x18a894
	opentext
	writetext UnknownText_0x18a993
	waitbutton
	closetext
	end

SaffronMagnetTrainStationGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext SaffronMagnetTrainStationGymGuyText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext SaffronMagnetTrainStationGymGuyText_ReturnedMachinePart
	waitbutton
	closetext
	end

SaffronMagnetTrainStationTeacherScript:
	jumptextfaceplayer SaffronMagnetTrainStationTeacherText

SaffronMagnetTrainStationLassScript:
	jumptextfaceplayer SaffronMagnetTrainStationLassText

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

SaffronMagnetTrainStationGymGuyText:
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

SaffronMagnetTrainStationGymGuyText_ReturnedMachinePart:
	text "Whew…"

	para "How many times"
	line "have I gone back"

	para "and forth between"
	line "KANTO and JOHTO?"
	done

SaffronMagnetTrainStationTeacherText:
	text "Before the MAGNET"
	line "TRAIN STATION was"

	para "built, there was a"
	line "house there."

	para "A little girl"
	line "named COPYCAT used"
	cont "to live there."
	done

SaffronMagnetTrainStationLassText:
	text "Hi. Do you have a"
	line "rail PASS? I have"

	para "one. All the peo-"
	line "ple in SAFFRON who"

	para "ride the MAGNET"
	line "TRAIN have PASSES."
	done

SaffronMagnetTrainStation_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  8, 17, SAFFRON_CITY, 6
	warp_event  9, 17, SAFFRON_CITY, 6
	warp_event  6,  5, GOLDENROD_MAGNET_TRAIN_STATION, 4
	warp_event 11,  5, GOLDENROD_MAGNET_TRAIN_STATION, 3

	db 1 ; coord events
	coord_event 11,  6, SCENE_DEFAULT, Script_ArriveFromGoldenrod

	db 0 ; bg events

	db 4 ; object events
	object_event  9,  9, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationOfficerScript, -1
	object_event 10, 14, SPRITE_GYM_GUY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationGymGuyScript, -1
	object_event  6, 11, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationTeacherScript, EVENT_SAFFRON_TRAIN_STATION_POPULATION
	object_event  6, 10, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationLassScript, EVENT_SAFFRON_TRAIN_STATION_POPULATION
