Route35_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerBird_keeperBryan:
	trainer EVENT_BEAT_BIRD_KEEPER_BRYAN, BIRD_KEEPER, BRYAN, Bird_keeperBryanSeenText, Bird_keeperBryanBeatenText, $0000, Bird_keeperBryanScript

Bird_keeperBryanScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19cc87
	closetext
	loadmovesprites
	end

TrainerJugglerIrwin:
	trainer EVENT_BEAT_JUGGLER_IRWIN, JUGGLER, IRWIN1, JugglerIrwin1SeenText, JugglerIrwin1BeatenText, $0000, JugglerIrwin1Script

JugglerIrwin1Script:
	writecode VAR_CALLERID, PHONE_JUGGLER_IRWIN
	talkaftercancel
	loadfont
	checkcellnum PHONE_JUGGLER_IRWIN
	iftrue UnknownScript_0x19c90f
	checkevent EVENT_IRWIN_ASKED_FOR_PHONE_NUMBER
	iftrue UnknownScript_0x19c8ec
	writetext UnknownText_0x19cd5a
	keeptextopen
	setevent EVENT_IRWIN_ASKED_FOR_PHONE_NUMBER
	scall UnknownScript_0x19c903
	jump UnknownScript_0x19c8ef

UnknownScript_0x19c8ec:
	scall UnknownScript_0x19c907
UnknownScript_0x19c8ef:
	askforphonenumber PHONE_JUGGLER_IRWIN
	if_equal $1, UnknownScript_0x19c917
	if_equal $2, UnknownScript_0x19c913
	trainertotext JUGGLER, IRWIN1, $0
	scall UnknownScript_0x19c90b
	jump UnknownScript_0x19c90f

UnknownScript_0x19c903:
	jumpstd asknumber1m
	end

UnknownScript_0x19c907:
	jumpstd asknumber2m
	end

UnknownScript_0x19c90b:
	jumpstd registerednumberm
	end

UnknownScript_0x19c90f:
	jumpstd numberacceptedm
	end

UnknownScript_0x19c913:
	jumpstd numberdeclinedm
	end

UnknownScript_0x19c917:
	jumpstd phonefullm
	end

UnknownScript_0x19c91b:
	jumpstd rematchm
	end

TrainerCamperIvan:
	trainer EVENT_BEAT_CAMPER_IVAN, CAMPER, IVAN, CamperIvanSeenText, CamperIvanBeatenText, $0000, CamperIvanScript

CamperIvanScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19cac4
	closetext
	loadmovesprites
	end

TrainerCamperElliot:
	trainer EVENT_BEAT_CAMPER_ELLIOT, CAMPER, ELLIOT, CamperElliotSeenText, CamperElliotBeatenText, $0000, CamperElliotScript

CamperElliotScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19cb47
	closetext
	loadmovesprites
	end

TrainerPicnickerBrooke:
	trainer EVENT_BEAT_PICNICKER_BROOKE, PICNICKER, BROOKE, PicnickerBrookeSeenText, PicnickerBrookeBeatenText, $0000, PicnickerBrookeScript

PicnickerBrookeScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19cbba
	closetext
	loadmovesprites
	end

TrainerPicnickerKim:
	trainer EVENT_BEAT_PICNICKER_KIM, PICNICKER, KIM, PicnickerKimSeenText, PicnickerKimBeatenText, $0000, PicnickerKimScript

PicnickerKimScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19cc21
	closetext
	loadmovesprites
	end

TrainerBug_catcherArnie1:
	trainer EVENT_BEAT_BUG_CATCHER_ARNIE, BUG_CATCHER, ARNIE1, Bug_catcherArnie1SeenText, Bug_catcherArnie1BeatenText, $0000, Bug_catcherArnie1Script

Bug_catcherArnie1Script:
	writecode VAR_CALLERID, PHONE_BUG_CATCHER_ARNIE
	talkaftercancel
	loadfont
	checkflag ENGINE_ARNIE
	iftrue UnknownScript_0x19c9bb
	checkflag ENGINE_YANMA_SWARM
	iftrue UnknownScript_0x19ca2f
	checkcellnum PHONE_BUG_CATCHER_ARNIE
	iftrue UnknownScript_0x19c90f
	checkevent EVENT_ARNIE_ASKED_FOR_PHONE_NUMBER
	iftrue UnknownScript_0x19c9a4
	writetext UnknownText_0x19cdf6
	keeptextopen
	setevent EVENT_ARNIE_ASKED_FOR_PHONE_NUMBER
	scall UnknownScript_0x19c903
	jump UnknownScript_0x19c9a7

UnknownScript_0x19c9a4:
	scall UnknownScript_0x19c907
