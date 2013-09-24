TeamRocketBaseB2F_MapScriptHeader: ; 0x6cf70
	; trigger count
	db 4

	; triggers
	dw UnknownScript_0x6cf85, $0000
	dw UnknownScript_0x6cf86, $0000
	dw UnknownScript_0x6cf87, $0000
	dw UnknownScript_0x6cf88, $0000

	; callback count
	db 1

	; callbacks

	dbw 1, UnknownScript_0x6cf89
; 0x6cf85

UnknownScript_0x6cf85: ; 0x6cf85
	end
; 0x6cf86

UnknownScript_0x6cf86: ; 0x6cf86
	end
; 0x6cf87

UnknownScript_0x6cf87: ; 0x6cf87
	end
; 0x6cf88

UnknownScript_0x6cf88: ; 0x6cf88
	end
; 0x6cf89

UnknownScript_0x6cf89: ; 0x6cf89
	checkevent EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER
	iftrue UnknownScript_0x6cf90
	return
; 0x6cf90

UnknownScript_0x6cf90: ; 0x6cf90
	changeblock $e, $c, $7
	return
; 0x6cf95

UnknownScript_0x6cf95: ; 0x6cf95
	moveperson $4, $9, $d
	2jump UnknownScript_0x6cfac
; 0x6cf9c

UnknownScript_0x6cf9c: ; 0x6cf9c
	moveperson $3, $15, $10
	moveperson $2, $15, $10
	moveperson $5, $a, $d
	moveperson $4, $a, $d
UnknownScript_0x6cfac: ; 0x6cfac
	appear $3
	appear $2
	loadfont
	2writetext UnknownText_0x6d2ad
	closetext
	loadmovesprites
	spriteface $0, $0
	showemote $0, $0, 15
	applymovement $0, MovementData_0x6d21f
	playmusic $0039
	applymovement $3, MovementData_0x6d224
	spriteface $0, $1
	applymovement $2, MovementData_0x6d22f
	loadfont
	2writetext UnknownText_0x6d2c3
	closetext
	loadmovesprites
	cry DRAGONITE
	spriteface $3, $2
	spriteface $0, $2
	appear $5
	applymovement $5, MovementData_0x6d236
	applymovement $3, MovementData_0x6d23b
	applymovement $2, MovementData_0x6d24c
	appear $4
	applymovement $4, MovementData_0x6d244
	loadfont
	2writetext UnknownText_0x6d38c
	closetext
	loadmovesprites
	spriteface $0, $3
	applymovement $3, MovementData_0x6d241
	loadfont
	2writetext UnknownText_0x6d3bd
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x6d24a
	applymovement $3, MovementData_0x6d248
	winlosstext UnknownText_0x6d45c, $0000
	setlasttalked $3
	loadtrainer EXECUTIVEF, 2
	startbattle
	disappear $5
	setevent $06dd
	setevent $06de
	setevent $06d6
	returnafterbattle
	setevent $0570
	loadfont
	2writetext UnknownText_0x6d4c6
	closetext
	loadmovesprites
	special $0030
	special $0033
	disappear $2
	disappear $3
	disappear $c
	disappear $d
	disappear $e
	pause 15
	special $0032
	dotrigger $2
	clearevent $06d6
	spriteface $4, $0
	loadfont
	2writetext UnknownText_0x6d5d8
	closetext
	loadmovesprites
	applymovement $4, MovementData_0x6d250
	spriteface $0, $1
	loadfont
	2writetext UnknownText_0x6d64e
	closetext
	loadmovesprites
	follow $4, $0
	applymovement $4, MovementData_0x6d254
	stopfollow
	applymovement $4, MovementData_0x6d258
	loadfont
	2writetext UnknownText_0x6d6cf
	closetext
	loadmovesprites
	applymovement $4, MovementData_0x6d267
	disappear $4
; 0x6d075

UnknownScript_0x6d075: ; 0x6d075
	applymovement $0, MovementData_0x6d271
	end
