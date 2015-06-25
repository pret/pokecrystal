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
	checkevent EVENT_GOT_QUICK_CLAW
	iftrue UnknownScript_0x5c01d
	writetext UnknownText_0x5c265
	keeptextopen
	verbosegiveitem QUICK_CLAW, 1
	iffalse UnknownScript_0x5c021
	setevent EVENT_GOT_QUICK_CLAW
UnknownScript_0x5c01d: ; 0x5c01d
	writetext UnknownText_0x5c30d
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
	writetext UnknownText_0x5c416
	cry PERSIAN
	closetext
	loadmovesprites
	end
; 0x5c037

GameboyKidScript_0x5c037: ; 0x5c037
	faceplayer
	loadfont
	writetext UnknownText_0x5c42a
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
	checkflag $0065
	iftrue UnknownScript_0x5c088
	checkcellnum $5
	iftrue UnknownScript_0x5c108
	checkevent $025f
	iftrue UnknownScript_0x5c071
	writetext UnknownText_0x5c4f3
	keeptextopen
	setevent $025f
	scall UnknownScript_0x5c0fc
	jump UnknownScript_0x5c074
; 0x5c071

UnknownScript_0x5c071: ; 0x5c071
	scall UnknownScript_0x5c100
UnknownScript_0x5c074: ; 0x5c074
	askforphonenumber $5
	if_equal $1, UnknownScript_0x5c110
	if_equal $2, UnknownScript_0x5c10c
	trainertotext SCHOOLBOY, JACK1, $0
	scall UnknownScript_0x5c104
	jump UnknownScript_0x5c108
; 0x5c088

UnknownScript_0x5c088: ; 0x5c088
	scall UnknownScript_0x5c114
	winlosstext SchoolboyJack1BeatenText, $0000
	copybytetovar wd9f2
	if_equal $4, UnknownScript_0x5c0a7
	if_equal $3, UnknownScript_0x5c0ad
	if_equal $2, UnknownScript_0x5c0b3
	if_equal $1, UnknownScript_0x5c0b9
	if_equal $0, UnknownScript_0x5c0bf
UnknownScript_0x5c0a7: ; 0x5c0a7
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue UnknownScript_0x5c0f3
UnknownScript_0x5c0ad: ; 0x5c0ad
	checkevent $0044
	iftrue UnknownScript_0x5c0e6
UnknownScript_0x5c0b3: ; 0x5c0b3
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x5c0d9
UnknownScript_0x5c0b9: ; 0x5c0b9
	checkflag $0047
	iftrue UnknownScript_0x5c0cc
UnknownScript_0x5c0bf: ; 0x5c0bf
	loadtrainer SCHOOLBOY, JACK1
	startbattle
	returnafterbattle
	loadvar wd9f2, $1
	clearflag $0065
	end
; 0x5c0cc

UnknownScript_0x5c0cc: ; 0x5c0cc
	loadtrainer SCHOOLBOY, JACK2
	startbattle
	returnafterbattle
	loadvar wd9f2, $2
	clearflag $0065
	end
; 0x5c0d9

UnknownScript_0x5c0d9: ; 0x5c0d9
	loadtrainer SCHOOLBOY, JACK3
	startbattle
	returnafterbattle
	loadvar wd9f2, $3
	clearflag $0065
	end
; 0x5c0e6

UnknownScript_0x5c0e6: ; 0x5c0e6
	loadtrainer SCHOOLBOY, JACK4
	startbattle
	returnafterbattle
	loadvar wd9f2, $4
	clearflag $0065
	end
; 0x5c0f3

UnknownScript_0x5c0f3: ; 0x5c0f3
	loadtrainer SCHOOLBOY, JACK5
	startbattle
	returnafterbattle
	clearflag $0065
	end
; 0x5c0fc

UnknownScript_0x5c0fc: ; 0x5c0fc
	jumpstd asknumber1m
	end
; 0x5c100

UnknownScript_0x5c100: ; 0x5c100
	jumpstd asknumber2m
	end
; 0x5c104

