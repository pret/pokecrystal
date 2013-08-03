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
	2writetext UnknownText_0x5a181
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
	2writetext UnknownText_0x5a230
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
	2writetext UnknownText_0x5a073
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
	2writetext UnknownText_0x5a0fb
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
	jumpstd $000e
; 0x5a01d

HikerPhillipSeenText: ; 0x5a01d
	db $0, "It's been a while", $4f
	db "since I last saw", $55
	db "another person.", $51
	db "Don't be shy.", $4f
	db "Let's battle!", $57
; 0x5a06a

HikerPhillipBeatenText: ; 0x5a06a
	db $0, "Uurggh…", $57
; 0x5a073

UnknownText_0x5a073: ; 0x5a073
	db $0, "I've been lost for", $4f
	db "a long time…", $51
	db "I don't mind it", $4f
	db "here, but I am", $55
	db "soooo hungry!", $57
; 0x5a0bf

HikerLeonardSeenText: ; 0x5a0bf
	db $0, "What do you know!", $4f
	db "A visitor!", $57
; 0x5a0dd

HikerLeonardBeatenText: ; 0x5a0dd
	db $0, "Wahahah! You're a", $4f
	db "feisty one!", $57
; 0x5a0fb

UnknownText_0x5a0fb: ; 0x5a0fb
	db $0, "I live down here.", $51
	db "You can, too, if", $4f
	db "you'd like.", $51
	db "There's plenty of", $4f
	db "room, you see.", $57
; 0x5a14a

PokemaniacAndrewSeenText: ; 0x5a14a
	db $0, "Who's there?", $51
	db "Leave me and my", $4f
	db "#MON alone!", $57
; 0x5a173

PokemaniacAndrewBeatenText: ; 0x5a173
	db $0, "Go…", $4f
	db "Go away!", $57
; 0x5a181

UnknownText_0x5a181: ; 0x5a181
	db $0, "Just me and my", $4f
	db "#MON. I'm de-", $55
	db "lirious with joy.", $57
; 0x5a1b0

PokemaniacCalvinSeenText: ; 0x5a1b0
	db $0, "I came all the way", $4f
	db "here to conduct my", $55
	db "#MON research.", $51
	db "Let me demonstrate", $4f
	db "my findings in a", $55
	db "real battle!", $57
; 0x5a217

PokemaniacCalvinBeatenText: ; 0x5a217
	db $0, "You demonstrated", $4f
	db "on me!", $57
; 0x5a230

UnknownText_0x5a230: ; 0x5a230
	db $0, "I should compile", $4f
	db "and announce my", $55
	db "study findings.", $51
	db "I might even be-", $4f
	db "come famous like", $55
	db "PROF.ELM.", $57
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

