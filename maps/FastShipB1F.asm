	object_const_def
	const FASTSHIPB1F_SAILOR1
	const FASTSHIPB1F_SAILOR2
	const FASTSHIPB1F_SAILOR3
	const FASTSHIPB1F_LASS
	const FASTSHIPB1F_SUPER_NERD
	const FASTSHIPB1F_SAILOR4
	const FASTSHIPB1F_FISHER
	const FASTSHIPB1F_BLACK_BELT
	const FASTSHIPB1F_SAILOR5
	const FASTSHIPB1F_TEACHER
	const FASTSHIPB1F_YOUNGSTER1
	const FASTSHIPB1F_YOUNGSTER2

FastShipB1F_MapScripts:
	def_scene_scripts
	scene_script FastShipB1FNoop1Scene, SCENE_FASTSHIPB1F_SAILOR_BLOCKS
	scene_script FastShipB1FNoop2Scene, SCENE_FASTSHIPB1F_NOOP

	def_callbacks

FastShipB1FNoop1Scene:
	end

FastShipB1FNoop2Scene:
	end

FastShipB1FSailorBlocksLeft:
	checkevent EVENT_FAST_SHIP_B1F_SAILOR_RIGHT
	iftrue FastShipB1FAlreadyBlocked
	applymovement FASTSHIPB1F_SAILOR2, FastShipB1FSailorBlocksLeftMovement
	moveobject FASTSHIPB1F_SAILOR1, 30, 6
	appear FASTSHIPB1F_SAILOR1
	pause 5
	disappear FASTSHIPB1F_SAILOR2
	end

FastShipB1FSailorBlocksRight:
	checkevent EVENT_FAST_SHIP_B1F_SAILOR_LEFT
	iftrue FastShipB1FAlreadyBlocked
	applymovement FASTSHIPB1F_SAILOR1, FastShipB1FSailorBlocksRightMovement
	moveobject FASTSHIPB1F_SAILOR2, 31, 6
	appear FASTSHIPB1F_SAILOR2
	pause 5
	disappear FASTSHIPB1F_SAILOR1
	end

FastShipB1FAlreadyBlocked:
	end

FastShipB1FSailorScript:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .FirstTime
	checkevent EVENT_FAST_SHIP_LAZY_SAILOR
	iftrue .LazySailor
	checkevent EVENT_FAST_SHIP_INFORMED_ABOUT_LAZY_SAILOR
	iftrue .AlreadyInformed
	writetext FastShipB1FOnDutySailorText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_INFORMED_ABOUT_LAZY_SAILOR
	clearevent EVENT_FAST_SHIP_CABINS_NNW_NNE_NE_SAILOR
	end

.AlreadyInformed:
	writetext FastShipB1FOnDutySailorRefusedText
	waitbutton
	closetext
	end

.LazySailor:
	writetext FastShipB1FOnDutySailorThanksText
	checkevent EVENT_FAST_SHIP_FOUND_GIRL
	iffalse .NotFoundGirl
	waitbutton
	closetext
	end

.NotFoundGirl:
	promptbutton
	writetext FastShipB1FOnDutySailorSawLittleGirlText
	waitbutton
	closetext
	end

.FirstTime:
	writetext FastShipB1FOnDutySailorDirectionsText
	waitbutton
	closetext
	end

TrainerSailorJeff:
	trainer SAILOR, JEFF, EVENT_BEAT_SAILOR_JEFF, SailorJeffSeenText, SailorJeffBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorJeffAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerDebra:
	trainer PICNICKER, DEBRA, EVENT_BEAT_PICNICKER_DEBRA, PicnickerDebraSeenText, PicnickerDebraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerDebraAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerFritz:
	trainer JUGGLER, FRITZ, EVENT_BEAT_JUGGLER_FRITZ, JugglerFritzSeenText, JugglerFritzBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerFritzAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorGarrett:
	trainer SAILOR, GARRETT, EVENT_BEAT_SAILOR_GARRETT, SailorGarrettSeenText, SailorGarrettBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorGarrettAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherJonah:
	trainer FISHER, JONAH, EVENT_BEAT_FISHER_JONAH, FisherJonahSeenText, FisherJonahBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherJonahAfterBattleText
	waitbutton
	closetext
	end

