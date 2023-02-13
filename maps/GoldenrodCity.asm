	object_const_def
	const GOLDENRODCITY_POKEFAN_M1
	const GOLDENRODCITY_YOUNGSTER1
	const GOLDENRODCITY_COOLTRAINER_F1
	const GOLDENRODCITY_COOLTRAINER_F2
	const GOLDENRODCITY_YOUNGSTER2
	const GOLDENRODCITY_LASS
	const GOLDENRODCITY_GRAMPS
	const GOLDENRODCITY_ROCKETSCOUT
	const GOLDENRODCITY_ROCKET1
	const GOLDENRODCITY_ROCKET2
	const GOLDENRODCITY_ROCKET3
	const GOLDENRODCITY_ROCKET4
	const GOLDENRODCITY_ROCKET5
	const GOLDENRODCITY_ROCKET6
	const GOLDENRODCITY_MOVETUTOR

GoldenrodCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, GoldenrodCityFlypointAndFloriaCallback
	callback MAPCALLBACK_OBJECTS, GoldenrodCityMoveTutorCallback

GoldenrodCityFlypointAndFloriaCallback:
	setflag ENGINE_FLYPOINT_GOLDENROD
	setflag ENGINE_REACHED_GOLDENROD
	checkevent EVENT_MET_FLORIA
	iftrue .FloriaDone
	clearevent EVENT_FLORIA_AT_SUDOWOODO
.FloriaDone:
	endcallback

GoldenrodCityMoveTutorCallback:
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .MoveTutorDone
	checkitem COIN_CASE
	iffalse .MoveTutorDisappear
	readvar VAR_WEEKDAY
	ifequal WEDNESDAY, .MoveTutorAppear
	ifequal SATURDAY, .MoveTutorAppear
.MoveTutorDisappear:
	disappear GOLDENRODCITY_MOVETUTOR
	endcallback

.MoveTutorAppear:
	checkflag ENGINE_DAILY_MOVE_TUTOR
	iftrue .MoveTutorDone
	appear GOLDENRODCITY_MOVETUTOR
.MoveTutorDone:
	endcallback

MoveTutorScript:
	faceplayer
	opentext
	writetext GoldenrodCityMoveTutorAskTeachAMoveText
	yesorno
	iffalse .Refused
	special DisplayCoinCaseBalance
	writetext GoldenrodCityMoveTutorAsk4000CoinsOkayText
	yesorno
	iffalse .Refused2
	checkcoins 4000
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext GoldenrodCityMoveTutorWhichMoveShouldITeachText
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal MOVETUTOR_FLAMETHROWER, .Flamethrower
	ifequal MOVETUTOR_THUNDERBOLT, .Thunderbolt
	ifequal MOVETUTOR_ICE_BEAM, .IceBeam
	sjump .Incompatible

.Flamethrower:
	setval MOVETUTOR_FLAMETHROWER
	writetext GoldenrodCityMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.Thunderbolt:
	setval MOVETUTOR_THUNDERBOLT
	writetext GoldenrodCityMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.IceBeam:
	setval MOVETUTOR_ICE_BEAM
	writetext GoldenrodCityMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.MoveMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "LANCE-FLAMME@"
	db "TONNERRE@"
	db "LASER GLACE@"
	db "RETOUR@"

.Refused:
	writetext GoldenrodCityMoveTutorAwwButTheyreAmazingText
	waitbutton
	closetext
	end

.Refused2:
	writetext GoldenrodCityMoveTutorHmTooBadText
	waitbutton
	closetext
	end

.TeachMove:
	writetext GoldenrodCityMoveTutorIfYouUnderstandYouveMadeItText
	promptbutton
	takecoins 4000
	waitsfx
	playsound SFX_TRANSACTION
	special DisplayCoinCaseBalance
	writetext GoldenrodCityMoveTutorFarewellKidText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal LEFT, .WalkAroundPlayer
	applymovement GOLDENRODCITY_MOVETUTOR, GoldenrodCityMoveTutorEnterGameCornerMovement
	sjump .GoInside

.WalkAroundPlayer:
	applymovement GOLDENRODCITY_MOVETUTOR, GoldenrodCityMoveTutorWalkAroundPlayerThenEnterGameCornerMovement
.GoInside:
	playsound SFX_ENTER_DOOR
	disappear GOLDENRODCITY_MOVETUTOR
	clearevent EVENT_GOLDENROD_GAME_CORNER_MOVE_TUTOR
	setflag ENGINE_DAILY_MOVE_TUTOR
	waitsfx
	end

