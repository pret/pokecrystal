FastShipCabins_SW_SSW_NW_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

TrainerFirebreatherLyle:
	; bit/flag number
	dw EVENT_BEAT_FIREBREATHER_LYLE

	; trainer group && trainer id
	db FIREBREATHER, LYLE

	; text when seen
	dw FirebreatherLyleSeenText

	; text when trainer beaten
	dw FirebreatherLyleBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw FirebreatherLyleScript

FirebreatherLyleScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x75b52
	closetext
	loadmovesprites
	end

TrainerBug_catcherKen:
	; bit/flag number
	dw EVENT_BEAT_BUG_CATCHER_KEN

	; trainer group && trainer id
	db BUG_CATCHER, KEN

	; text when seen
	dw Bug_catcherKenSeenText

	; text when trainer beaten
	dw Bug_catcherKenBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bug_catcherKenScript

Bug_catcherKenScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x75bd5
	closetext
	loadmovesprites
	end

TrainerBeautyCassie:
	; bit/flag number
	dw EVENT_BEAT_BEAUTY_CASSIE

	; trainer group && trainer id
	db BEAUTY, CASSIE

	; text when seen
	dw BeautyCassieSeenText

	; text when trainer beaten
	dw BeautyCassieBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw BeautyCassieScript

BeautyCassieScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x75c43
	closetext
	loadmovesprites
	end

TrainerGuitaristClyde:
	; bit/flag number
	dw EVENT_BEAT_GUITARIST_CLYDE

	; trainer group && trainer id
	db GUITARIST, CLYDE

	; text when seen
	dw GuitaristClydeSeenText

	; text when trainer beaten
	dw GuitaristClydeBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GuitaristClydeScript

GuitaristClydeScript:
	talkaftercancel
	special Function10630f
	iftrue UnknownScript_0x75aa5
	loadfont
	writetext UnknownText_0x75d65
	closetext
	loadmovesprites
	end

UnknownScript_0x75aa5:
	loadfont
	writetext UnknownText_0x75cfe
	closetext
	loadmovesprites
	end

FastShipBed:
	loadfont
	writetext FastShipBedText1
	closetext
	loadmovesprites
	special Function8c0b6
	special Functiond91
	special Function1060a2
	special HealParty
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	special Function8c0ab
	loadfont
	writetext FastShipBedText2
	closetext
	loadmovesprites
	checkevent EVENT_031
	iftrue UnknownScript_0x75ae1
	checkevent EVENT_032
	iftrue UnknownScript_0x75ae2
	checkevent EVENT_030
	iftrue UnknownScript_0x75ae2
UnknownScript_0x75ae1:
	end

UnknownScript_0x75ae2:
	playsound SFX_ELEVATOR_END
	pause 30
	checkevent EVENT_FAST_SHIP_DESTINATION_OLIVINE
	iftrue UnknownScript_0x75af7
	loadfont
	writetext FastShipArrivedVermilionText
	closetext
	loadmovesprites
	setevent EVENT_031
	end

UnknownScript_0x75af7:
	loadfont
	writetext FastShipArrivedOlivineText
	closetext
	loadmovesprites
	setevent EVENT_031
	end

FastShipCabinsNorthwestCabinTrashcan:
	jumpstd trashcan

FirebreatherLyleSeenText:
	text "I'm going to KANTO"
	line "to put on fire-"
	cont "breathing shows!"
	done

FirebreatherLyleBeatenText:
	text "Fizzle… The"
	line "flame's tiny…"
	done

UnknownText_0x75b52:
	text "I guess fire is"
	line "weak on the sea."

	para "It doesn't matter?"
	line "Really?"
	done

Bug_catcherKenSeenText:
	text "I'm visiting my"
	line "grandma to catch"
	cont "me some bugs!"
	done

Bug_catcherKenBeatenText:
	text "Ooh, wow."
	line "You're tough!"
	done

UnknownText_0x75bd5:
	text "You can find lots"
	line "of #MON in the"
	cont "trees of JOHTO!"
	done

BeautyCassieSeenText:
	text "I'm trying to"
	line "forget my woes."
	cont "Let's battle!"
	done

BeautyCassieBeatenText:
	text "My heart weeps…"
	done

UnknownText_0x75c43:
	text "A voyage is best"
	line "for getting over"
	cont "a broken heart."

	para "But a FAST SHIP"
	line "trip is too short"
	cont "for grieving."
	done

GuitaristClydeSeenText:
	text "I'm going to audi-"
	line "tion my songs at"

	para "GOLDENROD's RADIO"
	line "STATION."
	done

GuitaristClydeBeatenText:
	text "Yowza!"
	line "Total distortion!"
	done

UnknownText_0x75cfe:
	text "I was going to"
	line "make my debut at"
	cont "the BATTLE TOWER…"

	para "I should go back"
	line "to VERMILION and"
	cont "redo my training…"
	done

UnknownText_0x75d65:
	text "Speaking of the"
	line "RADIO STATION,"

	para "what's this week's"
	line "lucky number?"
	done

FastShipBedText1:
	text "A comfy bed!"
	line "Time to sleep…"
	done

FastShipBedText2:
	text "Ah, refreshed and"
	line "restored!"
	done

FastShipArrivedOlivineText:
	text "FAST SHIP S.S.AQUA"
	line "has arrived in"
	cont "OLIVINE CITY."
	done

FastShipArrivedVermilionText:
	text "FAST SHIP S.S.AQUA"
	line "has arrived in"
	cont "VERMILION CITY."
	done

FastShipCabins_SW_SSW_NW_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 5
	warp_def $0, $2, 5, GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F
	warp_def $13, $2, 6, GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F
	warp_def $13, $3, 6, GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F
	warp_def $1f, $2, 7, GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F
	warp_def $1f, $3, 7, GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 1, 7, $0, FastShipBed
	signpost 2, 7, $0, FastShipBed
	signpost 7, 7, $0, FastShipCabinsNorthwestCabinTrashcan

	; people-events
	db 4
	person_event SPRITE_FISHER, 19, 5, $1e, $0, 255, 255, $82, 2, TrainerFirebreatherLyle, EVENT_739
	person_event SPRITE_BUG_CATCHER, 19, 10, $a, $0, 255, 255, $b2, 2, TrainerBug_catcherKen, EVENT_73B
	person_event SPRITE_BUENA, 30, 5, $a, $0, 255, 255, $92, 3, TrainerBeautyCassie, EVENT_73A
	person_event SPRITE_ROCKER, 32, 7, $1e, $0, 255, 255, $82, 2, TrainerGuitaristClyde, EVENT_73B