UnknownScript_0x19c9a7:
	askforphonenumber PHONE_BUG_CATCHER_ARNIE
	if_equal $1, UnknownScript_0x19c917
	if_equal $2, UnknownScript_0x19c913
	trainertotext BUG_CATCHER, ARNIE1, $0
	scall UnknownScript_0x19c90b
	jump UnknownScript_0x19c90f

UnknownScript_0x19c9bb:
	scall UnknownScript_0x19c91b
	winlosstext Bug_catcherArnie1BeatenText, $0000
	copybytetovar wArnieFightCount
	if_equal 4, .Fight4
	if_equal 3, .Fight3
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight4
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight4
.Fight3
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
.Fight2
	checkflag ENGINE_FLYPOINT_BLACKTHORN
	iftrue .LoadFight2
.Fight1
	checkflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	iftrue .LoadFight1
.LoadFight0
	loadtrainer BUG_CATCHER, ARNIE1
	startbattle
	returnafterbattle
	loadvar wArnieFightCount, 1
	clearflag ENGINE_ARNIE
	end

.LoadFight1
	loadtrainer BUG_CATCHER, ARNIE2
	startbattle
	returnafterbattle
	loadvar wArnieFightCount, 2
	clearflag ENGINE_ARNIE
	end

.LoadFight2
	loadtrainer BUG_CATCHER, ARNIE3
	startbattle
	returnafterbattle
	loadvar wArnieFightCount, 3
	clearflag ENGINE_ARNIE
	end

.LoadFight3
	loadtrainer BUG_CATCHER, ARNIE4
	startbattle
	returnafterbattle
	loadvar wArnieFightCount, 4
	clearflag ENGINE_ARNIE
	end

.LoadFight4
	loadtrainer BUG_CATCHER, ARNIE5
	startbattle
	returnafterbattle
	clearflag ENGINE_ARNIE
	end

UnknownScript_0x19ca2f:
	writetext UnknownText_0x19ce38
	closetext
	loadmovesprites
	end

TrainerFirebreatherWalt:
	trainer EVENT_BEAT_FIREBREATHER_WALT, FIREBREATHER, WALT, FirebreatherWaltSeenText, FirebreatherWaltBeatenText, $0000, FirebreatherWaltScript

FirebreatherWaltScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19cebc
	closetext
	loadmovesprites
	end

OfficerScript_0x19ca49:
	faceplayer
	loadfont
	checknite
	iffalse UnknownScript_0x19ca73
	checkevent EVENT_BEAT_OFFICER_DIRK
	iftrue UnknownScript_0x19ca6d
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext UnknownText_0x19ceea
	closetext
	loadmovesprites
	winlosstext UnknownText_0x19cf06, $0000
	loadtrainer OFFICER, DIRK
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_OFFICER_DIRK
	loadmovesprites
	end

UnknownScript_0x19ca6d:
	writetext UnknownText_0x19cf0f
	closetext
	loadmovesprites
	end

UnknownScript_0x19ca73:
	writetext UnknownText_0x19cf56
	closetext
	loadmovesprites
	end

MapRoute35Signpost1Script:
	jumptext UnknownText_0x19cf94

ItemFragment_0x19ca7c:
	db TM_ROLLOUT, 1

FruitTreeScript_0x19ca7e:
	fruittree $b

CamperIvanSeenText:
	text "I've been getting"
	line "#MON data off"

	para "my radio. I think"
	line "I'm good."
	done

CamperIvanBeatenText:
	text "I give!"
	done

UnknownText_0x19cac4:
	text "Music on the radio"
	line "changes the moods"
	cont "of wild #MON."
	done

CamperElliotSeenText:
	text "I'm gonna show my"
	line "girlfriend I'm hot"
	cont "stuff!"
	done

CamperElliotBeatenText:
	text "I wish you would"
	line "have lost for me…"
	done

UnknownText_0x19cb47:
	text "I was humiliated"
	line "in front of my"
	cont "girlfriend…"
	done

PicnickerBrookeSeenText:
	text "My boyfriend's"
	line "weak, so I can't"
	cont "rely on him."
	done

PicnickerBrookeBeatenText:
	text "Oh, my! You're so"
	line "strong!"
	done

UnknownText_0x19cbba:
	text "I can count on my"
	line "#MON more than"
	cont "my boyfriend."
	done

PicnickerKimSeenText:
	text "Are you going to"
	line "the GYM? Me too!"
	done

PicnickerKimBeatenText:
	text "Oh. I couldn't"
	line "win…"
	done

UnknownText_0x19cc21:
	text "The GYM BADGES are"
	line "pretty. I collect"
	cont "them."
	done

