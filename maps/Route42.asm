Route42_MapScriptHeader: ; 0x1a920c
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x1a9216, $0000
	dw UnknownScript_0x1a9217, $0000

	; callback count
	db 0
; 0x1a9216

UnknownScript_0x1a9216: ; 0x1a9216
	end
; 0x1a9217

UnknownScript_0x1a9217: ; 0x1a9217
	end
; 0x1a9218

UnknownScript_0x1a9218: ; 0x1a9218
	showemote $0, $0, 15
	pause 15
	playsound $0014
	applymovement $a, MovementData_0x1a9356
	disappear $a
	pause 10
	dotrigger $0
	clearbit1 EVENT_SAW_SUICUNE_ON_ROUTE_36
	domaptrigger GROUP_ROUTE_36, MAP_ROUTE_36, $1
	end
; 0x1a9233

TrainerFisherTully1: ; 0x1a9233
	; bit/flag number
	dw $454

	; trainer group && trainer id
	db FISHER, TULLY1

	; text when seen
	dw FisherTully1SeenText

	; text when trainer beaten
	dw FisherTully1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw FisherTully1Script
; 0x1a923f

FisherTully1Script: ; 0x1a923f
	writecode $17, $1d
	talkaftercancel
	loadfont
	checkbit2 $0076
	iftrue UnknownScript_0x1a927f
	checkbit2 $0084
	iftrue UnknownScript_0x1a92dc
	checkcellnum $1d
	iftrue UnknownScript_0x1a92fd
	checkbit1 $028f
	iftrue UnknownScript_0x1a9268
	2writetext UnknownText_0x1a93ab
	keeptextopen
	setbit1 $028f
	2call UnknownScript_0x1a92f1
	2jump UnknownScript_0x1a926b
; 0x1a9268

UnknownScript_0x1a9268: ; 0x1a9268
	2call UnknownScript_0x1a92f5
UnknownScript_0x1a926b: ; 0x1a926b
	askforphonenumber $1d
	if_equal $1, UnknownScript_0x1a9305
	if_equal $2, UnknownScript_0x1a9301
	trainertotext FISHER, TULLY1, $0
	2call UnknownScript_0x1a92f9
	2jump UnknownScript_0x1a92fd
; 0x1a927f

UnknownScript_0x1a927f: ; 0x1a927f
	2call UnknownScript_0x1a9309
	winlosstext FisherTully1BeatenText, $0000
	copybytetovar $da06
	if_equal $3, UnknownScript_0x1a929a
	if_equal $2, UnknownScript_0x1a92a0
	if_equal $1, UnknownScript_0x1a92a6
	if_equal $0, UnknownScript_0x1a92ac
UnknownScript_0x1a929a: ; 0x1a929a
	checkbit1 EVENT_RESTORED_POWER_TO_KANTO
	iftrue UnknownScript_0x1a92d3
UnknownScript_0x1a92a0: ; 0x1a92a0
	checkbit1 $0044
	iftrue UnknownScript_0x1a92c6
UnknownScript_0x1a92a6: ; 0x1a92a6
	checkbit1 EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0x1a92b9
UnknownScript_0x1a92ac: ; 0x1a92ac
	loadtrainer FISHER, TULLY1
	startbattle
	returnafterbattle
	loadvar $da06, $1
	clearbit2 $0076
	end
; 0x1a92b9

UnknownScript_0x1a92b9: ; 0x1a92b9
	loadtrainer FISHER, TULLY2
	startbattle
	returnafterbattle
	loadvar $da06, $2
	clearbit2 $0076
	end
; 0x1a92c6

UnknownScript_0x1a92c6: ; 0x1a92c6
	loadtrainer FISHER, TULLY3
	startbattle
	returnafterbattle
	loadvar $da06, $3
	clearbit2 $0076
	end
; 0x1a92d3

UnknownScript_0x1a92d3: ; 0x1a92d3
	loadtrainer FISHER, TULLY4
	startbattle
	returnafterbattle
	clearbit2 $0076
	end
; 0x1a92dc

UnknownScript_0x1a92dc: ; 0x1a92dc
	2call UnknownScript_0x1a930d
	verbosegiveitem WATER_STONE, 1
	iffalse UnknownScript_0x1a92ee
	clearbit2 $0084
	setbit1 $0103
	2jump UnknownScript_0x1a92fd
; 0x1a92ee

UnknownScript_0x1a92ee: ; 0x1a92ee
	2jump UnknownScript_0x1a9311
