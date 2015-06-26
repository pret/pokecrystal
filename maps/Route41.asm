Route41_MapScriptHeader: ; 0x1a683f
	; trigger count
	db 0

	; callback count
	db 0
; 0x1a6841

TrainerSwimmerfKaylee: ; 0x1a6841
	; bit/flag number
	dw $3ea

	; trainer group && trainer id
	db SWIMMERF, KAYLEE

	; text when seen
	dw SwimmerfKayleeSeenText

	; text when trainer beaten
	dw SwimmerfKayleeBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmerfKayleeScript
; 0x1a684d

SwimmerfKayleeScript: ; 0x1a684d
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a6c7f
	closetext
	loadmovesprites
	end
; 0x1a6855

TrainerSwimmerfSusie: ; 0x1a6855
	; bit/flag number
	dw $3eb

	; trainer group && trainer id
	db SWIMMERF, SUSIE

	; text when seen
	dw SwimmerfSusieSeenText

	; text when trainer beaten
	dw SwimmerfSusieBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmerfSusieScript
; 0x1a6861

SwimmerfSusieScript: ; 0x1a6861
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a6d11
	closetext
	loadmovesprites
	end
; 0x1a6869

TrainerSwimmerfDenise: ; 0x1a6869
	; bit/flag number
	dw $3ec

	; trainer group && trainer id
	db SWIMMERF, DENISE

	; text when seen
	dw SwimmerfDeniseSeenText

	; text when trainer beaten
	dw SwimmerfDeniseBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmerfDeniseScript
; 0x1a6875

SwimmerfDeniseScript: ; 0x1a6875
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a6d79
	closetext
	loadmovesprites
	end
; 0x1a687d

TrainerSwimmerfKara: ; 0x1a687d
	; bit/flag number
	dw $3ed

	; trainer group && trainer id
	db SWIMMERF, KARA

	; text when seen
	dw SwimmerfKaraSeenText

	; text when trainer beaten
	dw SwimmerfKaraBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmerfKaraScript
; 0x1a6889

SwimmerfKaraScript: ; 0x1a6889
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a6e58
	closetext
	loadmovesprites
	end
; 0x1a6891

TrainerSwimmerfWendy: ; 0x1a6891
	; bit/flag number
	dw $3ee

	; trainer group && trainer id
	db SWIMMERF, WENDY

	; text when seen
	dw SwimmerfWendySeenText

	; text when trainer beaten
	dw SwimmerfWendyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmerfWendyScript
; 0x1a689d

SwimmerfWendyScript: ; 0x1a689d
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a6ec2
	closetext
	loadmovesprites
	end
; 0x1a68a5

TrainerSwimmermCharlie: ; 0x1a68a5
	; bit/flag number
	dw $597

	; trainer group && trainer id
	db SWIMMERM, CHARLIE

	; text when seen
	dw SwimmermCharlieSeenText

	; text when trainer beaten
	dw SwimmermCharlieBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmermCharlieScript
; 0x1a68b1

SwimmermCharlieScript: ; 0x1a68b1
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a696e
	closetext
	loadmovesprites
	end
; 0x1a68b9

TrainerSwimmermGeorge: ; 0x1a68b9
	; bit/flag number
	dw $598

	; trainer group && trainer id
	db SWIMMERM, GEORGE

	; text when seen
	dw SwimmermGeorgeSeenText

	; text when trainer beaten
	dw SwimmermGeorgeBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmermGeorgeScript
; 0x1a68c5

SwimmermGeorgeScript: ; 0x1a68c5
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a69d4
	closetext
	loadmovesprites
	end
; 0x1a68cd

TrainerSwimmermBerke: ; 0x1a68cd
	; bit/flag number
	dw $599

	; trainer group && trainer id
	db SWIMMERM, BERKE

	; text when seen
	dw SwimmermBerkeSeenText

	; text when trainer beaten
	dw SwimmermBerkeBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmermBerkeScript
; 0x1a68d9

SwimmermBerkeScript: ; 0x1a68d9
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a6aa4
	closetext
	loadmovesprites
	end
; 0x1a68e1

TrainerSwimmermKirk: ; 0x1a68e1
	; bit/flag number
	dw $59a

	; trainer group && trainer id
	db SWIMMERM, KIRK

	; text when seen
	dw SwimmermKirkSeenText

	; text when trainer beaten
	dw SwimmermKirkBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmermKirkScript
; 0x1a68ed