TrainerBlackbeltWai:
	trainer BLACKBELT_T, WAI, EVENT_BEAT_BLACKBELT_WAI, BlackbeltWaiSeenText, BlackbeltWaiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltWaiAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorKenneth:
	trainer SAILOR, KENNETH, EVENT_BEAT_SAILOR_KENNETH, SailorKennethSeenText, SailorKennethBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorKennethAfterBattleText
	waitbutton
	closetext
	end

TrainerTeacherShirley:
	trainer TEACHER, SHIRLEY, EVENT_BEAT_TEACHER_SHIRLEY, TeacherShirleySeenText, TeacherShirleyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherShirleyAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyNate:
	trainer SCHOOLBOY, NATE, EVENT_BEAT_SCHOOLBOY_NATE, SchoolboyNateSeenText, SchoolboyNateBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyNateAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyRicky:
	trainer SCHOOLBOY, RICKY, EVENT_BEAT_SCHOOLBOY_RICKY, SchoolboyRickySeenText, SchoolboyRickyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyRickyAfterBattleText
	waitbutton
	closetext
	end

FastShipB1FTrashcan:
	jumpstd TrashCanScript

FastShipB1FSailorBlocksRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	turn_head DOWN
	step_end

FastShipB1FSailorBlocksLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	turn_head DOWN
	step_end

FastShipB1FOnDutySailorText:
	text "Hé toi. Tu peux"
	line "chercher mon pote"
	cont "pour moi?"

	para "Il se balade dans"
	line "le coin. Toujours"
	cont "à rien faire!"

	para "J'aimerais le"
	line "trouver mais moi"
	cont "j'ai du taf."
	done

FastShipB1FOnDutySailorRefusedText:
	text "Oh, ben..."

	para "Le CAPITAINE va"
	line "être furax..."
	done

FastShipB1FOnDutySailorThanksText:
	text "Merci toi!"
	line "J'lui ai passé un"

	para "savon des familles"
	line "et il va bosser"
	cont "maintenant."
	done

FastShipB1FOnDutySailorSawLittleGirlText:
	text "Une fillette?"

	para "Je crois l'avoir"
	line "vue passer."
	done

FastShipB1FOnDutySailorDirectionsText:
	text "La salle à manger"
	line "est tout droit."

	para "Les escaliers au"
	line "bout mènent à la"
	cont "cabine du"
	cont "CAPITAINE."
	done

SailorJeffSeenText:
	text "Y'a rien de tel"
	line "qu'un combat pen-"
	cont "dant la pause."
	done

SailorJeffBeatenText:
	text "Finie la pause!"
	done

SailorJeffAfterBattleText:
	text "Faut que je m'en-"
	line "traîne sérieux"
	cont "pour progresser."
	done

PicnickerDebraSeenText:
	text "J'm'ennuie."
	line "...Combat?"
	done

PicnickerDebraBeatenText:
	text "Woah. Cool."
	done

PicnickerDebraAfterBattleText:
	text "SAFRANIA, CELADO-"
	line "POLE... On dit"

	para "qu'il y a plein"
	line "de grandes villes"
	cont "à KANTO."
	done

JugglerFritzSeenText:
	text "Beuh..... J'ai"
	line "le mal de mer!"
	done

JugglerFritzBeatenText:
	text "J'peux plus"
	line "bouger..."
	done

JugglerFritzAfterBattleText:
	text "La mer c'est fini"
	line "pour moi. Je vais"

	para "prendre le TRAIN"
	line "MAGNET la prochai-"
	cont "ne fois."
	done

