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
	text "Bow down before my"
	line "regal #MON!"
	done

PokefanmAlexBeatenText:
	text "How… How dare you"
	line "mock royalty!"
	done

PokefanmAlexAfterBattleText:
	text "Doesn't everyone"
	line "wish to someday be"
	cont "a king?"
	done

PokefanmJoshuaSeenText:
	text "Nihihi! Would you"
	line "like to battle my"
	cont "PIKACHU gang?"
	done

PokefanmJoshuaBeatenText:
	text "PI-PIKACHU!"
	done

PokefanmJoshuaAfterBattleText:
	text "You look like you"
	line "have many #MON,"

	para "but PIKACHU is"
	line "still the best."
	done

BirdKeeperPerrySeenText:
	text "Agility is the key"
	line "attribute of bird"
	cont "#MON."
	done

BirdKeeperPerryBeatenText:
	text "You beat me with"
	line "your speed…"
	done

BirdKeeperPerryAfterBattleText:
	text "Your #MON are"
	line "remarkably well-"
	cont "trained."
	done

BirdKeeperBretSeenText:
	text "Check out my #-"
	line "MON. Just look at"

	para "their coloring and"
	line "their plumage."
	done

BirdKeeperBretBeatenText:
	text "Shoot!"
	line "Not good enough!"
	done

BirdKeeperBretAfterBattleText:
	text "If you groom them,"
	line "#MON get happy."
	done

HikerKennySeenText:
	text "I should go to"
	line "ROCK TUNNEL to get"
	cont "myself an ONIX."
	done

HikerKennyBeatenText:
	text "I lost…"
	done

HikerKennyAfterBattleText:
	text "Geological fea-"
	line "tures don't appear"
	cont "to change."

	para "But they actually"
	line "change, little by"
	cont "little."
	done

Route13TrainerTipsText:
	text "TRAINER TIPS"

	para "Look! Right there,"
	line "at the left side"
	cont "of the post."
	done

Route13SignText:
	text "ROUTE 13"

	para "NORTH TO SILENCE"
	line "BRIDGE"
	done

Route13DirectionsSignText:
	text "NORTH TO LAVENDER"
	line "TOWN"

	para "WEST TO FUCHSIA"
	line "CITY"
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
