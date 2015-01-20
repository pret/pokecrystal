Route35_MapScriptHeader: ; 0x19c8ad
	; trigger count
	db 0

	; callback count
	db 0
; 0x19c8af

TrainerBird_keeperBryan: ; 0x19c8af
	; bit/flag number
	dw $3fd

	; trainer group && trainer id
	db BIRD_KEEPER, BRYAN

	; text when seen
	dw Bird_keeperBryanSeenText

	; text when trainer beaten
	dw Bird_keeperBryanBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bird_keeperBryanScript
; 0x19c8bb

Bird_keeperBryanScript: ; 0x19c8bb
	talkaftercancel
	loadfont
	writetext UnknownText_0x19cc87
	closetext
	loadmovesprites
	end
; 0x19c8c3

TrainerJugglerIrwin1: ; 0x19c8c3
	; bit/flag number
	dw $495

	; trainer group && trainer id
	db JUGGLER, IRWIN1

	; text when seen
	dw JugglerIrwin1SeenText

	; text when trainer beaten
	dw JugglerIrwin1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw JugglerIrwin1Script
; 0x19c8cf

JugglerIrwin1Script: ; 0x19c8cf
	writecode $17, $16
	talkaftercancel
	loadfont
	checkcellnum $16
	iftrue UnknownScript_0x19c90f
	checkevent $0281
	iftrue UnknownScript_0x19c8ec
	writetext UnknownText_0x19cd5a
	keeptextopen
	setevent $0281
	scall UnknownScript_0x19c903
	jump UnknownScript_0x19c8ef
; 0x19c8ec

UnknownScript_0x19c8ec: ; 0x19c8ec
	scall UnknownScript_0x19c907
UnknownScript_0x19c8ef: ; 0x19c8ef
	askforphonenumber $16
	if_equal $1, UnknownScript_0x19c917
	if_equal $2, UnknownScript_0x19c913
	trainertotext JUGGLER, IRWIN1, $0
	scall UnknownScript_0x19c90b
	jump UnknownScript_0x19c90f
; 0x19c903

UnknownScript_0x19c903: ; 0x19c903
	jumpstd $0019
	end
; 0x19c907

UnknownScript_0x19c907: ; 0x19c907
	jumpstd $001a
	end
; 0x19c90b

UnknownScript_0x19c90b: ; 0x19c90b
	jumpstd $001b
	end
; 0x19c90f

UnknownScript_0x19c90f: ; 0x19c90f
	jumpstd $001c
	end
; 0x19c913

UnknownScript_0x19c913: ; 0x19c913
	jumpstd $001d
	end
; 0x19c917

UnknownScript_0x19c917: ; 0x19c917
	jumpstd $001e
	end
; 0x19c91b

UnknownScript_0x19c91b: ; 0x19c91b
	jumpstd $001f
	end
; 0x19c91f

TrainerCamperIvan: ; 0x19c91f
	; bit/flag number
	dw $41c

	; trainer group && trainer id
	db CAMPER, IVAN

	; text when seen
	dw CamperIvanSeenText

	; text when trainer beaten
	dw CamperIvanBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CamperIvanScript
; 0x19c92b

CamperIvanScript: ; 0x19c92b
	talkaftercancel
	loadfont
	writetext UnknownText_0x19cac4
	closetext
	loadmovesprites
	end
; 0x19c933

TrainerCamperElliot: ; 0x19c933
	; bit/flag number
	dw $41d

	; trainer group && trainer id
	db CAMPER, ELLIOT

	; text when seen
	dw CamperElliotSeenText

	; text when trainer beaten
	dw CamperElliotBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CamperElliotScript
; 0x19c93f

CamperElliotScript: ; 0x19c93f
	talkaftercancel
	loadfont
	writetext UnknownText_0x19cb47
	closetext
	loadmovesprites
	end
; 0x19c947

TrainerPicnickerBrooke: ; 0x19c947
	; bit/flag number
	dw $480

	; trainer group && trainer id
	db PICNICKER, BROOKE

	; text when seen
	dw PicnickerBrookeSeenText

	; text when trainer beaten
	dw PicnickerBrookeBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PicnickerBrookeScript
; 0x19c953

PicnickerBrookeScript: ; 0x19c953
	talkaftercancel
	loadfont
	writetext UnknownText_0x19cbba
	closetext
	loadmovesprites
	end
; 0x19c95b

