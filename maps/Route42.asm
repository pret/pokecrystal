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
	playsound SFX_WARP_FROM
	applymovement $a, MovementData_0x1a9356
	disappear $a
	pause 10
	dotrigger $0
	clearevent EVENT_SAW_SUICUNE_ON_ROUTE_36
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
	checkflag $0076
	iftrue UnknownScript_0x1a927f
	checkflag $0084
	iftrue UnknownScript_0x1a92dc
	checkcellnum $1d
	iftrue UnknownScript_0x1a92fd
	checkevent $028f
	iftrue UnknownScript_0x1a9268
	writetext UnknownText_0x1a93ab
	keeptextopen
	setevent $028f
	scall UnknownScript_0x1a92f1
	jump UnknownScript_0x1a926b
; 0x1a9268

UnknownScript_0x1a9268: ; 0x1a9268
	scall UnknownScript_0x1a92f5
UnknownScript_0x1a926b: ; 0x1a926b
	askforphonenumber $1d
	if_equal $1, UnknownScript_0x1a9305
	if_equal $2, UnknownScript_0x1a9301
	trainertotext FISHER, TULLY1, $0
	scall UnknownScript_0x1a92f9
	jump UnknownScript_0x1a92fd
; 0x1a927f

UnknownScript_0x1a927f: ; 0x1a927f
	scall UnknownScript_0x1a9309
	winlosstext FisherTully1BeatenText, $0000
	copybytetovar wda06
	if_equal $3, UnknownScript_0x1a929a
	if_equal $2, UnknownScript_0x1a92a0
	if_equal $1, UnknownScript_0x1a92a6
	if_equal $0, UnknownScript_0x1a92ac
UnknownScript_0x1a929a: ; 0x1a929a
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue UnknownScript_0x1a92d3
UnknownScript_0x1a92a0: ; 0x1a92a0
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue UnknownScript_0x1a92c6
UnknownScript_0x1a92a6: ; 0x1a92a6
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0x1a92b9
UnknownScript_0x1a92ac: ; 0x1a92ac
	loadtrainer FISHER, TULLY1
	startbattle
	returnafterbattle
	loadvar wda06, $1
	clearflag $0076
	end
; 0x1a92b9

UnknownScript_0x1a92b9: ; 0x1a92b9
	loadtrainer FISHER, TULLY2
	startbattle
	returnafterbattle
	loadvar wda06, $2
	clearflag $0076
	end
; 0x1a92c6

UnknownScript_0x1a92c6: ; 0x1a92c6
	loadtrainer FISHER, TULLY3
	startbattle
	returnafterbattle
	loadvar wda06, $3
	clearflag $0076
	end
; 0x1a92d3

UnknownScript_0x1a92d3: ; 0x1a92d3
	loadtrainer FISHER, TULLY4
	startbattle
	returnafterbattle
	clearflag $0076
	end
; 0x1a92dc

UnknownScript_0x1a92dc: ; 0x1a92dc
	scall UnknownScript_0x1a930d
	verbosegiveitem WATER_STONE, 1
	iffalse UnknownScript_0x1a92ee
	clearflag $0084
	setevent $0103
	jump UnknownScript_0x1a92fd
; 0x1a92ee

UnknownScript_0x1a92ee: ; 0x1a92ee
	jump UnknownScript_0x1a9311
; 0x1a92f1

UnknownScript_0x1a92f1: ; 0x1a92f1
	jumpstd asknumber1m
	end
; 0x1a92f5

UnknownScript_0x1a92f5: ; 0x1a92f5
	jumpstd asknumber2m
	end
; 0x1a92f9

UnknownScript_0x1a92f9: ; 0x1a92f9
	jumpstd registerednumberm
	end
; 0x1a92fd

UnknownScript_0x1a92fd: ; 0x1a92fd
	jumpstd numberacceptedm
	end
; 0x1a9301

UnknownScript_0x1a9301: ; 0x1a9301
	jumpstd numberdeclinedm
	end
; 0x1a9305

UnknownScript_0x1a9305: ; 0x1a9305
	jumpstd phonefullm
	end
; 0x1a9309

UnknownScript_0x1a9309: ; 0x1a9309
	jumpstd rematchm
	end
; 0x1a930d

UnknownScript_0x1a930d: ; 0x1a930d
	jumpstd giftm
	end
; 0x1a9311

UnknownScript_0x1a9311: ; 0x1a9311
	jumpstd packfullm
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
	writetext UnknownText_0x1a94d6
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
	writetext UnknownText_0x1a943f
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
	text "Let me demonstrate"
	line "the power of the"
	cont "#MON I caught!"
	done
; 0x1a9393

FisherTully1BeatenText: ; 0x1a9393
	text "What? That's not"
	line "right."
	done
; 0x1a93ab

UnknownText_0x1a93ab: ; 0x1a93ab
	text "I want to become"
	line "the trainer CHAMP"

	para "using the #MON"
	line "I caught."

	para "That's the best"
	line "part of fishing!"
	done
; 0x1a9408

HikerBenjaminSeenText: ; 0x1a9408
	text "Ah, it's good to"
	line "be outside!"
	cont "I feel so free!"
	done
; 0x1a9435

HikerBenjaminBeatenText: ; 0x1a9435
	text "Gahahah!"
	done
; 0x1a943f

UnknownText_0x1a943f: ; 0x1a943f
	text "Losing feels in-"
	line "significant if you"

	para "look up at the big"
	line "sky!"
	done
; 0x1a947c

PokemaniacShaneSeenText: ; 0x1a947c
	text "HEY!"

	para "This is my secret"
	line "place! Get lost,"
	cont "you outsider!"
	done
; 0x1a94b3

PokemaniacShaneBeatenText: ; 0x1a94b3
	text "I should have used"
	line "my MOON STONE…"
	done
; 0x1a94d6

UnknownText_0x1a94d6: ; 0x1a94d6
	text "You're working on"
	line "a #DEX?"

	para "Wow, you must know"
	line "some pretty rare"
	cont "#MON!"

	para "May I please see"
	line "it. Please?"
	done
; 0x1a9537

UnknownText_0x1a9537: ; 0x1a9537
	text "ROUTE 42"

	para "ECRUTEAK CITY -"
	line "MAHOGANY TOWN"
	done
; 0x1a955f

UnknownText_0x1a955f: ; 0x1a955f
	text "MT.MORTAR"

	para "WATERFALL CAVE"
	line "INSIDE"
	done
; 0x1a9580

UnknownText_0x1a9580: ; 0x1a9580
	text "MT.MORTAR"

	para "WATERFALL CAVE"
	line "INSIDE"
	done
; 0x1a95a1

UnknownText_0x1a95a1: ; 0x1a95a1
	text "ROUTE 42"

	para "ECRUTEAK CITY -"
	line "MAHOGANY TOWN"
	done
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
