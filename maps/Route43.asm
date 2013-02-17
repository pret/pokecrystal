Route43_MapScriptHeader: ; 0x19d04c
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x19d051
; 0x19d051

UnknownScript_0x19d051: ; 0x19d051
	checkbit1 $0022
	iftrue UnknownScript_0x19d05c
	domaptrigger GROUP_ROUTE_43_GATE, MAP_ROUTE_43_GATE, $0
	return
; 0x19d05c

UnknownScript_0x19d05c: ; 0x19d05c
	domaptrigger GROUP_ROUTE_43_GATE, MAP_ROUTE_43_GATE, $1
	return
; 0x19d061

TrainerCamperSpencer: ; 0x19d061
	; bit/flag number
	dw $42c

	; trainer group && trainer id
	db CAMPER, SPENCER

	; text when seen
	dw CamperSpencerSeenText

	; text when trainer beaten
	dw CamperSpencerBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CamperSpencerScript
; 0x19d06d

CamperSpencerScript: ; 0x19d06d
	talkaftercancel
	loadfont
	2writetext UnknownText_0x19d57e
	closetext
	loadmovesprites
	end
; 0x19d075

TrainerPokemaniacBen: ; 0x19d075
	; bit/flag number
	dw $4e8

	; trainer group && trainer id
	db POKEMANIAC, BEN

	; text when seen
	dw PokemaniacBenSeenText

	; text when trainer beaten
	dw PokemaniacBenBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokemaniacBenScript
; 0x19d081

PokemaniacBenScript: ; 0x19d081
	talkaftercancel
	loadfont
	2writetext UnknownText_0x19d2d2
	closetext
	loadmovesprites
	end
; 0x19d089

TrainerPokemaniacBrent1: ; 0x19d089
	; bit/flag number
	dw $4e9

	; trainer group && trainer id
	db POKEMANIAC, BRENT1

	; text when seen
	dw PokemaniacBrent1SeenText

	; text when trainer beaten
	dw PokemaniacBrent1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokemaniacBrent1Script
; 0x19d095

PokemaniacBrent1Script: ; 0x19d095
	writecode $17, $1e
	talkaftercancel
	loadfont
	checkbit2 $0077
	iftrue UnknownScript_0x19d0cf
	checkcellnum $1e
	iftrue UnknownScript_0x19d138
	checkbit1 $0291
	iftrue UnknownScript_0x19d0b8
	2writetext UnknownText_0x19d359
	keeptextopen
	setbit1 $0291
	2call UnknownScript_0x19d12c
	2jump UnknownScript_0x19d0bb
; 0x19d0b8

UnknownScript_0x19d0b8: ; 0x19d0b8
	2call UnknownScript_0x19d130
UnknownScript_0x19d0bb: ; 0x19d0bb
	askforphonenumber $1e
	if_equal $1, UnknownScript_0x19d140
	if_equal $2, UnknownScript_0x19d13c
	trainertotext POKEMANIAC, BRENT1, $0
	2call UnknownScript_0x19d134
	2jump UnknownScript_0x19d138
; 0x19d0cf

UnknownScript_0x19d0cf: ; 0x19d0cf
	2call UnknownScript_0x19d144
	winlosstext PokemaniacBrent1BeatenText, $0000
	copybytetovar $da07
	if_equal $3, UnknownScript_0x19d0ea
	if_equal $2, UnknownScript_0x19d0f0
	if_equal $1, UnknownScript_0x19d0f6
	if_equal $0, UnknownScript_0x19d0fc
UnknownScript_0x19d0ea: ; 0x19d0ea
	checkbit1 $00cd
	iftrue UnknownScript_0x19d123
UnknownScript_0x19d0f0: ; 0x19d0f0
	checkbit1 $0044
	iftrue UnknownScript_0x19d116
UnknownScript_0x19d0f6: ; 0x19d0f6
	checkbit1 $0022
	iftrue UnknownScript_0x19d109
UnknownScript_0x19d0fc: ; 0x19d0fc
	loadtrainer POKEMANIAC, BRENT1
	startbattle
	returnafterbattle
	loadvar $da07, $1
	clearbit2 $0077
	end
; 0x19d109

UnknownScript_0x19d109: ; 0x19d109
	loadtrainer POKEMANIAC, BRENT2
	startbattle
	returnafterbattle
	loadvar $da07, $2
	clearbit2 $0077
	end
; 0x19d116

UnknownScript_0x19d116: ; 0x19d116
	loadtrainer POKEMANIAC, BRENT3
	startbattle
	returnafterbattle
	loadvar $da07, $3
	clearbit2 $0077
	end
; 0x19d123

UnknownScript_0x19d123: ; 0x19d123
	loadtrainer POKEMANIAC, BRENT4
	startbattle
	returnafterbattle
	clearbit2 $0077
	end
