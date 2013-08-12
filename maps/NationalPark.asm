NationalPark_MapScriptHeader: ; 0x5c000
	; trigger count
	db 0

	; callback count
	db 0
; 0x5c002

LassScript_0x5c002: ; 0x5c002
	jumptextfaceplayer UnknownText_0x5c1d3
; 0x5c005

PokefanFScript_0x5c005: ; 0x5c005
	jumptextfaceplayer UnknownText_0x5c22e
; 0x5c008

TeacherScript_0x5c008: ; 0x5c008
	faceplayer
	loadfont
	checkbit1 $0057
	iftrue UnknownScript_0x5c01d
	2writetext UnknownText_0x5c265
	keeptextopen
	verbosegiveitem QUICK_CLAW, 1
	iffalse UnknownScript_0x5c021
	setbit1 $0057
UnknownScript_0x5c01d: ; 0x5c01d
	2writetext UnknownText_0x5c30d
	closetext
UnknownScript_0x5c021: ; 0x5c021
	loadmovesprites
	end
; 0x5c023

YoungsterScript_0x5c023: ; 0x5c023
	jumptextfaceplayer UnknownText_0x5c35d
; 0x5c026

YoungsterScript_0x5c026: ; 0x5c026
	jumptextfaceplayer UnknownText_0x5c38f
; 0x5c029

TeacherScript_0x5c029: ; 0x5c029
	jumptextfaceplayer UnknownText_0x5c3bc
; 0x5c02c

GrowlitheScript_0x5c02c: ; 0x5c02c
	faceplayer
	loadfont
	2writetext UnknownText_0x5c416
	cry PERSIAN
	closetext
	loadmovesprites
	end
; 0x5c037

GameboyKidScript_0x5c037: ; 0x5c037
	faceplayer
	loadfont
	2writetext UnknownText_0x5c42a
	closetext
	loadmovesprites
	spriteface $e, $0
	end
; 0x5c042

TrainerSchoolboyJack1: ; 0x5c042
	; bit/flag number
	dw $46c

	; trainer group && trainer id
	db SCHOOLBOY, JACK1

	; text when seen
	dw SchoolboyJack1SeenText

	; text when trainer beaten
	dw SchoolboyJack1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SchoolboyJack1Script
; 0x5c04e

SchoolboyJack1Script: ; 0x5c04e
	writecode $17, $5
	talkaftercancel
	loadfont
	checkbit2 $0065
	iftrue UnknownScript_0x5c088
	checkcellnum $5
	iftrue UnknownScript_0x5c108
	checkbit1 $025f
	iftrue UnknownScript_0x5c071
	2writetext UnknownText_0x5c4f3
	keeptextopen
	setbit1 $025f
	2call UnknownScript_0x5c0fc
	2jump UnknownScript_0x5c074
; 0x5c071

UnknownScript_0x5c071: ; 0x5c071
	2call UnknownScript_0x5c100
UnknownScript_0x5c074: ; 0x5c074
	askforphonenumber $5
	if_equal $1, UnknownScript_0x5c110
	if_equal $2, UnknownScript_0x5c10c
	trainertotext SCHOOLBOY, JACK1, $0
	2call UnknownScript_0x5c104
	2jump UnknownScript_0x5c108
; 0x5c088

UnknownScript_0x5c088: ; 0x5c088
	2call UnknownScript_0x5c114
	winlosstext SchoolboyJack1BeatenText, $0000
	copybytetovar $d9f2
	if_equal $4, UnknownScript_0x5c0a7
	if_equal $3, UnknownScript_0x5c0ad
	if_equal $2, UnknownScript_0x5c0b3
	if_equal $1, UnknownScript_0x5c0b9
	if_equal $0, UnknownScript_0x5c0bf
UnknownScript_0x5c0a7: ; 0x5c0a7
	checkbit1 $00cd
	iftrue UnknownScript_0x5c0f3
UnknownScript_0x5c0ad: ; 0x5c0ad
	checkbit1 $0044
	iftrue UnknownScript_0x5c0e6
