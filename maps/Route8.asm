Route8_MapScriptHeader: ; 0x6c000
	; trigger count
	db 0

	; callback count
	db 0
; 0x6c002

TrainerBikerDwayne: ; 0x6c002
	; bit/flag number
	dw $433

	; trainer group && trainer id
	db BIKER, DWAYNE

	; text when seen
	dw BikerDwayneSeenText

	; text when trainer beaten
	dw BikerDwayneBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw BikerDwayneScript
; 0x6c00e

BikerDwayneScript: ; 0x6c00e
	talkaftercancel
	loadfont
	writetext UnknownText_0x6c0c8
	closetext
	loadmovesprites
	end
; 0x6c016

TrainerBikerHarris: ; 0x6c016
	; bit/flag number
	dw $434

	; trainer group && trainer id
	db BIKER, HARRIS

	; text when seen
	dw BikerHarrisSeenText

	; text when trainer beaten
	dw BikerHarrisBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw BikerHarrisScript
; 0x6c022

BikerHarrisScript: ; 0x6c022
	talkaftercancel
	loadfont
	writetext UnknownText_0x6c143
	closetext
	loadmovesprites
	end
; 0x6c02a

TrainerBikerZeke: ; 0x6c02a
	; bit/flag number
	dw $435

	; trainer group && trainer id
	db BIKER, ZEKE

	; text when seen
	dw BikerZekeSeenText

	; text when trainer beaten
	dw BikerZekeBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw BikerZekeScript
; 0x6c036

BikerZekeScript: ; 0x6c036
	talkaftercancel
	loadfont
	writetext UnknownText_0x6c1a3
	closetext
	loadmovesprites
	end
; 0x6c03e

TrainerSupernerdSam: ; 0x6c03e
	; bit/flag number
	dw $586

	; trainer group && trainer id
	db SUPER_NERD, SAM

	; text when seen
	dw SupernerdSamSeenText

	; text when trainer beaten
	dw SupernerdSamBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SupernerdSamScript
; 0x6c04a

SupernerdSamScript: ; 0x6c04a
	talkaftercancel
	loadfont
	writetext UnknownText_0x6c219
	closetext
	loadmovesprites
	end
; 0x6c052

TrainerSupernerdTom: ; 0x6c052
	; bit/flag number
	dw $587

	; trainer group && trainer id
	db SUPER_NERD, TOM

	; text when seen
	dw SupernerdTomSeenText

	; text when trainer beaten
	dw SupernerdTomBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SupernerdTomScript
; 0x6c05e

SupernerdTomScript: ; 0x6c05e
	talkaftercancel
	loadfont
	writetext UnknownText_0x6c27e
	closetext
	loadmovesprites
	end
; 0x6c066

MapRoute8Signpost1Script: ; 0x6c066
	jumptext UnknownText_0x6c2aa
; 0x6c069

MapRoute8Signpost0Script: ; 0x6c069
	jumptext UnknownText_0x6c2b7
; 0x6c06c

FruitTreeScript_0x6c06c: ; 0x6c06c
	fruittree $1b
; 0x6c06e

BikerDwayneSeenText: ; 0x6c06e
	text "We're the KANTO"
	line "#MON FEDERATION"
	cont "trainer group."

	para "We'll drive you"
	line "under our wheels!"
	done
; 0x6c0be

BikerDwayneBeatenText: ; 0x6c0be
	text "S-sorry!"
	done
; 0x6c0c8

UnknownText_0x6c0c8: ; 0x6c0c8
	text "The KANTO #MON"
	line "FEDERATION will"
	cont "never fall!"
	done
; 0x6c0f4

BikerHarrisSeenText: ; 0x6c0f4
	text "The cops shut down"
	line "our UNDERGROUND"

	para "PATH! That really"
	line "fries me!"
	done
; 0x6c134

BikerHarrisBeatenText: ; 0x6c134
	text "F-forgive me!"
	done
; 0x6c143

UnknownText_0x6c143: ; 0x6c143
	text "Wiped out by some"
	line "punk from JOHTO…"
	done
; 0x6c167

BikerZekeSeenText: ; 0x6c167
	text "We're the KANTO"
	line "#MON FEDERA-"
	cont "TION!"
	cont "Right on!"
	done
; 0x6c194

BikerZekeBeatenText: ; 0x6c194
	text "Yikes! Sorry!"
	done
; 0x6c1a3

UnknownText_0x6c1a3: ; 0x6c1a3
	text "We'll try not to"
	line "disturb anyone"
	cont "from now on…"
	done
; 0x6c1d0

SupernerdSamSeenText: ; 0x6c1d0
	text "How does the MAG-"
	line "NET TRAIN work?"
	done
; 0x6c1f3

SupernerdSamBeatenText: ; 0x6c1f3
	text "I just want to see"
	line "the MAGNET TRAIN…"
	done
; 0x6c219

UnknownText_0x6c219: ; 0x6c219
	text "The power of mag-"
	line "nets is awesome!"
	done
; 0x6c23d

SupernerdTomSeenText: ; 0x6c23d
	text "Hm… You've got"
	line "many GYM BADGES."
	done
; 0x6c25d

SupernerdTomBeatenText: ; 0x6c25d
	text "Just as I thought…"
	line "You're tough!"
	done
; 0x6c27e

UnknownText_0x6c27e: ; 0x6c27e
	text "GYM BADGES give"
	line "you advantages in"
	cont "battles."
	done
; 0x6c2aa

UnknownText_0x6c2aa: ; 0x6c2aa
	text "It's locked…"
	done
; 0x6c2b7

UnknownText_0x6c2b7: ; 0x6c2b7
	text "The flyer's torn."

	para "It's impossible to"
	line "read…"
	done
; 0x6c2e1

Route8_MapEventHeader: ; 0x6c2e1
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $4, $4, 3, GROUP_ROUTE_8_SAFFRON_GATE, MAP_ROUTE_8_SAFFRON_GATE
	warp_def $5, $4, 4, GROUP_ROUTE_8_SAFFRON_GATE, MAP_ROUTE_8_SAFFRON_GATE

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 7, 11, $0, MapRoute8Signpost0Script
	signpost 5, 10, $0, MapRoute8Signpost1Script

	; people-events
	db 6
	person_event SPRITE_BIKER, 12, 14, $8, $0, 255, 255, $82, 5, TrainerBikerDwayne, $ffff
	person_event SPRITE_BIKER, 13, 14, $8, $0, 255, 255, $a2, 5, TrainerBikerHarris, $ffff
	person_event SPRITE_BIKER, 14, 14, $8, $0, 255, 255, $92, 5, TrainerBikerZeke, $ffff
	person_event SPRITE_SUPER_NERD, 6, 27, $6, $0, 255, 255, $b2, 3, TrainerSupernerdSam, $ffff
	person_event SPRITE_SUPER_NERD, 16, 35, $a, $0, 255, 255, $b2, 4, TrainerSupernerdTom, $ffff
	person_event SPRITE_FRUIT_TREE, 9, 37, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x6c06c, $ffff
; 0x6c349
