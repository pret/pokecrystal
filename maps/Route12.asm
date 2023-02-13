	object_const_def
	const ROUTE12_FISHER1
	const ROUTE12_FISHER2
	const ROUTE12_FISHER3
	const ROUTE12_FISHER4
	const ROUTE12_POKE_BALL1
	const ROUTE12_POKE_BALL2

Route12_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerFisherKyle:
	trainer FISHER, KYLE, EVENT_BEAT_FISHER_KYLE, FisherKyleSeenText, FisherKyleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherKyleAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherMartin:
	trainer FISHER, MARTIN, EVENT_BEAT_FISHER_MARTIN, FisherMartinSeenText, FisherMartinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMartinAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherStephen:
	trainer FISHER, STEPHEN, EVENT_BEAT_FISHER_STEPHEN, FisherStephenSeenText, FisherStephenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherStephenAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherBarney:
	trainer FISHER, BARNEY, EVENT_BEAT_FISHER_BARNEY, FisherBarneySeenText, FisherBarneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherBarneyAfterBattleText
	waitbutton
	closetext
	end

Route12Sign:
	jumptext Route12SignText

FishingSpotSign:
	jumptext FishingSpotSignText

Route12Calcium:
	itemball CALCIUM

Route12Nugget:
	itemball NUGGET

Route12HiddenElixer:
	hiddenitem ELIXER, EVENT_ROUTE_12_HIDDEN_ELIXER

FisherMartinSeenText:
	text "La patience est"
	line "la meilleure arme"
	cont "pour pêcher..."
	done

FisherMartinBeatenText:
	text "Gwaaah!"
	done

FisherMartinAfterBattleText:
	text "Bon... La pêche"
	line "c'est lourd..."
	done

FisherStephenSeenText:
	text "Ca c'est le pied!"
	line "Pêcher en écoutant"
	cont "la radio, c'est"
	cont "super pépère."
	done

FisherStephenBeatenText:
	text "Ma radio m'a fait"
	line "perdre!"
	done

FisherStephenAfterBattleText:
	text "Tu connais les"
	line "radios de KANTO?"

	para "Elles sont pas"
	line "mal, tu sais..."
	done

FisherBarneySeenText:
	text "Quelle est la"
	line "chose la plus im-"
	cont "portante dans nos"
	cont "vies quotidiennes?"
	done

FisherBarneyBeatenText:
	text "La réponse va"
	line "suivre!"
	done

FisherBarneyAfterBattleText:
	text "Je crois que"
	line "l'électricité est"

	para "la chose la plus"
	line "importante."

	para "Et c'est pour ça"
	line "qu'on a fait tant"

	para "d'histoires à pro-"
	line "pos de la panne de"
	cont "la CENTRALE."
	done

FisherKyleSeenText:
	text "Tu t'en souviens?"
	done

FisherKyleBeatenText:
	text "Tu t'en souviens?"
	done

FisherKyleAfterBattleText:
	text "La p'tite secousse"
	line "que l'on sent"

	para "quand on ferre un"
	line "#MON..."

	para "C'est la plus"
	line "belle des sensa-"
	cont "tions!!!"
	done

Route12SignText:
	text "ROUTE 12"
	line "NORD: LAVANVILLE"
	done

FishingSpotSignText:
	text "COIN PECHE"
	done

Route12_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 33, ROUTE_12_SUPER_ROD_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 11, 27, BGEVENT_READ, Route12Sign
	bg_event 13,  9, BGEVENT_READ, FishingSpotSign
	bg_event 14, 13, BGEVENT_ITEM, Route12HiddenElixer

	def_object_events
	object_event  5, 13, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherMartin, -1
	object_event 14, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherStephen, -1
	object_event 10, 38, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerFisherBarney, -1
	object_event  6,  7, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherKyle, -1
	object_event  5, 43, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route12Calcium, EVENT_ROUTE_12_CALCIUM
	object_event  5, 51, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route12Nugget, EVENT_ROUTE_12_NUGGET
