const_value set 2
	const GOLDENRODMAGNETTRAINSTATION_OFFICER
	const GOLDENRODMAGNETTRAINSTATION_GENTLEMAN

GoldenrodMagnetTrainStation_MapScriptHeader:
.SceneScripts:
	db 1
	scene_script .DummyScene

.MapCallbacks:
	db 0

.DummyScene:
	end

OfficerScript_0x550ec:
	faceplayer
	opentext
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .MagnetTrainToSaffron
	writetext UnknownText_0x55160
	waitbutton
	closetext
	end

.MagnetTrainToSaffron:
	writetext UnknownText_0x551b7
	yesorno
	iffalse .DecidedNotToRide
	checkitem PASS
	iffalse .PassNotInBag
	writetext UnknownText_0x551ed
	waitbutton
	closetext
	applymovement GOLDENRODMAGNETTRAINSTATION_OFFICER, MovementData_0x55146
	applymovement PLAYER, MovementData_0x5514f
	writebyte FALSE
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
	writetext UnknownText_0x5522c
	waitbutton
	closetext
	end

.DecidedNotToRide:
	writetext UnknownText_0x5524f
	waitbutton
	closetext
	end

Script_ArriveFromSaffron:
	applymovement GOLDENRODMAGNETTRAINSTATION_OFFICER, MovementData_0x55146
	applymovement PLAYER, MovementData_0x55158
	applymovement GOLDENRODMAGNETTRAINSTATION_OFFICER, MovementData_0x5514b
	opentext
	writetext UnknownText_0x5526a
	waitbutton
	closetext
	end

GoldenrodMagnetTrainStationGentlemanScript:
	jumptextfaceplayer GoldenrodMagnetTrainStationGentlemanText

MovementData_0x55146:
	step UP
	step UP
	step RIGHT
	turn_head LEFT
	step_end

MovementData_0x5514b:
	step LEFT
	step DOWN
	step DOWN
	step_end

MovementData_0x5514f:
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

MovementData_0x55158:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	turn_head UP
	step_end

UnknownText_0x55160:
	text "The train hasn't"
	line "come in…"

	para "I know! I'll carry"
	line "the passengers on"
	cont "my back!"

	para "That won't work."
	done

UnknownText_0x551b7:
	text "We'll soon depart"
	line "for SAFFRON."

	para "Are you coming"
	line "aboard?"
	done

UnknownText_0x551ed:
	text "May I see your"
	line "rail PASS, please?"

	para "OK. Right this"
	line "way, please."
	done

UnknownText_0x5522c:
	text "Sorry. You don't"
	line "have a rail PASS."
	done

UnknownText_0x5524f:
	text "We hope to see you"
	line "again!"
	done

UnknownText_0x5526a:
	text "We have arrived in"
	line "GOLDENROD."

	para "We hope to see you"
	line "again."
	done

GoldenrodMagnetTrainStationGentlemanText:
	text "I'm the PRESIDENT."

	para "My dream was to"
	line "build a train that"

	para "is faster than any"
	line "#MON."

	para "It really brings"
	line "JOHTO much closer"
	cont "to KANTO."
	done

GoldenrodMagnetTrainStation_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def 8, 17, 5, GOLDENROD_CITY
	warp_def 9, 17, 5, GOLDENROD_CITY
	warp_def 6, 5, 4, SAFFRON_MAGNET_TRAIN_STATION
	warp_def 11, 5, 3, SAFFRON_MAGNET_TRAIN_STATION

.CoordEvents:
	db 1
	coord_event 11, 6, 0, Script_ArriveFromSaffron

.BGEvents:
	db 0

.ObjectEvents:
	db 2
	object_event 9, 9, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OfficerScript_0x550ec, -1
	object_event 11, 14, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodMagnetTrainStationGentlemanScript, EVENT_GOLDENROD_TRAIN_STATION_GENTLEMAN
