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
	jump UnknownScript_0x6cfac
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
	writetext UnknownText_0x6d2ad
	closetext
	loadmovesprites
	spriteface $0, DOWN
	showemote $0, $0, 15
	applymovement $0, MovementData_0x6d21f
	playmusic MUSIC_ROCKET_ENCOUNTER
	applymovement $3, MovementData_0x6d224
	spriteface $0, UP
	applymovement $2, MovementData_0x6d22f
	loadfont
	writetext UnknownText_0x6d2c3
	closetext
	loadmovesprites
	cry DRAGONITE
	spriteface $3, LEFT
	spriteface $0, LEFT
	appear $5
	applymovement $5, MovementData_0x6d236
	applymovement $3, MovementData_0x6d23b
	applymovement $2, MovementData_0x6d24c
	appear $4
	applymovement $4, MovementData_0x6d244
	loadfont
	writetext UnknownText_0x6d38c
	closetext
	loadmovesprites
	spriteface $0, RIGHT
	applymovement $3, MovementData_0x6d241
	loadfont
	writetext UnknownText_0x6d3bd
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
	writetext UnknownText_0x6d4c6
	closetext
	loadmovesprites
	special Function8c0b6
	special Functiond91
	disappear $2
	disappear $3
	disappear $c
	disappear $d
	disappear $e
	pause 15
	special Function8c0ab
	dotrigger $2
	clearevent $06d6
	spriteface $4, DOWN
	loadfont
	writetext UnknownText_0x6d5d8
	closetext
	loadmovesprites
	applymovement $4, MovementData_0x6d250
	spriteface $0, UP
	loadfont
	writetext UnknownText_0x6d64e
	closetext
	loadmovesprites
	follow $4, $0
	applymovement $4, MovementData_0x6d254
	stopfollow
	applymovement $4, MovementData_0x6d258
	loadfont
	writetext UnknownText_0x6d6cf
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
	writetext UnknownText_0x6d7ea
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x6d278
	end
; 0x6d085

UnknownScript_0x6d085: ; 0x6d085
	spriteface $0, UP
	jump UnknownScript_0x6d091
; 0x6d08b

UnknownScript_0x6d08b: ; 0x6d08b
	spriteface $0, RIGHT
	spriteface $4, LEFT
UnknownScript_0x6d091: ; 0x6d091
	loadfont
	writetext UnknownText_0x6da97
	closetext
	loadmovesprites
	special Function8c084
	special Function1060a2
	playsound SFX_FULL_HEAL
	special HealParty
	special Function8c079
	loadfont
	writetext UnknownText_0x6daf7
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
	writetext UnknownText_0x6db88
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
	writetext UnknownText_0x6dc1a
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
	writetext UnknownText_0x6dcd1
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
	special PlayMapMusic
	applymovement $0, MovementData_0x6d28c
	jump UnknownScript_0x6d184
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
	special PlayMapMusic
	applymovement $0, MovementData_0x6d299
	jump UnknownScript_0x6d184
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
	special PlayMapMusic
	applymovement $0, MovementData_0x6d2a4
	jump UnknownScript_0x6d184
; 0x6d182

UnknownScript_0x6d182: ; 0x6d182
	returnafterbattle
	end
; 0x6d184

UnknownScript_0x6d184: ; 0x6d184
	moveperson $4, $12, $6
	appear $4
	applymovement $4, MovementData_0x6d27a
	spriteface $0, RIGHT
	loadfont
	writetext UnknownText_0x6d809
	keeptextopen
	verbosegiveitem HM_06, 1
	setevent EVENT_GOT_HM06_WHIRLPOOL
	writetext UnknownText_0x6d8f8
	closetext
	loadmovesprites
	spriteface $4, DOWN
	loadfont
	writetext UnknownText_0x6d994
	closetext
	loadmovesprites
	spriteface $0, DOWN
	applymovement $4, MovementData_0x6d283
	disappear $4
	setevent EVENT_CLEARED_ROCKET_HIDEOUT
	clearflag $000e
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
	writetext UnknownText_0x6dd39
	closetext
	loadmovesprites
	end
