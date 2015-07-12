Route42_MapScriptHeader:
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x1a9216, $0000
	dw UnknownScript_0x1a9217, $0000

	; callback count
	db 0

UnknownScript_0x1a9216:
	end

UnknownScript_0x1a9217:
	end

UnknownScript_0x1a9218:
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

TrainerFisherTully1:
	; bit/flag number
	dw EVENT_BEAT_FISHER_TULLY

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

FisherTully1Script:
	writecode VAR_CALLERID, $1d
	talkaftercancel
	loadfont
	checkflag ENGINE_TULLY
	iftrue UnknownScript_0x1a927f
	checkflag ENGINE_TULLY_HAS_WATER_STONE
	iftrue UnknownScript_0x1a92dc
	checkcellnum $1d
	iftrue UnknownScript_0x1a92fd
	checkevent EVENT_TULLY_ASKED_FOR_PHONE_NUMBER
	iftrue UnknownScript_0x1a9268
	writetext UnknownText_0x1a93ab
	keeptextopen
	setevent EVENT_TULLY_ASKED_FOR_PHONE_NUMBER
	scall UnknownScript_0x1a92f1
	jump UnknownScript_0x1a926b

UnknownScript_0x1a9268:
	scall UnknownScript_0x1a92f5
UnknownScript_0x1a926b:
	askforphonenumber $1d
	if_equal $1, UnknownScript_0x1a9305
	if_equal $2, UnknownScript_0x1a9301
	trainertotext FISHER, TULLY1, $0
	scall UnknownScript_0x1a92f9
	jump UnknownScript_0x1a92fd

UnknownScript_0x1a927f:
	scall UnknownScript_0x1a9309
	winlosstext FisherTully1BeatenText, $0000
	copybytetovar wTullyFightCount
	if_equal 3, .Fight3
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight3
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight3
.Fight2
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
.Fight1
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .LoadFight1
.LoadFight0
	loadtrainer FISHER, TULLY1
	startbattle
	returnafterbattle
	loadvar wTullyFightCount, 1
	clearflag ENGINE_TULLY
	end

.LoadFight1
	loadtrainer FISHER, TULLY2
	startbattle
	returnafterbattle
	loadvar wTullyFightCount, 2
	clearflag ENGINE_TULLY
	end

.LoadFight2
	loadtrainer FISHER, TULLY3
	startbattle
	returnafterbattle
	loadvar wTullyFightCount, 3
	clearflag ENGINE_TULLY
	end

.LoadFight3
	loadtrainer FISHER, TULLY4
	startbattle
	returnafterbattle
	clearflag ENGINE_TULLY
	end

UnknownScript_0x1a92dc:
	scall UnknownScript_0x1a930d
	verbosegiveitem WATER_STONE, 1
	iffalse UnknownScript_0x1a92ee
	clearflag ENGINE_TULLY_HAS_WATER_STONE
	setevent EVENT_103
	jump UnknownScript_0x1a92fd

UnknownScript_0x1a92ee:
	jump UnknownScript_0x1a9311

UnknownScript_0x1a92f1:
	jumpstd asknumber1m
	end

UnknownScript_0x1a92f5:
	jumpstd asknumber2m
	end

UnknownScript_0x1a92f9:
	jumpstd registerednumberm
	end

UnknownScript_0x1a92fd:
	jumpstd numberacceptedm
	end

UnknownScript_0x1a9301:
	jumpstd numberdeclinedm
	end

UnknownScript_0x1a9305:
	jumpstd phonefullm
	end

UnknownScript_0x1a9309:
	jumpstd rematchm
	end

UnknownScript_0x1a930d:
	jumpstd giftm
	end

UnknownScript_0x1a9311:
	jumpstd packfullm
	end

TrainerPokemaniacShane:
	; bit/flag number
	dw EVENT_BEAT_POKEMANIAC_SHANE

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

PokemaniacShaneScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a94d6
	closetext
	loadmovesprites
	end

TrainerHikerBenjamin:
	; bit/flag number
	dw EVENT_BEAT_HIKER_BENJAMIN

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

HikerBenjaminScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a943f
	closetext
	loadmovesprites
	end

MapRoute42Signpost0Script:
	jumptext UnknownText_0x1a9537

