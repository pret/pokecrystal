EcruteakGym_MapScriptHeader: ; 0x99d49
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x99d53, $0000
	dw UnknownScript_0x99d57, $0000

	; callback count
	db 0
; 0x99d53

UnknownScript_0x99d53: ; 0x99d53
	priorityjump UnknownScript_0x99dc6
	end
; 0x99d57

UnknownScript_0x99d57: ; 0x99d57
	end
; 0x99d58

MortyScript_0x99d58: ; 0x99d58
	faceplayer
	loadfont
	checkbit1 $04c0
	iftrue UnknownScript_0x99d8c
	2writetext UnknownText_0x99e65
	closetext
	loadmovesprites
	winlosstext UnknownText_0x9a00a, $0000
	loadtrainer MORTY, 1
	startbattle
	returnafterbattle
	setbit1 $04c0
	loadfont
	2writetext UnknownText_0x9a043
	playsound $009c
	waitbutton
	setbit2 $001e
	checkcode $7
	2call UnknownScript_0x99db7
	domaptrigger GROUP_ECRUTEAK_HOUSE, MAP_ECRUTEAK_HOUSE, $1
	setbit1 $0766
	setbit1 $0767
UnknownScript_0x99d8c: ; 0x99d8c	
	checkbit1 $000c
	iftrue UnknownScript_0x99db1
	setbit1 $0415
	setbit1 $0416
	setbit1 $058b
	setbit1 $058c
	2writetext UnknownText_0x9a059
	keeptextopen
	verbosegiveitem TM_30, 1
	iffalse UnknownScript_0x99db5
	setbit1 $000c
	2writetext UnknownText_0x9a0ec
	closetext
	loadmovesprites
	end
; 0x99db1

UnknownScript_0x99db1: ; 0x99db1
	2writetext UnknownText_0x9a145
	closetext
UnknownScript_0x99db5: ; 0x99db5
	loadmovesprites
	end
; 0x99db7

UnknownScript_0x99db7: ; 0x99db7
	if_equal $7, UnknownScript_0x99dc3
	if_equal $6, UnknownScript_0x99dc0
	end
; 0x99dc0

UnknownScript_0x99dc0: ; 0x99dc0
	jumpstd $0012
; 0x99dc3

UnknownScript_0x99dc3: ; 0x99dc3
	jumpstd $0013
; 0x99dc6

UnknownScript_0x99dc6: ; 0x99dc6
	applymovement $0, MovementData_0x99e5d
	applymovement $8, MovementData_0x99e63
	loadfont
	2writetext UnknownText_0x9a49c
	closetext
	loadmovesprites
	follow $0, $8
	applymovement $0, MovementData_0x99e5f
	stopfollow
	special $002e
	playsound $001f
	waitbutton
	warp GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY, $6, $1b
	end
; 0x99de9

TrainerSageJeffrey: ; 0x99de9
	; bit/flag number
	dw $415

	; trainer group && trainer id
	db SAGE, JEFFREY

	; text when seen
	dw SageJeffreySeenText

	; text when trainer beaten
	dw SageJeffreyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SageJeffreyScript
; 0x99df5

SageJeffreyScript: ; 0x99df5
	talkaftercancel
	loadfont
	2writetext UnknownText_0x9a263
	closetext
	loadmovesprites
	end
; 0x99dfd

TrainerSagePing: ; 0x99dfd
	; bit/flag number
	dw $416

	; trainer group && trainer id
	db SAGE, PING

	; text when seen
	dw SagePingSeenText

	; text when trainer beaten
	dw SagePingBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SagePingScript
; 0x99e09

SagePingScript: ; 0x99e09
	talkaftercancel
	loadfont
	2writetext UnknownText_0x9a2b7
	closetext
	loadmovesprites
	end
; 0x99e11

TrainerMediumMartha: ; 0x99e11
	; bit/flag number
	dw $58b

	; trainer group && trainer id
	db MEDIUM, MARTHA

	; text when seen
	dw MediumMarthaSeenText

	; text when trainer beaten
	dw MediumMarthaBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw MediumMarthaScript
; 0x99e1d

MediumMarthaScript: ; 0x99e1d
	talkaftercancel
	loadfont
	2writetext UnknownText_0x9a318
	closetext
	loadmovesprites
	end
; 0x99e25

