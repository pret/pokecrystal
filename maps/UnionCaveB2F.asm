UnionCaveB2F_MapScriptHeader: ; 0x5a308
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x5a30d
; 0x5a30d

UnknownScript_0x5a30d: ; 0x5a30d
	checkflag $0059
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

SurfScript_0x5a31f: ; 0x5a31f
	faceplayer
	cry LAPRAS
	loadpokedata LAPRAS, 20
	startbattle
	disappear $7
	setflag $0059
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
	writetext UnknownText_0x5a3f0
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
	writetext UnknownText_0x5a488
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
	writetext UnknownText_0x5a52b
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
	text "There are two"
	line "kinds of people."

	para "Those who have"
	line "style, and those"
	cont "who don't."

	para "What kind of"
	line "person are you?"
	done
; 0x5a3d5

CooltrainermNickBeatenText: ; 0x5a3d5
	text "You've got"
	line "dazzling style!"
	done
; 0x5a3f0

UnknownText_0x5a3f0: ; 0x5a3f0
	text "Your #MON style"
	line "is stunning and"
	cont "colorful, I admit."

	para "You'll just keep"
	line "getting better!"
	done
; 0x5a444

CooltrainerfGwenSeenText: ; 0x5a444
	text "I'm in training."
	line "Care for a round?"
	done
; 0x5a467

CooltrainerfGwenBeatenText: ; 0x5a467
	text "Aww, no! You're"
	line "too good for me."
	done
; 0x5a488

UnknownText_0x5a488: ; 0x5a488
	text "I'm going to train"
	line "by myself until I"
	cont "improve."
	done
; 0x5a4b6

CooltrainerfEmmaSeenText: ; 0x5a4b6
	text "If the #MON I"
	line "liked were there,"
	cont "I'd go anywhere."

	para "That's what a real"
	line "trainer does."
	done
; 0x5a507

CooltrainerfEmmaBeatenText: ; 0x5a507
	text "I'd rather pet my"
	line "babies than this!"
	done
; 0x5a52b

UnknownText_0x5a52b: ; 0x5a52b
	text "Just once a week,"
	line "a #MON comes to"
	cont "the water's edge."

	para "I wanted to see"
	line "that #MON…"
	done
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
	person_event SPRITE_ROCKER, 23, 19, $6, $0, 255, 255, $82, 3, TrainerCooltrainermNick, $ffff
	person_event SPRITE_COOLTRAINER_F, 17, 9, $a, $0, 255, 255, $82, 1, TrainerCooltrainerfGwen, $ffff
	person_event SPRITE_COOLTRAINER_F, 34, 7, $7, $0, 255, 255, $82, 3, TrainerCooltrainerfEmma, $ffff
	person_event SPRITE_POKE_BALL, 6, 20, $1, $0, 255, 255, $1, 0, ItemFragment_0x5a36a, $0660
	person_event SPRITE_POKE_BALL, 23, 16, $1, $0, 255, 255, $1, 0, ItemFragment_0x5a36c, $0661
	person_event SPRITE_SURF, 35, 15, $24, $11, 255, 255, $90, 0, SurfScript_0x5a31f, $0760
; 0x5a5d3
