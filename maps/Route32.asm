Route32_MapScriptHeader: ; 0x19044f
	; trigger count
	db 3

	; triggers
	dw UnknownScript_0x190460, $0000
	dw UnknownScript_0x190461, $0000
	dw UnknownScript_0x190462, $0000

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x190463
; 0x190460

UnknownScript_0x190460: ; 0x190460
	end
; 0x190461

UnknownScript_0x190461: ; 0x190461
	end
; 0x190462

UnknownScript_0x190462: ; 0x190462
	end
; 0x190463

UnknownScript_0x190463: ; 0x190463
	checkcode $b
	if_equal FRIDAY, UnknownScript_0x19046c
	disappear $e
	return
; 0x19046c

UnknownScript_0x19046c: ; 0x19046c
	appear $e
	return
; 0x19046f

CooltrainerMScript_0x19046f: ; 0x19046f
	faceplayer
UnknownScript_0x190470: ; 0x190470
	loadfont
	checkevent EVENT_GOT_MIRACLE_SEED_IN_ROUTE_32
	iftrue UnknownScript_0x1904a5
	checkflag $001b
	iffalse UnknownScript_0x19049f
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iftrue UnknownScript_0x19048f
	2writetext UnknownText_0x1907ab
	closetext
	loadmovesprites
	end
; 0x190489

UnknownScript_0x190489: ; 0x190489
	2writetext UnknownText_0x190820
	closetext
	loadmovesprites
	end
; 0x19048f

UnknownScript_0x19048f: ; 0x19048f
	2writetext UnknownText_0x190925
	keeptextopen
	verbosegiveitem MIRACLE_SEED, 1
	iffalse UnknownScript_0x1904a9
	setevent EVENT_GOT_MIRACLE_SEED_IN_ROUTE_32
	2jump UnknownScript_0x1904a5
; 0x19049f

UnknownScript_0x19049f: ; 0x19049f
	2writetext UnknownText_0x1908b0
	closetext
	loadmovesprites
	end
; 0x1904a5

UnknownScript_0x1904a5: ; 0x1904a5
	2writetext UnknownText_0x190a15
	closetext
UnknownScript_0x1904a9: ; 0x1904a9
	loadmovesprites
	end
; 0x1904ab

UnknownScript_0x1904ab: ; 0x1904ab
	spriteface $9, $2
	spriteface $0, $3
	loadfont
	2writetext UnknownText_0x190790
	closetext
	loadmovesprites
	follow $0, $9
	applymovement $0, MovementData_0x190789
	stopfollow
	spriteface $0, $0
	2call UnknownScript_0x190470
	applymovement $9, MovementData_0x19078c
	applymovement $9, MovementData_0x19078e
	end
; 0x1904ce

FisherScript_0x1904ce: ; 0x1904ce
	faceplayer
	loadfont
	checkevent EVENT_GOT_TM05_ROAR
	iftrue UnknownScript_0x1904e3
	2writetext UnknownText_0x191133
	keeptextopen
	verbosegiveitem TM_05, 1
	iffalse UnknownScript_0x1904e7
	setevent EVENT_GOT_TM05_ROAR
UnknownScript_0x1904e3: ; 0x1904e3
	2writetext UnknownText_0x19118c
	closetext
UnknownScript_0x1904e7: ; 0x1904e7
	loadmovesprites
	end
; 0x1904e9

UnknownScript_0x1904e9: ; 0x1904e9
	spriteface $b, $0
	spriteface $0, $1
	2jump UnknownScript_0x1904f3
; 0x1904f2

FisherScript_0x1904f2: ; 0x1904f2
	faceplayer
UnknownScript_0x1904f3: ; 0x1904f3
	dotrigger $2
	loadfont
	2writetext UnknownText_0x190a59
	yesorno
	iffalse UnknownScript_0x190503
	2writetext UnknownText_0x190acf
	closetext
	loadmovesprites
	end
; 0x190503

UnknownScript_0x190503: ; 0x190503
	2writetext UnknownText_0x190afc
	closetext
	loadmovesprites
	end
; 0x190509

