MrPokemonsHouse_MapScriptHeader: ; 0x196e47
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x196e51, $0000
	dw UnknownScript_0x196e55, $0000

	; callback count
	db 0
; 0x196e51

UnknownScript_0x196e51: ; 0x196e51
	priorityjump UnknownScript_0x196e56
	end
; 0x196e55

UnknownScript_0x196e55: ; 0x196e55
	end
; 0x196e56

UnknownScript_0x196e56: ; 0x196e56
	showemote $0, $2, 15
	spriteface $2, $0
	loadfont
	2writetext UnknownText_0x196f66
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x196f5a
	loadfont
	2writetext UnknownText_0x196fa8
	keeptextopen
	waitbutton
	giveitem MYSTERY_EGG, $1
	2writetext UnknownText_0x196fd2
	playsound $0091
	waitbutton
	itemnotify
	setbit1 EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	blackoutmod GROUP_CHERRYGROVE_CITY, MAP_CHERRYGROVE_CITY
	2writetext UnknownText_0x196feb
	keeptextopen
	spriteface $2, $3
	2writetext UnknownText_0x197092
	keeptextopen
	spriteface $2, $0
	spriteface $3, $2
	2writetext UnknownText_0x1970b7
	closetext
	loadmovesprites
	2jump UnknownScript_0x196ec9
; 0x196e97

GentlemanScript_0x196e97: ; 0x196e97
	faceplayer
	loadfont
	checkitem RED_SCALE
	iftrue UnknownScript_0x196eb0
	checkbit1 EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue UnknownScript_0x196eaa
	2writetext UnknownText_0x197134
	closetext
	loadmovesprites
	end
; 0x196eaa

UnknownScript_0x196eaa: ; 0x196eaa
	2writetext UnknownText_0x19714a
	closetext
	loadmovesprites
	end
; 0x196eb0

UnknownScript_0x196eb0: ; 0x196eb0
	2writetext UnknownText_0x197476
	yesorno
	iffalse UnknownScript_0x196ec3
	verbosegiveitem EXP_SHARE, 1
	iffalse UnknownScript_0x196ec7
	takeitem RED_SCALE, 1
	2jump UnknownScript_0x196eaa
; 0x196ec3

UnknownScript_0x196ec3: ; 0x196ec3
	2writetext UnknownText_0x19750d
	closetext
UnknownScript_0x196ec7: ; 0x196ec7
	loadmovesprites
	end
; 0x196ec9

UnknownScript_0x196ec9: ; 0x196ec9
	playmusic $001e
	applymovement $3, MovementData_0x196f5d
	spriteface $0, $3
	loadfont
	2writetext UnknownText_0x197185
	keeptextopen
	waitbutton
	2writetext UnknownText_0x1973cc
	playsound $0001
	waitbutton
	setbit2 $000b
	2writetext UnknownText_0x1973de
	closetext
	loadmovesprites
	spriteface $0, $0
	applymovement $3, MovementData_0x196f61
	playsound $0023
	disappear $3
	waitbutton
	special $003d
	pause 15
	spriteface $0, $1
	loadfont
	2writetext UnknownText_0x1970ed
	closetext
	loadmovesprites
	special $0030
	special $0033
	playmusic $000d
	special $009d
	special $001b
	pause 60
	special $0032
	special $003d
	loadfont
	2writetext UnknownText_0x197134
	closetext
	loadmovesprites
	setbit1 $06bd
	setbit1 $0792
	clearbit1 $0793
	dotrigger $1
	domaptrigger GROUP_CHERRYGROVE_CITY, MAP_CHERRYGROVE_CITY, $1
	domaptrigger GROUP_ELMS_LAB, MAP_ELMS_LAB, $3
	specialphonecall $2
	clearbit1 $0702
	checkbit1 EVENT_GOT_TOTODILE_FROM_ELM
	iftrue UnknownScript_0x196f49
	checkbit1 EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue UnknownScript_0x196f4d
	setbit1 $0641
	end
; 0x196f49

UnknownScript_0x196f49: ; 0x196f49
	setbit1 $0642
	end
; 0x196f4d

UnknownScript_0x196f4d: ; 0x196f4d
	setbit1 $0640
	end
; 0x196f51

MapMrPokemonsHouseSignpost1Script: ; 0x196f51
	jumptext UnknownText_0x197543
; 0x196f54

MapMrPokemonsHouseSignpost3Script: ; 0x196f54
	jumptext UnknownText_0x197584
; 0x196f57

MapMrPokemonsHouseSignpost4Script: ; 0x196f57
	jumptext UnknownText_0x1975ac
; 0x196f5a

MovementData_0x196f5a: ; 0x196f5a
	step_right
	step_up
	step_end
; 0x196f5d

MovementData_0x196f5d: ; 0x196f5d
	step_down
	step_left
	step_left
	step_end
; 0x196f61

MovementData_0x196f61: ; 0x196f61
	step_down
	step_left
	turn_head_down
	db $3f ; movement
	step_end
; 0x196f66

UnknownText_0x196f66: ; 0x196f66
	db $0, "Hello, hello! You", $4f
	db "must be ", $14, ".", $51
	db "PROF.ELM said that", $4f
	db "you would visit.", $57
; 0x196fa8

UnknownText_0x196fa8: ; 0x196fa8
	db $0, "This is what I", $4f
	db "want PROF.ELM to", $55
	db "examine.", $57
; 0x196fd2

UnknownText_0x196fd2: ; 0x196fd2
	db $0, $52, " received", $4f
	db "MYSTERY EGG.", $57
; 0x196feb