; 0x6d07a

UnknownScript_0x6d07a: ; 0x6d07a
	loadfont
	2writetext UnknownText_0x6d7ea
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x6d278
	end
; 0x6d085

UnknownScript_0x6d085: ; 0x6d085
	spriteface $0, $1
	2jump UnknownScript_0x6d091
; 0x6d08b

UnknownScript_0x6d08b: ; 0x6d08b
	spriteface $0, $3
	spriteface $4, $2
UnknownScript_0x6d091: ; 0x6d091
	loadfont
	2writetext UnknownText_0x6da97
	closetext
	loadmovesprites
	special $002e
	special $009d
	playsound $0005
	special $001b
	special $0031
	loadfont
	2writetext UnknownText_0x6daf7
	closetext
	loadmovesprites
	dotrigger $1
	setevent $004c
	checkcode $9
	if_equal $3, UnknownScript_0x6d0be
	applymovement $4, MovementData_0x6d212
	disappear $4
	end
; 0x6d0be

UnknownScript_0x6d0be: ; 0x6d0be
	applymovement $4, MovementData_0x6d219
	disappear $4
	end
; 0x6d0c5

TrainerGruntM17: ; 0x6d0c5
	; bit/flag number
	dw $501

	; trainer group && trainer id
	db GRUNTM, 17

	; text when seen
	dw GruntM17SeenText

	; text when trainer beaten
	dw GruntM17BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntM17Script
; 0x6d0d1

GruntM17Script: ; 0x6d0d1
	talkaftercancel
	loadfont
	2writetext UnknownText_0x6db88
	closetext
	loadmovesprites
	end
; 0x6d0d9

TrainerGruntM18: ; 0x6d0d9
	; bit/flag number
	dw $502

	; trainer group && trainer id
	db GRUNTM, 18

	; text when seen
	dw GruntM18SeenText

	; text when trainer beaten
	dw GruntM18BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntM18Script
; 0x6d0e5

GruntM18Script: ; 0x6d0e5
	talkaftercancel
	loadfont
	2writetext UnknownText_0x6dc1a
	closetext
	loadmovesprites
	end
; 0x6d0ed

TrainerGruntM19: ; 0x6d0ed
	; bit/flag number
	dw $503

	; trainer group && trainer id
	db GRUNTM, 19

	; text when seen
	dw GruntM19SeenText

	; text when trainer beaten
	dw GruntM19BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntM19Script
; 0x6d0f9

GruntM19Script: ; 0x6d0f9
	talkaftercancel
	loadfont
	2writetext UnknownText_0x6dcd1
	closetext
	loadmovesprites
	end
; 0x6d101

VoltorbScript_0x6d101: ; 0x6d101
	cry ELECTRODE
	loadpokedata ELECTRODE, 23
	startbattle
	iftrue UnknownScript_0x6d182
	disappear $6
	disappear $9
	checkevent $06e0
	iffalse UnknownScript_0x6d182
	checkevent $06e1
	iffalse UnknownScript_0x6d182
	checkevent $06e2
	iffalse UnknownScript_0x6d182
	returnafterbattle
	special $003c
	applymovement $0, MovementData_0x6d28c
	2jump UnknownScript_0x6d184
; 0x6d12c

VoltorbScript_0x6d12c: ; 0x6d12c
	cry ELECTRODE
	loadpokedata ELECTRODE, 23
	startbattle
	iftrue UnknownScript_0x6d182
	disappear $7
	disappear $a
	checkevent $06e0
	iffalse UnknownScript_0x6d182
	checkevent $06e1
	iffalse UnknownScript_0x6d182
	checkevent $06e2
	iffalse UnknownScript_0x6d182
	returnafterbattle
	special $003c
	applymovement $0, MovementData_0x6d299
	2jump UnknownScript_0x6d184
; 0x6d157

