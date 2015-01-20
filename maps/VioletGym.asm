VioletGym_MapScriptHeader: ; 0x683c0
	; trigger count
	db 0

	; callback count
	db 0
; 0x683c2

FalknerScript_0x683c2: ; 0x683c2
	faceplayer
	loadfont
	checkevent EVENT_BEAT_FALKNER
	iftrue UnknownScript_0x683ec
	writetext UnknownText_0x68473
	closetext
	loadmovesprites
	winlosstext UnknownText_0x6854a, $0000
	loadtrainer FALKNER, 1
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_FALKNER
	loadfont
	writetext UnknownText_0x685af
	playsound SFX_GET_BADGE
	waitbutton
	setflag $001b
	checkcode $7
	scall UnknownScript_0x68418
UnknownScript_0x683ec: ; 0x683ec
	checkevent EVENT_GOT_TM31_MUD_SLAP
	iftrue UnknownScript_0x68412
	setevent EVENT_BEAT_BIRD_KEEPER_ROD
	setevent EVENT_BEAT_BIRD_KEEPER_ABE
	domaptrigger GROUP_ELMS_LAB, MAP_ELMS_LAB, $2
	specialphonecall $3
	writetext UnknownText_0x685c8
	keeptextopen
	verbosegiveitem TM_31, 1
	iffalse UnknownScript_0x68416
	setevent EVENT_GOT_TM31_MUD_SLAP
	writetext UnknownText_0x68648
	closetext
	loadmovesprites
	end
; 0x68412

UnknownScript_0x68412: ; 0x68412
	writetext UnknownText_0x68735
	closetext
UnknownScript_0x68416: ; 0x68416
	loadmovesprites
	end
; 0x68418

UnknownScript_0x68418: ; 0x68418
	if_equal $7, UnknownScript_0x68424
	if_equal $6, UnknownScript_0x68421
	end
; 0x68421

UnknownScript_0x68421: ; 0x68421
	jumpstd $0012
; 0x68424

UnknownScript_0x68424: ; 0x68424
	jumpstd $0013
; 0x68427

TrainerBird_keeperRod: ; 0x68427
	; bit/flag number
	dw $3fb

	; trainer group && trainer id
	db BIRD_KEEPER, ROD

	; text when seen
	dw Bird_keeperRodSeenText

	; text when trainer beaten
	dw Bird_keeperRodBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bird_keeperRodScript
; 0x68433

Bird_keeperRodScript: ; 0x68433
	talkaftercancel
	loadfont
	writetext UnknownText_0x68837
	closetext
	loadmovesprites
	end
; 0x6843b

TrainerBird_keeperAbe: ; 0x6843b
	; bit/flag number
	dw $3fc

	; trainer group && trainer id
	db BIRD_KEEPER, ABE

	; text when seen
	dw Bird_keeperAbeSeenText

	; text when trainer beaten
	dw Bird_keeperAbeBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bird_keeperAbeScript
; 0x68447

Bird_keeperAbeScript: ; 0x68447
	talkaftercancel
	loadfont
	writetext UnknownText_0x688c7
	closetext
	loadmovesprites
	end
; 0x6844f

VioletGymGuyScript: ; 0x6844f
	faceplayer
	loadfont
	checkevent EVENT_BEAT_FALKNER
	iftrue .VioletGymGuyWinScript
	writetext VioletGymGuyText
	closetext
	loadmovesprites
	end

.VioletGymGuyWinScript
	writetext VioletGymGuyWinText
	closetext
	loadmovesprites
	end
; 0x68463

MapVioletGymSignpost1Script: ; 0x68463
	checkflag $001b
	iftrue UnknownScript_0x6846c
	jumpstd $002d
; 0x6846c

UnknownScript_0x6846c: ; 0x6846c
	trainertotext FALKNER, 1, $1
	jumpstd $002e
; 0x68473

UnknownText_0x68473: ; 0x68473
	text "I'm FALKNER, the"
	line "VIOLET #MON GYM"
	cont "leader!"

	para "People say you can"
	line "clip flying-type"

	para "#MON's wings"
	line "with a jolt of"
	cont "electricity…"

	para "I won't allow such"
	line "insults to bird"
	cont "#MON!"

	para "I'll show you the"
	line "real power of the"

	para "magnificent bird"
	line "#MON!"
	done
