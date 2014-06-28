LakeofRage_MapScriptHeader: ; 0x70000
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x70010, $0000
	dw UnknownScript_0x70011, $0000

	; callback count
	db 2

	; callbacks

	dbw 5, UnknownScript_0x70012

	dbw 2, UnknownScript_0x70016
; 0x70010

UnknownScript_0x70010: ; 0x70010
	end
; 0x70011

UnknownScript_0x70011: ; 0x70011
	end
; 0x70012

UnknownScript_0x70012: ; 0x70012
	setflag $004a
	return
; 0x70016

UnknownScript_0x70016: ; 0x70016
	checkcode $b
	if_equal WEDNESDAY, UnknownScript_0x7001f
	disappear $b
	return
; 0x7001f

UnknownScript_0x7001f: ; 0x7001f
	appear $b
	return
; 0x70022

LanceScript_0x70022: ; 0x70022
	checkevent EVENT_REFUSED_TO_HELP_LANCE_AT_LAKE_OF_RAGE
	iftrue UnknownScript_0x70057
	loadfont
	2writetext UnknownText_0x70157
	keeptextopen
	faceplayer
	2writetext UnknownText_0x701b4
	yesorno
	iffalse UnknownScript_0x7004e
UnknownScript_0x70035: ; 0x70035
	2writetext UnknownText_0x702c6
	closetext
	loadmovesprites
	playsound SFX_WARP_TO
	applymovement $2, MovementData_0x70155
	disappear $2
	clearevent $06d5
	setevent EVENT_DECIDED_TO_HELP_LANCE
	domaptrigger GROUP_MAHOGANY_MART_1F, MAP_MAHOGANY_MART_1F, $1
	end
; 0x7004e

UnknownScript_0x7004e: ; 0x7004e
	2writetext UnknownText_0x70371
	closetext
	loadmovesprites
	setevent EVENT_REFUSED_TO_HELP_LANCE_AT_LAKE_OF_RAGE
	end
; 0x70057

UnknownScript_0x70057: ; 0x70057
	faceplayer
	loadfont
	2writetext UnknownText_0x703a5
	yesorno
	iffalse UnknownScript_0x7004e
	2jump UnknownScript_0x70035
; 0x70063

GyaradosScript_0x70063: ; 0x70063
	loadfont
	2writetext UnknownText_0x703cb
	pause 15
	cry GYARADOS
	loadmovesprites
	loadpokedata GYARADOS, 30
	writecode $3, BATTLETYPE_SHINY
	startbattle
	if_equal $1, UnknownScript_0x7007a
	disappear $a
UnknownScript_0x7007a: ; 0x7007a
	returnafterbattle
	loadfont
	giveitem RED_SCALE, $1
	waitbutton
	2writetext UnknownText_0x703df
	playsound SFX_ITEM
	waitbutton
	itemnotify
	loadmovesprites
	dotrigger $0
	appear $2
	end
; 0x7008e

GrampsScript_0x7008e: ; 0x7008e
	faceplayer
	loadfont
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0x7009c
	2writetext UnknownText_0x703f8
	closetext
	loadmovesprites
	end
; 0x7009c

UnknownScript_0x7009c: ; 0x7009c
	2writetext UnknownText_0x70421
	closetext
	loadmovesprites
	end
; 0x700a2

SuperNerdScript_0x700a2: ; 0x700a2
	jumptextfaceplayer UnknownText_0x70444
; 0x700a5

CooltrainerFScript_0x700a5: ; 0x700a5
	jumptextfaceplayer UnknownText_0x704bb
; 0x700a8

MapLakeofRageSignpost0Script: ; 0x700a8
	jumptext UnknownText_0x708d7
; 0x700ab

MapLakeofRageSignpost1Script: ; 0x700ab
	loadfont
	2writetext UnknownText_0x70903
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0x700b8
	closetext
	loadmovesprites
	end
; 0x700b8

UnknownScript_0x700b8: ; 0x700b8
	keeptextopen
	special $001a
	loadmovesprites
	end
; 0x700be

TrainerFisherAndre: ; 0x700be
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
; 0x700ca

FisherAndreScript: ; 0x700ca
	talkaftercancel
	loadfont
	2writetext UnknownText_0x7058f
	closetext
	loadmovesprites
	end
; 0x700d2

TrainerFisherRaymond: ; 0x700d2
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
; 0x700de

