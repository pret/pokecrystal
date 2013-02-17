Route27_MapScriptHeader: ; 0x1a0867
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x1a0871, $0000
	dw UnknownScript_0x1a0872, $0000

	; callback count
	db 0
; 0x1a0871

UnknownScript_0x1a0871: ; 0x1a0871
	end
; 0x1a0872

UnknownScript_0x1a0872: ; 0x1a0872
	end
; 0x1a0873

UnknownScript_0x1a0873: ; 0x1a0873
	spriteface $a, $2
	showemote $0, $a, 15
	applymovement $a, MovementData_0x1a0a66
	2jump UnknownScript_0x1a088c
; 0x1a0881

UnknownScript_0x1a0881: ; 0x1a0881
	spriteface $a, $2
	showemote $0, $a, 15
	applymovement $a, MovementData_0x1a0a69
UnknownScript_0x1a088c: ; 0x1a088c
	spriteface $0, $3
	loadfont
	2writetext UnknownText_0x1a0a6b
	keeptextopen
	2writetext UnknownText_0x1a0a71
	closetext
	loadmovesprites
	dotrigger $1
	end
; 0x1a089c

UnknownScript_0x1a089c: ; 0x1a089c
	jumptextfaceplayer UnknownText_0x1a0a71
; 0x1a089f

TrainerPsychicGilbert: ; 0x1a089f
	; bit/flag number
	dw $443

	; trainer group && trainer id
	db PSYCHIC_T, GILBERT

	; text when seen
	dw PsychicGilbertSeenText

	; text when trainer beaten
	dw PsychicGilbertBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PsychicGilbertScript
; 0x1a08ab

PsychicGilbertScript: ; 0x1a08ab
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1a0dd2
	closetext
	loadmovesprites
	end
; 0x1a08b3

TrainerBird_keeperJose2: ; 0x1a08b3
	; bit/flag number
	dw $408

	; trainer group && trainer id
	db BIRD_KEEPER, JOSE2

	; text when seen
	dw Bird_keeperJose2SeenText

	; text when trainer beaten
	dw Bird_keeperJose2BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bird_keeperJose2Script
; 0x1a08bf

Bird_keeperJose2Script: ; 0x1a08bf
	writecode $17, $d
	talkaftercancel
	loadfont
	checkbit2 $0069
	iftrue UnknownScript_0x1a08ff
	checkbit2 $007e
	iftrue UnknownScript_0x1a0945
	checkcellnum $d
	iftrue UnknownScript_0x1a0963
	checkbit1 $026f
	iftrue UnknownScript_0x1a08e8
	2writetext UnknownText_0x1a0e42
	keeptextopen
	setbit1 $026f
	2call UnknownScript_0x1a0957
	2jump UnknownScript_0x1a08eb
; 0x1a08e8

UnknownScript_0x1a08e8: ; 0x1a08e8
	2call UnknownScript_0x1a095b
UnknownScript_0x1a08eb: ; 0x1a08eb
	askforphonenumber $d
	if_equal $1, UnknownScript_0x1a096b
	if_equal $2, UnknownScript_0x1a0967
	trainertotext BIRD_KEEPER, JOSE2, $0
	2call UnknownScript_0x1a095f
	2jump UnknownScript_0x1a0963
; 0x1a08ff

UnknownScript_0x1a08ff: ; 0x1a08ff
	2call UnknownScript_0x1a096f
	winlosstext Bird_keeperJose2BeatenText, $0000
	copybytetovar $d9f7
	if_equal $2, UnknownScript_0x1a0916
	if_equal $1, UnknownScript_0x1a091c
	if_equal $0, UnknownScript_0x1a0922
UnknownScript_0x1a0916: ; 0x1a0916
	checkbit1 $00cd
	iftrue UnknownScript_0x1a093c
UnknownScript_0x1a091c: ; 0x1a091c
	checkbit1 $0044
	iftrue UnknownScript_0x1a092f
UnknownScript_0x1a0922: ; 0x1a0922
	loadtrainer BIRD_KEEPER, JOSE2
	startbattle
	returnafterbattle
	loadvar $d9f7, $1
	clearbit2 $0069
	end
; 0x1a092f

UnknownScript_0x1a092f: ; 0x1a092f
	loadtrainer BIRD_KEEPER, JOSE1
	startbattle
	returnafterbattle
	loadvar $d9f7, $2
	clearbit2 $0069
	end
; 0x1a093c

UnknownScript_0x1a093c: ; 0x1a093c
	loadtrainer BIRD_KEEPER, JOSE3
	startbattle
	returnafterbattle
	clearbit2 $0069
	end