Bird_keeperBryanSeenText:
	text "What kinds of"
	line "BALLS do you use?"
	done

Bird_keeperBryanBeatenText:
	text "Yikes! Not fast"
	line "enough!"
	done

UnknownText_0x19cc87:
	text "Some #MON flee"
	line "right away."

	para "Try catching them"
	line "with KURT's FAST"
	cont "BALL."

	para "Whenever I find a"
	line "WHT APRICORN, I"
	cont "take it to KURT."

	para "He turns it into a"
	line "custom BALL."
	done

JugglerIrwin1SeenText:
	text "Behold my graceful"
	line "BALL dexterity!"
	done

JugglerIrwin1BeatenText:
	text "Whew! That was a"
	line "jolt!"
	done

UnknownText_0x19cd5a:
	text "I was going to"
	line "dazzle you with my"
	cont "prize #MON."

	para "But your prowess"
	line "electrified me!"
	done

Bug_catcherArnie1SeenText:
	text "I'll go anywhere"
	line "if bug #MON"
	cont "appear there."
	done

Bug_catcherArnie1BeatenText:
	text "Huh? I shouldn't"
	line "have lost that…"
	done

UnknownText_0x19cdf6:
	text "My VENONAT won me"
	line "the Bug-Catching"

	para "Contest at the"
	line "NATIONAL PARK."
	done

UnknownText_0x19ce38:
	text "Wow… Look at all"
	line "those YANMA!"

	para "I'm so blown away,"
	line "I can't move."
	done

FirebreatherWaltSeenText:
	text "I'm practicing my"
	line "fire breathing."
	done

FirebreatherWaltBeatenText:
	text "Ow! I scorched the"
	line "tip of my nose!"
	done

UnknownText_0x19cebc:
	text "The #MON March"
	line "on the radio lures"
	cont "wild #MON."
	done

UnknownText_0x19ceea:
	text "Danger lurks in"
	line "the night!"
	done

UnknownText_0x19cf06:
	text "Whoops!"
	done

UnknownText_0x19cf0f:
	text "You know, night-"
	line "time is fun in its"
	cont "own ways."

	para "But don't overdo"
	line "it, OK?"
	done

UnknownText_0x19cf56:
	text "Your #MON look"
	line "pretty tough."

	para "You could go any-"
	line "where safely."
	done

UnknownText_0x19cf94:
	text "ROUTE 35"
	done

Route35_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $21, $9, 1, GROUP_ROUTE_35_GOLDENROD_GATE, MAP_ROUTE_35_GOLDENROD_GATE
	warp_def $21, $a, 2, GROUP_ROUTE_35_GOLDENROD_GATE, MAP_ROUTE_35_GOLDENROD_GATE
	warp_def $5, $3, 3, GROUP_ROUTE_35_NATIONAL_PARK_GATE, MAP_ROUTE_35_NATIONAL_PARK_GATE

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 7, 1, SIGNPOST_READ, MapRoute35Signpost1Script
	signpost 31, 11, SIGNPOST_READ, MapRoute35Signpost1Script

.PersonEvents:
	db 11
	person_event SPRITE_YOUNGSTER, 23, 8, OW_LEFT | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 2, TrainerCamperIvan, -1
	person_event SPRITE_YOUNGSTER, 24, 12, OW_UP | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 3, TrainerCamperElliot, -1
	person_event SPRITE_LASS, 24, 11, OW_UP | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 3, TrainerPicnickerBrooke, -1
	person_event SPRITE_LASS, 30, 14, OW_LEFT | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 1, TrainerPicnickerKim, -1
	person_event SPRITE_YOUNGSTER, 32, 18, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 0, TrainerBird_keeperBryan, -1
	person_event SPRITE_FISHER, 14, 6, OW_RIGHT | $12, $0, -1, -1, (PAL_OW_RED << 4) | $82, 2, TrainerFirebreatherWalt, -1
	person_event SPRITE_BUG_CATCHER, 11, 20, OW_UP | $2, $2, -1, -1, (PAL_OW_BROWN << 4) | $82, 3, TrainerBug_catcherArnie1, -1
	person_event SPRITE_SUPER_NERD, 14, 9, OW_LEFT | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 2, TrainerJugglerIrwin, -1
	person_event SPRITE_OFFICER, 10, 9, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, OfficerScript_0x19ca49, -1
	person_event SPRITE_FRUIT_TREE, 29, 6, OW_DOWN | $1, $0, -1, -1, $0, 0, FruitTreeScript_0x19ca7e, -1
	person_event SPRITE_POKE_BALL, 20, 17, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x19ca7c, EVENT_ROUTE_35_TM_ROLLOUT