; 0x19d12c

UnknownScript_0x19d12c: ; 0x19d12c
	jumpstd $0019
	end
; 0x19d130

UnknownScript_0x19d130: ; 0x19d130
	jumpstd $001a
	end
; 0x19d134

UnknownScript_0x19d134: ; 0x19d134
	jumpstd $001b
	end
; 0x19d138

UnknownScript_0x19d138: ; 0x19d138
	jumpstd $001c
	end
; 0x19d13c

UnknownScript_0x19d13c: ; 0x19d13c
	jumpstd $001d
	end
; 0x19d140

UnknownScript_0x19d140: ; 0x19d140
	jumpstd $001e
	end
; 0x19d144

UnknownScript_0x19d144: ; 0x19d144
	jumpstd $001f
	end
; 0x19d148

TrainerPokemaniacRon: ; 0x19d148
	; bit/flag number
	dw $4ea

	; trainer group && trainer id
	db POKEMANIAC, RON

	; text when seen
	dw PokemaniacRonSeenText

	; text when trainer beaten
	dw PokemaniacRonBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokemaniacRonScript
; 0x19d154

PokemaniacRonScript: ; 0x19d154
	talkaftercancel
	loadfont
	2writetext UnknownText_0x19d3f8
	closetext
	loadmovesprites
	end
; 0x19d15c

TrainerFisherMarvin: ; 0x19d15c
	; bit/flag number
	dw $453

	; trainer group && trainer id
	db FISHER, MARVIN

	; text when seen
	dw FisherMarvinSeenText

	; text when trainer beaten
	dw FisherMarvinBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw FisherMarvinScript
; 0x19d168

FisherMarvinScript: ; 0x19d168
	talkaftercancel
	loadfont
	2writetext UnknownText_0x19d4d3
	closetext
	loadmovesprites
	end
; 0x19d170

TrainerPicnickerTiffany3: ; 0x19d170
	; bit/flag number
	dw $491

	; trainer group && trainer id
	db PICNICKER, TIFFANY3

	; text when seen
	dw PicnickerTiffany3SeenText

	; text when trainer beaten
	dw PicnickerTiffany3BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PicnickerTiffany3Script
; 0x19d17c

PicnickerTiffany3Script: ; 0x19d17c
	writecode $17, $1f
	talkaftercancel
	loadfont
	checkbit2 $0078
	iftrue UnknownScript_0x19d1c1
	checkbit2 $0085
	iftrue UnknownScript_0x19d21e
	checkcellnum $1f
	iftrue UnknownScript_0x19d245
	checkpoke CLEFAIRY
	iffalse UnknownScript_0x19d233
	checkbit1 $0293
	iftrue UnknownScript_0x19d1aa
	2writetext UnknownText_0x19d618
	keeptextopen
	setbit1 $0293
	2call UnknownScript_0x19d239
	2jump UnknownScript_0x19d1ad
; 0x19d1aa

UnknownScript_0x19d1aa: ; 0x19d1aa
	2call UnknownScript_0x19d23d
UnknownScript_0x19d1ad: ; 0x19d1ad
	askforphonenumber $1f
	if_equal $1, UnknownScript_0x19d24d
	if_equal $2, UnknownScript_0x19d249
	trainertotext PICNICKER, TIFFANY3, $0
	2call UnknownScript_0x19d241
	2jump UnknownScript_0x19d245
; 0x19d1c1

UnknownScript_0x19d1c1: ; 0x19d1c1
	2call UnknownScript_0x19d251
	winlosstext PicnickerTiffany3BeatenText, $0000
	copybytetovar $da08
	if_equal $3, UnknownScript_0x19d1dc
	if_equal $2, UnknownScript_0x19d1e2
	if_equal $1, UnknownScript_0x19d1e8
	if_equal $0, UnknownScript_0x19d1ee
UnknownScript_0x19d1dc: ; 0x19d1dc
	checkbit1 $00cd
	iftrue UnknownScript_0x19d215
UnknownScript_0x19d1e2: ; 0x19d1e2
	checkbit1 $0044
	iftrue UnknownScript_0x19d208
UnknownScript_0x19d1e8: ; 0x19d1e8
	checkbit1 $0021
	iftrue UnknownScript_0x19d1fb
UnknownScript_0x19d1ee: ; 0x19d1ee
	loadtrainer PICNICKER, TIFFANY3
	startbattle
	returnafterbattle
	loadvar $da08, $1
	clearbit2 $0078
	end
; 0x19d1fb

UnknownScript_0x19d1fb: ; 0x19d1fb
	loadtrainer PICNICKER, TIFFANY1
	startbattle
	returnafterbattle
	loadvar $da08, $2
	clearbit2 $0078
	end
; 0x19d208

