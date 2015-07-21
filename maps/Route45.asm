Route45_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerBlackbeltKenji:
	trainer EVENT_BEAT_BLACKBELT_KENJI, BLACKBELT_T, KENJI3, BlackbeltKenji3SeenText, BlackbeltKenji3BeatenText, $0000, BlackbeltKenji3Script

BlackbeltKenji3Script:
	writecode VAR_CALLERID, PHONE_BLACKBELT_KENJI
	talkaftercancel
	loadfont
	checkcellnum PHONE_BLACKBELT_KENJI
	iftrue UnknownScript_0x19e0e4
	checkevent EVENT_KENJI_ASKED_FOR_PHONE_NUMBER
	iftrue UnknownScript_0x19e0cd
	special Function11485
	writetext UnknownText_0x19e5e2
	closetext
	setevent EVENT_KENJI_ASKED_FOR_PHONE_NUMBER
	scall UnknownScript_0x19e11b
	jump UnknownScript_0x19e0d0

UnknownScript_0x19e0cd:
	scall UnknownScript_0x19e11f
UnknownScript_0x19e0d0:
	askforphonenumber PHONE_BLACKBELT_KENJI
	if_equal $1, UnknownScript_0x19e12f
	if_equal $2, UnknownScript_0x19e12b
	trainertotext BLACKBELT_T, KENJI3, $0
	scall UnknownScript_0x19e123
	jump UnknownScript_0x19e127

UnknownScript_0x19e0e4:
	checkcode VAR_KENJI_BREAK
	if_not_equal $1, UnknownScript_0x19e127
	checkmorn
	iftrue UnknownScript_0x19e10c
	checknite
	iftrue UnknownScript_0x19e112
	checkevent EVENT_KENJI_ON_BREAK
	iffalse UnknownScript_0x19e127
	scall UnknownScript_0x19e137
	verbosegiveitem PP_UP, 1
	iffalse UnknownScript_0x19e118
	clearevent EVENT_KENJI_ON_BREAK
	special Function11485
	jump UnknownScript_0x19e127

UnknownScript_0x19e10c:
	writetext UnknownText_0x19e634
	closetext
	loadmovesprites
	end

UnknownScript_0x19e112:
	writetext UnknownText_0x19e66c
	closetext
	loadmovesprites
	end

UnknownScript_0x19e118:
	jump UnknownScript_0x19e13b

UnknownScript_0x19e11b:
	jumpstd asknumber1m
	end

UnknownScript_0x19e11f:
	jumpstd asknumber2m
	end

UnknownScript_0x19e123:
	jumpstd registerednumberm
	end

UnknownScript_0x19e127:
	jumpstd numberacceptedm
	end

UnknownScript_0x19e12b:
	jumpstd numberdeclinedm
	end

UnknownScript_0x19e12f:
	jumpstd phonefullm
	end

UnknownScript_0x19e133:
	jumpstd rematchm
	end

UnknownScript_0x19e137:
	jumpstd giftm
	end

UnknownScript_0x19e13b:
	jumpstd packfullm
	end

UnknownScript_0x19e13f:
	setevent EVENT_PARRY_IRON
	jumpstd packfullm
	end

UnknownScript_0x19e146:
	jumpstd rematchgiftm
	end

TrainerHikerErik:
	trainer EVENT_BEAT_HIKER_ERIK, HIKER, ERIK, HikerErikSeenText, HikerErikBeatenText, $0000, HikerErikScript

HikerErikScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19e301
	closetext
	loadmovesprites
	end

TrainerHikerMichael:
	trainer EVENT_BEAT_HIKER_MICHAEL, HIKER, MICHAEL, HikerMichaelSeenText, HikerMichaelBeatenText, $0000, HikerMichaelScript

HikerMichaelScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19e3b1
	closetext
	loadmovesprites
	end

TrainerHikerParry:
	trainer EVENT_BEAT_HIKER_PARRY, HIKER, PARRY3, HikerParry3SeenText, HikerParry3BeatenText, $0000, HikerParry3Script

HikerParry3Script:
	writecode VAR_CALLERID, PHONE_HIKER_PARRY
	talkaftercancel
	loadfont
	checkflag ENGINE_PARRY
	iftrue UnknownScript_0x19e1b8
	checkcellnum PHONE_HIKER_PARRY
	iftrue UnknownScript_0x19e127
	checkevent EVENT_PARRY_ASKED_FOR_PHONE_NUMBER
	iftrue UnknownScript_0x19e1a1
	writetext UnknownText_0x19e434
	keeptextopen
	setevent EVENT_PARRY_ASKED_FOR_PHONE_NUMBER
	scall UnknownScript_0x19e11b
	jump UnknownScript_0x19e1a4

UnknownScript_0x19e1a1:
	scall UnknownScript_0x19e11f
UnknownScript_0x19e1a4:
	askforphonenumber PHONE_HIKER_PARRY
	if_equal $1, UnknownScript_0x19e12f
	if_equal $2, UnknownScript_0x19e12b
	trainertotext HIKER, PARRY1, $0
	scall UnknownScript_0x19e123
	jump UnknownScript_0x19e127