TrainerCamperRoland: ; 0x190509
	; bit/flag number
	dw $41a

	; trainer group && trainer id
	db CAMPER, ROLAND

	; text when seen
	dw CamperRolandSeenText

	; text when trainer beaten
	dw CamperRolandBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CamperRolandScript
; 0x190515

CamperRolandScript: ; 0x190515
	talkaftercancel
	loadfont
	2writetext UnknownText_0x190faa
	closetext
	loadmovesprites
	end
; 0x19051d

TrainerFisherJustin: ; 0x19051d
	; bit/flag number
	dw $44e

	; trainer group && trainer id
	db FISHER, JUSTIN

	; text when seen
	dw FisherJustinSeenText

	; text when trainer beaten
	dw FisherJustinBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw FisherJustinScript
; 0x190529

FisherJustinScript: ; 0x190529
	talkaftercancel
	loadfont
	2writetext UnknownText_0x190b4e
	closetext
	loadmovesprites
	end
; 0x190531

TrainerFisherRalph1: ; 0x190531
	; bit/flag number
	dw $44f

	; trainer group && trainer id
	db FISHER, RALPH1

	; text when seen
	dw FisherRalph1SeenText

	; text when trainer beaten
	dw FisherRalph1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw FisherRalph1Script
; 0x19053d

FisherRalph1Script: ; 0x19053d
	writecode $17, $11
	talkaftercancel
	loadfont
	checkflag $006d
	iftrue UnknownScript_0x19057d
	checkflag $0052
	iftrue UnknownScript_0x1905f1
	checkcellnum $11
	iftrue UnknownScript_0x190603
	checkevent $0277
	iftrue UnknownScript_0x190566
	2writetext UnknownText_0x190bf8
	keeptextopen
	setevent $0277
	2call UnknownScript_0x1905f7
	2jump UnknownScript_0x190569
; 0x190566

UnknownScript_0x190566: ; 0x190566
	2call UnknownScript_0x1905fb
UnknownScript_0x190569: ; 0x190569
	askforphonenumber $11
	if_equal $1, UnknownScript_0x19060b
	if_equal $2, UnknownScript_0x190607
	trainertotext FISHER, RALPH1, $0
	2call UnknownScript_0x1905ff
	2jump UnknownScript_0x190603
; 0x19057d

UnknownScript_0x19057d: ; 0x19057d
	2call UnknownScript_0x19060f
	winlosstext FisherRalph1BeatenText, $0000
	copybytetovar $d9fb
	if_equal $4, UnknownScript_0x19059c
	if_equal $3, UnknownScript_0x1905a2
	if_equal $2, UnknownScript_0x1905a8
	if_equal $1, UnknownScript_0x1905ae
	if_equal $0, UnknownScript_0x1905b4
UnknownScript_0x19059c: ; 0x19059c
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue UnknownScript_0x1905e8
UnknownScript_0x1905a2: ; 0x1905a2
	checkevent $0044
	iftrue UnknownScript_0x1905db
UnknownScript_0x1905a8: ; 0x1905a8
	checkflag $004a
	iftrue UnknownScript_0x1905ce
UnknownScript_0x1905ae: ; 0x1905ae
	checkflag $0048
	iftrue UnknownScript_0x1905c1
UnknownScript_0x1905b4: ; 0x1905b4
	loadtrainer FISHER, RALPH1
	startbattle
	returnafterbattle
	loadvar $d9fb, $1
	clearflag $006d
	end
; 0x1905c1

UnknownScript_0x1905c1: ; 0x1905c1
	loadtrainer FISHER, RALPH2
	startbattle
	returnafterbattle
	loadvar $d9fb, $2
	clearflag $006d
	end
; 0x1905ce

UnknownScript_0x1905ce: ; 0x1905ce
	loadtrainer FISHER, RALPH3
	startbattle
	returnafterbattle
	loadvar $d9fb, $3
	clearflag $006d
	end
; 0x1905db

UnknownScript_0x1905db: ; 0x1905db
	loadtrainer FISHER, RALPH4
	startbattle
	returnafterbattle
	loadvar $d9fb, $4
	clearflag $006d
	end
