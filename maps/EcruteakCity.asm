	object_const_def
	const ECRUTEAKCITY_GRAMPS1
	const ECRUTEAKCITY_GRAMPS2
	const ECRUTEAKCITY_LASS1
	const ECRUTEAKCITY_LASS2
	const ECRUTEAKCITY_FISHER
	const ECRUTEAKCITY_YOUNGSTER
	const ECRUTEAKCITY_GRAMPS3

EcruteakCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, EcruteakCityFlypointCallback

EcruteakCityFlypointCallback:
	setflag ENGINE_FLYPOINT_ECRUTEAK
	endcallback

EcruteakCityGramps1Script:
	jumptextfaceplayer EcruteakCityGramps1Text

EcruteakCityGramps2Script:
	jumptextfaceplayer EcruteakCityGramps2Text

EcruteakCityGramps3Script:
	jumptextfaceplayer EcruteakCityGramps3Text

EcruteakCityLass1Script:
	jumptextfaceplayer EcruteakCityLass1Text

EcruteakCityLass2Script:
	faceplayer
	opentext
	checkevent EVENT_RELEASED_THE_BEASTS
	iftrue .ReleasedBeasts
	writetext EcruteakCityLass2Text
	waitbutton
	closetext
	end

.ReleasedBeasts:
	writetext EcruteakCityLass2Text_ReleasedBeasts
	waitbutton
	closetext
	end

EcruteakCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue .JasmineReturned
	writetext EcruteakCityFisherText
	waitbutton
	closetext
	end

.JasmineReturned:
	writetext EcruteakCityFisherText_JasmineReturned
	waitbutton
	closetext
	end

EcruteakCityYoungsterScript:
	jumptextfaceplayer EcruteakCityYoungsterText

EcruteakCitySign:
	jumptext EcruteakCitySignText

TinTowerSign:
	jumptext TinTowerSignText

EcruteakGymSign:
	jumptext EcruteakGymSignText

EcruteakDanceTheaterSign:
	jumptext EcruteakDanceTheaterSignText

BurnedTowerSign:
	jumptext BurnedTowerSignText

EcruteakCityPokecenterSign:
	jumpstd PokecenterSignScript

EcruteakCityMartSign:
	jumpstd MartSignScript

EcruteakCityHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_ECRUTEAK_CITY_HIDDEN_HYPER_POTION

UnusedMissingDaughterText: ; unreferenced
	text "Oh non de non..."

	para "Ma soeur n'est"
	line "plus là."

	para "Noonn... Elle ne"
	line "peut pas être"
	cont "partie à la TOUR"
	cont "CENDREE."

	para "Je lui avais dit"
	line "de ne pas y aller."

	para "Les gens y"
	line "disparaissent!"

	para "Mais que dois-je"
	line "faire...?"
	done

EcruteakCityGramps1Text:
	text "ROSALIA avait"
	line "deux tours:"

	para "une à l'Est,"
	line "l'autre à l'Ouest."
	done

EcruteakCityGramps2Text:
	text "Ah..."
	line "As-tu appris à"

	para "danser comme les"
	line "KIMONO?"

	para "Si tu vas dans"
	line "leur SALLE de"

	para "DANSE, un vieil"
	line "homme bizarre te"
	cont "donnera un cadeau."
	done

EcruteakCityLass1Text:
	text "Je vais m'entraî-"
	line "ner à la SALLE de"

	para "DANSE, tu viens"
	line "avec moi?"
	done

EcruteakCityLass2Text:
	text "La tour qu'il y"
	line "avait ici..."

	para "Ma mémé me disait"
	line "qu'elle était bien"
	cont "plus grande."
	done

EcruteakCityLass2Text_ReleasedBeasts:
	text "Trois gros #MON"
	line "se sont enfuis"
	cont "dans des direc-"
	cont "tions différentes."
	cont "Qu'est-ce qui"
	cont "s'organise?"
	done

EcruteakCityFisherText:
	text "Il y a une rumeur"
	line "qui court sur le"
	cont "PHARE D'OLIVILLE."

	para "Le #MON qui"
	line "était au PHARE"

	para "est tombé malade."
	line "Tout ça c'est pas"
	cont "bon signe."
	done

