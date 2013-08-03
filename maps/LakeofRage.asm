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
	setbit2 $004a
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
	checkbit1 $0026
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
	playsound $0013
	applymovement $2, MovementData_0x70155
	disappear $2
	clearbit1 $06d5
	setbit1 $0060
	domaptrigger GROUP_MAHOGANY_MART_1F, MAP_MAHOGANY_MART_1F, $1
	end
; 0x7004e

UnknownScript_0x7004e: ; 0x7004e
	2writetext UnknownText_0x70371
	closetext
	loadmovesprites
	setbit1 $0026
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
	writecode $3, $7
	startbattle
	if_equal $1, UnknownScript_0x7007a
	disappear $a
UnknownScript_0x7007a: ; 0x7007a
	returnafterbattle
	loadfont
	giveitem RED_SCALE, $1
	waitbutton
	2writetext UnknownText_0x703df
	playsound $0001
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
	checkbit1 $0022
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
	checkbit1 $0022
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
	checkbit1 $006b
	iftrue UnknownScript_0x7013c
	checkcode $b
	if_not_equal WEDNESDAY, UnknownScript_0x70142
	checkbit1 $006a
	iftrue UnknownScript_0x70129
	2writetext UnknownText_0x70784
	keeptextopen
	setbit1 $006a
UnknownScript_0x70129: ; 0x70129
	2writetext UnknownText_0x707dd
	keeptextopen
	verbosegiveitem BLACKBELT, 1
	iffalse UnknownScript_0x70140
	setbit1 $006b
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
	db $0, "This lake is full", $4f
	db "of GYARADOS but", $55
	db "nothing else…", $51
	db "So the MAGIKARP", $4f
	db "are being forced", $55
	db "to evolve…", $57
; 0x701b4

UnknownText_0x701b4: ; 0x701b4
	db $0, "Did you come here", $4f
	db "because of the", $55
	db "rumors?", $51
	db "You're ", $52, "?", $4f
	db "I'm LANCE, a", $55
	db "trainer like you.", $51
	db "I heard some ru-", $4f
	db "mors, so I came to", $55
	db "investigate…", $51
	db "I saw the way you", $4f
	db "battled earlier,", $55
	db $14, ".", $51
	db "I can tell that", $4f
	db "you're a trainer", $51
	db "with considerable", $4f
	db "skill.", $51
	db "If you don't mind,", $4f
	db "could you help me", $55
	db "investigate?", $57
; 0x702c6

UnknownText_0x702c6: ; 0x702c6
	db $0, "LANCE: Excellent!", $51
	db "It seems that the", $4f
	db "LAKE's MAGIKARP", $51
	db "are being forced", $4f
	db "to evolve.", $51
	db "A mysterious radio", $4f
	db "broadcast coming", $51
	db "from MAHOGANY is", $4f
	db "the cause.", $51
	db "I'll be waiting", $4f
	db "for you, ", $14, ".", $57
; 0x70371

UnknownText_0x70371: ; 0x70371
	db $0, "Oh… Well, if you", $4f
	db "change your mind,", $55
	db "please help me.", $57
; 0x703a5

UnknownText_0x703a5: ; 0x703a5
	db $0, "LANCE: Hm? Are you", $4f
	db "going to help me?", $57
; 0x703cb

UnknownText_0x703cb: ; 0x703cb
	db $0, "GYARADOS: Gyashaa!", $57
; 0x703df

UnknownText_0x703df: ; 0x703df
	db $0, $52, " obtained a", $4f
	db "RED SCALE.", $57
; 0x703f8

UnknownText_0x703f8: ; 0x703f8
	db $0, "The GYARADOS are", $4f
	db "angry!", $51
	db "It's a bad omen!", $57
; 0x70421

UnknownText_0x70421: ; 0x70421
	db $0, "Hahah! The MAGI-", $4f
	db "KARP are biting!", $57
; 0x70444

UnknownText_0x70444: ; 0x70444
	db $0, "I heard this lake", $4f
	db "was made by ram-", $55
	db "paging GYARADOS.", $51
	db "I wonder if there", $4f
	db "is any connection", $51
	db "to their mass out-", $4f
	db "break now?", $57
