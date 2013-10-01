Route30_MapScriptHeader: ; 0x1a1671
	; trigger count
	db 0

	; callback count
	db 0
; 0x1a1673

YoungsterScript_0x1a1673: ; 0x1a1673
	waitbutton
	playmusic $002a
	loadfont
	2writetext UnknownText_0x1a1806
	pause 30
	loadmovesprites
	playsound $0041
	applymovement $8, MovementData_0x1a17fe
	loadfont
	faceplayer
	2writetext UnknownText_0x1a181c
	closetext
	spriteface $2, $1
	loadmovesprites
	playsound $0041
	applymovement $7, MovementData_0x1a1802
	special $003d
	end
; 0x1a169a

TrainerYoungsterJoey1: ; 0x1a169a
	; bit/flag number
	dw $5a9

	; trainer group && trainer id
	db YOUNGSTER, JOEY1

	; text when seen
	dw YoungsterJoey1SeenText

	; text when trainer beaten
	dw YoungsterJoey1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw YoungsterJoey1Script
; 0x1a16a6

YoungsterJoey1Script: ; 0x1a16a6
	writecode $17, $f
	talkaftercancel
	loadfont
	checkflag $006b
	iftrue UnknownScript_0x1a16e0
	checkcellnum $f
	iftrue UnknownScript_0x1a178f
	checkevent $0273
	iftrue UnknownScript_0x1a16c9
	2writetext UnknownText_0x1a18c2
	keeptextopen
	setevent $0273
	2call UnknownScript_0x1a1783
	2jump UnknownScript_0x1a16cc
; 0x1a16c9

UnknownScript_0x1a16c9: ; 0x1a16c9
	2call UnknownScript_0x1a1787
UnknownScript_0x1a16cc: ; 0x1a16cc
	askforphonenumber $f
	if_equal $1, UnknownScript_0x1a1797
	if_equal $2, UnknownScript_0x1a1793
	trainertotext YOUNGSTER, JOEY1, $0
	2call UnknownScript_0x1a178b
	2jump UnknownScript_0x1a178f
; 0x1a16e0

UnknownScript_0x1a16e0: ; 0x1a16e0
	2call UnknownScript_0x1a179b
	winlosstext YoungsterJoey1BeatenText, $0000
	copybytetovar $d9f9
	if_equal $4, UnknownScript_0x1a16ff
	if_equal $3, UnknownScript_0x1a1705
	if_equal $2, UnknownScript_0x1a170b
	if_equal $1, UnknownScript_0x1a1711
	if_equal $0, UnknownScript_0x1a1717
UnknownScript_0x1a16ff: ; 0x1a16ff
	checkevent $0044
	iftrue UnknownScript_0x1a174b
UnknownScript_0x1a1705: ; 0x1a1705
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x1a173e
UnknownScript_0x1a170b: ; 0x1a170b
	checkflag $0047
	iftrue UnknownScript_0x1a1731
UnknownScript_0x1a1711: ; 0x1a1711
	checkflag $0046
	iftrue UnknownScript_0x1a1724
UnknownScript_0x1a1717: ; 0x1a717
	loadtrainer YOUNGSTER, JOEY1
	startbattle
	returnafterbattle
	loadvar $d9f9, $1
	clearflag $006b
	end
; 0x1a1724

UnknownScript_0x1a1724: ; 0x1a1724
	loadtrainer YOUNGSTER, JOEY2
	startbattle
	returnafterbattle
	loadvar $d9f9, $2
	clearflag $006b
	end
; 0x1a1731

UnknownScript_0x1a1731: ; 0x1a1731
	loadtrainer YOUNGSTER, JOEY3
	startbattle
	returnafterbattle
	loadvar $d9f9, $3
	clearflag $006b
	end
; 0x1a173e

UnknownScript_0x1a173e: ; 0x1a173e
	loadtrainer YOUNGSTER, JOEY4
	startbattle
	returnafterbattle
	loadvar $d9f9, $4
	clearflag $006b
	end
