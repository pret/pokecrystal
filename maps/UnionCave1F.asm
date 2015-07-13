UnionCave1F_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

TrainerPokemaniacLarry:
	; bit/flag number
	dw EVENT_BEAT_POKEMANIAC_LARRY

	; trainer group && trainer id
	db POKEMANIAC, LARRY

	; text when seen
	dw PokemaniacLarrySeenText

	; text when trainer beaten
	dw PokemaniacLarryBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokemaniacLarryScript

PokemaniacLarryScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x59d31
	closetext
	loadmovesprites
	end

TrainerHikerRussell:
	; bit/flag number
	dw EVENT_BEAT_HIKER_RUSSELL

	; trainer group && trainer id
	db HIKER, RUSSELL

	; text when seen
	dw HikerRussellSeenText

	; text when trainer beaten
	dw HikerRussellBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw HikerRussellScript

HikerRussellScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x59c6c
	closetext
	loadmovesprites
	end

TrainerHikerDaniel:
	; bit/flag number
	dw EVENT_BEAT_HIKER_DANIEL

	; trainer group && trainer id
	db HIKER, DANIEL

	; text when seen
	dw HikerDanielSeenText

	; text when trainer beaten
	dw HikerDanielBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw HikerDanielScript

HikerDanielScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x59dc9
	closetext
	loadmovesprites
	end

TrainerFirebreatherBill:
	; bit/flag number
	dw EVENT_BEAT_FIREBREATHER_BILL

	; trainer group && trainer id
	db FIREBREATHER, BILL

	; text when seen
	dw FirebreatherBillSeenText

	; text when trainer beaten
	dw FirebreatherBillBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw FirebreatherBillScript

FirebreatherBillScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x59e6f
	closetext
	loadmovesprites
	end

TrainerFirebreatherRay:
	; bit/flag number
	dw EVENT_BEAT_FIREBREATHER_RAY

	; trainer group && trainer id
	db FIREBREATHER, RAY

	; text when seen
	dw FirebreatherRaySeenText

	; text when trainer beaten
	dw FirebreatherRayBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw FirebreatherRayScript

FirebreatherRayScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x59efc
	closetext
	loadmovesprites
	end

ItemFragment_0x59c00:
	db GREAT_BALL, 1

ItemFragment_0x59c02:
	db X_ATTACK, 1

ItemFragment_0x59c04:
	db POTION, 1

ItemFragment_0x59c06:
	db AWAKENING, 1

UnknownScript_0x59c08:
	jumptext UnknownText_0x59f29

HikerRussellSeenText:
	text "You're headed to"
	line "AZALEA, are you?"

	para "Let my #MON see"
	line "if you are good"
	cont "enough to battle."
	done

HikerRussellBeatenText:
	text "Oh, oh, oh!"
	done

UnknownText_0x59c6c:
	text "All right, then!"
	line "I've decided."

	para "I'm not leaving"
	line "until my #MON"
	cont "get tougher!"
	done

PokemaniacLarrySeenText:
	text "I roam far and"
	line "wide in search of"
	cont "#MON."

	para "Are you looking"
	line "for #MON too?"

	para "Then you're my"
	line "collecting rival!"
	done

PokemaniacLarryBeatenText:
	text "Ugh. My poor #-"
	line "MON…"
	done

UnknownText_0x59d31:
	text "Every Friday, you"
	line "can hear #MON"

	para "roars from deep"
	line "inside the cave."
	done

HikerDanielSeenText:
	text "Whoa! What a"
	line "surprise!"

	para "I didn't expect to"
	line "see anyone here!"
	done

HikerDanielBeatenText:
	text "Whoa! I'm beaten"
	line "big time!"
	done

UnknownText_0x59dc9:
	text "I was conned into"
	line "buying a SLOWPOKE-"
	cont "TAIL."

	para "I feel sorry for"
	line "the poor #MON."
	done

FirebreatherBillSeenText:
	text "ZUBAT's SUPERSONIC"
	line "keeps confusing"
	cont "my #MON."

	para "I'm seriously"
	line "upset about that!"
	done

FirebreatherBillBeatenText:
	text "I flamed out!"
	done

UnknownText_0x59e6f:
	text "On weekends, you"
	line "can hear strange"

	para "roars from deep in"
	line "the cave."
	done

FirebreatherRaySeenText:
	text "If it's light, a"
	line "cave isn't scary."

	para "If you're strong,"
	line "#MON aren't"
	cont "scary."
	done

FirebreatherRayBeatenText:
	text "FLASH!"
	done

UnknownText_0x59efc:
	text "It's my #MON's"
	line "fire that lights"
	cont "up this cave."
	done

UnknownText_0x59f29:
	text "UNION CAVE"
	done

UnionCave1F_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $13, $5, 3, GROUP_UNION_CAVE_B1F, MAP_UNION_CAVE_B1F
	warp_def $21, $3, 4, GROUP_UNION_CAVE_B1F, MAP_UNION_CAVE_B1F
	warp_def $1f, $11, 1, GROUP_ROUTE_33, MAP_ROUTE_33
	warp_def $3, $11, 4, GROUP_ROUTE_32, MAP_ROUTE_32

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 9
	person_event SPRITE_POKEFAN_M, 10, 7, $9, $0, 255, 255, $b2, 2, TrainerHikerDaniel, -1
	person_event SPRITE_SUPER_NERD, 25, 8, $a, $0, 255, 255, $92, 3, TrainerPokemaniacLarry, -1
	person_event SPRITE_POKEFAN_M, 12, 15, $a, $0, 255, 255, $b2, 1, TrainerHikerRussell, -1
	person_event SPRITE_FISHER, 31, 19, $8, $0, 255, 255, $82, 4, TrainerFirebreatherRay, -1
	person_event SPRITE_FISHER, 23, 18, $7, $0, 255, 255, $82, 4, TrainerFirebreatherBill, -1
	person_event SPRITE_POKE_BALL, 25, 21, $1, $0, 255, 255, $1, 0, ItemFragment_0x59c00, EVENT_65A
	person_event SPRITE_POKE_BALL, 6, 8, $1, $0, 255, 255, $1, 0, ItemFragment_0x59c02, EVENT_65B
	person_event SPRITE_POKE_BALL, 21, 8, $1, $0, 255, 255, $1, 0, ItemFragment_0x59c04, EVENT_65C
	person_event SPRITE_POKE_BALL, 37, 16, $1, $0, 255, 255, $1, 0, ItemFragment_0x59c06, EVENT_65D