; 0x1905e8

UnknownScript_0x1905e8: ; 0x1905e8
	loadtrainer FISHER, RALPH5
	startbattle
	returnafterbattle
	clearflag $006d
	end
; 0x1905f1

UnknownScript_0x1905f1: ; 0x1905f1
	2writetext UnknownText_0x190c37
	closetext
	loadmovesprites
	end
; 0x1905f7

UnknownScript_0x1905f7: ; 0x1905f7
	jumpstd $0019
	end
; 0x1905fb

UnknownScript_0x1905fb: ; 0x1905fb
	jumpstd $001a
	end
; 0x1905ff

UnknownScript_0x1905ff: ; 0x1905ff
	jumpstd $001b
	end
; 0x190603

UnknownScript_0x190603: ; 0x190603
	jumpstd $001c
	end
; 0x190607

UnknownScript_0x190607: ; 0x190607
	jumpstd $001d
	end
; 0x19060b

UnknownScript_0x19060b: ; 0x19060b
	jumpstd $001e
	end
; 0x19060f

UnknownScript_0x19060f: ; 0x19060f
	jumpstd $001f
	end
; 0x190613

TrainerFisherHenry: ; 0x190613
	; bit/flag number
	dw $452

	; trainer group && trainer id
	db FISHER, HENRY

	; text when seen
	dw FisherHenrySeenText

	; text when trainer beaten
	dw FisherHenryBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw FisherHenryScript
; 0x19061f

FisherHenryScript: ; 0x19061f
	talkaftercancel
	loadfont
	2writetext UnknownText_0x190df2
	closetext
	loadmovesprites
	end
; 0x190627

TrainerPicnickerLiz1: ; 0x190627
	; bit/flag number
	dw $47e

	; trainer group && trainer id
	db PICNICKER, LIZ1

	; text when seen
	dw PicnickerLiz1SeenText

	; text when trainer beaten
	dw PicnickerLiz1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PicnickerLiz1Script
; 0x190633

PicnickerLiz1Script: ; 0x190633
	writecode $17, $12
	talkaftercancel
	loadfont
	checkflag $006e
	iftrue UnknownScript_0x19066d
	checkcellnum $12
	iftrue UnknownScript_0x1906ed
	checkevent $0279
	iftrue UnknownScript_0x190656
	2writetext UnknownText_0x191060
	keeptextopen
	setevent $0279
	2call UnknownScript_0x1906e1
	2jump UnknownScript_0x190659
; 0x190656

UnknownScript_0x190656: ; 0x190656
	2call UnknownScript_0x1906e5
UnknownScript_0x190659: ; 0x190659
	askforphonenumber $12
	if_equal $1, UnknownScript_0x1906f5
	if_equal $2, UnknownScript_0x1906f1
	trainertotext PICNICKER, LIZ1, $0
	2call UnknownScript_0x1906e9
	2jump UnknownScript_0x1906ed
; 0x19066d

UnknownScript_0x19066d: ; 0x19066d
	2call UnknownScript_0x1906f9
	winlosstext PicnickerLiz1BeatenText, $0000
	copybytetovar $d9fc
	if_equal $4, UnknownScript_0x19068c
	if_equal $3, UnknownScript_0x190692
	if_equal $2, UnknownScript_0x190698
	if_equal $1, UnknownScript_0x19069e
	if_equal $0, UnknownScript_0x1906a4
UnknownScript_0x19068c: ; 0x19068c
	checkevent $0044
	iftrue UnknownScript_0x1906d8
UnknownScript_0x190692: ; 0x190692
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x1906cb
UnknownScript_0x190698: ; 0x190698
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0x1906be
UnknownScript_0x19069e: ; 0x19069e
	checkflag $0048
	iftrue UnknownScript_0x1906b1
UnknownScript_0x1906a4: ; 0x1906a4
	loadtrainer PICNICKER, LIZ1
	startbattle
	returnafterbattle
	loadvar $d9fc, $1
	clearflag $006e
	end
; 0x1906b1