; 0x1a0945

UnknownScript_0x1a0945: ; 0x1a0945
	2call UnknownScript_0x1a0973
	verbosegiveitem STAR_PIECE, 1
	iffalse UnknownScript_0x1a0954
	clearbit2 $007e
	2jump UnknownScript_0x1a0963
; 0x1a0954

UnknownScript_0x1a0954: ; 0x1a0954
	2jump UnknownScript_0x1a0977
; 0x1a0957

UnknownScript_0x1a0957: ; 0x1a0957
	jumpstd $0019
	end
; 0x1a095b

UnknownScript_0x1a095b: ; 0x1a095b
	jumpstd $001a
	end
; 0x1a095f

UnknownScript_0x1a095f: ; 0x1a095f
	jumpstd $001b
	end
; 0x1a0963

UnknownScript_0x1a0963: ; 0x1a0963
	jumpstd $001c
	end
; 0x1a0967

UnknownScript_0x1a0967: ; 0x1a0967
	jumpstd $001d
	end
; 0x1a096b

UnknownScript_0x1a096b: ; 0x1a096b
	jumpstd $001e
	end
; 0x1a096f

UnknownScript_0x1a096f: ; 0x1a096f
	jumpstd $001f
	end
; 0x1a0973

UnknownScript_0x1a0973: ; 0x1a0973
	jumpstd $0020
	end
; 0x1a0977

UnknownScript_0x1a0977: ; 0x1a0977
	jumpstd $0021
	end
; 0x1a097b

TrainerCooltrainermBlake: ; 0x1a097b
	; bit/flag number
	dw $552

	; trainer group && trainer id
	db COOLTRAINERM, BLAKE

	; text when seen
	dw CooltrainermBlakeSeenText

	; text when trainer beaten
	dw CooltrainermBlakeBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainermBlakeScript
; 0x1a0987

CooltrainermBlakeScript: ; 0x1a0987
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1a0b0b
	closetext
	loadmovesprites
	end
; 0x1a098f

TrainerCooltrainermBrian: ; 0x1a098f
	; bit/flag number
	dw $553

	; trainer group && trainer id
	db COOLTRAINERM, BRIAN

	; text when seen
	dw CooltrainermBrianSeenText

	; text when trainer beaten
	dw CooltrainermBrianBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainermBrianScript
; 0x1a099b

CooltrainermBrianScript: ; 0x1a099b
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1a0bac
	closetext
	loadmovesprites
	end
; 0x1a09a3

TrainerCooltrainerfReena1: ; 0x1a09a3
	; bit/flag number
	dw $564

	; trainer group && trainer id
	db COOLTRAINERF, REENA1

	; text when seen
	dw CooltrainerfReena1SeenText

	; text when trainer beaten
	dw CooltrainerfReena1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainerfReena1Script
; 0x1a09af

CooltrainerfReena1Script: ; 0x1a09af
	writecode $17, $e
	talkaftercancel
	loadfont
	checkbit2 $006a
	iftrue UnknownScript_0x1a09e9
	checkcellnum $e
	iftrue UnknownScript_0x1a0a3b
	checkbit1 $0271
	iftrue UnknownScript_0x1a09d2
	2writetext UnknownText_0x1a0c35
	keeptextopen
	setbit1 $0271
	2call UnknownScript_0x1a0a2f
	2jump UnknownScript_0x1a09d5
; 0x1a09d2

UnknownScript_0x1a09d2: ; 0x1a09d2
	2call UnknownScript_0x1a0a33
UnknownScript_0x1a09d5: ; 0x1a09d5
	askforphonenumber $e
	if_equal $1, UnknownScript_0x1a0a43
	if_equal $2, UnknownScript_0x1a0a3f
	trainertotext COOLTRAINERF, REENA1, $0
	2call UnknownScript_0x1a0a37
	2jump UnknownScript_0x1a0a3b
; 0x1a09e9

UnknownScript_0x1a09e9: ; 0x1a09e9
	2call UnknownScript_0x1a0a47
	winlosstext CooltrainerfReena1BeatenText, $0000
	copybytetovar $d9f8
	if_equal $2, UnknownScript_0x1a0a00
	if_equal $1, UnknownScript_0x1a0a06
	if_equal $0, UnknownScript_0x1a0a0c
UnknownScript_0x1a0a00: ; 0x1a0a00
	checkbit1 $00cd
	iftrue UnknownScript_0x1a0a26
UnknownScript_0x1a0a06: ; 0x1a0a06
	checkbit1 $0044
	iftrue UnknownScript_0x1a0a19