UnknownScript_0x5c0b3: ; 0x5c0b3
	checkbit1 $0021
	iftrue UnknownScript_0x5c0d9
UnknownScript_0x5c0b9: ; 0x5c0b9
	checkbit2 $0047
	iftrue UnknownScript_0x5c0cc
UnknownScript_0x5c0bf: ; 0x5c0bf
	loadtrainer SCHOOLBOY, JACK1
	startbattle
	returnafterbattle
	loadvar $d9f2, $1
	clearbit2 $0065
	end
; 0x5c0cc

UnknownScript_0x5c0cc: ; 0x5c0cc
	loadtrainer SCHOOLBOY, JACK2
	startbattle
	returnafterbattle
	loadvar $d9f2, $2
	clearbit2 $0065
	end
; 0x5c0d9

UnknownScript_0x5c0d9: ; 0x5c0d9
	loadtrainer SCHOOLBOY, JACK3
	startbattle
	returnafterbattle
	loadvar $d9f2, $3
	clearbit2 $0065
	end
; 0x5c0e6

UnknownScript_0x5c0e6: ; 0x5c0e6
	loadtrainer SCHOOLBOY, JACK4
	startbattle
	returnafterbattle
	loadvar $d9f2, $4
	clearbit2 $0065
	end
; 0x5c0f3

UnknownScript_0x5c0f3: ; 0x5c0f3
	loadtrainer SCHOOLBOY, JACK5
	startbattle
	returnafterbattle
	clearbit2 $0065
	end
; 0x5c0fc

UnknownScript_0x5c0fc: ; 0x5c0fc
	jumpstd $0019
	end
; 0x5c100

UnknownScript_0x5c100: ; 0x5c100
	jumpstd $001a
	end
; 0x5c104

UnknownScript_0x5c104: ; 0x5c104
	jumpstd $001b
	end
; 0x5c108

UnknownScript_0x5c108: ; 0x5c108
	jumpstd $001c
	end
; 0x5c10c

UnknownScript_0x5c10c: ; 0x5c10c
	jumpstd $001d
	end
; 0x5c110

UnknownScript_0x5c110: ; 0x5c110
	jumpstd $001e
	end
; 0x5c114

UnknownScript_0x5c114: ; 0x5c114
	jumpstd $001f
	end
; 0x5c118

TrainerPokefanmWilliam: ; 0x5c118
	; bit/flag number
	dw $4cd

	; trainer group && trainer id
	db POKEFANM, WILLIAM

	; text when seen
	dw PokefanmWilliamSeenText

	; text when trainer beaten
	dw PokefanmWilliamBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokefanmWilliamScript
; 0x5c124

PokefanmWilliamScript: ; 0x5c124
	talkaftercancel
	loadfont
	2writetext UnknownText_0x5c645
	closetext
	loadmovesprites
	end
; 0x5c12c

TrainerPokefanfBeverly1: ; 0x5c12c
	; bit/flag number
	dw $4d9

	; trainer group && trainer id
	db POKEFANF, BEVERLY1

	; text when seen
	dw PokefanfBeverly1SeenText

	; text when trainer beaten
	dw PokefanfBeverly1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokefanfBeverly1Script
; 0x5c138

PokefanfBeverly1Script: ; 0x5c138
	writecode $17, $6
	talkaftercancel
	loadfont
	checkbit2 $007d
	iftrue UnknownScript_0x5c177
	checkcellnum $6
	iftrue UnknownScript_0x5c19b
	checkpoke MARILL
	iffalse UnknownScript_0x5c189
	checkbit1 $0261
	iftrue UnknownScript_0x5c160
	2writetext UnknownText_0x5c5bd
	keeptextopen
	setbit1 $0261
	2call UnknownScript_0x5c18f
	2jump UnknownScript_0x5c163
; 0x5c160

UnknownScript_0x5c160: ; 0x5c160
	2call UnknownScript_0x5c193