UnknownScript_0x1906b1: ; 0x1906b1
	loadtrainer PICNICKER, LIZ2
	startbattle
	returnafterbattle
	loadvar $d9fc, $2
	clearflag $006e
	end
; 0x1906be

UnknownScript_0x1906be: ; 0x1906be
	loadtrainer PICNICKER, LIZ3
	startbattle
	returnafterbattle
	loadvar $d9fc, $3
	clearflag $006e
	end
; 0x1906cb

UnknownScript_0x1906cb: ; 0x1906cb
	loadtrainer PICNICKER, LIZ4
	startbattle
	returnafterbattle
	loadvar $d9fc, $4
	clearflag $006e
	end
; 0x1906d8

UnknownScript_0x1906d8: ; 0x1906d8
	loadtrainer PICNICKER, LIZ5
	startbattle
	returnafterbattle
	clearflag $006e
	end
; 0x1906e1

UnknownScript_0x1906e1: ; 0x1906e1
	jumpstd $0023
	end
; 0x1906e5

UnknownScript_0x1906e5: ; 0x1906e5
	jumpstd $0024
	end
; 0x1906e9

UnknownScript_0x1906e9: ; 0x1906e9
	jumpstd $0025
	end
; 0x1906ed

UnknownScript_0x1906ed: ; 0x1906ed
	jumpstd $0026
	end
; 0x1906f1

UnknownScript_0x1906f1: ; 0x1906f1
	jumpstd $0027
	end
; 0x1906f5

UnknownScript_0x1906f5: ; 0x1906f5
	jumpstd $0028
	end
; 0x1906f9

UnknownScript_0x1906f9: ; 0x1906f9
	jumpstd $0029
	end
; 0x1906fd

TrainerYoungsterAlbert: ; 0x1906fd
	; bit/flag number
	dw $5ab

	; trainer group && trainer id
	db YOUNGSTER, ALBERT

	; text when seen
	dw YoungsterAlbertSeenText

	; text when trainer beaten
	dw YoungsterAlbertBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw YoungsterAlbertScript
; 0x190709

YoungsterAlbertScript: ; 0x190709
	talkaftercancel
	loadfont
	2writetext UnknownText_0x190e82
	closetext
	loadmovesprites
	end
; 0x190711

TrainerYoungsterGordon: ; 0x190711
	; bit/flag number
	dw $5ac

	; trainer group && trainer id
	db YOUNGSTER, GORDON

	; text when seen
	dw YoungsterGordonSeenText

	; text when trainer beaten
	dw YoungsterGordonBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw YoungsterGordonScript
; 0x19071d

YoungsterGordonScript: ; 0x19071d
	talkaftercancel
	loadfont
	2writetext UnknownText_0x190f49
	closetext
	loadmovesprites
	end
; 0x190725

TrainerBird_keeperPeter: ; 0x190725
	; bit/flag number
	dw $407

	; trainer group && trainer id
	db BIRD_KEEPER, PETER

	; text when seen
	dw Bird_keeperPeterSeenText

	; text when trainer beaten
	dw Bird_keeperPeterBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bird_keeperPeterScript
; 0x190731

Bird_keeperPeterScript: ; 0x190731
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1910d4
	closetext
	loadmovesprites
	end
; 0x190739

LassScript_0x190739: ; 0x190739
	faceplayer
	loadfont
	checkevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	iftrue UnknownScript_0x190767
	checkcode $b
	if_not_equal FRIDAY, UnknownScript_0x19076d
	checkevent EVENT_MET_FRIEDA_OF_FRIDAY
	iftrue UnknownScript_0x190754
	2writetext UnknownText_0x1911c1
	keeptextopen
	setevent EVENT_MET_FRIEDA_OF_FRIDAY
UnknownScript_0x190754: ; 0x190754
	2writetext UnknownText_0x191204
	keeptextopen
	verbosegiveitem POISON_BARB, 1
	iffalse UnknownScript_0x19076b
	setevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	2writetext UnknownText_0x191222
	closetext
	loadmovesprites
	end
; 0x190767