; 0x6d1e8

UnknownScript_0x6d1e8: ; 0x6d1e8
	writetext UnknownText_0x6dd6b
	closetext
	playsound SFX_ENTER_DOOR
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
	writetext UnknownText_0x6dda7
	closetext
	loadmovesprites
	end
; 0x6d207

UnknownScript_0x6d207: ; 0x6d207
	writetext UnknownText_0x6de03
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
	text "Hold it right"
	line "there!"
	done
; 0x6d2c3

UnknownText_0x6d2c3: ; 0x6d2c3
	text "We can't have a"
	line "brat like you on"
	cont "the loose."

	para "It's harmful to"
	line "TEAM ROCKET's"
	cont "pride, you see."

	para "However strong you"
	line "may be, you can't"

	para "take both of us at"
	line "the same time."

	para "Sorry, baby. Now"
	line "get ready to be"
	cont "thrashed."
	done
; 0x6d38c

UnknownText_0x6d38c: ; 0x6d38c
	text "Hey! Don't be so"
	line "selfish. Spread"
	cont "the fun around."
	done
; 0x6d3bd

UnknownText_0x6d3bd: ; 0x6d3bd
	text "What? You had an"
	line "accomplice?"

	para "Where is your"
	line "sense of honor?"

	para "As the interim"
	line "boss in place of"

	para "GIOVANNI, I'll"
	line "show you how wrong"

	para "it is to meddle"
	line "with TEAM ROCKET!"
	done
; 0x6d45c

UnknownText_0x6d45c: ; 0x6d45c
	text "Tch, you really"
	line "are strong."

	para "It's too bad."

	para "If you were to"
	line "join TEAM ROCKET,"

	para "you could become"
	line "an EXECUTIVE."
	done
; 0x6d4c6

UnknownText_0x6d4c6: ; 0x6d4c6
	text "…This hideout is"
	line "done for…"

	para "But that's fine."
	line "The broadcast ex-"
	cont "periment was a"
	cont "total success."

	para "It doesn't matter"
	line "what happens to"
	cont "this hideout now."

	para "We have much big-"
	line "ger plans."

	para "You'll come to"
	line "appreciate TEAM"

	para "ROCKET's true"
	line "power soon enough."

	para "Enjoy yourself"
	line "while you can…"

	para "Fufufufu…"
	done
; 0x6d5d8

UnknownText_0x6d5d8: ; 0x6d5d8
	text "LANCE: That did"
	line "it. We defeated"

	para "all the ROCKETS"
	line "here."

	para "But I'm concerned"
	line "about the young"

	para "guy I battled in"
	line "the process…"
	done
; 0x6d64e

UnknownText_0x6d64e: ; 0x6d64e
	text "Sorry, <PLAY_G>."
	line "I saw how well you"

	para "were doing, so I"
	line "just hung back."

	para "Now all there is"
	line "left to do is to"

	para "turn off that odd"
	line "radio signal."
	done
; 0x6d6cf

UnknownText_0x6d6cf: ; 0x6d6cf
	text "It's this machine"
	line "that's causing all"
	cont "the problems."

	para "I don't see a"
	line "switch on it…"

	para "We have no choice."
	line "We have to make"

	para "all the ELECTRODE"
	line "faint."

	para "That should stop"
	line "this machine from"

	para "transmitting that"
	line "strange signal."

	para "It's no fault of"
	line "the #MON, so it"

	para "makes me feel"
	line "guilty."

	para "<PLAY_G>, let's"
	line "split the job."
	done
; 0x6d7ea

UnknownText_0x6d7ea: ; 0x6d7ea
	text "LANCE: Leave this"
	line "side to me."
	done
; 0x6d809

UnknownText_0x6d809: ; 0x6d809
	text "LANCE: That odd"
	line "signal has finally"
	cont "stopped."

	para "The LAKE should be"
	line "back to normal."

	para "You're the hero!"
	line "Let me thank you"

	para "on behalf of all"
	line "the #MON."

	para "Oh, yes. You"
	line "should take this."

	para "I found it here,"
	line "but I don't have"
	cont "any need for it."
	done
