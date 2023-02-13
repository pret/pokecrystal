	object_const_def
	const ROUTE8_BIKER1
	const ROUTE8_BIKER2
	const ROUTE8_BIKER3
	const ROUTE8_SUPER_NERD1
	const ROUTE8_SUPER_NERD2
	const ROUTE8_FRUIT_TREE

Route8_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBikerDwayne:
	trainer BIKER, DWAYNE, EVENT_BEAT_BIKER_DWAYNE, BikerDwayneSeenText, BikerDwayneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerDwayneAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerHarris:
	trainer BIKER, HARRIS, EVENT_BEAT_BIKER_HARRIS, BikerHarrisSeenText, BikerHarrisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerHarrisAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerZeke:
	trainer BIKER, ZEKE, EVENT_BEAT_BIKER_ZEKE, BikerZekeSeenText, BikerZekeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerZekeAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdSam:
	trainer SUPER_NERD, SAM, EVENT_BEAT_SUPER_NERD_SAM, SupernerdSamSeenText, SupernerdSamBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdSamAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdTom:
	trainer SUPER_NERD, TOM, EVENT_BEAT_SUPER_NERD_TOM, SupernerdTomSeenText, SupernerdTomBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdTomAfterBattleText
	waitbutton
	closetext
	end

Route8LockedDoor:
	jumptext Route8LockedDoorText

Route8UndergroundPathSign:
	jumptext Route8UndergroundPathSignText

Route8FruitTree:
	fruittree FRUITTREE_ROUTE_8

BikerDwayneSeenText:
	text "Nous sommes la"
	line "FEDERATION des"
	cont "dresseurs de #-"
	cont "MON de KANTO."

	para "On va te faire"
	line "ta fête!"
	done

BikerDwayneBeatenText:
	text "P-Pardon!"
	done

BikerDwayneAfterBattleText:
	text "La FEDERATION des"
	line "dresseurs de KANTO"
	cont "est invincible!"
	done

BikerHarrisSeenText:
	text "La police a fermé"
	line "notre SOUTERRAIN!"

	para "C'est injuste!"
	line "C'est dégueulasse!"
	done

BikerHarrisBeatenText:
	text "P-Pardon!"
	done

BikerHarrisAfterBattleText:
	text "Battu par quelqu'"
	line "un de JOHTO..."
	done

BikerZekeSeenText:
	text "On est la FEDERA-"
	line "TION des dresseurs"
	cont "de KANTO."
	cont "On est cool!"
	done

BikerZekeBeatenText:
	text "Oups! Pardon!"
	done

BikerZekeAfterBattleText:
	text "On va essayer de"
	line "n'plus déranger..."
	cont "Pardon."
	done

SupernerdSamSeenText:
	text "Comment ça marche"
	line "un TRAIN MAGNET?"
	done

SupernerdSamBeatenText:
	text "Moi je veux voir"
	line "le TRAIN MAGNET..."
	done

SupernerdSamAfterBattleText:
	text "La puissance"
	line "magnétique, c'est"
	cont "terrible!"
	done

SupernerdTomSeenText:
	text "Hmm... Tu en as"
	line "des bô BADGES."
	done

SupernerdTomBeatenText:
	text "Pas mal..."
	line "Je m'y attendais!"
	done

SupernerdTomAfterBattleText:
	text "Les BADGES donnent"
	line "l'avantage en"
	cont "combat."
	done

Route8LockedDoorText:
	text "C'est fermé..."
	done

Route8UndergroundPathSignText:
	text "L'affiche est"
	line "déchirée."

	para "C'est impossible"
	line "de la lire..."
	done

Route8_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  4, ROUTE_8_SAFFRON_GATE, 3
	warp_event  4,  5, ROUTE_8_SAFFRON_GATE, 4

	def_coord_events

	def_bg_events
	bg_event 11,  7, BGEVENT_READ, Route8UndergroundPathSign
	bg_event 10,  5, BGEVENT_READ, Route8LockedDoor

	def_object_events
	object_event 10,  8, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerBikerDwayne, -1
	object_event 10,  9, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerBikerHarris, -1
	object_event 10, 10, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerBikerZeke, -1
	object_event 23,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerSupernerdSam, -1
	object_event 31, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerSupernerdTom, -1
	object_event 33,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route8FruitTree, -1