; 0x1a174b

UnknownScript_0x1a174b: ; 0x1a174b
	loadtrainer YOUNGSTER, JOEY5
	startbattle
	returnafterbattle
	clearflag $006b
	checkevent EVENT_JOEY_HP_UP
	iftrue UnknownScript_0x1a176f
	checkevent $0266
	iftrue UnknownScript_0x1a176e
	2call UnknownScript_0x1a17a6
	verbosegiveitem HP_UP, 1
	iffalse UnknownScript_0x1a179f
	setevent $0266
	2jump UnknownScript_0x1a178f
; 0x1a176e

UnknownScript_0x1a176e: ; 0x1a176e
	end
; 0x1a176f

UnknownScript_0x1a176f: ; 0x1a176f
	loadfont
	2writetext UnknownText_0x1a1bc0
	closetext
	verbosegiveitem HP_UP, 1
	iffalse UnknownScript_0x1a179f
	clearevent EVENT_JOEY_HP_UP
	setevent $0266
	2jump UnknownScript_0x1a178f
; 0x1a1783

UnknownScript_0x1a1783: ; 0x1a1783
	jumpstd $0019
	end
; 0x1a1787

UnknownScript_0x1a1787: ; 0x1a1787
	jumpstd $001a
	end
; 0x1a178b

UnknownScript_0x1a178b: ; 0x1a178b
	jumpstd $001b
	end
; 0x1a178f

UnknownScript_0x1a178f: ; 0x1a178f
	jumpstd $001c
	end
; 0x1a1793

UnknownScript_0x1a1793: ; 0x1a1793
	jumpstd $001d
	end
; 0x1a1797

UnknownScript_0x1a1797: ; 0x1a1797
	jumpstd $001e
	end
; 0x1a179b

UnknownScript_0x1a179b: ; 0x1a179b
	jumpstd $001f
	end
; 0x1a179f

UnknownScript_0x1a179f: ; 0x1a179f
	setevent EVENT_JOEY_HP_UP
	jumpstd $0021
	end
; 0x1a17a6

UnknownScript_0x1a17a6: ; 0x1a17a6
	jumpstd $0022
	end
; 0x1a17aa

TrainerYoungsterMikey: ; 0x1a17aa
	; bit/flag number
	dw $5aa

	; trainer group && trainer id
	db YOUNGSTER, MIKEY

	; text when seen
	dw YoungsterMikeySeenText

	; text when trainer beaten
	dw YoungsterMikeyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw YoungsterMikeyScript
; 0x1a17b6

YoungsterMikeyScript: ; 0x1a17b6
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1a197d
	closetext
	loadmovesprites
	end
; 0x1a17be

TrainerBug_catcherDon: ; 0x1a17be
	; bit/flag number
	dw $538

	; trainer group && trainer id
	db BUG_CATCHER, DON

	; text when seen
	dw Bug_catcherDonSeenText

	; text when trainer beaten
	dw Bug_catcherDonBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bug_catcherDonScript
; 0x1a17ca

Bug_catcherDonScript: ; 0x1a17ca
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1a1a1c
	closetext
	loadmovesprites
	end
; 0x1a17d2

YoungsterScript_0x1a17d2: ; 0x1a17d2
	faceplayer
	loadfont
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue UnknownScript_0x1a17e0
	2writetext UnknownText_0x1a1a6a
	closetext
	loadmovesprites
	end
; 0x1a17e0

UnknownScript_0x1a17e0: ; 0x1a17e0
	2writetext UnknownText_0x1a1a94
	closetext
	loadmovesprites
	end
; 0x1a17e6

CooltrainerFScript_0x1a17e6: ; 0x1a17e6
	jumptextfaceplayer UnknownText_0x1a1ac4
; 0x1a17e9

MapRoute30Signpost0Script: ; 0x1a17e9
	jumptext UnknownText_0x1a1b0b
; 0x1a17ec

