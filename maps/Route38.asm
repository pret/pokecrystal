Route38_MapScriptHeader: ; 0x1a1d0c
	; trigger count
	db 0

	; callback count
	db 0
; 0x1a1d0e

TrainerBird_keeperToby: ; 0x1a1d0e
	; bit/flag number
	dw $3ff

	; trainer group && trainer id
	db BIRD_KEEPER, TOBY

	; text when seen
	dw Bird_keeperTobySeenText

	; text when trainer beaten
	dw Bird_keeperTobyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bird_keeperTobyScript
; 0x1a1d1a

Bird_keeperTobyScript: ; 0x1a1d1a
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a1f86
	closetext
	loadmovesprites
	end
; 0x1a1d22

TrainerSailorHarry: ; 0x1a1d22
	; bit/flag number
	dw $57e

	; trainer group && trainer id
	db SAILOR, HARRY

	; text when seen
	dw SailorHarrySeenText

	; text when trainer beaten
	dw SailorHarryBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SailorHarryScript
; 0x1a1d2e

SailorHarryScript: ; 0x1a1d2e
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a220c
	closetext
	loadmovesprites
	end
; 0x1a1d36

TrainerLassDana1: ; 0x1a1d36
	; bit/flag number
	dw $51e

	; trainer group && trainer id
	db LASS, DANA1

	; text when seen
	dw LassDana1SeenText

	; text when trainer beaten
	dw LassDana1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw LassDana1Script
; 0x1a1d42

LassDana1Script: ; 0x1a1d42
	writecode VAR_CALLERID, $1a
	talkaftercancel
	loadfont
	checkflag $0074
	iftrue UnknownScript_0x1a1d82
	checkflag $0082
	iftrue UnknownScript_0x1a1df6
	checkcellnum $1a
	iftrue UnknownScript_0x1a1e17
	checkevent $0289
	iftrue UnknownScript_0x1a1d6b
	writetext UnknownText_0x1a20ec
	keeptextopen
	setevent $0289
	scall UnknownScript_0x1a1e0b
	jump UnknownScript_0x1a1d6e
; 0x1a1d6b

UnknownScript_0x1a1d6b: ; 0x1a1d6b
	scall UnknownScript_0x1a1e0f
UnknownScript_0x1a1d6e: ; 0x1a1d6e
	askforphonenumber $1a
	if_equal $1, UnknownScript_0x1a1e1f
	if_equal $2, UnknownScript_0x1a1e1b
	trainertotext LASS, DANA1, $0
	scall UnknownScript_0x1a1e13
	jump UnknownScript_0x1a1e17
; 0x1a1d82

UnknownScript_0x1a1d82: ; 0x1a1d82
	scall UnknownScript_0x1a1e23
	winlosstext LassDana1BeatenText, $0000
	copybytetovar wda03
	if_equal $4, UnknownScript_0x1a1da1
	if_equal $3, UnknownScript_0x1a1da7
	if_equal $2, UnknownScript_0x1a1dad
	if_equal $1, UnknownScript_0x1a1db3
	if_equal $0, UnknownScript_0x1a1db9
UnknownScript_0x1a1da1: ; 0x1a1da1
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue UnknownScript_0x1a1ded
UnknownScript_0x1a1da7: ; 0x1a1da7
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue UnknownScript_0x1a1de0
UnknownScript_0x1a1dad: ; 0x1a1dad
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x1a1dd3
UnknownScript_0x1a1db3: ; 0x1a1db3
	checkflag $0045
	iftrue UnknownScript_0x1a1dc6
UnknownScript_0x1a1db9: ; 0x1a1db9
	loadtrainer LASS, DANA1
	startbattle
	returnafterbattle
	loadvar wda03, $1
	clearflag $0074
	end
; 0x1a1dc6

UnknownScript_0x1a1dc6: ; 0x1a1dc6
	loadtrainer LASS, DANA2
	startbattle
	returnafterbattle
	loadvar wda03, $2
	clearflag $0074
	end
; 0x1a1dd3

UnknownScript_0x1a1dd3: ; 0x1a1dd3
	loadtrainer LASS, DANA3
	startbattle
	returnafterbattle
	loadvar wda03, $3
	clearflag $0074
	end
; 0x1a1de0

UnknownScript_0x1a1de0: ; 0x1a1de0
	loadtrainer LASS, DANA4
	startbattle
	returnafterbattle
	loadvar wda03, $4
	clearflag $0074
	end