VoltorbScript_0x6d157: ; 0x6d157
	cry ELECTRODE
	loadpokedata ELECTRODE, 23
	startbattle
	iftrue UnknownScript_0x6d182
	disappear $8
	disappear $b
	checkevent $06e0
	iffalse UnknownScript_0x6d182
	checkevent $06e1
	iffalse UnknownScript_0x6d182
	checkevent $06e2
	iffalse UnknownScript_0x6d182
	returnafterbattle
	special $003c
	applymovement $0, MovementData_0x6d2a4
	2jump UnknownScript_0x6d184
; 0x6d182

UnknownScript_0x6d182: ; 0x6d182
	returnafterbattle
	end
; 0x6d184

UnknownScript_0x6d184: ; 0x6d184
	moveperson $4, $12, $6
	appear $4
	applymovement $4, MovementData_0x6d27a
	spriteface $0, $3
	loadfont
	2writetext UnknownText_0x6d809
	keeptextopen
	verbosegiveitem HM_06, 1
	setevent EVENT_GOT_HM06_WHIRLPOOL
	2writetext UnknownText_0x6d8f8
	closetext
	loadmovesprites
	spriteface $4, $0
	loadfont
	2writetext UnknownText_0x6d994
	closetext
	loadmovesprites
	spriteface $0, $0
	applymovement $4, MovementData_0x6d283
	disappear $4
	setevent EVENT_CLEARED_ROCKET_HIDEOUT
	clearbit2 $000e
	setevent $06dc
	setevent $0757
	dotrigger $3
	clearevent $0735
	setevent EVENT_TURNED_OFF_SECURITY_CAMERAS
	setevent EVENT_SECURITY_CAMERA_1
	setevent EVENT_SECURITY_CAMERA_2
	setevent EVENT_SECURITY_CAMERA_3
	setevent EVENT_SECURITY_CAMERA_4
	setevent EVENT_SECURITY_CAMERA_5
	end
; 0x6d1d7

MapTeamRocketBaseB2FSignpostPtr1: ; 0x6d1d7
	dw $0300
	dw MapTeamRocketBaseB2FSignpost1Script
	
; 0x6d1db

MapTeamRocketBaseB2FSignpost1Script: ; 0x6d1db
	loadfont
	checkevent EVENT_LEARNED_HAIL_GIOVANNI
	iftrue UnknownScript_0x6d1e8
	2writetext UnknownText_0x6dd39
	closetext
	loadmovesprites
	end
; 0x6d1e8

UnknownScript_0x6d1e8: ; 0x6d1e8
	2writetext UnknownText_0x6dd6b
	closetext
	playsound $001f
	changeblock $e, $c, $7
	reloadmappart
	loadmovesprites
	setevent EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER
	waitbutton
	end
; 0x6d1fa

MapTeamRocketBaseB2FSignpost21Script: ; 0x6d1fa
	loadfont
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0x6d207
	2writetext UnknownText_0x6dda7
	closetext
	loadmovesprites
	end
; 0x6d207

UnknownScript_0x6d207: ; 0x6d207
	2writetext UnknownText_0x6de03
	closetext
	loadmovesprites
	end
; 0x6d20d

ItemFragment_0x6d20d: ; 0x6d20d
	db TM_46, 1
; 0x6d20f

MapTeamRocketBaseB2FSignpostItem22: ; 0x6d20f
	dw $0087
	db FULL_HEAL
	
; 0x6d212

MovementData_0x6d212: ; 0x6d212
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end
; 0x6d219

MovementData_0x6d219: ; 0x6d219
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end
; 0x6d21f

MovementData_0x6d21f: ; 0x6d21f
	step_down
	step_down
	step_down
	turn_head_right
	step_end
; 0x6d224

MovementData_0x6d224: ; 0x6d224
	big_step_left
	big_step_left
	big_step_up
	big_step_up
	big_step_up
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	turn_head_down
	step_end
; 0x6d22f

MovementData_0x6d22f: ; 0x6d22f
	big_step_left
	big_step_left
	big_step_up
	big_step_up
	big_step_left
	big_step_left
	step_end
; 0x6d236

