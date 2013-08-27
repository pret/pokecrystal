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
	2writetext UnknownText_0x59d31
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
	2writetext UnknownText_0x59c6c
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
	2writetext UnknownText_0x59dc9
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
	2writetext UnknownText_0x59e6f
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
	2writetext UnknownText_0x59efc
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
	db $0, "You're headed to", $4f
	db "AZALEA, are you?", $51
	db "Let my #MON see", $4f
	db "if you are good", $55
	db "enough to battle.", $57
; 0x59c5f

HikerRussellBeatenText: ; 0x59c5f
	db $0, "Oh, oh, oh!", $57
; 0x59c6c

UnknownText_0x59c6c: ; 0x59c6c
	db $0, "All right, then!", $4f
	db "I've decided.", $51
	db "I'm not leaving", $4f
	db "until my #MON", $55
	db "get tougher!", $57
; 0x59cb5

PokemaniacLarrySeenText: ; 0x59cb5
	db $0, "I roam far and", $4f
	db "wide in search of", $55
	db "#MON.", $51
	db "Are you looking", $4f
	db "for #MON too?", $51
	db "Then you're my", $4f
	db "collecting rival!", $57
; 0x59d1b

PokemaniacLarryBeatenText: ; 0x59d1b
	db $0, "Ugh. My poor #-", $4f
	db "MON…", $57
; 0x59d31

UnknownText_0x59d31: ; 0x59d31
	db $0, "Every Friday, you", $4f
	db "can hear #MON", $51
	db "roars from deep", $4f
	db "inside the cave.", $57
; 0x59d73

HikerDanielSeenText: ; 0x59d73
	db $0, "Whoa! What a", $4f
	db "surprise!", $51
	db "I didn't expect to", $4f
	db "see anyone here!", $57
; 0x59dae

HikerDanielBeatenText: ; 0x59dae
	db $0, "Whoa! I'm beaten", $4f
	db "big time!", $57
; 0x59dc9

UnknownText_0x59dc9: ; 0x59dc9
	db $0, "I was conned into", $4f
	db "buying a SLOWPOKE-", $55
	db "TAIL.", $51
	db "I feel sorry for", $4f
	db "the poor #MON.", $57
; 0x59e15

FirebreatherBillSeenText: ; 0x59e15
	db $0, "ZUBAT's SUPERSONIC", $4f
	db "keeps confusing", $55
	db "my #MON.", $51
	db "I'm seriously", $4f
	db "upset about that!", $57
; 0x59e60

FirebreatherBillBeatenText: ; 0x59e60
	db $0, "I flamed out!", $57
; 0x59e6f

UnknownText_0x59e6f: ; 0x59e6f
	db $0, "On weekends, you", $4f
	db "can hear strange", $51
	db "roars from deep in", $4f
	db "the cave.", $57
; 0x59eaf

FirebreatherRaySeenText: ; 0x59eaf
	db $0, "If it's light, a", $4f
	db "cave isn't scary.", $51
	db "If you're strong,", $4f
	db "#MON aren't", $55
	db "scary.", $57
; 0x59ef4

FirebreatherRayBeatenText: ; 0x59ef4
	db $0, "FLASH!", $57
; 0x59efc

UnknownText_0x59efc: ; 0x59efc
	db $0, "It's my #MON's", $4f
	db "fire that lights", $55
	db "up this cave.", $57
; 0x59f29

UnknownText_0x59f29: ; 0x59f29
	db $0, "UNION CAVE", $57
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

