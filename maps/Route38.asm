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
	2writetext UnknownText_0x1a1f86
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
	2writetext UnknownText_0x1a220c
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
	writecode $17, $1a
	talkaftercancel
	loadfont
	checkbit2 $0074
	iftrue UnknownScript_0x1a1d82
	checkbit2 $0082
	iftrue UnknownScript_0x1a1df6
	checkcellnum $1a
	iftrue UnknownScript_0x1a1e17
	checkbit1 $0289
	iftrue UnknownScript_0x1a1d6b
	2writetext UnknownText_0x1a20ec
	keeptextopen
	setbit1 $0289
	2call UnknownScript_0x1a1e0b
	2jump UnknownScript_0x1a1d6e
; 0x1a1d6b

UnknownScript_0x1a1d6b: ; 0x1a1d6b
	2call UnknownScript_0x1a1e0f
UnknownScript_0x1a1d6e: ; 0x1a1d6e
	askforphonenumber $1a
	if_equal $1, UnknownScript_0x1a1e1f
	if_equal $2, UnknownScript_0x1a1e1b
	trainertotext LASS, DANA1, $0
	2call UnknownScript_0x1a1e13
	2jump UnknownScript_0x1a1e17
; 0x1a1d82

UnknownScript_0x1a1d82: ; 0x1a1d82
	2call UnknownScript_0x1a1e23
	winlosstext LassDana1BeatenText, $0000
	copybytetovar $da03
	if_equal $4, UnknownScript_0x1a1da1
	if_equal $3, UnknownScript_0x1a1da7
	if_equal $2, UnknownScript_0x1a1dad
	if_equal $1, UnknownScript_0x1a1db3
	if_equal $0, UnknownScript_0x1a1db9
UnknownScript_0x1a1da1: ; 0x1a1da1
	checkbit1 $00cd
	iftrue UnknownScript_0x1a1ded
UnknownScript_0x1a1da7: ; 0x1a1da7
	checkbit1 $0044
	iftrue UnknownScript_0x1a1de0
UnknownScript_0x1a1dad: ; 0x1a1dad
	checkbit1 $0021
	iftrue UnknownScript_0x1a1dd3
UnknownScript_0x1a1db3: ; 0x1a1db3
	checkbit2 $0045
	iftrue UnknownScript_0x1a1dc6
UnknownScript_0x1a1db9: ; 0x1a1db9
	loadtrainer LASS, DANA1
	startbattle
	returnafterbattle
	loadvar $da03, $1
	clearbit2 $0074
	end
; 0x1a1dc6

UnknownScript_0x1a1dc6: ; 0x1a1dc6
	loadtrainer LASS, DANA2
	startbattle
	returnafterbattle
	loadvar $da03, $2
	clearbit2 $0074
	end
; 0x1a1dd3

UnknownScript_0x1a1dd3: ; 0x1a1dd3
	loadtrainer LASS, DANA3
	startbattle
	returnafterbattle
	loadvar $da03, $3
	clearbit2 $0074
	end
; 0x1a1de0

UnknownScript_0x1a1de0: ; 0x1a1de0
	loadtrainer LASS, DANA4
	startbattle
	returnafterbattle
	loadvar $da03, $4
	clearbit2 $0074
	end
; 0x1a1ded

UnknownScript_0x1a1ded: ; 0x1a1ded
	loadtrainer LASS, DANA5
	startbattle
	returnafterbattle
	clearbit2 $0074
	end
; 0x1a1df6

UnknownScript_0x1a1df6: ; 0x1a1df6
	2call UnknownScript_0x1a1e27
	verbosegiveitem THUNDERSTONE, 1
	iffalse UnknownScript_0x1a1e08
	clearbit2 $0082
	setbit1 $0102
	2jump UnknownScript_0x1a1e17
; 0x1a1e08

UnknownScript_0x1a1e08: ; 0x1a1e08
	2jump UnknownScript_0x1a1e2b
; 0x1a1e0b

UnknownScript_0x1a1e0b: ; 0x1a1e0b
	jumpstd $0023
	end
; 0x1a1e0f

UnknownScript_0x1a1e0f: ; 0x1a1e0f
	jumpstd $0024
	end
; 0x1a1e13

UnknownScript_0x1a1e13: ; 0x1a1e13
	jumpstd $0025
	end
; 0x1a1e17

UnknownScript_0x1a1e17: ; 0x1a1e17
	jumpstd $0026
	end
; 0x1a1e1b

UnknownScript_0x1a1e1b: ; 0x1a1e1b
	jumpstd $0027
	end