; 0x6d8e6

UnknownText_0x6d8e6: ; 0x6d8e6
	text "<PLAYER> received"
	line "HM06."
	done
; 0x6d8f8

UnknownText_0x6d8f8: ; 0x6d8f8
	text "That's WHIRLPOOL."
	line "Teach it to a"

	para "#MON to get"
	line "across wild water."

	para "But keep this in"
	line "mind."

	para "You can use that"
	line "out of battle only"

	para "with the BADGE"
	line "from MAHOGANY GYM."
	done
; 0x6d994

UnknownText_0x6d994: ; 0x6d994
	text "<PLAY_G>…"

	para "The journey to be-"
	line "coming the #MON"

	para "MASTER is long and"
	line "difficult."

	para "Knowing that, will"
	line "you keep going?"

	para "…"

	para "I see. No, you're"
	line "right."

	para "If you would give"
	line "up that easily,"

	para "you would have"
	line "never chased that"

	para "dream in the first"
	line "place."

	para "I look forward to"
	line "seeing you again!"
	done
; 0x6da97

UnknownText_0x6da97: ; 0x6da97
	text "LANCE: Are you all"
	line "right?"

	para "Your #MON are"
	line "hurt and tired."

	para "Here, give them"
	line "some of my medi-"
	cont "cine."
	done
; 0x6daf7

UnknownText_0x6daf7: ; 0x6daf7
	text "LANCE: <PLAY_G>,"
	line "let's give it our"
	cont "best for #MON."
	done
; 0x6db22

GruntM17SeenText: ; 0x6db22
	text "The door won't"
	line "open?"

	para "Well, duh."
	line "It has to have a"

	para "password that only"
	line "TEAM ROCKET knows."
	done
; 0x6db79

GruntM17BeatenText: ; 0x6db79
	text "What? I lost?"
	done
; 0x6db88

UnknownText_0x6db88: ; 0x6db88
	text "Heh, I'm just a"
	line "GRUNT."

	para "I don't know the"
	line "password. Too bad"
	cont "for you."
	done
; 0x6dbca

GruntM18SeenText: ; 0x6dbca
	text "Oh, a kid? I don't"
	line "really like this,"

	para "but eliminate you"
	line "I must."
	done
; 0x6dc09

GruntM18BeatenText: ; 0x6dc09
	text "I knew I'd lose…"
	done
; 0x6dc1a

UnknownText_0x6dc1a: ; 0x6dc1a
	text "I got wiped out on"
	line "the last mission"
	cont "by a kid too."

	para "When we were ab-"
	line "ducting #MON,"

	para "this kid with long"
	line "red hair and mean-"

	para "looking eyes just"
	line "creamed me…"
	done
; 0x6dcb0

GruntM19SeenText: ; 0x6dcb0
	text "You rotten little"
	line "pest!"
	done
; 0x6dcc9

GruntM19BeatenText: ; 0x6dcc9
	text "Grrrr…"
	done
; 0x6dcd1

UnknownText_0x6dcd1: ; 0x6dcd1
	text "Heh, only the boss"
	line "knows the password"
	cont "for that door."

	para "Where's the boss?"
	line "Who knows? Go look"
	cont "for yourself."
	done
; 0x6dd39

UnknownText_0x6dd39: ; 0x6dd39
	text "The door's closed…"

	para "It needs a pass-"
	line "word to open."
	done
; 0x6dd6b

UnknownText_0x6dd6b: ; 0x6dd6b
	text "The door's closed…"

	para "<PLAYER> entered"
	line "the password."

	para "The door opened!"
	done
; 0x6dda7

UnknownText_0x6dda7: ; 0x6dda7
	text "It's the radio"
	line "transmitter that's"

	para "sending the"
	line "sinister signal."

	para "It's working at"
	line "full capacity."
	done
; 0x6de03

UnknownText_0x6de03: ; 0x6de03
	text "The radio trans-"
	line "mitter has finally"

	para "stopped its evil"
	line "broadcast."
	done
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
