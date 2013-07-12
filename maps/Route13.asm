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
	2writetext UnknownText_0x1a24e3
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
	2writetext UnknownText_0x1a254f
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
	2writetext UnknownText_0x1a25db
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
	2writetext UnknownText_0x1a2662
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
	2writetext UnknownText_0x1a26c2
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
	db $0, "Bow down before my", $4f
	db "regal #MON!", $57
; 0x1a24c2

PokefanmAlexBeatenText: ; 0x1a24c2
	db $0, "How… How dare you", $4f
	db "mock royalty!", $57
; 0x1a24e3

UnknownText_0x1a24e3: ; 0x1a24e3
	db $0, "Doesn't everyone", $4f
	db "wish to someday be", $55
	db "a king?", $57
; 0x1a250f

PokefanmJoshuaSeenText: ; 0x1a250f
	db $0, "Nihihi! Would you", $4f
	db "like to battle my", $55
	db "PIKACHU gang?", $57
; 0x1a2542

PokefanmJoshuaBeatenText: ; 0x1a2542
	db $0, "PI-PIKACHU!", $57
; 0x1a254f

UnknownText_0x1a254f: ; 0x1a254f
	db $0, "You look like you", $4f
	db "have many #MON,", $51
	db "but PIKACHU is", $4f
	db "still the best.", $57
; 0x1a2591

Bird_keeperPerrySeenText: ; 0x1a2591
	db $0, "Agility is the key", $4f
	db "attribute of bird", $55
	db "#MON.", $57
; 0x1a25bd

Bird_keeperPerryBeatenText: ; 0x1a25bd
	db $0, "You beat me with", $4f
	db "your speed…", $57
; 0x1a25db

UnknownText_0x1a25db: ; 0x1a25db
	db $0, "Your #MON are", $4f
	db "remarkably well-", $55
	db "trained.", $57
; 0x1a2604

Bird_keeperBretSeenText: ; 0x1a2604
	db $0, "Check out my #-", $4f
	db "MON. Just look at", $51
	db "their coloring and", $4f
	db "their plumage.", $57
; 0x1a2649

Bird_keeperBretBeatenText: ; 0x1a2649
	db $0, "Shoot!", $4f
	db "Not good enough!", $57
; 0x1a2662

UnknownText_0x1a2662: ; 0x1a2662
	db $0, "If you groom them,", $4f
	db "#MON get happy.", $57
; 0x1a2686

HikerKennySeenText: ; 0x1a2686
	db $0, "I should go to", $4f
	db "ROCK TUNNEL to get", $55
	db "myself an ONIX.", $57
; 0x1a26b9

HikerKennyBeatenText: ; 0x1a26b9
	db $0, "I lost…", $57
; 0x1a26c2

UnknownText_0x1a26c2: ; 0x1a26c2
	db $0, "Geological fea-", $4f
	db "tures don't appear", $55
	db "to change.", $51
	db "But they actually", $4f
	db "change, little by", $55
	db "little.", $57
; 0x1a271c

UnknownText_0x1a271c: ; 0x1a271c
	db $0, "TRAINER TIPS", $51
	db "Look! Right there,", $4f
	db "at the left side", $55
	db "of the post.", $57
; 0x1a275b

UnknownText_0x1a275b: ; 0x1a275b
	db $0, "ROUTE 13", $51
	db "NORTH TO SILENCE", $4f
	db "BRIDGE", $57
; 0x1a277d

UnknownText_0x1a277d: ; 0x1a277d
	db $0, "NORTH TO LAVENDER", $4f
	db "TOWN", $51
	db "WEST TO FUCHSIA", $4f
	db "CITY", $57
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

