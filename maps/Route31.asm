Route31_MapScriptHeader: ; 0x1a5437
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x1a543c
; 0x1a543c

UnknownScript_0x1a543c: ; 0x1a543c
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
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
	checkflag $006c
	iftrue UnknownScript_0x1a5493
	checkflag $007f
	iftrue UnknownScript_0x1a5507
	checkcellnum $10
	iftrue UnknownScript_0x1a5558
	checkevent $0275
	iftrue UnknownScript_0x1a547c
	writetext UnknownText_0x1a5671
	closetext
	setevent $0275
	scall UnknownScript_0x1a554c
	jump UnknownScript_0x1a547f
; 0x1a547c

UnknownScript_0x1a547c: ; 0x1a547c
	scall UnknownScript_0x1a5550
UnknownScript_0x1a547f: ; 0x1a547f
	askforphonenumber $10
	if_equal $1, UnknownScript_0x1a5560
	if_equal $2, UnknownScript_0x1a555c
	trainertotext BUG_CATCHER, WADE1, $0
	scall UnknownScript_0x1a5554
	jump UnknownScript_0x1a5558
; 0x1a5493

UnknownScript_0x1a5493: ; 0x1a5493
	scall UnknownScript_0x1a5564
	winlosstext Bug_catcherWade1BeatenText, $0000
	copybytetovar wd9fa
	if_equal $4, UnknownScript_0x1a54b2
	if_equal $3, UnknownScript_0x1a54b8
	if_equal $2, UnknownScript_0x1a54be
	if_equal $1, UnknownScript_0x1a54c4
	if_equal $0, UnknownScript_0x1a54ca
UnknownScript_0x1a54b2: ; 0x1a54b2
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue UnknownScript_0x1a54fe
UnknownScript_0x1a54b8: ; 0x1a54b8
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x1a54f1
UnknownScript_0x1a54be: ; 0x1a54be
	checkflag $0049
	iftrue UnknownScript_0x1a54e4
UnknownScript_0x1a54c4: ; 0x1a54c4
	checkflag $0046
	iftrue UnknownScript_0x1a54d7
UnknownScript_0x1a54ca: ; 0x1a54ca
	loadtrainer BUG_CATCHER, WADE1
	startbattle
	returnafterbattle
	loadvar wd9fa, $1
	clearflag $006c
	end
; 0x1a54d7

UnknownScript_0x1a54d7: ; 0x1a54d7
	loadtrainer BUG_CATCHER, WADE2
	startbattle
	returnafterbattle
	loadvar wd9fa, $2
	clearflag $006c
	end
; 0x1a54e4

UnknownScript_0x1a54e4: ; 0x1a54e4
	loadtrainer BUG_CATCHER, WADE3
	startbattle
	returnafterbattle
	loadvar wd9fa, $3
	clearflag $006c
	end
; 0x1a54f1

UnknownScript_0x1a54f1: ; 0x1a54f1
	loadtrainer BUG_CATCHER, WADE4
	startbattle
	returnafterbattle
	loadvar wd9fa, $4
	clearflag $006c
	end
; 0x1a54fe

UnknownScript_0x1a54fe: ; 0x1a54fe
	loadtrainer BUG_CATCHER, WADE5
	startbattle
	returnafterbattle
	clearflag $006c
	end
; 0x1a5507

UnknownScript_0x1a5507: ; 0x1a5507
	scall UnknownScript_0x1a5568
	checkevent EVENT_WADE_HAS_BERRY
	iftrue UnknownScript_0x1a5522
	checkevent EVENT_WADE_HAS_PSNCUREBERRY
	iftrue UnknownScript_0x1a552b
	checkevent EVENT_WADE_HAS_PRZCUREBERRY
	iftrue UnknownScript_0x1a5534
	checkevent EVENT_WADE_HAS_BITTER_BERRY
	iftrue UnknownScript_0x1a553d