UnknownScript_0x190767: ; 0x190767
	2writetext UnknownText_0x19129a
	closetext
UnknownScript_0x19076b: ; 0x19076b
	loadmovesprites
	end
; 0x19076d

UnknownScript_0x19076d: ; 0x19076d
	2writetext UnknownText_0x1912ff
	closetext
	loadmovesprites
	end
; 0x190773

ItemFragment_0x190773: ; 0x190773
	db GREAT_BALL, 1
; 0x190775

ItemFragment_0x190775: ; 0x190775
	db REPEL, 1
; 0x190777

MapRoute32Signpost0Script: ; 0x190777
	jumptext UnknownText_0x19133a
; 0x19077a

MapRoute32Signpost1Script: ; 0x19077a
	jumptext UnknownText_0x19135e
; 0x19077d

MapRoute32Signpost2Script: ; 0x19077d
	jumptext UnknownText_0x19137b
; 0x190780

MapRoute32Signpost3Script: ; 0x190780
	jumpstd $0010
; 0x190783

MapRoute32SignpostItem4: ; 0x190783
	dw $00a5
	db GREAT_BALL
	
; 0x190786

MapRoute32SignpostItem5: ; 0x190786
	dw $00a6
	db SUPER_POTION
	
; 0x190789

MovementData_0x190789: ; 0x190789
	step_up
	step_up
	step_end
; 0x19078c

MovementData_0x19078c: ; 0x19078c
	step_down
	step_end
; 0x19078e

MovementData_0x19078e: ; 0x19078e
	step_right
	step_end
; 0x190790

UnknownText_0x190790: ; 0x190790
	db $0, "Wait up!", $4f
	db "What's the hurry?", $57
; 0x1907ab

UnknownText_0x1907ab: ; 0x1907ab
	db $0, $52, ", right?", $4f
	db "Some guy wearing", $51
	db "glasses was look-", $4f
	db "ing for you.", $51
	db "See for yourself.", $4f
	db "He's waiting for", $51
	db "you at the #MON", $4f
	db "CENTER.", $57
; 0x190820

; might not be referenced anywhere
UnknownText_0x190820: ; 0x190820
	db $0, "Have you gone to", $4f
	db "SPROUT TOWER?", $51
	db "If you ever visit", $4f
	db "VIOLET CITY, ", $51
	db "they'll expect you", $4f
	db "to train there.", $51
	db "That's basic for", $4f
	db "trainers. Go to", $55
	db "SPROUT TOWER!", $57
; 0x1908b0

UnknownText_0x1908b0: ; 0x1908b0
	db $0, "Have you gone to", $4f
	db "the #MON GYM?", $51
	db "You can test your", $4f
	db "#MON and your-", $55
	db "self there.", $51
	db "It's a rite of", $4f
	db "passage for all", $55
	db "trainers!", $57
; 0x190925

UnknownText_0x190925: ; 0x190925
	db $0, "You have some good", $4f
	db "#MON there.", $51
	db "It must be from", $4f
	db "the training you", $51
	db "gave them around", $4f
	db "VIOLET CITY.", $51
	db "The training at", $4f
	db "the GYM must have", $51
	db "been especially", $4f
	db "helpful.", $51
	db "As a souvenir of", $4f
	db "VIOLET CITY, take", $55
	db "this.", $51
	db "It increases the", $4f
	db "power of grass-", $55
	db "type moves.", $57
; 0x190a15

UnknownText_0x190a15: ; 0x190a15
	db $0, "Your experiences", $4f
	db "in VIOLET CITY", $51
	db "should be useful", $4f
	db "for your journey.", $57
; 0x190a59

UnknownText_0x190a59: ; 0x190a59
	db $0, "How would you like", $4f
	db "to have this", $51
	db "tasty, nutritious", $4f
	db "SLOWPOKETAIL?", $51
	db "For you right now,", $4f
	db "just ¥1,000,000!", $51
	db "You'll want this!", $57
; 0x190acf

UnknownText_0x190acf: ; 0x190acf
	db $0, "Tch! I thought", $4f
	db "kids these days", $55
	db "were loaded…", $57
