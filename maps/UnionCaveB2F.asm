UnionCaveB2F_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x5a30d

UnknownScript_0x5a30d:
	checkflag ENGINE_UNION_CAVE_LAPRAS
	iftrue UnknownScript_0x5a319
	checkcode VAR_WEEKDAY
	if_equal FRIDAY, UnknownScript_0x5a31c
UnknownScript_0x5a319:
	disappear $7
	return

UnknownScript_0x5a31c:
	appear $7
	return

SurfScript_0x5a31f:
	faceplayer
	cry LAPRAS
	loadpokedata LAPRAS, 20
	startbattle
	disappear $7
	setflag ENGINE_UNION_CAVE_LAPRAS
	returnafterbattle
	end

TrainerCooltrainermNick:
	; bit/flag number
	dw EVENT_BEAT_COOLTRAINERM_NICK

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

CooltrainermNickScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x5a3f0
	closetext
	loadmovesprites
	end

TrainerCooltrainerfGwen:
	; bit/flag number
	dw EVENT_BEAT_COOLTRAINERF_GWEN

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

CooltrainerfGwenScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x5a488
	closetext
	loadmovesprites
	end

TrainerCooltrainerfEmma:
	; bit/flag number
	dw EVENT_BEAT_COOLTRAINERF_EMMA

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

CooltrainerfEmmaScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x5a52b
	closetext
	loadmovesprites
	end

ItemFragment_0x5a36a:
	db ELIXER, 1

ItemFragment_0x5a36c:
	db HYPER_POTION, 1

CooltrainermNickSeenText:
	text "There are two"
	line "kinds of people."

	para "Those who have"
	line "style, and those"
	cont "who don't."

	para "What kind of"
	line "person are you?"
	done

CooltrainermNickBeatenText:
	text "You've got"
	line "dazzling style!"
	done

UnknownText_0x5a3f0:
	text "Your #MON style"
	line "is stunning and"
	cont "colorful, I admit."

	para "You'll just keep"
	line "getting better!"
	done

CooltrainerfGwenSeenText:
	text "I'm in training."
	line "Care for a round?"
	done

CooltrainerfGwenBeatenText:
	text "Aww, no! You're"
	line "too good for me."
	done

UnknownText_0x5a488:
	text "I'm going to train"
	line "by myself until I"
	cont "improve."
	done

CooltrainerfEmmaSeenText:
	text "If the #MON I"
	line "liked were there,"
	cont "I'd go anywhere."

	para "That's what a real"
	line "trainer does."
	done

CooltrainerfEmmaBeatenText:
	text "I'd rather pet my"
	line "babies than this!"
	done

UnknownText_0x5a52b:
	text "Just once a week,"
	line "a #MON comes to"
	cont "the water's edge."

	para "I wanted to see"
	line "that #MON…"
	done

UnionCaveB2F_MapEventHeader:
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
	person_event SPRITE_ROCKER, 23, 19, $6, $0, 255, 255, $82, 3, TrainerCooltrainermNick, EVENT_ALWAYS_THERE
	person_event SPRITE_COOLTRAINER_F, 17, 9, $a, $0, 255, 255, $82, 1, TrainerCooltrainerfGwen, EVENT_ALWAYS_THERE
	person_event SPRITE_COOLTRAINER_F, 34, 7, $7, $0, 255, 255, $82, 3, TrainerCooltrainerfEmma, EVENT_ALWAYS_THERE
	person_event SPRITE_POKE_BALL, 6, 20, $1, $0, 255, 255, $1, 0, ItemFragment_0x5a36a, EVENT_660
	person_event SPRITE_POKE_BALL, 23, 16, $1, $0, 255, 255, $1, 0, ItemFragment_0x5a36c, EVENT_661
	person_event SPRITE_SURF, 35, 15, $24, $11, 255, 255, $90, 0, SurfScript_0x5a31f, EVENT_760