TrainerPicnickerKim: ; 0x19c95b
	; bit/flag number
	dw $481

	; trainer group && trainer id
	db PICNICKER, KIM

	; text when seen
	dw PicnickerKimSeenText

	; text when trainer beaten
	dw PicnickerKimBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PicnickerKimScript
; 0x19c967

PicnickerKimScript: ; 0x19c967
	talkaftercancel
	loadfont
	writetext UnknownText_0x19cc21
	closetext
	loadmovesprites
	end
; 0x19c96f

TrainerBug_catcherArnie1: ; 0x19c96f
	; bit/flag number
	dw $53f

	; trainer group && trainer id
	db BUG_CATCHER, ARNIE1

	; text when seen
	dw Bug_catcherArnie1SeenText

	; text when trainer beaten
	dw Bug_catcherArnie1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bug_catcherArnie1Script
; 0x19c97b

Bug_catcherArnie1Script: ; 0x19c97b
	writecode $17, $17
	talkaftercancel
	loadfont
	checkflag $0072
	iftrue UnknownScript_0x19c9bb
	checkflag $00a1
	iftrue UnknownScript_0x19ca2f
	checkcellnum $17
	iftrue UnknownScript_0x19c90f
	checkevent $0283
	iftrue UnknownScript_0x19c9a4
	writetext UnknownText_0x19cdf6
	keeptextopen
	setevent $0283
	scall UnknownScript_0x19c903
	jump UnknownScript_0x19c9a7
; 0x19c9a4

UnknownScript_0x19c9a4: ; 0x19c9a4
	scall UnknownScript_0x19c907
UnknownScript_0x19c9a7: ; 0x19c9a7
	askforphonenumber $17
	if_equal $1, UnknownScript_0x19c917
	if_equal $2, UnknownScript_0x19c913
	trainertotext BUG_CATCHER, ARNIE1, $0
	scall UnknownScript_0x19c90b
	jump UnknownScript_0x19c90f
; 0x19c9bb

UnknownScript_0x19c9bb: ; 0x19c9bb
	scall UnknownScript_0x19c91b
	winlosstext Bug_catcherArnie1BeatenText, $0000
	copybytetovar $da01
	if_equal $4, UnknownScript_0x19c9da
	if_equal $3, UnknownScript_0x19c9e0
	if_equal $2, UnknownScript_0x19c9e6
	if_equal $1, UnknownScript_0x19c9ec
	if_equal $0, UnknownScript_0x19c9f2
UnknownScript_0x19c9da: ; 0x19c9da
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue UnknownScript_0x19ca26
UnknownScript_0x19c9e0: ; 0x19c9e0
	checkevent $0044
	iftrue UnknownScript_0x19ca19
UnknownScript_0x19c9e6: ; 0x19c9e6
	checkflag $004b
	iftrue UnknownScript_0x19ca0c
UnknownScript_0x19c9ec: ; 0x19c9ec
	checkflag $004a
	iftrue UnknownScript_0x19c9ff
UnknownScript_0x19c9f2: ; 0x19c9f2
	loadtrainer BUG_CATCHER, ARNIE1
	startbattle
	returnafterbattle
	loadvar $da01, $1
	clearflag $0072
	end
; 0x19c9ff

UnknownScript_0x19c9ff: ; 0x19c9ff
	loadtrainer BUG_CATCHER, ARNIE2
	startbattle
	returnafterbattle
	loadvar $da01, $2
	clearflag $0072
	end
; 0x19ca0c

UnknownScript_0x19ca0c: ; 0x19ca0c
	loadtrainer BUG_CATCHER, ARNIE3
	startbattle
	returnafterbattle
	loadvar $da01, $3
	clearflag $0072
	end
; 0x19ca19

UnknownScript_0x19ca19: ; 0x19ca19
	loadtrainer BUG_CATCHER, ARNIE4
	startbattle
	returnafterbattle
	loadvar $da01, $4
	clearflag $0072
	end
; 0x19ca26

UnknownScript_0x19ca26: ; 0x19ca26
	loadtrainer BUG_CATCHER, ARNIE5
	startbattle
	returnafterbattle
	clearflag $0072
	end
; 0x19ca2f

UnknownScript_0x19ca2f: ; 0x19ca2f
	writetext UnknownText_0x19ce38
	closetext
	loadmovesprites
	end
; 0x19ca35