UnknownScript_0x5c163: ; 0x5c163
	askforphonenumber $6
	if_equal $1, UnknownScript_0x5c1a3
	if_equal $2, UnknownScript_0x5c19f
	trainertotext POKEFANF, BEVERLY1, $0
	2call UnknownScript_0x5c197
	2jump UnknownScript_0x5c19b
; 0x5c177

UnknownScript_0x5c177: ; 0x5c177
	2call UnknownScript_0x5c1a7
	verbosegiveitem NUGGET, 1
	iffalse UnknownScript_0x5c186
	clearbit2 $007d
	2jump UnknownScript_0x5c19b
; 0x5c186

UnknownScript_0x5c186: ; 0x5c186
	2jump UnknownScript_0x5c1ab
; 0x5c189

UnknownScript_0x5c189: ; 0x5c189
	2writetext UnknownText_0x5c68a
	closetext
	loadmovesprites
	end
; 0x5c18f

UnknownScript_0x5c18f: ; 0x5c18f
	jumpstd $0023
	end
; 0x5c193

UnknownScript_0x5c193: ; 0x5c193
	jumpstd $0024
	end
; 0x5c197

UnknownScript_0x5c197: ; 0x5c197
	jumpstd $0025
	end
; 0x5c19b

UnknownScript_0x5c19b: ; 0x5c19b
	jumpstd $0026
	end
; 0x5c19f

UnknownScript_0x5c19f: ; 0x5c19f
	jumpstd $0027
	end
; 0x5c1a3

UnknownScript_0x5c1a3: ; 0x5c1a3
	jumpstd $0028
	end
; 0x5c1a7

UnknownScript_0x5c1a7: ; 0x5c1a7
	jumpstd $002a
	end
; 0x5c1ab

UnknownScript_0x5c1ab: ; 0x5c1ab
	jumpstd $002b
	end
; 0x5c1af

TrainerLassKrise: ; 0x5c1af
	; bit/flag number
	dw $518

	; trainer group && trainer id
	db LASS, KRISE

	; text when seen
	dw LassKriseSeenText

	; text when trainer beaten
	dw LassKriseBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw LassKriseScript
; 0x5c1bb

LassKriseScript: ; 0x5c1bb
	talkaftercancel
	loadfont
	2writetext UnknownText_0x5c71d
	closetext
	loadmovesprites
	end
; 0x5c1c3

MapNationalParkSignpost0Script: ; 0x5c1c3
	jumptext UnknownText_0x5c750
; 0x5c1c6

MapNationalParkSignpost1Script: ; 0x5c1c6
	jumptext UnknownText_0x5c771
; 0x5c1c9

MapNationalParkSignpost3Script: ; 0x5c1c9
	jumptext UnknownText_0x5c7c6
; 0x5c1cc

ItemFragment_0x5c1cc: ; 0x5c1cc
	db PARLYZ_HEAL, 1
; 0x5c1ce

ItemFragment_0x5c1ce: ; 0x5c1ce
	db TM_28, 1
; 0x5c1d0

MapNationalParkSignpostItem2: ; 0x5c1d0
	dw $0084
	db FULL_HEAL
	
; 0x5c1d3

UnknownText_0x5c1d3: ; 0x5c1d3
	db $0, "Look! Check out my", $4f
	db "bag!", $51
	db "I printed out my", $4f
	db "favorites from my", $51
	db "#DEX and stuck", $4f
	db "them on my bag.", $57
; 0x5c22e

UnknownText_0x5c22e: ; 0x5c22e
	db $0, "This is MAIL I got", $4f
	db "from my daughter.", $55
	db "It cheers me up.", $57
; 0x5c265

UnknownText_0x5c265: ; 0x5c265
	db $0, "Pay attention,", $4f
	db "please!", $51
	db "…Oops, I have to", $4f
	db "quit thinking like", $51
	db "a teacher all the", $4f
	db "time.", $51
	db "You must be a", $4f
	db "#MON trainer.", $51
	db "Since you're work-", $4f
	db "ing so hard, I", $51
	db "want you to have", $4f
	db "this.", $57
; 0x5c30d