UnknownScript_0x19d208: ; 0x19d208
	loadtrainer PICNICKER, TIFFANY2
	startbattle
	returnafterbattle
	loadvar $da08, $3
	clearbit2 $0078
	end
; 0x19d215

UnknownScript_0x19d215: ; 0x19d215
	loadtrainer PICNICKER, TIFFANY4
	startbattle
	returnafterbattle
	clearbit2 $0078
	end
; 0x19d21e

UnknownScript_0x19d21e: ; 0x19d21e
	2call UnknownScript_0x19d255
	verbosegiveitem PINK_BOW, 1
	iffalse UnknownScript_0x19d230
	clearbit2 $0085
	setbit1 $0104
	2jump UnknownScript_0x19d245
; 0x19d230

UnknownScript_0x19d230: ; 0x19d230
	2jump UnknownScript_0x19d259
; 0x19d233

UnknownScript_0x19d233: ; 0x19d233
	2writetext UnknownText_0x19d64b
	closetext
	loadmovesprites
	end
; 0x19d239

UnknownScript_0x19d239: ; 0x19d239
	jumpstd $0023
	end
; 0x19d23d

UnknownScript_0x19d23d: ; 0x19d23d
	jumpstd $0024
	end
; 0x19d241

UnknownScript_0x19d241: ; 0x19d241
	jumpstd $0025
	end
; 0x19d245

UnknownScript_0x19d245: ; 0x19d245
	jumpstd $0026
	end
; 0x19d249

UnknownScript_0x19d249: ; 0x19d249
	jumpstd $0027
	end
; 0x19d24d

UnknownScript_0x19d24d: ; 0x19d24d
	jumpstd $0028
	end
; 0x19d251

UnknownScript_0x19d251: ; 0x19d251
	jumpstd $0029
	end
; 0x19d255

UnknownScript_0x19d255: ; 0x19d255
	jumpstd $002a
	end
; 0x19d259

UnknownScript_0x19d259: ; 0x19d259
	jumpstd $002b
	end
; 0x19d25d

MapRoute43Signpost0Script: ; 0x19d25d
	jumptext UnknownText_0x19d67b
; 0x19d260

MapRoute43Signpost1Script: ; 0x19d260
	jumptext UnknownText_0x19d6a2
; 0x19d263

MapRoute43Signpost2Script: ; 0x19d263
	jumptext UnknownText_0x19d6c9
; 0x19d266

UnknownScript_0x19d266: ; 0x19d266
	fruittree $8
; 0x19d268

ItemFragment_0x19d268: ; 0x19d268
	db MAX_ETHER, 1
; 0x19d26a

PokemaniacBenSeenText: ; 0x19d26a
	db $0, "I love #MON!", $51
	db "That's why I", $4f
	db "started--and why", $51
	db "I'll keep on col-", $4f
	db "lecting #MON!", $57
; 0x19d2b4

PokemaniacBenBeatenText: ; 0x19d2b4
	db $0, "How could you do", $4f
	db "this to me?", $57
; 0x19d2d2

UnknownText_0x19d2d2: ; 0x19d2d2
	db $0, "What else do I", $4f
	db "like besides", $55
	db "#MON?", $51
	db "MARY on the radio.", $4f
	db "I bet she's cute!", $57
; 0x19d319

PokemaniacBrent1SeenText: ; 0x19d319
	db $0, "Hey! Do you have", $4f
	db "any rare #MON?", $57
; 0x19d33a

PokemaniacBrent1BeatenText: ; 0x19d33a
	db $0, "Oh, my poor #-", $4f
	db "MON! Darlings!", $57
; 0x19d359

UnknownText_0x19d359: ; 0x19d359
	db $0, "I'd be happy just", $4f
	db "to own a single", $55
	db "rare #MON.", $57
; 0x19d386

PokemaniacRonSeenText: ; 0x19d386
	db $0, "Would you get", $4f
	db "this?", $51
	db "Some ", $53, " guy", $4f
	db "made fun of my", $55
	db "#MON!", $51
	db "Darn it! My #-", $4f
	db "MON's great!", $57
; 0x19d3d6

PokemaniacRonBeatenText: ; 0x19d3d6
	db $0, "My NIDOKING did", $4f
	db "pretty right on!", $57
; 0x19d3f8

UnknownText_0x19d3f8: ; 0x19d3f8
	db $0, "It's okay for", $4f
	db "people to like", $51
	db "different types", $4f
	db "of #MON.", $51
	db "#MON isn't just", $4f
	db "about having the", $55
	db "most powerful one.", $57
; 0x19d461

FisherMarvinSeenText: ; 0x19d461
	db $0, "I'm in a slump.", $51
	db "Maybe it's the", $4f
	db "gear I'm using.", $51
	db "Let's battle for a", $4f
	db "change of pace!", $57
; 0x19d4b0