MapRoute30Signpost1Script: ; 0x1a17ec
	jumptext UnknownText_0x1a1b34
; 0x1a17ef

MapRoute30Signpost2Script: ; 0x1a17ef
	jumptext UnknownText_0x1a1b55
; 0x1a17f2

MapRoute30Signpost3Script: ; 0x1a17f2
	jumptext UnknownText_0x1a1b66
; 0x1a17f5

ItemFragment_0x1a17f5: ; 0x1a17f5
	db ANTIDOTE, 1
; 0x1a17f7

FruitTreeScript_0x1a17f7: ; 0x1a17f7
	fruittree $2
; 0x1a17f9

FruitTreeScript_0x1a17f9: ; 0x1a17f9
	fruittree $5
; 0x1a17fb

MapRoute30SignpostItem4: ; 0x1a17fb
	dw $00a4
	db POTION
	
; 0x1a17fe

MovementData_0x1a17fe: ; 0x1a17fe
	fix_facing
	big_step_up
	big_step_down
	step_end
; 0x1a1802

MovementData_0x1a1802: ; 0x1a1802
	fix_facing
	big_step_down
	big_step_up
	step_end
; 0x1a1806

UnknownText_0x1a1806: ; 0x1a1806
	db $0, "Go, RATTATA!", $51
	db "TACKLE!", $57
; 0x1a181c

UnknownText_0x1a181c: ; 0x1a181c
	db $0, "What? This is a", $4f
	db "big battle!", $55
	db "Leave me alone!", $57
; 0x1a1849

YoungsterJoey1SeenText: ; 0x1a1849
	db $0, "I just lost, so", $4f
	db "I'm trying to find", $55
	db "more #MON.", $51
	db "Wait! You look", $4f
	db "weak! Come on,", $55
	db "let's battle!", $57
; 0x1a18a2

YoungsterJoey1BeatenText: ; 0x1a18a2
	db $0, "Ack! I lost again!", $4f
	db "Doggone it!", $57
; 0x1a18c2

UnknownText_0x1a18c2: ; 0x1a18c2
	db $0, "Do I have to have", $4f
	db "more #MON in", $51
	db "order to battle", $4f
	db "better?", $51
	db "No! I'm sticking", $4f
	db "with this one no", $55
	db "matter what!", $57
; 0x1a1928

YoungsterMikeySeenText: ; 0x1a1928
	db $0, "You're a #MON", $4f
	db "trainer, right?", $51
	db "Then you have to", $4f
	db "battle!", $57
; 0x1a195f

YoungsterMikeyBeatenText: ; 0x1a195f
	db $0, "That's strange.", $4f
	db "I won before.", $57
; 0x1a197d

UnknownText_0x1a197d: ; 0x1a197d
	db $0, "Becoming a good", $4f
	db "trainer is really", $55
	db "tough.", $51
	db "I'm going to bat-", $4f
	db "tle other people", $55
	db "to get better.", $57
; 0x1a19d8

Bug_catcherDonSeenText: ; 0x1a19d8
	db $0, "Instead of a bug", $4f
	db "#MON, I found", $55
	db "a trainer!", $57
; 0x1a1a03

Bug_catcherDonBeatenText: ; 0x1a1a03
	db $0, "Argh! You're too", $4f
	db "strong!", $57
; 0x1a1a1c

UnknownText_0x1a1a1c: ; 0x1a1a1c
	db $0, "I ran out of #", $4f
	db "BALLS while I was", $55
	db "catching #MON.", $51
	db "I should've bought", $4f
	db "some more…", $57
; 0x1a1a6a

UnknownText_0x1a1a6a: ; 0x1a1a6a
	db $0, "MR.#MON's", $4f
	db "house? It's a bit", $55
	db "farther ahead.", $57
; 0x1a1a94

UnknownText_0x1a1a94: ; 0x1a1a94
	db $0, "Everyone's having", $4f
	db "fun battling!", $55
	db "You should too!", $57
; 0x1a1ac4

