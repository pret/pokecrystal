Route33_MapScriptHeader: ; 0x1ac000
	; trigger count
	db 0

	; callback count
	db 0
; 0x1ac002

LassScript_0x1ac002: ; 0x1ac002
	jumptextfaceplayer UnknownText_0x1ac1e7
; 0x1ac005

TrainerHikerAnthony2: ; 0x1ac005
	; bit/flag number
	dw $528

	; trainer group && trainer id
	db HIKER, ANTHONY2

	; text when seen
	dw HikerAnthony2SeenText

	; text when trainer beaten
	dw HikerAnthony2BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw HikerAnthony2Script
; 0x1ac011

HikerAnthony2Script: ; 0x1ac011
	writecode $17, $13
	talkaftercancel
	loadfont
	checkbit2 $006f
	iftrue UnknownScript_0x1ac051
	checkbit2 $00a0
	iftrue UnknownScript_0x1ac0c5
	checkcellnum $13
	iftrue UnknownScript_0x1ac0d7
	checkbit1 $027b
	iftrue UnknownScript_0x1ac03a
	2writetext UnknownText_0x1ac153
	keeptextopen
	setbit1 $027b
	2call UnknownScript_0x1ac0cb
	2jump UnknownScript_0x1ac03d
; 0x1ac03a

UnknownScript_0x1ac03a: ; 0x1ac03a
	2call UnknownScript_0x1ac0cf
UnknownScript_0x1ac03d: ; 0x1ac03d
	askforphonenumber $13
	if_equal $1, UnknownScript_0x1ac0df
	if_equal $2, UnknownScript_0x1ac0db
	trainertotext HIKER, ANTHONY2, $0
	2call UnknownScript_0x1ac0d3
	2jump UnknownScript_0x1ac0d7
; 0x1ac051

UnknownScript_0x1ac051: ; 0x1ac051
	2call UnknownScript_0x1ac0e3
	winlosstext HikerAnthony2BeatenText, $0000
	copybytetovar $d9fd
	if_equal $4, UnknownScript_0x1ac070
	if_equal $3, UnknownScript_0x1ac076
	if_equal $2, UnknownScript_0x1ac07c
	if_equal $1, UnknownScript_0x1ac082
	if_equal $0, UnknownScript_0x1ac088
UnknownScript_0x1ac070: ; 0x1ac070
	checkbit1 $00cd
	iftrue UnknownScript_0x1ac0bc
UnknownScript_0x1ac076: ; 0x1ac076
	checkbit1 $0044
	iftrue UnknownScript_0x1ac0af
UnknownScript_0x1ac07c: ; 0x1ac07c
	checkbit1 $0021
	iftrue UnknownScript_0x1ac0a2
UnknownScript_0x1ac082: ; 0x1ac082
	checkbit2 $0047
	iftrue UnknownScript_0x1ac095
UnknownScript_0x1ac088: ; 0x1ac088
	loadtrainer HIKER, ANTHONY2
	startbattle
	returnafterbattle
	loadvar $d9fd, $1
	clearbit2 $006f
	end
; 0x1ac095

UnknownScript_0x1ac095: ; 0x1ac095
	loadtrainer HIKER, ANTHONY1
	startbattle
	returnafterbattle
	loadvar $d9fd, $2
	clearbit2 $006f
	end
; 0x1ac0a2

UnknownScript_0x1ac0a2: ; 0x1ac0a2
	loadtrainer HIKER, ANTHONY3
	startbattle
	returnafterbattle
	loadvar $d9fd, $3
	clearbit2 $006f
	end
; 0x1ac0af

UnknownScript_0x1ac0af: ; 0x1ac0af
	loadtrainer HIKER, ANTHONY4
	startbattle
	returnafterbattle
	loadvar $d9fd, $4
	clearbit2 $006f
	end
; 0x1ac0bc

UnknownScript_0x1ac0bc: ; 0x1ac0bc
	loadtrainer HIKER, ANTHONY5
	startbattle
	returnafterbattle
	clearbit2 $006f
	end
; 0x1ac0c5

UnknownScript_0x1ac0c5: ; 0x1ac0c5
	2writetext UnknownText_0x1ac180
	closetext
	loadmovesprites
	end
; 0x1ac0cb

UnknownScript_0x1ac0cb: ; 0x1ac0cb
	jumpstd $0019
	end
; 0x1ac0cf

UnknownScript_0x1ac0cf: ; 0x1ac0cf
	jumpstd $001a
	end
; 0x1ac0d3

UnknownScript_0x1ac0d3: ; 0x1ac0d3
	jumpstd $001b
	end
; 0x1ac0d7

UnknownScript_0x1ac0d7: ; 0x1ac0d7
	jumpstd $001c
	end
; 0x1ac0db

UnknownScript_0x1ac0db: ; 0x1ac0db
	jumpstd $001d
	end
; 0x1ac0df

UnknownScript_0x1ac0df: ; 0x1ac0df
	jumpstd $001e
	end
; 0x1ac0e3

UnknownScript_0x1ac0e3: ; 0x1ac0e3
	jumpstd $001f
	end
; 0x1ac0e7

MapRoute33Signpost0Script: ; 0x1ac0e7
	jumptext UnknownText_0x1ac279
; 0x1ac0ea

FruitTreeScript_0x1ac0ea: ; 0x1ac0ea
	fruittree $6
; 0x1ac0ec

HikerAnthony2SeenText: ; 0x1ac0ec
	db $0, "I came through the", $4f
	db "tunnel, but I", $51
	db "still have plenty", $4f
	db "of energy left.", $57
; 0x1ac130

HikerAnthony2BeatenText: ; 0x1ac130
	db $0, "Whoa! You've got", $4f
	db "more zip than me!", $57
; 0x1ac153

UnknownText_0x1ac153: ; 0x1ac153
	db $0, "We HIKERS are at", $4f
	db "our best in the", $55
	db "mountains.", $57
; 0x1ac180

UnknownText_0x1ac180: ; 0x1ac180
	db $0, "Hey, did you get a", $4f
	db "DUNSPARCE?", $51
	db "I caught one too.", $51
	db "Take a look at it", $4f
	db "in the light. It's", $55
	db "got a funny face!", $57
; 0x1ac1e7

UnknownText_0x1ac1e7: ; 0x1ac1e7
	db $0, "Pant, pant…", $51
	db "I finally got", $4f
	db "through that cave.", $51
	db "It was much bigger", $4f
	db "than I'd expected.", $51
	db "I got too tired to", $4f
	db "explore the whole", $51
	db "thing, so I came", $4f
	db "outside.", $57
; 0x1ac279

UnknownText_0x1ac279: ; 0x1ac279
	db $0, "ROUTE 33", $57
; 0x1ac283

Route33_MapEventHeader: ; 0x1ac283
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $9, $b, 3, GROUP_UNION_CAVE_1F, MAP_UNION_CAVE_1F

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 11, 11, $0, MapRoute33Signpost0Script

	; people-events
	db 3
	person_event SPRITE_POKEFAN_M, 17, 10, $a, $0, 255, 255, $b2, 2, TrainerHikerAnthony2, $ffff
	person_event SPRITE_LASS, 20, 17, $2, $11, 255, 255, $90, 0, LassScript_0x1ac002, $ffff
	person_event SPRITE_FRUIT_TREE, 20, 18, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x1ac0ea, $ffff
; 0x1ac2ba

