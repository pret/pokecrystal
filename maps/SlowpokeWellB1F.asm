SlowpokeWellB1F_MapScriptHeader: ; 0x5a5d3
	; trigger count
	db 0

	; callback count
	db 0
; 0x5a5d5

UnknownScript_0x5a5d5: ; 0x5a5d5
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
	2writetext TrainerGruntM29SlowpokeProfitText
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
	2writetext TrainerGruntM1WhenTalkText
	closetext
	loadmovesprites
	special $0030
	special $0033
	disappear $2
	disappear $3
	disappear $4
	disappear $5
	pause 15
	special $0032
	disappear $8
	moveperson $8, $b, $6
	appear $8
	applymovement $8, KurtSlowpokeWellVictoryMovementData
	spriteface $0, $3
	loadfont
	2writetext KurtLeaveSlowpokeWellText
	closetext
	loadmovesprites
	setbit1 $002b
	variablesprite $6, $4
	domaptrigger GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN, $1
	clearbit1 $06f3
	clearbit1 $06e9
	setbit1 $06f5
	setbit1 $06f6
	setbit1 $06fb
	setbit1 $0740
	clearbit1 $06f9
	clearbit1 $06fd
	clearbit1 $073e
	special $002e
	special $001b
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
	2writetext UnknownText_0x5aaf2
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
	2writetext UnknownText_0x5ab8d
	closetext
	loadmovesprites
	end
; 0x5a681

UnknownScript_0x5a681: ; 0x5a681
	faceplayer
	loadfont
	cry SLOWPOKE
	2writetext UnknownText_0x5abcb
	yesorno
	iftrue UnknownScript_0x5a68f
	loadmovesprites
	end
; 0x5a68f

UnknownScript_0x5a68f: ; 0x5a68f
	2writetext UnknownText_0x5ac09
	closetext
	loadmovesprites
	end
; 0x5a695

UnknownScript_0x5a695: ; 0x5a695
	faceplayer
	loadfont
	2writetext UnknownText_0x5ac61
	cry SLOWPOKE
	closetext
	loadmovesprites
	end
; 0x5a6a0

UnknownScript_0x5a6a0: ; 0x5a6a0
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
	db $0, "KURT: Hey there,", $4f
	db $52, "!", $51
	db "The guard up top", $4f
	db "took off when I", $55
	db "shouted at him.", $51
	db "But then I took a", $4f
	db "tumble down the", $55
	db "WELL.", $51
	db "I slammed down", $4f
	db "hard on my back,", $55
	db "so I can't move.", $51
	db "Rats! If I were", $4f
	db "fit, my #MON", $51
	db "would've punished", $4f
	db "them…", $51
	db "Ah, it can't be", $4f
	db "helped.", $51
	db $52, ", show them", $4f
	db "how gutsy you are", $55
	db "in my place!", $57
; 0x5a7ca

KurtLeaveSlowpokeWellText: ; 0x5a7ca
	db $0, "KURT: Way to go,", $4f
	db $52, "!", $51
	db "TEAM ROCKET has", $4f
	db "taken off.", $51
	db "My back's better", $4f
	db "too. Let's get out", $55
	db "of here.", $57
; 0x5a825

GruntM29SeenText: ; 0x5a825
	db $0, "Darn! I was stand-", $4f
	db "ing guard up top", $51
	db "when some old coot", $4f
	db "yelled at me.", $51
	db "He startled me so", $4f
	db "much that I fell", $55
	db "down here.", $51
	db "I think I'll vent", $4f
	db "my anger by taking", $55
	db "it out on you!", $57
; 0x5a8cc

GruntM29BeatenText: ; 0x5a8cc
	db $0, "Arrgh! This is NOT", $4f
	db "my day!", $57
; 0x5a8e8

TrainerGruntM29SlowpokeProfitText: ; 0x5a8e8
	db $0, "Sure, we've been", $4f
	db "hacking the tails", $51
	db "off SLOWPOKE and", $4f
	db "selling them.", $51
	db "Everything we do", $4f
	db "is for profit.", $51
	db "That's right!", $4f
	db "We're TEAM ROCKET,", $51
	db "and we'll do any-", $4f
	db "thing for money!", $57