UnknownScript_0x19e1b8:
	scall UnknownScript_0x19e133
	winlosstext HikerParry3BeatenText, $0000
	copybytetovar wParryFightCount
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
	loadtrainer HIKER, PARRY3
	startbattle
	returnafterbattle
	loadvar wParryFightCount, 1
	clearflag ENGINE_PARRY
	end

.LoadFight1
	loadtrainer HIKER, PARRY1
	startbattle
	returnafterbattle
	loadvar wParryFightCount, 2
	clearflag ENGINE_PARRY
	end

.LoadFight2
	loadtrainer HIKER, PARRY2
	startbattle
	returnafterbattle
	clearflag ENGINE_PARRY
	checkevent EVENT_PARRY_IRON
	iftrue UnknownScript_0x19e219
	checkevent EVENT_GOT_IRON_FROM_PARRY
	iftrue UnknownScript_0x19e218
	scall UnknownScript_0x19e146
	verbosegiveitem IRON, 1
	iffalse UnknownScript_0x19e13f
	setevent EVENT_GOT_IRON_FROM_PARRY
	jump UnknownScript_0x19e127

UnknownScript_0x19e218:
	end

UnknownScript_0x19e219:
	loadfont
	writetext UnknownText_0x19e52c
	closetext
	verbosegiveitem IRON, 1
	iffalse UnknownScript_0x19e13f
	clearevent EVENT_PARRY_IRON
	setevent EVENT_GOT_IRON_FROM_PARRY
	jump UnknownScript_0x19e127

TrainerHikerTimothy:
	trainer EVENT_BEAT_HIKER_TIMOTHY, HIKER, TIMOTHY, HikerTimothySeenText, HikerTimothyBeatenText, $0000, HikerTimothyScript

HikerTimothyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19e4f1
	closetext
	loadmovesprites
	end

TrainerCooltrainermRyan:
	trainer EVENT_BEAT_COOLTRAINERM_RYAN, COOLTRAINERM, RYAN, CooltrainermRyanSeenText, CooltrainermRyanBeatenText, $0000, CooltrainermRyanScript

CooltrainermRyanScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19e70d
	closetext
	loadmovesprites
	end

TrainerCooltrainerfKelly:
	trainer EVENT_BEAT_COOLTRAINERF_KELLY, COOLTRAINERF, KELLY, CooltrainerfKellySeenText, CooltrainerfKellyBeatenText, $0000, CooltrainerfKellyScript

CooltrainerfKellyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19e7d1
	closetext
	loadmovesprites
	end

YoungsterScript_0x19e269:
	faceplayer
	loadfont
	checkevent EVENT_BEAT_CAMPER_QUENTIN
	iftrue UnknownScript_0x19e285
	writetext UnknownText_0x19e87f
	closetext
	loadmovesprites
	winlosstext UnknownText_0x19e899, $0000
	loadtrainer CAMPER, QUENTIN
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_CAMPER_QUENTIN
	loadmovesprites
	end

UnknownScript_0x19e285:
	writetext UnknownText_0x19e8bb
	closetext
	loadmovesprites
	end

UnknownScript_0x19e28b:
	writetext UnknownText_0x19e830
	closetext
	loadmovesprites
	end

MapRoute45Signpost0Script:
	jumptext UnknownText_0x19e8fe

FruitTreeScript_0x19e294:
	fruittree $c

ItemFragment_0x19e296:
	db NUGGET, 1

ItemFragment_0x19e298:
	db REVIVE, 1

ItemFragment_0x19e29a:
	db ELIXER, 1

ItemFragment_0x19e29c:
	db MAX_POTION, 1

MapRoute45SignpostItem1:
	dwb EVENT_ROUTE_45_HIDDEN_PP_UP, PP_UP
	

HikerErikSeenText:
	text "Be prepared for"
	line "anything!"

	para "Let me see if your"
	line "#MON have been"
	cont "raised properly!"
	done

HikerErikBeatenText:
	text "Oh, I lost that!"
	done

UnknownText_0x19e301:
	text "I'll head back to"
	line "BLACKTHORN's ICE"

	para "PATH and train"
	line "some more."
	done

HikerMichaelSeenText:
	text "Yo! You're spunky!"
	line "But you know what?"

	para "When it comes to"
	line "sheer spunkiness,"
	cont "I'm the man!"
	done

HikerMichaelBeatenText:
	text "My #MON weren't"
	line "spunky enough!"
	done

UnknownText_0x19e3b1:
	text "Boy, do I love"
	line "HP UP! Mmmm, yum!"

	para "I keep drinking my"
	line "#MON's!"

	para "I can't help it!"
	done

HikerParry3SeenText:
	text "My #MON are"
	line "power packed!"
	done

HikerParry3BeatenText:
	text "Wahahah! I'm the"
	line "big loser!"
	done

UnknownText_0x19e434:
	text "I'm not much good"
	line "at thinking, see?"

	para "So, I just plow"
	line "ahead with power!"
	done

HikerTimothySeenText:
	text "Why do I climb"
	line "mountains?"

	para "Because they're"
	line "there."

	para "Why do I train"
	line "#MON?"

	para "Because they're"
	line "there!"
	done

