Route13_MapScriptHeader: ; 0x1a2430
	; trigger count
	db 0

	; callback count
	db 0
; 0x1a2432

TrainerPokefanmAlex: ; 0x1a2432
	; bit/flag number
	dw $4d8

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
; 0x1a243e

PokefanmAlexScript: ; 0x1a243e
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a24e3
	closetext
	loadmovesprites
	end
; 0x1a2446

TrainerPokefanmJoshua: ; 0x1a2446
	; bit/flag number
	dw $4d0

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
; 0x1a2452

PokefanmJoshuaScript: ; 0x1a2452
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a254f
	closetext
	loadmovesprites
	end
; 0x1a245a

TrainerBird_keeperPerry: ; 0x1a245a
	; bit/flag number
	dw $409

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
; 0x1a2466

Bird_keeperPerryScript: ; 0x1a2466
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a25db
	closetext
	loadmovesprites
	end
; 0x1a246e

TrainerBird_keeperBret: ; 0x1a246e
	; bit/flag number
	dw $40a

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
; 0x1a247a

Bird_keeperBretScript: ; 0x1a247a
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a2662
	closetext
	loadmovesprites
	end
; 0x1a2482

TrainerHikerKenny: ; 0x1a2482
	; bit/flag number
	dw $533

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
; 0x1a248e

HikerKennyScript: ; 0x1a248e
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a26c2
	closetext
	loadmovesprites
	end
; 0x1a2496

MapRoute13Signpost0Script: ; 0x1a2496
	jumptext UnknownText_0x1a271c
; 0x1a2499

MapRoute13Signpost1Script: ; 0x1a2499
	jumptext UnknownText_0x1a275b
; 0x1a249c

MapRoute13Signpost2Script: ; 0x1a249c
	jumptext UnknownText_0x1a277d
; 0x1a249f

MapRoute13SignpostItem3: ; 0x1a249f
	dw $00f4
	db CALCIUM
	
; 0x1a24a2

PokefanmAlexSeenText: ; 0x1a24a2
	text "Bow down before my"
	line "regal #MON!"
	done
; 0x1a24c2

PokefanmAlexBeatenText: ; 0x1a24c2
	text "How… How dare you"
	line "mock royalty!"
	done
; 0x1a24e3

UnknownText_0x1a24e3: ; 0x1a24e3
	text "Doesn't everyone"
	line "wish to someday be"
	cont "a king?"
	done
; 0x1a250f

PokefanmJoshuaSeenText: ; 0x1a250f
	text "Nihihi! Would you"
	line "like to battle my"
	cont "PIKACHU gang?"
	done
; 0x1a2542

PokefanmJoshuaBeatenText: ; 0x1a2542
	text "PI-PIKACHU!"
	done
; 0x1a254f

UnknownText_0x1a254f: ; 0x1a254f
	text "You look like you"
	line "have many #MON,"

	para "but PIKACHU is"
	line "still the best."
	done
; 0x1a2591

Bird_keeperPerrySeenText: ; 0x1a2591
	text "Agility is the key"
	line "attribute of bird"
	cont "#MON."
	done
; 0x1a25bd

Bird_keeperPerryBeatenText: ; 0x1a25bd
	text "You beat me with"
	line "your speed…"
	done
; 0x1a25db

UnknownText_0x1a25db: ; 0x1a25db
	text "Your #MON are"
	line "remarkably well-"
	cont "trained."
	done
; 0x1a2604

Bird_keeperBretSeenText: ; 0x1a2604
	text "Check out my #-"
	line "MON. Just look at"

	para "their coloring and"
	line "their plumage."
	done
; 0x1a2649

Bird_keeperBretBeatenText: ; 0x1a2649
	text "Shoot!"
	line "Not good enough!"
	done
; 0x1a2662

UnknownText_0x1a2662: ; 0x1a2662
	text "If you groom them,"
	line "#MON get happy."
	done
; 0x1a2686

HikerKennySeenText: ; 0x1a2686
	text "I should go to"
	line "ROCK TUNNEL to get"
	cont "myself an ONIX."
	done
; 0x1a26b9

HikerKennyBeatenText: ; 0x1a26b9
	text "I lost…"
	done
; 0x1a26c2

UnknownText_0x1a26c2: ; 0x1a26c2
	text "Geological fea-"
	line "tures don't appear"
	cont "to change."

	para "But they actually"
	line "change, little by"
	cont "little."
	done
; 0x1a271c

UnknownText_0x1a271c: ; 0x1a271c
	text "TRAINER TIPS"

	para "Look! Right there,"
	line "at the left side"
	cont "of the post."
	done
; 0x1a275b

UnknownText_0x1a275b: ; 0x1a275b
	text "ROUTE 13"

	para "NORTH TO SILENCE"
	line "BRIDGE"
	done
; 0x1a277d

UnknownText_0x1a277d: ; 0x1a277d
	text "NORTH TO LAVENDER"
	line "TOWN"

	para "WEST TO FUCHSIA"
	line "CITY"
	done
; 0x1a27aa

Route13_MapEventHeader: ; 0x1a27aa
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
	person_event SPRITE_YOUNGSTER, 10, 46, $6, $0, 255, 255, $92, 2, TrainerBird_keeperPerry, $ffff
	person_event SPRITE_YOUNGSTER, 10, 47, $6, $0, 255, 255, $92, 2, TrainerBird_keeperBret, $ffff
	person_event SPRITE_POKEFAN_M, 12, 36, $8, $0, 255, 255, $82, 3, TrainerPokefanmJoshua, $ffff
	person_event SPRITE_POKEFAN_M, 14, 18, $8, $0, 255, 255, $82, 4, TrainerHikerKenny, $ffff
	person_event SPRITE_POKEFAN_M, 10, 29, $9, $0, 255, 255, $82, 4, TrainerPokefanmAlex, $ffff
; 0x1a2805
