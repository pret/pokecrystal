Route46_MapScriptHeader: ; 0x1a967e
	; trigger count
	db 0

	; callback count
	db 0
; 0x1a9680

TrainerCamperTed: ; 0x1a9680
	; bit/flag number
	dw $424

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
; 0x1a968c

CamperTedScript: ; 0x1a968c
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a9851
	closetext
	loadmovesprites
	end
; 0x1a9694

TrainerPicnickerErin1: ; 0x1a9694
	; bit/flag number
	dw $487

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
; 0x1a96a0

PicnickerErin1Script: ; 0x1a96a0
	writecode $17, $24
	talkaftercancel
	loadfont
	checkflag $007c
	iftrue UnknownScript_0x1a96da
	checkcellnum $24
	iftrue UnknownScript_0x1a975b
	checkevent $029d
	iftrue UnknownScript_0x1a96c3
	writetext UnknownText_0x1a98c6
	keeptextopen
	setevent $029d
	scall UnknownScript_0x1a974f
	jump UnknownScript_0x1a96c6
; 0x1a96c3

UnknownScript_0x1a96c3: ; 0x1a96c3
	scall UnknownScript_0x1a9753
UnknownScript_0x1a96c6: ; 0x1a96c6
	askforphonenumber $24
	if_equal $1, UnknownScript_0x1a9763
	if_equal $2, UnknownScript_0x1a975f
	trainertotext PICNICKER, ERIN1, $0
	scall UnknownScript_0x1a9757
	jump UnknownScript_0x1a975b
; 0x1a96da

UnknownScript_0x1a96da: ; 0x1a96da
	scall UnknownScript_0x1a9767
	winlosstext PicnickerErin1BeatenText, $0000
	copybytetovar wda0d
	if_equal $2, UnknownScript_0x1a96f1
	if_equal $1, UnknownScript_0x1a96f7
	if_equal $0, UnknownScript_0x1a96fd
UnknownScript_0x1a96f1: ; 0x1a96f1
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue UnknownScript_0x1a9717
UnknownScript_0x1a96f7: ; 0x1a96f7
	checkevent $0044
	iftrue UnknownScript_0x1a970a
UnknownScript_0x1a96fd: ; 0x1a96fd
	loadtrainer PICNICKER, ERIN1
	startbattle
	returnafterbattle
	loadvar wda0d, $1
	clearflag $007c
	end
; 0x1a970a

UnknownScript_0x1a970a: ; 0x1a970a
	loadtrainer PICNICKER, ERIN2
	startbattle
	returnafterbattle
	loadvar wda0d, $2
	clearflag $007c
	end
; 0x1a9717

UnknownScript_0x1a9717: ; 0x1a9717
	loadtrainer PICNICKER, ERIN3
	startbattle
	returnafterbattle
	clearflag $007c
	checkevent EVENT_ERIN_CALCIUM
	iftrue UnknownScript_0x1a973b
	checkevent $0269
	iftrue UnknownScript_0x1a973a
	scall UnknownScript_0x1a9772
	verbosegiveitem CALCIUM, 1
	iffalse UnknownScript_0x1a976b
	setevent $0269
	jump UnknownScript_0x1a975b
; 0x1a973a

UnknownScript_0x1a973a: ; 0x1a973a
	end
; 0x1a973b

UnknownScript_0x1a973b: ; 0x1a973b
	loadfont
	writetext UnknownText_0x1a9927
	closetext
	verbosegiveitem CALCIUM, 1
	iffalse UnknownScript_0x1a976b
	clearevent EVENT_ERIN_CALCIUM
	setevent $0269
	jump UnknownScript_0x1a975b
; 0x1a974f

UnknownScript_0x1a974f: ; 0x1a974f
	jumpstd $0023
	end
; 0x1a9753

UnknownScript_0x1a9753: ; 0x1a9753
	jumpstd $0024
	end
; 0x1a9757

UnknownScript_0x1a9757: ; 0x1a9757
	jumpstd $0025
	end
; 0x1a975b

UnknownScript_0x1a975b: ; 0x1a975b
	jumpstd $0026
	end
; 0x1a975f

UnknownScript_0x1a975f: ; 0x1a975f
	jumpstd $0027
	end
; 0x1a9763

UnknownScript_0x1a9763: ; 0x1a9763
	jumpstd $0028
	end
; 0x1a9767

UnknownScript_0x1a9767: ; 0x1a9767
	jumpstd $0029
	end
; 0x1a976b

UnknownScript_0x1a976b: ; 0x1a976b
	setevent EVENT_ERIN_CALCIUM
	jumpstd $002b
	end
; 0x1a9772

UnknownScript_0x1a9772: ; 0x1a9772
	jumpstd $002c
	end
; 0x1a9776

TrainerHikerBailey: ; 0x1a9776
	; bit/flag number
	dw $52e

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
; 0x1a9782

HikerBaileyScript: ; 0x1a9782
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a97e8
	closetext
	loadmovesprites
	end
; 0x1a978a

MapRoute46Signpost0Script: ; 0x1a978a
	jumptext UnknownText_0x1a99be
; 0x1a978d

ItemFragment_0x1a978d: ; 0x1a978d
	db X_SPEED, 1
; 0x1a978f

FruitTreeScript_0x1a978f: ; 0x1a978f
	fruittree $4
; 0x1a9791

FruitTreeScript_0x1a9791: ; 0x1a9791
	fruittree $a
; 0x1a9793

HikerBaileySeenText: ; 0x1a9793
	text "Awright! I'll show"
	line "you the power of"
	cont "mountain #MON!"
	done
; 0x1a97c6

HikerBaileyBeatenText: ; 0x1a97c6
	text "Mercy! You showed"
	line "me your power!"
	done
; 0x1a97e8

UnknownText_0x1a97e8: ; 0x1a97e8
	text "It's over. I don't"
	line "mind. We HIKERS"
	cont "are like that."
	done
; 0x1a9819

CamperTedSeenText: ; 0x1a9819
	text "I'm raising #-"
	line "MON too!"

	para "Will you battle"
	line "with me?"
	done
; 0x1a984a

CamperTedBeatenText: ; 0x1a984a
	text "Wha…?"
	done
; 0x1a9851

UnknownText_0x1a9851: ; 0x1a9851
	text "I did my best but"
	line "came up short."

	para "No excuses--I"
	line "admit I lost."
	done
; 0x1a988f

PicnickerErin1SeenText: ; 0x1a988f
	text "I raise #MON"
	line "too!"

	para "Will you battle"
	line "with me?"
	done
; 0x1a98bb

PicnickerErin1BeatenText: ; 0x1a98bb
	text "Oh, rats!"
	done
; 0x1a98c6

UnknownText_0x1a98c6: ; 0x1a98c6
	text "I've been to many"
	line "GYMS, but the GYM"

	para "in GOLDENROD is my"
	line "favorite."

	para "It's filled with"
	line "pretty flowers!"
	done
; 0x1a9927

UnknownText_0x1a9927: ; 0x1a9927
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
; 0x1a99be

UnknownText_0x1a99be: ; 0x1a99be
	text "ROUTE 46"
	line "MOUNTAIN RD. AHEAD"
	done
; 0x1a99db

Route46_MapEventHeader: ; 0x1a99db
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
; 0x1a9a43