UnknownScript_0x1a0a0c: ; 0x1a0a0c
	loadtrainer COOLTRAINERF, REENA1
	startbattle
	returnafterbattle
	loadvar $d9f8, $1
	clearbit2 $006a
	end
; 0x1a0a19

UnknownScript_0x1a0a19: ; 0x1a0a19
	loadtrainer COOLTRAINERF, REENA2
	startbattle
	returnafterbattle
	loadvar $d9f8, $2
	clearbit2 $006a
	end
; 0x1a0a26

UnknownScript_0x1a0a26: ; 0x1a0a26
	loadtrainer COOLTRAINERF, REENA3
	startbattle
	returnafterbattle
	clearbit2 $006a
	end
; 0x1a0a2f

UnknownScript_0x1a0a2f: ; 0x1a0a2f
	jumpstd $0023
	end
; 0x1a0a33

UnknownScript_0x1a0a33: ; 0x1a0a33
	jumpstd $0024
	end
; 0x1a0a37

UnknownScript_0x1a0a37: ; 0x1a0a37
	jumpstd $0025
	end
; 0x1a0a3b

UnknownScript_0x1a0a3b: ; 0x1a0a3b
	jumpstd $0026
	end
; 0x1a0a3f

UnknownScript_0x1a0a3f: ; 0x1a0a3f
	jumpstd $0027
	end
; 0x1a0a43

UnknownScript_0x1a0a43: ; 0x1a0a43
	jumpstd $0028
	end
; 0x1a0a47

UnknownScript_0x1a0a47: ; 0x1a0a47
	jumpstd $0029
	end
; 0x1a0a4b

TrainerCooltrainerfMegan: ; 0x1a0a4b
	; bit/flag number
	dw $565

	; trainer group && trainer id
	db COOLTRAINERF, MEGAN

	; text when seen
	dw CooltrainerfMeganSeenText

	; text when trainer beaten
	dw CooltrainerfMeganBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainerfMeganScript
; 0x1a0a57

CooltrainerfMeganScript: ; 0x1a0a57
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1a0cce
	closetext
	loadmovesprites
	end
; 0x1a0a5f

MapRoute27Signpost0Script: ; 0x1a0a5f
	jumptext UnknownText_0x1a0e7f
; 0x1a0a62

ItemFragment_0x1a0a62: ; 0x1a0a62
	db TM_22, 1
; 0x1a0a64

ItemFragment_0x1a0a64: ; 0x1a0a64
	db RARE_CANDY, 1
; 0x1a0a66

MovementData_0x1a0a66: ; 0x1a0a66
	step_left
	step_left
	step_end
; 0x1a0a69

MovementData_0x1a0a69: ; 0x1a0a69
	step_left
	step_end
; 0x1a0a6b

UnknownText_0x1a0a6b: ; 0x1a0a6b
	db $0, "Hey!", $57
; 0x1a0a71

UnknownText_0x1a0a71: ; 0x1a0a71
	db $0, "Do you know what", $4f
	db "you just did?", $51
	db "You've taken your", $4f
	db "first step into", $55
	db "KANTO.", $51
	db "Check your #-", $4f
	db "GEAR MAP and see.", $57
; 0x1a0ad9

CooltrainermBlakeSeenText: ; 0x1a0ad9
	db $0, "You look pretty", $4f
	db "strong.", $55
	db "Let me battle you!", $57
; 0x1a0b05

CooltrainermBlakeBeatenText: ; 0x1a0b05
	db $0, "Yow!", $57
; 0x1a0b0b

UnknownText_0x1a0b0b: ; 0x1a0b0b
	db $0, "If you prevail on", $4f
	db "this harsh trek,", $51
	db "the truth will be", $4f
	db "revealed!", $51
	db "Heh, sorry, I just", $4f
	db "wanted to say", $55
	db "something cool.", $57
; 0x1a0b7c

CooltrainermBrianSeenText: ; 0x1a0b7c
	db $0, "Hm? You're good,", $4f
	db "aren't you?", $57
; 0x1a0b98

CooltrainermBrianBeatenText: ; 0x1a0b98
	db $0, "Just as I thought!", $57
; 0x1a0bac

UnknownText_0x1a0bac: ; 0x1a0bac
	db $0, "A good trainer can", $4f
	db "recognize other", $55
	db "good trainers.", $57
; 0x1a0bdf

CooltrainerfReena1SeenText: ; 0x1a0bdf
	db $0, "You shouldn't", $4f
	db "underestimate the", $51
	db "wild #MON in", $4f
	db "these parts.", $57
; 0x1a0c19

