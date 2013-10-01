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
	2writetext UnknownText_0x19cc87
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
	2writetext UnknownText_0x19cd5a
	keeptextopen
	setevent $0281
	2call UnknownScript_0x19c903
	2jump UnknownScript_0x19c8ef
; 0x19c8ec

UnknownScript_0x19c8ec: ; 0x19c8ec
	2call UnknownScript_0x19c907
UnknownScript_0x19c8ef: ; 0x19c8ef
	askforphonenumber $16
	if_equal $1, UnknownScript_0x19c917
	if_equal $2, UnknownScript_0x19c913
	trainertotext JUGGLER, IRWIN1, $0
	2call UnknownScript_0x19c90b
	2jump UnknownScript_0x19c90f
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
	2writetext UnknownText_0x19cac4
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
	2writetext UnknownText_0x19cb47
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
	2writetext UnknownText_0x19cbba
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
	2writetext UnknownText_0x19cc21
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
	2writetext UnknownText_0x19cdf6
	keeptextopen
	setevent $0283
	2call UnknownScript_0x19c903
	2jump UnknownScript_0x19c9a7
; 0x19c9a4

UnknownScript_0x19c9a4: ; 0x19c9a4
	2call UnknownScript_0x19c907
UnknownScript_0x19c9a7: ; 0x19c9a7
	askforphonenumber $17
	if_equal $1, UnknownScript_0x19c917
	if_equal $2, UnknownScript_0x19c913
	trainertotext BUG_CATCHER, ARNIE1, $0
	2call UnknownScript_0x19c90b
	2jump UnknownScript_0x19c90f
; 0x19c9bb

UnknownScript_0x19c9bb: ; 0x19c9bb
	2call UnknownScript_0x19c91b
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
	2writetext UnknownText_0x19ce38
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
	2writetext UnknownText_0x19cebc
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
	playmusic $000c
	2writetext UnknownText_0x19ceea
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
	2writetext UnknownText_0x19cf0f
	closetext
	loadmovesprites
	end
; 0x19ca73

UnknownScript_0x19ca73: ; 0x19ca73
	2writetext UnknownText_0x19cf56
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
	db $0, "I've been getting", $4f
	db "#MON data off", $51
	db "my radio. I think", $4f
	db "I'm good.", $57
; 0x19cabb

CamperIvanBeatenText: ; 0x19cabb
	db $0, "I give!", $57
; 0x19cac4

UnknownText_0x19cac4: ; 0x19cac4
	db $0, "Music on the radio", $4f
	db "changes the moods", $55
	db "of wild #MON.", $57
; 0x19caf8

CamperElliotSeenText: ; 0x19caf8
	db $0, "I'm gonna show my", $4f
	db "girlfriend I'm hot", $55
	db "stuff!", $57
; 0x19cb23

CamperElliotBeatenText: ; 0x19cb23
	db $0, "I wish you would", $4f
	db "have lost for me…", $57
; 0x19cb47

UnknownText_0x19cb47: ; 0x19cb47
	db $0, "I was humiliated", $4f
	db "in front of my", $55
	db "girlfriend…", $57
; 0x19cb74

PicnickerBrookeSeenText: ; 0x19cb74
	db $0, "My boyfriend's", $4f
	db "weak, so I can't", $55
	db "rely on him.", $57
; 0x19cba0

PicnickerBrookeBeatenText: ; 0x19cba0
	db $0, "Oh, my! You're so", $4f
	db "strong!", $57
; 0x19cbba

UnknownText_0x19cbba: ; 0x19cbba
	db $0, "I can count on my", $4f
	db "#MON more than", $55
	db "my boyfriend.", $57
; 0x19cbea

PicnickerKimSeenText: ; 0x19cbea
	db $0, "Are you going to", $4f
	db "the GYM? Me too!", $57
; 0x19cc0d

