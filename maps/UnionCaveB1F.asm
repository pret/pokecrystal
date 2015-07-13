UnionCaveB1F_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

TrainerPokemaniacAndrew:
	; bit/flag number
	dw EVENT_BEAT_POKEMANIAC_ANDREW

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

PokemaniacAndrewScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x5a181
	closetext
	loadmovesprites
	end

TrainerPokemaniacCalvin:
	; bit/flag number
	dw EVENT_BEAT_POKEMANIAC_CALVIN

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

PokemaniacCalvinScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x5a230
	closetext
	loadmovesprites
	end

TrainerHikerPhillip:
	; bit/flag number
	dw EVENT_BEAT_HIKER_PHILLIP

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

HikerPhillipScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x5a073
	closetext
	loadmovesprites
	end

TrainerHikerLeonard:
	; bit/flag number
	dw EVENT_BEAT_HIKER_LEONARD

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

HikerLeonardScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x5a0fb
	closetext
	loadmovesprites
	end

ItemFragment_0x5a016:
	db TM_SWIFT, 1

ItemFragment_0x5a018:
	db X_DEFEND, 1

UnionCaveB1FBoulder:
	jumpstd strengthboulder

HikerPhillipSeenText:
	text "It's been a while"
	line "since I last saw"
	cont "another person."

	para "Don't be shy."
	line "Let's battle!"
	done

HikerPhillipBeatenText:
	text "Uurggh…"
	done

UnknownText_0x5a073:
	text "I've been lost for"
	line "a long time…"

	para "I don't mind it"
	line "here, but I am"
	cont "soooo hungry!"
	done

HikerLeonardSeenText:
	text "What do you know!"
	line "A visitor!"
	done

HikerLeonardBeatenText:
	text "Wahahah! You're a"
	line "feisty one!"
	done

UnknownText_0x5a0fb:
	text "I live down here."

	para "You can, too, if"
	line "you'd like."

	para "There's plenty of"
	line "room, you see."
	done

PokemaniacAndrewSeenText:
	text "Who's there?"

	para "Leave me and my"
	line "#MON alone!"
	done

PokemaniacAndrewBeatenText:
	text "Go…"
	line "Go away!"
	done

UnknownText_0x5a181:
	text "Just me and my"
	line "#MON. I'm de-"
	cont "lirious with joy."
	done

PokemaniacCalvinSeenText:
	text "I came all the way"
	line "here to conduct my"
	cont "#MON research."

	para "Let me demonstrate"
	line "my findings in a"
	cont "real battle!"
	done

PokemaniacCalvinBeatenText:
	text "You demonstrated"
	line "on me!"
	done

UnknownText_0x5a230:
	text "I should compile"
	line "and announce my"
	cont "study findings."

	para "I might even be-"
	line "come famous like"
	cont "PROF.ELM."
	done

UnionCaveB1F_MapEventHeader:
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
	person_event SPRITE_POKEFAN_M, 8, 13, $a, $0, 255, 255, $b2, 3, TrainerHikerPhillip, -1
	person_event SPRITE_POKEFAN_M, 11, 20, $6, $0, 255, 255, $b2, 3, TrainerHikerLeonard, -1
	person_event SPRITE_SUPER_NERD, 36, 9, $8, $0, 255, 255, $92, 3, TrainerPokemaniacAndrew, -1
	person_event SPRITE_SUPER_NERD, 34, 21, $8, $0, 255, 255, $92, 3, TrainerPokemaniacCalvin, -1
	person_event SPRITE_POKE_BALL, 20, 6, $1, $0, 255, 255, $1, 0, ItemFragment_0x5a016, EVENT_65E
	person_event SPRITE_BOULDER, 14, 11, $19, $0, 255, 255, $0, 0, UnionCaveB1FBoulder, -1
	person_event SPRITE_POKE_BALL, 27, 21, $1, $0, 255, 255, $1, 0, ItemFragment_0x5a018, EVENT_65F