.Incompatible:
	writetext GoldenrodCityMoveTutorBButText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext GoldenrodCityMoveTutorYouDontHaveEnoughCoinsText
	waitbutton
	closetext
	end

GoldenrodCityPokefanMScript:
	jumptextfaceplayer GoldenrodCityPokefanMText

GoldenrodCityYoungster1Script:
	jumptextfaceplayer GoldenrodCityYoungster1Text

GoldenrodCityCooltrainerF1Script:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRadioTower
	writetext GoldenrodCityCooltrainerF1Text
	waitbutton
	closetext
	end

.ClearedRadioTower:
	writetext GoldenrodCityCooltrainerF1Text_ClearedRadioTower
	waitbutton
	closetext
	end

GoldenrodCityCooltrainerF2Script:
	faceplayer
	opentext
	checkflag ENGINE_RADIO_CARD
	iftrue .GotRadioCard
	writetext GoldenrodCityCooltrainerF2Text
	waitbutton
	closetext
	end

.GotRadioCard:
	writetext GoldenrodCityCooltrainerF2Text_GotRadioCard
	waitbutton
	closetext
	end

GoldenrodCityYoungster2Script:
	jumptextfaceplayer GoldenrodCityYoungster2Text

GoldenrodCityLassScript:
	jumptextfaceplayer GoldenrodCityLassText

GoldenrodCityGrampsScript:
	jumptextfaceplayer GoldenrodCityGrampsText

GoldenrodCityRocketScoutScript:
	opentext
	writetext GoldenrodCityRocketScoutText1
	promptbutton
	faceplayer
	writetext GoldenrodCityRocketScoutText2
	waitbutton
	closetext
	turnobject GOLDENRODCITY_ROCKETSCOUT, UP
	end

GoldenrodCityRocket1Script:
	jumptextfaceplayer GoldenrodCityRocket1Text

GoldenrodCityRocket2Script:
	jumptextfaceplayer GoldenrodCityRocket2Text

GoldenrodCityRocket3Script:
	jumptextfaceplayer GoldenrodCityRocket3Text

GoldenrodCityRocket4Script:
	jumptextfaceplayer GoldenrodCityRocket4Text

GoldenrodCityRocket5Script:
	jumptextfaceplayer GoldenrodCityRocket5Text

GoldenrodCityRocket6Script:
	jumptextfaceplayer GoldenrodCityRocket6Text

GoldenrodCityStationSign:
	jumptext GoldenrodCityStationSignText

GoldenrodCityRadioTowerSign:
	jumptext GoldenrodCityRadioTowerSignText

GoldenrodDeptStoreSign:
	jumptext GoldenrodDeptStoreSignText

GoldenrodGymSign:
	jumptext GoldenrodGymSignText

GoldenrodCitySign:
	jumptext GoldenrodCitySignText

GoldenrodCityBikeShopSign:
	jumptext GoldenrodCityBikeShopSignText

GoldenrodCityGameCornerSign:
	jumptext GoldenrodCityGameCornerSignText

GoldenrodCityNameRaterSign:
	jumptext GoldenrodCityNameRaterSignText

GoldenrodCityUndergroundSignNorth:
	jumptext GoldenrodCityUndergroundSignNorthText

GoldenrodCityUndergroundSignSouth:
	jumptext GoldenrodCityUndergroundSignSouthText

GoldenrodCityPokecenterSign:
	jumpstd PokecenterSignScript

GoldenrodCityFlowerShopSign:
	jumptext GoldenrodCityFlowerShopSignText

GoldenrodCityMoveTutorEnterGameCornerMovement:
	step RIGHT
	step RIGHT
	step UP
	step_end

GoldenrodCityMoveTutorWalkAroundPlayerThenEnterGameCornerMovement:
	step DOWN
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

GoldenrodCityPokefanMText:
	text "Ils ont construit"
	line "une nouvelle TOUR"

	para "RADIO pour rempla-"
	line "cer l'ancienne."
	done

GoldenrodCityYoungster1Text:
	text "Je sais qu'il y a"
	line "un nouveau CYCLES"

	para "A GOGO, mais je ne"
	line "le trouve pas."
	done

GoldenrodCityCooltrainerF1Text:
	text "Ce type en noir"
	line "est habillé"

	para "comme un membre de"
	line "la TEAM ROCKET!"
	cont "Quel bêta!"
	done

