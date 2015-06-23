UnionCave1F_MapScriptHeader: ; 0x59b9a
	; trigger count
	db 0

	; callback count
	db 0
; 0x59b9c

TrainerPokemaniacLarry: ; 0x59b9c
	; bit/flag number
	dw $4e4

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
; 0x59ba8

PokemaniacLarryScript: ; 0x59ba8
	talkaftercancel
	loadfont
	writetext UnknownText_0x59d31
	closetext
	loadmovesprites
	end
; 0x59bb0

TrainerHikerRussell: ; 0x59bb0
	; bit/flag number
	dw $525

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
; 0x59bbc

HikerRussellScript: ; 0x59bbc
	talkaftercancel
	loadfont
	writetext UnknownText_0x59c6c
	closetext
	loadmovesprites
	end
; 0x59bc4

TrainerHikerDaniel: ; 0x59bc4
	; bit/flag number
	dw $535

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
; 0x59bd0

HikerDanielScript: ; 0x59bd0
	talkaftercancel
	loadfont
	writetext UnknownText_0x59dc9
	closetext
	loadmovesprites
	end
; 0x59bd8

TrainerFirebreatherBill: ; 0x59bd8
	; bit/flag number
	dw $44a

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
; 0x59be4

FirebreatherBillScript: ; 0x59be4
	talkaftercancel
	loadfont
	writetext UnknownText_0x59e6f
	closetext
	loadmovesprites
	end
; 0x59bec

TrainerFirebreatherRay: ; 0x59bec
	; bit/flag number
	dw $44c

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
; 0x59bf8

FirebreatherRayScript: ; 0x59bf8
	talkaftercancel
	loadfont
	writetext UnknownText_0x59efc
	closetext
	loadmovesprites
	end
; 0x59c00

ItemFragment_0x59c00: ; 0x59c00
	db GREAT_BALL, 1
; 0x59c02

ItemFragment_0x59c02: ; 0x59c02
	db X_ATTACK, 1
; 0x59c04

ItemFragment_0x59c04: ; 0x59c04
	db POTION, 1
; 0x59c06

ItemFragment_0x59c06: ; 0x59c06
	db AWAKENING, 1
; 0x59c08

UnknownScript_0x59c08: ; 0x59c08
	jumptext UnknownText_0x59f29
; 0x59c0b

HikerRussellSeenText: ; 0x59c0b
	text "You're headed to"
	line "AZALEA, are you?"

	para "Let my #MON see"
	line "if you are good"
	cont "enough to battle."
	done
; 0x59c5f

HikerRussellBeatenText: ; 0x59c5f
	text "Oh, oh, oh!"
	done
; 0x59c6c

UnknownText_0x59c6c: ; 0x59c6c
	text "All right, then!"
	line "I've decided."

	para "I'm not leaving"
	line "until my #MON"
	cont "get tougher!"
	done
; 0x59cb5

PokemaniacLarrySeenText: ; 0x59cb5
	text "I roam far and"
	line "wide in search of"
	cont "#MON."

	para "Are you looking"
	line "for #MON too?"

	para "Then you're my"
	line "collecting rival!"
	done
; 0x59d1b

PokemaniacLarryBeatenText: ; 0x59d1b
	text "Ugh. My poor #-"
	line "MON…"
	done
; 0x59d31

UnknownText_0x59d31: ; 0x59d31
	text "Every Friday, you"
	line "can hear #MON"

	para "roars from deep"
	line "inside the cave."
	done
; 0x59d73

HikerDanielSeenText: ; 0x59d73
	text "Whoa! What a"
	line "surprise!"

	para "I didn't expect to"
	line "see anyone here!"
	done
; 0x59dae

HikerDanielBeatenText: ; 0x59dae
	text "Whoa! I'm beaten"
	line "big time!"
	done
; 0x59dc9

UnknownText_0x59dc9: ; 0x59dc9
	text "I was conned into"
	line "buying a SLOWPOKE-"
	cont "TAIL."

	para "I feel sorry for"
	line "the poor #MON."
	done
; 0x59e15

FirebreatherBillSeenText: ; 0x59e15
	text "ZUBAT's SUPERSONIC"
	line "keeps confusing"
	cont "my #MON."

	para "I'm seriously"
	line "upset about that!"
	done
; 0x59e60

FirebreatherBillBeatenText: ; 0x59e60
	text "I flamed out!"
	done
; 0x59e6f

UnknownText_0x59e6f: ; 0x59e6f
	text "On weekends, you"
	line "can hear strange"

	para "roars from deep in"
	line "the cave."
	done
; 0x59eaf

FirebreatherRaySeenText: ; 0x59eaf
	text "If it's light, a"
	line "cave isn't scary."

	para "If you're strong,"
	line "#MON aren't"
	cont "scary."
	done
; 0x59ef4

FirebreatherRayBeatenText: ; 0x59ef4
	text "FLASH!"
	done
; 0x59efc

UnknownText_0x59efc: ; 0x59efc
	text "It's my #MON's"
	line "fire that lights"
	cont "up this cave."
	done
; 0x59f29

UnknownText_0x59f29: ; 0x59f29
	text "UNION CAVE"
	done
; 0x59f35

UnionCave1F_MapEventHeader: ; 0x59f35
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
	person_event SPRITE_POKEFAN_M, 10, 7, $9, $0, 255, 255, $b2, 2, TrainerHikerDaniel, $ffff
	person_event SPRITE_SUPER_NERD, 25, 8, $a, $0, 255, 255, $92, 3, TrainerPokemaniacLarry, $ffff
	person_event SPRITE_POKEFAN_M, 12, 15, $a, $0, 255, 255, $b2, 1, TrainerHikerRussell, $ffff
	person_event SPRITE_FISHER, 31, 19, $8, $0, 255, 255, $82, 4, TrainerFirebreatherRay, $ffff
	person_event SPRITE_FISHER, 23, 18, $7, $0, 255, 255, $82, 4, TrainerFirebreatherBill, $ffff
	person_event SPRITE_POKE_BALL, 25, 21, $1, $0, 255, 255, $1, 0, ItemFragment_0x59c00, $065a
	person_event SPRITE_POKE_BALL, 6, 8, $1, $0, 255, 255, $1, 0, ItemFragment_0x59c02, $065b
	person_event SPRITE_POKE_BALL, 21, 8, $1, $0, 255, 255, $1, 0, ItemFragment_0x59c04, $065c
	person_event SPRITE_POKE_BALL, 37, 16, $1, $0, 255, 255, $1, 0, ItemFragment_0x59c06, $065d
; 0x59fc4
