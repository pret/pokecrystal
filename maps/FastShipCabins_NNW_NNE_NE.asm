	object_const_def
	const FASTSHIPCABINS_NNW_NNE_NE_COOLTRAINER_M
	const FASTSHIPCABINS_NNW_NNE_NE_COOLTRAINER_F
	const FASTSHIPCABINS_NNW_NNE_NE_SUPER_NERD
	const FASTSHIPCABINS_NNW_NNE_NE_POKEFAN_M
	const FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	const FASTSHIPCABINS_NNW_NNE_NE_GENTLEMAN
	const FASTSHIPCABINS_NNW_NNE_NE_PHARMACIST

FastShipCabins_NNW_NNE_NE_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerCooltrainermSean:
	trainer COOLTRAINERM, SEAN, EVENT_BEAT_COOLTRAINERM_SEAN, CooltrainermSeanSeenText, CooltrainermSeanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermSeanAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfCarol:
	trainer COOLTRAINERF, CAROL, EVENT_BEAT_COOLTRAINERF_CAROL, CooltrainerfCarolSeenText, CooltrainerfCarolBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfCarolAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacEthan:
	trainer POKEMANIAC, ETHAN, EVENT_BEAT_POKEMANIAC_ETHAN, PokemaniacEthanSeenText, PokemaniacEthanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacEthanAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerNoland:
	trainer HIKER, NOLAND, EVENT_BEAT_HIKER_NOLAND, HikerNolandSeenText, HikerNolandBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerNolandAfterBattleText
	waitbutton
	closetext
	end

TrainerGentlemanEdward:
	trainer GENTLEMAN, EDWARD, EVENT_BEAT_GENTLEMAN_EDWARD, GentlemanEdwardSeenText, GentlemanEdwardBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanEdwardAfterBattleText
	waitbutton
	closetext
	end

TrainerBurglarCorey:
	trainer BURGLAR, COREY, EVENT_BEAT_BURGLAR_COREY, BurglarCoreySeenText, BurglarCoreyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BurglarCoreyAfterBattleText
	waitbutton
	closetext
	end

FastShipLazySailorScript:
	playmusic MUSIC_HIKER_ENCOUNTER
	faceplayer
	opentext
	writetext SailorStanlySeenText
	waitbutton
	closetext
	winlosstext SailorStanlyBeatenText, 0
	loadtrainer SAILOR, STANLY
	startbattle
	reloadmap
	special HealParty
	setevent EVENT_BEAT_SAILOR_STANLY
	opentext
	writetext SailorStanlyAfterBattleText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_LAZY_SAILOR
	setmapscene FAST_SHIP_B1F, SCENE_FASTSHIPB1F_NOOP
	readvar VAR_FACING
	ifequal RIGHT, .Movement2
	applymovement FASTSHIPCABINS_NNW_NNE_NE_SAILOR, FastShipLazySailorLeavesMovement1
	playsound SFX_EXIT_BUILDING
	disappear FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	waitsfx
	end

.Movement2:
	applymovement FASTSHIPCABINS_NNW_NNE_NE_SAILOR, FastShipLazySailorLeavesMovement2
	playsound SFX_EXIT_BUILDING
	disappear FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	waitsfx
	end

FastShipCabins_NNW_NNE_NETrashcan:
	jumpstd TrashCanScript

FastShipLazySailorLeavesMovement1:
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

FastShipLazySailorLeavesMovement2:
	step DOWN
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step_end

CooltrainermSeanSeenText:
	text "Je vais à KANTO"
	line "pour m'entraîner."
	done

CooltrainermSeanBeatenText:
	text "J'voulais gagner!"
	done

CooltrainermSeanAfterBattleText:
	text "Les dresseurs de"
	line "JOHTO peuvent af-"
	cont "fronter les CHAM-"
	cont "PIONS de KANTO."
	done

CooltrainerfCarolSeenText:
	text "J'm'entraîne pour"
	line "être la meilleure!"
	done

CooltrainerfCarolBeatenText:
	text "Pourquoi?"
	done

CooltrainerfCarolAfterBattleText:
	text "J'te battrai un"
	line "jour! Oh oui!"
	done

PokemaniacEthanSeenText:
	text "Tu connais PETRA?"
	line "C'est un super DJ"
	cont "de KANTO."
	done

PokemaniacEthanBeatenText:
	text "Gyaaaah!"
	done

PokemaniacEthanAfterBattleText:
	text "PETRA est cool"
	line "mais LULA est top!"

	para "J'veux connaître"
	line "les stations de"
	cont "radio de JOHTO!"
	done

HikerNolandSeenText:
	text "Ca va?"
	line "Alors...COMBAT!"
	done

HikerNolandBeatenText:
	text "T'es trop, toi!"
	line "Pfouiii!"
	done

HikerNolandAfterBattleText:
	text "Tu crois qu'il y a"
	line "de belles monta-"
	cont "gnes à KANTO?"
	done

SailorStanlySeenText:
	text "Ouaip. Moi j'suis"
	line "un marin."

	para "Un vrai de vrai."
	line "Pur boeuf!"

	para "J'suis grand."
	line "J'suis beau."
	cont "Je sens le sable"
	cont "chaud."

	para "Oh! Tu m'écoutes?"
	line "...COMBAT!"
	done

SailorStanlyBeatenText:
	text "Heu... Comment?"
	line "De quoi?"
	done

SailorStanlyAfterBattleText:
	text "Dans la mariiine,"
	line "on n'est pas des"
	cont "p'tites filles!"
	cont "Dans la mariiine!"
	done

GentlemanEdwardSeenText:
	text "J'ai perdu un truc"
	line "super important..."
	done

GentlemanEdwardBeatenText:
	text "J'le...trouve..."
	line "...pas!!!"
	done

GentlemanEdwardAfterBattleText:
	text "Je laisse tomber."
	line "Ce n'est pas la"

	para "peine de chercher."
	line "Oublie!"
	done

BurglarCoreySeenText:
	text "Ouaiiis!"
	line "Le bol!"
	done

BurglarCoreyBeatenText:
	text "Ooooh!"
	line "Pas d'bol!"
	done

BurglarCoreyAfterBattleText:
	text "J'ai trouvé une"
	line "belle pièce."

	para "Quelqu'un a dû"
	line "la perdre..."
	done

FastShipCabins_NNW_NNE_NE_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  0, FAST_SHIP_1F, 2
	warp_event  2, 12, FAST_SHIP_1F, 3
	warp_event  2, 24, FAST_SHIP_1F, 4

	def_coord_events

	def_bg_events
	bg_event  6, 13, BGEVENT_READ, FastShipCabins_NNW_NNE_NETrashcan
	bg_event  7, 19, BGEVENT_READ, FastShipCabins_NNW_NNE_NETrashcan
	bg_event  7, 31, BGEVENT_READ, FastShipCabins_NNW_NNE_NETrashcan

	def_object_events
	object_event  4,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermSean, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  1,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfCarol, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  1,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacEthan, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  4, 17, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerNoland, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  4, 26, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FastShipLazySailorScript, EVENT_FAST_SHIP_CABINS_NNW_NNE_NE_SAILOR
	object_event  7, 30, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerGentlemanEdward, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  2, 30, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerBurglarCorey, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
