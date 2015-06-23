SlowpokeWellB1F_MapScriptHeader: ; 0x5a5d3
	; trigger count
	db 0

	; callback count
	db 0
; 0x5a5d5

KurtScript_0x5a5d5: ; 0x5a5d5
	jumptextfaceplayer UnknownText_0x5a6b5
; 0x5a5d8

TrainerGruntM29: ; 0x5a5d8
	; bit/flag number
	dw $50d

	; trainer group && trainer id
	db GRUNTM, 29

	; text when seen
	dw GruntM29SeenText

	; text when trainer beaten
	dw GruntM29BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntM29Script
; 0x5a5e4

GruntM29Script: ; 0x5a5e4
	talkaftercancel
	loadfont
	writetext TrainerGruntM29SlowpokeProfitText
	closetext
	loadmovesprites
	end
; 0x5a5ec

TrainerGruntM1: ; 0x5a5ec
	; bit/flag number
	dw $4f1

	; trainer group && trainer id
	db GRUNTM, 1

	; text when seen
	dw GruntM1SeenText

	; text when trainer beaten
	dw GruntM1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntM1Script
; 0x5a5f8

GruntM1Script: ; 0x5a5f8
	loadfont
	writetext TrainerGruntM1WhenTalkText
	closetext
	loadmovesprites
	special Function8c0b6
	special Functiond91
	disappear $2
	disappear $3
	disappear $4
	disappear $5
	pause 15
	special Function8c0ab
	disappear $8
	moveperson $8, $b, $6
	appear $8
	applymovement $8, KurtSlowpokeWellVictoryMovementData
	spriteface $0, $3
	loadfont
	writetext KurtLeaveSlowpokeWellText
	closetext
	loadmovesprites
	setevent EVENT_CLEARED_SLOWPOKE_WELL
	variablesprite $6, $4
	domaptrigger GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN, $1
	clearevent $06f3
	clearevent $06e9
	setevent $06f5
	setevent $06f6
	setevent $06fb
	setevent $0740
	clearevent $06f9
	clearevent $06fd
	clearevent $073e
	special Function8c084
	special Functionc658
	pause 15
	warp GROUP_KURTS_HOUSE, MAP_KURTS_HOUSE, $3, $3
	end
; 0x5a659

TrainerGruntM2: ; 0x5a659
	; bit/flag number
	dw $4f2

	; trainer group && trainer id
	db GRUNTM, 2

	; text when seen
	dw GruntM2SeenText

	; text when trainer beaten
	dw GruntM2BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntM2Script
; 0x5a665

GruntM2Script: ; 0x5a665
	talkaftercancel
	loadfont
	writetext UnknownText_0x5aaf2
	closetext
	loadmovesprites
	end
; 0x5a66d

TrainerGruntF1: ; 0x5a66d
	; bit/flag number
	dw $510

	; trainer group && trainer id
	db GRUNTF, 1

	; text when seen
	dw GruntF1SeenText

	; text when trainer beaten
	dw GruntF1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntF1Script
; 0x5a679

GruntF1Script: ; 0x5a679
	talkaftercancel
	loadfont
	writetext UnknownText_0x5ab8d
	closetext
	loadmovesprites
	end
; 0x5a681

SlowpokeScript_0x5a681: ; 0x5a681
	faceplayer
	loadfont
	cry SLOWPOKE
	writetext UnknownText_0x5abcb
	yesorno
	iftrue UnknownScript_0x5a68f
	loadmovesprites
	end
; 0x5a68f

UnknownScript_0x5a68f: ; 0x5a68f
	writetext UnknownText_0x5ac09
	closetext
	loadmovesprites
	end
; 0x5a695

SlowpokeScript_0x5a695: ; 0x5a695
	faceplayer
	loadfont
	writetext UnknownText_0x5ac61
	cry SLOWPOKE
	closetext
	loadmovesprites
	end
; 0x5a6a0

BoulderScript_0x5a6a0: ; 0x5a6a0
	jumpstd $000e
; 0x5a6a3

ItemFragment_0x5a6a3: ; 0x5a6a3
	db SUPER_POTION, 1
; 0x5a6a5

KurtSlowpokeWellVictoryMovementData: ; 0x5a6a5
	step_left
	step_left
	step_left
	step_left
	step_up
	accelerate_last
	accelerate_last
	accelerate_last
	step_left
	step_up
	step_up
	accelerate_last
	accelerate_last
	accelerate_last
	turn_head_left
	step_end
; 0x5a6b5

UnknownText_0x5a6b5: ; 0x5a6b5
	text "KURT: Hey there,"
	line $52, "!"

	para "The guard up top"
	line "took off when I"
	cont "shouted at him."

	para "But then I took a"
	line "tumble down the"
	cont "WELL."

	para "I slammed down"
	line "hard on my back,"
	cont "so I can't move."

	para "Rats! If I were"
	line "fit, my #MON"

	para "would've punished"
	line "them…"

	para "Ah, it can't be"
	line "helped."

	para $52, ", show them"
	line "how gutsy you are"
	cont "in my place!"
	done
; 0x5a7ca

