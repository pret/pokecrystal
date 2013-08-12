Route44_MapScriptHeader: ; 0x19d822
	; trigger count
	db 0

	; callback count
	db 0
; 0x19d824

TrainerBird_keeperVance1: ; 0x19d824
	; bit/flag number
	dw $401

	; trainer group && trainer id
	db BIRD_KEEPER, VANCE1

	; text when seen
	dw Bird_keeperVance1SeenText

	; text when trainer beaten
	dw Bird_keeperVance1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bird_keeperVance1Script
; 0x19d830

Bird_keeperVance1Script: ; 0x19d830
	writecode $17, $20
	talkaftercancel
	loadfont
	checkbit2 $0079
	iftrue UnknownScript_0x19d86a
	checkcellnum $20
	iftrue UnknownScript_0x19d8eb
	checkbit1 $0295
	iftrue UnknownScript_0x19d853
	2writetext UnknownText_0x19dbf3
	keeptextopen
	setbit1 $0295
	2call UnknownScript_0x19d8df
	2jump UnknownScript_0x19d856
; 0x19d853

UnknownScript_0x19d853: ; 0x19d853
	2call UnknownScript_0x19d8e3
UnknownScript_0x19d856: ; 0x19d856
	askforphonenumber $20
	if_equal $1, UnknownScript_0x19d8f3
	if_equal $2, UnknownScript_0x19d8ef
	trainertotext BIRD_KEEPER, VANCE1, $0
	2call UnknownScript_0x19d8e7
	2jump UnknownScript_0x19d8eb
; 0x19d86a

UnknownScript_0x19d86a: ; 0x19d86a
	2call UnknownScript_0x19d8f7
	winlosstext Bird_keeperVance1BeatenText, $0000
	copybytetovar $da09
	if_equal $2, UnknownScript_0x19d881
	if_equal $1, UnknownScript_0x19d887
	if_equal $0, UnknownScript_0x19d88d
UnknownScript_0x19d881: ; 0x19d881
	checkbit1 $00cd
	iftrue UnknownScript_0x19d8a7
UnknownScript_0x19d887: ; 0x19d887
	checkbit1 $0044
	iftrue UnknownScript_0x19d89a
UnknownScript_0x19d88d: ; 0x19d88d
	loadtrainer BIRD_KEEPER, VANCE1
	startbattle
	returnafterbattle
	loadvar $da09, $1
	clearbit2 $0079
	end
; 0x19d89a

UnknownScript_0x19d89a: ; 0x19d89a
	loadtrainer BIRD_KEEPER, VANCE2
	startbattle
	returnafterbattle
	loadvar $da09, $2
	clearbit2 $0079
	end
; 0x19d8a7

UnknownScript_0x19d8a7: ; 0x19d8a7
	loadtrainer BIRD_KEEPER, VANCE3
	startbattle
	returnafterbattle
	clearbit2 $0079
	checkbit1 $0339
	iftrue UnknownScript_0x19d8cb
	checkbit1 $0267
	iftrue UnknownScript_0x19d8ca
	2call UnknownScript_0x19d90a
	verbosegiveitem CARBOS, 1
	iffalse UnknownScript_0x19d903
	setbit1 $0267
	2jump UnknownScript_0x19d8eb
; 0x19d8ca

UnknownScript_0x19d8ca: ; 0x19d8ca
	end
; 0x19d8cb

UnknownScript_0x19d8cb: ; 0x19d8cb
	loadfont
	2writetext UnknownText_0x19dc67
	closetext
	verbosegiveitem CARBOS, 1
	iffalse UnknownScript_0x19d903
	clearbit1 $0339
	setbit1 $0267
	2jump UnknownScript_0x19d8eb
; 0x19d8df

UnknownScript_0x19d8df: ; 0x19d8df
	jumpstd $0019
	end
; 0x19d8e3

UnknownScript_0x19d8e3: ; 0x19d8e3
	jumpstd $001a
	end
; 0x19d8e7

