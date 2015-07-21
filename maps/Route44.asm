Route44_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerBird_keeperVance1:
	trainer EVENT_BEAT_BIRD_KEEPER_VANCE, BIRD_KEEPER, VANCE1, Bird_keeperVance1SeenText, Bird_keeperVance1BeatenText, $0000, Bird_keeperVance1Script

Bird_keeperVance1Script:
	writecode VAR_CALLERID, PHONE_BIRDKEEPER_VANCE
	talkaftercancel
	loadfont
	checkflag ENGINE_VANCE
	iftrue UnknownScript_0x19d86a
	checkcellnum PHONE_BIRDKEEPER_VANCE
	iftrue UnknownScript_0x19d8eb
	checkevent EVENT_VANCE_ASKED_FOR_PHONE_NUMBER
	iftrue UnknownScript_0x19d853
	writetext UnknownText_0x19dbf3
	keeptextopen
	setevent EVENT_VANCE_ASKED_FOR_PHONE_NUMBER
	scall UnknownScript_0x19d8df
	jump UnknownScript_0x19d856

UnknownScript_0x19d853:
	scall UnknownScript_0x19d8e3
UnknownScript_0x19d856:
	askforphonenumber PHONE_BIRDKEEPER_VANCE
	if_equal $1, UnknownScript_0x19d8f3
	if_equal $2, UnknownScript_0x19d8ef
	trainertotext BIRD_KEEPER, VANCE1, $0
	scall UnknownScript_0x19d8e7
	jump UnknownScript_0x19d8eb

UnknownScript_0x19d86a:
	scall UnknownScript_0x19d8f7
	winlosstext Bird_keeperVance1BeatenText, $0000
	copybytetovar wVanceFightCount
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight2
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
.Fight1
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
.LoadFight0
	loadtrainer BIRD_KEEPER, VANCE1
	startbattle
	returnafterbattle
	loadvar wVanceFightCount, 1
	clearflag ENGINE_VANCE
	end

.LoadFight1
	loadtrainer BIRD_KEEPER, VANCE2
	startbattle
	returnafterbattle
	loadvar wVanceFightCount, 2
	clearflag ENGINE_VANCE
	end

.LoadFight2
	loadtrainer BIRD_KEEPER, VANCE3
	startbattle
	returnafterbattle
	clearflag ENGINE_VANCE
	checkevent EVENT_VANCE_CARBOS
	iftrue UnknownScript_0x19d8cb
	checkevent EVENT_GOT_CARBOS_FROM_VANCE
	iftrue UnknownScript_0x19d8ca
	scall UnknownScript_0x19d90a
	verbosegiveitem CARBOS, 1
	iffalse UnknownScript_0x19d903
	setevent EVENT_GOT_CARBOS_FROM_VANCE
	jump UnknownScript_0x19d8eb

UnknownScript_0x19d8ca:
	end

UnknownScript_0x19d8cb:
	loadfont
	writetext UnknownText_0x19dc67
	closetext
	verbosegiveitem CARBOS, 1
	iffalse UnknownScript_0x19d903
	clearevent EVENT_VANCE_CARBOS
	setevent EVENT_GOT_CARBOS_FROM_VANCE
	jump UnknownScript_0x19d8eb

UnknownScript_0x19d8df:
	jumpstd asknumber1m
	end

UnknownScript_0x19d8e3:
	jumpstd asknumber2m
	end

UnknownScript_0x19d8e7:
	jumpstd registerednumberm
	end

UnknownScript_0x19d8eb:
	jumpstd numberacceptedm
	end

UnknownScript_0x19d8ef:
	jumpstd numberdeclinedm
	end

UnknownScript_0x19d8f3:
	jumpstd phonefullm
	end

UnknownScript_0x19d8f7:
	jumpstd rematchm
	end

UnknownScript_0x19d8fb:
	jumpstd giftm
	end

UnknownScript_0x19d8ff:
	jumpstd packfullm
	end

