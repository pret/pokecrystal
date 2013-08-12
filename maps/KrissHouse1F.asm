KrissHouse1F_MapScriptHeader: ; 0x7a4cc
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x7a4d6, $0000
	dw UnknownScript_0x7a4d7, $0000

	; callback count
	db 0
; 0x7a4d6

UnknownScript_0x7a4d6: ; 0x7a4d6
	end
; 0x7a4d7

UnknownScript_0x7a4d7: ; 0x7a4d7
	end
; 0x7a4d8

UnknownScript_0x7a4d8: ; 0x7a4d8
	setbit1 $0000
; 0x7a4db

UnknownScript_0x7a4db: ; 0x7a4db
	playmusic $004e
	showemote $0, $2, 15
	spriteface $0, $2
	checkbit1 $0000
	iffalse UnknownScript_0x7a4f2
	applymovement $2, MovementData_0x7a5fc
	2jump UnknownScript_0x7a4f6
; 0x7a4f2

UnknownScript_0x7a4f2: ; 0x7a4f2
	applymovement $2, MovementData_0x7a5fe
UnknownScript_0x7a4f6: ; 0x7a4f6
	loadfont
	2writetext UnknownText_0x7a604
	keeptextopen
	stringtotext GearName, $1
	2call UnknownScript_0x7a57e
	setbit2 $0004
	setbit2 $0002
	addcellnum $1
	dotrigger $1
	setbit1 $06c7
	clearbit1 $06c8
	2writetext UnknownText_0x7a6bd
	keeptextopen
	special $0025
UnknownScript_0x7a519: ; 0x7a519
	2writetext UnknownText_0x7a742
	yesorno
	iffalse UnknownScript_0x7a52a
	special $00a6
	yesorno
	iffalse UnknownScript_0x7a519
	2jump UnknownScript_0x7a531
; 0x7a52a

UnknownScript_0x7a52a: ; 0x7a52a
	special $00a7
	yesorno
	iffalse UnknownScript_0x7a519
UnknownScript_0x7a531: ; 0x7a531
	2writetext UnknownText_0x7a763
	yesorno
	iffalse UnknownScript_0x7a542
	2jump UnknownScript_0x7a53b
; 0x7a53b

UnknownScript_0x7a53b: ; 0x7a53b
	2writetext UnknownText_0x7a7cb
	keeptextopen
	2jump UnknownScript_0x7a549
; 0x7a542

UnknownScript_0x7a542: ; 0x7a542
	2writetext UnknownText_0x7a807
	keeptextopen
	2jump UnknownScript_0x7a549
; 0x7a549

UnknownScript_0x7a549: ; 0x7a549
	2writetext UnknownText_0x7a850
	closetext
	loadmovesprites
	checkbit1 $0000
	iftrue UnknownScript_0x7a55d
	checkbit1 $0001
	iffalse UnknownScript_0x7a564
	2jump UnknownScript_0x7a56b
; 0x7a55d

UnknownScript_0x7a55d: ; 0x7a55d
	applymovement $2, MovementData_0x7a600
	2jump UnknownScript_0x7a56b
; 0x7a564

UnknownScript_0x7a564: ; 0x7a564
	applymovement $2, MovementData_0x7a602
	2jump UnknownScript_0x7a56b
; 0x7a56b

UnknownScript_0x7a56b: ; 0x7a56b
	special $003d
	spriteface $2, $2
	end
; 0x7a572

UnknownScript_0x7a572: ; 0x7a572
	playmusic $004e
	2jump UnknownScript_0x7a4f6
; 0x7a578

GearName: ; 0x7a578
	db $54, "GEAR@"
; 0x7a57e

UnknownScript_0x7a57e: ; 0x7a57e
	jumpstd $002f
	end
; 0x7a582

MomScript_0x7a582: ; 0x7a582
	faceplayer
	setbit1 $0001
	checktriggers
	iffalse UnknownScript_0x7a572
	loadfont
	checkbit1 $0076
	iftrue UnknownScript_0x7a5af
	checkbit1 $0040
	iftrue UnknownScript_0x7a5b8
	checkbit1 $001f
	iftrue UnknownScript_0x7a5b5
	checkbit1 $001a
	iftrue UnknownScript_0x7a5a9
	2writetext UnknownText_0x7a8b5
	closetext
	loadmovesprites
	end
; 0x7a5a9

UnknownScript_0x7a5a9: ; 0x7a5a9
	2writetext UnknownText_0x7a8e5
	closetext
	loadmovesprites
	end
