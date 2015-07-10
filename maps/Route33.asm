Route33_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

LassScript_0x1ac002:
	jumptextfaceplayer UnknownText_0x1ac1e7

TrainerHikerAnthony:
	; bit/flag number
	dw EVENT_BEAT_HIKER_ANTHONY

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

HikerAnthony2Script:
	writecode VAR_CALLERID, $13
	talkaftercancel
	loadfont
	checkflag ENGINE_ANTHONY
	iftrue UnknownScript_0x1ac051
	checkflag ENGINE_DUNSPARCE_SWARM
	iftrue UnknownScript_0x1ac0c5
	checkcellnum $13
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
	askforphonenumber $13
	if_equal $1, UnknownScript_0x1ac0df
	if_equal $2, UnknownScript_0x1ac0db
	trainertotext HIKER, ANTHONY2, $0
	scall UnknownScript_0x1ac0d3
	jump UnknownScript_0x1ac0d7

UnknownScript_0x1ac051:
	scall UnknownScript_0x1ac0e3
	winlosstext HikerAnthony2BeatenText, $0000
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
	loadtrainer HIKER, ANTHONY2
	startbattle
	returnafterbattle
	loadvar wAnthonyFightCount, 1
	clearflag ENGINE_ANTHONY
	end

.LoadFight1
	loadtrainer HIKER, ANTHONY1
	startbattle
	returnafterbattle
	loadvar wAnthonyFightCount, 2
	clearflag ENGINE_ANTHONY
	end

.LoadFight2
	loadtrainer HIKER, ANTHONY3
	startbattle
	returnafterbattle
	loadvar wAnthonyFightCount, 3
	clearflag ENGINE_ANTHONY
	end

.LoadFight3
	loadtrainer HIKER, ANTHONY4
	startbattle
	returnafterbattle
	loadvar wAnthonyFightCount, 4
	clearflag ENGINE_ANTHONY
	end

.LoadFight4
	loadtrainer HIKER, ANTHONY5
	startbattle
	returnafterbattle
	clearflag ENGINE_ANTHONY
	end

UnknownScript_0x1ac0c5:
	writetext UnknownText_0x1ac180
	closetext
	loadmovesprites
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
	fruittree $6

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
	person_event SPRITE_POKEFAN_M, 17, 10, $a, $0, 255, 255, $b2, 2, TrainerHikerAnthony, $ffff
	person_event SPRITE_LASS, 20, 17, $2, $11, 255, 255, $90, 0, LassScript_0x1ac002, $ffff
	person_event SPRITE_FRUIT_TREE, 20, 18, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x1ac0ea, $ffff