UnknownScript_0x19d8e7: ; 0x19d8e7
	jumpstd $001b
	end
; 0x19d8eb

UnknownScript_0x19d8eb: ; 0x19d8eb
	jumpstd $001c
	end
; 0x19d8ef

UnknownScript_0x19d8ef: ; 0x19d8ef
	jumpstd $001d
	end
; 0x19d8f3

UnknownScript_0x19d8f3: ; 0x19d8f3
	jumpstd $001e
	end
; 0x19d8f7

UnknownScript_0x19d8f7: ; 0x19d8f7
	jumpstd $001f
	end
; 0x19d8fb

UnknownScript_0x19d8fb: ; 0x19d8fb
	jumpstd $0020
	end
; 0x19d8ff

UnknownScript_0x19d8ff: ; 0x19d8ff
	jumpstd $0021
	end
; 0x19d903

UnknownScript_0x19d903: ; 0x19d903
	setbit1 $0339
	jumpstd $0021
	end
; 0x19d90a

UnknownScript_0x19d90a: ; 0x19d90a
	jumpstd $0022
	end
; 0x19d90e

TrainerPsychicPhil: ; 0x19d90e
	; bit/flag number
	dw $441

	; trainer group && trainer id
	db PSYCHIC_T, PHIL

	; text when seen
	dw PsychicPhilSeenText

	; text when trainer beaten
	dw PsychicPhilBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PsychicPhilScript
; 0x19d91a

PsychicPhilScript: ; 0x19d91a
	talkaftercancel
	loadfont
	2writetext UnknownText_0x19dcfc
	closetext
	loadmovesprites
	end
; 0x19d922

TrainerFisherWilton1: ; 0x19d922
	; bit/flag number
	dw $457

	; trainer group && trainer id
	db FISHER, WILTON1

	; text when seen
	dw FisherWilton1SeenText

	; text when trainer beaten
	dw FisherWilton1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw FisherWilton1Script
; 0x19d92e

FisherWilton1Script: ; 0x19d92e
	writecode $17, $21
	talkaftercancel
	loadfont
	checkbit2 $007a
	iftrue UnknownScript_0x19d96e
	checkbit2 $0086
	iftrue UnknownScript_0x19d9b4
	checkcellnum $21
	iftrue UnknownScript_0x19d8eb
	checkbit1 $0297
	iftrue UnknownScript_0x19d957
	2writetext UnknownText_0x19daa8
	keeptextopen
	setbit1 $0297
	2call UnknownScript_0x19d8df
	2jump UnknownScript_0x19d95a
; 0x19d957

UnknownScript_0x19d957: ; 0x19d957
	2call UnknownScript_0x19d8e3
UnknownScript_0x19d95a: ; 0x19d95a
	askforphonenumber $21
	if_equal $1, UnknownScript_0x19d8f3
	if_equal $2, UnknownScript_0x19d8ef
	trainertotext FISHER, WILTON1, $0
	2call UnknownScript_0x19d8e7
	2jump UnknownScript_0x19d8eb
; 0x19d96e

UnknownScript_0x19d96e: ; 0x19d96e
	2call UnknownScript_0x19d8f7
	winlosstext FisherWilton1BeatenText, $0000
	copybytetovar $da0a
	if_equal $2, UnknownScript_0x19d985
	if_equal $1, UnknownScript_0x19d98b
	if_equal $0, UnknownScript_0x19d991
UnknownScript_0x19d985: ; 0x19d985
	checkbit1 $00cd
	iftrue UnknownScript_0x19d9ab
UnknownScript_0x19d98b: ; 0x19d98b
	checkbit1 $0044
	iftrue UnknownScript_0x19d99e
UnknownScript_0x19d991: ; 0x19d991
	loadtrainer FISHER, WILTON1
	startbattle
	returnafterbattle
	loadvar $da0a, $1
	clearbit2 $007a
	end
; 0x19d99e

UnknownScript_0x19d99e: ; 0x19d99e
	loadtrainer FISHER, WILTON2
	startbattle
	returnafterbattle
	loadvar $da0a, $2
	clearbit2 $007a
	end