UnknownScript_0x5c104: ; 0x5c104
	jumpstd registerednumberm
	end
; 0x5c108

UnknownScript_0x5c108: ; 0x5c108
	jumpstd numberacceptedm
	end
; 0x5c10c

UnknownScript_0x5c10c: ; 0x5c10c
	jumpstd numberdeclinedm
	end
; 0x5c110

UnknownScript_0x5c110: ; 0x5c110
	jumpstd phonefullm
	end
; 0x5c114

UnknownScript_0x5c114: ; 0x5c114
	jumpstd rematchm
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
	writetext UnknownText_0x5c645
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
	checkflag $007d
	iftrue UnknownScript_0x5c177
	checkcellnum $6
	iftrue UnknownScript_0x5c19b
	checkpoke MARILL
	iffalse UnknownScript_0x5c189
	checkevent EVENT_SHOWED_BEVERLY_MARILL
	iftrue UnknownScript_0x5c160
	writetext UnknownText_0x5c5bd
	keeptextopen
	setevent EVENT_SHOWED_BEVERLY_MARILL
	scall UnknownScript_0x5c18f
	jump UnknownScript_0x5c163
; 0x5c160

UnknownScript_0x5c160: ; 0x5c160
	scall UnknownScript_0x5c193
UnknownScript_0x5c163: ; 0x5c163
	askforphonenumber $6
	if_equal $1, UnknownScript_0x5c1a3
	if_equal $2, UnknownScript_0x5c19f
	trainertotext POKEFANF, BEVERLY1, $0
	scall UnknownScript_0x5c197
	jump UnknownScript_0x5c19b
; 0x5c177

UnknownScript_0x5c177: ; 0x5c177
	scall UnknownScript_0x5c1a7
	verbosegiveitem NUGGET, 1
	iffalse UnknownScript_0x5c186
	clearflag $007d
	jump UnknownScript_0x5c19b
; 0x5c186

UnknownScript_0x5c186: ; 0x5c186
	jump UnknownScript_0x5c1ab
; 0x5c189

UnknownScript_0x5c189: ; 0x5c189
	writetext UnknownText_0x5c68a
	closetext
	loadmovesprites
	end
; 0x5c18f

UnknownScript_0x5c18f: ; 0x5c18f
	jumpstd asknumber1f
	end
; 0x5c193

UnknownScript_0x5c193: ; 0x5c193
	jumpstd asknumber2f
	end
; 0x5c197

UnknownScript_0x5c197: ; 0x5c197
	jumpstd registerednumberf
	end
; 0x5c19b

UnknownScript_0x5c19b: ; 0x5c19b
	jumpstd numberacceptedf
	end
; 0x5c19f

UnknownScript_0x5c19f: ; 0x5c19f
	jumpstd numberdeclinedf
	end
; 0x5c1a3

UnknownScript_0x5c1a3: ; 0x5c1a3
	jumpstd phonefullf
	end
; 0x5c1a7

UnknownScript_0x5c1a7: ; 0x5c1a7
	jumpstd giftf
	end
; 0x5c1ab

UnknownScript_0x5c1ab: ; 0x5c1ab
	jumpstd packfullf
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
	writetext UnknownText_0x5c71d
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
	text "Look! Check out my"
	line "bag!"

	para "I printed out my"
	line "favorites from my"

	para "#DEX and stuck"
	line "them on my bag."
	done
; 0x5c22e

UnknownText_0x5c22e: ; 0x5c22e
	text "This is MAIL I got"
	line "from my daughter."
	cont "It cheers me up."
	done
; 0x5c265

UnknownText_0x5c265: ; 0x5c265
	text "Pay attention,"
	line "please!"

	para "…Oops, I have to"
	line "quit thinking like"

	para "a teacher all the"
	line "time."

	para "You must be a"
	line "#MON trainer."

	para "Since you're work-"
	line "ing so hard, I"

	para "want you to have"
	line "this."
	done
; 0x5c30d

UnknownText_0x5c30d: ; 0x5c30d
	text "Let a #MON hold"
	line "that QUICK CLAW."

	para "Sometimes it will"
	line "strike first"
	cont "during battle."
	done
