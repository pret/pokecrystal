const_value set 2
	const ROUTE13_YOUNGSTER1
	const ROUTE13_YOUNGSTER2
	const ROUTE13_POKEFAN_M1
	const ROUTE13_POKEFAN_M2
	const ROUTE13_POKEFAN_M3

Route13_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerPokefanmAlex:
	trainer EVENT_BEAT_POKEFANM_ALEX, POKEFANM, ALEX, PokefanmAlexSeenText, PokefanmAlexBeatenText, 0, PokefanmAlexScript

PokefanmAlexScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a24e3
	waitbutton
	closetext
	end

TrainerPokefanmJoshua:
	trainer EVENT_BEAT_POKEFANM_JOSHUA, POKEFANM, JOSHUA, PokefanmJoshuaSeenText, PokefanmJoshuaBeatenText, 0, PokefanmJoshuaScript

PokefanmJoshuaScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a254f
	waitbutton
	closetext
	end

TrainerBird_keeperPerry:
	trainer EVENT_BEAT_BIRD_KEEPER_PERRY, BIRD_KEEPER, PERRY, Bird_keeperPerrySeenText, Bird_keeperPerryBeatenText, 0, Bird_keeperPerryScript

Bird_keeperPerryScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a25db
	waitbutton
	closetext
	end

TrainerBird_keeperBret:
	trainer EVENT_BEAT_BIRD_KEEPER_BRET, BIRD_KEEPER, BRET, Bird_keeperBretSeenText, Bird_keeperBretBeatenText, 0, Bird_keeperBretScript

Bird_keeperBretScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a2662
	waitbutton
	closetext
	end

TrainerHikerKenny:
	trainer EVENT_BEAT_HIKER_KENNY, HIKER, KENNY, HikerKennySeenText, HikerKennyBeatenText, 0, HikerKennyScript

HikerKennyScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a26c2
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
	dwb EVENT_ROUTE_13_HIDDEN_CALCIUM, CALCIUM


PokefanmAlexSeenText:
	text "Bow down before my"
	line "regal #MON!"
	done

PokefanmAlexBeatenText:
	text "How… How dare you"
	line "mock royalty!"
	done

UnknownText_0x1a24e3:
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

UnknownText_0x1a254f:
	text "You look like you"
	line "have many #MON,"

	para "but PIKACHU is"
	line "still the best."
	done

Bird_keeperPerrySeenText:
	text "Agility is the key"
	line "attribute of bird"
	cont "#MON."
	done

Bird_keeperPerryBeatenText:
	text "You beat me with"
	line "your speed…"
	done

UnknownText_0x1a25db:
	text "Your #MON are"
	line "remarkably well-"
	cont "trained."
	done

Bird_keeperBretSeenText:
	text "Check out my #-"
	line "MON. Just look at"

	para "their coloring and"
	line "their plumage."
	done

Bird_keeperBretBeatenText:
	text "Shoot!"
	line "Not good enough!"
	done

UnknownText_0x1a2662:
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

UnknownText_0x1a26c2:
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

Route13_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 0

.XYTriggers:
	db 0

.Signposts:
	db 4
	signpost 13, 29, SIGNPOST_READ, Route13TrainerTips
	signpost 11, 41, SIGNPOST_READ, Route13Sign
	signpost 13, 17, SIGNPOST_READ, Route13DirectionsSign
	signpost 13, 30, SIGNPOST_ITEM, Route13HiddenCalcium

.PersonEvents:
	db 5
	person_event SPRITE_YOUNGSTER, 6, 42, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerBird_keeperPerry, -1
	person_event SPRITE_YOUNGSTER, 6, 43, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerBird_keeperBret, -1
	person_event SPRITE_POKEFAN_M, 8, 32, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerPokefanmJoshua, -1
	person_event SPRITE_POKEFAN_M, 10, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 4, TrainerHikerKenny, -1
	person_event SPRITE_POKEFAN_M, 6, 25, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 4, TrainerPokefanmAlex, -1
