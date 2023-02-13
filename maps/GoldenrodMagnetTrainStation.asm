	object_const_def
	const GOLDENRODMAGNETTRAINSTATION_OFFICER
	const GOLDENRODMAGNETTRAINSTATION_GENTLEMAN

GoldenrodMagnetTrainStation_MapScripts:
	def_scene_scripts
	scene_script GoldenrodMagnetTrainStationNoopScene, SCENE_GOLDENRODMAGNETTRAINSTATION_ARRIVE_FROM_SAFFRON

	def_callbacks

GoldenrodMagnetTrainStationNoopScene:
	end

GoldenrodMagnetTrainStationOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .MagnetTrainToSaffron
	writetext GoldenrodMagnetTrainStationOfficerTheTrainHasntComeInText
	waitbutton
	closetext
	end

.MagnetTrainToSaffron:
	writetext GoldenrodMagnetTrainStationOfficerAreYouComingAboardText
	yesorno
	iffalse .DecidedNotToRide
	checkitem PASS
	iffalse .PassNotInBag
	writetext GoldenrodMagnetTrainStationOfficerRightThisWayText
	waitbutton
	closetext
	applymovement GOLDENRODMAGNETTRAINSTATION_OFFICER, GoldenrodMagnetTrainStationOfficerApproachTrainDoorMovement
	applymovement PLAYER, GoldenrodMagnetTrainStationPlayerApproachAndEnterTrainMovement
	setval FALSE
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
	writetext GoldenrodMagnetTrainStationOfficerYouDontHaveARailPassText
	waitbutton
	closetext
	end

.DecidedNotToRide:
	writetext GoldenrodMagnetTrainStationOfficerHopeToSeeYouAgainText
	waitbutton
	closetext
	end

Script_ArriveFromSaffron:
	applymovement GOLDENRODMAGNETTRAINSTATION_OFFICER, GoldenrodMagnetTrainStationOfficerApproachTrainDoorMovement
	applymovement PLAYER, GoldenrodMagnetTrainStationPlayerLeaveTrainAndEnterStationMovement
	applymovement GOLDENRODMAGNETTRAINSTATION_OFFICER, GoldenrodMagnetTrainStationOfficerReturnToBoardingGateMovement
	opentext
	writetext GoldenrodMagnetTrainStationOfficerArrivedInGoldenrodText
	waitbutton
	closetext
	end

GoldenrodMagnetTrainStationGentlemanScript:
	jumptextfaceplayer GoldenrodMagnetTrainStationGentlemanText

GoldenrodMagnetTrainStationOfficerApproachTrainDoorMovement:
	step UP
	step UP
	step RIGHT
	turn_head LEFT
	step_end

GoldenrodMagnetTrainStationOfficerReturnToBoardingGateMovement:
	step LEFT
	step DOWN
	step DOWN
	step_end

GoldenrodMagnetTrainStationPlayerApproachAndEnterTrainMovement:
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

GoldenrodMagnetTrainStationPlayerLeaveTrainAndEnterStationMovement:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	turn_head UP
	step_end

GoldenrodMagnetTrainStationOfficerTheTrainHasntComeInText:
	text "Le train n'est pas"
	line "passé..."

	para "Je sais! Je vais"
	line "transporter les"
	cont "passagers sur mon"
	cont "dos!"

	para "Ca ne marchera"
	line "pas!"
	done

GoldenrodMagnetTrainStationOfficerAreYouComingAboardText:
	text "Nous allons bien-"
	line "tôt partir pour"
	cont "SAFRANIA."

	para "Vous montez"
	line "à bord?"
	done

GoldenrodMagnetTrainStationOfficerRightThisWayText:
	text "Puis-je voir votre"
	line "PASSE train, s'il"
	cont "vous plaît?"

	para "Merci, c'est par"
	line "là..."
	done

GoldenrodMagnetTrainStationOfficerYouDontHaveARailPassText:
	text "Désolé, vous"
	line "n'avez pas de"
	cont "PASSE train."
	cont "Pas de PASSE train"
	cont "pas de copains!!"
	done

GoldenrodMagnetTrainStationOfficerHopeToSeeYouAgainText:
	text "En espérant vous"
	line "revoir bientôt!"
	done

GoldenrodMagnetTrainStationOfficerArrivedInGoldenrodText:
	text "On est arrivé"
	line "à DOUBLONVILLE."

	para "Nous espérons vous"
	line "revoir bientôt."
	done

GoldenrodMagnetTrainStationGentlemanText:
	text "Je suis le"
	line "PRESIDENT."

	para "Mon rêve était de"
	line "construire un"

	para "train plus rapide"
	line "que n'importe quel"
	cont "#MON."

	para "Cela rapproche"
	line "JOHTO de KANTO."
	done

GoldenrodMagnetTrainStation_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 17, GOLDENROD_CITY, 5
	warp_event  9, 17, GOLDENROD_CITY, 5
	warp_event  6,  5, SAFFRON_MAGNET_TRAIN_STATION, 4
	warp_event 11,  5, SAFFRON_MAGNET_TRAIN_STATION, 3

	def_coord_events
	coord_event 11,  6, SCENE_GOLDENRODMAGNETTRAINSTATION_ARRIVE_FROM_SAFFRON, Script_ArriveFromSaffron

	def_bg_events

	def_object_events
	object_event  9,  9, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodMagnetTrainStationOfficerScript, -1
	object_event 11, 14, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodMagnetTrainStationGentlemanScript, EVENT_GOLDENROD_TRAIN_STATION_GENTLEMAN
