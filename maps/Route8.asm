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
	2writetext UnknownText_0x6c0c8
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
	2writetext UnknownText_0x6c143
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
	2writetext UnknownText_0x6c1a3
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
	2writetext UnknownText_0x6c219
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
	2writetext UnknownText_0x6c27e
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
	db $0, "We're the KANTO", $4f
	db "#MON FEDERATION", $55
	db "trainer group.", $51
	db "We'll drive you", $4f
	db "under our wheels!", $57
; 0x6c0be

BikerDwayneBeatenText: ; 0x6c0be
	db $0, "S-sorry!", $57
; 0x6c0c8

UnknownText_0x6c0c8: ; 0x6c0c8
	db $0, "The KANTO #MON", $4f
	db "FEDERATION will", $55
	db "never fall!", $57
; 0x6c0f4

BikerHarrisSeenText: ; 0x6c0f4
	db $0, "The cops shut down", $4f
	db "our UNDERGROUND", $51
	db "PATH! That really", $4f
	db "fries me!", $57
; 0x6c134

BikerHarrisBeatenText: ; 0x6c134
	db $0, "F-forgive me!", $57
; 0x6c143

UnknownText_0x6c143: ; 0x6c143
	db $0, "Wiped out by some", $4f
	db "punk from JOHTO…", $57
; 0x6c167

BikerZekeSeenText: ; 0x6c167
	db $0, "We're the KANTO", $4f
	db "#MON FEDERA-", $55
	db "TION!", $55
	db "Right on!", $57
; 0x6c194

BikerZekeBeatenText: ; 0x6c194
	db $0, "Yikes! Sorry!", $57
; 0x6c1a3

UnknownText_0x6c1a3: ; 0x6c1a3
	db $0, "We'll try not to", $4f
	db "disturb anyone", $55
	db "from now on…", $57
; 0x6c1d0

SupernerdSamSeenText: ; 0x6c1d0
	db $0, "How does the MAG-", $4f
	db "NET TRAIN work?", $57
; 0x6c1f3

SupernerdSamBeatenText: ; 0x6c1f3
	db $0, "I just want to see", $4f
	db "the MAGNET TRAIN…", $57
; 0x6c219

UnknownText_0x6c219: ; 0x6c219
	db $0, "The power of mag-", $4f
	db "nets is awesome!", $57
; 0x6c23d

SupernerdTomSeenText: ; 0x6c23d
	db $0, "Hm… You've got", $4f
	db "many GYM BADGES.", $57
; 0x6c25d

SupernerdTomBeatenText: ; 0x6c25d
	db $0, "Just as I thought…", $4f
	db "You're tough!", $57
; 0x6c27e

UnknownText_0x6c27e: ; 0x6c27e
	db $0, "GYM BADGES give", $4f
	db "you advantages in", $55
	db "battles.", $57
; 0x6c2aa

UnknownText_0x6c2aa: ; 0x6c2aa
	db $0, "It's locked…", $57
; 0x6c2b7

UnknownText_0x6c2b7: ; 0x6c2b7
	db $0, "The flyer's torn.", $51
	db "It's impossible to", $4f
	db "read…", $57
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