MovementData_0x6d236: ; 0x6d236
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	step_end
; 0x6d23b

MovementData_0x6d23b: ; 0x6d23b
	fix_facing
	db $39 ; movement
	jump_step_right
	db $38 ; movement
	remove_fixed_facing
	step_end
; 0x6d241

MovementData_0x6d241: ; 0x6d241
	slow_step_down
	turn_head_left
	step_end
; 0x6d244

MovementData_0x6d244: ; 0x6d244
	step_right
	step_right
	step_right
	step_end
; 0x6d248

MovementData_0x6d248: ; 0x6d248
	big_step_left
	step_end
; 0x6d24a

MovementData_0x6d24a: ; 0x6d24a
	big_step_left
	step_end
; 0x6d24c

MovementData_0x6d24c: ; 0x6d24c
	big_step_left
	big_step_up
	turn_head_left
	step_end
; 0x6d250

MovementData_0x6d250: ; 0x6d250
	step_right
	step_right
	turn_head_down
	step_end
; 0x6d254

MovementData_0x6d254: ; 0x6d254
	step_up
	step_up
	step_up
	step_end
; 0x6d258

MovementData_0x6d258: ; 0x6d258
	accelerate_last
	step_left
	step_left
	turn_head_up
	accelerate_last
	step_right
	step_right
	step_right
	step_right
	turn_head_up
	accelerate_last
	step_left
	step_left
	turn_head_down
	step_end
; 0x6d267

MovementData_0x6d267: ; 0x6d267
	step_right
	step_right
	step_right
	step_right
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end
; 0x6d271

MovementData_0x6d271: ; 0x6d271
	step_up
	step_left
	step_left
	step_left
	step_left
	turn_head_up
	step_end
; 0x6d278

MovementData_0x6d278: ; 0x6d278
	step_left
	step_end
; 0x6d27a

MovementData_0x6d27a: ; 0x6d27a
	step_down
	step_down
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_end
; 0x6d283

MovementData_0x6d283: ; 0x6d283
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end
; 0x6d28c

MovementData_0x6d28c: ; 0x6d28c
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_end
; 0x6d299

MovementData_0x6d299: ; 0x6d299
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_end
; 0x6d2a4

MovementData_0x6d2a4: ; 0x6d2a4
	step_right
	step_right
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_end
; 0x6d2ad

UnknownText_0x6d2ad: ; 0x6d2ad
	db $0, "Hold it right", $4f
	db "there!", $57
; 0x6d2c3

UnknownText_0x6d2c3: ; 0x6d2c3
	db $0, "We can't have a", $4f
	db "brat like you on", $55
	db "the loose.", $51
	db "It's harmful to", $4f
	db "TEAM ROCKET's", $55
	db "pride, you see.", $51
	db "However strong you", $4f
	db "may be, you can't", $51
	db "take both of us at", $4f
	db "the same time.", $51
	db "Sorry, baby. Now", $4f
	db "get ready to be", $55
	db "thrashed.", $57
; 0x6d38c

UnknownText_0x6d38c: ; 0x6d38c
	db $0, "Hey! Don't be so", $4f
	db "selfish. Spread", $55
	db "the fun around.", $57
; 0x6d3bd

UnknownText_0x6d3bd: ; 0x6d3bd
	db $0, "What? You had an", $4f
	db "accomplice?", $51
	db "Where is your", $4f
	db "sense of honor?", $51
	db "As the interim", $4f
	db "boss in place of", $51
	db "GIOVANNI, I'll", $4f
	db "show you how wrong", $51
	db "it is to meddle", $4f
	db "with TEAM ROCKET!", $57
; 0x6d45c

UnknownText_0x6d45c: ; 0x6d45c
	db $0, "Tch, you really", $4f
	db "are strong.", $51
	db "It's too bad.", $51
	db "If you were to", $4f
	db "join TEAM ROCKET,", $51
	db "you could become", $4f
	db "an EXECUTIVE.", $57
; 0x6d4c6