; 0x5a98b

GruntM1SeenText: ; 0x5a98b
	db $0, "What do you want?", $51
	db "If you interrupt", $4f
	db "our work, don't", $55
	db "expect any mercy!", $57
; 0x5a9d0

GruntM1BeatenText: ; 0x5a9d0
	db $0, "You did OK today,", $4f
	db "but wait till next", $55
	db "time!", $57
; 0x5a9fc

TrainerGruntM1WhenTalkText: ; 0x5a9fc
	db $0, "Yeah, TEAM ROCKET", $4f
	db "was broken up", $55
	db "three years ago.", $51
	db "But we continued", $4f
	db "our activities", $55
	db "underground.", $51
	db "Now you can have", $4f
	db "fun watching us", $55
	db "stir up trouble!", $57
; 0x5aa8d

GruntM2SeenText: ; 0x5aa8d
	db $0, "Quit taking SLOW-", $4f
	db "POKETAILS?", $51
	db "If we obeyed you,", $4f
	db "TEAM ROCKET's rep", $55
	db "would be ruined!", $57
; 0x5aadf

GruntM2BeatenText: ; 0x5aadf
	db $0, "Just…", $4f
	db "Too strong…", $57
; 0x5aaf2

UnknownText_0x5aaf2: ; 0x5aaf2
	db $0, "We need the money,", $4f
	db "but selling SLOW-", $55
	db "POKETAILS?", $51
	db "It's tough being a", $4f
	db "ROCKET GRUNT!", $57
; 0x5ab43

GruntF1SeenText: ; 0x5ab43
	db $0, "Stop taking TAILS?", $51
	db "Yeah, just try to", $4f
	db "defeat all of us!", $57
; 0x5ab7b

GruntF1BeatenText: ; 0x5ab7b
	db $0, "You rotten brat!", $57
; 0x5ab8d

UnknownText_0x5ab8d: ; 0x5ab8d
	db $0, "SLOWPOKETAILS", $4f
	db "grow back fast!", $51
	db "What's wrong with", $4f
	db "selling them?", $57
; 0x5abcb

UnknownText_0x5abcb: ; 0x5abcb
	db $0, "A SLOWPOKE with", $4f
	db "its TAIL cut off…", $51
	db "Huh? It has MAIL.", $4f
	db "Read it?", $57
; 0x5ac09

UnknownText_0x5ac09: ; 0x5ac09
	db $0, $52, " read the", $4f
	db "MAIL.", $51
	db "Be good and look", $4f
	db "after the house", $51
	db "with Grandpa and", $4f
	db "SLOWPOKE.", $51
	db "Love, Dad", $57
; 0x5ac61

UnknownText_0x5ac61: ; 0x5ac61
	db $0, "A SLOWPOKE with", $4f
	db "its TAIL cut off…", $57
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
	person_event $35, 11, 19, $6, $0, 255, 255, $2, 3, TrainerGruntM29, $06fc
	person_event $35, 6, 9, $6, $0, 255, 255, $2, 1, TrainerGruntM1, $06fc
	person_event $35, 10, 9, $9, $0, 255, 255, $2, 2, TrainerGruntM2, $06fc
	person_event $36, 8, 14, $9, $0, 255, 255, $82, 4, TrainerGruntF1, $06fc
	person_event $45, 8, 11, $1, $0, 255, 255, $80, 0, UnknownScript_0x5a681, $06fb
	person_event $45, 6, 10, $1, $0, 255, 255, $80, 0, UnknownScript_0x5a695, $06fb
	person_event $b, 18, 20, $7, $0, 255, 255, $0, 0, UnknownScript_0x5a5d5, $0740
	person_event $5a, 6, 7, $19, $0, 255, 255, $0, 0, UnknownScript_0x5a6a0, $ffff
	person_event $54, 7, 14, $1, $0, 255, 255, $1, 0, ItemFragment_0x5a6a3, $0662
; 0x5ad09

