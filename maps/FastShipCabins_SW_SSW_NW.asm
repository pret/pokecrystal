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
	2writetext UnknownText_0x75b52
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
	2writetext UnknownText_0x75bd5
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
	2writetext UnknownText_0x75c43
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
	special $00a0
	iftrue UnknownScript_0x75aa5
	loadfont
	2writetext UnknownText_0x75d65
	closetext
	loadmovesprites
	end
; 0x75aa5

UnknownScript_0x75aa5: ; 0x75aa5
	loadfont
	2writetext UnknownText_0x75cfe
	closetext
	loadmovesprites
	end
; 0x75aac

MapFastShipCabins_SW_SSW_NWSignpost1Script: ; 0x75aac
	loadfont
	2writetext UnknownText_0x75da4
	closetext
	loadmovesprites
	special $0030
	special $0033
	special $009d
	special $001b
	playmusic $000d
	pause 60
	special $003d
	special $0032
	loadfont
	2writetext UnknownText_0x75dc1
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
	playsound $0027
	pause 30
	checkevent $002f
	iftrue UnknownScript_0x75af7
	loadfont
	2writetext UnknownText_0x75e0f
	closetext
	loadmovesprites
	setevent $0031
	end
; 0x75af7

UnknownScript_0x75af7: ; 0x75af7
	loadfont
	2writetext UnknownText_0x75dde
	closetext
	loadmovesprites
	setevent $0031
	end
; 0x75b01

MapFastShipCabins_SW_SSW_NWSignpost2Script: ; 0x75b01
	jumpstd $000d
; 0x75b04

FirebreatherLyleSeenText: ; 0x75b04
	db $0, "I'm going to KANTO", $4f
	db "to put on fire-", $55
	db "breathing shows!", $57
; 0x75b38

FirebreatherLyleBeatenText: ; 0x75b38
	db $0, "Fizzle… The", $4f
	db "flame's tiny…", $57
; 0x75b52

UnknownText_0x75b52: ; 0x75b52
	db $0, "I guess fire is", $4f
	db "weak on the sea.", $51
	db "It doesn't matter?", $4f
	db "Really?", $57
; 0x75b8e

Bug_catcherKenSeenText: ; 0x75b8e
	db $0, "I'm visiting my", $4f
	db "grandma to catch", $55
	db "me some bugs!", $57
; 0x75bbd

Bug_catcherKenBeatenText: ; 0x75bbd
	db $0, "Ooh, wow.", $4f
	db "You're tough!", $57
; 0x75bd5

UnknownText_0x75bd5: ; 0x75bd5
	db $0, "You can find lots", $4f
	db "of #MON in the", $55
	db "trees of JOHTO!", $57
; 0x75c07

BeautyCassieSeenText: ; 0x75c07
	db $0, "I'm trying to", $4f
	db "forget my woes.", $55
	db "Let's battle!", $57
; 0x75c32

BeautyCassieBeatenText: ; 0x75c32
	db $0, "My heart weeps…", $57
; 0x75c43

UnknownText_0x75c43: ; 0x75c43
	db $0, "A voyage is best", $4f
	db "for getting over", $55
	db "a broken heart.", $51
	db "But a FAST SHIP", $4f
	db "trip is too short", $55
	db "for grieving.", $57
; 0x75ca6

GuitaristClydeSeenText: ; 0x75ca6
	db $0, "I'm going to audi-", $4f
	db "tion my songs at", $51
	db "GOLDENROD's RADIO", $4f
	db "STATION.", $57
; 0x75ce4

GuitaristClydeBeatenText: ; 0x75ce4
	db $0, "Yowza!", $4f
	db "Total distortion!", $57
; 0x75cfe

UnknownText_0x75cfe: ; 0x75cfe
	db $0, "I was going to", $4f
	db "make my debut at", $55
	db "the BATTLE TOWER…", $51
	db "I should go back", $4f
	db "to VERMILION and", $55
	db "redo my training…", $57
; 0x75d65

UnknownText_0x75d65: ; 0x75d65
	db $0, "Speaking of the", $4f
	db "RADIO STATION,", $51
	db "what's this week's", $4f
	db "lucky number?", $57
; 0x75da4

UnknownText_0x75da4: ; 0x75da4
	db $0, "A comfy bed!", $4f
	db "Time to sleep…", $57
; 0x75dc1

UnknownText_0x75dc1: ; 0x75dc1
	db $0, "Ah, refreshed and", $4f
	db "restored!", $57
; 0x75dde

UnknownText_0x75dde: ; 0x75dde
	db $0, "FAST SHIP S.S.AQUA", $4f
	db "has arrived in", $55
	db "OLIVINE CITY.", $57
; 0x75e0f

UnknownText_0x75e0f: ; 0x75e0f
	db $0, "FAST SHIP S.S.AQUA", $4f
	db "has arrived in", $55
	db "VERMILION CITY.", $57
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

