const_value set 2
	const ROUTE42_FISHER
	const ROUTE42_POKEFAN_M
	const ROUTE42_SUPER_NERD
	const ROUTE42_FRUIT_TREE1
	const ROUTE42_FRUIT_TREE2
	const ROUTE42_FRUIT_TREE3
	const ROUTE42_POKE_BALL1
	const ROUTE42_POKE_BALL2
	const ROUTE42_SUICUNE

Route42_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x1a9216, 0
	dw UnknownScript_0x1a9217, 0

.MapCallbacks:
	db 0

UnknownScript_0x1a9216:
	end

UnknownScript_0x1a9217:
	end

Route42SuicuneScript:
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	playsound SFX_WARP_FROM
	applymovement ROUTE42_SUICUNE, MovementData_0x1a9356
	disappear ROUTE42_SUICUNE
	pause 10
	dotrigger $0
	clearevent EVENT_SAW_SUICUNE_ON_ROUTE_36
	domaptrigger ROUTE_36, $1
	end

TrainerFisherTully1:
	trainer EVENT_BEAT_FISHER_TULLY, FISHER, TULLY1, FisherTully1SeenText, FisherTully1BeatenText, 0, FisherTully1Script

FisherTully1Script:
	writecode VAR_CALLERID, PHONE_FISHER_TULLY
	end_if_just_battled
	opentext
	checkflag ENGINE_TULLY
	iftrue UnknownScript_0x1a927f
	checkflag ENGINE_TULLY_HAS_WATER_STONE
	iftrue UnknownScript_0x1a92dc
	checkcellnum PHONE_FISHER_TULLY
	iftrue UnknownScript_0x1a92fd
	checkevent EVENT_TULLY_ASKED_FOR_PHONE_NUMBER
	iftrue UnknownScript_0x1a9268
	writetext UnknownText_0x1a93ab
	buttonsound
	setevent EVENT_TULLY_ASKED_FOR_PHONE_NUMBER
	scall UnknownScript_0x1a92f1
	jump UnknownScript_0x1a926b

UnknownScript_0x1a9268:
	scall UnknownScript_0x1a92f5
UnknownScript_0x1a926b:
	askforphonenumber PHONE_FISHER_TULLY
	if_equal $1, UnknownScript_0x1a9305
	if_equal $2, UnknownScript_0x1a9301
	trainertotext FISHER, TULLY1, $0
	scall UnknownScript_0x1a92f9
	jump UnknownScript_0x1a92fd

UnknownScript_0x1a927f:
	scall UnknownScript_0x1a9309
	winlosstext FisherTully1BeatenText, 0
	copybytetovar wTullyFightCount
	if_equal 3, .Fight3
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight3:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer FISHER, TULLY1
	startbattle
	reloadmapafterbattle
	loadvar wTullyFightCount, 1
	clearflag ENGINE_TULLY
	end

.LoadFight1:
	loadtrainer FISHER, TULLY2
	startbattle
	reloadmapafterbattle
	loadvar wTullyFightCount, 2
	clearflag ENGINE_TULLY
	end

.LoadFight2:
	loadtrainer FISHER, TULLY3
	startbattle
	reloadmapafterbattle
	loadvar wTullyFightCount, 3
	clearflag ENGINE_TULLY
	end

.LoadFight3:
	loadtrainer FISHER, TULLY4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TULLY
	end

UnknownScript_0x1a92dc:
	scall UnknownScript_0x1a930d
	verbosegiveitem WATER_STONE
	iffalse UnknownScript_0x1a92ee
	clearflag ENGINE_TULLY_HAS_WATER_STONE
	setevent EVENT_TULLY_GAVE_WATER_STONE
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
	trainer EVENT_BEAT_POKEMANIAC_SHANE, POKEMANIAC, SHANE, PokemaniacShaneSeenText, PokemaniacShaneBeatenText, 0, PokemaniacShaneScript

PokemaniacShaneScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a94d6
	waitbutton
	closetext
	end