TrainerMediumGrace: ; 0x99e25
	; bit/flag number
	dw $58c

	; trainer group && trainer id
	db MEDIUM, GRACE

	; text when seen
	dw MediumGraceSeenText

	; text when trainer beaten
	dw MediumGraceBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw MediumGraceScript
; 0x99e31

MediumGraceScript: ; 0x99e31
	talkaftercancel
	loadfont
	2writetext UnknownText_0x9a38a
	closetext
	loadmovesprites
	end
; 0x99e39

EcruteakGymGuyScript: ; 0x99e39
	faceplayer
	loadfont
	checkbit1 $04c0
	iftrue .EcruteakGymGuyWinScript
	2writetext EcruteakGymGuyText
	closetext
	loadmovesprites
	end

.EcruteakGymGuyWinScript
	2writetext EcruteakGymGuyWinText
	closetext
	loadmovesprites
	end
; 0x99e4d

MapEcruteakGymSignpost1Script: ; 0x99e4d
	checkbit2 $001e
	iftrue UnknownScript_0x99e56
	jumpstd $002d
; 0x99e56

UnknownScript_0x99e56: ; 0x99e56
	trainertotext MORTY, 1, $1
	jumpstd $002e
; 0x99e5d

MovementData_0x99e5d: ; 0x99e5d
	step_up
	step_end
; 0x99e5f

MovementData_0x99e5f: ; 0x99e5f
	fix_facing
	slow_step_down
	remove_fixed_facing
	step_end
; 0x99e63

MovementData_0x99e63: ; 0x99e63
	slow_step_down
	step_end
; 0x99e65

UnknownText_0x99e65: ; 0x99e65
	db $0, "Good of you to", $4f
	db "have come.", $51
	db "Here in ECRUTEAK,", $4f
	db "#MON have been", $55
	db "revered.", $51
	db "It's said that a", $4f
	db "rainbow-colored", $51
	db "#MON will come", $4f
	db "down to appear", $51
	db "before a truly", $4f
	db "powerful trainer.", $51
	db "I believed that", $4f
	db "tale, so I have", $51
	db "secretly trained", $4f
	db "here all my life.", $51
	db "As a result, I can", $4f
	db "now see what", $55
	db "others cannot.", $51
	db "Just a bit more…", $51
	db "With a little", $4f
	db "more, I could see", $51
	db "a future in which", $4f
	db "I meet the #MON", $55
	db "of rainbow colors.", $51
	db "You're going to", $4f
	db "help me reach that", $55
	db "level!", $57
; 0x9a00a

UnknownText_0x9a00a: ; 0x9a00a
	db $0, "I'm not good", $4f
	db "enough yet…", $51
	db "All right. This", $4f
	db "BADGE is yours.", $57
; 0x9a043

UnknownText_0x9a043: ; 0x9a043
	db $0, $52, " received", $4f
	db "FOGBADGE.", $57
; 0x9a059

UnknownText_0x9a059: ; 0x9a059
	db $0, "By having FOG-", $4f
	db "BADGE, #MON up", $51
	db "to L50 will obey", $4f
	db "you.", $51
	db "Also, #MON that", $4f
	db "know SURF will be", $51
	db "able to use that", $4f
	db "move anytime.", $51
	db "I want you to have", $4f
	db "this too.", $57
; 0x9a0ec

UnknownText_0x9a0ec: ; 0x9a0ec
	db $0, "It's SHADOW BALL.", $4f
	db "It causes damage", $51
	db "and may reduce", $4f
	db "SPCL.DEF.", $51
	db "Use it if it", $4f
	db "appeals to you.", $57
; 0x9a145

UnknownText_0x9a145: ; 0x9a145
	db $0, "I see…", $51
	db "Your journey has", $4f
	db "taken you to far-", $55
	db "away places.", $51
	db "And you have wit-", $4f
	db "nessed much more", $55
	db "than I.", $51
	db "I envy you for", $4f
	db "that…", $57
; 0x9a1bd

SageJeffreySeenText: ; 0x9a1bd
	db $0, "I spent the spring", $4f
	db "with my #MON.", $51
	db "Then summer, fall", $4f
	db "and winter…", $51
	db "Then spring came", $4f
	db "again. We have", $51
	db "lived together", $4f
	db "for a long time.", $57
; 0x9a23d

SageJeffreyBeatenText: ; 0x9a23d
	db $0, "Wins and losses, I", $4f
	db "experienced both.", $57
; 0x9a263

UnknownText_0x9a263: ; 0x9a263
	db $0, "Where did #MON", $4f
	db "come from?", $57
