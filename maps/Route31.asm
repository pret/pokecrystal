const_value set 2
	const ROUTE31_FISHER
	const ROUTE31_YOUNGSTER
	const ROUTE31_BUG_CATCHER
	const ROUTE31_COOLTRAINER_M
	const ROUTE31_FRUIT_TREE
	const ROUTE31_POKE_BALL1
	const ROUTE31_POKE_BALL2

Route31_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw 5, .CheckMomCall

.CheckMomCall:
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iffalse .DoMomCall
	return

.DoMomCall:
	specialphonecall SPECIALCALL_WORRIED
	return

TrainerBug_catcherWade1:
	trainer EVENT_BEAT_BUG_CATCHER_WADE, BUG_CATCHER, WADE1, Bug_catcherWade1SeenText, Bug_catcherWade1BeatenText, 0, Bug_catcherWade1Script

Bug_catcherWade1Script:
	writecode VAR_CALLERID, PHONE_BUG_CATCHER_WADE
	end_if_just_battled
	loadfont
	checkflag ENGINE_WADE
	iftrue .WadeRematch
	checkflag ENGINE_WADE_HAS_ITEM
	iftrue .WadeItem
	checkcellnum PHONE_BUG_CATCHER_WADE
	iftrue .AcceptedNumberSTD
	checkevent EVENT_WADE_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext UnknownText_0x1a5671
	waitbutton
	setevent EVENT_WADE_ASKED_FOR_PHONE_NUMBER
	scall .AskPhoneNumberSTD
	jump .Continue

.AskAgain:
	scall .AskAgainSTD
.Continue:
	askforphonenumber PHONE_BUG_CATCHER_WADE
	if_equal $1, .PhoneFullSTD
	if_equal $2, .DeclinedNumberSTD
	trainertotext BUG_CATCHER, WADE1, $0
	scall .RegisterNumberSTD
	jump .AcceptedNumberSTD

.WadeRematch:
	scall .RematchSTD
	winlosstext Bug_catcherWade1BeatenText, 0
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
	scriptedtrainerdata BUG_CATCHER, WADE1
	startbattle
	returnafterbattle
	loadvar wWadeFightCount, 1
	clearflag ENGINE_WADE
	end

.LoadFight1
	scriptedtrainerdata BUG_CATCHER, WADE2
	startbattle
	returnafterbattle
	loadvar wWadeFightCount, 2
	clearflag ENGINE_WADE
	end

.LoadFight2
	scriptedtrainerdata BUG_CATCHER, WADE3
	startbattle
	returnafterbattle
	loadvar wWadeFightCount, 3
	clearflag ENGINE_WADE
	end

.LoadFight3
	scriptedtrainerdata BUG_CATCHER, WADE4
	startbattle
	returnafterbattle
	loadvar wWadeFightCount, 4
	clearflag ENGINE_WADE
	end

.LoadFight4
	scriptedtrainerdata BUG_CATCHER, WADE5
	startbattle
	returnafterbattle
	clearflag ENGINE_WADE
	end

.WadeItem:
	scall .ItemSTD
	checkevent EVENT_WADE_HAS_BERRY
	iftrue .Berry
	checkevent EVENT_WADE_HAS_PSNCUREBERRY
	iftrue .Psncureberry
	checkevent EVENT_WADE_HAS_PRZCUREBERRY
	iftrue .Przcureberry
	checkevent EVENT_WADE_HAS_BITTER_BERRY
	iftrue .BitterBerry
.Berry
	verbosegiveitem BERRY
	iffalse .PackFull
	jump .Done
.Psncureberry
	verbosegiveitem PSNCUREBERRY
	iffalse .PackFull
	jump .Done
.Przcureberry
	verbosegiveitem PRZCUREBERRY
	iffalse .PackFull
	jump .Done
.BitterBerry
	verbosegiveitem BITTER_BERRY
	iffalse .PackFull
.Done
	clearflag ENGINE_WADE_HAS_ITEM
	jump .AcceptedNumberSTD
.PackFull
	jump .PackFullSTD

