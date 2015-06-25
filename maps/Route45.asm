Route45_MapScriptHeader: ; 0x19e09f
	; trigger count
	db 0

	; callback count
	db 0
; 0x19e0a1

TrainerBlackbeltKenji3: ; 0x19e0a1
	; bit/flag number
	dw $4ab

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
; 0x19e0ad

BlackbeltKenji3Script: ; 0x19e0ad
	writecode $17, $22
	talkaftercancel
	loadfont
	checkcellnum $22
	iftrue UnknownScript_0x19e0e4
	checkevent $0299
	iftrue UnknownScript_0x19e0cd
	special Function11485
	writetext UnknownText_0x19e5e2
	closetext
	setevent $0299
	scall UnknownScript_0x19e11b
	jump UnknownScript_0x19e0d0
; 0x19e0cd

UnknownScript_0x19e0cd: ; 0x19e0cd
	scall UnknownScript_0x19e11f
UnknownScript_0x19e0d0: ; 0x19e0d0
	askforphonenumber $22
	if_equal $1, UnknownScript_0x19e12f
	if_equal $2, UnknownScript_0x19e12b
	trainertotext BLACKBELT_T, KENJI3, $0
	scall UnknownScript_0x19e123
	jump UnknownScript_0x19e127
; 0x19e0e4

UnknownScript_0x19e0e4: ; 0x19e0e4
	checkcode $1a
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
; 0x19e10c

UnknownScript_0x19e10c: ; 0x19e10c
	writetext UnknownText_0x19e634
	closetext
	loadmovesprites
	end
; 0x19e112

UnknownScript_0x19e112: ; 0x19e112
	writetext UnknownText_0x19e66c
	closetext
	loadmovesprites
	end
; 0x19e118

UnknownScript_0x19e118: ; 0x19e118
	jump UnknownScript_0x19e13b
; 0x19e11b

UnknownScript_0x19e11b: ; 0x19e11b
	jumpstd asknumber1m
	end
; 0x19e11f

UnknownScript_0x19e11f: ; 0x19e11f
	jumpstd asknumber2m
	end
; 0x19e123

UnknownScript_0x19e123: ; 0x19e123
	jumpstd registerednumberm
	end
; 0x19e127

UnknownScript_0x19e127: ; 0x19e127
	jumpstd numberacceptedm
	end
; 0x19e12b

UnknownScript_0x19e12b: ; 0x19e12b
	jumpstd numberdeclinedm
	end
; 0x19e12f

UnknownScript_0x19e12f: ; 0x19e12f
	jumpstd phonefullm
	end
; 0x19e133

UnknownScript_0x19e133: ; 0x19e133
	jumpstd rematchm
	end
; 0x19e137

UnknownScript_0x19e137: ; 0x19e137
	jumpstd giftm
	end
; 0x19e13b

UnknownScript_0x19e13b: ; 0x19e13b
	jumpstd packfullm
	end
; 0x19e13f

UnknownScript_0x19e13f: ; 0x19e13f
	setevent EVENT_PARRY_IRON
	jumpstd packfullm
	end
; 0x19e146

UnknownScript_0x19e146: ; 0x19e146
	jumpstd rematchgiftm
	end
; 0x19e14a

TrainerHikerErik: ; 0x19e14a
	; bit/flag number
	dw $52a

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
; 0x19e156

HikerErikScript: ; 0x19e156
	talkaftercancel
	loadfont
	writetext UnknownText_0x19e301
	closetext
	loadmovesprites
	end
; 0x19e15e

TrainerHikerMichael: ; 0x19e15e
	; bit/flag number
	dw $52b

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
; 0x19e16a

HikerMichaelScript: ; 0x19e16a
	talkaftercancel
	loadfont
	writetext UnknownText_0x19e3b1
	closetext
	loadmovesprites
	end
; 0x19e172

TrainerHikerParry3: ; 0x19e172
	; bit/flag number
	dw $52c

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
; 0x19e17e

