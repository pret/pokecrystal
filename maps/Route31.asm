Route31_MapScriptHeader: ; 0x1a5437
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x1a543c
; 0x1a543c

UnknownScript_0x1a543c: ; 0x1a543c
	checkbit1 EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iffalse UnknownScript_0x1a5443
	return
; 0x1a5443

UnknownScript_0x1a5443: ; 0x1a5443
	specialphonecall $7
	return
; 0x1a5447

TrainerBug_catcherWade1: ; 0x1a5447
	; bit/flag number
	dw $53b

	; trainer group && trainer id
	db BUG_CATCHER, WADE1

	; text when seen
	dw Bug_catcherWade1SeenText

	; text when trainer beaten
	dw Bug_catcherWade1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bug_catcherWade1Script
; 0x1a5453

Bug_catcherWade1Script: ; 0x1a5453
	writecode $17, $10
	talkaftercancel
	loadfont
	checkbit2 $006c
	iftrue UnknownScript_0x1a5493
	checkbit2 $007f
	iftrue UnknownScript_0x1a5507
	checkcellnum $10
	iftrue UnknownScript_0x1a5558
	checkbit1 $0275
	iftrue UnknownScript_0x1a547c
	2writetext UnknownText_0x1a5671
	closetext
	setbit1 $0275
	2call UnknownScript_0x1a554c
	2jump UnknownScript_0x1a547f
; 0x1a547c

UnknownScript_0x1a547c: ; 0x1a547c
	2call UnknownScript_0x1a5550
UnknownScript_0x1a547f: ; 0x1a547f
	askforphonenumber $10
	if_equal $1, UnknownScript_0x1a5560
	if_equal $2, UnknownScript_0x1a555c
	trainertotext BUG_CATCHER, WADE1, $0
	2call UnknownScript_0x1a5554
	2jump UnknownScript_0x1a5558
; 0x1a5493

UnknownScript_0x1a5493: ; 0x1a5493
	2call UnknownScript_0x1a5564
	winlosstext Bug_catcherWade1BeatenText, $0000
	copybytetovar $d9fa
	if_equal $4, UnknownScript_0x1a54b2
	if_equal $3, UnknownScript_0x1a54b8
	if_equal $2, UnknownScript_0x1a54be
	if_equal $1, UnknownScript_0x1a54c4
	if_equal $0, UnknownScript_0x1a54ca
UnknownScript_0x1a54b2: ; 0x1a54b2
	checkbit1 $0044
	iftrue UnknownScript_0x1a54fe
UnknownScript_0x1a54b8: ; 0x1a54b8
	checkbit1 EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x1a54f1
UnknownScript_0x1a54be: ; 0x1a54be
	checkbit2 $0049
	iftrue UnknownScript_0x1a54e4
UnknownScript_0x1a54c4: ; 0x1a54c4
	checkbit2 $0046
	iftrue UnknownScript_0x1a54d7
UnknownScript_0x1a54ca: ; 0x1a54ca
	loadtrainer BUG_CATCHER, WADE1
	startbattle
	returnafterbattle
	loadvar $d9fa, $1
	clearbit2 $006c
	end
; 0x1a54d7

UnknownScript_0x1a54d7: ; 0x1a54d7
	loadtrainer BUG_CATCHER, WADE2
	startbattle
	returnafterbattle
	loadvar $d9fa, $2
	clearbit2 $006c
	end
; 0x1a54e4

UnknownScript_0x1a54e4: ; 0x1a54e4
	loadtrainer BUG_CATCHER, WADE3
	startbattle
	returnafterbattle
	loadvar $d9fa, $3
	clearbit2 $006c
	end
; 0x1a54f1

UnknownScript_0x1a54f1: ; 0x1a54f1
	loadtrainer BUG_CATCHER, WADE4
	startbattle
	returnafterbattle
	loadvar $d9fa, $4
	clearbit2 $006c
	end
; 0x1a54fe