SailorGarrettSeenText:
	text "Nous les marins,"
	line "on rigole pas!"
	done

SailorGarrettBeatenText:
	text "Ha ha ha ha ha."
	line "Perdu."
	done

SailorGarrettAfterBattleText:
	text "Les passagers"
	line "sont de CARMIN"

	para "SUR MER et aussi"
	line "d'OLIVILLE."
	done

FisherJonahSeenText:
	text "On est en mer"
	line "mais on peut pas"
	cont "pêcher!"

	para "C'est naze!"
	line "Allez...COMBAT!"
	done

FisherJonahBeatenText:
	text "T'es naze..."
	line "J't'aime pas."
	done

FisherJonahAfterBattleText:
	text "Je vais pêcher au"
	line "port de CARMIN."
	done

BlackbeltWaiSeenText:
	text "Je me muscle les"
	line "jambes avec le"
	cont "tangage du bateau!"
	done

BlackbeltWaiBeatenText:
	text "Je me suis"
	line "tout planté!"
	done

BlackbeltWaiAfterBattleText:
	text "Je n'ai pas trouvé"
	line "le ROI du KARATE à"
	cont "JOHTO."

	para "On dit qu'il s'en-"
	line "traîne dans une"
	cont "caverne."
	done

SailorKennethSeenText:
	text "J'suis un marin!"

	para "J'entraîne aussi"
	line "des #MON pour"
	cont "devenir un boss!"
	done

SailorKennethBeatenText:
	text "J'suis un nul..."
	done

SailorKennethAfterBattleText:
	text "Tant de BADGES!"
	line "Tu as alors battu"

	para "les CHAMPIONS des"
	line "ARENES..."

	para "Normal que tu sois"
	line "balèze!"
	done

TeacherShirleySeenText:
	text "Touche pas à mes"
	line "élèves!"
	done

TeacherShirleyBeatenText:
	text "Aaack!"
	done

TeacherShirleyAfterBattleText:
	text "On va tous aux"
	line "RUINES près de"
	cont "MAUVILLE."
	done

SchoolboyNateSeenText:
	text "Tu connais les"
	line "RUINES d'ALPHA?"
	done

SchoolboyNateBeatenText:
	text "Yaargh!"
	done

SchoolboyNateAfterBattleText:
	text "Les radios captent"
	line "d'étranges signaux"
	cont "dans les RUINES."
	done

SchoolboyRickySeenText:
	text "Il y a d'étranges"
	line "panneaux dans les"
	cont "RUINES d'ALPHA."
	done

SchoolboyRickyBeatenText:
	text "Yaaaaaah!"
	done

SchoolboyRickyAfterBattleText:
	text "J'ai lu qu'il y a"
	line "quatre panneaux"
	cont "de pierre."
	done

FastShipB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 11, FAST_SHIP_1F, 11
	warp_event 31, 13, FAST_SHIP_1F, 12

	def_coord_events
	coord_event 30,  7, SCENE_FASTSHIPB1F_SAILOR_BLOCKS, FastShipB1FSailorBlocksLeft
	coord_event 31,  7, SCENE_FASTSHIPB1F_SAILOR_BLOCKS, FastShipB1FSailorBlocksRight

	def_bg_events
	bg_event 27,  9, BGEVENT_READ, FastShipB1FTrashcan

	def_object_events
	object_event 30,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FastShipB1FSailorScript, EVENT_FAST_SHIP_B1F_SAILOR_LEFT
	object_event 31,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FastShipB1FSailorScript, EVENT_FAST_SHIP_B1F_SAILOR_RIGHT
	object_event  9, 11, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorJeff, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  6,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerDebra, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event 26,  9, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerJugglerFritz, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event 17,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSailorGarrett, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 25,  8, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherJonah, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 15, 11, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltWai, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 23,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSailorKenneth, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  9, 11, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerTeacherShirley, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event 14,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyNate, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event 14, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyRicky, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