FisherRaymondScript: ; 0x700de
	talkaftercancel
	loadfont
	2writetext UnknownText_0x70611
	closetext
	loadmovesprites
	end
; 0x700e6

TrainerCooltrainermAaron: ; 0x700e6
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
; 0x700f2

CooltrainermAaronScript: ; 0x700f2
	talkaftercancel
	loadfont
	2writetext UnknownText_0x7069c
	closetext
	loadmovesprites
	end
; 0x700fa

TrainerCooltrainerfLois: ; 0x700fa
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
; 0x70106

CooltrainerfLoisScript: ; 0x70106
	talkaftercancel
	loadfont
	2writetext UnknownText_0x70752
	closetext
	loadmovesprites
	end
; 0x7010e

SuperNerdScript_0x7010e: ; 0x7010e
	faceplayer
	loadfont
	checkevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	iftrue UnknownScript_0x7013c
	checkcode $b
	if_not_equal WEDNESDAY, UnknownScript_0x70142
	checkevent EVENT_MET_WESLEY_OF_WEDNESDAY
	iftrue UnknownScript_0x70129
	2writetext UnknownText_0x70784
	keeptextopen
	setevent EVENT_MET_WESLEY_OF_WEDNESDAY
UnknownScript_0x70129: ; 0x70129
	2writetext UnknownText_0x707dd
	keeptextopen
	verbosegiveitem BLACKBELT, 1
	iffalse UnknownScript_0x70140
	setevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	2writetext UnknownText_0x7080b
	closetext
	loadmovesprites
	end
; 0x7013c

UnknownScript_0x7013c: ; 0x7013c
	2writetext UnknownText_0x70844
	closetext
UnknownScript_0x70140: ; 0x70140
	loadmovesprites
	end
; 0x70142

UnknownScript_0x70142: ; 0x70142
	2writetext UnknownText_0x708a9
	closetext
	loadmovesprites
	end
; 0x70148

ItemFragment_0x70148: ; 0x70148
	db ELIXER, 1
; 0x7014a

ItemFragment_0x7014a: ; 0x7014a
	db TM_43, 1
; 0x7014c

MapLakeofRageSignpostItem2: ; 0x7014c
	dw $00b5
	db FULL_RESTORE
	
; 0x7014f

MapLakeofRageSignpostItem3: ; 0x7014f
	dw $00b6
	db RARE_CANDY
	
; 0x70152

MapLakeofRageSignpostItem4: ; 0x70152
	dw $00b7
	db MAX_POTION
	
; 0x70155

MovementData_0x70155: ; 0x70155
	teleport_from
	step_end
; 0x70157

UnknownText_0x70157: ; 0x70157
	text "This lake is full"
	line "of GYARADOS but"
	cont "nothing else…"

	para "So the MAGIKARP"
	line "are being forced"
	cont "to evolve…"
	done
; 0x701b4

UnknownText_0x701b4: ; 0x701b4
	text "Did you come here"
	line "because of the"
	cont "rumors?"

	para "You're ", $52, "?"
	line "I'm LANCE, a"
	cont "trainer like you."

	para "I heard some ru-"
	line "mors, so I came to"
	cont "investigate…"

	para "I saw the way you"
	line "battled earlier,"
	cont $14, "."

	para "I can tell that"
	line "you're a trainer"

	para "with considerable"
	line "skill."

	para "If you don't mind,"
	line "could you help me"
	cont "investigate?"
	done
; 0x702c6

UnknownText_0x702c6: ; 0x702c6
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
	line "for you, ", $14, "."
	done
; 0x70371

UnknownText_0x70371: ; 0x70371
	text "Oh… Well, if you"
	line "change your mind,"
	cont "please help me."
	done
; 0x703a5

UnknownText_0x703a5: ; 0x703a5
	text "LANCE: Hm? Are you"
	line "going to help me?"
	done
; 0x703cb

UnknownText_0x703cb: ; 0x703cb
	text "GYARADOS: Gyashaa!"
	done
; 0x703df

UnknownText_0x703df: ; 0x703df
	text $52, " obtained a"
	line "RED SCALE."
	done
; 0x703f8

UnknownText_0x703f8: ; 0x703f8
	text "The GYARADOS are"
	line "angry!"

	para "It's a bad omen!"
	done
; 0x70421

UnknownText_0x70421: ; 0x70421
	text "Hahah! The MAGI-"
	line "KARP are biting!"
	done
; 0x70444