; 0x190afc

UnknownText_0x190afc: ; 0x190afc
	db $0, "You don't want it?", $4f
	db "Then scram. Shoo!", $57
; 0x190b21

FisherJustinSeenText: ; 0x190b21
	db $0, "Whoa!", $51
	db "You made me lose", $4f
	db "that fish!", $57
; 0x190b44

FisherJustinBeatenText: ; 0x190b44
	db $0, "Sploosh!", $57
; 0x190b4e

UnknownText_0x190b4e: ; 0x190b4e
	db $0, "Calm, collected…", $4f
	db "The essence of", $51
	db "fishing and #-", $4f
	db "MON is the same.", $57
; 0x190b8f

FisherRalph1SeenText: ; 0x190b8f
	db $0, "I'm really good at", $4f
	db "both fishing and", $55
	db "#MON.", $51
	db "I'm not about to", $4f
	db "lose to any kid!", $57
; 0x190bda

FisherRalph1BeatenText: ; 0x190bda
	db $0, "Tch! I tried to", $4f
	db "rush things…", $57
; 0x190bf8

UnknownText_0x190bf8: ; 0x190bf8
	db $0, "Fishing is a life-", $4f
	db "long passion.", $51
	db "#MON are life-", $4f
	db "long friends!", $57
; 0x190c37

UnknownText_0x190c37: ; 0x190c37
	db $0, "One, two, three…", $4f
	db "Muahahaha, what a", $51
	db "great haul!", $4f
	db "I'm done! Go ahead", $51
	db "and catch as many", $4f
	db "as you can, kid!", $57
; 0x190c9c

; --- start a segment of possibly unused texts

UnknownText_0x190c9c: ; 0x190c9c
	db $0, "I keep catching", $4f
	db "the same #MON…", $51
	db "Maybe a battle", $4f
	db "will turn things", $55
	db "around for me.", $57
; 0x190ceb

UnknownText_0x190ceb: ; 0x190ceb
	db $0, "Nothing ever goes", $4f
	db "right for me now…", $57
; 0x190d10

UnknownText_0x190d10: ; 0x190d10
	db $0, "How come the guy", $4f
	db "next to me catches", $55
	db "good #MON?", $57
; 0x190d40

UnknownText_0x190d40: ; 0x190d40
	db $0, "Heh, I'm on a roll", $4f
	db "today. How about a", $55
	db "battle, kid?", $57
; 0x190d73

UnknownText_0x190d73: ; 0x190d73
	db $0, "Oof. I wasn't", $4f
	db "lucky that time.", $57
; 0x190d92

UnknownText_0x190d92: ; 0x190d92
	db $0, "You have to have a", $4f
	db "good ROD if you", $51
	db "want to catch good", $4f
	db "#MON.", $57
; 0x190dcf

; --- end a segment of possibly unused texts

FisherHenrySeenText: ; 0x190dcf
	db $0, "My #MON?", $4f
	db "Freshly caught!", $57
; 0x190de9

FisherHenryBeatenText: ; 0x190de9
	db $0, "SPLASH?", $57
; 0x190df2

UnknownText_0x190df2: ; 0x190df2
	db $0, "Freshly caught", $4f
	db "#MON are no", $51
	db "match for properly", $4f
	db "raised ones.", $57
; 0x190e2e

YoungsterAlbertSeenText: ; 0x190e2e
	db $0, "I haven't seen you", $4f
	db "around before.", $51
	db "So you think you", $4f
	db "are pretty tough?", $57
; 0x190e73

YoungsterAlbertBeatenText: ; 0x190e73
	db $0, "You're strong!", $57
; 0x190e82

UnknownText_0x190e82: ; 0x190e82
	db $0, "I'm going to try", $4f
	db "to be the best", $55
	db "with my favorites.", $51
	db "I'm not using the", $4f
	db "same tough #MON", $55
	db "as everyone else.", $57
; 0x190ee8

YoungsterGordonSeenText: ; 0x190ee8
	db $0, "I found some good", $4f
	db "#MON in the", $55
	db "grass!", $51
	db "I think they'll do", $4f
	db "it for me!", $57