SwimmermKirkScript: ; 0x1a68ed
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a6b6c
	closetext
	loadmovesprites
	end
; 0x1a68f5

TrainerSwimmermMathew: ; 0x1a68f5
	; bit/flag number
	dw $59b

	; trainer group && trainer id
	db SWIMMERM, MATHEW

	; text when seen
	dw SwimmermMathewSeenText

	; text when trainer beaten
	dw SwimmermMathewBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmermMathewScript
; 0x1a6901

SwimmermMathewScript: ; 0x1a6901
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a6bed
	closetext
	loadmovesprites
	end
; 0x1a6909

Route41Rock:
; unused
	jumpstd smashrock

MapRoute41SignpostItem0: ; 0x1a690c
	dw $00ac
	db MAX_ETHER
; 0x1a690f

SwimmermCharlieSeenText: ; 0x1a690f
	text "The water's warm"
	line "here. I'm loose"
	cont "and limber."

	para "Sure, I'll take"
	line "you on!"
	done
; 0x1a6952

SwimmermCharlieBeatenText: ; 0x1a6952
	text "Yikes! I've got"
	line "prune skin!"
	done
; 0x1a696e

UnknownText_0x1a696e: ; 0x1a696e
	text "Isn't it relaxing"
	line "just floating like"
	cont "this?"
	done
; 0x1a6999

SwimmermGeorgeSeenText: ; 0x1a6999
	text "I'm a bit tired."
	line "If I win, lend me"
	cont "your #MON."
	done
; 0x1a69c7

SwimmermGeorgeBeatenText: ; 0x1a69c7
	text "Pant, pant…"
	done
; 0x1a69d4

UnknownText_0x1a69d4: ; 0x1a69d4
	text "It's so far to"
	line "CIANWOOD."

	para "But it's no easy"
	line "return trip to"
	cont "OLIVINE either."

	para "What should I do?"
	done
; 0x1a6a2e

SwimmermBerkeSeenText: ; 0x1a6a2e
	text "See those islands"
	line "that are blocked"
	cont "by whirlpools?"

	para "There just has to"
	line "be a secret!"
	done
; 0x1a6a80

SwimmermBerkeBeatenText: ; 0x1a6a80
	text "What's the secret"
	line "to your strength?"
	done
; 0x1a6aa4

UnknownText_0x1a6aa4: ; 0x1a6aa4
	text "It was a dark and"
	line "stormy night…"

	para "I saw this giant"
	line "#MON flying"
	cont "from the islands."

	para "It was scattering"
	line "feathers from its"
	cont "silver wings."
	done
; 0x1a6b26

SwimmermKirkSeenText: ; 0x1a6b26
	text "The waves are wild"
	line "here."

	para "They tire you out"
	line "while you swim."
	done
; 0x1a6b62

SwimmermKirkBeatenText: ; 0x1a6b62
	text "I'm beat!"
	done
; 0x1a6b6c

UnknownText_0x1a6b6c: ; 0x1a6b6c
	text "The currents keep"
	line "me from reaching"
	cont "that island."
	done
; 0x1a6b9d

SwimmermMathewSeenText: ; 0x1a6b9d
	text "Are you seeking"
	line "the secrets of"
	cont "WHIRL ISLANDS?"
	done
; 0x1a6bcc

SwimmermMathewBeatenText: ; 0x1a6bcc
	text "Ooh, you've got"
	line "great endurance!"
	done
; 0x1a6bed

UnknownText_0x1a6bed: ; 0x1a6bed
	text "A secret about"
	line "WHIRL ISLANDS…"

	para "It's pitch-black"
	line "inside!"
	done
; 0x1a6c24

SwimmerfKayleeSeenText: ; 0x1a6c24
	text "I'm on my way to"
	line "WHIRL ISLANDS."

	para "I'm going explor-"
	line "ing with friends."
	done
; 0x1a6c67

SwimmerfKayleeBeatenText: ; 0x1a6c67
	text "Is that how you do"
	line "it?"
	done
; 0x1a6c7f

UnknownText_0x1a6c7f: ; 0x1a6c7f
	text "There's supposed"
	line "to be a big #-"
	cont "MON deep beneath"
	cont "WHIRL ISLANDS."

	para "I wonder what it"
	line "could be?"
	done
; 0x1a6cda

SwimmerfSusieSeenText: ; 0x1a6cda
	text "You look so ele-"
	line "gant, riding your"
	cont "#MON."
	done
