UnionCaveB1F_MapScriptHeader: ; 0x59fc4
	; trigger count
	db 0

	; callback count
	db 0
; 0x59fc6

TrainerPokemaniacAndrew: ; 0x59fc6
	; bit/flag number
	dw $4e5

	; trainer group && trainer id
	db POKEMANIAC, ANDREW

	; text when seen
	dw PokemaniacAndrewSeenText

	; text when trainer beaten
	dw PokemaniacAndrewBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokemaniacAndrewScript
; 0x59fd2

PokemaniacAndrewScript: ; 0x59fd2
	talkaftercancel
	loadfont
	writetext UnknownText_0x5a181
	closetext
	loadmovesprites
	end
; 0x59fda

TrainerPokemaniacCalvin: ; 0x59fda
	; bit/flag number
	dw $4e6

	; trainer group && trainer id
	db POKEMANIAC, CALVIN

	; text when seen
	dw PokemaniacCalvinSeenText

	; text when trainer beaten
	dw PokemaniacCalvinBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokemaniacCalvinScript
; 0x59fe6

PokemaniacCalvinScript: ; 0x59fe6
	talkaftercancel
	loadfont
	writetext UnknownText_0x5a230
	closetext
	loadmovesprites
	end
; 0x59fee

TrainerHikerPhillip: ; 0x59fee
	; bit/flag number
	dw $526

	; trainer group && trainer id
	db HIKER, PHILLIP

	; text when seen
	dw HikerPhillipSeenText

	; text when trainer beaten
	dw HikerPhillipBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw HikerPhillipScript
; 0x59ffa

HikerPhillipScript: ; 0x59ffa
	talkaftercancel
	loadfont
	writetext UnknownText_0x5a073
	closetext
	loadmovesprites
	end
; 0x5a002

TrainerHikerLeonard: ; 0x5a002
	; bit/flag number
	dw $527

	; trainer group && trainer id
	db HIKER, LEONARD

	; text when seen
	dw HikerLeonardSeenText

	; text when trainer beaten
	dw HikerLeonardBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw HikerLeonardScript
; 0x5a00e

HikerLeonardScript: ; 0x5a00e
	talkaftercancel
	loadfont
	writetext UnknownText_0x5a0fb
	closetext
	loadmovesprites
	end
; 0x5a016

ItemFragment_0x5a016: ; 0x5a016
	db TM_39, 1
; 0x5a018

ItemFragment_0x5a018: ; 0x5a018
	db X_DEFEND, 1
; 0x5a01a

BoulderScript_0x5a01a: ; 0x5a01a
	jumpstd strengthboulder
; 0x5a01d

HikerPhillipSeenText: ; 0x5a01d
	text "It's been a while"
	line "since I last saw"
	cont "another person."

	para "Don't be shy."
	line "Let's battle!"
	done
; 0x5a06a

HikerPhillipBeatenText: ; 0x5a06a
	text "Uurggh…"
	done
; 0x5a073

UnknownText_0x5a073: ; 0x5a073
	text "I've been lost for"
	line "a long time…"

	para "I don't mind it"
	line "here, but I am"
	cont "soooo hungry!"
	done
; 0x5a0bf

HikerLeonardSeenText: ; 0x5a0bf
	text "What do you know!"
	line "A visitor!"
	done
; 0x5a0dd

HikerLeonardBeatenText: ; 0x5a0dd
	text "Wahahah! You're a"
	line "feisty one!"
	done
; 0x5a0fb

UnknownText_0x5a0fb: ; 0x5a0fb
	text "I live down here."

	para "You can, too, if"
	line "you'd like."

	para "There's plenty of"
	line "room, you see."
	done
; 0x5a14a

PokemaniacAndrewSeenText: ; 0x5a14a
	text "Who's there?"

	para "Leave me and my"
	line "#MON alone!"
	done
; 0x5a173

PokemaniacAndrewBeatenText: ; 0x5a173
	text "Go…"
	line "Go away!"
	done
; 0x5a181

UnknownText_0x5a181: ; 0x5a181
	text "Just me and my"
	line "#MON. I'm de-"
	cont "lirious with joy."
	done
; 0x5a1b0

PokemaniacCalvinSeenText: ; 0x5a1b0
	text "I came all the way"
	line "here to conduct my"
	cont "#MON research."

	para "Let me demonstrate"
	line "my findings in a"
	cont "real battle!"
	done
; 0x5a217

PokemaniacCalvinBeatenText: ; 0x5a217
	text "You demonstrated"
	line "on me!"
	done
; 0x5a230

UnknownText_0x5a230: ; 0x5a230
	text "I should compile"
	line "and announce my"
	cont "study findings."

	para "I might even be-"
	line "come famous like"
	cont "PROF.ELM."
	done
; 0x5a28e

UnionCaveB1F_MapEventHeader: ; 0x5a28e
	; filler
	db 0, 0

	; warps
	db 5
	warp_def $3, $3, 7, GROUP_RUINS_OF_ALPH_OUTSIDE, MAP_RUINS_OF_ALPH_OUTSIDE
	warp_def $b, $3, 8, GROUP_RUINS_OF_ALPH_OUTSIDE, MAP_RUINS_OF_ALPH_OUTSIDE
	warp_def $13, $7, 1, GROUP_UNION_CAVE_1F, MAP_UNION_CAVE_1F
	warp_def $21, $3, 2, GROUP_UNION_CAVE_1F, MAP_UNION_CAVE_1F
	warp_def $1f, $11, 1, GROUP_UNION_CAVE_B2F, MAP_UNION_CAVE_B2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 7
	person_event SPRITE_POKEFAN_M, 8, 13, $a, $0, 255, 255, $b2, 3, TrainerHikerPhillip, $ffff
	person_event SPRITE_POKEFAN_M, 11, 20, $6, $0, 255, 255, $b2, 3, TrainerHikerLeonard, $ffff
	person_event SPRITE_SUPER_NERD, 36, 9, $8, $0, 255, 255, $92, 3, TrainerPokemaniacAndrew, $ffff
	person_event SPRITE_SUPER_NERD, 34, 21, $8, $0, 255, 255, $92, 3, TrainerPokemaniacCalvin, $ffff
	person_event SPRITE_POKE_BALL, 20, 6, $1, $0, 255, 255, $1, 0, ItemFragment_0x5a016, $065e
	person_event SPRITE_BOULDER, 14, 11, $19, $0, 255, 255, $0, 0, BoulderScript_0x5a01a, $ffff
	person_event SPRITE_POKE_BALL, 27, 21, $1, $0, 255, 255, $1, 0, ItemFragment_0x5a018, $065f
; 0x5a308