HikerParry3Script: ; 0x19e17e
	writecode $17, $23
	talkaftercancel
	loadfont
	checkflag $007b
	iftrue UnknownScript_0x19e1b8
	checkcellnum $23
	iftrue UnknownScript_0x19e127
	checkevent $029b
	iftrue UnknownScript_0x19e1a1
	writetext UnknownText_0x19e434
	keeptextopen
	setevent $029b
	scall UnknownScript_0x19e11b
	jump UnknownScript_0x19e1a4
; 0x19e1a1

UnknownScript_0x19e1a1: ; 0x19e1a1
	scall UnknownScript_0x19e11f
UnknownScript_0x19e1a4: ; 0x19e1a4
	askforphonenumber $23
	if_equal $1, UnknownScript_0x19e12f
	if_equal $2, UnknownScript_0x19e12b
	trainertotext HIKER, PARRY1, $0
	scall UnknownScript_0x19e123
	jump UnknownScript_0x19e127
; 0x19e1b8

UnknownScript_0x19e1b8: ; 0x19e1b8
	scall UnknownScript_0x19e133
	winlosstext HikerParry3BeatenText, $0000
	copybytetovar wda0c
	if_equal $2, UnknownScript_0x19e1cf
	if_equal $1, UnknownScript_0x19e1d5
	if_equal $0, UnknownScript_0x19e1db
UnknownScript_0x19e1cf: ; 0x19e1c
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue UnknownScript_0x19e1f5
UnknownScript_0x19e1d5: ; 0x19e1d5
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue UnknownScript_0x19e1e8
UnknownScript_0x19e1db: ; 0x19e1db
	loadtrainer HIKER, PARRY3
	startbattle
	returnafterbattle
	loadvar wda0c, $1
	clearflag $007b
	end
; 0x19e1e8

UnknownScript_0x19e1e8: ; 0x19e1e8
	loadtrainer HIKER, PARRY1
	startbattle
	returnafterbattle
	loadvar wda0c, $2
	clearflag $007b
	end
; 0x19e1f5

UnknownScript_0x19e1f5: ; 0x19e1f5
	loadtrainer HIKER, PARRY2
	startbattle
	returnafterbattle
	clearflag $007b
	checkevent EVENT_PARRY_IRON
	iftrue UnknownScript_0x19e219
	checkevent $0268
	iftrue UnknownScript_0x19e218
	scall UnknownScript_0x19e146
	verbosegiveitem IRON, 1
	iffalse UnknownScript_0x19e13f
	setevent $0268
	jump UnknownScript_0x19e127
; 0x19e218

UnknownScript_0x19e218: ; 0x19e218
	end
; 0x19e219

UnknownScript_0x19e219: ; 0x19e219
	loadfont
	writetext UnknownText_0x19e52c
	closetext
	verbosegiveitem IRON, 1
	iffalse UnknownScript_0x19e13f
	clearevent EVENT_PARRY_IRON
	setevent $0268
	jump UnknownScript_0x19e127
; 0x19e22d

TrainerHikerTimothy: ; 0x19e22d
	; bit/flag number
	dw $52d

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
; 0x19e239

HikerTimothyScript: ; 0x19e239
	talkaftercancel
	loadfont
	writetext UnknownText_0x19e4f1
	closetext
	loadmovesprites
	end
; 0x19e241

TrainerCooltrainermRyan: ; 0x19e241
	; bit/flag number
	dw $54f

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
; 0x19e24d

CooltrainermRyanScript: ; 0x19e24d
	talkaftercancel
	loadfont
	writetext UnknownText_0x19e70d
	closetext
	loadmovesprites
	end
; 0x19e255

TrainerCooltrainerfKelly: ; 0x19e255
	; bit/flag number
	dw $561

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
; 0x19e261

CooltrainerfKellyScript: ; 0x19e261
	talkaftercancel
	loadfont
	writetext UnknownText_0x19e7d1
	closetext
	loadmovesprites
	end
; 0x19e269

YoungsterScript_0x19e269: ; 0x19e269
	faceplayer
	loadfont
	checkevent $05c3
	iftrue UnknownScript_0x19e285
	writetext UnknownText_0x19e87f
	closetext
	loadmovesprites
	winlosstext UnknownText_0x19e899, $0000
	loadtrainer CAMPER, QUENTIN
	startbattle
	returnafterbattle
	setevent $05c3
	loadmovesprites
	end
; 0x19e285