FisherMarvinBeatenText: ; 0x19d4b0
	db $0, "I lost, but I feel", $4f
	db "better anyway.", $57
; 0x19d4d3

UnknownText_0x19d4d3: ; 0x19d4d3
	db $0, "KURT's LURE BALL", $4f
	db "is the best for", $51
	db "catching hooked", $4f
	db "#MON.", $51
	db "It's much more", $4f
	db "effective than a", $55
	db "ULTRA BALL.", $57
; 0x19d535

CamperSpencerSeenText: ; 0x19d535
	db $0, "I can do so much", $4f
	db "with my #MON--", $55
	db "it's super-fun!", $57
; 0x19d565

CamperSpencerBeatenText: ; 0x19d565
	db $0, "Losing isn't fun", $4f
	db "at all…", $57
; 0x19d57e

UnknownText_0x19d57e: ; 0x19d57e
	db $0, "What is going on", $4f
	db "at LAKE OF RAGE?", $51
	db "We were planning", $4f
	db "to camp there.", $57
; 0x19d5c1

PicnickerTiffany3SeenText: ; 0x19d5c1
	db $0, "Are you going to", $4f
	db "LAKE OF RAGE too?", $51
	db "Let's play for a ", $4f
	db "little while!", $57
; 0x19d604

PicnickerTiffany3BeatenText: ; 0x19d604
	db $0, "I played too much!", $57
; 0x19d618

UnknownText_0x19d618: ; 0x19d618
	db $0, "I'm having a pic-", $4f
	db "nic with #MON.", $51
	db "Won't you join us?", $57
; 0x19d64b

UnknownText_0x19d64b: ; 0x19d64b
	db $0, "Isn't my CLEFAIRY", $4f
	db "just the most", $55
	db "adorable thing?", $57
; 0x19d67b

UnknownText_0x19d67b: ; 0x19d67b
	db $0, "ROUTE 43", $51
	db "LAKE OF RAGE -", $4f
	db "MAHOGANY TOWN", $57
; 0x19d6a2

UnknownText_0x19d6a2: ; 0x19d6a2
	db $0, "ROUTE 43", $51
	db "LAKE OF RAGE -", $4f
	db "MAHOGANY TOWN", $57
; 0x19d6c9

UnknownText_0x19d6c9: ; 0x19d6c9
	db $0, "TRAINER TIPS", $51
	db "All #MON have", $4f
	db "pros and cons", $51
	db "depending on their", $4f
	db "types.", $51
	db "If their types", $4f
	db "differ, a higher-", $51
	db "level #MON may", $4f
	db "lose in battle.", $51
	db "Learn which types", $4f
	db "are strong and", $51
	db "weak against your", $4f
	db "#MON's type.", $57
; 0x19d78c

Route43_MapEventHeader: ; 0x19d78c
	; filler
	db 0, 0

	; warps
	db 5
	warp_def $33, $9, 1, GROUP_ROUTE_43_MAHOGANY_GATE, MAP_ROUTE_43_MAHOGANY_GATE
	warp_def $33, $a, 2, GROUP_ROUTE_43_MAHOGANY_GATE, MAP_ROUTE_43_MAHOGANY_GATE
	warp_def $23, $11, 3, GROUP_ROUTE_43_GATE, MAP_ROUTE_43_GATE
	warp_def $1f, $11, 1, GROUP_ROUTE_43_GATE, MAP_ROUTE_43_GATE
	warp_def $1f, $12, 2, GROUP_ROUTE_43_GATE, MAP_ROUTE_43_GATE

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 3, 13, $0, MapRoute43Signpost0Script
	signpost 49, 11, $0, MapRoute43Signpost1Script
	signpost 38, 16, $0, MapRoute43Signpost2Script

	; people-events
	db 8
	person_event $2b, 9, 17, $8, $0, 255, 255, $92, 2, TrainerPokemaniacBen, $ffff
	person_event $2b, 24, 17, $a, $0, 255, 255, $92, 3, TrainerPokemaniacBrent1, $ffff
	person_event $2b, 11, 18, $6, $0, 255, 255, $92, 2, TrainerPokemaniacRon, $ffff
	person_event $3a, 20, 8, $9, $0, 255, 255, $a2, 4, TrainerFisherMarvin, $ffff
	person_event $28, 29, 13, $6, $0, 255, 255, $a2, 2, TrainerPicnickerTiffany3, $ffff
	person_event $27, 44, 17, $a, $0, 255, 255, $a2, 3, TrainerCamperSpencer, $ffff
	person_event $5d, 30, 5, $1, $0, 255, 255, $0, 0, UnknownScript_0x19d266, $ffff
	person_event $54, 36, 16, $1, $0, 255, 255, $1, 0, ItemFragment_0x19d268, $06b5
; 0x19d822