UnknownScript_0x19d903:
	setevent EVENT_VANCE_CARBOS
	jumpstd packfullm
	end

UnknownScript_0x19d90a:
	jumpstd rematchgiftm
	end

TrainerPsychicPhil:
	trainer EVENT_BEAT_PSYCHIC_PHIL, PSYCHIC_T, PHIL, PsychicPhilSeenText, PsychicPhilBeatenText, $0000, PsychicPhilScript

PsychicPhilScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19dcfc
	closetext
	loadmovesprites
	end

TrainerFisherWilton1:
	trainer EVENT_BEAT_FISHER_WILTON, FISHER, WILTON1, FisherWilton1SeenText, FisherWilton1BeatenText, $0000, FisherWilton1Script

FisherWilton1Script:
	writecode VAR_CALLERID, PHONE_FISHER_WILTON
	talkaftercancel
	loadfont
	checkflag ENGINE_WILTON
	iftrue UnknownScript_0x19d96e
	checkflag ENGINE_WILTON_HAS_ITEM
	iftrue UnknownScript_0x19d9b4
	checkcellnum PHONE_FISHER_WILTON
	iftrue UnknownScript_0x19d8eb
	checkevent EVENT_WILTON_ASKED_FOR_PHONE_NUMBER
	iftrue UnknownScript_0x19d957
	writetext UnknownText_0x19daa8
	keeptextopen
	setevent EVENT_WILTON_ASKED_FOR_PHONE_NUMBER
	scall UnknownScript_0x19d8df
	jump UnknownScript_0x19d95a

UnknownScript_0x19d957:
	scall UnknownScript_0x19d8e3
UnknownScript_0x19d95a:
	askforphonenumber PHONE_FISHER_WILTON
	if_equal $1, UnknownScript_0x19d8f3
	if_equal $2, UnknownScript_0x19d8ef
	trainertotext FISHER, WILTON1, $0
	scall UnknownScript_0x19d8e7
	jump UnknownScript_0x19d8eb

UnknownScript_0x19d96e:
	scall UnknownScript_0x19d8f7
	winlosstext FisherWilton1BeatenText, $0000
	copybytetovar wWiltonFightCount
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight2
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
.Fight1
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
.LoadFight0
	loadtrainer FISHER, WILTON1
	startbattle
	returnafterbattle
	loadvar wWiltonFightCount, 1
	clearflag ENGINE_WILTON
	end

.LoadFight1
	loadtrainer FISHER, WILTON2
	startbattle
	returnafterbattle
	loadvar wWiltonFightCount, 2
	clearflag ENGINE_WILTON
	end

.LoadFight2
	loadtrainer FISHER, WILTON3
	startbattle
	returnafterbattle
	clearflag ENGINE_WILTON
	end

UnknownScript_0x19d9b4:
	scall UnknownScript_0x19d8fb
	checkevent EVENT_WILTON_HAS_ULTRA_BALL
	iftrue UnknownScript_0x19d9c9
	checkevent EVENT_WILTON_HAS_GREAT_BALL
	iftrue UnknownScript_0x19d9d2
	checkevent EVENT_WILTON_HAS_POKE_BALL
	iftrue UnknownScript_0x19d9db
UnknownScript_0x19d9c9:
	verbosegiveitem ULTRA_BALL, 1
	iffalse UnknownScript_0x19d9e7
	jump UnknownScript_0x19d9e1

UnknownScript_0x19d9d2:
	verbosegiveitem GREAT_BALL, 1
	iffalse UnknownScript_0x19d9e7
	jump UnknownScript_0x19d9e1

UnknownScript_0x19d9db:
	verbosegiveitem POKE_BALL, 1
	iffalse UnknownScript_0x19d9e7
UnknownScript_0x19d9e1:
	clearflag ENGINE_WILTON_HAS_ITEM
	jump UnknownScript_0x19d8eb

