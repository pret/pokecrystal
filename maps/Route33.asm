const_value set 2
	const ROUTE33_POKEFAN_M
	const ROUTE33_LASS
	const ROUTE33_FRUIT_TREE

Route33_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

LassScript_0x1ac002:
	jumptextfaceplayer UnknownText_0x1ac1e7

TrainerHikerAnthony:
	trainer EVENT_BEAT_HIKER_ANTHONY, HIKER, ANTHONY2, HikerAnthony2SeenText, HikerAnthony2BeatenText, 0, HikerAnthony2Script

HikerAnthony2Script:
	writecode VAR_CALLERID, PHONE_HIKER_ANTHONY
	end_if_just_battled
	loadfont
	checkflag ENGINE_ANTHONY
	iftrue UnknownScript_0x1ac051
	checkflag ENGINE_DUNSPARCE_SWARM
	iftrue UnknownScript_0x1ac0c5
	checkcellnum PHONE_HIKER_ANTHONY
	iftrue UnknownScript_0x1ac0d7
	checkevent EVENT_ANTHONY_ASKED_FOR_PHONE_NUMBER
	iftrue UnknownScript_0x1ac03a
	writetext UnknownText_0x1ac153
	keeptextopen
	setevent EVENT_ANTHONY_ASKED_FOR_PHONE_NUMBER
	scall UnknownScript_0x1ac0cb
	jump UnknownScript_0x1ac03d

UnknownScript_0x1ac03a:
	scall UnknownScript_0x1ac0cf
UnknownScript_0x1ac03d:
	askforphonenumber PHONE_HIKER_ANTHONY
	if_equal $1, UnknownScript_0x1ac0df
	if_equal $2, UnknownScript_0x1ac0db
	trainertotext HIKER, ANTHONY2, $0
	scall UnknownScript_0x1ac0d3
	jump UnknownScript_0x1ac0d7

UnknownScript_0x1ac051:
	scall UnknownScript_0x1ac0e3
	winlosstext HikerAnthony2BeatenText, 0
	copybytetovar wAnthonyFightCount
	if_equal 4, .Fight4
	if_equal 3, .Fight3
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight4
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight4
.Fight3
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
.Fight2
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight2
.Fight1
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftrue .LoadFight1
.LoadFight0
	scriptedtrainerdata HIKER, ANTHONY2
	startbattle
	returnafterbattle
	loadvar wAnthonyFightCount, 1
	clearflag ENGINE_ANTHONY
	end

.LoadFight1
	scriptedtrainerdata HIKER, ANTHONY1
	startbattle
	returnafterbattle
	loadvar wAnthonyFightCount, 2
	clearflag ENGINE_ANTHONY
	end

.LoadFight2
	scriptedtrainerdata HIKER, ANTHONY3
	startbattle
	returnafterbattle
	loadvar wAnthonyFightCount, 3
	clearflag ENGINE_ANTHONY
	end

.LoadFight3
	scriptedtrainerdata HIKER, ANTHONY4
	startbattle
	returnafterbattle
	loadvar wAnthonyFightCount, 4
	clearflag ENGINE_ANTHONY
	end

.LoadFight4
	scriptedtrainerdata HIKER, ANTHONY5
	startbattle
	returnafterbattle
	clearflag ENGINE_ANTHONY
	end

UnknownScript_0x1ac0c5:
	writetext UnknownText_0x1ac180
	waitbutton
	closetext
	end

UnknownScript_0x1ac0cb:
	jumpstd asknumber1m
	end

UnknownScript_0x1ac0cf:
	jumpstd asknumber2m
	end

UnknownScript_0x1ac0d3:
	jumpstd registerednumberm
	end

UnknownScript_0x1ac0d7:
	jumpstd numberacceptedm
	end

UnknownScript_0x1ac0db:
	jumpstd numberdeclinedm
	end

UnknownScript_0x1ac0df:
	jumpstd phonefullm
	end

UnknownScript_0x1ac0e3:
	jumpstd rematchm
	end

MapRoute33Signpost0Script:
	jumptext UnknownText_0x1ac279

FruitTreeScript_0x1ac0ea:
	fruittree FRUITTREE_ROUTE_33

HikerAnthony2SeenText:
	text "I came through the"
	line "tunnel, but I"

	para "still have plenty"
	line "of energy left."
	done

HikerAnthony2BeatenText:
	text "Whoa! You've got"
	line "more zip than me!"
	done

UnknownText_0x1ac153:
	text "We HIKERS are at"
	line "our best in the"
	cont "mountains."
	done

UnknownText_0x1ac180:
	text "Hey, did you get a"
	line "DUNSPARCE?"

	para "I caught one too."

	para "Take a look at it"
	line "in the light. It's"
	cont "got a funny face!"
	done

UnknownText_0x1ac1e7:
	text "Pant, pant…"

	para "I finally got"
	line "through that cave."

	para "It was much bigger"
	line "than I'd expected."

	para "I got too tired to"
	line "explore the whole"

	para "thing, so I came"
	line "outside."
	done

UnknownText_0x1ac279:
	text "ROUTE 33"
	done

Route33_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def $9, $b, 3, UNION_CAVE_1F

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 11, 11, SIGNPOST_READ, MapRoute33Signpost0Script

.PersonEvents:
	db 3
	person_event SPRITE_POKEFAN_M, 13, 6, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 2, TrainerHikerAnthony, -1
	person_event SPRITE_LASS, 16, 13, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LassScript_0x1ac002, -1
	person_event SPRITE_FRUIT_TREE, 16, 14, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FruitTreeScript_0x1ac0ea, -1