UnknownScript_0x1a5522: ; 0x1a5522
	verbosegiveitem BERRY, 1
	iffalse UnknownScript_0x1a5549
	jump UnknownScript_0x1a5543
; 0x1a552b

UnknownScript_0x1a552b: ; 0x1a552b
	verbosegiveitem PSNCUREBERRY, 1
	iffalse UnknownScript_0x1a5549
	jump UnknownScript_0x1a5543
; 0x1a5534

UnknownScript_0x1a5534: ; 0x1a5534
	verbosegiveitem PRZCUREBERRY, 1
	iffalse UnknownScript_0x1a5549
	jump UnknownScript_0x1a5543
; 0x1a553d

UnknownScript_0x1a553d: ; 0x1a553d
	verbosegiveitem BITTER_BERRY, 1
	iffalse UnknownScript_0x1a5549
UnknownScript_0x1a5543: ; 0x1a5543
	clearflag $007f
	jump UnknownScript_0x1a5558
; 0x1a5549

UnknownScript_0x1a5549: ; 0x1a5549
	jump UnknownScript_0x1a556c
; 0x1a554c

UnknownScript_0x1a554c: ; 0x1a554c
	jumpstd asknumber1m
	end
; 0x1a5550

UnknownScript_0x1a5550: ; 0x1a5550
	jumpstd asknumber2m
	end
; 0x1a5554

UnknownScript_0x1a5554: ; 0x1a5554
	jumpstd registerednumberm
	end
; 0x1a5558

UnknownScript_0x1a5558: ; 0x1a5558
	jumpstd numberacceptedm
	end
; 0x1a555c

UnknownScript_0x1a555c: ; 0x1a555c
	jumpstd numberdeclinedm
	end
; 0x1a5560

UnknownScript_0x1a5560: ; 0x1a5560
	jumpstd phonefullm
	end
; 0x1a5564

UnknownScript_0x1a5564: ; 0x1a5564
	jumpstd rematchm
	end
; 0x1a5568

UnknownScript_0x1a5568: ; 0x1a5568
	jumpstd giftm
	end
; 0x1a556c

UnknownScript_0x1a556c: ; 0x1a556c
	jumpstd packfullm
	end
; 0x1a5570

FisherScript_0x1a5570: ; 0x1a5570
	faceplayer
	loadfont
	checkevent EVENT_GOT_TM50_NIGHTMARE
	iftrue UnknownScript_0x1a55af
	checkevent EVENT_GOT_KENYA
	iftrue UnknownScript_0x1a5584
	writetext UnknownText_0x1a56d9
	closetext
	loadmovesprites
	end
; 0x1a5584

UnknownScript_0x1a5584: ; 0x1a5584
	writetext UnknownText_0x1a5761
	keeptextopen
	checkpokeitem ReceivedSpearowMailText
	if_equal $0, UnknownScript_0x1a55b5
	if_equal $2, UnknownScript_0x1a55c1
	if_equal $3, UnknownScript_0x1a55bb
	if_equal $4, UnknownScript_0x1a55c7
	writetext UnknownText_0x1a5790
	keeptextopen
	writetext UnknownText_0x1a57ba
	keeptextopen
	setevent EVENT_GAVE_KENYA
	verbosegiveitem TM_NIGHTMARE, 1
	iffalse UnknownScript_0x1a55b3
	setevent EVENT_GOT_TM50_NIGHTMARE
UnknownScript_0x1a55af: ; 0x1a55af
	writetext UnknownText_0x1a5896
	closetext
UnknownScript_0x1a55b3: ; 0x1a55b3
	loadmovesprites
	end
; 0x1a55b5

UnknownScript_0x1a55b5: ; 0x1a55b5
	writetext UnknownText_0x1a5921
	closetext
	loadmovesprites
	end
; 0x1a55bb

UnknownScript_0x1a55bb: ; 0x1a55bb
	writetext UnknownText_0x1a5939
	closetext
	loadmovesprites
	end