PicnickerKimBeatenText: ; 0x19cc0d
	db $0, "Oh. I couldn't", $4f
	db "win…", $57
; 0x19cc21

UnknownText_0x19cc21: ; 0x19cc21
	db $0, "The GYM BADGES are", $4f
	db "pretty. I collect", $55
	db "them.", $57
; 0x19cc4d

Bird_keeperBryanSeenText: ; 0x19cc4d
	db $0, "What kinds of", $4f
	db "BALLS do you use?", $57
; 0x19cc6e

Bird_keeperBryanBeatenText: ; 0x19cc6e
	db $0, "Yikes! Not fast", $4f
	db "enough!", $57
; 0x19cc87

UnknownText_0x19cc87: ; 0x19cc87
	db $0, "Some #MON flee", $4f
	db "right away.", $51
	db "Try catching them", $4f
	db "with KURT's FAST", $55
	db "BALL.", $51
	db "Whenever I find a", $4f
	db "WHT APRICORN, I", $55
	db "take it to KURT.", $51
	db "He turns it into a", $4f
	db "custom BALL.", $57
; 0x19cd1e

JugglerIrwin1SeenText: ; 0x19cd1e
	db $0, "Behold my graceful", $4f
	db "BALL dexterity!", $57
; 0x19cd42

JugglerIrwin1BeatenText: ; 0x19cd42
	db $0, "Whew! That was a", $4f
	db "jolt!", $57
; 0x19cd5a

UnknownText_0x19cd5a: ; 0x19cd5a
	db $0, "I was going to", $4f
	db "dazzle you with my", $55
	db "prize #MON.", $51
	db "But your prowess", $4f
	db "electrified me!", $57
; 0x19cdaa

Bug_catcherArnie1SeenText: ; 0x19cdaa
	db $0, "I'll go anywhere", $4f
	db "if bug #MON", $55
	db "appear there.", $57
; 0x19cdd5

Bug_catcherArnie1BeatenText: ; 0x19cdd5
	db $0, "Huh? I shouldn't", $4f
	db "have lost that…", $57
; 0x19cdf6

UnknownText_0x19cdf6: ; 0x19cdf6
	db $0, "My VENONAT won me", $4f
	db "the Bug-Catching", $51
	db "Contest at the", $4f
	db "NATIONAL PARK.", $57
; 0x19ce38

UnknownText_0x19ce38: ; 0x19ce38
	db $0, "Wow… Look at all", $4f
	db "those YANMA!", $51
	db "I'm so blown away,", $4f
	db "I can't move.", $57
; 0x19ce76

FirebreatherWaltSeenText: ; 0x19ce76
	db $0, "I'm practicing my", $4f
	db "fire breathing.", $57
; 0x19ce98

FirebreatherWaltBeatenText: ; 0x19ce98
	db $0, "Ow! I scorched the", $4f
	db "tip of my nose!", $57
; 0x19cebc

UnknownText_0x19cebc: ; 0x19cebc
	db $0, "The #MON March", $4f
	db "on the radio lures", $55
	db "wild #MON.", $57
; 0x19ceea

UnknownText_0x19ceea: ; 0x19ceea
	db $0, "Danger lurks in", $4f
	db "the night!", $57
; 0x19cf06

UnknownText_0x19cf06: ; 0x19cf06
	db $0, "Whoops!", $57
; 0x19cf0f

UnknownText_0x19cf0f: ; 0x19cf0f
	db $0, "You know, night-", $4f
	db "time is fun in its", $55
	db "own ways.", $51
	db "But don't overdo", $4f
	db "it, OK?", $57
; 0x19cf56

UnknownText_0x19cf56: ; 0x19cf56
	db $0, "Your #MON look", $4f
	db "pretty tough.", $51
	db "You could go any-", $4f
	db "where safely.", $57
; 0x19cf94

UnknownText_0x19cf94: ; 0x19cf94
	db $0, "ROUTE 35", $57
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