UnknownScript_0x1a54fe: ; 0x1a54fe
	loadtrainer BUG_CATCHER, WADE5
	startbattle
	returnafterbattle
	clearbit2 $006c
	end
; 0x1a5507

UnknownScript_0x1a5507: ; 0x1a5507
	2call UnknownScript_0x1a5568
	checkbit1 EVENT_WADE_HAS_BERRY
	iftrue UnknownScript_0x1a5522
	checkbit1 EVENT_WADE_HAS_PSNCUREBERRY
	iftrue UnknownScript_0x1a552b
	checkbit1 EVENT_WADE_HAS_PRZCUREBERRY
	iftrue UnknownScript_0x1a5534
	checkbit1 EVENT_WADE_HAS_BITTER_BERRY
	iftrue UnknownScript_0x1a553d
UnknownScript_0x1a5522: ; 0x1a5522
	verbosegiveitem BERRY, 1
	iffalse UnknownScript_0x1a5549
	2jump UnknownScript_0x1a5543
; 0x1a552b

UnknownScript_0x1a552b: ; 0x1a552b
	verbosegiveitem PSNCUREBERRY, 1
	iffalse UnknownScript_0x1a5549
	2jump UnknownScript_0x1a5543
; 0x1a5534

UnknownScript_0x1a5534: ; 0x1a5534
	verbosegiveitem PRZCUREBERRY, 1
	iffalse UnknownScript_0x1a5549
	2jump UnknownScript_0x1a5543
; 0x1a553d

UnknownScript_0x1a553d: ; 0x1a553d
	verbosegiveitem BITTER_BERRY, 1
	iffalse UnknownScript_0x1a5549
UnknownScript_0x1a5543: ; 0x1a5543
	clearbit2 $007f
	2jump UnknownScript_0x1a5558
; 0x1a5549

UnknownScript_0x1a5549: ; 0x1a5549
	2jump UnknownScript_0x1a556c
; 0x1a554c

UnknownScript_0x1a554c: ; 0x1a554c
	jumpstd $0019
	end
; 0x1a5550

UnknownScript_0x1a5550: ; 0x1a5550
	jumpstd $001a
	end
; 0x1a5554

UnknownScript_0x1a5554: ; 0x1a5554
	jumpstd $001b
	end
; 0x1a5558

UnknownScript_0x1a5558: ; 0x1a5558
	jumpstd $001c
	end
; 0x1a555c

UnknownScript_0x1a555c: ; 0x1a555c
	jumpstd $001d
	end
; 0x1a5560

UnknownScript_0x1a5560: ; 0x1a5560
	jumpstd $001e
	end
; 0x1a5564

UnknownScript_0x1a5564: ; 0x1a5564
	jumpstd $001f
	end
; 0x1a5568

UnknownScript_0x1a5568: ; 0x1a5568
	jumpstd $0020
	end
; 0x1a556c

UnknownScript_0x1a556c: ; 0x1a556c
	jumpstd $0021
	end
; 0x1a5570

FisherScript_0x1a5570: ; 0x1a5570
	faceplayer
	loadfont
	checkbit1 EVENT_GOT_TM50_NIGHTMARE
	iftrue UnknownScript_0x1a55af
	checkbit1 EVENT_GOT_KENYA
	iftrue UnknownScript_0x1a5584
	2writetext UnknownText_0x1a56d9
	closetext
	loadmovesprites
	end
; 0x1a5584

UnknownScript_0x1a5584: ; 0x1a5584
	2writetext UnknownText_0x1a5761
	keeptextopen
	checkpokeitem ReceivedSpearowMailText
	if_equal $0, UnknownScript_0x1a55b5
	if_equal $2, UnknownScript_0x1a55c1
	if_equal $3, UnknownScript_0x1a55bb
	if_equal $4, UnknownScript_0x1a55c7
	2writetext UnknownText_0x1a5790
	keeptextopen
	2writetext UnknownText_0x1a57ba
	keeptextopen
	setbit1 EVENT_GAVE_KENYA
	verbosegiveitem TM_50, 1
	iffalse UnknownScript_0x1a55b3
	setbit1 EVENT_GOT_TM50_NIGHTMARE