; 0x7a5af

UnknownScript_0x7a5af: ; 0x7a5af
	2writetext UnknownText_0x7a957
	closetext
	loadmovesprites
	end
; 0x7a5b5

UnknownScript_0x7a5b5: ; 0x7a5b5
	setbit1 $0076
UnknownScript_0x7a5b8: ; 0x7a5b8
	setbit1 $0040
	special $0022
	closetext
	loadmovesprites
	end
; 0x7a5c1

PokefanFScript_0x7a5c1: ; 0x7a5c1
	faceplayer
	loadfont
	checktime $1
	iftrue UnknownScript_0x7a5d2
	checktime $2
	iftrue UnknownScript_0x7a5d9
	checktime $4
	iftrue UnknownScript_0x7a5e0
UnknownScript_0x7a5d2: ; 0x7a5d2
	2writetext UnknownText_0x7a97d
	keeptextopen
	2jump UnknownScript_0x7a5e7
; 0x7a5d9

UnknownScript_0x7a5d9: ; 0x7a5d9
	2writetext UnknownText_0x7a99c
	keeptextopen
	2jump UnknownScript_0x7a5e7
; 0x7a5e0

UnknownScript_0x7a5e0: ; 0x7a5e0
	2writetext UnknownText_0x7a9b4
	keeptextopen
	2jump UnknownScript_0x7a5e7
; 0x7a5e7

UnknownScript_0x7a5e7: ; 0x7a5e7
	2writetext UnknownText_0x7a9d3
	closetext
	loadmovesprites
	spriteface $6, $3
	end
; 0x7a5f0

MapKrissHouse1FSignpost3Script: ; 0x7a5f0
	jumptext UnknownText_0x7aad0
; 0x7a5f3

MapKrissHouse1FSignpost0Script: ; 0x7a5f3
	jumptext UnknownText_0x7aa3a
; 0x7a5f6

MapKrissHouse1FSignpost1Script: ; 0x7a5f6
	jumptext UnknownText_0x7aa64
; 0x7a5f9

MapKrissHouse1FSignpost2Script: ; 0x7a5f9
	jumptext UnknownText_0x7aa91
; 0x7a5fc

MovementData_0x7a5fc: ; 0x7a5fc
	turn_head_right
	step_end
; 0x7a5fe

MovementData_0x7a5fe: ; 0x7a5fe
	slow_step_right
	step_end
; 0x7a600

MovementData_0x7a600: ; 0x7a600
	turn_head_left
	step_end
; 0x7a602

MovementData_0x7a602: ; 0x7a602
	slow_step_left
	step_end
; 0x7a604

UnknownText_0x7a604: ; 0x7a604
	db $0, "Oh, ", $52, "…! Our", $4f
	db "neighbor, PROF.", $51
	db "ELM, was looking", $4f
	db "for you.", $51
	db "He said he wanted", $4f
	db "you to do some-", $55
	db "thing for him.", $51
	db "Oh! I almost for-", $4f
	db "got! Your #MON", $51
	db "GEAR is back from", $4f
	db "the repair shop.", $51
	db "Here you go!", $57
; 0x7a6bd

UnknownText_0x7a6bd: ; 0x7a6bd
	db $0, "#MON GEAR, or", $4f
	db "just #GEAR.", $51
	db "It's essential if", $4f
	db "you want to be a", $55
	db "good trainer.", $51
	db "Oh, the day of the", $4f
	db "week isn't set.", $51
	db "You mustn't forget", $4f
	db "that!", $57
; 0x7a742

UnknownText_0x7a742: ; 0x7a742
	db $0, "Is it Daylight", $4f
	db "Saving Time now?", $57
; 0x7a763

UnknownText_0x7a763: ; 0x7a763
	db $0, "Come home to", $4f
	db "adjust your clock", $51
	db "for Daylight", $4f
	db "Saving Time.", $51
	db "By the way, do you", $4f
	db "know how to use", $55
	db "the PHONE?", $57
; 0x7a7cb

UnknownText_0x7a7cb: ; 0x7a7cb
	db $0, "Don't you just", $4f
	db "turn the #GEAR", $51
	db "on and select the", $4f
	db "PHONE icon?", $57
; 0x7a807

UnknownText_0x7a807: ; 0x7a807
	db $0, "I'll read the", $4f
	db "instructions.", $51
	db "Turn the #GEAR", $4f
	db "on and select the", $55
	db "PHONE icon.", $57
; 0x7a850

