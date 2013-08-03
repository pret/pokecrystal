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
	2writetext UnknownText_0x1a6c7f
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
	2writetext UnknownText_0x1a6d11
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
	2writetext UnknownText_0x1a6d79
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
	2writetext UnknownText_0x1a6e58
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
	2writetext UnknownText_0x1a6ec2
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
	2writetext UnknownText_0x1a696e
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
	2writetext UnknownText_0x1a69d4
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
	2writetext UnknownText_0x1a6aa4
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
	2writetext UnknownText_0x1a6b6c
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
	2writetext UnknownText_0x1a6bed
	closetext
	loadmovesprites
	end
; 0x1a6909

UnknownScript_0x1a6909: ; 0x1a6909
	jumpstd $000f
; 0x1a690c

MapRoute41SignpostItem0: ; 0x1a690c
	dw $00ac
	db MAX_ETHER
; 0x1a690f

SwimmermCharlieSeenText: ; 0x1a690f
	db $0, "The water's warm", $4f
	db "here. I'm loose", $55
	db "and limber.", $51
	db "Sure, I'll take", $4f
	db "you on!", $57
; 0x1a6952

SwimmermCharlieBeatenText: ; 0x1a6952
	db $0, "Yikes! I've got", $4f
	db "prune skin!", $57
; 0x1a696e

UnknownText_0x1a696e: ; 0x1a696e
	db $0, "Isn't it relaxing", $4f
	db "just floating like", $55
	db "this?", $57
; 0x1a6999

SwimmermGeorgeSeenText: ; 0x1a6999
	db $0, "I'm a bit tired.", $4f
	db "If I win, lend me", $55
	db "your #MON.", $57
; 0x1a69c7

SwimmermGeorgeBeatenText: ; 0x1a69c7
	db $0, "Pant, pant…", $57
; 0x1a69d4

UnknownText_0x1a69d4: ; 0x1a69d4
	db $0, "It's so far to", $4f
	db "CIANWOOD.", $51
	db "But it's no easy", $4f
	db "return trip to", $55
	db "OLIVINE either.", $51
	db "What should I do?", $57
; 0x1a6a2e

SwimmermBerkeSeenText: ; 0x1a6a2e
	db $0, "See those islands", $4f
	db "that are blocked", $55
	db "by whirlpools?", $51
	db "There just has to", $4f
	db "be a secret!", $57
; 0x1a6a80

SwimmermBerkeBeatenText: ; 0x1a6a80
	db $0, "What's the secret", $4f
	db "to your strength?", $57
; 0x1a6aa4

UnknownText_0x1a6aa4: ; 0x1a6aa4
	db $0, "It was a dark and", $4f
	db "stormy night…", $51
	db "I saw this giant", $4f
	db "#MON flying", $55
	db "from the islands.", $51
	db "It was scattering", $4f
	db "feathers from its", $55
	db "silver wings.", $57
; 0x1a6b26

SwimmermKirkSeenText: ; 0x1a6b26
	db $0, "The waves are wild", $4f
	db "here.", $51
	db "They tire you out", $4f
	db "while you swim.", $57
; 0x1a6b62

SwimmermKirkBeatenText: ; 0x1a6b62
	db $0, "I'm beat!", $57
; 0x1a6b6c

UnknownText_0x1a6b6c: ; 0x1a6b6c
	db $0, "The currents keep", $4f
	db "me from reaching", $55
	db "that island.", $57
; 0x1a6b9d

SwimmermMathewSeenText: ; 0x1a6b9d
	db $0, "Are you seeking", $4f
	db "the secrets of", $55
	db "WHIRL ISLANDS?", $57
; 0x1a6bcc

SwimmermMathewBeatenText: ; 0x1a6bcc
	db $0, "Ooh, you've got", $4f
	db "great endurance!", $57
; 0x1a6bed

UnknownText_0x1a6bed: ; 0x1a6bed
	db $0, "A secret about", $4f
	db "WHIRL ISLANDS…", $51
	db "It's pitch-black", $4f
	db "inside!", $57
; 0x1a6c24

SwimmerfKayleeSeenText: ; 0x1a6c24
	db $0, "I'm on my way to", $4f
	db "WHIRL ISLANDS.", $51
	db "I'm going explor-", $4f
	db "ing with friends.", $57
; 0x1a6c67

SwimmerfKayleeBeatenText: ; 0x1a6c67
	db $0, "Is that how you do", $4f
	db "it?", $57
; 0x1a6c7f

UnknownText_0x1a6c7f: ; 0x1a6c7f
	db $0, "There's supposed", $4f
	db "to be a big #-", $55
	db "MON deep beneath", $55
	db "WHIRL ISLANDS.", $51
	db "I wonder what it", $4f
	db "could be?", $57
; 0x1a6cda

SwimmerfSusieSeenText: ; 0x1a6cda
	db $0, "You look so ele-", $4f
	db "gant, riding your", $55
	db "#MON.", $57
; 0x1a6d04

SwimmerfSusieBeatenText: ; 0x1a6d04
	db $0, "I'm crushed…", $57
; 0x1a6d11

UnknownText_0x1a6d11: ; 0x1a6d11
	db $0, "Wasn't there a hit", $4f
	db "song about a boy", $55
	db "riding a LAPRAS?", $57
; 0x1a6d46

SwimmerfDeniseSeenText: ; 0x1a6d46
	db $0, "The weather is so", $4f
	db "beautiful, I'm in", $55
	db "a daze!", $57
; 0x1a6d72

SwimmerfDeniseBeatenText: ; 0x1a6d72
	db $0, "Ohhh!", $57
; 0x1a6d79

UnknownText_0x1a6d79: ; 0x1a6d79
	db $0, "A sunburn is the", $4f
	db "worst for skin.", $51
	db "But I don't use a", $4f
	db "sunblock.", $51
	db "I won't pollute", $4f
	db "the water.", $57
; 0x1a6dd0

SwimmerfKaraSeenText: ; 0x1a6dd0
	db $0, "If you need to", $4f
	db "rest, just tread", $55
	db "water.", $51
	db "You'll get your", $4f
	db "wind back, so you", $51
	db "can keep on going", $4f
	db "strong.", $57
; 0x1a6e33

SwimmerfKaraBeatenText: ; 0x1a6e33
	db $0, "Oh! You have more", $4f
	db "energy than I do.", $57
; 0x1a6e58

UnknownText_0x1a6e58: ; 0x1a6e58
	db $0, "I heard roars from", $4f
	db "deep inside the", $55
	db "ISLANDS.", $57
; 0x1a6e85

SwimmerfWendySeenText: ; 0x1a6e85
	db $0, "At night, STARYU", $4f
	db "gather near the", $55
	db "water's surface.", $57
; 0x1a6eb7

SwimmerfWendyBeatenText: ; 0x1a6eb7
	db $0, "Oh, dear…", $57
; 0x1a6ec2

UnknownText_0x1a6ec2: ; 0x1a6ec2
	db $0, "The clusters of", $4f
	db "STARYU light up", $55
	db "at the same time.", $51
	db "It's so beautiful,", $4f
	db "it's scary.", $57
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

