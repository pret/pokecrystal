	object_const_def
	const ROUTE13_YOUNGSTER1
	const ROUTE13_YOUNGSTER2
	const ROUTE13_POKEFAN_M1
	const ROUTE13_POKEFAN_M2
	const ROUTE13_POKEFAN_M3

Route13_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerPokefanmAlex:
	trainer POKEFANM, ALEX, EVENT_BEAT_POKEFANM_ALEX, PokefanmAlexSeenText, PokefanmAlexBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmAlexAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmJoshua:
	trainer POKEFANM, JOSHUA, EVENT_BEAT_POKEFANM_JOSHUA, PokefanmJoshuaSeenText, PokefanmJoshuaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmJoshuaAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperPerry:
	trainer BIRD_KEEPER, PERRY, EVENT_BEAT_BIRD_KEEPER_PERRY, BirdKeeperPerrySeenText, BirdKeeperPerryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperPerryAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperBret:
	trainer BIRD_KEEPER, BRET, EVENT_BEAT_BIRD_KEEPER_BRET, BirdKeeperBretSeenText, BirdKeeperBretBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBretAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerKenny:
	trainer HIKER, KENNY, EVENT_BEAT_HIKER_KENNY, HikerKennySeenText, HikerKennyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerKennyAfterBattleText
	waitbutton
	closetext
	end

Route13TrainerTips:
	jumptext Route13TrainerTipsText

Route13Sign:
	jumptext Route13SignText

Route13DirectionsSign:
	jumptext Route13DirectionsSignText

Route13HiddenCalcium:
	hiddenitem CALCIUM, EVENT_ROUTE_13_HIDDEN_CALCIUM

PokefanmAlexSeenText:
	text "A genoux devant"
	line "mes #MON!"
	done

PokefanmAlexBeatenText:
	text "Comment oses-tu???"
	line "Sacrilège!"
	done

PokefanmAlexAfterBattleText:
	text "Un jour je serai"
	line "roi! Oh que oui!"
	cont "Ha ha ha ha ha!"
	done

PokefanmJoshuaSeenText:
	text "Gnihihi! Tu veux"
	line "te mesurer à mon"
	cont "gang PIKACHU?"
	done

PokefanmJoshuaBeatenText:
	text "PI-PIKACHU!"
	done

PokefanmJoshuaAfterBattleText:
	text "Tu dois avoir"
	line "beaucoup de #-"

	para "MON, mais PIKACHU"
	line "est le meilleur."
	done

BirdKeeperPerrySeenText:
	text "L'agilité est LA"
	line "caractéristique"
	cont "des #MON"
	cont "oiseaux."
	done

BirdKeeperPerryBeatenText:
	text "Ta vitesse m'a"
	line "blousé..."
	done

BirdKeeperPerryAfterBattleText:
	text "Tes #MON sont"
	line "très bien entraî-"
	cont "nés."
	done

BirdKeeperBretSeenText:
	text "Mate donc mes bô"
	line "#MON. Regarde"

	para "leur joli plumage."
	line "C'est trop cool."
	done

BirdKeeperBretBeatenText:
	text "Naaaan!"
	line "Pas glop!"
	done

BirdKeeperBretAfterBattleText:
	text "Occupe-toi de tes"
	line "#MON et ils"
	cont "seront heureux."
	done

HikerKennySeenText:
	text "Je vais passer à"
	line "la GROTTE pour"
	cont "choper un ONIX."
	done

HikerKennyBeatenText:
	text "Perdu..."
	done

HikerKennyAfterBattleText:
	text "La terre change..."
	line "Petit à petit."

	para "Les montagnes, les"
	line "paysages... Tout"
	cont "évolue."
	done

Route13TrainerTipsText:
	text "ASTUCE"

	para "Regardez à gauche"
	line "de cette pancarte."
	done

Route13SignText:
	text "ROUTE 13"

	para "Nord du PONT du"
	line "SILENCE"
	done

Route13DirectionsSignText:
	text "NORD: LAVANVILLE"
	line "OUEST: PARMANIE"
	done

Route13_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 29, 13, BGEVENT_READ, Route13TrainerTips
	bg_event 41, 11, BGEVENT_READ, Route13Sign
	bg_event 17, 13, BGEVENT_READ, Route13DirectionsSign
	bg_event 30, 13, BGEVENT_ITEM, Route13HiddenCalcium

	def_object_events
	object_event 42,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperPerry, -1
	object_event 43,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperBret, -1
	object_event 32,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmJoshua, -1
	object_event 14, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerHikerKenny, -1
	object_event 25,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanmAlex, -1