; 0x1a1e1f

UnknownScript_0x1a1e1f: ; 0x1a1e1f
	jumpstd $0028
	end
; 0x1a1e23

UnknownScript_0x1a1e23: ; 0x1a1e23
	jumpstd $0029
	end
; 0x1a1e27

UnknownScript_0x1a1e27: ; 0x1a1e27
	jumpstd $002a
	end
; 0x1a1e2b

UnknownScript_0x1a1e2b: ; 0x1a1e2b
	jumpstd $002b
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
	writecode $17, $1b
	talkaftercancel
	loadfont
	checkbit2 $0075
	iftrue UnknownScript_0x1a1e75
	checkcellnum $1b
	iftrue UnknownScript_0x1a1ef5
	checkbit1 $028b
	iftrue UnknownScript_0x1a1e5e
	2writetext UnknownText_0x1a200e
	keeptextopen
	setbit1 $028b
	2call UnknownScript_0x1a1ee9
	2jump UnknownScript_0x1a1e61
; 0x1a1e5e

UnknownScript_0x1a1e5e: ; 0x1a1e5e
	2call UnknownScript_0x1a1eed
UnknownScript_0x1a1e61: ; 0x1a1e61
	askforphonenumber $1b
	if_equal $1, UnknownScript_0x1a1efd
	if_equal $2, UnknownScript_0x1a1ef9
	trainertotext SCHOOLBOY, CHAD1, $0
	2call UnknownScript_0x1a1ef1
	2jump UnknownScript_0x1a1ef5
; 0x1a1e75

UnknownScript_0x1a1e75: ; 0x1a1e75
	2call UnknownScript_0x1a1f01
	winlosstext SchoolboyChad1BeatenText, $0000
	copybytetovar $da04
	if_equal $4, UnknownScript_0x1a1e94
	if_equal $3, UnknownScript_0x1a1e9a
	if_equal $2, UnknownScript_0x1a1ea0
	if_equal $1, UnknownScript_0x1a1ea6
	if_equal $0, UnknownScript_0x1a1eac
UnknownScript_0x1a1e94: ; 0x1a1e94
	checkbit1 $00cd
	iftrue UnknownScript_0x1a1ee0
UnknownScript_0x1a1e9a: ; 0x1a1e9a
	checkbit1 $0044
	iftrue UnknownScript_0x1a1ed3
UnknownScript_0x1a1ea0: ; 0x1a1ea0
	checkbit1 $0021
	iftrue UnknownScript_0x1a1ec6
UnknownScript_0x1a1ea6: ; 0x1a1ea6
	checkbit2 $0049
	iftrue UnknownScript_0x1a1eb9
UnknownScript_0x1a1eac: ; 0x1a1eac
	loadtrainer SCHOOLBOY, CHAD1
	startbattle
	returnafterbattle
	loadvar $da04, $1
	clearbit2 $0075
	end
; 0x1a1eb9

UnknownScript_0x1a1eb9: ; 0x1a1eb9
	loadtrainer SCHOOLBOY, CHAD2
	startbattle
	returnafterbattle
	loadvar $da04, $2
	clearbit2 $0075
	end
; 0x1a1ec6

UnknownScript_0x1a1ec6: ; 0x1a1ec6
	loadtrainer SCHOOLBOY, CHAD3
	startbattle
	returnafterbattle
	loadvar $da04, $3
	clearbit2 $0075
	end
; 0x1a1ed3

UnknownScript_0x1a1ed3: ; 0x1a1ed3
	loadtrainer SCHOOLBOY, CHAD4
	startbattle
	returnafterbattle
	loadvar $da04, $4
	clearbit2 $0075
	end
; 0x1a1ee0

UnknownScript_0x1a1ee0: ; 0x1a1ee0
	loadtrainer SCHOOLBOY, CHAD5
	startbattle
	returnafterbattle
	clearbit2 $0075
	end
; 0x1a1ee9

UnknownScript_0x1a1ee9: ; 0x1a1ee9
	jumpstd $0019
	end
; 0x1a1eed

UnknownScript_0x1a1eed: ; 0x1a1eed
	jumpstd $001a
	end
; 0x1a1ef1

UnknownScript_0x1a1ef1: ; 0x1a1ef1
	jumpstd $001b
	end
; 0x1a1ef5

UnknownScript_0x1a1ef5: ; 0x1a1ef5
	jumpstd $001c
	end
; 0x1a1ef9

UnknownScript_0x1a1ef9: ; 0x1a1ef9
	jumpstd $001d
	end
; 0x1a1efd