UnknownText_0x1a1ac4: ; 0x1a1ac4
	db $0, "I'm not a trainer.", $51
	db "But if you look", $4f
	db "one in the eyes,", $55
	db "prepare to battle.", $57
; 0x1a1b0b

UnknownText_0x1a1b0b: ; 0x1a1b0b
	db $0, "ROUTE 30", $51
	db "VIOLET CITY -", $4f
	db "CHERRYGROVE CITY", $57
; 0x1a1b34

UnknownText_0x1a1b34: ; 0x1a1b34
	db $0, "MR.#MON'S HOUSE", $4f
	db "STRAIGHT AHEAD!", $57
; 0x1a1b55

UnknownText_0x1a1b55: ; 0x1a1b55
	db $0, "MR.#MON'S HOUSE", $57
; 0x1a1b66

UnknownText_0x1a1b66: ; 0x1a1b66
	db $0, "TRAINER TIPS", $51
	db "No stealing other", $4f
	db "people's #MON!", $51
	db "# BALLS are to", $4f
	db "be thrown only at", $55
	db "wild #MON!", $57
; 0x1a1bc0

UnknownText_0x1a1bc0: ; 0x1a1bc0
	db $0, "I lost again…", $4f
	db "Gee, you're tough!", $51
	db "Oh yeah, I almost", $4f
	db "forgot that I had", $55
	db "to give you this.", $51
	db "Use it to get even", $4f
	db "tougher, OK?", $51
	db "I'm going to get", $4f
	db "tougher too.", $57
; 0x1a1c54

Route30_MapEventHeader: ; 0x1a1c54
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $27, $7, 1, GROUP_ROUTE_30_BERRY_SPEECH_HOUSE, MAP_ROUTE_30_BERRY_SPEECH_HOUSE
	warp_def $5, $11, 1, GROUP_MR_POKEMONS_HOUSE, MAP_MR_POKEMONS_HOUSE

	; xy triggers
	db 0

	; signposts
	db 5
	signpost 43, 9, $0, MapRoute30Signpost0Script
	signpost 29, 13, $0, MapRoute30Signpost1Script
	signpost 5, 15, $0, MapRoute30Signpost2Script
	signpost 21, 3, $0, MapRoute30Signpost3Script
	signpost 9, 14, $7, MapRoute30SignpostItem4

	; people-events
	db 11
	person_event SPRITE_YOUNGSTER, 30, 9, $7, $0, 255, 255, $90, 0, YoungsterScript_0x1a1673, $0714
	person_event SPRITE_YOUNGSTER, 32, 6, $9, $0, 255, 255, $92, 3, TrainerYoungsterJoey1, $0715
	person_event SPRITE_YOUNGSTER, 27, 9, $6, $0, 255, 255, $92, 1, TrainerYoungsterMikey, $ffff
	person_event SPRITE_BUG_CATCHER, 11, 5, $6, $0, 255, 255, $b2, 3, TrainerBug_catcherDon, $ffff
	person_event SPRITE_YOUNGSTER, 34, 11, $5, $1, 255, 255, $80, 0, YoungsterScript_0x1a17d2, $ffff
	person_event SPRITE_MONSTER, 28, 9, $6, $0, 255, 255, $80, 0, ObjectEvent, $0714
	person_event SPRITE_MONSTER, 29, 9, $7, $0, 255, 255, $90, 0, ObjectEvent, $0714
	person_event SPRITE_FRUIT_TREE, 43, 9, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x1a17f7, $ffff
	person_event SPRITE_FRUIT_TREE, 9, 15, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x1a17f9, $ffff
	person_event SPRITE_COOLTRAINER_F, 17, 6, $6, $0, 255, 255, $0, 0, CooltrainerFScript_0x1a17e6, $ffff
	person_event SPRITE_POKE_BALL, 39, 12, $1, $0, 255, 255, $1, 0, ItemFragment_0x1a17f5, $07b8
; 0x1a1d0c

