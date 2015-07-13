Route13_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

TrainerPokefanmAlex:
	; bit/flag number
	dw EVENT_BEAT_POKEFANM_ALEX

	; trainer group && trainer id
	db POKEFANM, ALEX

	; text when seen
	dw PokefanmAlexSeenText

	; text when trainer beaten
	dw PokefanmAlexBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokefanmAlexScript

PokefanmAlexScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a24e3
	closetext
	loadmovesprites
	end

TrainerPokefanmJoshua:
	; bit/flag number
	dw EVENT_BEAT_POKEFANM_JOSHUA

	; trainer group && trainer id
	db POKEFANM, JOSHUA

	; text when seen
	dw PokefanmJoshuaSeenText

	; text when trainer beaten
	dw PokefanmJoshuaBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokefanmJoshuaScript

PokefanmJoshuaScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a254f
	closetext
	loadmovesprites
	end

TrainerBird_keeperPerry:
	; bit/flag number
	dw EVENT_BEAT_BIRD_KEEPER_PERRY

	; trainer group && trainer id
	db BIRD_KEEPER, PERRY

	; text when seen
	dw Bird_keeperPerrySeenText

	; text when trainer beaten
	dw Bird_keeperPerryBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bird_keeperPerryScript

Bird_keeperPerryScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a25db
	closetext
	loadmovesprites
	end

TrainerBird_keeperBret:
	; bit/flag number
	dw EVENT_BEAT_BIRD_KEEPER_BRET

	; trainer group && trainer id
	db BIRD_KEEPER, BRET

	; text when seen
	dw Bird_keeperBretSeenText

	; text when trainer beaten
	dw Bird_keeperBretBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bird_keeperBretScript

Bird_keeperBretScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a2662
	closetext
	loadmovesprites
	end

TrainerHikerKenny:
	; bit/flag number
	dw EVENT_BEAT_HIKER_KENNY

	; trainer group && trainer id
	db HIKER, KENNY

	; text when seen
	dw HikerKennySeenText

	; text when trainer beaten
	dw HikerKennyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw HikerKennyScript

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
	dw $00f4
	db CALCIUM
	

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

	; warps
	db 0

	; xy triggers
	db 0

	; signposts
	db 4
	signpost 13, 29, $0, MapRoute13Signpost0Script
	signpost 11, 41, $0, MapRoute13Signpost1Script
	signpost 13, 17, $0, MapRoute13Signpost2Script
	signpost 13, 30, $7, MapRoute13SignpostItem3

	; people-events
	db 5
	person_event SPRITE_YOUNGSTER, 10, 46, $6, $0, 255, 255, $92, 2, TrainerBird_keeperPerry, -1
	person_event SPRITE_YOUNGSTER, 10, 47, $6, $0, 255, 255, $92, 2, TrainerBird_keeperBret, -1
	person_event SPRITE_POKEFAN_M, 12, 36, $8, $0, 255, 255, $82, 3, TrainerPokefanmJoshua, -1
	person_event SPRITE_POKEFAN_M, 14, 18, $8, $0, 255, 255, $82, 4, TrainerHikerKenny, -1
	person_event SPRITE_POKEFAN_M, 10, 29, $9, $0, 255, 255, $82, 4, TrainerPokefanmAlex, -1
