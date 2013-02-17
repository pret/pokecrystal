Route2_MapScriptHeader: ; 0x1ac2ba
	; trigger count
	db 0

	; callback count
	db 0
; 0x1ac2bc

TrainerBug_catcherRob: ; 0x1ac2bc
	; bit/flag number
	dw $539

	; trainer group && trainer id
	db BUG_CATCHER, ROB

	; text when seen
	dw Bug_catcherRobSeenText

	; text when trainer beaten
	dw Bug_catcherRobBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bug_catcherRobScript
; 0x1ac2c8

Bug_catcherRobScript: ; 0x1ac2c8
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1ac34d
	closetext
	loadmovesprites
	end
; 0x1ac2d0

TrainerBug_catcherEd: ; 0x1ac2d0
	; bit/flag number
	dw $53a

	; trainer group && trainer id
	db BUG_CATCHER, ED

	; text when seen
	dw Bug_catcherEdSeenText

	; text when trainer beaten
	dw Bug_catcherEdBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bug_catcherEdScript
; 0x1ac2dc

Bug_catcherEdScript: ; 0x1ac2dc
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1ac3cf
	closetext
	loadmovesprites
	end
; 0x1ac2e4

TrainerBug_catcherDoug: ; 0x1ac2e4
	; bit/flag number
	dw $543

	; trainer group && trainer id
	db BUG_CATCHER, DOUG

	; text when seen
	dw Bug_catcherDougSeenText

	; text when trainer beaten
	dw Bug_catcherDougBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bug_catcherDougScript
; 0x1ac2f0

Bug_catcherDougScript: ; 0x1ac2f0
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1ac423
	closetext
	loadmovesprites
	end
; 0x1ac2f8

MapRoute2Signpost0Script: ; 0x1ac2f8
	jumptext UnknownText_0x1ac47a
; 0x1ac2fb

MapRoute2Signpost1Script: ; 0x1ac2fb
	jumptext UnknownText_0x1ac49f
; 0x1ac2fe

ItemFragment_0x1ac2fe: ; 0x1ac2fe
	db DIRE_HIT, 1
; 0x1ac300

ItemFragment_0x1ac300: ; 0x1ac300
	db MAX_POTION, 1
; 0x1ac302

ItemFragment_0x1ac302: ; 0x1ac302
	db CARBOS, 1
; 0x1ac304

ItemFragment_0x1ac304: ; 0x1ac304
	db ELIXER, 1
; 0x1ac306

UnknownScript_0x1ac306: ; 0x1ac306
	fruittree $19
; 0x1ac308

MapRoute2SignpostItem2: ; 0x1ac308
	dw $00ed
	db MAX_ETHER
	
; 0x1ac30b

MapRoute2SignpostItem3: ; 0x1ac30b
	dw $00ee
	db FULL_HEAL
	
; 0x1ac30e

MapRoute2SignpostItem4: ; 0x1ac30e
	dw $00ef
	db FULL_RESTORE
	
; 0x1ac311

MapRoute2SignpostItem5: ; 0x1ac311
	dw $00f0
	db REVIVE
	
; 0x1ac314

Bug_catcherRobSeenText: ; 0x1ac314
	db $0, "My bug #MON are", $4f
	db "tough. Prepare to", $55
	db "lose!", $57
; 0x1ac33d

Bug_catcherRobBeatenText: ; 0x1ac33d
	db $0, "I was whipped…", $57
; 0x1ac34d

UnknownText_0x1ac34d: ; 0x1ac34d
	db $0, "I'm going to look", $4f
	db "for stronger bug", $55
	db "#MON.", $57
; 0x1ac376

Bug_catcherEdSeenText: ; 0x1ac376
	db $0, "If you walk in", $4f
	db "tall grass wearing", $51
	db "shorts, do you get", $4f
	db "nicks and cuts?", $57
; 0x1ac3bc

Bug_catcherEdBeatenText: ; 0x1ac3bc
	db $0, "Ouch, ouch, ouch!", $57
; 0x1ac3cf

UnknownText_0x1ac3cf: ; 0x1ac3cf
	db $0, "They'll really", $4f
	db "sting when you", $55
	db "take a bath.", $57
; 0x1ac3fa

Bug_catcherDougSeenText: ; 0x1ac3fa
	db $0, "Why don't girls", $4f
	db "like bug #MON?", $57
; 0x1ac419

Bug_catcherDougBeatenText: ; 0x1ac419
	db $0, "No good!", $57
; 0x1ac423

UnknownText_0x1ac423: ; 0x1ac423
	db $0, "Bug #MON squish", $4f
	db "like plush toys", $51
	db "when you squeeze", $4f
	db "their bellies.", $51
	db "I love how they", $4f
	db "feel!", $57
; 0x1ac47a

UnknownText_0x1ac47a: ; 0x1ac47a
	db $0, "ROUTE 2", $51
	db "VIRIDIAN CITY -", $4f
	db "PEWTER CITY", $57
; 0x1ac49f

UnknownText_0x1ac49f: ; 0x1ac49f
	db $0, "DIGLETT'S CAVE", $57
; 0x1ac4af

Route2_MapEventHeader: ; 0x1ac4af
	; filler
	db 0, 0

	; warps
	db 5
	warp_def $f, $f, 1, GROUP_ROUTE_2_NUGGET_SPEECH_HOUSE, MAP_ROUTE_2_NUGGET_SPEECH_HOUSE
	warp_def $1f, $f, 3, GROUP_ROUTE_2_GATE, MAP_ROUTE_2_GATE
	warp_def $1b, $10, 1, GROUP_ROUTE_2_GATE, MAP_ROUTE_2_GATE
	warp_def $1b, $11, 2, GROUP_ROUTE_2_GATE, MAP_ROUTE_2_GATE
	warp_def $7, $c, 3, GROUP_DIGLETTS_CAVE, MAP_DIGLETTS_CAVE

	; xy triggers
	db 0

	; signposts
	db 6
	signpost 51, 7, $0, MapRoute2Signpost0Script
	signpost 9, 11, $0, MapRoute2Signpost1Script
	signpost 23, 7, $7, MapRoute2SignpostItem2
	signpost 14, 4, $7, MapRoute2SignpostItem3
	signpost 27, 4, $7, MapRoute2SignpostItem4
	signpost 30, 11, $7, MapRoute2SignpostItem5

	; people-events
	db 8
	person_event $25, 49, 14, $8, $0, 255, 255, $b2, 5, TrainerBug_catcherRob, $ffff
	person_event $25, 8, 10, $1f, $0, 255, 255, $b2, 3, TrainerBug_catcherEd, $ffff
	person_event $25, 44, 4, $9, $0, 255, 255, $b2, 3, TrainerBug_catcherDoug, $ffff
	person_event $54, 33, 4, $1, $0, 255, 255, $1, 0, ItemFragment_0x1ac2fe, $0783
	person_event $54, 27, 6, $1, $0, 255, 255, $1, 0, ItemFragment_0x1ac300, $0784
	person_event $54, 6, 23, $1, $0, 255, 255, $1, 0, ItemFragment_0x1ac302, $0785
	person_event $54, 54, 18, $1, $0, 255, 255, $1, 0, ItemFragment_0x1ac304, $0786
	person_event $5d, 18, 14, $1, $0, 255, 255, $0, 0, UnknownScript_0x1ac306, $ffff
; 0x1ac554

