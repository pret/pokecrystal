UnionCaveB2F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
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
	trainer EVENT_BEAT_COOLTRAINERM_NICK, COOLTRAINERM, NICK, CooltrainermNickSeenText, CooltrainermNickBeatenText, $0000, CooltrainermNickScript

CooltrainermNickScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x5a3f0
	closetext
	loadmovesprites
	end

TrainerCooltrainerfGwen:
	trainer EVENT_BEAT_COOLTRAINERF_GWEN, COOLTRAINERF, GWEN, CooltrainerfGwenSeenText, CooltrainerfGwenBeatenText, $0000, CooltrainerfGwenScript

CooltrainerfGwenScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x5a488
	closetext
	loadmovesprites
	end

TrainerCooltrainerfEmma:
	trainer EVENT_BEAT_COOLTRAINERF_EMMA, COOLTRAINERF, EMMA, CooltrainerfEmmaSeenText, CooltrainerfEmmaBeatenText, $0000, CooltrainerfEmmaScript

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

.Warps:
	db 1
	warp_def $3, $5, 5, GROUP_UNION_CAVE_B1F, MAP_UNION_CAVE_B1F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 6
	person_event SPRITE_ROCKER, 23, 19, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $82, 3, TrainerCooltrainermNick, -1
	person_event SPRITE_COOLTRAINER_F, 17, 9, OW_LEFT | $2, $0, -1, -1, (PAL_OW_RED << 4) | $82, 1, TrainerCooltrainerfGwen, -1
	person_event SPRITE_COOLTRAINER_F, 34, 7, OW_UP | $3, $0, -1, -1, (PAL_OW_RED << 4) | $82, 3, TrainerCooltrainerfEmma, -1
	person_event SPRITE_POKE_BALL, 6, 20, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x5a36a, EVENT_UNION_CAVE_B2F_ELIXER
	person_event SPRITE_POKE_BALL, 23, 16, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x5a36c, EVENT_UNION_CAVE_B2F_HYPER_POTION
	person_event SPRITE_SURF, 35, 15, OW_UP | $20, $11, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, SurfScript_0x5a31f, EVENT_UNION_CAVE_B2F_LAPRAS