EcruteakCityFisherText_JasmineReturned:
	text "Le #MON du"
	line "PHARE D'OLIVILLE a"
	cont "été soigné."

	para "Les bateaux peu-"
	line "vent de nouveau"
	cont "naviguer de nuit"
	cont "sans soucis."
	done

EcruteakCityYoungsterText:
	text "On dit que les"
	line "#MON sont"

	para "déchaînés au LAC"
	line "COLERE. J'aimerais"
	cont "bien voir ça."
	done

EcruteakCityGramps3Text:
	text "Il y a bien"
	line "longtemps..."

	para "La tour prit feu."
	line "3 #MON inconnus"

	para "périrent alors"
	line "dans les flammes."

	para "Un #MON aux"
	line "couleurs de l'arc-"

	para "en-ciel descendit"
	line "du ciel et les"
	cont "ressuscita..."

	para "Cette légende est"
	line "connue de tous les"

	para "CHAMPIONS de"
	line "ROSALIA."

	para "Moi?"

	para "J'étais dresseur"
	line "à l'époque."
	cont "Hohoho!"
	done

EcruteakCitySignText:
	text "ROSALIA"
	line "Une ville bien"

	para "historique où"
	line "le Passé et le"
	cont "Présent se"
	cont "rencontrent"
	done

TinTowerSignText:
	text "TOUR FERRAILLE"

	para "Un #MON"
	line "légendaire y est"
	cont "soi-disant"
	cont "perché."
	done

EcruteakGymSignText:
	text "CHAMPION d'ARENE"
	line "de ROSALIA:"
	cont "MORTIMER"

	para "Le mystérieux"
	line "voyant"
	done

EcruteakDanceTheaterSignText:
	text "SALLE de DANSE"
	line "de ROSALIA"
	done

BurnedTowerSignText:
	text "TOUR CENDREE"

	para "Elle a été détrui-"
	line "te par un feu"
	cont "d'origine encore"
	cont "inconnue."

	para "Restez à l'écart"
	line "pour votre propre"
	cont "sécurité."
	done

EcruteakCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 35, 26, ROUTE_42_ECRUTEAK_GATE, 1
	warp_event 35, 27, ROUTE_42_ECRUTEAK_GATE, 2
	warp_event 18, 11, ECRUTEAK_TIN_TOWER_ENTRANCE, 1
	warp_event 20,  2, WISE_TRIOS_ROOM, 1
	warp_event 20,  3, WISE_TRIOS_ROOM, 2
	warp_event 23, 27, ECRUTEAK_POKECENTER_1F, 1
	warp_event  5, 21, ECRUTEAK_LUGIA_SPEECH_HOUSE, 1
	warp_event 23, 21, DANCE_THEATER, 1
	warp_event 29, 21, ECRUTEAK_MART, 2
	warp_event  6, 27, ECRUTEAK_GYM, 1
	warp_event 13, 27, ECRUTEAK_ITEMFINDER_HOUSE, 1
	warp_event 37,  7, TIN_TOWER_1F, 1
	warp_event  5,  5, BURNED_TOWER_1F, 1
	warp_event  0, 18, ROUTE_38_ECRUTEAK_GATE, 3
	warp_event  0, 19, ROUTE_38_ECRUTEAK_GATE, 4

	def_coord_events

	def_bg_events
	bg_event 15, 21, BGEVENT_READ, EcruteakCitySign
	bg_event 38, 10, BGEVENT_READ, TinTowerSign
	bg_event  8, 28, BGEVENT_READ, EcruteakGymSign
	bg_event 21, 21, BGEVENT_READ, EcruteakDanceTheaterSign
	bg_event  2, 10, BGEVENT_READ, BurnedTowerSign
	bg_event 24, 27, BGEVENT_READ, EcruteakCityPokecenterSign
	bg_event 30, 21, BGEVENT_READ, EcruteakCityMartSign
	bg_event 23, 14, BGEVENT_ITEM, EcruteakCityHiddenHyperPotion

	def_object_events
	object_event 18, 15, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps1Script, -1
	object_event 20, 21, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps2Script, -1
	object_event 21, 29, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EcruteakCityLass1Script, -1
	object_event  3,  9, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityLass2Script, -1
	object_event  9, 22, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakCityFisherScript, -1
	object_event 10, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakCityYoungsterScript, -1
	object_event  3,  7, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps3Script, EVENT_ECRUTEAK_CITY_GRAMPS