UnknownText_0x70444: ; 0x70444
	text "I heard this lake"
	line "was made by ram-"
	cont "paging GYARADOS."

	para "I wonder if there"
	line "is any connection"

	para "to their mass out-"
	line "break now?"
	done
; 0x704bb

UnknownText_0x704bb: ; 0x704bb
	text "Did my eyes de-"
	line "ceive me? I saw a"

	para "red GYARADOS in"
	line "the LAKE…"

	para "But I thought"
	line "GYARADOS were"
	cont "usually blue?"
	done
; 0x70522

FisherAndreSeenText: ; 0x70522
	text "Let me battle with"
	line "the #MON I just"
	cont "caught!"
	done
; 0x7054e

FisherAndreBeatenText: ; 0x7054e
	text "I might be an ex-"
	line "pert angler, but"

	para "I stink as a #-"
	line "MON trainer…"
	done
; 0x7058f

UnknownText_0x7058f: ; 0x7058f
	text "I won't lose as an"
	line "angler! I catch"
	cont "#MON all day."
	done
; 0x705c0

FisherRaymondSeenText: ; 0x705c0
	text "No matter what I"
	line "do, all I catch"

	para "are the same #-"
	line "MON…"
	done
; 0x705f7

FisherRaymondBeatenText: ; 0x705f7
	text "My line's all"
	line "tangled up…"
	done
; 0x70611

UnknownText_0x70611: ; 0x70611
	text "Why can't I catch"
	line "any good #MON?"
	done
; 0x70632

CooltrainermAaronSeenText: ; 0x70632
	text "If a trainer spots"
	line "another trainer,"

	para "he has to make a"
	line "challenge."

	para "That is our"
	line "destiny."
	done
; 0x70688

CooltrainermAaronBeatenText: ; 0x70688
	text "Whew…"
	line "Good battle."
	done
; 0x7069c

UnknownText_0x7069c: ; 0x7069c
	text "#MON and their"
	line "trainer become"

	para "powerful through"
	line "constant battling."
	done
; 0x706df

CooltrainerfLoisSeenText: ; 0x706df
	text "What happened to"
	line "the red GYARADOS?"

	para "It's gone?"

	para "Oh, darn. I came"
	line "here for nothing?"

	para "I know--let's"
	line "battle!"
	done
; 0x70745

CooltrainerfLoisBeatenText: ; 0x70745
	text "Good going!"
	done
; 0x70752

UnknownText_0x70752: ; 0x70752
	text "Come to think of"
	line "it, I've seen a"
	cont "pink BUTTERFREE."
	done
; 0x70784

UnknownText_0x70784: ; 0x70784
	text "WESLEY: Well, how"
	line "do you do?"

	para "Seeing as how it's"
	line "Wednesday today,"

	para "I'm WESLEY of"
	line "Wednesday."
	done
; 0x707dd

UnknownText_0x707dd: ; 0x707dd
	text "Pleased to meet"
	line "you. Please take a"
	cont "souvenir."
	done
; 0x7080b

UnknownText_0x7080b: ; 0x7080b
	text "WESLEY: BLACKBELT"
	line "beefs up the power"
	cont "of fighting moves."
	done
; 0x70844

UnknownText_0x70844: ; 0x70844
	text "WESLEY: Since you"
	line "found me, you must"

	para "have met my broth-"
	line "ers and sisters."

	para "Or did you just"
	line "get lucky?"
	done
; 0x708a9

UnknownText_0x708a9: ; 0x708a9
	text "WESLEY: Today's"
	line "not Wednesday."
	cont "That's too bad."
	done
; 0x708d7

UnknownText_0x708d7: ; 0x708d7
	text "LAKE OF RAGE,"
	line "also known as"
	cont "GYARADOS LAKE."
	done
; 0x70903

UnknownText_0x70903: ; 0x70903
	text "FISHING GURU'S"
	line "HOUSE"
	done
; 0x70919

LakeofRage_MapEventHeader: ; 0x70919
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
	person_event SPRITE_SUPER_NERD, 8, 8, $6, $0, 255, 255, $0, 0, SuperNerdScript_0x7010e, $075c
	person_event SPRITE_POKE_BALL, 14, 11, $1, $0, 255, 255, $1, 0, ItemFragment_0x70148, $0645
	person_event SPRITE_POKE_BALL, 6, 39, $1, $0, 255, 255, $1, 0, ItemFragment_0x7014a, $0646
; 0x709de