; 0x1a1ded

UnknownScript_0x1a1ded: ; 0x1a1ded
	loadtrainer LASS, DANA5
	startbattle
	returnafterbattle
	clearflag $0074
	end
; 0x1a1df6

UnknownScript_0x1a1df6: ; 0x1a1df6
	scall UnknownScript_0x1a1e27
	verbosegiveitem THUNDERSTONE, 1
	iffalse UnknownScript_0x1a1e08
	clearflag $0082
	setevent $0102
	jump UnknownScript_0x1a1e17
; 0x1a1e08

UnknownScript_0x1a1e08: ; 0x1a1e08
	jump UnknownScript_0x1a1e2b
; 0x1a1e0b

UnknownScript_0x1a1e0b: ; 0x1a1e0b
	jumpstd asknumber1f
	end
; 0x1a1e0f

UnknownScript_0x1a1e0f: ; 0x1a1e0f
	jumpstd asknumber2f
	end
; 0x1a1e13

UnknownScript_0x1a1e13: ; 0x1a1e13
	jumpstd registerednumberf
	end
; 0x1a1e17

UnknownScript_0x1a1e17: ; 0x1a1e17
	jumpstd numberacceptedf
	end
; 0x1a1e1b

UnknownScript_0x1a1e1b: ; 0x1a1e1b
	jumpstd numberdeclinedf
	end
; 0x1a1e1f

UnknownScript_0x1a1e1f: ; 0x1a1e1f
	jumpstd phonefullf
	end
; 0x1a1e23

UnknownScript_0x1a1e23: ; 0x1a1e23
	jumpstd rematchf
	end
; 0x1a1e27

UnknownScript_0x1a1e27: ; 0x1a1e27
	jumpstd giftf
	end
; 0x1a1e2b

UnknownScript_0x1a1e2b: ; 0x1a1e2b
	jumpstd packfullf
	end
; 0x1a1e2f

TrainerSchoolboyChad1: ; 0x1a1e2f
	; bit/flag number
	dw $475

	; trainer group && trainer id
	db SCHOOLBOY, CHAD1

	; text when seen
	dw SchoolboyChad1SeenText

	; text when trainer beaten
	dw SchoolboyChad1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SchoolboyChad1Script
; 0x1a1e3b

SchoolboyChad1Script: ; 0x1a1e3b
	writecode VAR_CALLERID, $1b
	talkaftercancel
	loadfont
	checkflag $0075
	iftrue UnknownScript_0x1a1e75
	checkcellnum $1b
	iftrue UnknownScript_0x1a1ef5
	checkevent $028b
	iftrue UnknownScript_0x1a1e5e
	writetext UnknownText_0x1a200e
	keeptextopen
	setevent $028b
	scall UnknownScript_0x1a1ee9
	jump UnknownScript_0x1a1e61
; 0x1a1e5e

UnknownScript_0x1a1e5e: ; 0x1a1e5e
	scall UnknownScript_0x1a1eed
UnknownScript_0x1a1e61: ; 0x1a1e61
	askforphonenumber $1b
	if_equal $1, UnknownScript_0x1a1efd
	if_equal $2, UnknownScript_0x1a1ef9
	trainertotext SCHOOLBOY, CHAD1, $0
	scall UnknownScript_0x1a1ef1
	jump UnknownScript_0x1a1ef5
; 0x1a1e75

UnknownScript_0x1a1e75: ; 0x1a1e75
	scall UnknownScript_0x1a1f01
	winlosstext SchoolboyChad1BeatenText, $0000
	copybytetovar wda04
	if_equal $4, UnknownScript_0x1a1e94
	if_equal $3, UnknownScript_0x1a1e9a
	if_equal $2, UnknownScript_0x1a1ea0
	if_equal $1, UnknownScript_0x1a1ea6
	if_equal $0, UnknownScript_0x1a1eac
UnknownScript_0x1a1e94: ; 0x1a1e94
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue UnknownScript_0x1a1ee0
UnknownScript_0x1a1e9a: ; 0x1a1e9a
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue UnknownScript_0x1a1ed3
UnknownScript_0x1a1ea0: ; 0x1a1ea0
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x1a1ec6
UnknownScript_0x1a1ea6: ; 0x1a1ea6
	checkflag $0049
	iftrue UnknownScript_0x1a1eb9
