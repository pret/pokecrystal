	object_const_def
	const CELADONCITY_FISHER
	const CELADONCITY_POLIWAG
	const CELADONCITY_TEACHER1
	const CELADONCITY_GRAMPS1
	const CELADONCITY_GRAMPS2
	const CELADONCITY_YOUNGSTER1
	const CELADONCITY_YOUNGSTER2
	const CELADONCITY_TEACHER2
	const CELADONCITY_LASS

CeladonCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CeladonCityFlypointCallback

CeladonCityFlypointCallback:
	setflag ENGINE_FLYPOINT_CELADON
	endcallback

CeladonCityFisherScript:
	jumptextfaceplayer CeladonCityFisherText

CeladonCityPoliwrath:
	opentext
	writetext CeladonCityPoliwrathText
	cry POLIWRATH
	waitbutton
	closetext
	end

CeladonCityTeacher1Script:
	jumptextfaceplayer CeladonCityTeacher1Text

CeladonCityGramps1Script:
	jumptextfaceplayer CeladonCityGramps1Text

CeladonCityGramps2Script:
	jumptextfaceplayer CeladonCityGramps2Text

CeladonCityYoungster1Script:
	jumptextfaceplayer CeladonCityYoungster1Text

CeladonCityYoungster2Script:
	jumptextfaceplayer CeladonCityYoungster2Text

CeladonCityTeacher2Script:
	jumptextfaceplayer CeladonCityTeacher2Text

CeladonCityLassScript:
	jumptextfaceplayer CeladonCityLassText

CeladonCitySign:
	jumptext CeladonCitySignText

CeladonGymSign:
	jumptext CeladonGymSignText

CeladonCityDeptStoreSign:
	jumptext CeladonCityDeptStoreSignText

CeladonCityMansionSign:
	jumptext CeladonCityMansionSignText

CeladonCityGameCornerSign:
	jumptext CeladonCityGameCornerSignText

CeladonCityTrainerTips:
	jumptext CeladonCityTrainerTipsText

CeladonCityPokecenterSign:
	jumpstd PokecenterSignScript

CeladonCityHiddenPpUp:
	hiddenitem PP_UP, EVENT_CELADON_CITY_HIDDEN_PP_UP

CeladonCityFisherText:
	text "Ce TARTARD est mon"
	line "partenaire."

	para "Peut-il évoluer en"
	line "un #MON"
	cont "grenouille?"
	done

CeladonCityPoliwrathText:
	text "TARTARD: Tarr!"
	done

CeladonCityTeacher1Text:
	text "J'ai encore perdu"
	line "aux machines à"
	cont "sous..."

	para "Les filles aiment"
	line "bien jouer aussi."

	para "Tente ta chance,"
	line "mon bouchon."
	done

CeladonCityGramps1Text:
	text "Des TADMORV sont"
	line "apparus dans les"
	cont "environs."

	para "Tu vois la mare"
	line "devant la maison?"

	para "Un TADMORV y vit"
	line "maintenant."

	para "D'où est-ce qu'ils"
	line "viennent tous?"
	cont "C'est un gros"
	cont "problème..."
	done

CeladonCityGramps2Text:
	text "Hihi! Cette ARENE"
	line "est géniale! C'est"

	para "réservé aux"
	line "filles! Youpi!"
	done

CeladonCityYoungster1Text:
	text "Tu veux connaître"
	line "un secret?"

	para "Le MANOIR CELADON"
	line "a une porte cachée"
	cont "à l'arrière."
	done

CeladonCityYoungster2Text:
	text "Il y a un concours"
	line "de bouffe au"
	cont "restaurant."

	para "Rien que de les"
	line "regarder me donne"
	cont "mal au coeur..."
	done

CeladonCityTeacher2Text:
	text "Le CENTRE COMMER-"
	line "CIAL de CELADOPOLE"
	cont "vend de tout."

	para "Si tu n'y trouves"
	line "pas ce que tu veux"

	para "c'est que tu n'as"
	line "pas de chance."

	para "...On dirait un"
	line "slogan."
	done

CeladonCityLassText_Mobile: ; unreferenced
	text "J'adore les grands"
	line "immeubles!"

	para "C'est vrai que le"
	line "CENTRE #MON"

	para "de DOUBLONVILLE"
	line "est super grand?"

	para "C'est trop bien!"
	line "J'aimerais voir un"

	para "endroit pareil à"
	line "KANTO..."
	done

CeladonCityLassText:
	text "J'ai mal au crâne."
	done

CeladonCitySignText:
	text "CELADOPOLE"

	para "La ville aux rêves"
	line "arc-en-ciel"
	done

CeladonGymSignText:
	text "CHAMPION d'ARENE"
	line "de CELADOPOLE:"
	cont "ERIKA"

	para "La princesse de"
	line "la nature"
	done

CeladonCityDeptStoreSignText:
	text "Y'a de tout au"
	line "CENTRE COMMERCIAL"
	cont "de CELADOPOLE!"
	done

CeladonCityMansionSignText:
	text "MANOIR CELADON"
	done

CeladonCityGameCornerSignText:
	text "Des jeux pour tous"
	line "au CASINO de"
	cont "CELADOPOLE"
	done

CeladonCityTrainerTipsText:
	text "ASTUCE"

	para "DEFENSE SPEC"
	line "protège les #-"

	para "MON des attaques"
	line "SPECIALES comme le"
	cont "feu et l'eau."

	para "Achetez-en au"
	line "CENTRE COMMERCIAL"
	cont "de CELADOPOLE!"
	done

CeladonCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  9, CELADON_DEPT_STORE_1F, 1
	warp_event 16,  9, CELADON_MANSION_1F, 1
	warp_event 16,  3, CELADON_MANSION_1F, 3
	warp_event 17,  3, CELADON_MANSION_1F, 3
	warp_event 29,  9, CELADON_POKECENTER_1F, 1
	warp_event 18, 19, CELADON_GAME_CORNER, 1
	warp_event 23, 19, CELADON_GAME_CORNER_PRIZE_ROOM, 1
	warp_event 10, 29, CELADON_GYM, 1
	warp_event 25, 29, CELADON_CAFE, 1

	def_coord_events

	def_bg_events
	bg_event 23, 21, BGEVENT_READ, CeladonCitySign
	bg_event 11, 31, BGEVENT_READ, CeladonGymSign
	bg_event  6,  9, BGEVENT_READ, CeladonCityDeptStoreSign
	bg_event 13,  9, BGEVENT_READ, CeladonCityMansionSign
	bg_event 19, 21, BGEVENT_READ, CeladonCityGameCornerSign
	bg_event 29, 21, BGEVENT_READ, CeladonCityTrainerTips
	bg_event 30,  9, BGEVENT_READ, CeladonCityPokecenterSign
	bg_event 37, 21, BGEVENT_ITEM, CeladonCityHiddenPpUp

	def_object_events
	object_event 26, 11, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityFisherScript, -1
	object_event 27, 11, SPRITE_POLIWAG, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonCityPoliwrath, -1
	object_event 20, 24, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityTeacher1Script, -1
	object_event 14, 16, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeladonCityGramps1Script, -1
	object_event  8, 31, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityGramps2Script, -1
	object_event 18, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonCityYoungster1Script, -1
	object_event 24, 33, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityYoungster2Script, -1
	object_event  6, 14, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityTeacher2Script, -1
	object_event  7, 22, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityLassScript, -1