; 0x1a92f1

UnknownScript_0x1a92f1: ; 0x1a92f1
	jumpstd $0019
	end
; 0x1a92f5

UnknownScript_0x1a92f5: ; 0x1a92f5
	jumpstd $001a
	end
; 0x1a92f9

UnknownScript_0x1a92f9: ; 0x1a92f9
	jumpstd $001b
	end
; 0x1a92fd

UnknownScript_0x1a92fd: ; 0x1a92fd
	jumpstd $001c
	end
; 0x1a9301

UnknownScript_0x1a9301: ; 0x1a9301
	jumpstd $001d
	end
; 0x1a9305

UnknownScript_0x1a9305: ; 0x1a9305
	jumpstd $001e
	end
; 0x1a9309

UnknownScript_0x1a9309: ; 0x1a9309
	jumpstd $001f
	end
; 0x1a930d

UnknownScript_0x1a930d: ; 0x1a930d
	jumpstd $0020
	end
; 0x1a9311

UnknownScript_0x1a9311: ; 0x1a9311
	jumpstd $0021
	end
; 0x1a9315

TrainerPokemaniacShane: ; 0x1a9315
	; bit/flag number
	dw $4e7

	; trainer group && trainer id
	db POKEMANIAC, SHANE

	; text when seen
	dw PokemaniacShaneSeenText

	; text when trainer beaten
	dw PokemaniacShaneBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokemaniacShaneScript
; 0x1a9321

PokemaniacShaneScript: ; 0x1a9321
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1a94d6
	closetext
	loadmovesprites
	end
; 0x1a9329

TrainerHikerBenjamin: ; 0x1a9329
	; bit/flag number
	dw $529

	; trainer group && trainer id
	db HIKER, BENJAMIN

	; text when seen
	dw HikerBenjaminSeenText

	; text when trainer beaten
	dw HikerBenjaminBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw HikerBenjaminScript
; 0x1a9335

HikerBenjaminScript: ; 0x1a9335
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1a943f
	closetext
	loadmovesprites
	end
; 0x1a933d

MapRoute42Signpost0Script: ; 0x1a933d
	jumptext UnknownText_0x1a9537
; 0x1a9340

MapRoute42Signpost1Script: ; 0x1a9340
	jumptext UnknownText_0x1a955f
; 0x1a9343

MapRoute42Signpost2Script: ; 0x1a9343
	jumptext UnknownText_0x1a9580
; 0x1a9346

MapRoute42Signpost3Script: ; 0x1a9346
	jumptext UnknownText_0x1a95a1
; 0x1a9349

ItemFragment_0x1a9349: ; 0x1a9349
	db ULTRA_BALL, 1
; 0x1a934b

ItemFragment_0x1a934b: ; 0x1a934b
	db SUPER_POTION, 1
; 0x1a934d

FruitTreeScript_0x1a934d: ; 0x1a934d
	fruittree $15
; 0x1a934f

FruitTreeScript_0x1a934f: ; 0x1a934f
	fruittree $16
; 0x1a9351

FruitTreeScript_0x1a9351: ; 0x1a9351
	fruittree $17
; 0x1a9353

MapRoute42SignpostItem4: ; 0x1a9353
	dw $00ad
	db MAX_POTION
	
; 0x1a9356

MovementData_0x1a9356: ; 0x1a9356
	db $39 ; movement
	fast_jump_step_up
	fast_jump_step_up
	fast_jump_step_up
	fast_jump_step_right
	fast_jump_step_right
	fast_jump_step_right
	db $38 ; movement
	step_end
; 0x1a935f

FisherTully1SeenText: ; 0x1a935f
	db $0, "Let me demonstrate", $4f
	db "the power of the", $55
	db "#MON I caught!", $57
; 0x1a9393

FisherTully1BeatenText: ; 0x1a9393
	db $0, "What? That's not", $4f
	db "right.", $57
; 0x1a93ab

UnknownText_0x1a93ab: ; 0x1a93ab
	db $0, "I want to become", $4f
	db "the trainer CHAMP", $51
	db "using the #MON", $4f
	db "I caught.", $51
	db "That's the best", $4f
	db "part of fishing!", $57
; 0x1a9408

HikerBenjaminSeenText: ; 0x1a9408
	db $0, "Ah, it's good to", $4f
	db "be outside!", $55
	db "I feel so free!", $57
; 0x1a9435

HikerBenjaminBeatenText: ; 0x1a9435
	db $0, "Gahahah!", $57
