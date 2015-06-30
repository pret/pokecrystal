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
	spriteface $a, LEFT
	showemote $0, $a, 15
	applymovement $a, MovementData_0x1a0a66
	jump UnknownScript_0x1a088c
; 0x1a0881

UnknownScript_0x1a0881: ; 0x1a0881
	spriteface $a, LEFT
	showemote $0, $a, 15
	applymovement $a, MovementData_0x1a0a69
UnknownScript_0x1a088c: ; 0x1a088c
	spriteface $0, RIGHT
	loadfont
	writetext UnknownText_0x1a0a6b
	keeptextopen
	writetext UnknownText_0x1a0a71
	closetext
	loadmovesprites
	dotrigger $1
	end
; 0x1a089c

FisherScript_0x1a089c: ; 0x1a089c
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
	writetext UnknownText_0x1a0dd2
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
	checkflag $0069
	iftrue UnknownScript_0x1a08ff
	checkflag $007e
	iftrue UnknownScript_0x1a0945
	checkcellnum $d
	iftrue UnknownScript_0x1a0963
	checkevent $026f
	iftrue UnknownScript_0x1a08e8
	writetext UnknownText_0x1a0e42
	keeptextopen
	setevent $026f
	scall UnknownScript_0x1a0957
	jump UnknownScript_0x1a08eb
; 0x1a08e8

UnknownScript_0x1a08e8: ; 0x1a08e8
	scall UnknownScript_0x1a095b
UnknownScript_0x1a08eb: ; 0x1a08eb
	askforphonenumber $d
	if_equal $1, UnknownScript_0x1a096b
	if_equal $2, UnknownScript_0x1a0967
	trainertotext BIRD_KEEPER, JOSE2, $0
	scall UnknownScript_0x1a095f
	jump UnknownScript_0x1a0963
; 0x1a08ff

UnknownScript_0x1a08ff: ; 0x1a08ff
	scall UnknownScript_0x1a096f
	winlosstext Bird_keeperJose2BeatenText, $0000
	copybytetovar wd9f7
	if_equal $2, UnknownScript_0x1a0916
	if_equal $1, UnknownScript_0x1a091c
	if_equal $0, UnknownScript_0x1a0922
UnknownScript_0x1a0916: ; 0x1a0916
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue UnknownScript_0x1a093c
UnknownScript_0x1a091c: ; 0x1a091c
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue UnknownScript_0x1a092f
UnknownScript_0x1a0922: ; 0x1a0922
	loadtrainer BIRD_KEEPER, JOSE2
	startbattle
	returnafterbattle
	loadvar wd9f7, $1
	clearflag $0069
	end
; 0x1a092f

UnknownScript_0x1a092f: ; 0x1a092f
	loadtrainer BIRD_KEEPER, JOSE1
	startbattle
	returnafterbattle
	loadvar wd9f7, $2
	clearflag $0069
	end
; 0x1a093c

UnknownScript_0x1a093c: ; 0x1a093c
	loadtrainer BIRD_KEEPER, JOSE3
	startbattle
	returnafterbattle
	clearflag $0069
	end
; 0x1a0945

UnknownScript_0x1a0945: ; 0x1a0945
	scall UnknownScript_0x1a0973
	verbosegiveitem STAR_PIECE, 1
	iffalse UnknownScript_0x1a0954
	clearflag $007e
	jump UnknownScript_0x1a0963
; 0x1a0954

UnknownScript_0x1a0954: ; 0x1a0954
	jump UnknownScript_0x1a0977
; 0x1a0957

UnknownScript_0x1a0957: ; 0x1a0957
	jumpstd asknumber1m
	end
; 0x1a095b

UnknownScript_0x1a095b: ; 0x1a095b
	jumpstd asknumber2m
	end
; 0x1a095f

UnknownScript_0x1a095f: ; 0x1a095f
	jumpstd registerednumberm
	end
; 0x1a0963

UnknownScript_0x1a0963: ; 0x1a0963
	jumpstd numberacceptedm
	end
; 0x1a0967

UnknownScript_0x1a0967: ; 0x1a0967
	jumpstd numberdeclinedm
	end
; 0x1a096b

UnknownScript_0x1a096b: ; 0x1a096b
	jumpstd phonefullm
	end
; 0x1a096f

UnknownScript_0x1a096f: ; 0x1a096f
	jumpstd rematchm
	end
; 0x1a0973

UnknownScript_0x1a0973: ; 0x1a0973
	jumpstd giftm
	end
; 0x1a0977