; 0x190f2b

YoungsterGordonBeatenText: ; 0x190f2b
	db $0, "Darn. I thought I", $4f
	db "could win.", $57
; 0x190f49

UnknownText_0x190f49: ; 0x190f49
	db $0, "The grass is full", $4f
	db "of clingy things.", $57
; 0x190f6e

CamperRolandSeenText: ; 0x190f6e
	db $0, "That glance…", $4f
	db "It's intriguing.", $57
; 0x190f8c

CamperRolandBeatenText: ; 0x190f8c
	db $0, "Hmmm. This is", $4f
	db "disappointing.", $57
; 0x190faa

UnknownText_0x190faa: ; 0x190faa
	db $0, "If you don't want", $4f
	db "to battle, just", $55
	db "avoid eye contact.", $57
; 0x190fdf

PicnickerLiz1SeenText: ; 0x190fdf
	db $0, "Uh-huh. Yeah, and", $4f
	db "you know…", $51
	db "Pardon? Battle?", $4f
	db "I'm on the phone.", $51
	db "Oh, all right. But", $4f
	db "make it fast.", $57
; 0x19103e

PicnickerLiz1BeatenText: ; 0x19103e
	db $0, "Oh! I've got to", $4f
	db "relieve my anger!", $57
; 0x191060

UnknownText_0x191060: ; 0x191060
	db $0, "I was having a", $4f
	db "nice chat too.", $57
; 0x19107f

Bird_keeperPeterSeenText: ; 0x19107f
	db $0, "That BADGE! It's", $4f
	db "from VIOLET CITY!", $51
	db "You beat FALKNER?", $57
; 0x1910b4

Bird_keeperPeterBeatenText: ; 0x1910b4
	db $0, "I know what my", $4f
	db "weaknesses are.", $57
; 0x1910d4

UnknownText_0x1910d4: ; 0x1910d4
	db $0, "I should train", $4f
	db "again at the GYM", $55
	db "in VIOLET CITY.", $57
; 0x191105

; possibly unused
UnknownText_0x191105: ; 0x191105
	db $0, "The fishermen", $4f
	db "yelled at me for", $55
	db "bugging them…", $57
; 0x191133

UnknownText_0x191133: ; 0x191133
	db $0, "WROOOOAR!", $4f
	db "PEOPLE RUN WHEN I", $51
	db "ROAR! BUT YOU", $4f
	db "CAME LOOKING!", $51
	db "THAT PLEASES ME!", $4f
	db "NOW TAKE THIS!", $57
; 0x19118c

UnknownText_0x19118c: ; 0x19118c
	db $0, "WROOOAR!", $4f
	db "IT'S ROAR!", $51
	db "EVEN #MON RUN", $4f
	db "FROM A GOOD ROAR!", $57
; 0x1911c1

UnknownText_0x1911c1: ; 0x1911c1
	db $0, "FRIEDA: Yahoo!", $4f
	db "It's Friday!", $51
	db "I'm FRIEDA of", $4f
	db "Friday!", $51
	db "Nice to meet you!", $57
; 0x191204

UnknownText_0x191204: ; 0x191204
	db $0, "Here's a POISON", $4f
	db "BARB for you!", $57
; 0x191222

UnknownText_0x191222: ; 0x191222
	db $0, "FRIEDA: Give it to", $4f
	db "a #MON that has", $55
	db "poison-type moves.", $51
	db "Oh!", $51
	db "It's wicked!", $51
	db "You'll be shocked", $4f
	db "how good it makes", $55
	db "poison moves!", $57
; 0x19129a

UnknownText_0x19129a: ; 0x19129a
	db $0, "FRIEDA: Hiya! What", $4f
	db "day do you like?", $51
	db "I love Friday. No", $4f
	db "doubt about it!", $51
	db "Don't you think", $4f
	db "it's great too?", $57
; 0x1912ff

UnknownText_0x1912ff: ; 0x1912ff
	db $0, "FRIEDA: Isn't it", $4f
	db "Friday today?", $51
	db "It's so boring", $4f
	db "when it's not!", $57