; 0x5c35d

UnknownText_0x5c35d: ; 0x5c35d
	text "I'm playing with"
	line "stickers I printed"
	cont "from my #DEX."
	done
; 0x5c38f

UnknownText_0x5c38f: ; 0x5c38f
	text "I get the other"
	line "guy's #DEX"
	cont "sticker if I win."
	done
; 0x5c3bc

UnknownText_0x5c3bc: ; 0x5c3bc
	text "I take walks in"
	line "the PARK, but I"

	para "never go into the"
	line "grass."

	para "Trainers always"
	line "want to battle…"
	done
; 0x5c416

UnknownText_0x5c416: ; 0x5c416
	text "PERSIAN: Fufushaa!"
	done
; 0x5c42a

UnknownText_0x5c42a: ; 0x5c42a
	text "I'm printing out"
	line "my #DEX."

	para "You can also print"
	line "out stuff like"

	para "MAIL and your PC"
	line "BOXES."
	done
; 0x5c47e

SchoolboyJack1SeenText: ; 0x5c47e
	text "The world of"
	line "#MON is deep."

	para "There are still"
	line "lots of things we"
	cont "don't know."

	para "But I know more"
	line "than you do!"
	done
; 0x5c4e4

SchoolboyJack1BeatenText: ; 0x5c4e4
	text "Wha-wha-what?"
	done
; 0x5c4f3

UnknownText_0x5c4f3: ; 0x5c4f3
	text "There is a lot"
	line "to learn."

	para "For example…"

	para "There are 50 kinds"
	line "of TMs."

	para "Traded #MON"
	line "level up faster."
	done
; 0x5c552

PokefanfBeverly1SeenText: ; 0x5c552
	text "My #MON are"
	line "simply darling."

	para "Let me tell you"
	line "how proud my"
	cont "darlings make me."
	done
; 0x5c59e

PokefanfBeverly1BeatenText: ; 0x5c59e
	text "I can beat you in"
	line "pride, but…"
	done
; 0x5c5bd

UnknownText_0x5c5bd: ; 0x5c5bd
	text "I must say, your"
	line "#MON are quite"
	cont "cute, too."
	done
; 0x5c5e9

PokefanmWilliamSeenText: ; 0x5c5e9
	text "We adore our #-"
	line "MON, even if they"
	cont "dislike us."

	para "That's what being"
	line "a FAN is about."
	done
; 0x5c639

PokefanmWilliamBeatenText: ; 0x5c639
	text "M-my #MON!"
	done
; 0x5c645

UnknownText_0x5c645: ; 0x5c645
	text "I lost the battle,"
	line "but my #MON win"

	para "the prize for"
	line "being most lovely."
	done
; 0x5c68a

UnknownText_0x5c68a: ; 0x5c68a
	text "My friend keeps a"
	line "MARILL!"

	para "I find them very"
	line "endearing."

	para "Oh, I wish for a"
	line "MARILL of my own…"
	done
; 0x5c6e4

LassKriseSeenText: ; 0x5c6e4
	text "Hello? Why are you"
	line "staring at me?"

	para "Oh, a battle?"
	done
; 0x5c715

LassKriseBeatenText: ; 0x5c715
	text "…Hmmm…"
	done
; 0x5c71d

UnknownText_0x5c71d: ; 0x5c71d
	text "I thought you were"
	line "staring at me"
	cont "because I'm cute!"
	done
; 0x5c750

UnknownText_0x5c750: ; 0x5c750
	text "RELAXATION SQUARE"
	line "NATIONAL PARK"
	done
; 0x5c771

UnknownText_0x5c771: ; 0x5c771
	text "What is this"
	line "notice?"

	para "Please battle only"
	line "in the grass."

	para "NATIONAL PARK"
	line "WARDEN'S OFFICE"
	done
; 0x5c7c6

UnknownText_0x5c7c6: ; 0x5c7c6
	text "TRAINER TIPS"

	para "Print out MAIL by"
	line "opening it then"
	cont "pressing START."
	done
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