UnknownText_0x5c30d: ; 0x5c30d
	db $0, "Let a #MON hold", $4f
	db "that QUICK CLAW.", $51
	db "Sometimes it will", $4f
	db "strike first", $55
	db "during battle.", $57
; 0x5c35d

UnknownText_0x5c35d: ; 0x5c35d
	db $0, "I'm playing with", $4f
	db "stickers I printed", $55
	db "from my #DEX.", $57
; 0x5c38f

UnknownText_0x5c38f: ; 0x5c38f
	db $0, "I get the other", $4f
	db "guy's #DEX", $55
	db "sticker if I win.", $57
; 0x5c3bc

UnknownText_0x5c3bc: ; 0x5c3bc
	db $0, "I take walks in", $4f
	db "the PARK, but I", $51
	db "never go into the", $4f
	db "grass.", $51
	db "Trainers always", $4f
	db "want to battle…", $57
; 0x5c416

UnknownText_0x5c416: ; 0x5c416
	db $0, "PERSIAN: Fufushaa!", $57
; 0x5c42a

UnknownText_0x5c42a: ; 0x5c42a
	db $0, "I'm printing out", $4f
	db "my #DEX.", $51
	db "You can also print", $4f
	db "out stuff like", $51
	db "MAIL and your PC", $4f
	db "BOXES.", $57
; 0x5c47e

SchoolboyJack1SeenText: ; 0x5c47e
	db $0, "The world of", $4f
	db "#MON is deep.", $51
	db "There are still", $4f
	db "lots of things we", $55
	db "don't know.", $51
	db "But I know more", $4f
	db "than you do!", $57
; 0x5c4e4

SchoolboyJack1BeatenText: ; 0x5c4e4
	db $0, "Wha-wha-what?", $57
; 0x5c4f3

UnknownText_0x5c4f3: ; 0x5c4f3
	db $0, "There is a lot", $4f
	db "to learn.", $51
	db "For example…", $51
	db "There are 50 kinds", $4f
	db "of TMs.", $51
	db "Traded #MON", $4f
	db "level up faster.", $57
; 0x5c552

PokefanfBeverly1SeenText: ; 0x5c552
	db $0, "My #MON are", $4f
	db "simply darling.", $51
	db "Let me tell you", $4f
	db "how proud my", $55
	db "darlings make me.", $57
; 0x5c59e

PokefanfBeverly1BeatenText: ; 0x5c59e
	db $0, "I can beat you in", $4f
	db "pride, but…", $57
; 0x5c5bd

UnknownText_0x5c5bd: ; 0x5c5bd
	db $0, "I must say, your", $4f
	db "#MON are quite", $55
	db "cute, too.", $57
; 0x5c5e9

PokefanmWilliamSeenText: ; 0x5c5e9
	db $0, "We adore our #-", $4f
	db "MON, even if they", $55
	db "dislike us.", $51
	db "That's what being", $4f
	db "a FAN is about.", $57
; 0x5c639

PokefanmWilliamBeatenText: ; 0x5c639
	db $0, "M-my #MON!", $57
; 0x5c645

UnknownText_0x5c645: ; 0x5c645
	db $0, "I lost the battle,", $4f
	db "but my #MON win", $51
	db "the prize for", $4f
	db "being most lovely.", $57
; 0x5c68a

UnknownText_0x5c68a: ; 0x5c68a
	db $0, "My friend keeps a", $4f
	db "MARILL!", $51
	db "I find them very", $4f
	db "endearing.", $51
	db "Oh, I wish for a", $4f
	db "MARILL of my own…", $57
; 0x5c6e4

LassKriseSeenText: ; 0x5c6e4
	db $0, "Hello? Why are you", $4f
	db "staring at me?", $51
	db "Oh, a battle?", $57
; 0x5c715

LassKriseBeatenText: ; 0x5c715
	db $0, "…Hmmm…", $57
; 0x5c71d

UnknownText_0x5c71d: ; 0x5c71d
	db $0, "I thought you were", $4f
	db "staring at me", $55
	db "because I'm cute!", $57
