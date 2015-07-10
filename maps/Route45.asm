Route45_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

TrainerBlackbeltKenji:
	; bit/flag number
	dw EVENT_BEAT_BLACKBELT_KENJI

	; trainer group && trainer id
	db BLACKBELT_T, KENJI3

	; text when seen
	dw BlackbeltKenji3SeenText

	; text when trainer beaten
	dw BlackbeltKenji3BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw BlackbeltKenji3Script

BlackbeltKenji3Script:
	writecode VAR_CALLERID, $22
	talkaftercancel
	loadfont
	checkcellnum $22
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
	askforphonenumber $22
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
	checkevent $026a
	iffalse UnknownScript_0x19e127
	scall UnknownScript_0x19e137
	verbosegiveitem PP_UP, 1
	iffalse UnknownScript_0x19e118
	clearevent $026a
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
	; bit/flag number
	dw EVENT_BEAT_HIKER_ERIK

	; trainer group && trainer id
	db HIKER, ERIK

	; text when seen
	dw HikerErikSeenText

	; text when trainer beaten
	dw HikerErikBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw HikerErikScript

HikerErikScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19e301
	closetext
	loadmovesprites
	end

TrainerHikerMichael:
	; bit/flag number
	dw EVENT_BEAT_HIKER_MICHAEL

	; trainer group && trainer id
	db HIKER, MICHAEL

	; text when seen
	dw HikerMichaelSeenText

	; text when trainer beaten
	dw HikerMichaelBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw HikerMichaelScript

HikerMichaelScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19e3b1
	closetext
	loadmovesprites
	end

TrainerHikerParry:
	; bit/flag number
	dw EVENT_BEAT_HIKER_PARRY

	; trainer group && trainer id
	db HIKER, PARRY3

	; text when seen
	dw HikerParry3SeenText

	; text when trainer beaten
	dw HikerParry3BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw HikerParry3Script

HikerParry3Script:
	writecode VAR_CALLERID, $23
	talkaftercancel
	loadfont
	checkflag ENGINE_PARRY
	iftrue UnknownScript_0x19e1b8
	checkcellnum $23
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
	askforphonenumber $23
	if_equal $1, UnknownScript_0x19e12f
	if_equal $2, UnknownScript_0x19e12b
	trainertotext HIKER, PARRY1, $0
	scall UnknownScript_0x19e123
	jump UnknownScript_0x19e127

UnknownScript_0x19e1b8:
	scall UnknownScript_0x19e133
	winlosstext HikerParry3BeatenText, $0000
	copybytetovar ParryFightCount
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
	loadvar ParryFightCount, 1
	clearflag ENGINE_PARRY
	end

.LoadFight1
	loadtrainer HIKER, PARRY1
	startbattle
	returnafterbattle
	loadvar ParryFightCount, 2
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
	; bit/flag number
	dw EVENT_BEAT_HIKER_TIMOTHY

	; trainer group && trainer id
	db HIKER, TIMOTHY

	; text when seen
	dw HikerTimothySeenText

	; text when trainer beaten
	dw HikerTimothyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw HikerTimothyScript

HikerTimothyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19e4f1
	closetext
	loadmovesprites
	end

TrainerCooltrainermRyan:
	; bit/flag number
	dw EVENT_BEAT_COOLTRAINERM_RYAN

	; trainer group && trainer id
	db COOLTRAINERM, RYAN

	; text when seen
	dw CooltrainermRyanSeenText

	; text when trainer beaten
	dw CooltrainermRyanBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainermRyanScript

CooltrainermRyanScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19e70d
	closetext
	loadmovesprites
	end

TrainerCooltrainerfKelly:
	; bit/flag number
	dw EVENT_BEAT_COOLTRAINERF_KELLY

	; trainer group && trainer id
	db COOLTRAINERF, KELLY

	; text when seen
	dw CooltrainerfKellySeenText

	; text when trainer beaten
	dw CooltrainerfKellyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainerfKellyScript

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
	dw $00af
	db PP_UP
	

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

	; warps
	db 1
	warp_def $5, $2, 1, GROUP_DARK_CAVE_BLACKTHORN_ENTRANCE, MAP_DARK_CAVE_BLACKTHORN_ENTRANCE

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 4, 10, $0, MapRoute45Signpost0Script
	signpost 80, 13, $7, MapRoute45SignpostItem1

	; people-events
	db 13
	person_event SPRITE_POKEFAN_M, 20, 14, $9, $0, 255, 255, $b2, 1, TrainerHikerErik, $ffff
	person_event SPRITE_POKEFAN_M, 69, 19, $9, $0, 255, 255, $b2, 2, TrainerHikerMichael, $ffff
	person_event SPRITE_POKEFAN_M, 32, 9, $7, $0, 255, 255, $b2, 2, TrainerHikerParry, $ffff
	person_event SPRITE_POKEFAN_M, 69, 13, $8, $0, 255, 255, $b2, 1, TrainerHikerTimothy, $ffff
	person_event SPRITE_BLACK_BELT, 54, 15, $a, $0, 255, 255, $b2, 2, TrainerBlackbeltKenji, $ffff
	person_event SPRITE_COOLTRAINER_M, 22, 21, $8, $0, 255, 255, $82, 1, TrainerCooltrainermRyan, $ffff
	person_event SPRITE_COOLTRAINER_F, 40, 9, $a, $0, 255, 255, $82, 3, TrainerCooltrainerfKelly, $ffff
	person_event SPRITE_FRUIT_TREE, 86, 20, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x19e294, $ffff
	person_event SPRITE_POKE_BALL, 55, 10, $1, $0, 255, 255, $1, 0, ItemFragment_0x19e296, $06b8
	person_event SPRITE_POKE_BALL, 70, 9, $1, $0, 255, 255, $1, 0, ItemFragment_0x19e298, $06b9
	person_event SPRITE_POKE_BALL, 24, 10, $1, $0, 255, 255, $1, 0, ItemFragment_0x19e29a, $06ba
	person_event SPRITE_POKE_BALL, 37, 11, $1, $0, 255, 255, $1, 0, ItemFragment_0x19e29c, $06bb
	person_event SPRITE_YOUNGSTER, 74, 8, $3, $0, 255, 255, $a0, 0, YoungsterScript_0x19e269, $ffff