; 0x19d9ab

UnknownScript_0x19d9ab: ; 0x19d9ab
	loadtrainer FISHER, WILTON3
	startbattle
	returnafterbattle
	clearbit2 $007a
	end
; 0x19d9b4

UnknownScript_0x19d9b4: ; 0x19d9b4
	2call UnknownScript_0x19d8fb
	checkbit1 $032f
	iftrue UnknownScript_0x19d9c9
	checkbit1 $0330
	iftrue UnknownScript_0x19d9d2
	checkbit1 $0331
	iftrue UnknownScript_0x19d9db
UnknownScript_0x19d9c9: ; 0x19d9c9
	verbosegiveitem ULTRA_BALL, 1
	iffalse UnknownScript_0x19d9e7
	2jump UnknownScript_0x19d9e1
; 0x19d9d2

UnknownScript_0x19d9d2: ; 0x19d9d2
	verbosegiveitem GREAT_BALL, 1
	iffalse UnknownScript_0x19d9e7
	2jump UnknownScript_0x19d9e1
; 0x19d9db

UnknownScript_0x19d9db: ; 0x19d9db
	verbosegiveitem POKE_BALL, 1
	iffalse UnknownScript_0x19d9e7
UnknownScript_0x19d9e1: ; 0x19d9e1
	clearbit2 $0086
	2jump UnknownScript_0x19d8eb
; 0x19d9e7

UnknownScript_0x19d9e7: ; 0x19d9e7
	2jump UnknownScript_0x19d8ff
; 0x19d9ea

TrainerFisherEdgar: ; 0x19d9ea
	; bit/flag number
	dw $458

	; trainer group && trainer id
	db FISHER, EDGAR

	; text when seen
	dw FisherEdgarSeenText

	; text when trainer beaten
	dw FisherEdgarBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw FisherEdgarScript
; 0x19d9f6

FisherEdgarScript: ; 0x19d9f6
	talkaftercancel
	loadfont
	2writetext UnknownText_0x19db6f
	closetext
	loadmovesprites
	end
; 0x19d9fe

TrainerCooltrainerfCybil: ; 0x19d9fe
	; bit/flag number
	dw $56a

	; trainer group && trainer id
	db COOLTRAINERF, CYBIL

	; text when seen
	dw CooltrainerfCybilSeenText

	; text when trainer beaten
	dw CooltrainerfCybilBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainerfCybilScript
; 0x19da0a

CooltrainerfCybilScript: ; 0x19da0a
	talkaftercancel
	loadfont
	2writetext UnknownText_0x19df4d
	closetext
	loadmovesprites
	end
; 0x19da12

TrainerPokemaniacZach: ; 0x19da12
	; bit/flag number
	dw $4f0

	; trainer group && trainer id
	db POKEMANIAC, ZACH

	; text when seen
	dw PokemaniacZachSeenText

	; text when trainer beaten
	dw PokemaniacZachBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokemaniacZachScript
; 0x19da1e

PokemaniacZachScript: ; 0x19da1e
	talkaftercancel
	loadfont
	2writetext UnknownText_0x19dd7e
	closetext
	loadmovesprites
	end
; 0x19da26

TrainerCooltrainermAllen: ; 0x19da26
	; bit/flag number
	dw $55a

	; trainer group && trainer id
	db COOLTRAINERM, ALLEN

	; text when seen
	dw CooltrainermAllenSeenText

	; text when trainer beaten
	dw CooltrainermAllenBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainermAllenScript
; 0x19da32

CooltrainermAllenScript: ; 0x19da32
	talkaftercancel
	loadfont
	2writetext UnknownText_0x19de66
	closetext
	loadmovesprites
	end
; 0x19da3a

MapRoute44Signpost0Script: ; 0x19da3a
	jumptext UnknownText_0x19dfb3
; 0x19da3d

MapRoute44Signpost1Script: ; 0x19da3d
	jumptext UnknownText_0x19dfcc