; 0x1a55c1

UnknownScript_0x1a55c1: ; 0x1a55c1
	writetext UnknownText_0x1a5972
	closetext
	loadmovesprites
	end
; 0x1a55c7

UnknownScript_0x1a55c7: ; 0x1a55c7
	writetext UnknownText_0x1a5991
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
	text "DARK CAVE…"

	para "If #MON could"
	line "light it up, I'd"
	cont "explore it."
	done
; 0x1a5635

Bug_catcherWade1SeenText: ; 0x1a5635
	text "I caught a bunch"
	line "of #MON. Let me"
	cont "battle with you!"
	done
; 0x1a5668

Bug_catcherWade1BeatenText: ; 0x1a5668
	text "Awwwww…"
	done
; 0x1a5671

UnknownText_0x1a5671: ; 0x1a5671
	text "You can catch"
	line "#MON even if"

	para "you have six with"
	line "you."

	para "If you catch one,"
	line "it'll go to your"
	cont "BOX automatically."
	done
; 0x1a56d9

UnknownText_0x1a56d9: ; 0x1a56d9
	text "… Hnuurg… Huh?"

	para "I walked too far"
	line "today looking for"
	cont "#MON."

	para "My feet hurt and"
	line "I'm sleepy…"

	para "If I were a wild"
	line "#MON, I'd be"
	cont "easy to catch…"

	para "…Zzzz…"
	done
; 0x1a5761

UnknownText_0x1a5761: ; 0x1a5761
	text "…Zzzz… Huh?"

	para "What's that? You"
	line "have MAIL for me?"
	done
; 0x1a5790

UnknownText_0x1a5790: ; 0x1a5790
	text "<PLAYER> handed"
	line "over the #MON"
	cont "holding the MAIL."
	done
; 0x1a57ba

UnknownText_0x1a57ba: ; 0x1a57ba
	text "Let's see…"

	para "…DARK CAVE leads"
	line "to another road…"

	para "That's good to"
	line "know."

	para "Thanks for bring-"
	line "ing this to me."

	para "My friend's a good"
	line "guy, and you're"
	cont "swell too!"

	para "I'd like to do"
	line "something good in"
	cont "return too!"

	para "I know! I want you"
	line "to have this!"
	done
; 0x1a5896

UnknownText_0x1a5896: ; 0x1a5896
	text "TM50 is NIGHTMARE."

	para "It's a wicked move"
	line "that steadily cuts"

	para "the HP of a sleep-"
	line "ing enemy."

	para "Ooooh…"
	line "That's scary…"

	para "I don't want to"
	line "have bad dreams."
	done
; 0x1a5921

UnknownText_0x1a5921: ; 0x1a5921
	text "This MAIL isn't"
	line "for me."
	done
; 0x1a5939

UnknownText_0x1a5939: ; 0x1a5939
	text "Why is this #-"
	line "MON so special?"

	para "It doesn't have"
	line "any MAIL."
	done
; 0x1a5972

UnknownText_0x1a5972: ; 0x1a5972
	text "What? You don't"
	line "want anything?"
	done
; 0x1a5991

UnknownText_0x1a5991: ; 0x1a5991
	text "If I take that"
	line "#MON from you,"

	para "what are you going"
	line "to use in battle?"
	done
; 0x1a59d5

UnknownText_0x1a59d5: ; 0x1a59d5
	text "I found a good"
	line "#MON in DARK"
	cont "CAVE."

	para "I'm going to raise"
	line "it to take on"
	cont "FALKNER."

	para "He's the leader of"
	line "VIOLET CITY's GYM."
	done
; 0x1a5a45

UnknownText_0x1a5a45: ; 0x1a5a45
	text "ROUTE 31"

	para "VIOLET CITY -"
	line "CHERRYGROVE CITY"
	done
; 0x1a5a6e

UnknownText_0x1a5a6e: ; 0x1a5a6e
	text "DARK CAVE"
	done
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
