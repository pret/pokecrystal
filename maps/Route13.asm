Route13_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerPokefanmAlex:
	trainer EVENT_BEAT_POKEFANM_ALEX, POKEFANM, ALEX, PokefanmAlexSeenText, PokefanmAlexBeatenText, $0000, PokefanmAlexScript

PokefanmAlexScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a24e3
	closetext
	loadmovesprites
	end

TrainerPokefanmJoshua:
	trainer EVENT_BEAT_POKEFANM_JOSHUA, POKEFANM, JOSHUA, PokefanmJoshuaSeenText, PokefanmJoshuaBeatenText, $0000, PokefanmJoshuaScript

PokefanmJoshuaScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a254f
	closetext
	loadmovesprites
	end

TrainerBird_keeperPerry:
	trainer EVENT_BEAT_BIRD_KEEPER_PERRY, BIRD_KEEPER, PERRY, Bird_keeperPerrySeenText, Bird_keeperPerryBeatenText, $0000, Bird_keeperPerryScript

Bird_keeperPerryScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a25db
	closetext
	loadmovesprites
	end

TrainerBird_keeperBret:
	trainer EVENT_BEAT_BIRD_KEEPER_BRET, BIRD_KEEPER, BRET, Bird_keeperBretSeenText, Bird_keeperBretBeatenText, $0000, Bird_keeperBretScript

Bird_keeperBretScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a2662
	closetext
	loadmovesprites
	end

TrainerHikerKenny:
	trainer EVENT_BEAT_HIKER_KENNY, HIKER, KENNY, HikerKennySeenText, HikerKennyBeatenText, $0000, HikerKennyScript

HikerKennyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a26c2
	closetext
	loadmovesprites
	end

MapRoute13Signpost0Script:
	jumptext UnknownText_0x1a271c

MapRoute13Signpost1Script:
	jumptext UnknownText_0x1a275b

MapRoute13Signpost2Script:
	jumptext UnknownText_0x1a277d

MapRoute13SignpostItem3:
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

UnknownText_0x1a271c:
	text "TRAINER TIPS"

	para "Look! Right there,"
	line "at the left side"
	cont "of the post."
	done

UnknownText_0x1a275b:
	text "ROUTE 13"

	para "NORTH TO SILENCE"
	line "BRIDGE"
	done

UnknownText_0x1a277d:
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
	signpost 13, 29, SIGNPOST_READ, MapRoute13Signpost0Script
	signpost 11, 41, SIGNPOST_READ, MapRoute13Signpost1Script
	signpost 13, 17, SIGNPOST_READ, MapRoute13Signpost2Script
	signpost 13, 30, SIGNPOST_ITEM, MapRoute13SignpostItem3

.PersonEvents:
	db 5
	person_event SPRITE_YOUNGSTER, 10, 46, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 2, TrainerBird_keeperPerry, -1
	person_event SPRITE_YOUNGSTER, 10, 47, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 2, TrainerBird_keeperBret, -1
	person_event SPRITE_POKEFAN_M, 12, 36, OW_LEFT | $0, $0, -1, -1, (PAL_OW_RED << 4) | $82, 3, TrainerPokefanmJoshua, -1
	person_event SPRITE_POKEFAN_M, 14, 18, OW_LEFT | $0, $0, -1, -1, (PAL_OW_RED << 4) | $82, 4, TrainerHikerKenny, -1
	person_event SPRITE_POKEFAN_M, 10, 29, OW_LEFT | $1, $0, -1, -1, (PAL_OW_RED << 4) | $82, 4, TrainerPokefanmAlex, -1