UnknownText_0x196feb: ; 0x196feb
	db $0, "I know a couple", $4f
	db "who run a #MON", $55
	db "DAY-CARE service.", $51
	db "They gave me that", $4f
	db "EGG.", $51
	db "I was intrigued,", $4f
	db "so I sent mail to", $55
	db "PROF.ELM.", $51
	db "For #MON evolu-", $4f
	db "tion, PROF.ELM is", $55
	db "the authority.", $57
; 0x197092

UnknownText_0x197092: ; 0x197092
	db $0, "Even PROF.OAK here", $4f
	db "recognizes that.", $57
; 0x1970b7

UnknownText_0x1970b7: ; 0x1970b7
	db $0, "If my assumption", $4f
	db "is correct, PROF.", $55
	db "ELM will know it.", $57
; 0x1970ed

UnknownText_0x1970ed: ; 0x1970ed
	db $0, "You are returning", $4f
	db "to PROF.ELM?", $51
	db "Here. Your #MON", $4f
	db "should have some", $55
	db "rest.", $57
; 0x197134

UnknownText_0x197134: ; 0x197134
	db $0, "I'm depending on", $4f
	db "you!", $57
; 0x19714a

UnknownText_0x19714a: ; 0x19714a
	db $0, "Life is delight-", $4f
	db "ful! Always, new", $51
	db "discoveries to be", $4f
	db "made!", $57
; 0x197185

UnknownText_0x197185: ; 0x197185
	db $0, "OAK: Aha! So", $4f
	db "you're ", $14, "!", $51
	db "I'm OAK! A #MON", $4f
	db "researcher.", $51
	db "I was just visit-", $4f
	db "ing my old friend", $55
	db "MR.#MON.", $51
	db "I heard you were", $4f
	db "running an errand", $51
	db "for PROF.ELM, so I", $4f
	db "waited here.", $51
	db "Oh! What's this?", $4f
	db "A rare #MON!", $51
	db "Let's see…", $51
	db "Hm, I see!", $51
	db "I understand why", $4f
	db "PROF.ELM gave you", $51
	db "a #MON for this", $4f
	db "errand.", $51
	db "To researchers", $4f
	db "like PROF.ELM and", $51
	db "I, #MON are our", $4f
	db "friends.", $51
	db "He saw that you", $4f
	db "would treat your", $51
	db "#MON with love", $4f
	db "and care.", $51
	db "…Ah!", $51
	db "You seem to be", $4f
	db "dependable.", $51
	db "How would you like", $4f
	db "to help me out?", $51
	db "See? This is the", $4f
	db "latest version of", $55
	db "#DEX.", $51
	db "It automatically", $4f
	db "records data on", $51
	db "#MON you've", $4f
	db "seen or caught.", $51
	db "It's a hi-tech", $4f
	db "encyclopedia!", $57
; 0x1973cc

UnknownText_0x1973cc: ; 0x1973cc
	db $0, $52, " received", $4f
	db "#DEX!", $57
; 0x1973de

UnknownText_0x1973de: ; 0x1973de
	db $0, "Go meet many kinds", $4f
	db "of #MON and", $51
	db "complete that", $4f
	db "#DEX!", $51
	db "But I've stayed", $4f
	db "too long.", $51
	db "I have to get to", $4f
	db "GOLDENROD for my", $55
	db "usual radio show.", $51
	db $14, ", I'm", $4f
	db "counting on you!", $57
; 0x197476

UnknownText_0x197476: ; 0x197476
	db $0, "Hm? That SCALE!", $4f
	db "What's that?", $55
	db "A red GYARADOS?", $51
	db "That's rare! ", $4f
	db "I, I want it…", $51
	db $14, ", would you", $4f
	db "care to trade it?", $51
	db "I can offer this", $4f
	db "EXP.SHARE I got", $55
	db "from PROF.OAK.", $57
; 0x19750d

UnknownText_0x19750d: ; 0x19750d
	db $0, "That's disappoint-", $4f
	db "ing. That happens", $55
	db "to be very rare.", $57
; 0x197543

UnknownText_0x197543: ; 0x197543
	db $0, "It's packed with", $4f
	db "foreign magazines.", $51
	db "Can't even read", $4f
	db "their titles…", $57
; 0x197584

UnknownText_0x197584: ; 0x197584
	db $0, "It's a big com-", $4f
	db "puter. Hmm. It's", $55
	db "broken.", $57
; 0x1975ac

UnknownText_0x1975ac: ; 0x1975ac
	db $0, "A whole pile of", $4f
	db "strange coins!", $51
	db "Maybe they're from", $4f
	db "another country…", $57
; 0x1975ef

MrPokemonsHouse_MapEventHeader: ; 0x1975ef
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 2, GROUP_ROUTE_30, MAP_ROUTE_30
	warp_def $7, $3, 2, GROUP_ROUTE_30, MAP_ROUTE_30

	; xy triggers
	db 0

	; signposts
	db 5
	signpost 1, 0, $0, MapMrPokemonsHouseSignpost1Script
	signpost 1, 1, $0, MapMrPokemonsHouseSignpost1Script
	signpost 1, 6, $0, MapMrPokemonsHouseSignpost3Script
	signpost 1, 7, $0, MapMrPokemonsHouseSignpost3Script
	signpost 4, 6, $0, MapMrPokemonsHouseSignpost4Script

	; people-events
	db 2
	person_event SPRITE_GENTLEMAN, 9, 7, $9, $0, 255, 255, $0, 0, GentlemanScript_0x196e97, $ffff
	person_event SPRITE_OAK, 9, 10, $7, $0, 255, 255, $0, 0, ObjectEvent, $06c9
; 0x197632