UnknownScript_0x1a1eac: ; 0x1a1eac
	loadtrainer SCHOOLBOY, CHAD1
	startbattle
	returnafterbattle
	loadvar wda04, $1
	clearflag $0075
	end
; 0x1a1eb9

UnknownScript_0x1a1eb9: ; 0x1a1eb9
	loadtrainer SCHOOLBOY, CHAD2
	startbattle
	returnafterbattle
	loadvar wda04, $2
	clearflag $0075
	end
; 0x1a1ec6

UnknownScript_0x1a1ec6: ; 0x1a1ec6
	loadtrainer SCHOOLBOY, CHAD3
	startbattle
	returnafterbattle
	loadvar wda04, $3
	clearflag $0075
	end
; 0x1a1ed3

UnknownScript_0x1a1ed3: ; 0x1a1ed3
	loadtrainer SCHOOLBOY, CHAD4
	startbattle
	returnafterbattle
	loadvar wda04, $4
	clearflag $0075
	end
; 0x1a1ee0

UnknownScript_0x1a1ee0: ; 0x1a1ee0
	loadtrainer SCHOOLBOY, CHAD5
	startbattle
	returnafterbattle
	clearflag $0075
	end
; 0x1a1ee9

UnknownScript_0x1a1ee9: ; 0x1a1ee9
	jumpstd asknumber1m
	end
; 0x1a1eed

UnknownScript_0x1a1eed: ; 0x1a1eed
	jumpstd asknumber2m
	end
; 0x1a1ef1

UnknownScript_0x1a1ef1: ; 0x1a1ef1
	jumpstd registerednumberm
	end
; 0x1a1ef5

UnknownScript_0x1a1ef5: ; 0x1a1ef5
	jumpstd numberacceptedm
	end
; 0x1a1ef9

UnknownScript_0x1a1ef9: ; 0x1a1ef9
	jumpstd numberdeclinedm
	end
; 0x1a1efd

UnknownScript_0x1a1efd: ; 0x1a1efd
	jumpstd phonefullm
	end
; 0x1a1f01

UnknownScript_0x1a1f01: ; 0x1a1f01
	jumpstd rematchm
	end
; 0x1a1f05

TrainerBeautyValerie: ; 0x1a1f05
	; bit/flag number
	dw $4bc

	; trainer group && trainer id
	db BEAUTY, VALERIE

	; text when seen
	dw BeautyValerieSeenText

	; text when trainer beaten
	dw BeautyValerieBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw BeautyValerieScript
; 0x1a1f11

BeautyValerieScript: ; 0x1a1f11
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a2185
	closetext
	loadmovesprites
	end
; 0x1a1f19

TrainerBeautyOlivia: ; 0x1a1f19
	; bit/flag number
	dw $5c1

	; trainer group && trainer id
	db BEAUTY, OLIVIA

	; text when seen
	dw BeautyOliviaSeenText

	; text when trainer beaten
	dw BeautyOliviaBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw BeautyOliviaScript
; 0x1a1f25

BeautyOliviaScript: ; 0x1a1f25
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a229a
	closetext
	loadmovesprites
	end
; 0x1a1f2d

MapRoute38Signpost0Script: ; 0x1a1f2d
	jumptext UnknownText_0x1a22fd
; 0x1a1f30

MapRoute38Signpost1Script: ; 0x1a1f30
	jumptext UnknownText_0x1a2324
; 0x1a1f33

FruitTreeScript_0x1a1f33: ; 0x1a1f33
	fruittree $3
; 0x1a1f35

Bird_keeperTobySeenText: ; 0x1a1f35
	text "Fly high into the"
	line "sky, my beloved"
	cont "bird #MON!"
	done
; 0x1a1f63

Bird_keeperTobyBeatenText: ; 0x1a1f63
	text "I feel like just"
	line "flying away now."
	done
; 0x1a1f86

UnknownText_0x1a1f86: ; 0x1a1f86
	text "I plan to train in"
	line "CIANWOOD CITY to"

	para "teach my #MON"
	line "how to FLY."
	done
; 0x1a1fc5

SchoolboyChad1SeenText: ; 0x1a1fc5
	text "Let me try some-"
	line "thing I learned"
	cont "today."
	done
; 0x1a1fee

SchoolboyChad1BeatenText: ; 0x1a1fee
	text "I didn't study"
	line "enough, I guess."
	done
; 0x1a200e

UnknownText_0x1a200e: ; 0x1a200e
	text "I have to take so"
	line "many tests, I"

	para "don't have much"
	line "time for #MON."

	para "So when I do get"
	line "to play, I really"
	cont "concentrate."
	done
