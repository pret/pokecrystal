const_value set 2
	const UNIONCAVEB2F_ROCKER
	const UNIONCAVEB2F_COOLTRAINER_F1
	const UNIONCAVEB2F_COOLTRAINER_F2
	const UNIONCAVEB2F_POKE_BALL1
	const UNIONCAVEB2F_POKE_BALL2
	const UNIONCAVEB2F_LAPRAS

UnionCaveB2F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_OBJECTS, .Lapras

.Lapras:
	checkflag ENGINE_UNION_CAVE_LAPRAS
	iftrue .NoAppear
	checkcode VAR_WEEKDAY
	if_equal FRIDAY, .Appear
.NoAppear:
	disappear UNIONCAVEB2F_LAPRAS
	return

.Appear:
	appear UNIONCAVEB2F_LAPRAS
	return

UnionCaveLapras:
	faceplayer
	cry LAPRAS
	loadwildmon LAPRAS, 20
	startbattle
	disappear UNIONCAVEB2F_LAPRAS
	setflag ENGINE_UNION_CAVE_LAPRAS
	reloadmapafterbattle
	end

TrainerCooltrainermNick:
	trainer EVENT_BEAT_COOLTRAINERM_NICK, COOLTRAINERM, NICK, CooltrainermNickSeenText, CooltrainermNickBeatenText, 0, CooltrainermNickScript

CooltrainermNickScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5a3f0
	waitbutton
	closetext
	end

TrainerCooltrainerfGwen:
	trainer EVENT_BEAT_COOLTRAINERF_GWEN, COOLTRAINERF, GWEN, CooltrainerfGwenSeenText, CooltrainerfGwenBeatenText, 0, CooltrainerfGwenScript

CooltrainerfGwenScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5a488
	waitbutton
	closetext
	end

TrainerCooltrainerfEmma:
	trainer EVENT_BEAT_COOLTRAINERF_EMMA, COOLTRAINERF, EMMA, CooltrainerfEmmaSeenText, CooltrainerfEmmaBeatenText, 0, CooltrainerfEmmaScript

CooltrainerfEmmaScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5a52b
	waitbutton
	closetext
	end

UnionCaveB2FElixer:
	itemball ELIXER

UnionCaveB2FHyperPotion:
	itemball HYPER_POTION

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
	warp_def $3, $5, 5, UNION_CAVE_B1F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 6
	person_event SPRITE_ROCKER, 19, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerCooltrainermNick, -1
	person_event SPRITE_COOLTRAINER_F, 13, 5, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerCooltrainerfGwen, -1
	person_event SPRITE_COOLTRAINER_F, 30, 3, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerCooltrainerfEmma, -1
	person_event SPRITE_POKE_BALL, 2, 16, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, UnionCaveB2FElixer, EVENT_UNION_CAVE_B2F_ELIXER
	person_event SPRITE_POKE_BALL, 19, 12, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, UnionCaveB2FHyperPotion, EVENT_UNION_CAVE_B2F_HYPER_POTION
	person_event SPRITE_SURF, 31, 11, SPRITEMOVEDATA_LAPRAS, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, UnionCaveLapras, EVENT_UNION_CAVE_B2F_LAPRAS
