LakeofRage_MapScriptHeader:
	; trigger count
	db 2

	; triggers
	dw .Trigger1, $0000
	dw .Trigger2, $0000

	; callback count
	db 2

	; callbacks

	dbw 5, .FlyPoint
	dbw 2, .Wesley

.Trigger1
	end

.Trigger2
	end

.FlyPoint
	setflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	return

.Wesley
	checkcode VAR_WEEKDAY
	if_equal WEDNESDAY, .WesleyAppears
	disappear $b
	return

.WesleyAppears
	appear $b
	return

LanceScript_0x70022:
	checkevent EVENT_REFUSED_TO_HELP_LANCE_AT_LAKE_OF_RAGE
	iftrue UnknownScript_0x70057
	loadfont
	writetext UnknownText_0x70157
	keeptextopen
	faceplayer
	writetext UnknownText_0x701b4
	yesorno
	iffalse UnknownScript_0x7004e
UnknownScript_0x70035:
	writetext UnknownText_0x702c6
	closetext
	loadmovesprites
	playsound SFX_WARP_TO
	applymovement $2, MovementData_0x70155
	disappear $2
	clearevent $06d5
	setevent EVENT_DECIDED_TO_HELP_LANCE
	domaptrigger GROUP_MAHOGANY_MART_1F, MAP_MAHOGANY_MART_1F, $1
	end

UnknownScript_0x7004e:
	writetext UnknownText_0x70371
	closetext
	loadmovesprites
	setevent EVENT_REFUSED_TO_HELP_LANCE_AT_LAKE_OF_RAGE
	end

UnknownScript_0x70057:
	faceplayer
	loadfont
	writetext UnknownText_0x703a5
	yesorno
	iffalse UnknownScript_0x7004e
	jump UnknownScript_0x70035

GyaradosScript_0x70063:
	loadfont
	writetext UnknownText_0x703cb
	pause 15
	cry GYARADOS
	loadmovesprites
	loadpokedata GYARADOS, 30
	writecode VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	if_equal $1, UnknownScript_0x7007a
	disappear $a
UnknownScript_0x7007a:
	returnafterbattle
	loadfont
	giveitem RED_SCALE, $1
	waitbutton
	writetext UnknownText_0x703df
	playsound SFX_ITEM
	waitbutton
	itemnotify
	loadmovesprites
	dotrigger $0
	appear $2
	end

GrampsScript_0x7008e:
	faceplayer
	loadfont
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0x7009c
	writetext UnknownText_0x703f8
	closetext
	loadmovesprites
	end

UnknownScript_0x7009c:
	writetext UnknownText_0x70421
	closetext
	loadmovesprites
	end

SuperNerdScript_0x700a2:
	jumptextfaceplayer UnknownText_0x70444

CooltrainerFScript_0x700a5:
	jumptextfaceplayer UnknownText_0x704bb

MapLakeofRageSignpost0Script:
	jumptext UnknownText_0x708d7

MapLakeofRageSignpost1Script:
	loadfont
	writetext UnknownText_0x70903
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0x700b8
	closetext
	loadmovesprites
	end

UnknownScript_0x700b8:
	keeptextopen
	special Functionfbcd2
	loadmovesprites
	end

TrainerFisherAndre:
	; bit/flag number
	dw $455

	; trainer group && trainer id
	db FISHER, ANDRE

	; text when seen
	dw FisherAndreSeenText

	; text when trainer beaten
	dw FisherAndreBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw FisherAndreScript

FisherAndreScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x7058f
	closetext
	loadmovesprites
	end

TrainerFisherRaymond:
	; bit/flag number
	dw $456

	; trainer group && trainer id
	db FISHER, RAYMOND

	; text when seen
	dw FisherRaymondSeenText

	; text when trainer beaten
	dw FisherRaymondBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw FisherRaymondScript

FisherRaymondScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x70611
	closetext
	loadmovesprites
	end

TrainerCooltrainermAaron:
	; bit/flag number
	dw $549

	; trainer group && trainer id
	db COOLTRAINERM, AARON

	; text when seen
	dw CooltrainermAaronSeenText

	; text when trainer beaten
	dw CooltrainermAaronBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainermAaronScript

CooltrainermAaronScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x7069c
	closetext
	loadmovesprites
	end

TrainerCooltrainerfLois:
	; bit/flag number
	dw $55c

	; trainer group && trainer id
	db COOLTRAINERF, LOIS

	; text when seen
	dw CooltrainerfLoisSeenText

	; text when trainer beaten
	dw CooltrainerfLoisBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainerfLoisScript

CooltrainerfLoisScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x70752
	closetext
	loadmovesprites
	end

WesleyScript:
	faceplayer
	loadfont
	checkevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	iftrue WesleyWednesdayScript
	checkcode VAR_WEEKDAY
	if_not_equal WEDNESDAY, WesleyNotWednesdayScript
	checkevent EVENT_MET_WESLEY_OF_WEDNESDAY
	iftrue .MetWesley
	writetext MeetWesleyText
	keeptextopen
	setevent EVENT_MET_WESLEY_OF_WEDNESDAY
.MetWesley
	writetext WesleyGivesGiftText
	keeptextopen
	verbosegiveitem BLACKBELT, 1
	iffalse WesleyDoneScript
	setevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	writetext WesleyGaveGiftText
	closetext
	loadmovesprites
	end

WesleyWednesdayScript:
	writetext WesleyWednesdayText
	closetext
WesleyDoneScript:
	loadmovesprites
	end

WesleyNotWednesdayScript:
	writetext WesleyNotWednesdayText
	closetext
	loadmovesprites
	end

ItemFragment_0x70148:
	db ELIXER, 1

ItemFragment_0x7014a:
	db TM_DETECT, 1

MapLakeofRageSignpostItem2:
	dw $00b5
	db FULL_RESTORE
	

MapLakeofRageSignpostItem3:
	dw $00b6
	db RARE_CANDY
	

MapLakeofRageSignpostItem4:
	dw $00b7
	db MAX_POTION
	

MovementData_0x70155:
	teleport_from
	step_end

UnknownText_0x70157:
	text "This lake is full"
	line "of GYARADOS but"
	cont "nothing else…"

	para "So the MAGIKARP"
	line "are being forced"
	cont "to evolve…"
	done

UnknownText_0x701b4:
	text "Did you come here"
	line "because of the"
	cont "rumors?"

	para "You're <PLAYER>?"
	line "I'm LANCE, a"
	cont "trainer like you."

	para "I heard some ru-"
	line "mors, so I came to"
	cont "investigate…"

	para "I saw the way you"
	line "battled earlier,"
	cont "<PLAY_G>."

	para "I can tell that"
	line "you're a trainer"

	para "with considerable"
	line "skill."

	para "If you don't mind,"
	line "could you help me"
	cont "investigate?"
	done

UnknownText_0x702c6:
	text "LANCE: Excellent!"

	para "It seems that the"
	line "LAKE's MAGIKARP"

	para "are being forced"
	line "to evolve."

	para "A mysterious radio"
	line "broadcast coming"

	para "from MAHOGANY is"
	line "the cause."

	para "I'll be waiting"
	line "for you, <PLAY_G>."
	done

UnknownText_0x70371:
	text "Oh… Well, if you"
	line "change your mind,"
	cont "please help me."
	done

UnknownText_0x703a5:
	text "LANCE: Hm? Are you"
	line "going to help me?"
	done

UnknownText_0x703cb:
	text "GYARADOS: Gyashaa!"
	done

UnknownText_0x703df:
	text "<PLAYER> obtained a"
	line "RED SCALE."
	done

UnknownText_0x703f8:
	text "The GYARADOS are"
	line "angry!"

	para "It's a bad omen!"
	done

UnknownText_0x70421:
	text "Hahah! The MAGI-"
	line "KARP are biting!"
	done

UnknownText_0x70444:
	text "I heard this lake"
	line "was made by ram-"
	cont "paging GYARADOS."

	para "I wonder if there"
	line "is any connection"

	para "to their mass out-"
	line "break now?"
	done

UnknownText_0x704bb:
	text "Did my eyes de-"
	line "ceive me? I saw a"

	para "red GYARADOS in"
	line "the LAKE…"

	para "But I thought"
	line "GYARADOS were"
	cont "usually blue?"
	done

FisherAndreSeenText:
	text "Let me battle with"
	line "the #MON I just"
	cont "caught!"
	done

FisherAndreBeatenText:
	text "I might be an ex-"
	line "pert angler, but"

	para "I stink as a #-"
	line "MON trainer…"
	done

UnknownText_0x7058f:
	text "I won't lose as an"
	line "angler! I catch"
	cont "#MON all day."
	done

FisherRaymondSeenText:
	text "No matter what I"
	line "do, all I catch"

	para "are the same #-"
	line "MON…"
	done

FisherRaymondBeatenText:
	text "My line's all"
	line "tangled up…"
	done

UnknownText_0x70611:
	text "Why can't I catch"
	line "any good #MON?"
	done

