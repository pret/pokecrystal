Route46_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

TrainerCamperTed:
	; bit/flag number
	dw EVENT_BEAT_CAMPER_TED

	; trainer group && trainer id
	db CAMPER, TED

	; text when seen
	dw CamperTedSeenText

	; text when trainer beaten
	dw CamperTedBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CamperTedScript

CamperTedScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a9851
	closetext
	loadmovesprites
	end

TrainerPicnickerErin1:
	; bit/flag number
	dw EVENT_BEAT_PICNICKER_ERIN

	; trainer group && trainer id
	db PICNICKER, ERIN1

	; text when seen
	dw PicnickerErin1SeenText

	; text when trainer beaten
	dw PicnickerErin1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PicnickerErin1Script

PicnickerErin1Script:
	writecode VAR_CALLERID, $24
	talkaftercancel
	loadfont
	checkflag ENGINE_ERIN
	iftrue UnknownScript_0x1a96da
	checkcellnum $24
	iftrue UnknownScript_0x1a975b
	checkevent EVENT_ERIN_ASKED_FOR_PHONE_NUMBER
	iftrue UnknownScript_0x1a96c3
	writetext UnknownText_0x1a98c6
	keeptextopen
	setevent EVENT_ERIN_ASKED_FOR_PHONE_NUMBER
	scall UnknownScript_0x1a974f
	jump UnknownScript_0x1a96c6

UnknownScript_0x1a96c3:
	scall UnknownScript_0x1a9753
UnknownScript_0x1a96c6:
	askforphonenumber $24
	if_equal $1, UnknownScript_0x1a9763
	if_equal $2, UnknownScript_0x1a975f
	trainertotext PICNICKER, ERIN1, $0
	scall UnknownScript_0x1a9757
	jump UnknownScript_0x1a975b

UnknownScript_0x1a96da:
	scall UnknownScript_0x1a9767
	winlosstext PicnickerErin1BeatenText, $0000
	copybytetovar ErinFightCount
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight2
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
.Fight1
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
.LoadFight0
	loadtrainer PICNICKER, ERIN1
	startbattle
	returnafterbattle
	loadvar ErinFightCount, 1
	clearflag ENGINE_ERIN
	end

.LoadFight1
	loadtrainer PICNICKER, ERIN2
	startbattle
	returnafterbattle
	loadvar ErinFightCount, 2
	clearflag ENGINE_ERIN
	end

.LoadFight2
	loadtrainer PICNICKER, ERIN3
	startbattle
	returnafterbattle
	clearflag ENGINE_ERIN
	checkevent EVENT_ERIN_CALCIUM
	iftrue UnknownScript_0x1a973b
	checkevent EVENT_GOT_CALCIUM_FROM_ERIN
	iftrue UnknownScript_0x1a973a
	scall UnknownScript_0x1a9772
	verbosegiveitem CALCIUM, 1
	iffalse UnknownScript_0x1a976b
	setevent EVENT_GOT_CALCIUM_FROM_ERIN
	jump UnknownScript_0x1a975b

UnknownScript_0x1a973a:
	end

UnknownScript_0x1a973b:
	loadfont
	writetext UnknownText_0x1a9927
	closetext
	verbosegiveitem CALCIUM, 1
	iffalse UnknownScript_0x1a976b
	clearevent EVENT_ERIN_CALCIUM
	setevent EVENT_GOT_CALCIUM_FROM_ERIN
	jump UnknownScript_0x1a975b

UnknownScript_0x1a974f:
	jumpstd asknumber1f
	end

UnknownScript_0x1a9753:
	jumpstd asknumber2f
	end

UnknownScript_0x1a9757:
	jumpstd registerednumberf
	end

UnknownScript_0x1a975b:
	jumpstd numberacceptedf
	end

UnknownScript_0x1a975f:
	jumpstd numberdeclinedf
	end

UnknownScript_0x1a9763:
	jumpstd phonefullf
	end

UnknownScript_0x1a9767:
	jumpstd rematchf
	end

UnknownScript_0x1a976b:
	setevent EVENT_ERIN_CALCIUM
	jumpstd packfullf
	end

UnknownScript_0x1a9772:
	jumpstd rematchgiftf
	end

TrainerHikerBailey:
	; bit/flag number
	dw EVENT_BEAT_HIKER_BAILEY

	; trainer group && trainer id
	db HIKER, BAILEY

	; text when seen
	dw HikerBaileySeenText

	; text when trainer beaten
	dw HikerBaileyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw HikerBaileyScript

HikerBaileyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a97e8
	closetext
	loadmovesprites
	end

MapRoute46Signpost0Script:
	jumptext UnknownText_0x1a99be

ItemFragment_0x1a978d:
	db X_SPEED, 1

FruitTreeScript_0x1a978f:
	fruittree $4

FruitTreeScript_0x1a9791:
	fruittree $a

HikerBaileySeenText:
	text "Awright! I'll show"
	line "you the power of"
	cont "mountain #MON!"
	done

HikerBaileyBeatenText:
	text "Mercy! You showed"
	line "me your power!"
	done

UnknownText_0x1a97e8:
	text "It's over. I don't"
	line "mind. We HIKERS"
	cont "are like that."
	done

CamperTedSeenText:
	text "I'm raising #-"
	line "MON too!"

	para "Will you battle"
	line "with me?"
	done

CamperTedBeatenText:
	text "Wha…?"
	done

UnknownText_0x1a9851:
	text "I did my best but"
	line "came up short."

	para "No excuses--I"
	line "admit I lost."
	done

PicnickerErin1SeenText:
	text "I raise #MON"
	line "too!"

	para "Will you battle"
	line "with me?"
	done

PicnickerErin1BeatenText:
	text "Oh, rats!"
	done

UnknownText_0x1a98c6:
	text "I've been to many"
	line "GYMS, but the GYM"

	para "in GOLDENROD is my"
	line "favorite."

	para "It's filled with"
	line "pretty flowers!"
	done

UnknownText_0x1a9927:
	text "Aww… I keep losing"
	line "all the time!"

	para "I'll just have to"
	line "try harder!"

	para "Anyway, thanks for"
	line "battling me again"

	para "and again. Here's"
	line "that present from"
	cont "the other time."
	done

UnknownText_0x1a99be:
	text "ROUTE 46"
	line "MOUNTAIN RD. AHEAD"
	done

Route46_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $21, $7, 1, GROUP_ROUTE_29_46_GATE, MAP_ROUTE_29_46_GATE
	warp_def $21, $8, 2, GROUP_ROUTE_29_46_GATE, MAP_ROUTE_29_46_GATE
	warp_def $5, $e, 3, GROUP_DARK_CAVE_VIOLET_ENTRANCE, MAP_DARK_CAVE_VIOLET_ENTRANCE

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 27, 9, $0, MapRoute46Signpost0Script

	; people-events
	db 6
	person_event SPRITE_POKEFAN_M, 23, 16, $8, $0, 255, 255, $b2, 2, TrainerHikerBailey, $ffff
	person_event SPRITE_YOUNGSTER, 18, 8, $7, $0, 255, 255, $a2, 2, TrainerCamperTed, $ffff
	person_event SPRITE_LASS, 17, 6, $6, $0, 255, 255, $a2, 2, TrainerPicnickerErin1, $ffff
	person_event SPRITE_FRUIT_TREE, 9, 11, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x1a978f, $ffff
	person_event SPRITE_FRUIT_TREE, 10, 12, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x1a9791, $ffff
	person_event SPRITE_POKE_BALL, 19, 5, $1, $0, 255, 255, $1, 0, ItemFragment_0x1a978d, $06bc