MapRoute42Signpost1Script:
	jumptext UnknownText_0x1a955f

MapRoute42Signpost2Script:
	jumptext UnknownText_0x1a9580

MapRoute42Signpost3Script:
	jumptext UnknownText_0x1a95a1

ItemFragment_0x1a9349:
	db ULTRA_BALL, 1

ItemFragment_0x1a934b:
	db SUPER_POTION, 1

FruitTreeScript_0x1a934d:
	fruittree $15

FruitTreeScript_0x1a934f:
	fruittree $16

FruitTreeScript_0x1a9351:
	fruittree $17

MapRoute42SignpostItem4:
	dw $00ad
	db MAX_POTION
	

MovementData_0x1a9356:
	db $39 ; movement
	fast_jump_step_up
	fast_jump_step_up
	fast_jump_step_up
	fast_jump_step_right
	fast_jump_step_right
	fast_jump_step_right
	db $38 ; movement
	step_end

FisherTully1SeenText:
	text "Let me demonstrate"
	line "the power of the"
	cont "#MON I caught!"
	done

FisherTully1BeatenText:
	text "What? That's not"
	line "right."
	done

UnknownText_0x1a93ab:
	text "I want to become"
	line "the trainer CHAMP"

	para "using the #MON"
	line "I caught."

	para "That's the best"
	line "part of fishing!"
	done

HikerBenjaminSeenText:
	text "Ah, it's good to"
	line "be outside!"
	cont "I feel so free!"
	done

HikerBenjaminBeatenText:
	text "Gahahah!"
	done

UnknownText_0x1a943f:
	text "Losing feels in-"
	line "significant if you"

	para "look up at the big"
	line "sky!"
	done

PokemaniacShaneSeenText:
	text "HEY!"

	para "This is my secret"
	line "place! Get lost,"
	cont "you outsider!"
	done

PokemaniacShaneBeatenText:
	text "I should have used"
	line "my MOON STONE…"
	done

UnknownText_0x1a94d6:
	text "You're working on"
	line "a #DEX?"

	para "Wow, you must know"
	line "some pretty rare"
	cont "#MON!"

	para "May I please see"
	line "it. Please?"
	done

UnknownText_0x1a9537:
	text "ROUTE 42"

	para "ECRUTEAK CITY -"
	line "MAHOGANY TOWN"
	done

UnknownText_0x1a955f:
	text "MT.MORTAR"

	para "WATERFALL CAVE"
	line "INSIDE"
	done

UnknownText_0x1a9580:
	text "MT.MORTAR"

	para "WATERFALL CAVE"
	line "INSIDE"
	done

UnknownText_0x1a95a1:
	text "ROUTE 42"

	para "ECRUTEAK CITY -"
	line "MAHOGANY TOWN"
	done

Route42_MapEventHeader:
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
	person_event SPRITE_FISHER, 14, 44, $8, $0, 255, 255, $a2, 1, TrainerFisherTully1, EVENT_ALWAYS_THERE
	person_event SPRITE_POKEFAN_M, 13, 55, $a, $0, 255, 255, $b2, 3, TrainerHikerBenjamin, EVENT_ALWAYS_THERE
	person_event SPRITE_SUPER_NERD, 12, 51, $6, $0, 255, 255, $92, 3, TrainerPokemaniacShane, EVENT_ALWAYS_THERE
	person_event SPRITE_FRUIT_TREE, 20, 31, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x1a934d, EVENT_ALWAYS_THERE
	person_event SPRITE_FRUIT_TREE, 20, 32, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x1a934f, EVENT_ALWAYS_THERE
	person_event SPRITE_FRUIT_TREE, 20, 33, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x1a9351, EVENT_ALWAYS_THERE
	person_event SPRITE_POKE_BALL, 8, 10, $1, $0, 255, 255, $1, 0, ItemFragment_0x1a9349, EVENT_6B3
	person_event SPRITE_POKE_BALL, 12, 37, $1, $0, 255, 255, $1, 0, ItemFragment_0x1a934b, EVENT_6B4
	person_event SPRITE_SUICUNE, 20, 30, $1, $0, 255, 255, $90, 0, ObjectEvent, EVENT_SAW_SUICUNE_ON_ROUTE_42