TrainerFirebreatherWalt: ; 0x19ca35
	; bit/flag number
	dw $44b

	; trainer group && trainer id
	db FIREBREATHER, WALT

	; text when seen
	dw FirebreatherWaltSeenText

	; text when trainer beaten
	dw FirebreatherWaltBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw FirebreatherWaltScript
; 0x19ca41

FirebreatherWaltScript: ; 0x19ca41
	talkaftercancel
	loadfont
	writetext UnknownText_0x19cebc
	closetext
	loadmovesprites
	end
; 0x19ca49

OfficerScript_0x19ca49: ; 0x19ca49
	faceplayer
	loadfont
	checktime $4
	iffalse UnknownScript_0x19ca73
	checkevent $0547
	iftrue UnknownScript_0x19ca6d
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext UnknownText_0x19ceea
	closetext
	loadmovesprites
	winlosstext UnknownText_0x19cf06, $0000
	loadtrainer OFFICER, DIRK
	startbattle
	returnafterbattle
	setevent $0547
	loadmovesprites
	end
; 0x19ca6d

UnknownScript_0x19ca6d: ; 0x19ca6d
	writetext UnknownText_0x19cf0f
	closetext
	loadmovesprites
	end
; 0x19ca73

UnknownScript_0x19ca73: ; 0x19ca73
	writetext UnknownText_0x19cf56
	closetext
	loadmovesprites
	end
; 0x19ca79

MapRoute35Signpost1Script: ; 0x19ca79
	jumptext UnknownText_0x19cf94
; 0x19ca7c

ItemFragment_0x19ca7c: ; 0x19ca7c
	db TM_04, 1
; 0x19ca7e

FruitTreeScript_0x19ca7e: ; 0x19ca7e
	fruittree $b
; 0x19ca80

CamperIvanSeenText: ; 0x19ca80
	text "I've been getting"
	line "#MON data off"

	para "my radio. I think"
	line "I'm good."
	done
; 0x19cabb

CamperIvanBeatenText: ; 0x19cabb
	text "I give!"
	done
; 0x19cac4

UnknownText_0x19cac4: ; 0x19cac4
	text "Music on the radio"
	line "changes the moods"
	cont "of wild #MON."
	done
; 0x19caf8

CamperElliotSeenText: ; 0x19caf8
	text "I'm gonna show my"
	line "girlfriend I'm hot"
	cont "stuff!"
	done
; 0x19cb23

CamperElliotBeatenText: ; 0x19cb23
	text "I wish you would"
	line "have lost for me…"
	done
; 0x19cb47

UnknownText_0x19cb47: ; 0x19cb47
	text "I was humiliated"
	line "in front of my"
	cont "girlfriend…"
	done
; 0x19cb74

PicnickerBrookeSeenText: ; 0x19cb74
	text "My boyfriend's"
	line "weak, so I can't"
	cont "rely on him."
	done
; 0x19cba0

PicnickerBrookeBeatenText: ; 0x19cba0
	text "Oh, my! You're so"
	line "strong!"
	done
; 0x19cbba

UnknownText_0x19cbba: ; 0x19cbba
	text "I can count on my"
	line "#MON more than"
	cont "my boyfriend."
	done
; 0x19cbea

PicnickerKimSeenText: ; 0x19cbea
	text "Are you going to"
	line "the GYM? Me too!"
	done
; 0x19cc0d

PicnickerKimBeatenText: ; 0x19cc0d
	text "Oh. I couldn't"
	line "win…"
	done
; 0x19cc21

UnknownText_0x19cc21: ; 0x19cc21
	text "The GYM BADGES are"
	line "pretty. I collect"
	cont "them."
	done
; 0x19cc4d

Bird_keeperBryanSeenText: ; 0x19cc4d
	text "What kinds of"
	line "BALLS do you use?"
	done
; 0x19cc6e

Bird_keeperBryanBeatenText: ; 0x19cc6e
	text "Yikes! Not fast"
	line "enough!"
	done
; 0x19cc87

UnknownText_0x19cc87: ; 0x19cc87
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
; 0x19cd1e

JugglerIrwin1SeenText: ; 0x19cd1e
	text "Behold my graceful"
	line "BALL dexterity!"
	done
; 0x19cd42

JugglerIrwin1BeatenText: ; 0x19cd42
	text "Whew! That was a"
	line "jolt!"
	done
; 0x19cd5a

UnknownText_0x19cd5a: ; 0x19cd5a
	text "I was going to"
	line "dazzle you with my"
	cont "prize #MON."

	para "But your prowess"
	line "electrified me!"
	done