UnknownText_0x6d4c6: ; 0x6d4c6
	db $0, "…This hideout is", $4f
	db "done for…", $51
	db "But that's fine.", $4f
	db "The broadcast ex-", $55
	db "periment was a", $55
	db "total success.", $51
	db "It doesn't matter", $4f
	db "what happens to", $55
	db "this hideout now.", $51
	db "We have much big-", $4f
	db "ger plans.", $51
	db "You'll come to", $4f
	db "appreciate TEAM", $51
	db "ROCKET's true", $4f
	db "power soon enough.", $51
	db "Enjoy yourself", $4f
	db "while you can…", $51
	db "Fufufufu…", $57
; 0x6d5d8

UnknownText_0x6d5d8: ; 0x6d5d8
	db $0, "LANCE: That did", $4f
	db "it. We defeated", $51
	db "all the ROCKETS", $4f
	db "here.", $51
	db "But I'm concerned", $4f
	db "about the young", $51
	db "guy I battled in", $4f
	db "the process…", $57
; 0x6d64e

UnknownText_0x6d64e: ; 0x6d64e
	db $0, "Sorry, ", $14, ".", $4f
	db "I saw how well you", $51
	db "were doing, so I", $4f
	db "just hung back.", $51
	db "Now all there is", $4f
	db "left to do is to", $51
	db "turn off that odd", $4f
	db "radio signal.", $57
; 0x6d6cf

UnknownText_0x6d6cf: ; 0x6d6cf
	db $0, "It's this machine", $4f
	db "that's causing all", $55
	db "the problems.", $51
	db "I don't see a", $4f
	db "switch on it…", $51
	db "We have no choice.", $4f
	db "We have to make", $51
	db "all the ELECTRODE", $4f
	db "faint.", $51
	db "That should stop", $4f
	db "this machine from", $51
	db "transmitting that", $4f
	db "strange signal.", $51
	db "It's no fault of", $4f
	db "the #MON, so it", $51
	db "makes me feel", $4f
	db "guilty.", $51
	db $14, ", let's", $4f
	db "split the job.", $57
; 0x6d7ea

UnknownText_0x6d7ea: ; 0x6d7ea
	db $0, "LANCE: Leave this", $4f
	db "side to me.", $57
; 0x6d809

UnknownText_0x6d809: ; 0x6d809
	db $0, "LANCE: That odd", $4f
	db "signal has finally", $55
	db "stopped.", $51
	db "The LAKE should be", $4f
	db "back to normal.", $51
	db "You're the hero!", $4f
	db "Let me thank you", $51
	db "on behalf of all", $4f
	db "the #MON.", $51
	db "Oh, yes. You", $4f
	db "should take this.", $51
	db "I found it here,", $4f
	db "but I don't have", $55
	db "any need for it.", $57
; 0x6d8e6

UnknownText_0x6d8e6: ; 0x6d8e6
	db $0, $52, " received", $4f
	db "HM06.", $57
; 0x6d8f8

UnknownText_0x6d8f8: ; 0x6d8f8
	db $0, "That's WHIRLPOOL.", $4f
	db "Teach it to a", $51
	db "#MON to get", $4f
	db "across wild water.", $51
	db "But keep this in", $4f
	db "mind.", $51
	db "You can use that", $4f
	db "out of battle only", $51
	db "with the BADGE", $4f
	db "from MAHOGANY GYM.", $57
; 0x6d994

UnknownText_0x6d994: ; 0x6d994
	db $0, $14, "…", $51
	db "The journey to be-", $4f
	db "coming the #MON", $51
	db "MASTER is long and", $4f
	db "difficult.", $51
	db "Knowing that, will", $4f
	db "you keep going?", $51
	db "…", $51
	db "I see. No, you're", $4f
	db "right.", $51
	db "If you would give", $4f
	db "up that easily,", $51
	db "you would have", $4f
	db "never chased that", $51
	db "dream in the first", $4f
	db "place.", $51
	db "I look forward to", $4f
	db "seeing you again!", $57
