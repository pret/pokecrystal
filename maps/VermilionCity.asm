	object_const_def
	const VERMILIONCITY_TEACHER
	const VERMILIONCITY_GRAMPS
	const VERMILIONCITY_MACHOP
	const VERMILIONCITY_SUPER_NERD
	const VERMILIONCITY_BIG_SNORLAX
	const VERMILIONCITY_POKEFAN_M

VermilionCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, VermilionCityFlypointCallback

VermilionCityFlypointCallback:
	setflag ENGINE_FLYPOINT_VERMILION
	endcallback

VermilionCityTeacherScript:
	jumptextfaceplayer VermilionCityTeacherText

VermilionMachopOwner:
	jumptextfaceplayer VermilionMachopOwnerText

VermilionMachop:
	opentext
	writetext VermilionMachopText1
	cry MACHOP
	waitbutton
	closetext
	earthquake 30
	opentext
	writetext VermilionMachopText2
	waitbutton
	closetext
	end

VermilionCitySuperNerdScript:
	jumptextfaceplayer VermilionCitySuperNerdText

VermilionSnorlax:
	opentext
	special SnorlaxAwake
	iftrue .Awake
	writetext VermilionCitySnorlaxSleepingText
	waitbutton
	closetext
	end

.Awake:
	writetext VermilionCityRadioNearSnorlaxText
	pause 15
	cry SNORLAX
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon SNORLAX, 50
	startbattle
	disappear VERMILIONCITY_BIG_SNORLAX
	setevent EVENT_FOUGHT_SNORLAX
	reloadmapafterbattle
	end

VermilionGymBadgeGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_HP_UP_FROM_VERMILION_GUY
	iftrue .AlreadyGotItem
	readvar VAR_BADGES
	ifequal NUM_BADGES, .AllBadges
	ifgreater 13, .MostBadges
	ifgreater 9, .SomeBadges
	writetext VermilionCityBadgeGuyTrainerText
	waitbutton
	closetext
	end

.SomeBadges:
	writetext VermilionCityBadgeGuySomeBadgesText
	waitbutton
	closetext
	end

.MostBadges:
	writetext VermilionCityBadgeGuyMostBadgesText
	waitbutton
	closetext
	end

.AllBadges:
	writetext VermilionCityBadgeGuyAllBadgesText
	promptbutton
	verbosegiveitem HP_UP
	iffalse .Done
	setevent EVENT_GOT_HP_UP_FROM_VERMILION_GUY
.AlreadyGotItem:
	writetext VermilionCityBadgeGuyBattleEdgeText
	waitbutton
.Done:
	closetext
	end

VermilionCitySign:
	jumptext VermilionCitySignText

VermilionGymSign:
	jumptext VermilionGymSignText

PokemonFanClubSign:
	jumptext PokemonFanClubSignText

VermilionCityDiglettsCaveSign:
	jumptext VermilionCityDiglettsCaveSignText

VermilionCityPortSign:
	jumptext VermilionCityPortSignText

VermilionCityPokecenterSign:
	jumpstd PokecenterSignScript

VermilionCityMartSign:
	jumpstd MartSignScript

VermilionCityHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_VERMILION_CITY_HIDDEN_FULL_HEAL

VermilionCityTeacherText:
	text "Le PORT de CARMIN"
	line "est la porte de"
	cont "KANTO vers"
	cont "l'océan."

	para "De magnifiques"
	line "paquebots du monde"
	cont "entier viennent y"
	cont "jeter l'ancre."
	done

VermilionMachopOwnerText:
	text "Mon #MON pré-"
	line "pare le terrain"
	cont "pour construire."

	para "Mais je n'ai pas"
	line "d'argent pour com-"
	cont "mencer le projet."
	done

VermilionMachopText1:
	text "MACHOC: Maaaa!"
	line "Choc!"
	done

VermilionMachopText2:
	text "Un MACHOC grogne"
	line "en aplatissant le"
	cont "sol."
	done

VermilionCitySuperNerdText:
	text "Il y a huit ARENES"
	line "à KANTO."

	para "Ce grand bâtiment"
	line "est l'ARENE #-"
	cont "MON de CARMIN."
	done

VermilionCitySnorlaxSleepingText:
	text "RONFLEX ronfle"
	line "paisiblement..."
	done