UnknownScript_0x19e285: ; 0x19e285
	writetext UnknownText_0x19e8bb
	closetext
	loadmovesprites
	end
; 0x19e28b

UnknownScript_0x19e28b: ; 0x19e28b
	writetext UnknownText_0x19e830
	closetext
	loadmovesprites
	end
; 0x19e291

MapRoute45Signpost0Script: ; 0x19e291
	jumptext UnknownText_0x19e8fe
; 0x19e294

FruitTreeScript_0x19e294: ; 0x19e294
	fruittree $c
; 0x19e296

ItemFragment_0x19e296: ; 0x19e296
	db NUGGET, 1
; 0x19e298

ItemFragment_0x19e298: ; 0x19e298
	db REVIVE, 1
; 0x19e29a

ItemFragment_0x19e29a: ; 0x19e29a
	db ELIXER, 1
; 0x19e29c

ItemFragment_0x19e29c: ; 0x19e29c
	db MAX_POTION, 1
; 0x19e29e

MapRoute45SignpostItem1: ; 0x19e29e
	dw $00af
	db PP_UP
	
; 0x19e2a1

HikerErikSeenText: ; 0x19e2a1
	text "Be prepared for"
	line "anything!"

	para "Let me see if your"
	line "#MON have been"
	cont "raised properly!"
	done
; 0x19e2ef

HikerErikBeatenText: ; 0x19e2ef
	text "Oh, I lost that!"
	done
; 0x19e301

UnknownText_0x19e301: ; 0x19e301
	text "I'll head back to"
	line "BLACKTHORN's ICE"

	para "PATH and train"
	line "some more."
	done
; 0x19e33d

HikerMichaelSeenText: ; 0x19e33d
	text "Yo! You're spunky!"
	line "But you know what?"

	para "When it comes to"
	line "sheer spunkiness,"
	cont "I'm the man!"
	done
; 0x19e392

HikerMichaelBeatenText: ; 0x19e392
	text "My #MON weren't"
	line "spunky enough!"
	done
; 0x19e3b1

UnknownText_0x19e3b1: ; 0x19e3b1
	text "Boy, do I love"
	line "HP UP! Mmmm, yum!"

	para "I keep drinking my"
	line "#MON's!"

	para "I can't help it!"
	done
; 0x19e3fd

HikerParry3SeenText: ; 0x19e3fd
	text "My #MON are"
	line "power packed!"
	done
; 0x19e418

HikerParry3BeatenText: ; 0x19e418
	text "Wahahah! I'm the"
	line "big loser!"
	done
; 0x19e434

UnknownText_0x19e434: ; 0x19e434
	text "I'm not much good"
	line "at thinking, see?"

	para "So, I just plow"
	line "ahead with power!"
	done
; 0x19e47a

HikerTimothySeenText: ; 0x19e47a
	text "Why do I climb"
	line "mountains?"

	para "Because they're"
	line "there."

	para "Why do I train"
	line "#MON?"

	para "Because they're"
	line "there!"
	done
; 0x19e4d6

HikerTimothyBeatenText: ; 0x19e4d6
	text "Losses…"
	line "They're there too!"
	done
; 0x19e4f1

UnknownText_0x19e4f1: ; 0x19e4f1
	text "The best thing to"
	line "ever happen to me"

	para "was discovering"
	line "#MON."
	done
; 0x19e52c

UnknownText_0x19e52c: ; 0x19e52c
	text "I just can't find"
	line "a way to win!"

	para "Keep it up!"

	para "Oh, and take this"
	line "--it's the gift"

	para "you couldn't take"
	line "when we last met."
	done
; 0x19e59c

BlackbeltKenji3SeenText: ; 0x19e59c
	text "I was training"
	line "here alone."

	para "Behold the fruits"
	line "of my labor!"
	done
; 0x19e5d7

BlackbeltKenji3BeatenText: ; 0x19e5d7
	text "Waaaargh!"
	done
; 0x19e5e2

UnknownText_0x19e5e2: ; 0x19e5e2
	text "This calls for"
	line "extreme measures."

	para "I must take to the"
	line "hills and train in"
	cont "solitude."
	done
; 0x19e634