; 0x6854a

UnknownText_0x6854a: ; 0x6854a
	text "…Darn! My dad's"
	line "cherished bird"
	cont "#MON…"

	para "All right."
	line "Take this."

	para "It's the official"
	line "#MON LEAGUE"
	cont "ZEPHYRBADGE."
	done
; 0x685af

UnknownText_0x685af: ; 0x685af
	text $52, " received"
	line "ZEPHYRBADGE."
	done
; 0x685c8

UnknownText_0x685c8: ; 0x685c8
	text "ZEPHYRBADGE"
	line "raises the attack"
	cont "power of #MON."

	para "It also enables"
	line "#MON to use"

	para "FLASH, if they"
	line "have it, anytime."

	para "Here--take this"
	line "too."
	done
; 0x68648

UnknownText_0x68648: ; 0x68648
	text "By using a TM, a"
	line "#MON will"

	para "instantly learn a"
	line "new move."

	para "Think before you"
	line "act--a TM can be"
	cont "used only once."

	para "TM31 contains"
	line "MUD-SLAP."

	para "It reduces the"
	line "enemy's accuracy"

	para "while it causes"
	line "damage."

	para "In other words, it"
	line "is both defensive"
	cont "and offensive."
	done
; 0x68735

UnknownText_0x68735: ; 0x68735
	text "There are #MON"
	line "GYMS in cities and"
	cont "towns ahead."

	para "You should test"
	line "your skills at"
	cont "these GYMS."

	para "I'm going to train"
	line "harder to become"

	para "the greatest bird"
	line "master!"
	done
; 0x687cd

Bird_keeperRodSeenText: ; 0x687cd
	text "The keyword is"
	line "guts!"

	para "Those here are"
	line "training night and"

	para "day to become bird"
	line "#MON masters."

	para "Come on!"
	done
; 0x6882f

Bird_keeperRodBeatenText: ; 0x6882f
	text "Gaaah!"
	done
; 0x68837

UnknownText_0x68837: ; 0x68837
	text "FALKNER's skills"
	line "are for real!"

	para "Don't get cocky"
	line "just because you"
	cont "beat me!"
	done
; 0x6887f

Bird_keeperAbeSeenText: ; 0x6887f
	text "Let me see if you"
	line "are good enough to"
	cont "face FALKNER!"
	done
; 0x688b3

Bird_keeperAbeBeatenText: ; 0x688b3
	text "This can't be"
	line "true!"
	done
; 0x688c7

UnknownText_0x688c7: ; 0x688c7
	text "This is pathetic,"
	line "losing to some"
	cont "rookie trainer…"
	done
; 0x688f9

VioletGymGuyText: ; 0x688f9
	text "Hey! I'm no train-"
	line "er but I can give"
	cont "some advice!"

	para "Believe me!"
	line "If you believe, a"

	para "championship dream"
	line "can come true."

	para "You believe?"
	line "Then listen."

	para "The grass-type is"
	line "weak against the"

	para "flying-type. Keep"
	line "this in mind."
	done
; 0x689c8

VioletGymGuyWinText: ; 0x689c8
	text "Nice battle! Keep"
	line "it up, and you'll"

	para "be the CHAMP in no"
	line "time at all!"
	done
; 0x68a0c

VioletGym_MapEventHeader: ; 0x68a0c
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $f, $4, 2, GROUP_VIOLET_CITY, MAP_VIOLET_CITY
	warp_def $f, $5, 2, GROUP_VIOLET_CITY, MAP_VIOLET_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 13, 3, $0, MapVioletGymSignpost1Script
	signpost 13, 6, $0, MapVioletGymSignpost1Script

	; people-events
	db 4
	person_event SPRITE_FALKNER, 5, 9, $6, $0, 255, 255, $90, 0, FalknerScript_0x683c2, $ffff
	person_event SPRITE_YOUNGSTER, 10, 11, $8, $2, 255, 255, $92, 3, TrainerBird_keeperRod, $ffff
	person_event SPRITE_YOUNGSTER, 14, 6, $9, $2, 255, 255, $92, 3, TrainerBird_keeperAbe, $ffff
	person_event SPRITE_GYM_GUY, 17, 11, $6, $0, 255, 255, $80, 0, VioletGymGuyScript, $ffff
; 0x68a5a

