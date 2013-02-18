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
	checkbit1 $0299
	iftrue UnknownScript_0x19e0cd
	special $0095
	2writetext UnknownText_0x19e5e2
	closetext
	setbit1 $0299
	2call UnknownScript_0x19e11b
	2jump UnknownScript_0x19e0d0
; 0x19e0cd

UnknownScript_0x19e0cd: ; 0x19e0cd
	2call UnknownScript_0x19e11f
UnknownScript_0x19e0d0: ; 0x19e0d0
	askforphonenumber $22
	if_equal $1, UnknownScript_0x19e12f
	if_equal $2, UnknownScript_0x19e12b
	trainertotext BLACKBELT_T, KENJI3, $0
	2call UnknownScript_0x19e123
	2jump UnknownScript_0x19e127
; 0x19e0e4

UnknownScript_0x19e0e4: ; 0x19e0e4
	checkcode $1a
	if_not_equal $1, UnknownScript_0x19e127
	checktime $1
	iftrue UnknownScript_0x19e10c
	checktime $4
	iftrue UnknownScript_0x19e112
	checkbit1 $026a
	iffalse UnknownScript_0x19e127
	2call UnknownScript_0x19e137
	verbosegiveitem PP_UP, 1
	iffalse UnknownScript_0x19e118
	clearbit1 $026a
	special $0095
	2jump UnknownScript_0x19e127
; 0x19e10c

UnknownScript_0x19e10c: ; 0x19e10c
	2writetext UnknownText_0x19e634
	closetext
	loadmovesprites
	end
; 0x19e112

UnknownScript_0x19e112: ; 0x19e112
	2writetext UnknownText_0x19e66c
	closetext
	loadmovesprites
	end
; 0x19e118

UnknownScript_0x19e118: ; 0x19e118
	2jump UnknownScript_0x19e13b
; 0x19e11b

UnknownScript_0x19e11b: ; 0x19e11b
	jumpstd $0019
	end
; 0x19e11f

UnknownScript_0x19e11f: ; 0x19e11f
	jumpstd $001a
	end
; 0x19e123

UnknownScript_0x19e123: ; 0x19e123
	jumpstd $001b
	end
; 0x19e127

UnknownScript_0x19e127: ; 0x19e127
	jumpstd $001c
	end
; 0x19e12b

UnknownScript_0x19e12b: ; 0x19e12b
	jumpstd $001d
	end
; 0x19e12f

UnknownScript_0x19e12f: ; 0x19e12f
	jumpstd $001e
	end
; 0x19e133

UnknownScript_0x19e133: ; 0x19e133
	jumpstd $001f
	end
; 0x19e137

UnknownScript_0x19e137: ; 0x19e137
	jumpstd $0020
	end
; 0x19e13b

UnknownScript_0x19e13b: ; 0x19e13b
	jumpstd $0021
	end
; 0x19e13f

UnknownScript_0x19e13f: ; 0x19e13f
	setbit1 $033a
	jumpstd $0021
	end
; 0x19e146

UnknownScript_0x19e146: ; 0x19e146
	jumpstd $0022
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
	2writetext UnknownText_0x19e301
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
	2writetext UnknownText_0x19e3b1
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
	checkbit2 $007b
	iftrue UnknownScript_0x19e1b8
	checkcellnum $23
	iftrue UnknownScript_0x19e127
	checkbit1 $029b
	iftrue UnknownScript_0x19e1a1
	2writetext UnknownText_0x19e434
	keeptextopen
	setbit1 $029b
	2call UnknownScript_0x19e11b
	2jump UnknownScript_0x19e1a4
; 0x19e1a1

UnknownScript_0x19e1a1: ; 0x19e1a1
	2call UnknownScript_0x19e11f
UnknownScript_0x19e1a4: ; 0x19e1a4
	askforphonenumber $23
	if_equal $1, UnknownScript_0x19e12f
	if_equal $2, UnknownScript_0x19e12b
	trainertotext HIKER, PARRY1, $0
	2call UnknownScript_0x19e123
	2jump UnknownScript_0x19e127
; 0x19e1b8

UnknownScript_0x19e1b8: ; 0x19e1b8
	2call UnknownScript_0x19e133
	winlosstext HikerParry3BeatenText, $0000
	copybytetovar $da0c
	if_equal $2, UnknownScript_0x19e1cf
	if_equal $1, UnknownScript_0x19e1d5
	if_equal $0, UnknownScript_0x19e1db
UnknownScript_0x19e1cf: ; 0x19e1c
	checkbit1 $00cd
	iftrue UnknownScript_0x19e1f5
UnknownScript_0x19e1d5: ; 0x19e1d5
	checkbit1 $0044
	iftrue UnknownScript_0x19e1e8
UnknownScript_0x19e1db: ; 0x19e1db
	loadtrainer HIKER, PARRY3
	startbattle
	returnafterbattle
	loadvar $da0c, $1
	clearbit2 $007b
	end
; 0x19e1e8