HikerTimothyBeatenText:
	text "Losses…"
	line "They're there too!"
	done

UnknownText_0x19e4f1:
	text "The best thing to"
	line "ever happen to me"

	para "was discovering"
	line "#MON."
	done

UnknownText_0x19e52c:
	text "I just can't find"
	line "a way to win!"

	para "Keep it up!"

	para "Oh, and take this"
	line "--it's the gift"

	para "you couldn't take"
	line "when we last met."
	done

BlackbeltKenji3SeenText:
	text "I was training"
	line "here alone."

	para "Behold the fruits"
	line "of my labor!"
	done

BlackbeltKenji3BeatenText:
	text "Waaaargh!"
	done

UnknownText_0x19e5e2:
	text "This calls for"
	line "extreme measures."

	para "I must take to the"
	line "hills and train in"
	cont "solitude."
	done

UnknownText_0x19e634:
	text "I'm going to train"
	line "a bit more before"
	cont "I break for lunch."
	done

UnknownText_0x19e66c:
	text "We had plenty of"
	line "rest at lunch, so"

	para "now we're all"
	line "ready to go again!"

	para "We're going to"
	line "train again!"
	done

CooltrainermRyanSeenText:
	text "What are your"
	line "thoughts on rais-"
	cont "ing #MON?"
	done

CooltrainermRyanBeatenText:
	text "You've won my"
	line "respect."
	done

UnknownText_0x19e70d:
	text "I see you're rais-"
	line "ing your #MON"
	cont "with care."

	para "The bond you build"
	line "will save you in"
	cont "tough situations."
	done

CooltrainerfKellySeenText:
	text "What is your"
	line "battle strategy?"

	para "It is foolish to"
	line "use strong moves"
	cont "indiscriminately."
	done

CooltrainerfKellyBeatenText:
	text "Fine. I lost."
	done

UnknownText_0x19e7d1:
	text "I'm not in favor"
	line "of overly power-"
	cont "ful moves."

	para "I want to win, but"
	line "I also don't want"
	cont "to harm #MON."
	done

UnknownText_0x19e830:
	text "I'm really, really"
	line "tough!"

	para "Is there anywhere"
	line "I can prove how"
	cont "tough I really am?"
	done

UnknownText_0x19e87f:
	text "I'm really, really"
	line "tough!"
	done

UnknownText_0x19e899:
	text "I was tough at the"
	line "BATTLE TOWER…"
	done

UnknownText_0x19e8bb:
	text "Have you been to"
	line "the BATTLE TOWER?"

	para "I never, ever lose"
	line "there, but…"
	done

UnknownText_0x19e8fe:
	text "ROUTE 45"
	line "MOUNTAIN RD. AHEAD"
	done

Route45_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def $5, $2, 1, GROUP_DARK_CAVE_BLACKTHORN_ENTRANCE, MAP_DARK_CAVE_BLACKTHORN_ENTRANCE

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 4, 10, SIGNPOST_READ, MapRoute45Signpost0Script
	signpost 80, 13, SIGNPOST_ITEM, MapRoute45SignpostItem1

.PersonEvents:
	db 13
	person_event SPRITE_POKEFAN_M, 20, 14, OW_LEFT | $1, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 1, TrainerHikerErik, -1
	person_event SPRITE_POKEFAN_M, 69, 19, OW_LEFT | $1, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 2, TrainerHikerMichael, -1
	person_event SPRITE_POKEFAN_M, 32, 9, OW_UP | $3, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 2, TrainerHikerParry, -1
	person_event SPRITE_POKEFAN_M, 69, 13, OW_LEFT | $0, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 1, TrainerHikerTimothy, -1
	person_event SPRITE_BLACK_BELT, 54, 15, OW_LEFT | $2, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 2, TrainerBlackbeltKenji, -1
	person_event SPRITE_COOLTRAINER_M, 22, 21, OW_LEFT | $0, $0, -1, -1, (PAL_OW_RED << 4) | $82, 1, TrainerCooltrainermRyan, -1
	person_event SPRITE_COOLTRAINER_F, 40, 9, OW_LEFT | $2, $0, -1, -1, (PAL_OW_RED << 4) | $82, 3, TrainerCooltrainerfKelly, -1
	person_event SPRITE_FRUIT_TREE, 86, 20, OW_DOWN | $1, $0, -1, -1, $0, 0, FruitTreeScript_0x19e294, -1
	person_event SPRITE_POKE_BALL, 55, 10, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x19e296, EVENT_ROUTE_45_NUGGET
	person_event SPRITE_POKE_BALL, 70, 9, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x19e298, EVENT_ROUTE_45_REVIVE
	person_event SPRITE_POKE_BALL, 24, 10, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x19e29a, EVENT_ROUTE_45_ELIXER
	person_event SPRITE_POKE_BALL, 37, 11, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x19e29c, EVENT_ROUTE_45_MAX_POTION
	person_event SPRITE_YOUNGSTER, 74, 8, OW_DOWN | $3, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, YoungsterScript_0x19e269, -1
