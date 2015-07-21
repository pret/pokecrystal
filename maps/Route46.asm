Route46_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerCamperTed:
	trainer EVENT_BEAT_CAMPER_TED, CAMPER, TED, CamperTedSeenText, CamperTedBeatenText, $0000, CamperTedScript

CamperTedScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a9851
	closetext
	loadmovesprites
	end

TrainerPicnickerErin1:
	trainer EVENT_BEAT_PICNICKER_ERIN, PICNICKER, ERIN1, PicnickerErin1SeenText, PicnickerErin1BeatenText, $0000, PicnickerErin1Script

PicnickerErin1Script:
	writecode VAR_CALLERID, PHONE_PICNICKER_ERIN
	talkaftercancel
	loadfont
	checkflag ENGINE_ERIN
	iftrue UnknownScript_0x1a96da
	checkcellnum PHONE_PICNICKER_ERIN
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
	askforphonenumber PHONE_PICNICKER_ERIN
	if_equal $1, UnknownScript_0x1a9763
	if_equal $2, UnknownScript_0x1a975f
	trainertotext PICNICKER, ERIN1, $0
	scall UnknownScript_0x1a9757
	jump UnknownScript_0x1a975b

UnknownScript_0x1a96da:
	scall UnknownScript_0x1a9767
	winlosstext PicnickerErin1BeatenText, $0000
	copybytetovar wErinFightCount
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
	loadvar wErinFightCount, 1
	clearflag ENGINE_ERIN
	end

.LoadFight1
	loadtrainer PICNICKER, ERIN2
	startbattle
	returnafterbattle
	loadvar wErinFightCount, 2
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
	trainer EVENT_BEAT_HIKER_BAILEY, HIKER, BAILEY, HikerBaileySeenText, HikerBaileyBeatenText, $0000, HikerBaileyScript

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

.Warps:
	db 3
	warp_def $21, $7, 1, GROUP_ROUTE_29_46_GATE, MAP_ROUTE_29_46_GATE
	warp_def $21, $8, 2, GROUP_ROUTE_29_46_GATE, MAP_ROUTE_29_46_GATE
	warp_def $5, $e, 3, GROUP_DARK_CAVE_VIOLET_ENTRANCE, MAP_DARK_CAVE_VIOLET_ENTRANCE

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 27, 9, SIGNPOST_READ, MapRoute46Signpost0Script

.PersonEvents:
	db 6
	person_event SPRITE_POKEFAN_M, 23, 16, OW_LEFT | $0, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 2, TrainerHikerBailey, -1
	person_event SPRITE_YOUNGSTER, 18, 8, OW_UP | $3, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 2, TrainerCamperTed, -1
	person_event SPRITE_LASS, 17, 6, OW_UP | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 2, TrainerPicnickerErin1, -1
	person_event SPRITE_FRUIT_TREE, 9, 11, OW_DOWN | $1, $0, -1, -1, $0, 0, FruitTreeScript_0x1a978f, -1
	person_event SPRITE_FRUIT_TREE, 10, 12, OW_DOWN | $1, $0, -1, -1, $0, 0, FruitTreeScript_0x1a9791, -1
	person_event SPRITE_POKE_BALL, 19, 5, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x1a978d, EVENT_ROUTE_46_X_SPEED