; 0x5c750

UnknownText_0x5c750: ; 0x5c750
	db $0, "RELAXATION SQUARE", $4f
	db "NATIONAL PARK", $57
; 0x5c771

UnknownText_0x5c771: ; 0x5c771
	db $0, "What is this", $4f
	db "notice?", $51
	db "Please battle only", $4f
	db "in the grass.", $51
	db "NATIONAL PARK", $4f
	db "WARDEN'S OFFICE", $57
; 0x5c7c6

UnknownText_0x5c7c6: ; 0x5c7c6
	db $0, "TRAINER TIPS", $51
	db "Print out MAIL by", $4f
	db "opening it then", $55
	db "pressing START.", $57
; 0x5c806

NationalPark_MapEventHeader: ; 0x5c806
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $12, $21, 1, GROUP_ROUTE_36_NATIONAL_PARK_GATE, MAP_ROUTE_36_NATIONAL_PARK_GATE
	warp_def $13, $21, 2, GROUP_ROUTE_36_NATIONAL_PARK_GATE, MAP_ROUTE_36_NATIONAL_PARK_GATE
	warp_def $2f, $a, 1, GROUP_ROUTE_35_NATIONAL_PARK_GATE, MAP_ROUTE_35_NATIONAL_PARK_GATE
	warp_def $2f, $b, 2, GROUP_ROUTE_35_NATIONAL_PARK_GATE, MAP_ROUTE_35_NATIONAL_PARK_GATE

	; xy triggers
	db 0

	; signposts
	db 4
	signpost 44, 14, $0, MapNationalParkSignpost0Script
	signpost 31, 27, $0, MapNationalParkSignpost1Script
	signpost 47, 6, $7, MapNationalParkSignpostItem2
	signpost 4, 12, $0, MapNationalParkSignpost3Script

	; people-events
	db 14
	person_event SPRITE_LASS, 28, 19, $5, $1, 255, 255, $a0, 0, LassScript_0x5c002, $ffff
	person_event SPRITE_POKEFAN_F, 8, 18, $6, $0, 255, 255, $0, 0, PokefanFScript_0x5c005, $ffff
	person_event SPRITE_TEACHER, 44, 31, $6, $0, 255, 255, $a0, 0, TeacherScript_0x5c008, $ffff
	person_event SPRITE_YOUNGSTER, 45, 15, $8, $0, 255, 255, $0, 0, YoungsterScript_0x5c023, $ffff
	person_event SPRITE_YOUNGSTER, 45, 14, $6, $0, 255, 255, $80, 0, YoungsterScript_0x5c026, $ffff
	person_event SPRITE_TEACHER, 45, 21, $2, $21, 255, 255, $0, 0, TeacherScript_0x5c029, $ffff
	person_event SPRITE_GROWLITHE, 44, 30, $16, $0, 255, 255, $0, 0, GrowlitheScript_0x5c02c, $ffff
	person_event SPRITE_YOUNGSTER, 27, 31, $a, $0, 255, 255, $92, 3, TrainerSchoolboyJack1, $ffff
	person_event SPRITE_POKEFAN_F, 33, 22, $a, $0, 255, 255, $82, 2, TrainerPokefanfBeverly1, $ffff
	person_event SPRITE_POKEFAN_M, 13, 20, $a, $0, 255, 255, $82, 2, TrainerPokefanmWilliam, $ffff
	person_event SPRITE_LASS, 18, 12, $a, $0, 255, 255, $92, 3, TrainerLassKrise, $ffff
	person_event SPRITE_POKE_BALL, 16, 39, $1, $0, 255, 255, $1, 0, ItemFragment_0x5c1cc, $0658
	person_event SPRITE_GAMEBOY_KID, 10, 30, $6, $0, 255, 255, $0, 0, GameboyKidScript_0x5c037, $ffff
	person_event SPRITE_POKE_BALL, 47, 5, $1, $0, 255, 255, $1, 0, ItemFragment_0x5c1ce, $0659
; 0x5c8ea