GoldenrodCityCooltrainerF1Text_ClearedRadioTower:
	text "Cet homme faisait"
	line "vraiment partie de"

	para "la TEAM ROCKET?"
	line "J'y crois pas!"
	done

GoldenrodCityCooltrainerF2Text:
	text "La TOUR RADIO de"
	line "DOUBLONVILLE est"
	cont "un point de"
	cont "repère."

	para "Ils organisent une"
	line "campagne promo-"
	cont "tionnelle en ce"
	cont "moment."

	para "Ils te modifieront"
	line "ton #MATOS"

	para "pour t'en servir"
	line "comme radio."
	done

GoldenrodCityCooltrainerF2Text_GotRadioCard:
	text "Oh, ton #MATOS"
	line "fait radio!"
	done

GoldenrodCityYoungster2Text:
	text "Ala-lala-lala..."

	para "J'ai eu des ennuis"
	line "pour avoir joué"

	para "au sous-sol du"
	line "CENTRE COMMERCIAL."
	done

GoldenrodCityLassText:
	text "L'homme de cette"
	line "maison note les"
	cont "noms de tes"
	cont "#MON."

	para "Il peut même"
	line "renommer tes"
	cont "#MON."
	done

GoldenrodCityGrampsText:
	text "Whoua! C'est une"
	line "très grosse ville."

	para "Je suis totalement"
	line "perdu ici."
	done

GoldenrodCityRocketScoutText1:
	text "C'est donc ça la"
	line "TOUR RADIO..."
	done

GoldenrodCityRocketScoutText2:
	text "Que veux-tu petit"
	line "scarabée? Gage-dé!"
	done

GoldenrodCityRocket1Text:
	text "Reste hors de mon"
	line "chemin! Dégage!!"
	done

GoldenrodCityRocket2Text:
	text "Envahir la TOUR"
	line "RADIO..."

	para "Quoi? Mais c'est"
	line "pas tes oignons!"
	done

GoldenrodCityRocket3Text:
	text "Les #MON? Ils"
	line "ne servent qu'à"

	para "amasser des tonnes"
	line "de #thunes!"
	done

GoldenrodCityRocket4Text:
	text "Notre rêve va"
	line "bientôt devenir"
	cont "réalité..."

	para "C'était une si"
	line "longue lutte..."
	done

GoldenrodCityRocket5Text:
	text "Hé, toi! T'es"
	line "pas de la bande!"
	cont "Bouge de là!"
	done

GoldenrodCityRocket6Text:
	text "Viens te frotter à"
	line "la terreur de la"
	cont "TEAM ROCKET!"
	done

GoldenrodCityStationSignText:
	text "STATION de"
	line "DOUBLONVILLE"
	done

GoldenrodCityRadioTowerSignText:
	text "TOUR RADIO de"
	line "DOUBLONVILLE"
	done

GoldenrodDeptStoreSignText:
	text "Marchandises de"
	line "premier choix pour"
	cont "#MON!"

	para "CENTRE COMMERCIAL"
	line "de DOUBLONVILLE"
	done

GoldenrodGymSignText:
	text "CHAMPION d'ARENE"
	line "de DOUBLONVILLE:"
	cont "BLANCHE"

	para "La fille qui est"
	line "trop, trop bien!"
	done

GoldenrodCitySignText:
	text "DOUBLONVILLE"

	para "La ville festive"
	line "qui fleure bon la"
	cont "bonne humeur"
	done

GoldenrodCityBikeShopSignText:
	text "Dans la vie pour"
	line "avancer faut"
	cont "pédaler!"
	cont "CYCLES A GOGO"
	done

GoldenrodCityGameCornerSignText:
	text "Votre espace de"
	line "jeux!"

	para "CASINO de"
	line "DOUBLONVILLE"
	done

GoldenrodCityNameRaterSignText:
	text "LE NOTEUR DE NOM"

	para "Evaluez le surnom"
	line "de votre #MON"
	done

GoldenrodCityUndergroundSignNorthText:
	text "ENTREE du"
	line "SOUTERRAIN"
	done

GoldenrodCityUndergroundSignSouthText:
	text "ENTREE du"
	line "SOUTERRAIN"
	done

GoldenrodCityPokeComCenterSignText: ; unreferenced
	text_start
	done

GoldenrodCityFlowerShopSignText:
	text "Une fleur, la vie!"
	line "FLEURISTE"
	done