UnknownScript_0x19e1e8: ; 0x19e1e8
	loadtrainer HIKER, PARRY1
	startbattle
	returnafterbattle
	loadvar $da0c, $2
	clearbit2 $007b
	end
; 0x19e1f5

UnknownScript_0x19e1f5: ; 0x19e1f5
	loadtrainer HIKER, PARRY2
	startbattle
	returnafterbattle
	clearbit2 $007b
	checkbit1 $033a
	iftrue UnknownScript_0x19e219
	checkbit1 $0268
	iftrue UnknownScript_0x19e218
	2call UnknownScript_0x19e146
	verbosegiveitem IRON, 1
	iffalse UnknownScript_0x19e13f
	setbit1 $0268
	2jump UnknownScript_0x19e127
; 0x19e218

UnknownScript_0x19e218: ; 0x19e218
	end
; 0x19e219

UnknownScript_0x19e219: ; 0x19e219
	loadfont
	2writetext UnknownText_0x19e52c
	closetext
	verbosegiveitem IRON, 1
	iffalse UnknownScript_0x19e13f
	clearbit1 $033a
	setbit1 $0268
	2jump UnknownScript_0x19e127
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
	2writetext UnknownText_0x19e4f1
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
	2writetext UnknownText_0x19e70d
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
	2writetext UnknownText_0x19e7d1
	closetext
	loadmovesprites
	end
; 0x19e269

UnknownScript_0x19e269: ; 0x19e269
	faceplayer
	loadfont
	checkbit1 $05c3
	iftrue UnknownScript_0x19e285
	2writetext UnknownText_0x19e87f
	closetext
	loadmovesprites
	winlosstext UnknownText_0x19e899, $0000
	loadtrainer CAMPER, QUENTIN
	startbattle
	returnafterbattle
	setbit1 $05c3
	loadmovesprites
	end
; 0x19e285

UnknownScript_0x19e285: ; 0x19e285
	2writetext UnknownText_0x19e8bb
	closetext
	loadmovesprites
	end
; 0x19e28b

UnknownScript_0x19e28b: ; 0x19e28b
	2writetext UnknownText_0x19e830
	closetext
	loadmovesprites
	end
; 0x19e291

MapRoute45Signpost0Script: ; 0x19e291
	jumptext UnknownText_0x19e8fe
; 0x19e294

UnknownScript_0x19e294: ; 0x19e294
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
	db $0, "Be prepared for", $4f
	db "anything!", $51
	db "Let me see if your", $4f
	db "#MON have been", $55
	db "raised properly!", $57
; 0x19e2ef

HikerErikBeatenText: ; 0x19e2ef
	db $0, "Oh, I lost that!", $57
; 0x19e301

UnknownText_0x19e301: ; 0x19e301
	db $0, "I'll head back to", $4f
	db "BLACKTHORN's ICE", $51
	db "PATH and train", $4f
	db "some more.", $57
; 0x19e33d

HikerMichaelSeenText: ; 0x19e33d
	db $0, "Yo! You're spunky!", $4f
	db "But you know what?", $51
	db "When it comes to", $4f
	db "sheer spunkiness,", $55
	db "I'm the man!", $57
; 0x19e392

HikerMichaelBeatenText: ; 0x19e392
	db $0, "My #MON weren't", $4f
	db "spunky enough!", $57
; 0x19e3b1

UnknownText_0x19e3b1: ; 0x19e3b1
	db $0, "Boy, do I love", $4f
	db "HP UP! Mmmm, yum!", $51
	db "I keep drinking my", $4f
	db "#MON's!", $51
	db "I can't help it!", $57
; 0x19e3fd

HikerParry3SeenText: ; 0x19e3fd
	db $0, "My #MON are", $4f
	db "power packed!", $57
; 0x19e418

HikerParry3BeatenText: ; 0x19e418
	db $0, "Wahahah! I'm the", $4f
	db "big loser!", $57
; 0x19e434

UnknownText_0x19e434: ; 0x19e434
	db $0, "I'm not much good", $4f
	db "at thinking, see?", $51
	db "So, I just plow", $4f
	db "ahead with power!", $57
; 0x19e47a

HikerTimothySeenText: ; 0x19e47a
	db $0, "Why do I climb", $4f
	db "mountains?", $51
	db "Because they're", $4f
	db "there.", $51
	db "Why do I train", $4f
	db "#MON?", $51
	db "Because they're", $4f
	db "there!", $57
; 0x19e4d6

HikerTimothyBeatenText: ; 0x19e4d6
	db $0, "Losses…", $4f
	db "They're there too!", $57
; 0x19e4f1

UnknownText_0x19e4f1: ; 0x19e4f1
	db $0, "The best thing to", $4f
	db "ever happen to me", $51
	db "was discovering", $4f
	db "#MON.", $57
; 0x19e52c

UnknownText_0x19e52c: ; 0x19e52c
	db $0, "I just can't find", $4f
	db "a way to win!", $51
	db "Keep it up!", $51
	db "Oh, and take this", $4f
	db "--it's the gift", $51
	db "you couldn't take", $4f
	db "when we last met.", $57