.AskPhoneNumberSTD:
	jumpstd asknumber1m
	end

.AskAgainSTD:
	jumpstd asknumber2m
	end

.RegisterNumberSTD:
	jumpstd registerednumberm
	end

.AcceptedNumberSTD:
	jumpstd numberacceptedm
	end

.DeclinedNumberSTD:
	jumpstd numberdeclinedm
	end

.PhoneFullSTD:
	jumpstd phonefullm
	end

.RematchSTD:
	jumpstd rematchm
	end

.ItemSTD:
	jumpstd giftm
	end

.PackFullSTD:
	jumpstd packfullm
	end

FisherScript_0x1a5570:
	faceplayer
	loadfont
	checkevent EVENT_GOT_TM50_NIGHTMARE
	iftrue .DescribeNightmare
	checkevent EVENT_GOT_KENYA
	iftrue .TryGiveKenya
	writetext UnknownText_0x1a56d9
	waitbutton
	closetext
	end

.TryGiveKenya:
	writetext UnknownText_0x1a5761
	buttonsound
	checkpokeitem ReceivedSpearowMailText
	if_equal $0, .WrongMail
	if_equal $2, .Refused
	if_equal $3, .NoMail
	if_equal $4, .LastMon
	writetext UnknownText_0x1a5790
	buttonsound
	writetext UnknownText_0x1a57ba
	buttonsound
	setevent EVENT_GAVE_KENYA
	verbosegiveitem TM_NIGHTMARE
	iffalse .NoRoomForItems
	setevent EVENT_GOT_TM50_NIGHTMARE
.DescribeNightmare:
	writetext UnknownText_0x1a5896
	waitbutton
.NoRoomForItems:
	closetext
	end

.WrongMail:
	writetext UnknownText_0x1a5921
	waitbutton
	closetext
	end

.NoMail:
	writetext UnknownText_0x1a5939
	waitbutton
	closetext
	end

.Refused:
	writetext UnknownText_0x1a5972
	waitbutton
	closetext
	end

.LastMon:
	writetext UnknownText_0x1a5991
	waitbutton
	closetext
	end

ReceivedSpearowMailText:
	db   "DARK CAVE leads"
	next "to another road@"

YoungsterScript_0x1a55ed:
	jumptextfaceplayer UnknownText_0x1a59d5

MapRoute31Signpost0Script:
	jumptext UnknownText_0x1a5a45

MapRoute31Signpost1Script:
	jumptext UnknownText_0x1a5a6e

CooltrainerMScript_0x1a55f6:
	jumptextfaceplayer UnknownText_0x1a55ff

FruitTreeScript_0x1a55f9:
	fruittree FRUITTREE_ROUTE_31

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
	warp_def $6, $4, 3, ROUTE_31_VIOLET_GATE
	warp_def $7, $4, 4, ROUTE_31_VIOLET_GATE
	warp_def $5, $22, 1, DARK_CAVE_VIOLET_ENTRANCE

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 5, 7, SIGNPOST_READ, MapRoute31Signpost0Script
	signpost 5, 31, SIGNPOST_READ, MapRoute31Signpost1Script

.PersonEvents:
	db 7
	person_event SPRITE_FISHER, 7, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FisherScript_0x1a5570, -1
	person_event SPRITE_YOUNGSTER, 5, 9, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x1a55ed, -1
	person_event SPRITE_BUG_CATCHER, 13, 21, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 5, TrainerBug_catcherWade1, -1
	person_event SPRITE_COOLTRAINER_M, 8, 33, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CooltrainerMScript_0x1a55f6, -1
	person_event SPRITE_FRUIT_TREE, 7, 16, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FruitTreeScript_0x1a55f9, -1
	person_event SPRITE_POKE_BALL, 5, 29, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMFRAGMENT, 0, ItemFragment_0x1a55fb, EVENT_ROUTE_31_POTION
	person_event SPRITE_POKE_BALL, 15, 19, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMFRAGMENT, 0, ItemFragment_0x1a55fd, EVENT_ROUTE_31_POKE_BALL