; 0x1a207d

LassDana1SeenText: ; 0x1a207d
	text "You seem to be"
	line "good at #MON."

	para "If you are, how"
	line "about giving me"
	cont "some advice?"
	done
; 0x1a20c8

LassDana1BeatenText: ; 0x1a20c8
	text "I see. So you can"
	line "battle that way."
	done
; 0x1a20ec

UnknownText_0x1a20ec: ; 0x1a20ec
	text "I know something"
	line "good!"

	para "MOOMOO FARM's milk"
	line "is famous for its"
	cont "flavor."
	done
; 0x1a2130

BeautyValerieSeenText: ; 0x1a2130
	text "Hi! Aren't you a"
	line "cute trainer!"

	para "May I see your"
	line "#MON?"
	done
; 0x1a2164

BeautyValerieBeatenText: ; 0x1a2164
	text "I'm glad I got to"
	line "see your #MON!"
	done
; 0x1a2185

UnknownText_0x1a2185: ; 0x1a2185
	text "When I see #-"
	line "MON, it seems to"
	cont "soothe my nerves."
	done
; 0x1a21b7

SailorHarrySeenText: ; 0x1a21b7
	text "I've been over-"
	line "seas, so I know"

	para "about all sorts of"
	line "#MON!"
	done
; 0x1a21f0

SailorHarryBeatenText: ; 0x1a21f0
	text "Your skill is"
	line "world class!"
	done
; 0x1a220c

UnknownText_0x1a220c: ; 0x1a220c
	text "All kinds of peo-"
	line "ple around the"

	para "world live happily"
	line "with #MON."
	done
; 0x1a224c

BeautyOliviaSeenText: ; 0x1a224c
	text "Don't you think my"
	line "#MON and I are"
	cont "beautiful?"
	done
; 0x1a2279

BeautyOliviaBeatenText: ; 0x1a2279
	text "We drink MOOMOO"
	line "MILK every day."
	done
; 0x1a229a

UnknownText_0x1a229a: ; 0x1a229a
	text "MOOMOO MILK is"
	line "good for beauty"

	para "and health, but"
	line "inconveniently,"

	para "they only sell a"
	line "bottle at a time."
	done
; 0x1a22fd

UnknownText_0x1a22fd: ; 0x1a22fd
	text "ROUTE 38"

	para "OLIVINE CITY -"
	line "ECRUTEAK CITY"
	done
; 0x1a2324

UnknownText_0x1a2324: ; 0x1a2324
	text "TRAINER TIPS"

	para "If a #MON is"
	line "trying to evolve,"
	cont "you can stop it."

	para "Press the B But-"
	line "ton during evolu-"
	cont "tion."

	para "That startles the"
	line "#MON and stops"
	cont "its evolution."
	done
; 0x1a23bb

Route38_MapEventHeader: ; 0x1a23bb
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $8, $23, 1, GROUP_ROUTE_38_ECRUTEAK_GATE, MAP_ROUTE_38_ECRUTEAK_GATE
	warp_def $9, $23, 2, GROUP_ROUTE_38_ECRUTEAK_GATE, MAP_ROUTE_38_ECRUTEAK_GATE

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 7, 33, $0, MapRoute38Signpost0Script
	signpost 13, 5, $0, MapRoute38Signpost1Script

	; people-events
	db 7
	person_event SPRITE_STANDING_YOUNGSTER, 5, 8, $9, $0, 255, 255, $92, 1, TrainerSchoolboyChad1, $ffff
	person_event SPRITE_LASS, 7, 19, $a, $0, 255, 255, $92, 2, TrainerLassDana1, $ffff
	person_event SPRITE_STANDING_YOUNGSTER, 19, 16, $a, $0, 255, 255, $92, 1, TrainerBird_keeperToby, $ffff
	person_event SPRITE_BUENA, 13, 23, $6, $0, 255, 255, $92, 1, TrainerBeautyValerie, $ffff
	person_event SPRITE_SAILOR, 9, 28, $1e, $0, 255, 255, $92, 2, TrainerSailorHarry, $ffff
	person_event SPRITE_FRUIT_TREE, 14, 16, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x1a1f33, $ffff
	person_event SPRITE_BUENA, 12, 9, $a, $0, 255, 255, $92, 1, TrainerBeautyOlivia, $ffff
; 0x1a2430