UnknownText_0x7a850: ; 0x7a850
	db $0, "Phone numbers are", $4f
	db "stored in memory.", $51
	db "Just choose a name", $4f
	db "you want to call.", $51
	db "Gee, isn't that", $4f
	db "convenient?", $57
; 0x7a8b5

UnknownText_0x7a8b5: ; 0x7a8b5
	db $0, "PROF.ELM is wait-", $4f
	db "ing for you.", $51
	db "Hurry up, baby!", $57
; 0x7a8e5

UnknownText_0x7a8e5: ; 0x7a8e5
	db $0, "So, what was PROF.", $4f
	db "ELM's errand?", $51
	db "…", $51
	db "That does sound", $4f
	db "challenging.", $51
	db "But, you should be", $4f
	db "proud that people", $55
	db "rely on you.", $57
; 0x7a957

UnknownText_0x7a957: ; 0x7a957
	db $0, $52, ", do it!", $51
	db "I'm behind you all", $4f
	db "the way!", $57
; 0x7a97d

UnknownText_0x7a97d: ; 0x7a97d
	db $0, "Good morning,", $4f
	db $14, "!", $51
	db "I'm visiting!", $57
; 0x7a99c

UnknownText_0x7a99c: ; 0x7a99c
	db $0, "Hello, ", $14, "!", $4f
	db "I'm visiting!", $57
; 0x7a9b4

UnknownText_0x7a9b4: ; 0x7a9b4
	db $0, "Good evening,", $4f
	db $14, "!", $51
	db "I'm visiting!", $57
; 0x7a9d3

UnknownText_0x7a9d3: ; 0x7a9d3
	db $0, $14, ", have you", $4f
	db "heard?", $51
	db "My daughter is", $4f
	db "adamant about", $51
	db "becoming PROF.", $4f
	db "ELM's assistant.", $51
	db "She really loves", $4f
	db "#MON!", $57
; 0x7aa3a

UnknownText_0x7aa3a: ; 0x7aa3a
	db $0, "Mom's specialty!", $51
	db "CINNABAR VOLCANO", $4f
	db "BURGER!", $57
; 0x7aa64

UnknownText_0x7aa64: ; 0x7aa64
	db $0, "The sink is spot-", $4f
	db "less. Mom likes it", $55
	db "clean.", $57
; 0x7aa91

UnknownText_0x7aa91: ; 0x7aa91
	db $0, "Let's see what's", $4f
	db "in the fridge…", $51
	db "FRESH WATER and", $4f
	db "tasty LEMONADE!", $57
; 0x7aad0

UnknownText_0x7aad0: ; 0x7aad0
	db $0, "There's a movie on", $4f
	db "TV: Stars dot the", $51
	db "sky as two boys", $4f
	db "ride on a train…", $51
	db "I'd better get", $4f
	db "rolling too!", $57
; 0x7ab31

KrissHouse1F_MapEventHeader: ; 0x7ab31
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $6, 2, GROUP_NEW_BARK_TOWN, MAP_NEW_BARK_TOWN
	warp_def $7, $7, 2, GROUP_NEW_BARK_TOWN, MAP_NEW_BARK_TOWN
	warp_def $0, $9, 1, GROUP_KRISS_HOUSE_2F, MAP_KRISS_HOUSE_2F

	; xy triggers
	db 2
	xy_trigger 0, $4, $8, $0, UnknownScript_0x7a4d8, $0, $0
	xy_trigger 0, $4, $9, $0, UnknownScript_0x7a4db, $0, $0

	; signposts
	db 4
	signpost 1, 0, $0, MapKrissHouse1FSignpost0Script
	signpost 1, 1, $0, MapKrissHouse1FSignpost1Script
	signpost 1, 2, $0, MapKrissHouse1FSignpost2Script
	signpost 1, 4, $0, MapKrissHouse1FSignpost3Script

	; people-events
	db 5
	person_event SPRITE_MOM, 8, 11, $8, $0, 255, 255, $0, 0, MomScript_0x7a582, $06c7
	person_event SPRITE_MOM, 6, 6, $7, $0, 255, 1, $0, 0, MomScript_0x7a582, $06c8
	person_event SPRITE_MOM, 8, 11, $8, $0, 255, 2, $0, 0, MomScript_0x7a582, $06c8
	person_event SPRITE_MOM, 6, 4, $7, $0, 255, 4, $0, 0, MomScript_0x7a582, $06c8
	person_event SPRITE_POKEFAN_F, 8, 8, $9, $0, 255, 255, $80, 0, PokefanFScript_0x7a5c1, $0792
; 0x7abab