UnknownScript_0x1a0977: ; 0x1a0977
	jumpstd packfullm
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
	writetext UnknownText_0x1a0b0b
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
	writetext UnknownText_0x1a0bac
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
	checkflag $006a
	iftrue UnknownScript_0x1a09e9
	checkcellnum $e
	iftrue UnknownScript_0x1a0a3b
	checkevent $0271
	iftrue UnknownScript_0x1a09d2
	writetext UnknownText_0x1a0c35
	keeptextopen
	setevent $0271
	scall UnknownScript_0x1a0a2f
	jump UnknownScript_0x1a09d5
; 0x1a09d2

UnknownScript_0x1a09d2: ; 0x1a09d2
	scall UnknownScript_0x1a0a33
UnknownScript_0x1a09d5: ; 0x1a09d5
	askforphonenumber $e
	if_equal $1, UnknownScript_0x1a0a43
	if_equal $2, UnknownScript_0x1a0a3f
	trainertotext COOLTRAINERF, REENA1, $0
	scall UnknownScript_0x1a0a37
	jump UnknownScript_0x1a0a3b
; 0x1a09e9

UnknownScript_0x1a09e9: ; 0x1a09e9
	scall UnknownScript_0x1a0a47
	winlosstext CooltrainerfReena1BeatenText, $0000
	copybytetovar wd9f8
	if_equal $2, UnknownScript_0x1a0a00
	if_equal $1, UnknownScript_0x1a0a06
	if_equal $0, UnknownScript_0x1a0a0c
UnknownScript_0x1a0a00: ; 0x1a0a00
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue UnknownScript_0x1a0a26
UnknownScript_0x1a0a06: ; 0x1a0a06
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue UnknownScript_0x1a0a19
UnknownScript_0x1a0a0c: ; 0x1a0a0c
	loadtrainer COOLTRAINERF, REENA1
	startbattle
	returnafterbattle
	loadvar wd9f8, $1
	clearflag $006a
	end
; 0x1a0a19

UnknownScript_0x1a0a19: ; 0x1a0a19
	loadtrainer COOLTRAINERF, REENA2
	startbattle
	returnafterbattle
	loadvar wd9f8, $2
	clearflag $006a
	end
; 0x1a0a26

UnknownScript_0x1a0a26: ; 0x1a0a26
	loadtrainer COOLTRAINERF, REENA3
	startbattle
	returnafterbattle
	clearflag $006a
	end
; 0x1a0a2f

UnknownScript_0x1a0a2f: ; 0x1a0a2f
	jumpstd asknumber1f
	end
; 0x1a0a33

UnknownScript_0x1a0a33: ; 0x1a0a33
	jumpstd asknumber2f
	end
; 0x1a0a37

UnknownScript_0x1a0a37: ; 0x1a0a37
	jumpstd registerednumberf
	end
; 0x1a0a3b

UnknownScript_0x1a0a3b: ; 0x1a0a3b
	jumpstd numberacceptedf
	end
; 0x1a0a3f

UnknownScript_0x1a0a3f: ; 0x1a0a3f
	jumpstd numberdeclinedf
	end
; 0x1a0a43

UnknownScript_0x1a0a43: ; 0x1a0a43
	jumpstd phonefullf
	end
; 0x1a0a47

UnknownScript_0x1a0a47: ; 0x1a0a47
	jumpstd rematchf
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
	writetext UnknownText_0x1a0cce
	closetext
	loadmovesprites
	end
; 0x1a0a5f

MapRoute27Signpost0Script: ; 0x1a0a5f
	jumptext UnknownText_0x1a0e7f
; 0x1a0a62

ItemFragment_0x1a0a62: ; 0x1a0a62
	db TM_SOLARBEAM, 1
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
	text "Hey!"
	done
; 0x1a0a71

UnknownText_0x1a0a71: ; 0x1a0a71
	text "Do you know what"
	line "you just did?"

	para "You've taken your"
	line "first step into"
	cont "KANTO."

	para "Check your #-"
	line "GEAR MAP and see."
	done
; 0x1a0ad9

CooltrainermBlakeSeenText: ; 0x1a0ad9
	text "You look pretty"
	line "strong."
	cont "Let me battle you!"
	done
; 0x1a0b05

CooltrainermBlakeBeatenText: ; 0x1a0b05
	text "Yow!"
	done
; 0x1a0b0b

UnknownText_0x1a0b0b: ; 0x1a0b0b
	text "If you prevail on"
	line "this harsh trek,"

	para "the truth will be"
	line "revealed!"

	para "Heh, sorry, I just"
	line "wanted to say"
	cont "something cool."
	done
