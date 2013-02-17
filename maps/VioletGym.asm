VioletGym_MapScriptHeader: ; 0x683c0
	; trigger count
	db 0

	; callback count
	db 0
; 0x683c2

UnknownScript_0x683c2: ; 0x683c2
	faceplayer
	loadfont
	checkbit1 $04bd
	iftrue UnknownScript_0x683ec
	2writetext UnknownText_0x68473
	closetext
	loadmovesprites
	winlosstext UnknownText_0x6854a, $0000
	loadtrainer FALKNER, 1
	startbattle
	returnafterbattle
	setbit1 $04bd
	loadfont
	2writetext UnknownText_0x685af
	playsound $009c
	waitbutton
	setbit2 $001b
	checkcode $7
	2call UnknownScript_0x68418
UnknownScript_0x683ec: ; 0x683ec
	checkbit1 $0008
	iftrue UnknownScript_0x68412
	setbit1 $03fb
	setbit1 $03fc
	domaptrigger GROUP_ELMS_LAB, MAP_ELMS_LAB, $2
	specialphonecall $3
	2writetext UnknownText_0x685c8
	keeptextopen
	verbosegiveitem TM_31, 1
	iffalse UnknownScript_0x68416
	setbit1 $0008
	2writetext UnknownText_0x68648
	closetext
	loadmovesprites
	end
; 0x68412

UnknownScript_0x68412: ; 0x68412
	2writetext UnknownText_0x68735
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
	2writetext UnknownText_0x68837
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
	2writetext UnknownText_0x688c7
	closetext
	loadmovesprites
	end
; 0x6844f

VioletGymGuyScript: ; 0x6844f
	faceplayer
	loadfont
	checkbit1 $04bd
	iftrue .VioletGymGuyWinScript
	2writetext VioletGymGuyText
	closetext
	loadmovesprites
	end

.VioletGymGuyWinScript
	2writetext VioletGymGuyWinText
	closetext
	loadmovesprites
	end
; 0x68463

MapVioletGymSignpost1Script: ; 0x68463
	checkbit2 $001b
	iftrue UnknownScript_0x6846c
	jumpstd $002d
; 0x6846c

UnknownScript_0x6846c: ; 0x6846c
	trainertotext FALKNER, 1, $1
	jumpstd $002e
; 0x68473

UnknownText_0x68473: ; 0x68473
	db $0, "I'm FALKNER, the", $4f
	db "VIOLET #MON GYM", $55
	db "leader!", $51
	db "People say you can", $4f
	db "clip flying-type", $51
	db "#MON's wings", $4f
	db "with a jolt of", $55
	db "electricity…", $51
	db "I won't allow such", $4f
	db "insults to bird", $55
	db "#MON!", $51
	db "I'll show you the", $4f
	db "real power of the", $51
	db "magnificent bird", $4f
	db "#MON!", $57
; 0x6854a

UnknownText_0x6854a: ; 0x6854a
	db $0, "…Darn! My dad's", $4f
	db "cherished bird", $55
	db "#MON…", $51
	db "All right.", $4f
	db "Take this.", $51
	db "It's the official", $4f
	db "#MON LEAGUE", $55
	db "ZEPHYRBADGE.", $57
; 0x685af

UnknownText_0x685af: ; 0x685af
	db $0, $52, " received", $4f
	db "ZEPHYRBADGE.", $57
; 0x685c8

UnknownText_0x685c8: ; 0x685c8
	db $0, "ZEPHYRBADGE", $4f
	db "raises the attack", $55
	db "power of #MON.", $51
	db "It also enables", $4f
	db "#MON to use", $51
	db "FLASH, if they", $4f
	db "have it, anytime.", $51
	db "Here--take this", $4f
	db "too.", $57
; 0x68648

UnknownText_0x68648: ; 0x68648
	db $0, "By using a TM, a", $4f
	db "#MON will", $51
	db "instantly learn a", $4f
	db "new move.", $51
	db "Think before you", $4f
	db "act--a TM can be", $55
	db "used only once.", $51
	db "TM31 contains", $4f
	db "MUD-SLAP.", $51
	db "It reduces the", $4f
	db "enemy's accuracy", $51
	db "while it causes", $4f
	db "damage.", $51
	db "In other words, it", $4f
	db "is both defensive", $55
	db "and offensive.", $57
; 0x68735

UnknownText_0x68735: ; 0x68735
	db $0, "There are #MON", $4f
	db "GYMS in cities and", $55
	db "towns ahead.", $51
	db "You should test", $4f
	db "your skills at", $55
	db "these GYMS.", $51
	db "I'm going to train", $4f
	db "harder to become", $51
	db "the greatest bird", $4f
	db "master!", $57
; 0x687cd

Bird_keeperRodSeenText: ; 0x687cd
	db $0, "The keyword is", $4f
	db "guts!", $51
	db "Those here are", $4f
	db "training night and", $51
	db "day to become bird", $4f
	db "#MON masters.", $51
	db "Come on!", $57
; 0x6882f

Bird_keeperRodBeatenText: ; 0x6882f
	db $0, "Gaaah!", $57
; 0x68837

UnknownText_0x68837: ; 0x68837
	db $0, "FALKNER's skills", $4f
	db "are for real!", $51
	db "Don't get cocky", $4f
	db "just because you", $55
	db "beat me!", $57
; 0x6887f

Bird_keeperAbeSeenText: ; 0x6887f
	db $0, "Let me see if you", $4f
	db "are good enough to", $55
	db "face FALKNER!", $57
; 0x688b3

Bird_keeperAbeBeatenText: ; 0x688b3
	db $0, "This can't be", $4f
	db "true!", $57
; 0x688c7

UnknownText_0x688c7: ; 0x688c7
	db $0, "This is pathetic,", $4f
	db "losing to some", $55
	db "rookie trainer…", $57
; 0x688f9

VioletGymGuyText: ; 0x688f9
	db $0, "Hey! I'm no train-", $4f
	db "er but I can give", $55
	db "some advice!", $51
	db "Believe me!", $4f
	db "If you believe, a", $51
	db "championship dream", $4f
	db "can come true.", $51
	db "You believe?", $4f
	db "Then listen.", $51
	db "The grass-type is", $4f
	db "weak against the", $51
	db "flying-type. Keep", $4f
	db "this in mind.", $57
; 0x689c8

VioletGymGuyWinText: ; 0x689c8
	db $0, "Nice battle! Keep", $4f
	db "it up, and you'll", $51
	db "be the CHAMP in no", $4f
	db "time at all!", $57
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
	person_event $12, 5, 9, $6, $0, 255, 255, $90, 0, UnknownScript_0x683c2, $ffff
	person_event $27, 10, 11, $8, $2, 255, 255, $92, 3, TrainerBird_keeperRod, $ffff
	person_event $27, 14, 6, $9, $2, 255, 255, $92, 3, TrainerBird_keeperAbe, $ffff
	person_event $48, 17, 11, $6, $0, 255, 255, $80, 0, VioletGymGuyScript, $ffff
; 0x68a5a