CooltrainerfReena1BeatenText: ; 0x1a0c19
	db $0, "Oh! You're much", $4f
	db "too strong!", $57
; 0x1a0c35

UnknownText_0x1a0c35: ; 0x1a0c35
	db $0, "You're just a kid,", $4f
	db "but you're not to", $51
	db "be underestimated", $4f
	db "either.", $57
; 0x1a0c73

CooltrainerfMeganSeenText: ; 0x1a0c73
	db $0, "It's rare to see", $4f
	db "anyone come here.", $51
	db "Are you training", $4f
	db "on your own?", $57
; 0x1a0cb4

CooltrainerfMeganBeatenText: ; 0x1a0cb4
	db $0, "Oh! You're really", $4f
	db "strong!", $57
; 0x1a0cce

UnknownText_0x1a0cce: ; 0x1a0cce
	db $0, "I'm checking out", $4f
	db "pre- and post-", $55
	db "evolution #MON.", $51
	db "Evolution really", $4f
	db "does make #MON", $55
	db "stronger.", $51
	db "But evolved forms", $4f
	db "also learn moves", $55
	db "later on.", $57
; 0x1a0d55

PsychicGilbertSeenText: ; 0x1a0d55
	db $0, "Don't say a thing!", $51
	db "Let me guess what", $4f
	db "you're thinking.", $51
	db "Mmmmmmm…", $51
	db "I got it! You're", $4f
	db "on the #MON", $55
	db "LEAGUE challenge!", $57
; 0x1a0dc1

PsychicGilbertBeatenText: ; 0x1a0dc1
	db $0, "You're too much!", $57
; 0x1a0dd2

UnknownText_0x1a0dd2: ; 0x1a0dd2
	db $0, "With your skills,", $4f
	db "you'll do well at", $55
	db "the LEAGUE.", $51
	db "That's what my", $4f
	db "premonition says.", $57
; 0x1a0e22

Bird_keeperJose2SeenText: ; 0x1a0e22
	db $0, "Tweet! Tweet!", $4f
	db "Tetweet!", $57
; 0x1a0e3a

Bird_keeperJose2BeatenText: ; 0x1a0e3a
	db $0, "Tweet!", $57
; 0x1a0e42

UnknownText_0x1a0e42: ; 0x1a0e42
	db $0, "BIRD KEEPERS like", $4f
	db "me mimic bird", $51
	db "whistles to com-", $4f
	db "mand #MON.", $57
; 0x1a0e7f

UnknownText_0x1a0e7f: ; 0x1a0e7f
	db $0, "TOHJO FALLS", $51
	db "THE LINK BETWEEN", $4f
	db "KANTO AND JOHTO", $57
; 0x1a0ead

Route27_MapEventHeader: ; 0x1a0ead
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $21, 1, GROUP_ROUTE_27_SANDSTORM_HOUSE, MAP_ROUTE_27_SANDSTORM_HOUSE
	warp_def $5, $1a, 1, GROUP_TOHJO_FALLS, MAP_TOHJO_FALLS
	warp_def $5, $24, 2, GROUP_TOHJO_FALLS, MAP_TOHJO_FALLS

	; xy triggers
	db 2
	xy_trigger 0, $a, $12, $0, UnknownScript_0x1a0873, $0, $0
	xy_trigger 0, $a, $13, $0, UnknownScript_0x1a0881, $0, $0

	; signposts
	db 1
	signpost 7, 25, $0, MapRoute27Signpost0Script

	; people-events
	db 9
	person_event $23, 11, 52, $7, $0, 255, 255, $82, 3, TrainerCooltrainermBlake, $ffff
	person_event $23, 10, 62, $9, $0, 255, 255, $82, 4, TrainerCooltrainermBrian, $ffff
	person_event $24, 14, 76, $7, $0, 255, 255, $82, 4, TrainerCooltrainerfReena1, $ffff
	person_event $24, 10, 41, $1f, $0, 255, 255, $82, 2, TrainerCooltrainerfMegan, $ffff
	person_event $27, 11, 69, $8, $0, 255, 255, $92, 3, TrainerPsychicGilbert, $ffff
	person_event $27, 17, 62, $9, $0, 255, 255, $92, 3, TrainerBird_keeperJose2, $ffff
	person_event $54, 16, 64, $1, $0, 255, 255, $1, 0, ItemFragment_0x1a0a62, $06ab
	person_event $54, 16, 57, $1, $0, 255, 255, $1, 0, ItemFragment_0x1a0a64, $06ac
	person_event $3a, 14, 25, $3, $0, 255, 255, $0, 3, UnknownScript_0x1a089c, $ffff
; 0x1a0f4c