UnknownScript_0x19d9e7:
	jump UnknownScript_0x19d8ff

TrainerFisherEdgar:
	trainer EVENT_BEAT_FISHER_EDGAR, FISHER, EDGAR, FisherEdgarSeenText, FisherEdgarBeatenText, $0000, FisherEdgarScript

FisherEdgarScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19db6f
	closetext
	loadmovesprites
	end

TrainerCooltrainerfCybil:
	trainer EVENT_BEAT_COOLTRAINERF_CYBIL, COOLTRAINERF, CYBIL, CooltrainerfCybilSeenText, CooltrainerfCybilBeatenText, $0000, CooltrainerfCybilScript

CooltrainerfCybilScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19df4d
	closetext
	loadmovesprites
	end

TrainerPokemaniacZach:
	trainer EVENT_BEAT_POKEMANIAC_ZACH, POKEMANIAC, ZACH, PokemaniacZachSeenText, PokemaniacZachBeatenText, $0000, PokemaniacZachScript

PokemaniacZachScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19dd7e
	closetext
	loadmovesprites
	end

TrainerCooltrainermAllen:
	trainer EVENT_BEAT_COOLTRAINERM_ALLEN, COOLTRAINERM, ALLEN, CooltrainermAllenSeenText, CooltrainermAllenBeatenText, $0000, CooltrainermAllenScript

CooltrainermAllenScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19de66
	closetext
	loadmovesprites
	end

MapRoute44Signpost0Script:
	jumptext UnknownText_0x19dfb3

MapRoute44Signpost1Script:
	jumptext UnknownText_0x19dfcc

FruitTreeScript_0x19da40:
	fruittree $10

ItemFragment_0x19da42:
	db MAX_REVIVE, 1

ItemFragment_0x19da44:
	db ULTRA_BALL, 1

ItemFragment_0x19da46:
	db MAX_REPEL, 1

MapRoute44SignpostItem2:
	dwb EVENT_ROUTE_44_HIDDEN_ELIXER, ELIXER
	

FisherWilton1SeenText:
	text "Aack! You made me"
	line "lose a POLIWAG!"

	para "What are you going"
	line "to do about it?"
	done

FisherWilton1BeatenText:
	text "Just forget about"
	line "it."
	done

UnknownText_0x19daa8:
	text "That POLIWAG that"
	line "got away…"
	cont "It was huge."

	para "I swear it must've"
	line "been 16 feet long!"
	done

FisherEdgarSeenText:
	text "I fish until I"
	line "can't anymore."

	para "I also battle"
	line "until I drop."

	para "That's my"
	line "relationship"
	cont "with my #MON."
	done

FisherEdgarBeatenText:
	text "Hmmmm… "
	line "This isn't right."
	done

UnknownText_0x19db6f:
	text "That's 100 wins"
	line "to 101 losses."

	para "I won't battle"
	line "again for a while."
	done

Bird_keeperVance1SeenText:
	text "Do you know about"
	line "the legendary bird"
	cont "#MON?"
	done

Bird_keeperVance1BeatenText:
	text "Whew! You're hot"
	line "stuff."
	done

UnknownText_0x19dbf3:
	text "ARTICUNO, ZAPDOS"
	line "and MOLTRES are"

	para "the three legend-"
	line "ary bird #MON."

	para "I heard there are"
	line "other legendary"
	cont "birds, though."
	done

UnknownText_0x19dc67:
	text "Why can't I ever"
	line "beat you?"

	para "Oh yeah, here you"
	line "go. It's that gift"

	para "I couldn't give"
	line "you last time."
	done

PsychicPhilSeenText:
	text "I'm gonna win,"
	line "for sure!"
	done

PsychicPhilBeatenText:
	text "Arrgh… That's a"
	line "shocking loss…"
	done

UnknownText_0x19dcfc:
	text "It's important to"
	line "have conviction"
	cont "on your side."
	done