; 0x1a943f

UnknownText_0x1a943f: ; 0x1a943f
	db $0, "Losing feels in-", $4f
	db "significant if you", $51
	db "look up at the big", $4f
	db "sky!", $57
; 0x1a947c

PokemaniacShaneSeenText: ; 0x1a947c
	db $0, "HEY!", $51
	db "This is my secret", $4f
	db "place! Get lost,", $55
	db "you outsider!", $57
; 0x1a94b3

PokemaniacShaneBeatenText: ; 0x1a94b3
	db $0, "I should have used", $4f
	db "my MOON STONE…", $57
; 0x1a94d6

UnknownText_0x1a94d6: ; 0x1a94d6
	db $0, "You're working on", $4f
	db "a #DEX?", $51
	db "Wow, you must know", $4f
	db "some pretty rare", $55
	db "#MON!", $51
	db "May I please see", $4f
	db "it. Please?", $57
; 0x1a9537

UnknownText_0x1a9537: ; 0x1a9537
	db $0, "ROUTE 42", $51
	db "ECRUTEAK CITY -", $4f
	db "MAHOGANY TOWN", $57
; 0x1a955f

UnknownText_0x1a955f: ; 0x1a955f
	db $0, "MT.MORTAR", $51
	db "WATERFALL CAVE", $4f
	db "INSIDE", $57
; 0x1a9580

UnknownText_0x1a9580: ; 0x1a9580
	db $0, "MT.MORTAR", $51
	db "WATERFALL CAVE", $4f
	db "INSIDE", $57
; 0x1a95a1

UnknownText_0x1a95a1: ; 0x1a95a1
	db $0, "ROUTE 42", $51
	db "ECRUTEAK CITY -", $4f
	db "MAHOGANY TOWN", $57
; 0x1a95c9

Route42_MapEventHeader: ; 0x1a95c9
	; filler
	db 0, 0

	; warps
	db 5
	warp_def $8, $0, 3, GROUP_ROUTE_42_ECRUTEAK_GATE, MAP_ROUTE_42_ECRUTEAK_GATE
	warp_def $9, $0, 4, GROUP_ROUTE_42_ECRUTEAK_GATE, MAP_ROUTE_42_ECRUTEAK_GATE
	warp_def $5, $a, 1, GROUP_MOUNT_MORTAR_1F_OUTSIDE, MAP_MOUNT_MORTAR_1F_OUTSIDE
	warp_def $9, $1c, 2, GROUP_MOUNT_MORTAR_1F_OUTSIDE, MAP_MOUNT_MORTAR_1F_OUTSIDE
	warp_def $7, $2e, 3, GROUP_MOUNT_MORTAR_1F_OUTSIDE, MAP_MOUNT_MORTAR_1F_OUTSIDE

	; xy triggers
	db 1
	xy_trigger 1, $e, $18, $0, UnknownScript_0x1a9218, $0, $0

	; signposts
	db 5
	signpost 10, 4, $0, MapRoute42Signpost0Script
	signpost 5, 7, $0, MapRoute42Signpost1Script
	signpost 9, 45, $0, MapRoute42Signpost2Script
	signpost 8, 54, $0, MapRoute42Signpost3Script
	signpost 11, 16, $7, MapRoute42SignpostItem4

	; people-events
	db 9
	person_event SPRITE_FISHER, 14, 44, $8, $0, 255, 255, $a2, 1, TrainerFisherTully1, $ffff
	person_event SPRITE_POKEFAN_M, 13, 55, $a, $0, 255, 255, $b2, 3, TrainerHikerBenjamin, $ffff
	person_event SPRITE_SUPER_NERD, 12, 51, $6, $0, 255, 255, $92, 3, TrainerPokemaniacShane, $ffff
	person_event SPRITE_FRUIT_TREE, 20, 31, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x1a934d, $ffff
	person_event SPRITE_FRUIT_TREE, 20, 32, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x1a934f, $ffff
	person_event SPRITE_FRUIT_TREE, 20, 33, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x1a9351, $ffff
	person_event SPRITE_POKE_BALL, 8, 10, $1, $0, 255, 255, $1, 0, ItemFragment_0x1a9349, $06b3
	person_event SPRITE_POKE_BALL, 12, 37, $1, $0, 255, 255, $1, 0, ItemFragment_0x1a934b, $06b4
	person_event SPRITE_SUICUNE, 20, 30, $1, $0, 255, 255, $90, 0, ObjectEvent, $07af
; 0x1a967e

