FastShipCabins_SW_SSW_NW_MapScriptHeader: ; 0x75a4d
	; trigger count
	db 0

	; callback count
	db 0
; 0x75a4f

TrainerFirebreatherLyle: ; 0x75a4f
	; bit/flag number
	dw $44d

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
; 0x75a5b

FirebreatherLyleScript: ; 0x75a5b
	talkaftercancel
	loadfont
	writetext UnknownText_0x75b52
	closetext
	loadmovesprites
	end
; 0x75a63

TrainerBug_catcherKen: ; 0x75a63
	; bit/flag number
	dw $540

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
; 0x75a6f

Bug_catcherKenScript: ; 0x75a6f
	talkaftercancel
	loadfont
	writetext UnknownText_0x75bd5
	closetext
	loadmovesprites
	end
; 0x75a77

TrainerBeautyCassie: ; 0x75a77
	; bit/flag number
	dw $4b2

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
; 0x75a83

BeautyCassieScript: ; 0x75a83
	talkaftercancel
	loadfont
	writetext UnknownText_0x75c43
	closetext
	loadmovesprites
	end
; 0x75a8b

TrainerGuitaristClyde: ; 0x75a8b
	; bit/flag number
	dw $493

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
; 0x75a97

GuitaristClydeScript: ; 0x75a97
	talkaftercancel
	special Function10630f
	iftrue UnknownScript_0x75aa5
	loadfont
	writetext UnknownText_0x75d65
	closetext
	loadmovesprites
	end
; 0x75aa5

UnknownScript_0x75aa5: ; 0x75aa5
	loadfont
	writetext UnknownText_0x75cfe
	closetext
	loadmovesprites
	end
; 0x75aac

MapFastShipCabins_SW_SSW_NWSignpost1Script: ; 0x75aac
	loadfont
	writetext UnknownText_0x75da4
	closetext
	loadmovesprites
	special Function8c0b6
	special Functiond91
	special Function1060a2
	special Functionc658
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	special Function8c0ab
	loadfont
	writetext UnknownText_0x75dc1
	closetext
	loadmovesprites
	checkevent $0031
	iftrue UnknownScript_0x75ae1
	checkevent $0032
	iftrue UnknownScript_0x75ae2
	checkevent $0030
	iftrue UnknownScript_0x75ae2
UnknownScript_0x75ae1: ; 0x75ae1
	end
; 0x75ae2

UnknownScript_0x75ae2: ; 0x75ae2
	playsound SFX_ELEVATOR_END
	pause 30
	checkevent $002f
	iftrue UnknownScript_0x75af7
	loadfont
	writetext UnknownText_0x75e0f
	closetext
	loadmovesprites
	setevent $0031
	end
; 0x75af7

UnknownScript_0x75af7: ; 0x75af7
	loadfont
	writetext UnknownText_0x75dde
	closetext
	loadmovesprites
	setevent $0031
	end
; 0x75b01

MapFastShipCabins_SW_SSW_NWSignpost2Script: ; 0x75b01
	jumpstd $000d
; 0x75b04

FirebreatherLyleSeenText: ; 0x75b04
	text "I'm going to KANTO"
	line "to put on fire-"
	cont "breathing shows!"
	done
; 0x75b38

FirebreatherLyleBeatenText: ; 0x75b38
	text "Fizzle… The"
	line "flame's tiny…"
	done
; 0x75b52

UnknownText_0x75b52: ; 0x75b52
	text "I guess fire is"
	line "weak on the sea."

	para "It doesn't matter?"
	line "Really?"
	done
; 0x75b8e

Bug_catcherKenSeenText: ; 0x75b8e
	text "I'm visiting my"
	line "grandma to catch"
	cont "me some bugs!"
	done
; 0x75bbd

Bug_catcherKenBeatenText: ; 0x75bbd
	text "Ooh, wow."
	line "You're tough!"
	done
; 0x75bd5

UnknownText_0x75bd5: ; 0x75bd5
	text "You can find lots"
	line "of #MON in the"
	cont "trees of JOHTO!"
	done
; 0x75c07

BeautyCassieSeenText: ; 0x75c07
	text "I'm trying to"
	line "forget my woes."
	cont "Let's battle!"
	done
; 0x75c32

BeautyCassieBeatenText: ; 0x75c32
	text "My heart weeps…"
	done
; 0x75c43

UnknownText_0x75c43: ; 0x75c43
	text "A voyage is best"
	line "for getting over"
	cont "a broken heart."

	para "But a FAST SHIP"
	line "trip is too short"
	cont "for grieving."
	done
; 0x75ca6

GuitaristClydeSeenText: ; 0x75ca6
	text "I'm going to audi-"
	line "tion my songs at"

	para "GOLDENROD's RADIO"
	line "STATION."
	done
; 0x75ce4

GuitaristClydeBeatenText: ; 0x75ce4
	text "Yowza!"
	line "Total distortion!"
	done
; 0x75cfe

UnknownText_0x75cfe: ; 0x75cfe
	text "I was going to"
	line "make my debut at"
	cont "the BATTLE TOWER…"

	para "I should go back"
	line "to VERMILION and"
	cont "redo my training…"
	done
; 0x75d65

UnknownText_0x75d65: ; 0x75d65
	text "Speaking of the"
	line "RADIO STATION,"

	para "what's this week's"
	line "lucky number?"
	done
; 0x75da4

UnknownText_0x75da4: ; 0x75da4
	text "A comfy bed!"
	line "Time to sleep…"
	done
; 0x75dc1

UnknownText_0x75dc1: ; 0x75dc1
	text "Ah, refreshed and"
	line "restored!"
	done
; 0x75dde

UnknownText_0x75dde: ; 0x75dde
	text "FAST SHIP S.S.AQUA"
	line "has arrived in"
	cont "OLIVINE CITY."
	done
; 0x75e0f

UnknownText_0x75e0f: ; 0x75e0f
	text "FAST SHIP S.S.AQUA"
	line "has arrived in"
	cont "VERMILION CITY."
	done
; 0x75e42

FastShipCabins_SW_SSW_NW_MapEventHeader: ; 0x75e42
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
	signpost 1, 7, $0, MapFastShipCabins_SW_SSW_NWSignpost1Script
	signpost 2, 7, $0, MapFastShipCabins_SW_SSW_NWSignpost1Script
	signpost 7, 7, $0, MapFastShipCabins_SW_SSW_NWSignpost2Script

	; people-events
	db 4
	person_event SPRITE_FISHER, 19, 5, $1e, $0, 255, 255, $82, 2, TrainerFirebreatherLyle, $0739
	person_event SPRITE_BUG_CATCHER, 19, 10, $a, $0, 255, 255, $b2, 2, TrainerBug_catcherKen, $073b
	person_event SPRITE_BUENA, 30, 5, $a, $0, 255, 255, $92, 3, TrainerBeautyCassie, $073a
	person_event SPRITE_ROCKER, 32, 7, $1e, $0, 255, 255, $82, 2, TrainerGuitaristClyde, $073b
; 0x75ea4