; 0x19da40

FruitTreeScript_0x19da40: ; 0x19da40
	fruittree $10
; 0x19da42

ItemFragment_0x19da42: ; 0x19da42
	db MAX_REVIVE, 1
; 0x19da44

ItemFragment_0x19da44: ; 0x19da44
	db ULTRA_BALL, 1
; 0x19da46

ItemFragment_0x19da46: ; 0x19da46
	db MAX_REPEL, 1
; 0x19da48

MapRoute44SignpostItem2: ; 0x19da48
	dw $00ae
	db ELIXER
	
; 0x19da4b

FisherWilton1SeenText: ; 0x19da4b
	db $0, "Aack! You made me", $4f
	db "lose a POLIWAG!", $51
	db "What are you going", $4f
	db "to do about it?", $57
; 0x19da91

FisherWilton1BeatenText: ; 0x19da91
	db $0, "Just forget about", $4f
	db "it.", $57
; 0x19daa8

UnknownText_0x19daa8: ; 0x19daa8
	db $0, "That POLIWAG that", $4f
	db "got away…", $55
	db "It was huge.", $51
	db "I swear it must've", $4f
	db "been 16 feet long!", $57
; 0x19daf7

FisherEdgarSeenText: ; 0x19daf7
	db $0, "I fish until I", $4f
	db "can't anymore.", $51
	db "I also battle", $4f
	db "until I drop.", $51
	db "That's my", $4f
	db "relationship", $55
	db "with my #MON.", $57
; 0x19db55

FisherEdgarBeatenText: ; 0x19db55
	db $0, "Hmmmm… ", $4f
	db "This isn't right.", $57
; 0x19db6f

UnknownText_0x19db6f: ; 0x19db6f
	db $0, "That's 100 wins", $4f
	db "to 101 losses.", $51
	db "I won't battle", $4f
	db "again for a while.", $57
; 0x19dbaf

Bird_keeperVance1SeenText: ; 0x19dbaf
	db $0, "Do you know about", $4f
	db "the legendary bird", $55
	db "#MON?", $57
; 0x19dbdb

Bird_keeperVance1BeatenText: ; 0x19dbdb
	db $0, "Whew! You're hot", $4f
	db "stuff.", $57
; 0x19dbf3

UnknownText_0x19dbf3: ; 0x19dbf3
	db $0, "ARTICUNO, ZAPDOS", $4f
	db "and MOLTRES are", $51
	db "the three legend-", $4f
	db "ary bird #MON.", $51
	db "I heard there are", $4f
	db "other legendary", $55
	db "birds, though.", $57
; 0x19dc67

UnknownText_0x19dc67: ; 0x19dc67
	db $0, "Why can't I ever", $4f
	db "beat you?", $51
	db "Oh yeah, here you", $4f
	db "go. It's that gift", $51
	db "I couldn't give", $4f
	db "you last time.", $57
; 0x19dcc4

PsychicPhilSeenText: ; 0x19dcc4
	db $0, "I'm gonna win,", $4f
	db "for sure!", $57
; 0x19dcdd

PsychicPhilBeatenText: ; 0x19dcdd
	db $0, "Arrgh… That's a", $4f
	db "shocking loss…", $57
; 0x19dcfc

UnknownText_0x19dcfc: ; 0x19dcfc
	db $0, "It's important to", $4f
	db "have conviction", $55
	db "on your side.", $57
; 0x19dd2c

PokemaniacZachSeenText: ; 0x19dd2c
	db $0, "I'll do anything", $4f
	db "to get my hands on", $55
	db "rare #MON!", $57
; 0x19dd5b

PokemaniacZachBeatenText: ; 0x19dd5b
	db $0, "Oooh, your #MON", $4f
	db "are so appealing.", $57
; 0x19dd7e

UnknownText_0x19dd7e: ; 0x19dd7e
	db $0, "If a #MON has", $4f
	db "different colors", $51
	db "from usual, it's", $4f
	db "more valuable.", $51
	db "What? You mean", $4f
	db "that's not true?", $57
