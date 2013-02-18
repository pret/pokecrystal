UnionCaveB2F_MapScriptHeader: ; 0x5a308
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x5a30d
; 0x5a30d

UnknownScript_0x5a30d: ; 0x5a30d
	checkbit2 $0059
	iftrue UnknownScript_0x5a319
	checkcode $b
	if_equal FRIDAY, UnknownScript_0x5a31c
UnknownScript_0x5a319: ; 0x5a319
	disappear $7
	return
; 0x5a31c

UnknownScript_0x5a31c: ; 0x5a31c
	appear $7
	return
; 0x5a31f

UnknownScript_0x5a31f: ; 0x5a31f
	faceplayer
	cry LAPRAS
	loadpokedata LAPRAS, 20
	startbattle
	disappear $7
	setbit2 $0059
	returnafterbattle
	end
; 0x5a32e

TrainerCooltrainermNick: ; 0x5a32e
	; bit/flag number
	dw $548

	; trainer group && trainer id
	db COOLTRAINERM, NICK

	; text when seen
	dw CooltrainermNickSeenText

	; text when trainer beaten
	dw CooltrainermNickBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainermNickScript
; 0x5a33a

CooltrainermNickScript: ; 0x5a33a
	talkaftercancel
	loadfont
	2writetext UnknownText_0x5a3f0
	closetext
	loadmovesprites
	end
; 0x5a342

TrainerCooltrainerfGwen: ; 0x5a342
	; bit/flag number
	dw $55b

	; trainer group && trainer id
	db COOLTRAINERF, GWEN

	; text when seen
	dw CooltrainerfGwenSeenText

	; text when trainer beaten
	dw CooltrainerfGwenBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainerfGwenScript
; 0x5a34e

CooltrainerfGwenScript: ; 0x5a34e
	talkaftercancel
	loadfont
	2writetext UnknownText_0x5a488
	closetext
	loadmovesprites
	end
; 0x5a356

TrainerCooltrainerfEmma: ; 0x5a356
	; bit/flag number
	dw $569

	; trainer group && trainer id
	db COOLTRAINERF, EMMA

	; text when seen
	dw CooltrainerfEmmaSeenText

	; text when trainer beaten
	dw CooltrainerfEmmaBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainerfEmmaScript
; 0x5a362

CooltrainerfEmmaScript: ; 0x5a362
	talkaftercancel
	loadfont
	2writetext UnknownText_0x5a52b
	closetext
	loadmovesprites
	end
; 0x5a36a

ItemFragment_0x5a36a: ; 0x5a36a
	db ELIXER, 1
; 0x5a36c

ItemFragment_0x5a36c: ; 0x5a36c
	db HYPER_POTION, 1
; 0x5a36e

CooltrainermNickSeenText: ; 0x5a36e
	db $0, "There are two", $4f
	db "kinds of people.", $51
	db "Those who have", $4f
	db "style, and those", $55
	db "who don't.", $51
	db "What kind of", $4f
	db "person are you?", $57
; 0x5a3d5

CooltrainermNickBeatenText: ; 0x5a3d5
	db $0, "You've got", $4f
	db "dazzling style!", $57
; 0x5a3f0

UnknownText_0x5a3f0: ; 0x5a3f0
	db $0, "Your #MON style", $4f
	db "is stunning and", $55
	db "colorful, I admit.", $51
	db "You'll just keep", $4f
	db "getting better!", $57
; 0x5a444

CooltrainerfGwenSeenText: ; 0x5a444
	db $0, "I'm in training.", $4f
	db "Care for a round?", $57
; 0x5a467

CooltrainerfGwenBeatenText: ; 0x5a467
	db $0, "Aww, no! You're", $4f
	db "too good for me.", $57
; 0x5a488

UnknownText_0x5a488: ; 0x5a488
	db $0, "I'm going to train", $4f
	db "by myself until I", $55
	db "improve.", $57
; 0x5a4b6

CooltrainerfEmmaSeenText: ; 0x5a4b6
	db $0, "If the #MON I", $4f
	db "liked were there,", $55
	db "I'd go anywhere.", $51
	db "That's what a real", $4f
	db "trainer does.", $57
; 0x5a507

CooltrainerfEmmaBeatenText: ; 0x5a507
	db $0, "I'd rather pet my", $4f
	db "babies than this!", $57
; 0x5a52b

UnknownText_0x5a52b: ; 0x5a52b
	db $0, "Just once a week,", $4f
	db "a #MON comes to", $55
	db "the water's edge.", $51
	db "I wanted to see", $4f
	db "that #MON…", $57
; 0x5a57a

UnionCaveB2F_MapEventHeader: ; 0x5a57a
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $3, $5, 5, GROUP_UNION_CAVE_B1F, MAP_UNION_CAVE_B1F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 6
	person_event $2c, 23, 19, $6, $0, 255, 255, $82, 3, TrainerCooltrainermNick, $ffff
	person_event $24, 17, 9, $a, $0, 255, 255, $82, 1, TrainerCooltrainerfGwen, $ffff
	person_event $24, 34, 7, $7, $0, 255, 255, $82, 3, TrainerCooltrainerfEmma, $ffff
	person_event $54, 6, 20, $1, $0, 255, 255, $1, 0, ItemFragment_0x5a36a, $0660
	person_event $54, 23, 16, $1, $0, 255, 255, $1, 0, ItemFragment_0x5a36c, $0661
	person_event $53, 35, 15, $24, $11, 255, 255, $90, 0, UnknownScript_0x5a31f, $0760
; 0x5a5d3