; 0x6da97

UnknownText_0x6da97: ; 0x6da97
	db $0, "LANCE: Are you all", $4f
	db "right?", $51
	db "Your #MON are", $4f
	db "hurt and tired.", $51
	db "Here, give them", $4f
	db "some of my medi-", $55
	db "cine.", $57
; 0x6daf7

UnknownText_0x6daf7: ; 0x6daf7
	db $0, "LANCE: ", $14, ",", $4f
	db "let's give it our", $55
	db "best for #MON.", $57
; 0x6db22

GruntM17SeenText: ; 0x6db22
	db $0, "The door won't", $4f
	db "open?", $51
	db "Well, duh.", $4f
	db "It has to have a", $51
	db "password that only", $4f
	db "TEAM ROCKET knows.", $57
; 0x6db79

GruntM17BeatenText: ; 0x6db79
	db $0, "What? I lost?", $57
; 0x6db88

UnknownText_0x6db88: ; 0x6db88
	db $0, "Heh, I'm just a", $4f
	db "GRUNT.", $51
	db "I don't know the", $4f
	db "password. Too bad", $55
	db "for you.", $57
; 0x6dbca

GruntM18SeenText: ; 0x6dbca
	db $0, "Oh, a kid? I don't", $4f
	db "really like this,", $51
	db "but eliminate you", $4f
	db "I must.", $57
; 0x6dc09

GruntM18BeatenText: ; 0x6dc09
	db $0, "I knew I'd lose…", $57
; 0x6dc1a

UnknownText_0x6dc1a: ; 0x6dc1a
	db $0, "I got wiped out on", $4f
	db "the last mission", $55
	db "by a kid too.", $51
	db "When we were ab-", $4f
	db "ducting #MON,", $51
	db "this kid with long", $4f
	db "red hair and mean-", $51
	db "looking eyes just", $4f
	db "creamed me…", $57
; 0x6dcb0

GruntM19SeenText: ; 0x6dcb0
	db $0, "You rotten little", $4f
	db "pest!", $57
; 0x6dcc9

GruntM19BeatenText: ; 0x6dcc9
	db $0, "Grrrr…", $57
; 0x6dcd1

UnknownText_0x6dcd1: ; 0x6dcd1
	db $0, "Heh, only the boss", $4f
	db "knows the password", $55
	db "for that door.", $51
	db "Where's the boss?", $4f
	db "Who knows? Go look", $55
	db "for yourself.", $57
; 0x6dd39

UnknownText_0x6dd39: ; 0x6dd39
	db $0, "The door's closed…", $51
	db "It needs a pass-", $4f
	db "word to open.", $57
; 0x6dd6b

UnknownText_0x6dd6b: ; 0x6dd6b
	db $0, "The door's closed…", $51
	db $52, " entered", $4f
	db "the password.", $51
	db "The door opened!", $57
; 0x6dda7

UnknownText_0x6dda7: ; 0x6dda7
	db $0, "It's the radio", $4f
	db "transmitter that's", $51
	db "sending the", $4f
	db "sinister signal.", $51
	db "It's working at", $4f
	db "full capacity.", $57
; 0x6de03

UnknownText_0x6de03: ; 0x6de03
	db $0, "The radio trans-", $4f
	db "mitter has finally", $51
	db "stopped its evil", $4f
	db "broadcast.", $57
; 0x6de44