UnknownText_0x19e634: ; 0x19e634
	text "I'm going to train"
	line "a bit more before"
	cont "I break for lunch."
	done
; 0x19e66c

UnknownText_0x19e66c: ; 0x19e66c
	text "We had plenty of"
	line "rest at lunch, so"

	para "now we're all"
	line "ready to go again!"

	para "We're going to"
	line "train again!"
	done
; 0x19e6cb

CooltrainermRyanSeenText: ; 0x19e6cb
	text "What are your"
	line "thoughts on rais-"
	cont "ing #MON?"
	done
; 0x19e6f6

CooltrainermRyanBeatenText: ; 0x19e6f6
	text "You've won my"
	line "respect."
	done
; 0x19e70d

UnknownText_0x19e70d: ; 0x19e70d
	text "I see you're rais-"
	line "ing your #MON"
	cont "with care."

	para "The bond you build"
	line "will save you in"
	cont "tough situations."
	done
; 0x19e76f

CooltrainerfKellySeenText: ; 0x19e76f
	text "What is your"
	line "battle strategy?"

	para "It is foolish to"
	line "use strong moves"
	cont "indiscriminately."
	done
; 0x19e7c2

CooltrainerfKellyBeatenText: ; 0x19e7c2
	text "Fine. I lost."
	done
; 0x19e7d1

UnknownText_0x19e7d1: ; 0x19e7d1
	text "I'm not in favor"
	line "of overly power-"
	cont "ful moves."

	para "I want to win, but"
	line "I also don't want"
	cont "to harm #MON."
	done
; 0x19e830

UnknownText_0x19e830: ; 0x19e830
	text "I'm really, really"
	line "tough!"

	para "Is there anywhere"
	line "I can prove how"
	cont "tough I really am?"
	done
; 0x19e87f

UnknownText_0x19e87f: ; 0x19e87f
	text "I'm really, really"
	line "tough!"
	done
; 0x19e899

UnknownText_0x19e899: ; 0x19e899
	text "I was tough at the"
	line "BATTLE TOWER…"
	done
; 0x19e8bb

UnknownText_0x19e8bb: ; 0x19e8bb
	text "Have you been to"
	line "the BATTLE TOWER?"

	para "I never, ever lose"
	line "there, but…"
	done
; 0x19e8fe

UnknownText_0x19e8fe: ; 0x19e8fe
	text "ROUTE 45"
	line "MOUNTAIN RD. AHEAD"
	done
; 0x19e91b

Route45_MapEventHeader: ; 0x19e91b
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
	person_event SPRITE_POKEFAN_M, 32, 9, $7, $0, 255, 255, $b2, 2, TrainerHikerParry3, $ffff
	person_event SPRITE_POKEFAN_M, 69, 13, $8, $0, 255, 255, $b2, 1, TrainerHikerTimothy, $ffff
	person_event SPRITE_BLACK_BELT, 54, 15, $a, $0, 255, 255, $b2, 2, TrainerBlackbeltKenji3, $ffff
	person_event SPRITE_COOLTRAINER_M, 22, 21, $8, $0, 255, 255, $82, 1, TrainerCooltrainermRyan, $ffff
	person_event SPRITE_COOLTRAINER_F, 40, 9, $a, $0, 255, 255, $82, 3, TrainerCooltrainerfKelly, $ffff
	person_event SPRITE_FRUIT_TREE, 86, 20, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x19e294, $ffff
	person_event SPRITE_POKE_BALL, 55, 10, $1, $0, 255, 255, $1, 0, ItemFragment_0x19e296, $06b8
	person_event SPRITE_POKE_BALL, 70, 9, $1, $0, 255, 255, $1, 0, ItemFragment_0x19e298, $06b9
	person_event SPRITE_POKE_BALL, 24, 10, $1, $0, 255, 255, $1, 0, ItemFragment_0x19e29a, $06ba
	person_event SPRITE_POKE_BALL, 37, 11, $1, $0, 255, 255, $1, 0, ItemFragment_0x19e29c, $06bb
	person_event SPRITE_YOUNGSTER, 74, 8, $3, $0, 255, 255, $a0, 0, YoungsterScript_0x19e269, $ffff
; 0x19e9d9