; 0x1a6d04

SwimmerfSusieBeatenText: ; 0x1a6d04
	text "I'm crushed…"
	done
; 0x1a6d11

UnknownText_0x1a6d11: ; 0x1a6d11
	text "Wasn't there a hit"
	line "song about a boy"
	cont "riding a LAPRAS?"
	done
; 0x1a6d46

SwimmerfDeniseSeenText: ; 0x1a6d46
	text "The weather is so"
	line "beautiful, I'm in"
	cont "a daze!"
	done
; 0x1a6d72

SwimmerfDeniseBeatenText: ; 0x1a6d72
	text "Ohhh!"
	done
; 0x1a6d79

UnknownText_0x1a6d79: ; 0x1a6d79
	text "A sunburn is the"
	line "worst for skin."

	para "But I don't use a"
	line "sunblock."

	para "I won't pollute"
	line "the water."
	done
; 0x1a6dd0

SwimmerfKaraSeenText: ; 0x1a6dd0
	text "If you need to"
	line "rest, just tread"
	cont "water."

	para "You'll get your"
	line "wind back, so you"

	para "can keep on going"
	line "strong."
	done
; 0x1a6e33

SwimmerfKaraBeatenText: ; 0x1a6e33
	text "Oh! You have more"
	line "energy than I do."
	done
; 0x1a6e58

UnknownText_0x1a6e58: ; 0x1a6e58
	text "I heard roars from"
	line "deep inside the"
	cont "ISLANDS."
	done
; 0x1a6e85

SwimmerfWendySeenText: ; 0x1a6e85
	text "At night, STARYU"
	line "gather near the"
	cont "water's surface."
	done
; 0x1a6eb7

SwimmerfWendyBeatenText: ; 0x1a6eb7
	text "Oh, dear…"
	done
; 0x1a6ec2

UnknownText_0x1a6ec2: ; 0x1a6ec2
	text "The clusters of"
	line "STARYU light up"
	cont "at the same time."

	para "It's so beautiful,"
	line "it's scary."
	done
; 0x1a6f12

Route41_MapEventHeader: ; 0x1a6f12
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $11, $c, 1, GROUP_WHIRL_ISLAND_NW, MAP_WHIRL_ISLAND_NW
	warp_def $13, $24, 1, GROUP_WHIRL_ISLAND_NE, MAP_WHIRL_ISLAND_NE
	warp_def $25, $c, 1, GROUP_WHIRL_ISLAND_SW, MAP_WHIRL_ISLAND_SW
	warp_def $2d, $24, 1, GROUP_WHIRL_ISLAND_SE, MAP_WHIRL_ISLAND_SE

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 35, 9, $7, MapRoute41SignpostItem0

	; people-events
	db 10
	person_event SPRITE_OLIVINE_RIVAL, 10, 36, $a, $0, 255, 255, $82, 3, TrainerSwimmermCharlie, $ffff
	person_event SPRITE_OLIVINE_RIVAL, 12, 50, $a, $0, 255, 255, $82, 3, TrainerSwimmermGeorge, $ffff
	person_event SPRITE_OLIVINE_RIVAL, 30, 24, $1e, $0, 255, 255, $82, 3, TrainerSwimmermBerke, $ffff
	person_event SPRITE_OLIVINE_RIVAL, 34, 36, $1f, $0, 255, 255, $82, 3, TrainerSwimmermKirk, $ffff
	person_event SPRITE_OLIVINE_RIVAL, 50, 23, $1e, $0, 255, 255, $82, 3, TrainerSwimmermMathew, $ffff
	person_event SPRITE_SWIMMER_GIRL, 8, 21, $a, $0, 255, 255, $a2, 3, TrainerSwimmerfKaylee, $ffff
	person_event SPRITE_SWIMMER_GIRL, 23, 27, $7, $0, 255, 255, $a2, 3, TrainerSwimmerfSusie, $ffff
	person_event SPRITE_SWIMMER_GIRL, 38, 31, $8, $0, 255, 255, $a2, 3, TrainerSwimmerfDenise, $ffff
	person_event SPRITE_SWIMMER_GIRL, 32, 48, $9, $0, 255, 255, $a2, 4, TrainerSwimmerfKara, $ffff
	person_event SPRITE_SWIMMER_GIRL, 54, 13, $a, $0, 255, 255, $a2, 2, TrainerSwimmerfWendy, $ffff
; 0x1a6fb3