; 0x19e59c

BlackbeltKenji3SeenText: ; 0x19e59c
	db $0, "I was training", $4f
	db "here alone.", $51
	db "Behold the fruits", $4f
	db "of my labor!", $57
; 0x19e5d7

BlackbeltKenji3BeatenText: ; 0x19e5d7
	db $0, "Waaaargh!", $57
; 0x19e5e2

UnknownText_0x19e5e2: ; 0x19e5e2
	db $0, "This calls for", $4f
	db "extreme measures.", $51
	db "I must take to the", $4f
	db "hills and train in", $55
	db "solitude.", $57
; 0x19e634

UnknownText_0x19e634: ; 0x19e634
	db $0, "I'm going to train", $4f
	db "a bit more before", $55
	db "I break for lunch.", $57
; 0x19e66c

UnknownText_0x19e66c: ; 0x19e66c
	db $0, "We had plenty of", $4f
	db "rest at lunch, so", $51
	db "now we're all", $4f
	db "ready to go again!", $51
	db "We're going to", $4f
	db "train again!", $57
; 0x19e6cb

CooltrainermRyanSeenText: ; 0x19e6cb
	db $0, "What are your", $4f
	db "thoughts on rais-", $55
	db "ing #MON?", $57
; 0x19e6f6

CooltrainermRyanBeatenText: ; 0x19e6f6
	db $0, "You've won my", $4f
	db "respect.", $57
; 0x19e70d

UnknownText_0x19e70d: ; 0x19e70d
	db $0, "I see you're rais-", $4f
	db "ing your #MON", $55
	db "with care.", $51
	db "The bond you build", $4f
	db "will save you in", $55
	db "tough situations.", $57
; 0x19e76f

CooltrainerfKellySeenText: ; 0x19e76f
	db $0, "What is your", $4f
	db "battle strategy?", $51
	db "It is foolish to", $4f
	db "use strong moves", $55
	db "indiscriminately.", $57
; 0x19e7c2

CooltrainerfKellyBeatenText: ; 0x19e7c2
	db $0, "Fine. I lost.", $57
; 0x19e7d1

UnknownText_0x19e7d1: ; 0x19e7d1
	db $0, "I'm not in favor", $4f
	db "of overly power-", $55
	db "ful moves.", $51
	db "I want to win, but", $4f
	db "I also don't want", $55
	db "to harm #MON.", $57
; 0x19e830

UnknownText_0x19e830: ; 0x19e830
	db $0, "I'm really, really", $4f
	db "tough!", $51
	db "Is there anywhere", $4f
	db "I can prove how", $55
	db "tough I really am?", $57
; 0x19e87f

UnknownText_0x19e87f: ; 0x19e87f
	db $0, "I'm really, really", $4f
	db "tough!", $57
; 0x19e899

UnknownText_0x19e899: ; 0x19e899
	db $0, "I was tough at the", $4f
	db "BATTLE TOWER…", $57
; 0x19e8bb

UnknownText_0x19e8bb: ; 0x19e8bb
	db $0, "Have you been to", $4f
	db "the BATTLE TOWER?", $51
	db "I never, ever lose", $4f
	db "there, but…", $57
; 0x19e8fe

UnknownText_0x19e8fe: ; 0x19e8fe
	db $0, "ROUTE 45", $4f
	db "MOUNTAIN RD. AHEAD", $57
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
	person_event $2d, 20, 14, $9, $0, 255, 255, $b2, 1, TrainerHikerErik, $ffff
	person_event $2d, 69, 19, $9, $0, 255, 255, $b2, 2, TrainerHikerMichael, $ffff
	person_event $2d, 32, 9, $7, $0, 255, 255, $b2, 2, TrainerHikerParry3, $ffff
	person_event $2d, 69, 13, $8, $0, 255, 255, $b2, 1, TrainerHikerTimothy, $ffff
	person_event $41, 54, 15, $a, $0, 255, 255, $b2, 2, TrainerBlackbeltKenji3, $ffff
	person_event $23, 22, 21, $8, $0, 255, 255, $82, 1, TrainerCooltrainermRyan, $ffff
	person_event $24, 40, 9, $a, $0, 255, 255, $82, 3, TrainerCooltrainerfKelly, $ffff
	person_event $5d, 86, 20, $1, $0, 255, 255, $0, 0, UnknownScript_0x19e294, $ffff
	person_event $54, 55, 10, $1, $0, 255, 255, $1, 0, ItemFragment_0x19e296, $06b8
	person_event $54, 70, 9, $1, $0, 255, 255, $1, 0, ItemFragment_0x19e298, $06b9
	person_event $54, 24, 10, $1, $0, 255, 255, $1, 0, ItemFragment_0x19e29a, $06ba
	person_event $54, 37, 11, $1, $0, 255, 255, $1, 0, ItemFragment_0x19e29c, $06bb
	person_event $27, 74, 8, $3, $0, 255, 255, $a0, 0, UnknownScript_0x19e269, $ffff
; 0x19e9d9