PokemaniacZachSeenText:
	text "I'll do anything"
	line "to get my hands on"
	cont "rare #MON!"
	done

PokemaniacZachBeatenText:
	text "Oooh, your #MON"
	line "are so appealing."
	done

UnknownText_0x19dd7e:
	text "If a #MON has"
	line "different colors"

	para "from usual, it's"
	line "more valuable."

	para "What? You mean"
	line "that's not true?"
	done

CooltrainermAllenSeenText:
	text "I can tell you're"
	line "a good trainer by"
	cont "looking at you."

	para "I'm good at #-"
	line "MON, and I can see"
	cont "that you are too."
	done

CooltrainermAllenBeatenText:
	text "Tch! It's a total"
	line "loss on my part."
	done

UnknownText_0x19de66:
	text "Wow. You have a"
	line "lot of BADGES."

	para "No wonder you're"
	line "so tough."

	para "I wonder if"
	line "ECRUTEAK GYM's"

	para "MORTY is still in"
	line "training?"

	para "He really hammered"
	line "me."
	done

CooltrainerfCybilSeenText:
	text "You look strong."

	para "Good trainers seek"
	line "tough opponents"
	cont "instinctively."
	done

CooltrainerfCybilBeatenText:
	text "Nope! This won't"
	line "do at all."
	done

UnknownText_0x19df4d:
	text "We all get better"
	line "by experiencing"
	cont "many battles."

	para "I battled a lot to"
	line "become what I am"
	cont "today--an elite."
	done

UnknownText_0x19dfb3:
	text "ROUTE 44"
	line "ICE PATH AHEAD"
	done

UnknownText_0x19dfcc:
	text "ROUTE 44"

	para "MAHOGANY TOWN -"
	line "BLACKTHORN CITY"
	done

Route44_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def $7, $38, 1, GROUP_ICE_PATH_1F, MAP_ICE_PATH_1F

.XYTriggers:
	db 0

.Signposts:
	db 3
	signpost 7, 53, SIGNPOST_READ, MapRoute44Signpost0Script
	signpost 10, 6, SIGNPOST_READ, MapRoute44Signpost1Script
	signpost 9, 32, SIGNPOST_ITEM, MapRoute44SignpostItem2

.PersonEvents:
	db 11
	person_event SPRITE_FISHER, 7, 39, OW_UP | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 1, TrainerFisherWilton1, -1
	person_event SPRITE_FISHER, 17, 23, OW_LEFT | $1, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 1, TrainerFisherEdgar, -1
	person_event SPRITE_YOUNGSTER, 13, 14, OW_RIGHT | $13, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 3, TrainerPsychicPhil, -1
	person_event SPRITE_SUPER_NERD, 6, 47, OW_RIGHT | $13, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 3, TrainerPokemaniacZach, -1
	person_event SPRITE_YOUNGSTER, 9, 55, OW_UP | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 2, TrainerBird_keeperVance1, -1
	person_event SPRITE_COOLTRAINER_M, 19, 45, OW_LEFT | $0, $0, -1, -1, (PAL_OW_RED << 4) | $82, 5, TrainerCooltrainermAllen, -1
	person_event SPRITE_COOLTRAINER_F, 18, 35, OW_LEFT | $0, $0, -1, -1, (PAL_OW_RED << 4) | $82, 5, TrainerCooltrainerfCybil, -1
	person_event SPRITE_FRUIT_TREE, 9, 13, OW_DOWN | $1, $0, -1, -1, $0, 0, FruitTreeScript_0x19da40, -1
	person_event SPRITE_POKE_BALL, 12, 34, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x19da42, EVENT_ROUTE_44_MAX_REVIVE
	person_event SPRITE_POKE_BALL, 8, 49, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x19da44, EVENT_ROUTE_44_ULTRA_BALL
	person_event SPRITE_POKE_BALL, 13, 18, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x19da46, EVENT_ROUTE_44_MAX_REPEL