CooltrainermAaronSeenText:
	text "If a trainer spots"
	line "another trainer,"

	para "he has to make a"
	line "challenge."

	para "That is our"
	line "destiny."
	done

CooltrainermAaronBeatenText:
	text "Whew…"
	line "Good battle."
	done

UnknownText_0x7069c:
	text "#MON and their"
	line "trainer become"

	para "powerful through"
	line "constant battling."
	done

CooltrainerfLoisSeenText:
	text "What happened to"
	line "the red GYARADOS?"

	para "It's gone?"

	para "Oh, darn. I came"
	line "here for nothing?"

	para "I know--let's"
	line "battle!"
	done

CooltrainerfLoisBeatenText:
	text "Good going!"
	done

UnknownText_0x70752:
	text "Come to think of"
	line "it, I've seen a"
	cont "pink BUTTERFREE."
	done

MeetWesleyText:
	text "WESLEY: Well, how"
	line "do you do?"

	para "Seeing as how it's"
	line "Wednesday today,"

	para "I'm WESLEY of"
	line "Wednesday."
	done

WesleyGivesGiftText:
	text "Pleased to meet"
	line "you. Please take a"
	cont "souvenir."
	done

WesleyGaveGiftText:
	text "WESLEY: BLACKBELT"
	line "beefs up the power"
	cont "of fighting moves."
	done

WesleyWednesdayText:
	text "WESLEY: Since you"
	line "found me, you must"

	para "have met my broth-"
	line "ers and sisters."

	para "Or did you just"
	line "get lucky?"
	done

WesleyNotWednesdayText:
	text "WESLEY: Today's"
	line "not Wednesday."
	cont "That's too bad."
	done

UnknownText_0x708d7:
	text "LAKE OF RAGE,"
	line "also known as"
	cont "GYARADOS LAKE."
	done

UnknownText_0x70903:
	text "FISHING GURU'S"
	line "HOUSE"
	done

LakeofRage_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $3, $7, 1, GROUP_LAKE_OF_RAGE_HIDDEN_POWER_HOUSE, MAP_LAKE_OF_RAGE_HIDDEN_POWER_HOUSE
	warp_def $1f, $1b, 1, GROUP_LAKE_OF_RAGE_MAGIKARP_HOUSE, MAP_LAKE_OF_RAGE_MAGIKARP_HOUSE

	; xy triggers
	db 0

	; signposts
	db 5
	signpost 27, 21, $0, MapLakeofRageSignpost0Script
	signpost 31, 25, $0, MapLakeofRageSignpost1Script
	signpost 28, 11, $7, MapLakeofRageSignpostItem2
	signpost 4, 4, $7, MapLakeofRageSignpostItem3
	signpost 5, 35, $7, MapLakeofRageSignpostItem4

	; people-events
	db 12
	person_event SPRITE_LANCE, 32, 25, $7, $0, 255, 255, $0, 0, LanceScript_0x70022, $06d4
	person_event SPRITE_GRAMPS, 30, 24, $7, $0, 255, 255, $0, 0, GrampsScript_0x7008e, $ffff
	person_event SPRITE_SUPER_NERD, 17, 40, $8, $0, 255, 255, $0, 0, SuperNerdScript_0x700a2, $ffff
	person_event SPRITE_COOLTRAINER_F, 33, 29, $5, $1, 255, 255, $0, 0, CooltrainerFScript_0x700a5, $ffff
	person_event SPRITE_FISHER, 27, 34, $8, $0, 255, 255, $92, 1, TrainerFisherAndre, $0735
	person_event SPRITE_FISHER, 30, 28, $7, $0, 255, 255, $92, 1, TrainerFisherRaymond, $0735
	person_event SPRITE_COOLTRAINER_M, 19, 8, $9, $0, 255, 255, $82, 1, TrainerCooltrainermAaron, $0735
	person_event SPRITE_COOLTRAINER_F, 11, 40, $8, $0, 255, 255, $82, 0, TrainerCooltrainerfLois, $0735
	person_event SPRITE_GYARADOS, 26, 22, $16, $0, 255, 255, $80, 0, GyaradosScript_0x70063, $0751
	person_event SPRITE_SUPER_NERD, 8, 8, $6, $0, 255, 255, $0, 0, WesleyScript, $075c
	person_event SPRITE_POKE_BALL, 14, 11, $1, $0, 255, 255, $1, 0, ItemFragment_0x70148, $0645
	person_event SPRITE_POKE_BALL, 6, 39, $1, $0, 255, 255, $1, 0, ItemFragment_0x7014a, $0646