UnknownScript_0x1a55af: ; 0x1a55af
	2writetext UnknownText_0x1a5896
	closetext
UnknownScript_0x1a55b3: ; 0x1a55b3
	loadmovesprites
	end
; 0x1a55b5

UnknownScript_0x1a55b5: ; 0x1a55b5
	2writetext UnknownText_0x1a5921
	closetext
	loadmovesprites
	end
; 0x1a55bb

UnknownScript_0x1a55bb: ; 0x1a55bb
	2writetext UnknownText_0x1a5939
	closetext
	loadmovesprites
	end
; 0x1a55c1

UnknownScript_0x1a55c1: ; 0x1a55c1
	2writetext UnknownText_0x1a5972
	closetext
	loadmovesprites
	end
; 0x1a55c7

UnknownScript_0x1a55c7: ; 0x1a55c7
	2writetext UnknownText_0x1a5991
	closetext
	loadmovesprites
	end

ReceivedSpearowMailText: ; 0x1a55cd
	db "DARK CAVE leads",$4E
	db "to another road@"

YoungsterScript_0x1a55ed: ; 0x1a55ed
	jumptextfaceplayer UnknownText_0x1a59d5
; 0x1a55f0

MapRoute31Signpost0Script: ; 0x1a55f0
	jumptext UnknownText_0x1a5a45
; 0x1a55f3

MapRoute31Signpost1Script: ; 0x1a55f3
	jumptext UnknownText_0x1a5a6e
; 0x1a55f6

CooltrainerMScript_0x1a55f6: ; 0x1a55f6
	jumptextfaceplayer UnknownText_0x1a55ff
; 0x1a55f9

FruitTreeScript_0x1a55f9: ; 0x1a55f9
	fruittree $7
; 0x1a55fb

ItemFragment_0x1a55fb: ; 0x1a55fb
	db POTION, 1
; 0x1a55fd

ItemFragment_0x1a55fd: ; 0x1a55fd
	db POKE_BALL, 1
; 0x1a55ff

UnknownText_0x1a55ff: ; 0x1a55ff
	db $0, "DARK CAVE…", $51
	db "If #MON could", $4f
	db "light it up, I'd", $55
	db "explore it.", $57
; 0x1a5635

Bug_catcherWade1SeenText: ; 0x1a5635
	db $0, "I caught a bunch", $4f
	db "of #MON. Let me", $55
	db "battle with you!", $57
; 0x1a5668

Bug_catcherWade1BeatenText: ; 0x1a5668
	db $0, "Awwwww…", $57
; 0x1a5671

UnknownText_0x1a5671: ; 0x1a5671
	db $0, "You can catch", $4f
	db "#MON even if", $51
	db "you have six with", $4f
	db "you.", $51
	db "If you catch one,", $4f
	db "it'll go to your", $55
	db "BOX automatically.", $57
; 0x1a56d9

UnknownText_0x1a56d9: ; 0x1a56d9
	db $0, "… Hnuurg… Huh?", $51
	db "I walked too far", $4f
	db "today looking for", $55
	db "#MON.", $51
	db "My feet hurt and", $4f
	db "I'm sleepy…", $51
	db "If I were a wild", $4f
	db "#MON, I'd be", $55
	db "easy to catch…", $51
	db "…Zzzz…", $57
; 0x1a5761

UnknownText_0x1a5761: ; 0x1a5761
	db $0, "…Zzzz… Huh?", $51
	db "What's that? You", $4f
	db "have MAIL for me?", $57
; 0x1a5790

UnknownText_0x1a5790: ; 0x1a5790
	db $0, $52, " handed", $4f
	db "over the #MON", $55
	db "holding the MAIL.", $57
; 0x1a57ba

