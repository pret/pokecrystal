Route31_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw 5, UnknownScript_0x1a543c

UnknownScript_0x1a543c:
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iffalse UnknownScript_0x1a5443
	return

UnknownScript_0x1a5443:
	specialphonecall MOMCALL_WORRIED
	return

TrainerBug_catcherWade1:
	trainer EVENT_BEAT_BUG_CATCHER_WADE, BUG_CATCHER, WADE1, Bug_catcherWade1SeenText, Bug_catcherWade1BeatenText, $0000, Bug_catcherWade1Script

Bug_catcherWade1Script:
	writecode VAR_CALLERID, PHONE_BUG_CATCHER_WADE
	talkaftercancel
	loadfont
	checkflag ENGINE_WADE
	iftrue UnknownScript_0x1a5493
	checkflag ENGINE_WADE_HAS_ITEM
	iftrue UnknownScript_0x1a5507
	checkcellnum PHONE_BUG_CATCHER_WADE
	iftrue UnknownScript_0x1a5558
	checkevent EVENT_WADE_ASKED_FOR_PHONE_NUMBER
	iftrue UnknownScript_0x1a547c
	writetext UnknownText_0x1a5671
	closetext
	setevent EVENT_WADE_ASKED_FOR_PHONE_NUMBER
	scall UnknownScript_0x1a554c
	jump UnknownScript_0x1a547f

UnknownScript_0x1a547c:
	scall UnknownScript_0x1a5550
UnknownScript_0x1a547f:
	askforphonenumber PHONE_BUG_CATCHER_WADE
	if_equal $1, UnknownScript_0x1a5560
	if_equal $2, UnknownScript_0x1a555c
	trainertotext BUG_CATCHER, WADE1, $0
	scall UnknownScript_0x1a5554
	jump UnknownScript_0x1a5558

UnknownScript_0x1a5493:
	scall UnknownScript_0x1a5564
	winlosstext Bug_catcherWade1BeatenText, $0000
	copybytetovar wWadeFightCount
	if_equal 4, .Fight4
	if_equal 3, .Fight3
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight4
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight4
.Fight3
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight3
.Fight2
	checkflag ENGINE_FLYPOINT_MAHOGANY
	iftrue .LoadFight2
.Fight1
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iftrue .LoadFight1
.LoadFight0
	loadtrainer BUG_CATCHER, WADE1
	startbattle
	returnafterbattle
	loadvar wWadeFightCount, 1
	clearflag ENGINE_WADE
	end

.LoadFight1
	loadtrainer BUG_CATCHER, WADE2
	startbattle
	returnafterbattle
	loadvar wWadeFightCount, 2
	clearflag ENGINE_WADE
	end

.LoadFight2
	loadtrainer BUG_CATCHER, WADE3
	startbattle
	returnafterbattle
	loadvar wWadeFightCount, 3
	clearflag ENGINE_WADE
	end

.LoadFight3
	loadtrainer BUG_CATCHER, WADE4
	startbattle
	returnafterbattle
	loadvar wWadeFightCount, 4
	clearflag ENGINE_WADE
	end

.LoadFight4
	loadtrainer BUG_CATCHER, WADE5
	startbattle
	returnafterbattle
	clearflag ENGINE_WADE
	end

UnknownScript_0x1a5507:
	scall UnknownScript_0x1a5568
	checkevent EVENT_WADE_HAS_BERRY
	iftrue .Berry
	checkevent EVENT_WADE_HAS_PSNCUREBERRY
	iftrue .Psncureberry
	checkevent EVENT_WADE_HAS_PRZCUREBERRY
	iftrue .Przcureberry
	checkevent EVENT_WADE_HAS_BITTER_BERRY
	iftrue .BitterBerry
.Berry
	verbosegiveitem BERRY, 1
	iffalse .PackFull
	jump .Done
.Psncureberry
	verbosegiveitem PSNCUREBERRY, 1
	iffalse .PackFull
	jump .Done
.Przcureberry
	verbosegiveitem PRZCUREBERRY, 1
	iffalse .PackFull
	jump .Done
.BitterBerry
	verbosegiveitem BITTER_BERRY, 1
	iffalse .PackFull
.Done
	clearflag ENGINE_WADE_HAS_ITEM
	jump UnknownScript_0x1a5558
.PackFull
	jump UnknownScript_0x1a556c

UnknownScript_0x1a554c:
	jumpstd asknumber1m
	end

UnknownScript_0x1a5550:
	jumpstd asknumber2m
	end

UnknownScript_0x1a5554:
	jumpstd registerednumberm
	end

UnknownScript_0x1a5558:
	jumpstd numberacceptedm
	end

UnknownScript_0x1a555c:
	jumpstd numberdeclinedm
	end

UnknownScript_0x1a5560:
	jumpstd phonefullm
	end

UnknownScript_0x1a5564:
	jumpstd rematchm
	end

UnknownScript_0x1a5568:
	jumpstd giftm
	end

UnknownScript_0x1a556c:
	jumpstd packfullm
	end

FisherScript_0x1a5570:
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