; 0x9a27e

SagePingSeenText: ; 0x9a27e
	db $0, "Can you inflict", $4f
	db "any damage on our", $55
	db "#MON?", $57
; 0x9a2a7

SagePingBeatenText: ; 0x9a2a7
	db $0, "Ah! Well done!", $57
; 0x9a2b7

UnknownText_0x9a2b7: ; 0x9a2b7
	db $0, "We use only ghost-", $4f
	db "type #MON.", $51
	db "No normal-type", $4f
	db "attack can harm", $55
	db "them!", $57
; 0x9a2fb

MediumMarthaSeenText: ; 0x9a2fb
	db $0, "I shall win!", $57
; 0x9a309

MediumMarthaBeatenText: ; 0x9a309
	db $0, "I, I, I lost!", $57
; 0x9a318

UnknownText_0x9a318: ; 0x9a318
	db $0, "The one who wants", $4f
	db "to win most--will!", $57
; 0x9a33e

MediumGraceSeenText: ; 0x9a33e
	db $0, "Stumped by our in-", $4f
	db "visible floor?", $51
	db "Defeat me if you", $4f
	db "want a hint!", $57
; 0x9a37f

MediumGraceBeatenText: ; 0x9a37f
	db $0, "Wha-what?", $57
; 0x9a38a

UnknownText_0x9a38a: ; 0x9a38a
	db $0, "Fine. I shall tell", $4f
	db "you the secret of", $51
	db "the invisible", $4f
	db "floor.", $51
	db "The path is right", $4f
	db "before our eyes!", $57
; 0x9a3e8

EcruteakGymGuyText: ; 0x9a3e8
	db $0, "The trainers here", $4f
	db "have secret mo-", $55
	db "tives.", $51
	db "If you win, they", $4f
	db "may tell you some", $51
	db "deep secrets about", $4f
	db "ECRUTEAK.", $57
; 0x9a452

EcruteakGymGuyWinText: ; 0x9a452
	db $0, "Whew, ", $52, ".", $4f
	db "You did great!", $51
	db "I was cowering in", $4f
	db "the corner out of", $55
	db "pure terror!", $57
; 0x9a49c

UnknownText_0x9a49c: ; 0x9a49c
	db $0, "MORTY, the GYM", $4f
	db "LEADER, is absent.", $51
	db "Sorry, but you'll", $4f
	db "have to leave.", $51
	db "Hohohoho.", $57
; 0x9a4e9

EcruteakGym_MapEventHeader: ; 0x9a4e9
	; filler
	db 0, 0

	; warps
	db 33
	warp_def $11, $4, 10, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $11, $5, 10, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $e, $4, 4, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $4, $2, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $4, $3, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $4, $4, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $5, $4, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $7, $6, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $4, $7, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $6, $2, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $6, $3, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $6, $4, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $6, $5, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $6, $7, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $7, $7, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $8, $4, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $8, $5, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $8, $6, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $8, $7, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $8, $2, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $9, $2, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $a, $2, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $b, $2, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $a, $4, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $a, $5, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $c, $2, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $c, $3, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $c, $4, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $c, $5, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $a, $7, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $b, $7, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $c, $7, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $d, $7, 3, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 15, 3, $0, MapEcruteakGymSignpost1Script
	signpost 15, 6, $0, MapEcruteakGymSignpost1Script

	; people-events
	db 7
	person_event SPRITE_MORTY, 5, 9, $6, $0, 255, 255, $b0, 0, MortyScript_0x99d58, $ffff
	person_event SPRITE_SAGE, 11, 6, $9, $0, 255, 255, $92, 1, TrainerSageJeffrey, $ffff
	person_event SPRITE_SAGE, 17, 7, $9, $0, 255, 255, $92, 3, TrainerSagePing, $ffff
	person_event SPRITE_GRANNY, 9, 11, $8, $0, 255, 255, $b2, 1, TrainerMediumMartha, $ffff
	person_event SPRITE_GRANNY, 13, 11, $8, $0, 255, 255, $b2, 1, TrainerMediumGrace, $ffff
	person_event SPRITE_GYM_GUY, 19, 11, $6, $0, 255, 255, $80, 0, EcruteakGymGuyScript, $ffff
	person_event SPRITE_GRAMPS, 18, 8, $6, $0, 255, 255, $a0, 0, ObjectEvent, $07a8
; 0x9a5f9