UnknownText_0x1a57ba: ; 0x1a57ba
	db $0, "Let's see…", $51
	db "…DARK CAVE leads", $4f
	db "to another road…", $51
	db "That's good to", $4f
	db "know.", $51
	db "Thanks for bring-", $4f
	db "ing this to me.", $51
	db "My friend's a good", $4f
	db "guy, and you're", $55
	db "swell too!", $51
	db "I'd like to do", $4f
	db "something good in", $55
	db "return too!", $51
	db "I know! I want you", $4f
	db "to have this!", $57
; 0x1a5896

UnknownText_0x1a5896: ; 0x1a5896
	db $0, "TM50 is NIGHTMARE.", $51
	db "It's a wicked move", $4f
	db "that steadily cuts", $51
	db "the HP of a sleep-", $4f
	db "ing enemy.", $51
	db "Ooooh…", $4f
	db "That's scary…", $51
	db "I don't want to", $4f
	db "have bad dreams.", $57
; 0x1a5921

UnknownText_0x1a5921: ; 0x1a5921
	db $0, "This MAIL isn't", $4f
	db "for me.", $57
; 0x1a5939

UnknownText_0x1a5939: ; 0x1a5939
	db $0, "Why is this #-", $4f
	db "MON so special?", $51
	db "It doesn't have", $4f
	db "any MAIL.", $57
; 0x1a5972

UnknownText_0x1a5972: ; 0x1a5972
	db $0, "What? You don't", $4f
	db "want anything?", $57
; 0x1a5991

UnknownText_0x1a5991: ; 0x1a5991
	db $0, "If I take that", $4f
	db "#MON from you,", $51
	db "what are you going", $4f
	db "to use in battle?", $57
; 0x1a59d5

UnknownText_0x1a59d5: ; 0x1a59d5
	db $0, "I found a good", $4f
	db "#MON in DARK", $55
	db "CAVE.", $51
	db "I'm going to raise", $4f
	db "it to take on", $55
	db "FALKNER.", $51
	db "He's the leader of", $4f
	db "VIOLET CITY's GYM.", $57
; 0x1a5a45

UnknownText_0x1a5a45: ; 0x1a5a45
	db $0, "ROUTE 31", $51
	db "VIOLET CITY -", $4f
	db "CHERRYGROVE CITY", $57
; 0x1a5a6e

UnknownText_0x1a5a6e: ; 0x1a5a6e
	db $0, "DARK CAVE", $57
; 0x1a5a79

Route31_MapEventHeader: ; 0x1a5a79
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $6, $4, 3, GROUP_ROUTE_31_VIOLET_GATE, MAP_ROUTE_31_VIOLET_GATE
	warp_def $7, $4, 4, GROUP_ROUTE_31_VIOLET_GATE, MAP_ROUTE_31_VIOLET_GATE
	warp_def $5, $22, 1, GROUP_DARK_CAVE_VIOLET_ENTRANCE, MAP_DARK_CAVE_VIOLET_ENTRANCE

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 5, 7, $0, MapRoute31Signpost0Script
	signpost 5, 31, $0, MapRoute31Signpost1Script

	; people-events
	db 7
	person_event SPRITE_FISHER, 11, 21, $6, $0, 255, 255, $0, 0, FisherScript_0x1a5570, $ffff
	person_event SPRITE_YOUNGSTER, 9, 13, $2, $11, 255, 255, $0, 0, YoungsterScript_0x1a55ed, $ffff
	person_event SPRITE_BUG_CATCHER, 17, 25, $8, $0, 255, 255, $b2, 5, TrainerBug_catcherWade1, $ffff
	person_event SPRITE_COOLTRAINER_M, 12, 37, $2, $11, 255, 255, $0, 0, CooltrainerMScript_0x1a55f6, $ffff
	person_event SPRITE_FRUIT_TREE, 11, 20, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x1a55f9, $ffff
	person_event SPRITE_POKE_BALL, 9, 33, $1, $0, 255, 255, $1, 0, ItemFragment_0x1a55fb, $06ae
	person_event SPRITE_POKE_BALL, 19, 23, $1, $0, 255, 255, $1, 0, ItemFragment_0x1a55fd, $06af
; 0x1a5af3