UnknownScript_0x1a1efd: ; 0x1a1efd
	jumpstd $001e
	end
; 0x1a1f01

UnknownScript_0x1a1f01: ; 0x1a1f01
	jumpstd $001f
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
	2writetext UnknownText_0x1a2185
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
	2writetext UnknownText_0x1a229a
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
	db $0, "Fly high into the", $4f
	db "sky, my beloved", $55
	db "bird #MON!", $57
; 0x1a1f63

Bird_keeperTobyBeatenText: ; 0x1a1f63
	db $0, "I feel like just", $4f
	db "flying away now.", $57
; 0x1a1f86

UnknownText_0x1a1f86: ; 0x1a1f86
	db $0, "I plan to train in", $4f
	db "CIANWOOD CITY to", $51
	db "teach my #MON", $4f
	db "how to FLY.", $57
; 0x1a1fc5

SchoolboyChad1SeenText: ; 0x1a1fc5
	db $0, "Let me try some-", $4f
	db "thing I learned", $55
	db "today.", $57
; 0x1a1fee

SchoolboyChad1BeatenText: ; 0x1a1fee
	db $0, "I didn't study", $4f
	db "enough, I guess.", $57
; 0x1a200e

UnknownText_0x1a200e: ; 0x1a200e
	db $0, "I have to take so", $4f
	db "many tests, I", $51
	db "don't have much", $4f
	db "time for #MON.", $51
	db "So when I do get", $4f
	db "to play, I really", $55
	db "concentrate.", $57
; 0x1a207d

LassDana1SeenText: ; 0x1a207d
	db $0, "You seem to be", $4f
	db "good at #MON.", $51
	db "If you are, how", $4f
	db "about giving me", $55
	db "some advice?", $57
; 0x1a20c8

LassDana1BeatenText: ; 0x1a20c8
	db $0, "I see. So you can", $4f
	db "battle that way.", $57
; 0x1a20ec

UnknownText_0x1a20ec: ; 0x1a20ec
	db $0, "I know something", $4f
	db "good!", $51
	db "MOOMOO FARM's milk", $4f
	db "is famous for its", $55
	db "flavor.", $57
; 0x1a2130

BeautyValerieSeenText: ; 0x1a2130
	db $0, "Hi! Aren't you a", $4f
	db "cute trainer!", $51
	db "May I see your", $4f
	db "#MON?", $57
; 0x1a2164

BeautyValerieBeatenText: ; 0x1a2164
	db $0, "I'm glad I got to", $4f
	db "see your #MON!", $57
; 0x1a2185

UnknownText_0x1a2185: ; 0x1a2185
	db $0, "When I see #-", $4f
	db "MON, it seems to", $55
	db "soothe my nerves.", $57
; 0x1a21b7

SailorHarrySeenText: ; 0x1a21b7
	db $0, "I've been over-", $4f
	db "seas, so I know", $51
	db "about all sorts of", $4f
	db "#MON!", $57
; 0x1a21f0

SailorHarryBeatenText: ; 0x1a21f0
	db $0, "Your skill is", $4f
	db "world class!", $57
; 0x1a220c

UnknownText_0x1a220c: ; 0x1a220c
	db $0, "All kinds of peo-", $4f
	db "ple around the", $51
	db "world live happily", $4f
	db "with #MON.", $57
; 0x1a224c

BeautyOliviaSeenText: ; 0x1a224c
	db $0, "Don't you think my", $4f
	db "#MON and I are", $55
	db "beautiful?", $57
; 0x1a2279

BeautyOliviaBeatenText: ; 0x1a2279
	db $0, "We drink MOOMOO", $4f
	db "MILK every day.", $57
; 0x1a229a

UnknownText_0x1a229a: ; 0x1a229a
	db $0, "MOOMOO MILK is", $4f
	db "good for beauty", $51
	db "and health, but", $4f
	db "inconveniently,", $51
	db "they only sell a", $4f
	db "bottle at a time.", $57
; 0x1a22fd

UnknownText_0x1a22fd: ; 0x1a22fd
	db $0, "ROUTE 38", $51
	db "OLIVINE CITY -", $4f
	db "ECRUTEAK CITY", $57
; 0x1a2324

UnknownText_0x1a2324: ; 0x1a2324
	db $0, "TRAINER TIPS", $51
	db "If a #MON is", $4f
	db "trying to evolve,", $55
	db "you can stop it.", $51
	db "Press the B But-", $4f
	db "ton during evolu-", $55
	db "tion.", $51
	db "That startles the", $4f
	db "#MON and stops", $55
	db "its evolution.", $57
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