; 0x704bb

UnknownText_0x704bb: ; 0x704bb
	db $0, "Did my eyes de-", $4f
	db "ceive me? I saw a", $51
	db "red GYARADOS in", $4f
	db "the LAKE…", $51
	db "But I thought", $4f
	db "GYARADOS were", $55
	db "usually blue?", $57
; 0x70522

FisherAndreSeenText: ; 0x70522
	db $0, "Let me battle with", $4f
	db "the #MON I just", $55
	db "caught!", $57
; 0x7054e

FisherAndreBeatenText: ; 0x7054e
	db $0, "I might be an ex-", $4f
	db "pert angler, but", $51
	db "I stink as a #-", $4f
	db "MON trainer…", $57
; 0x7058f

UnknownText_0x7058f: ; 0x7058f
	db $0, "I won't lose as an", $4f
	db "angler! I catch", $55
	db "#MON all day.", $57
; 0x705c0

FisherRaymondSeenText: ; 0x705c0
	db $0, "No matter what I", $4f
	db "do, all I catch", $51
	db "are the same #-", $4f
	db "MON…", $57
; 0x705f7

FisherRaymondBeatenText: ; 0x705f7
	db $0, "My line's all", $4f
	db "tangled up…", $57
; 0x70611

UnknownText_0x70611: ; 0x70611
	db $0, "Why can't I catch", $4f
	db "any good #MON?", $57
; 0x70632

CooltrainermAaronSeenText: ; 0x70632
	db $0, "If a trainer spots", $4f
	db "another trainer,", $51
	db "he has to make a", $4f
	db "challenge.", $51
	db "That is our", $4f
	db "destiny.", $57
; 0x70688

CooltrainermAaronBeatenText: ; 0x70688
	db $0, "Whew…", $4f
	db "Good battle.", $57
; 0x7069c

UnknownText_0x7069c: ; 0x7069c
	db $0, "#MON and their", $4f
	db "trainer become", $51
	db "powerful through", $4f
	db "constant battling.", $57
; 0x706df

CooltrainerfLoisSeenText: ; 0x706df
	db $0, "What happened to", $4f
	db "the red GYARADOS?", $51
	db "It's gone?", $51
	db "Oh, darn. I came", $4f
	db "here for nothing?", $51
	db "I know--let's", $4f
	db "battle!", $57
; 0x70745

CooltrainerfLoisBeatenText: ; 0x70745
	db $0, "Good going!", $57
; 0x70752

UnknownText_0x70752: ; 0x70752
	db $0, "Come to think of", $4f
	db "it, I've seen a", $55
	db "pink BUTTERFREE.", $57
; 0x70784

UnknownText_0x70784: ; 0x70784
	db $0, "WESLEY: Well, how", $4f
	db "do you do?", $51
	db "Seeing as how it's", $4f
	db "Wednesday today,", $51
	db "I'm WESLEY of", $4f
	db "Wednesday.", $57
; 0x707dd

UnknownText_0x707dd: ; 0x707dd
	db $0, "Pleased to meet", $4f
	db "you. Please take a", $55
	db "souvenir.", $57
; 0x7080b

UnknownText_0x7080b: ; 0x7080b
	db $0, "WESLEY: BLACKBELT", $4f
	db "beefs up the power", $55
	db "of fighting moves.", $57
; 0x70844

UnknownText_0x70844: ; 0x70844
	db $0, "WESLEY: Since you", $4f
	db "found me, you must", $51
	db "have met my broth-", $4f
	db "ers and sisters.", $51
	db "Or did you just", $4f
	db "get lucky?", $57
; 0x708a9

UnknownText_0x708a9: ; 0x708a9
	db $0, "WESLEY: Today's", $4f
	db "not Wednesday.", $55
	db "That's too bad.", $57
; 0x708d7

UnknownText_0x708d7: ; 0x708d7
	db $0, "LAKE OF RAGE,", $4f
	db "also known as", $55
	db "GYARADOS LAKE.", $57
; 0x70903

UnknownText_0x70903: ; 0x70903
	db $0, "FISHING GURU'S", $4f
	db "HOUSE", $57
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