TeamRocketBaseB2F_MapEventHeader: ; 0x6de44
	; filler
	db 0, 0

	; warps
	db 5
	warp_def $e, $3, 2, GROUP_TEAM_ROCKET_BASE_B1F, MAP_TEAM_ROCKET_BASE_B1F
	warp_def $2, $3, 1, GROUP_TEAM_ROCKET_BASE_B3F, MAP_TEAM_ROCKET_BASE_B3F
	warp_def $2, $1b, 2, GROUP_TEAM_ROCKET_BASE_B3F, MAP_TEAM_ROCKET_BASE_B3F
	warp_def $6, $3, 3, GROUP_TEAM_ROCKET_BASE_B3F, MAP_TEAM_ROCKET_BASE_B3F
	warp_def $e, $1b, 4, GROUP_TEAM_ROCKET_BASE_B3F, MAP_TEAM_ROCKET_BASE_B3F

	; xy triggers
	db 9
	xy_trigger 0, $e, $5, $0, UnknownScript_0x6d085, $0, $0
	xy_trigger 0, $d, $4, $0, UnknownScript_0x6d08b, $0, $0
	xy_trigger 1, $b, $e, $0, UnknownScript_0x6cf95, $0, $0
	xy_trigger 1, $b, $f, $0, UnknownScript_0x6cf9c, $0, $0
	xy_trigger 2, $c, $e, $0, UnknownScript_0x6d075, $0, $0
	xy_trigger 2, $c, $f, $0, UnknownScript_0x6d075, $0, $0
	xy_trigger 2, $3, $c, $0, UnknownScript_0x6d07a, $0, $0
	xy_trigger 2, $a, $c, $0, UnknownScript_0x6d07a, $0, $0
	xy_trigger 2, $b, $c, $0, UnknownScript_0x6d07a, $0, $0

	; signposts
	db 23
	signpost 12, 14, $6, MapTeamRocketBaseB2FSignpostPtr1
	signpost 12, 15, $6, MapTeamRocketBaseB2FSignpostPtr1
	signpost 9, 17, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 9, 16, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 9, 15, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 9, 14, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 9, 13, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 9, 12, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 8, 12, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 7, 12, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 6, 12, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 5, 12, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 4, 12, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 4, 13, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 4, 14, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 4, 15, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 4, 16, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 4, 17, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 5, 17, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 6, 17, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 7, 17, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 8, 17, $0, MapTeamRocketBaseB2FSignpost21Script
	signpost 7, 26, $7, MapTeamRocketBaseB2FSignpostItem22

	; people-events
	db 14
	person_event SPRITE_ROCKET, 20, 24, $7, $0, 255, 255, $0, 0, ObjectEvent, $06de
	person_event SPRITE_ROCKET_GIRL, 20, 24, $7, $0, 255, 255, $80, 0, ObjectEvent, $06dd
	person_event SPRITE_LANCE, 17, 9, $6, $0, 255, 255, $0, 0, ObjectEvent, $06d6
	person_event SPRITE_DRAGON, 17, 13, $9, $0, 255, 255, $0, 0, ObjectEvent, $06df
	person_event SPRITE_VOLTORB, 9, 11, $16, $0, 255, 255, $0, 0, VoltorbScript_0x6d101, $06e0
	person_event SPRITE_VOLTORB, 11, 11, $16, $0, 255, 255, $0, 0, VoltorbScript_0x6d12c, $06e1
	person_event SPRITE_VOLTORB, 13, 11, $16, $0, 255, 255, $0, 0, VoltorbScript_0x6d157, $06e2
	person_event SPRITE_VOLTORB, 9, 26, $16, $0, 255, 255, $0, 0, ObjectEvent, $06e0
	person_event SPRITE_VOLTORB, 11, 26, $16, $0, 255, 255, $0, 0, ObjectEvent, $06e1
	person_event SPRITE_VOLTORB, 13, 26, $16, $0, 255, 255, $0, 0, ObjectEvent, $06e2
	person_event SPRITE_ROCKET, 17, 29, $6, $0, 255, 255, $2, 3, TrainerGruntM17, $06da
	person_event SPRITE_ROCKET, 5, 8, $a, $0, 255, 255, $2, 1, TrainerGruntM18, $06da
	person_event SPRITE_ROCKET, 18, 25, $8, $0, 255, 255, $2, 4, TrainerGruntM19, $06da
	person_event SPRITE_POKE_BALL, 14, 7, $1, $0, 255, 255, $1, 0, ItemFragment_0x6d20d, $066c
; 0x6dfd4