KurtLeaveSlowpokeWellText: ; 0x5a7ca
	text "KURT: Way to go,"
	line $52, "!"

	para "TEAM ROCKET has"
	line "taken off."

	para "My back's better"
	line "too. Let's get out"
	cont "of here."
	done
; 0x5a825

GruntM29SeenText: ; 0x5a825
	text "Darn! I was stand-"
	line "ing guard up top"

	para "when some old coot"
	line "yelled at me."

	para "He startled me so"
	line "much that I fell"
	cont "down here."

	para "I think I'll vent"
	line "my anger by taking"
	cont "it out on you!"
	done
; 0x5a8cc

GruntM29BeatenText: ; 0x5a8cc
	text "Arrgh! This is NOT"
	line "my day!"
	done
; 0x5a8e8

TrainerGruntM29SlowpokeProfitText: ; 0x5a8e8
	text "Sure, we've been"
	line "hacking the tails"

	para "off SLOWPOKE and"
	line "selling them."

	para "Everything we do"
	line "is for profit."

	para "That's right!"
	line "We're TEAM ROCKET,"

	para "and we'll do any-"
	line "thing for money!"
	done
; 0x5a98b

GruntM1SeenText: ; 0x5a98b
	text "What do you want?"

	para "If you interrupt"
	line "our work, don't"
	cont "expect any mercy!"
	done
; 0x5a9d0

GruntM1BeatenText: ; 0x5a9d0
	text "You did OK today,"
	line "but wait till next"
	cont "time!"
	done
; 0x5a9fc

TrainerGruntM1WhenTalkText: ; 0x5a9fc
	text "Yeah, TEAM ROCKET"
	line "was broken up"
	cont "three years ago."

	para "But we continued"
	line "our activities"
	cont "underground."

	para "Now you can have"
	line "fun watching us"
	cont "stir up trouble!"
	done
; 0x5aa8d

GruntM2SeenText: ; 0x5aa8d
	text "Quit taking SLOW-"
	line "POKETAILS?"

	para "If we obeyed you,"
	line "TEAM ROCKET's rep"
	cont "would be ruined!"
	done
; 0x5aadf

GruntM2BeatenText: ; 0x5aadf
	text "Just…"
	line "Too strong…"
	done
; 0x5aaf2

UnknownText_0x5aaf2: ; 0x5aaf2
	text "We need the money,"
	line "but selling SLOW-"
	cont "POKETAILS?"

	para "It's tough being a"
	line "ROCKET GRUNT!"
	done
; 0x5ab43

GruntF1SeenText: ; 0x5ab43
	text "Stop taking TAILS?"

	para "Yeah, just try to"
	line "defeat all of us!"
	done
; 0x5ab7b

GruntF1BeatenText: ; 0x5ab7b
	text "You rotten brat!"
	done
; 0x5ab8d

UnknownText_0x5ab8d: ; 0x5ab8d
	text "SLOWPOKETAILS"
	line "grow back fast!"

	para "What's wrong with"
	line "selling them?"
	done
; 0x5abcb

UnknownText_0x5abcb: ; 0x5abcb
	text "A SLOWPOKE with"
	line "its TAIL cut off…"

	para "Huh? It has MAIL."
	line "Read it?"
	done
; 0x5ac09

UnknownText_0x5ac09: ; 0x5ac09
	text $52, " read the"
	line "MAIL."

	para "Be good and look"
	line "after the house"

	para "with Grandpa and"
	line "SLOWPOKE."

	para "Love, Dad"
	done
; 0x5ac61

UnknownText_0x5ac61: ; 0x5ac61
	text "A SLOWPOKE with"
	line "its TAIL cut off…"
	done
; 0x5ac84

SlowpokeWellB1F_MapEventHeader: ; 0x5ac84
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $f, $11, 6, GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN
	warp_def $b, $7, 1, GROUP_SLOWPOKE_WELL_B2F, MAP_SLOWPOKE_WELL_B2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 9
	person_event SPRITE_ROCKET, 11, 19, $6, $0, 255, 255, $2, 3, TrainerGruntM29, $06fc
	person_event SPRITE_ROCKET, 6, 9, $6, $0, 255, 255, $2, 1, TrainerGruntM1, $06fc
	person_event SPRITE_ROCKET, 10, 9, $9, $0, 255, 255, $2, 2, TrainerGruntM2, $06fc
	person_event SPRITE_ROCKET_GIRL, 8, 14, $9, $0, 255, 255, $82, 4, TrainerGruntF1, $06fc
	person_event SPRITE_SLOWPOKE, 8, 11, $1, $0, 255, 255, $80, 0, SlowpokeScript_0x5a681, $06fb
	person_event SPRITE_SLOWPOKE, 6, 10, $1, $0, 255, 255, $80, 0, SlowpokeScript_0x5a695, $06fb
	person_event SPRITE_KURT, 18, 20, $7, $0, 255, 255, $0, 0, KurtScript_0x5a5d5, $0740
	person_event SPRITE_BOULDER, 6, 7, $19, $0, 255, 255, $0, 0, BoulderScript_0x5a6a0, $ffff
	person_event SPRITE_POKE_BALL, 7, 14, $1, $0, 255, 255, $1, 0, ItemFragment_0x5a6a3, $0662
; 0x5ad09