; 0x19cdaa

Bug_catcherArnie1SeenText: ; 0x19cdaa
	text "I'll go anywhere"
	line "if bug #MON"
	cont "appear there."
	done
; 0x19cdd5

Bug_catcherArnie1BeatenText: ; 0x19cdd5
	text "Huh? I shouldn't"
	line "have lost that…"
	done
; 0x19cdf6

UnknownText_0x19cdf6: ; 0x19cdf6
	text "My VENONAT won me"
	line "the Bug-Catching"

	para "Contest at the"
	line "NATIONAL PARK."
	done
; 0x19ce38

UnknownText_0x19ce38: ; 0x19ce38
	text "Wow… Look at all"
	line "those YANMA!"

	para "I'm so blown away,"
	line "I can't move."
	done
; 0x19ce76

FirebreatherWaltSeenText: ; 0x19ce76
	text "I'm practicing my"
	line "fire breathing."
	done
; 0x19ce98

FirebreatherWaltBeatenText: ; 0x19ce98
	text "Ow! I scorched the"
	line "tip of my nose!"
	done
; 0x19cebc

UnknownText_0x19cebc: ; 0x19cebc
	text "The #MON March"
	line "on the radio lures"
	cont "wild #MON."
	done
; 0x19ceea

UnknownText_0x19ceea: ; 0x19ceea
	text "Danger lurks in"
	line "the night!"
	done
; 0x19cf06

UnknownText_0x19cf06: ; 0x19cf06
	text "Whoops!"
	done
; 0x19cf0f

UnknownText_0x19cf0f: ; 0x19cf0f
	text "You know, night-"
	line "time is fun in its"
	cont "own ways."

	para "But don't overdo"
	line "it, OK?"
	done
; 0x19cf56

UnknownText_0x19cf56: ; 0x19cf56
	text "Your #MON look"
	line "pretty tough."

	para "You could go any-"
	line "where safely."
	done
; 0x19cf94

UnknownText_0x19cf94: ; 0x19cf94
	text "ROUTE 35"
	done
; 0x19cf9e

Route35_MapEventHeader: ; 0x19cf9e
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $21, $9, 1, GROUP_ROUTE_35_GOLDENROD_GATE, MAP_ROUTE_35_GOLDENROD_GATE
	warp_def $21, $a, 2, GROUP_ROUTE_35_GOLDENROD_GATE, MAP_ROUTE_35_GOLDENROD_GATE
	warp_def $5, $3, 3, GROUP_ROUTE_35_NATIONAL_PARK_GATE, MAP_ROUTE_35_NATIONAL_PARK_GATE

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 7, 1, $0, MapRoute35Signpost1Script
	signpost 31, 11, $0, MapRoute35Signpost1Script

	; people-events
	db 11
	person_event SPRITE_YOUNGSTER, 23, 8, $a, $0, 255, 255, $a2, 2, TrainerCamperIvan, $ffff
	person_event SPRITE_YOUNGSTER, 24, 12, $6, $0, 255, 255, $a2, 3, TrainerCamperElliot, $ffff
	person_event SPRITE_LASS, 24, 11, $6, $0, 255, 255, $a2, 3, TrainerPicnickerBrooke, $ffff
	person_event SPRITE_LASS, 30, 14, $a, $0, 255, 255, $a2, 1, TrainerPicnickerKim, $ffff
	person_event SPRITE_YOUNGSTER, 32, 18, $6, $0, 255, 255, $92, 0, TrainerBird_keeperBryan, $ffff
	person_event SPRITE_FISHER, 14, 6, $1e, $0, 255, 255, $82, 2, TrainerFirebreatherWalt, $ffff
	person_event SPRITE_BUG_CATCHER, 11, 20, $6, $2, 255, 255, $b2, 3, TrainerBug_catcherArnie1, $ffff
	person_event SPRITE_SUPER_NERD, 14, 9, $a, $0, 255, 255, $92, 2, TrainerJugglerIrwin1, $ffff
	person_event SPRITE_OFFICER, 10, 9, $6, $0, 255, 255, $90, 0, OfficerScript_0x19ca49, $ffff
	person_event SPRITE_FRUIT_TREE, 29, 6, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x19ca7e, $ffff
	person_event SPRITE_POKE_BALL, 20, 17, $1, $0, 255, 255, $1, 0, ItemFragment_0x19ca7c, $06b2
; 0x19d04c