; 0x1a0b7c

CooltrainermBrianSeenText: ; 0x1a0b7c
	text "Hm? You're good,"
	line "aren't you?"
	done
; 0x1a0b98

CooltrainermBrianBeatenText: ; 0x1a0b98
	text "Just as I thought!"
	done
; 0x1a0bac

UnknownText_0x1a0bac: ; 0x1a0bac
	text "A good trainer can"
	line "recognize other"
	cont "good trainers."
	done
; 0x1a0bdf

CooltrainerfReena1SeenText: ; 0x1a0bdf
	text "You shouldn't"
	line "underestimate the"

	para "wild #MON in"
	line "these parts."
	done
; 0x1a0c19

CooltrainerfReena1BeatenText: ; 0x1a0c19
	text "Oh! You're much"
	line "too strong!"
	done
; 0x1a0c35

UnknownText_0x1a0c35: ; 0x1a0c35
	text "You're just a kid,"
	line "but you're not to"

	para "be underestimated"
	line "either."
	done
; 0x1a0c73

CooltrainerfMeganSeenText: ; 0x1a0c73
	text "It's rare to see"
	line "anyone come here."

	para "Are you training"
	line "on your own?"
	done
; 0x1a0cb4

CooltrainerfMeganBeatenText: ; 0x1a0cb4
	text "Oh! You're really"
	line "strong!"
	done
; 0x1a0cce

UnknownText_0x1a0cce: ; 0x1a0cce
	text "I'm checking out"
	line "pre- and post-"
	cont "evolution #MON."

	para "Evolution really"
	line "does make #MON"
	cont "stronger."

	para "But evolved forms"
	line "also learn moves"
	cont "later on."
	done
; 0x1a0d55

PsychicGilbertSeenText: ; 0x1a0d55
	text "Don't say a thing!"

	para "Let me guess what"
	line "you're thinking."

	para "Mmmmmmm…"

	para "I got it! You're"
	line "on the #MON"
	cont "LEAGUE challenge!"
	done
; 0x1a0dc1

PsychicGilbertBeatenText: ; 0x1a0dc1
	text "You're too much!"
	done
; 0x1a0dd2

UnknownText_0x1a0dd2: ; 0x1a0dd2
	text "With your skills,"
	line "you'll do well at"
	cont "the LEAGUE."

	para "That's what my"
	line "premonition says."
	done
; 0x1a0e22

Bird_keeperJose2SeenText: ; 0x1a0e22
	text "Tweet! Tweet!"
	line "Tetweet!"
	done
; 0x1a0e3a

Bird_keeperJose2BeatenText: ; 0x1a0e3a
	text "Tweet!"
	done
; 0x1a0e42

UnknownText_0x1a0e42: ; 0x1a0e42
	text "BIRD KEEPERS like"
	line "me mimic bird"

	para "whistles to com-"
	line "mand #MON."
	done
; 0x1a0e7f

UnknownText_0x1a0e7f: ; 0x1a0e7f
	text "TOHJO FALLS"

	para "THE LINK BETWEEN"
	line "KANTO AND JOHTO"
	done
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
	person_event SPRITE_COOLTRAINER_M, 11, 52, $7, $0, 255, 255, $82, 3, TrainerCooltrainermBlake, $ffff
	person_event SPRITE_COOLTRAINER_M, 10, 62, $9, $0, 255, 255, $82, 4, TrainerCooltrainermBrian, $ffff
	person_event SPRITE_COOLTRAINER_F, 14, 76, $7, $0, 255, 255, $82, 4, TrainerCooltrainerfReena1, $ffff
	person_event SPRITE_COOLTRAINER_F, 10, 41, $1f, $0, 255, 255, $82, 2, TrainerCooltrainerfMegan, $ffff
	person_event SPRITE_YOUNGSTER, 11, 69, $8, $0, 255, 255, $92, 3, TrainerPsychicGilbert, $ffff
	person_event SPRITE_YOUNGSTER, 17, 62, $9, $0, 255, 255, $92, 3, TrainerBird_keeperJose2, $ffff
	person_event SPRITE_POKE_BALL, 16, 64, $1, $0, 255, 255, $1, 0, ItemFragment_0x1a0a62, $06ab
	person_event SPRITE_POKE_BALL, 16, 57, $1, $0, 255, 255, $1, 0, ItemFragment_0x1a0a64, $06ac
	person_event SPRITE_FISHER, 14, 25, $3, $0, 255, 255, $0, 3, FisherScript_0x1a089c, $ffff
; 0x1a0f4c