; 0x19133a

UnknownText_0x19133a: ; 0x19133a
	db $0, "ROUTE 32", $51
	db "VIOLET CITY -", $4f
	db "AZALEA TOWN", $57
; 0x19135e

UnknownText_0x19135e: ; 0x19135e
	db $0, "RUINS OF ALPH", $4f
	db "EAST ENTRANCE", $57
; 0x19137b

UnknownText_0x19137b: ; 0x19137b
	db $0, "UNION CAVE", $4f
	db "AHEAD", $57
; 0x19138d

Route32_MapEventHeader: ; 0x19138d
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $49, $b, 1, GROUP_ROUTE_32_POKECENTER_1F, MAP_ROUTE_32_POKECENTER_1F
	warp_def $2, $4, 3, GROUP_ROUTE_32_RUINS_OF_ALPH_GATE, MAP_ROUTE_32_RUINS_OF_ALPH_GATE
	warp_def $3, $4, 4, GROUP_ROUTE_32_RUINS_OF_ALPH_GATE, MAP_ROUTE_32_RUINS_OF_ALPH_GATE
	warp_def $4f, $6, 4, GROUP_UNION_CAVE_1F, MAP_UNION_CAVE_1F

	; xy triggers
	db 2
	xy_trigger 0, $8, $12, $0, UnknownScript_0x1904ab, $0, $0
	xy_trigger 1, $47, $7, $0, UnknownScript_0x1904e9, $0, $0

	; signposts
	db 6
	signpost 5, 13, $0, MapRoute32Signpost0Script
	signpost 1, 9, $0, MapRoute32Signpost1Script
	signpost 84, 10, $0, MapRoute32Signpost2Script
	signpost 73, 12, $0, MapRoute32Signpost3Script
	signpost 67, 12, $7, MapRoute32SignpostItem4
	signpost 40, 11, $7, MapRoute32SignpostItem5

	; people-events
	db 14
	person_event SPRITE_FISHER, 53, 12, $6, $0, 255, 255, $a2, 1, TrainerFisherJustin, $ffff
	person_event SPRITE_FISHER, 60, 16, $7, $0, 255, 255, $a2, 3, TrainerFisherRalph1, $ffff
	person_event SPRITE_FISHER, 52, 10, $8, $0, 255, 255, $a2, 1, TrainerFisherHenry, $ffff
	person_event SPRITE_YOUNGSTER, 26, 16, $9, $0, 255, 255, $92, 3, TrainerYoungsterAlbert, $ffff
	person_event SPRITE_YOUNGSTER, 67, 8, $a, $0, 255, 255, $92, 3, TrainerYoungsterGordon, $ffff
	person_event SPRITE_YOUNGSTER, 49, 7, $7, $0, 255, 255, $a2, 3, TrainerCamperRoland, $ffff
	person_event SPRITE_LASS, 34, 14, $8, $0, 255, 255, $a2, 1, TrainerPicnickerLiz1, $ffff
	person_event SPRITE_COOLTRAINER_M, 12, 23, $8, $0, 255, 255, $0, 0, CooltrainerMScript_0x19046f, $ffff
	person_event SPRITE_YOUNGSTER, 86, 15, $7, $0, 255, 255, $92, 3, TrainerBird_keeperPeter, $ffff
	person_event SPRITE_FISHER, 74, 11, $6, $0, 255, 255, $0, 0, FisherScript_0x1904f2, $06fc
	person_event SPRITE_POKE_BALL, 57, 10, $1, $0, 255, 255, $1, 0, ItemFragment_0x190773, $06b0
	person_event SPRITE_FISHER, 17, 19, $9, $0, 255, 255, $0, 0, FisherScript_0x1904ce, $ffff
	person_event SPRITE_LASS, 71, 16, $8, $0, 255, 255, $0, 0, LassScript_0x190739, $0758
	person_event SPRITE_POKE_BALL, 34, 7, $1, $0, 255, 255, $1, 0, ItemFragment_0x190775, $06b1
; 0x19148b