; 0x19dddc

CooltrainermAllenSeenText: ; 0x19dddc
	db $0, "I can tell you're", $4f
	db "a good trainer by", $55
	db "looking at you.", $51
	db "I'm good at #-", $4f
	db "MON, and I can see", $55
	db "that you are too.", $57
; 0x19de43

CooltrainermAllenBeatenText: ; 0x19de43
	db $0, "Tch! It's a total", $4f
	db "loss on my part.", $57
; 0x19de66

UnknownText_0x19de66: ; 0x19de66
	db $0, "Wow. You have a", $4f
	db "lot of BADGES.", $51
	db "No wonder you're", $4f
	db "so tough.", $51
	db "I wonder if", $4f
	db "ECRUTEAK GYM's", $51
	db "MORTY is still in", $4f
	db "training?", $51
	db "He really hammered", $4f
	db "me.", $57
; 0x19deed

CooltrainerfCybilSeenText: ; 0x19deed
	db $0, "You look strong.", $51
	db "Good trainers seek", $4f
	db "tough opponents", $55
	db "instinctively.", $57
; 0x19df31

CooltrainerfCybilBeatenText: ; 0x19df31
	db $0, "Nope! This won't", $4f
	db "do at all.", $57
; 0x19df4d

UnknownText_0x19df4d: ; 0x19df4d
	db $0, "We all get better", $4f
	db "by experiencing", $55
	db "many battles.", $51
	db "I battled a lot to", $4f
	db "become what I am", $55
	db "today--an elite.", $57
; 0x19dfb3

UnknownText_0x19dfb3: ; 0x19dfb3
	db $0, "ROUTE 44", $4f
	db "ICE PATH AHEAD", $57
; 0x19dfcc

UnknownText_0x19dfcc: ; 0x19dfcc
	db $0, "ROUTE 44", $51
	db "MAHOGANY TOWN -", $4f
	db "BLACKTHORN CITY", $57
; 0x19dff6

Route44_MapEventHeader: ; 0x19dff6
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $7, $38, 1, GROUP_ICE_PATH_1F, MAP_ICE_PATH_1F

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 7, 53, $0, MapRoute44Signpost0Script
	signpost 10, 6, $0, MapRoute44Signpost1Script
	signpost 9, 32, $7, MapRoute44SignpostItem2

	; people-events
	db 11
	person_event SPRITE_FISHER, 7, 39, $6, $0, 255, 255, $a2, 1, TrainerFisherWilton1, $ffff
	person_event SPRITE_FISHER, 17, 23, $9, $0, 255, 255, $a2, 1, TrainerFisherEdgar, $ffff
	person_event SPRITE_YOUNGSTER, 13, 14, $1f, $0, 255, 255, $92, 3, TrainerPsychicPhil, $ffff
	person_event SPRITE_SUPER_NERD, 6, 47, $1f, $0, 255, 255, $a2, 3, TrainerPokemaniacZach, $ffff
	person_event SPRITE_YOUNGSTER, 9, 55, $6, $0, 255, 255, $a2, 2, TrainerBird_keeperVance1, $ffff
	person_event SPRITE_COOLTRAINER_M, 19, 45, $8, $0, 255, 255, $82, 5, TrainerCooltrainermAllen, $ffff
	person_event SPRITE_COOLTRAINER_F, 18, 35, $8, $0, 255, 255, $82, 5, TrainerCooltrainerfCybil, $ffff
	person_event SPRITE_FRUIT_TREE, 9, 13, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x19da40, $ffff
	person_event SPRITE_POKE_BALL, 12, 34, $1, $0, 255, 255, $1, 0, ItemFragment_0x19da42, $06b6
	person_event SPRITE_POKE_BALL, 8, 49, $1, $0, 255, 255, $1, 0, ItemFragment_0x19da44, $06b7
	person_event SPRITE_POKE_BALL, 13, 18, $1, $0, 255, 255, $1, 0, ItemFragment_0x19da46, $07bd
; 0x19e09f