VermilionCityRadioNearSnorlaxText:
	text "Le #MATOS est"
	line "placé près de"
	cont "l'oreille du"
	cont "RONFLEX."

	para "..."

	para "RONFLEX se"
	line "réveille!"
	done

VermilionCityBadgeGuyTrainerText:
	text "Les bons dresseurs"
	line "viennent à KANTO."

	para "Les CHAMPIONS"
	line "d'ARENE sont spé-"
	cont "cialement forts."

	para "Ce ne sera pas"
	line "facile de les"
	cont "battre."
	done

VermilionCityBadgeGuySomeBadgesText:
	text "Tu as commencé à"
	line "collectionner les"
	cont "BADGES de KANTO?"

	para "Tu ne trouves pas"
	line "que les dresseurs"
	cont "du coin sont"
	cont "super forts?"
	done

VermilionCityBadgeGuyMostBadgesText:
	text "Je pense que tu"
	line "termineras bientôt"

	para "ta conquête des"
	line "ARENES de KANTO."

	para "Préviens-moi si"
	line "tu gagnes les huit"
	cont "BADGES."
	done

VermilionCityBadgeGuyAllBadgesText:
	text "Félicitations!"

	para "Tu as tous les"
	line "BADGES des ARENES"
	cont "de KANTO!"

	para "Voilà une petite"
	line "récompense."
	done

VermilionCityBadgeGuyBattleEdgeText:
	text "Avoir des #MON"
	line "de types diffé-"

	para "rents donne"
	line "l'avantage en"
	cont "combat."

	para "Les BADGES de KAN-"
	line "TO t'aideront,"
	cont "j'en suis sûr."
	done

VermilionCitySignText:
	text "CARMIN SUR MER"

	para "Le port aux cou-"
	line "chers de soleil"
	done

VermilionGymSignText:
	text "CHAMPION d'ARENE"
	line "de CARMIN SUR MER:"
	cont "MAJOR BOB"

	para "L'Américain"
	line "survolté"
	done

PokemonFanClubSignText:
	text "FAN CLUB #MON"

	para "Fans de #MON"
	line "bienvenus!"
	done

VermilionCityDiglettsCaveSignText:
	text "CAVE TAUPIQUEUR"
	done

VermilionCityPortSignText:
	text "PORT de CARMIN"
	line "ENTREE"
	done

VermilionCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, VERMILION_FISHING_SPEECH_HOUSE, 1
	warp_event  9,  5, VERMILION_POKECENTER_1F, 1
	warp_event  7, 13, POKEMON_FAN_CLUB, 1
	warp_event 13, 13, VERMILION_MAGNET_TRAIN_SPEECH_HOUSE, 1
	warp_event 21, 13, VERMILION_MART, 2
	warp_event 21, 17, VERMILION_DIGLETTS_CAVE_SPEECH_HOUSE, 1
	warp_event 10, 19, VERMILION_GYM, 1
	warp_event 19, 31, VERMILION_PORT_PASSAGE, 1
	warp_event 20, 31, VERMILION_PORT_PASSAGE, 2
	warp_event 34,  7, DIGLETTS_CAVE, 1

	def_coord_events

	def_bg_events
	bg_event 25,  3, BGEVENT_READ, VermilionCitySign
	bg_event  5, 19, BGEVENT_READ, VermilionGymSign
	bg_event  5, 13, BGEVENT_READ, PokemonFanClubSign
	bg_event 33,  9, BGEVENT_READ, VermilionCityDiglettsCaveSign
	bg_event 27, 15, BGEVENT_READ, VermilionCityPortSign
	bg_event 10,  5, BGEVENT_READ, VermilionCityPokecenterSign
	bg_event 22, 13, BGEVENT_READ, VermilionCityMartSign
	bg_event 12, 19, BGEVENT_ITEM, VermilionCityHiddenFullHeal

	def_object_events
	object_event 18,  9, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCityTeacherScript, -1
	object_event 23,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionMachopOwner, -1
	object_event 26,  7, SPRITE_MACHOP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VermilionMachop, -1
	object_event 14, 16, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionCitySuperNerdScript, -1
	object_event 34,  8, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionSnorlax, EVENT_VERMILION_CITY_SNORLAX
	object_event 31, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionGymBadgeGuy, -1