GoldenrodCityMoveTutorAskTeachAMoveText:
	text "Je peux apprendre"
	line "à tes #MON de"
	cont "super capacités."

	para "Ca t'intéresse?"
	done

GoldenrodCityMoveTutorAsk4000CoinsOkayText:
	text "Ca te coûtera"
	line "4000 jetons. OK?"
	done

GoldenrodCityMoveTutorAwwButTheyreAmazingText:
	text "Dommage pour toi."
	done

GoldenrodCityMoveTutorWhichMoveShouldITeachText:
	text "Wahahah! Tu ne le"
	line "regretteras pas!"

	para "Quelle capacité"
	line "veux-tu apprendre?"
	done

GoldenrodCityMoveTutorHmTooBadText:
	text "Dommage."
	line "Il me faut de"
	cont "l'argent..."
	done

GoldenrodCityMoveTutorIfYouUnderstandYouveMadeItText:
	text "Si tu peux com-"
	line "prendre à quel"

	para "point cette capa-"
	line "cité est terrible,"
	cont "tu peux te vanter"
	cont "d'être balèze."
	done

GoldenrodCityMoveTutorFarewellKidText:
	text "Wahahah!"
	line "Adieu!"
	done

GoldenrodCityMoveTutorBButText:
	text "M...mais!"
	done

GoldenrodCityMoveTutorYouDontHaveEnoughCoinsText:
	text "Pas assez de"
	line "jetons..."
	done

GoldenrodCityMoveTutorMoveText:
	text_start
	done

GoldenrodCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 24,  7, GOLDENROD_GYM, 1
	warp_event 29, 29, GOLDENROD_BIKE_SHOP, 1
	warp_event 31, 21, GOLDENROD_HAPPINESS_RATER, 1
	warp_event  5, 25, BILLS_FAMILYS_HOUSE, 1
	warp_event  9, 13, GOLDENROD_MAGNET_TRAIN_STATION, 2
	warp_event 29,  5, GOLDENROD_FLOWER_SHOP, 1
	warp_event 33,  9, GOLDENROD_PP_SPEECH_HOUSE, 1
	warp_event 15,  7, GOLDENROD_NAME_RATER, 1
	warp_event 24, 27, GOLDENROD_DEPT_STORE_1F, 1
	warp_event 14, 21, GOLDENROD_GAME_CORNER, 1
	warp_event  5, 15, RADIO_TOWER_1F, 1
	warp_event 19,  1, ROUTE_35_GOLDENROD_GATE, 3
	warp_event  9,  5, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 8
	warp_event 11, 29, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 5
	warp_event 15, 27, GOLDENROD_POKECENTER_1F, 1

	def_coord_events

	def_bg_events
	bg_event 10, 14, BGEVENT_READ, GoldenrodCityStationSign
	bg_event  4, 17, BGEVENT_READ, GoldenrodCityRadioTowerSign
	bg_event 26, 27, BGEVENT_READ, GoldenrodDeptStoreSign
	bg_event 26,  9, BGEVENT_READ, GoldenrodGymSign
	bg_event 22, 18, BGEVENT_READ, GoldenrodCitySign
	bg_event 28, 30, BGEVENT_READ, GoldenrodCityBikeShopSign
	bg_event 16, 22, BGEVENT_READ, GoldenrodCityGameCornerSign
	bg_event 12,  7, BGEVENT_READ, GoldenrodCityNameRaterSign
	bg_event  8,  6, BGEVENT_READ, GoldenrodCityUndergroundSignNorth
	bg_event 12, 30, BGEVENT_READ, GoldenrodCityUndergroundSignSouth
	bg_event 16, 27, BGEVENT_UP, GoldenrodCityPokecenterSign
	bg_event 30,  6, BGEVENT_READ, GoldenrodCityFlowerShopSign

	def_object_events
	object_event  7, 18, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityPokefanMScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 30, 17, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityYoungster1Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 12, 16, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodCityCooltrainerF1Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 20, 26, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityCooltrainerF2Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 19, 17, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodCityYoungster2Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 17, 10, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodCityLassScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 11, 27, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityGrampsScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event  4, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocketScoutScript, EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	object_event 28, 20, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket1Script, EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	object_event  8, 15, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket2Script, EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	object_event 16, 23, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket3Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 29, 20, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket4Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 29,  7, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket5Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 31, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket6Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12, 22, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoveTutorScript, EVENT_GOLDENROD_CITY_MOVE_TUTOR