TrainerHikerBenjamin:
	trainer EVENT_BEAT_HIKER_BENJAMIN, HIKER, BENJAMIN, HikerBenjaminSeenText, HikerBenjaminBeatenText, 0, HikerBenjaminScript

HikerBenjaminScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a943f
	waitbutton
	closetext
	end

Route42Sign1:
	jumptext Route42Sign1Text

MtMortarSign1:
	jumptext MtMortarSign1Text

MtMortarSign2:
	jumptext MtMortarSign2Text

Route42Sign2:
	jumptext Route42Sign2Text

Route42UltraBall:
	itemball ULTRA_BALL

Route42SuperPotion:
	itemball SUPER_POTION

FruitTreeScript_0x1a934d:
	fruittree FRUITTREE_ROUTE_42_1

FruitTreeScript_0x1a934f:
	fruittree FRUITTREE_ROUTE_42_2

FruitTreeScript_0x1a9351:
	fruittree FRUITTREE_ROUTE_42_3

Route42HiddenMaxPotion:
	dwb EVENT_ROUTE_42_HIDDEN_MAX_POTION, MAX_POTION


MovementData_0x1a9356:
	db $39 ; movement
	fast_jump_step UP
	fast_jump_step UP
	fast_jump_step UP
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	fast_jump_step RIGHT
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

Route42Sign1Text:
	text "ROUTE 42"

	para "ECRUTEAK CITY -"
	line "MAHOGANY TOWN"
	done

MtMortarSign1Text:
	text "MT.MORTAR"

	para "WATERFALL CAVE"
	line "INSIDE"
	done

MtMortarSign2Text:
	text "MT.MORTAR"

	para "WATERFALL CAVE"
	line "INSIDE"
	done

Route42Sign2Text:
	text "ROUTE 42"

	para "ECRUTEAK CITY -"
	line "MAHOGANY TOWN"
	done

Route42_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def $8, $0, 3, ROUTE_42_ECRUTEAK_GATE
	warp_def $9, $0, 4, ROUTE_42_ECRUTEAK_GATE
	warp_def $5, $a, 1, MOUNT_MORTAR_1F_OUTSIDE
	warp_def $9, $1c, 2, MOUNT_MORTAR_1F_OUTSIDE
	warp_def $7, $2e, 3, MOUNT_MORTAR_1F_OUTSIDE

.XYTriggers:
	db 1
	xy_trigger 1, $e, $18, $0, Route42SuicuneScript, $0, $0

.Signposts:
	db 5
	signpost 10, 4, SIGNPOST_READ, Route42Sign1
	signpost 5, 7, SIGNPOST_READ, MtMortarSign1
	signpost 9, 45, SIGNPOST_READ, MtMortarSign2
	signpost 8, 54, SIGNPOST_READ, Route42Sign2
	signpost 11, 16, SIGNPOST_ITEM, Route42HiddenMaxPotion

.PersonEvents:
	db 9
	person_event SPRITE_FISHER, 10, 40, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 1, TrainerFisherTully1, -1
	person_event SPRITE_POKEFAN_M, 9, 51, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 3, TrainerHikerBenjamin, -1
	person_event SPRITE_SUPER_NERD, 8, 47, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerPokemaniacShane, -1
	person_event SPRITE_FRUIT_TREE, 16, 27, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FruitTreeScript_0x1a934d, -1
	person_event SPRITE_FRUIT_TREE, 16, 28, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FruitTreeScript_0x1a934f, -1
	person_event SPRITE_FRUIT_TREE, 16, 29, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FruitTreeScript_0x1a9351, -1
	person_event SPRITE_POKE_BALL, 4, 6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route42UltraBall, EVENT_ROUTE_42_ULTRA_BALL
	person_event SPRITE_POKE_BALL, 8, 33, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route42SuperPotion, EVENT_ROUTE_42_SUPER_POTION
	person_event SPRITE_SUICUNE, 16, 26, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_SAW_SUICUNE_ON_ROUTE_42
