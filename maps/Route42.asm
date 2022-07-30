	object_const_def
	const ROUTE42_FISHER
	const ROUTE42_POKEFAN_M
	const ROUTE42_SUPER_NERD
	const ROUTE42_FRUIT_TREE1
	const ROUTE42_FRUIT_TREE2
	const ROUTE42_FRUIT_TREE3
	const ROUTE42_POKE_BALL1
	const ROUTE42_POKE_BALL2
	const ROUTE42_SUICUNE

Route42_MapScripts:
	def_scene_scripts
	scene_script Route42Noop1Scene, SCENE_ROUTE42_NOOP
	scene_script Route42Noop2Scene, SCENE_ROUTE42_SUICUNE

	def_callbacks

Route42Noop1Scene:
	end

Route42Noop2Scene:
	end

Route42SuicuneScript:
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	playsound SFX_WARP_FROM
	applymovement ROUTE42_SUICUNE, Route42SuicuneMovement
	disappear ROUTE42_SUICUNE
	pause 10
	setscene SCENE_ROUTE42_NOOP
	clearevent EVENT_SAW_SUICUNE_ON_ROUTE_36
	setmapscene ROUTE_36, SCENE_ROUTE36_SUICUNE
	end

TrainerFisherTully:
	trainer FISHER, TULLY1, EVENT_BEAT_FISHER_TULLY, FisherTullySeenText, FisherTullyBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_FISHER_TULLY
	endifjustbattled
	opentext
	checkflag ENGINE_TULLY_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkflag ENGINE_TULLY_HAS_WATER_STONE
	iftrue .HasWaterStone
	checkcellnum PHONE_FISHER_TULLY
	iftrue .NumberAccepted
	checkevent EVENT_TULLY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext FisherTullyAfterBattleText
	promptbutton
	setevent EVENT_TULLY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_FISHER_TULLY
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, FISHER, TULLY1
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext FisherTullyBeatenText, 0
	readmem wTullyFightCount
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
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
	loadmem wTullyFightCount, 1
	clearflag ENGINE_TULLY_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer FISHER, TULLY2
	startbattle
	reloadmapafterbattle
	loadmem wTullyFightCount, 2
	clearflag ENGINE_TULLY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer FISHER, TULLY3
	startbattle
	reloadmapafterbattle
	loadmem wTullyFightCount, 3
	clearflag ENGINE_TULLY_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer FISHER, TULLY4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TULLY_READY_FOR_REMATCH
	end

.HasWaterStone:
	scall .Gift
	verbosegiveitem WATER_STONE
	iffalse .NoRoom
	clearflag ENGINE_TULLY_HAS_WATER_STONE
	setevent EVENT_TULLY_GAVE_WATER_STONE
	sjump .NumberAccepted

.NoRoom:
	sjump .PackFull

.AskNumber1:
	jumpstd AskNumber1MScript
	end

.AskNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedMScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.Rematch:
	jumpstd RematchMScript
	end

.Gift:
	jumpstd GiftMScript
	end

.PackFull:
	jumpstd PackFullMScript
	end

TrainerPokemaniacShane:
	trainer POKEMANIAC, SHANE, EVENT_BEAT_POKEMANIAC_SHANE, PokemaniacShaneSeenText, PokemaniacShaneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacShaneAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerBenjamin:
	trainer HIKER, BENJAMIN, EVENT_BEAT_HIKER_BENJAMIN, HikerBenjaminSeenText, HikerBenjaminBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerBenjaminAfterBattleText
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

Route42FruitTree1:
	fruittree FRUITTREE_ROUTE_42_1

Route42FruitTree2:
	fruittree FRUITTREE_ROUTE_42_2

Route42FruitTree3:
	fruittree FRUITTREE_ROUTE_42_3

Route42HiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_ROUTE_42_HIDDEN_MAX_POTION

Route42SuicuneMovement:
	set_sliding
	fast_jump_step UP
	fast_jump_step UP
	fast_jump_step UP
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	remove_sliding
	step_end

FisherTullySeenText:
	text "Let me demonstrate"
	line "the power of the"
	cont "#MON I caught!"
	done

FisherTullyBeatenText:
	text "What? That's not"
	line "right."
	done

FisherTullyAfterBattleText:
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

HikerBenjaminAfterBattleText:
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

PokemaniacShaneAfterBattleText:
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

Route42_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  8, ROUTE_42_ECRUTEAK_GATE, 3
	warp_event  0,  9, ROUTE_42_ECRUTEAK_GATE, 4
	warp_event 10,  5, MOUNT_MORTAR_1F_OUTSIDE, 1
	warp_event 28,  9, MOUNT_MORTAR_1F_OUTSIDE, 2
	warp_event 46,  7, MOUNT_MORTAR_1F_OUTSIDE, 3

	def_coord_events
	coord_event 24, 14, SCENE_ROUTE42_SUICUNE, Route42SuicuneScript

	def_bg_events
	bg_event  4, 10, BGEVENT_READ, Route42Sign1
	bg_event  7,  5, BGEVENT_READ, MtMortarSign1
	bg_event 45,  9, BGEVENT_READ, MtMortarSign2
	bg_event 54,  8, BGEVENT_READ, Route42Sign2
	bg_event 16, 11, BGEVENT_ITEM, Route42HiddenMaxPotion

	def_object_events
	object_event 40, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherTully, -1
	object_event 51,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerBenjamin, -1
	object_event 47,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacShane, -1
	object_event 27, 16, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route42FruitTree1, -1
	object_event 28, 16, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route42FruitTree2, -1
	object_event 29, 16, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route42FruitTree3, -1
	object_event  6,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route42UltraBall, EVENT_ROUTE_42_ULTRA_BALL
	object_event 33,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route42SuperPotion, EVENT_ROUTE_42_SUPER_POTION
	object_event 26, 16, SPRITE_SUICUNE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SAW_SUICUNE_ON_ROUTE_42