UnknownScript_0x1a5584:
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
UnknownScript_0x1a55af:
	writetext UnknownText_0x1a5896
	closetext
UnknownScript_0x1a55b3:
	loadmovesprites
	end

UnknownScript_0x1a55b5:
	writetext UnknownText_0x1a5921
	closetext
	loadmovesprites
	end

UnknownScript_0x1a55bb:
	writetext UnknownText_0x1a5939
	closetext
	loadmovesprites
	end

UnknownScript_0x1a55c1:
	writetext UnknownText_0x1a5972
	closetext
	loadmovesprites
	end

UnknownScript_0x1a55c7:
	writetext UnknownText_0x1a5991
	closetext
	loadmovesprites
	end

ReceivedSpearowMailText:
	db "DARK CAVE leads", $4E
	db "to another road@"

YoungsterScript_0x1a55ed:
	jumptextfaceplayer UnknownText_0x1a59d5

MapRoute31Signpost0Script:
	jumptext UnknownText_0x1a5a45

MapRoute31Signpost1Script:
	jumptext UnknownText_0x1a5a6e

CooltrainerMScript_0x1a55f6:
	jumptextfaceplayer UnknownText_0x1a55ff

FruitTreeScript_0x1a55f9:
	fruittree $7

ItemFragment_0x1a55fb:
	db POTION, 1

ItemFragment_0x1a55fd:
	db POKE_BALL, 1

UnknownText_0x1a55ff:
	text "DARK CAVE…"

	para "If #MON could"
	line "light it up, I'd"
	cont "explore it."
	done

Bug_catcherWade1SeenText:
	text "I caught a bunch"
	line "of #MON. Let me"
	cont "battle with you!"
	done

Bug_catcherWade1BeatenText:
	text "Awwwww…"
	done

UnknownText_0x1a5671:
	text "You can catch"
	line "#MON even if"

	para "you have six with"
	line "you."

	para "If you catch one,"
	line "it'll go to your"
	cont "BOX automatically."
	done

UnknownText_0x1a56d9:
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

UnknownText_0x1a5761:
	text "…Zzzz… Huh?"

	para "What's that? You"
	line "have MAIL for me?"
	done

UnknownText_0x1a5790:
	text "<PLAYER> handed"
	line "over the #MON"
	cont "holding the MAIL."
	done

UnknownText_0x1a57ba:
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

UnknownText_0x1a5896:
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

UnknownText_0x1a5921:
	text "This MAIL isn't"
	line "for me."
	done

UnknownText_0x1a5939:
	text "Why is this #-"
	line "MON so special?"

	para "It doesn't have"
	line "any MAIL."
	done

UnknownText_0x1a5972:
	text "What? You don't"
	line "want anything?"
	done

UnknownText_0x1a5991:
	text "If I take that"
	line "#MON from you,"

	para "what are you going"
	line "to use in battle?"
	done

UnknownText_0x1a59d5:
	text "I found a good"
	line "#MON in DARK"
	cont "CAVE."

	para "I'm going to raise"
	line "it to take on"
	cont "FALKNER."

	para "He's the leader of"
	line "VIOLET CITY's GYM."
	done

UnknownText_0x1a5a45:
	text "ROUTE 31"

	para "VIOLET CITY -"
	line "CHERRYGROVE CITY"
	done

UnknownText_0x1a5a6e:
	text "DARK CAVE"
	done

Route31_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $6, $4, 3, GROUP_ROUTE_31_VIOLET_GATE, MAP_ROUTE_31_VIOLET_GATE
	warp_def $7, $4, 4, GROUP_ROUTE_31_VIOLET_GATE, MAP_ROUTE_31_VIOLET_GATE
	warp_def $5, $22, 1, GROUP_DARK_CAVE_VIOLET_ENTRANCE, MAP_DARK_CAVE_VIOLET_ENTRANCE

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 5, 7, SIGNPOST_READ, MapRoute31Signpost0Script
	signpost 5, 31, SIGNPOST_READ, MapRoute31Signpost1Script

.PersonEvents:
	db 7
	person_event SPRITE_FISHER, 11, 21, OW_UP | $2, $0, -1, -1, $0, 0, FisherScript_0x1a5570, -1
	person_event SPRITE_YOUNGSTER, 9, 13, OW_DOWN | $2, $11, -1, -1, $0, 0, YoungsterScript_0x1a55ed, -1
	person_event SPRITE_BUG_CATCHER, 17, 25, OW_LEFT | $0, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 5, TrainerBug_catcherWade1, -1
	person_event SPRITE_COOLTRAINER_M, 12, 37, OW_DOWN | $2, $11, -1, -1, $0, 0, CooltrainerMScript_0x1a55f6, -1
	person_event SPRITE_FRUIT_TREE, 11, 20, OW_DOWN | $1, $0, -1, -1, $0, 0, FruitTreeScript_0x1a55f9, -1
	person_event SPRITE_POKE_BALL, 9, 33, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x1a55fb, EVENT_ROUTE_31_POTION
	person_event SPRITE_POKE_BALL, 19, 23, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x1a55fd, EVENT_ROUTE_31_POKE_BALL
