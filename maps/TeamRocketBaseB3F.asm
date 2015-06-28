TeamRocketBaseB3F_MapScriptHeader: ; 0x6dfd4
	; trigger count
	db 4

	; triggers
	dw UnknownScript_0x6dfe9, $0000
	dw UnknownScript_0x6dfed, $0000
	dw UnknownScript_0x6dfee, $0000
	dw UnknownScript_0x6dfef, $0000

	; callback count
	db 1

	; callbacks

	dbw 1, UnknownScript_0x6dff0
; 0x6dfe9

UnknownScript_0x6dfe9: ; 0x6dfe9
	priorityjump LanceScript_0x6dffc
	end
; 0x6dfed

UnknownScript_0x6dfed: ; 0x6dfed
	end
; 0x6dfee

UnknownScript_0x6dfee: ; 0x6dfee
	end
; 0x6dfef

UnknownScript_0x6dfef: ; 0x6dfef
	end
; 0x6dff0

UnknownScript_0x6dff0: ; 0x6dff0
	checkevent $0303
	iftrue UnknownScript_0x6dff7
	return
; 0x6dff7

UnknownScript_0x6dff7: ; 0x6dff7
	changeblock $a, $8, $7
	return
; 0x6dffc

LanceScript_0x6dffc: ; 0x6dffc
	spriteface $0, LEFT
	pause 5
	spriteface $4, RIGHT
	pause 20
	applymovement $2, MovementData_0x6e12a
	loadfont
	writetext UnknownText_0x6e179
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x6e12c
	disappear $2
	dotrigger $1
	end
; 0x6e019

UnknownScript_0x6e019: ; 0x6e019
	spriteface $0, LEFT
	showemote $0, $0, 15
	special Functionc48f
	appear $a
	applymovement $a, MovementData_0x6e164
	spriteface $0, LEFT
	playmusic MUSIC_RIVAL_ENCOUNTER
	loadfont
	writetext UnknownText_0x6e267
	closetext
	loadmovesprites
	playsound SFX_TACKLE
	applymovement $0, MovementData_0x6e175
	applymovement $a, MovementData_0x6e16d
	disappear $a
	dotrigger $2
	special RestartMapMusic
	end
; 0x6e048

RocketScript_0x6e048: ; 0x6e048
	jumptextfaceplayer UnknownText_0x6e235
; 0x6e04b

UnknownScript_0x6e04b: ; 0x6e04b
	applymovement $0, MovementData_0x6e133
	jump UnknownScript_0x6e056
; 0x6e052

UnknownScript_0x6e052: ; 0x6e052
	applymovement $0, MovementData_0x6e13a
UnknownScript_0x6e056: ; 0x6e056
	pause 30
	showemote $0, $3, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	spriteface $3, DOWN
	loadfont
	writetext UnknownText_0x6e400
	closetext
	loadmovesprites
	applymovement $3, MovementData_0x6e142
	winlosstext UnknownText_0x6e511, $0000
	setlasttalked $3
	loadtrainer EXECUTIVEM, 4
	startbattle
	returnafterbattle
	setevent $0574
	loadfont
	writetext UnknownText_0x6e548
	closetext
	loadmovesprites
	applymovement $3, MovementData_0x6e144
	playsound SFX_TACKLE
	applymovement $3, MovementData_0x6e147
	disappear $3
	dotrigger $3
	end
; 0x6e091

MoltresScript_0x6e091: ; 0x6e091
	loadfont
	writetext UnknownText_0x6e585
	closetext
	loadmovesprites
	setevent EVENT_LEARNED_HAIL_GIOVANNI
	end
; 0x6e09b

TrainerGruntF5: ; 0x6e09b
	; bit/flag number
	dw $514

	; trainer group && trainer id
	db GRUNTF, 5

	; text when seen
	dw GruntF5SeenText

	; text when trainer beaten
	dw GruntF5BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntF5Script
; 0x6e0a7

GruntF5Script: ; 0x6e0a7
	talkaftercancel
	loadfont
	writetext UnknownText_0x6e611
	closetext
	loadmovesprites
	setevent $0301
	end
; 0x6e0b2

TrainerGruntM28: ; 0x6e0b2
	; bit/flag number
	dw $50c

	; trainer group && trainer id
	db GRUNTM, 28

	; text when seen
	dw GruntM28SeenText

	; text when trainer beaten
	dw GruntM28BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntM28Script
; 0x6e0be

GruntM28Script: ; 0x6e0be
	talkaftercancel
	loadfont
	writetext UnknownText_0x6e737
	closetext
	loadmovesprites
	setevent $0302
	end
; 0x6e0c9

TrainerScientistRoss: ; 0x6e0c9
	; bit/flag number
	dw $49f

	; trainer group && trainer id
	db SCIENTIST, ROSS

	; text when seen
	dw ScientistRossSeenText

	; text when trainer beaten
	dw ScientistRossBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw ScientistRossScript
; 0x6e0d5

ScientistRossScript: ; 0x6e0d5
	talkaftercancel
	loadfont
	writetext UnknownText_0x6e822
	closetext
	loadmovesprites
	end
; 0x6e0dd

TrainerScientistMitch: ; 0x6e0dd
	; bit/flag number
	dw $4a0

	; trainer group && trainer id
	db SCIENTIST, MITCH

	; text when seen
	dw ScientistMitchSeenText

	; text when trainer beaten
	dw ScientistMitchBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw ScientistMitchScript
; 0x6e0e9

ScientistMitchScript: ; 0x6e0e9
	talkaftercancel
	loadfont
	writetext UnknownText_0x6e90a
	closetext
	loadmovesprites
	end
; 0x6e0f1

MapTeamRocketBaseB3FSignpostPtr1: ; 0x6e0f1
	dw $0303
	dw MapTeamRocketBaseB3FSignpost1Script
	
; 0x6e0f5

MapTeamRocketBaseB3FSignpost1Script: ; 0x6e0f5
	loadfont
	checkevent $0301
	iffalse UnknownScript_0x6e105
	checkevent $0302
	iffalse UnknownScript_0x6e105
	jump UnknownScript_0x6e10b
; 0x6e105

UnknownScript_0x6e105: ; 0x6e105
	writetext UnknownText_0x6e970
	closetext
	loadmovesprites
	end
; 0x6e10b

UnknownScript_0x6e10b: ; 0x6e10b
	writetext UnknownText_0x6e9a3
	closetext
	playsound SFX_ENTER_DOOR
	changeblock $a, $8, $7
	reloadmappart
	loadmovesprites
	setevent $0303
	waitbutton
	end
; 0x6e11d

MapTeamRocketBaseB3FSignpost9Script: ; 0x6e11d
	jumpstd teamrocketoath
; 0x6e120

ItemFragment_0x6e120: ; 0x6e120
	db PROTEIN, 1
; 0x6e122

ItemFragment_0x6e122: ; 0x6e122
	db X_SPECIAL, 1
; 0x6e124

ItemFragment_0x6e124: ; 0x6e124
	db FULL_HEAL, 1
; 0x6e126

ItemFragment_0x6e126: ; 0x6e126
	db ICE_HEAL, 1
; 0x6e128

ItemFragment_0x6e128: ; 0x6e128
	db ULTRA_BALL, 1
; 0x6e12a

MovementData_0x6e12a: ; 0x6e12a
	step_right
	step_end
; 0x6e12c

MovementData_0x6e12c: ; 0x6e12c
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end
; 0x6e133

MovementData_0x6e133: ; 0x6e133
	step_up
	step_up
	step_up
	step_left
	step_left
	turn_head_up
	step_end
; 0x6e13a

MovementData_0x6e13a: ; 0x6e13a
	step_up
	step_up
	step_left
	step_up
	step_left
	step_left
	turn_head_up
	step_end
; 0x6e142

MovementData_0x6e142: ; 0x6e142
	step_down
	step_end
; 0x6e144

MovementData_0x6e144: ; 0x6e144
	big_step_right
	big_step_right
	step_end
; 0x6e147

MovementData_0x6e147: ; 0x6e147
	fix_facing
	fast_jump_step_left
	remove_fixed_facing
	accelerate_last
	accelerate_last
	slow_step_right
	big_step_down
	big_step_down
	big_step_down
	big_step_right
	big_step_down
	big_step_down
	big_step_down
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_left
	big_step_left
	step_end
; 0x6e164

MovementData_0x6e164: ; 0x6e164
	step_down
	step_down
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_end
; 0x6e16d

MovementData_0x6e16d: ; 0x6e16d
	step_left
	step_left
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end
; 0x6e175

MovementData_0x6e175: ; 0x6e175
	fix_facing
	big_step_right
	remove_fixed_facing
	step_end
; 0x6e179

UnknownText_0x6e179: ; 0x6e179
	text "LANCE: It takes"
	line "two passwords to"

	para "get into the"
	line "boss's quarters."

	para "Those passwords"
	line "are known only to"
	cont "a few ROCKETS."

	para "That ROCKET there"
	line "very graciously"
	cont "told me so."

	para "<PLAY_G>, let's go"
	line "get the passwords."
	done
; 0x6e235

UnknownText_0x6e235: ; 0x6e235
	text "Urrggh… The guy"
	line "in the cape is"
	cont "incredibly tough…"
	done
; 0x6e267

UnknownText_0x6e267: ; 0x6e267
	text "…"

	para "Didn't I tell you"
	line "that I was going"

	para "to destroy TEAM"
	line "ROCKET?"

	para "…Tell me, who was"
	line "the guy in the"

	para "cape who used"
	line "dragon #MON?"

	para "My #MON were no"
	line "match at all."

	para "I don't care that"
	line "I lost. I can beat"

	para "him by getting"
	line "stronger #MON."

	para "It's what he said"
	line "that bothers me…"

	para "He told me that"
	line "I don't love and"

	para "trust my #MON"
	line "enough."

	para "I'm furious that I"
	line "lost to a bleeding"
	cont "heart like him."

	para "…Humph! I don't"
	line "have the time for"
	cont "the likes of you!"
	done
; 0x6e400

UnknownText_0x6e400: ; 0x6e400
	text "What? Who are you?"
	line "This is the office"

	para "of our leader,"
	line "GIOVANNI."

	para "Since disbanding"
	line "TEAM ROCKET three"

	para "years ago, he has"
	line "been in training."

	para "But we're certain"
	line "he will be back"

	para "some day to assume"
	line "command again."

	para "That's why we're"
	line "standing guard."

	para "I won't let any-"
	line "one disturb this"
	cont "place!"
	done
; 0x6e511

UnknownText_0x6e511: ; 0x6e511
	text "I… I couldn't do a"
	line "thing…"

	para "GIOVANNI, please"
	line "forgive me…"
	done
; 0x6e548

UnknownText_0x6e548: ; 0x6e548
	text "No, I can't let"
	line "this affect me."

	para "I have to inform"
	line "the others…"
	done
; 0x6e585

UnknownText_0x6e585: ; 0x6e585
	text "MURKROW: The"
	line "password is…"

	para "HAIL GIOVANNI."
	done
; 0x6e5af

GruntF5SeenText: ; 0x6e5af
	text "Do I know the"
	line "password?"

	para "Maybe."

	para "But no weakling's"
	line "going to get it!"
	done
; 0x6e5f1

GruntF5BeatenText: ; 0x6e5f1
	text "All right. Stop."
	line "I'll tell you."
	done
; 0x6e611

UnknownText_0x6e611: ; 0x6e611
	text "The password to"
	line "the boss's room is"

	para "SLOWPOKETAIL."

	para "But it's useless"
	line "unless you have"
	cont "two passwords."
	done
; 0x6e671

GruntM28SeenText: ; 0x6e671
	text "Hyuck-hyuck-hyuck!"

	para "You're challenging"
	line "me to a battle?"

	para "Hah! You're nuts,"
	line "but you have guts!"

	para "I like that!"

	para "If you can beat"
	line "me, I'll tell you"

	para "a password to the"
	line "boss's room!"
	done
; 0x6e717

GruntM28BeatenText: ; 0x6e717
	text "Hyuck-hyuck-hyuck!"
	line "You're good!"
	done
; 0x6e737

UnknownText_0x6e737: ; 0x6e737
	text "Hyuck-hyuck-hyuck!"

	para "The password to"
	line "the boss's room…"

	para "Uh…, I think it is"
	line "RATICATE TAIL."
	done
; 0x6e78d

ScientistRossSeenText: ; 0x6e78d
	text "I used to work for"
	line "SILPH, but now I"

	para "run research for"
	line "TEAM ROCKET."

	para "A meddlesome child"
	line "like you needs to"
	cont "be punished."
	done
; 0x6e802

ScientistRossBeatenText: ; 0x6e802
	text "A mere tactical"
	line "error cost me…"
	done
; 0x6e822

UnknownText_0x6e822: ; 0x6e822
	text "A radio signal"
	line "that drives #-"
	cont "MON mad…"

	para "My experiment is a"
	line "complete success."

	para "My promotion is"
	line "assured. This loss"

	para "means absolutely"
	line "nothing."
	done
; 0x6e8ac

ScientistMitchSeenText: ; 0x6e8ac
	text "I don't care that"
	line "#MON are hurt"
	cont "by our experiment."
	done
; 0x6e8df

ScientistMitchBeatenText: ; 0x6e8df
	text "Thinking is my"
	line "strong suit, not"
	cont "battling."
	done
; 0x6e90a

UnknownText_0x6e90a: ; 0x6e90a
	text "If we turn up the"
	line "power of our radio"

	para "signal for broad-"
	line "cast nationwide…"

	para "The very thought"
	line "excites me!"
	done
; 0x6e970

UnknownText_0x6e970: ; 0x6e970
	text "The door's closed…"

	para "It needs two"
	line "passwords to open."
	done
; 0x6e9a3

UnknownText_0x6e9a3: ; 0x6e9a3
	text "The door's closed…"

	para "<PLAYER> entered"
	line "the two passwords."

	para "The door opened!"
	done
; 0x6e9e4

TeamRocketBaseB3F_MapEventHeader: ; 0x6e9e4
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $2, $3, 2, GROUP_TEAM_ROCKET_BASE_B2F, MAP_TEAM_ROCKET_BASE_B2F
	warp_def $2, $1b, 3, GROUP_TEAM_ROCKET_BASE_B2F, MAP_TEAM_ROCKET_BASE_B2F
	warp_def $6, $3, 4, GROUP_TEAM_ROCKET_BASE_B2F, MAP_TEAM_ROCKET_BASE_B2F
	warp_def $e, $1b, 5, GROUP_TEAM_ROCKET_BASE_B2F, MAP_TEAM_ROCKET_BASE_B2F

	; xy triggers
	db 3
	xy_trigger 2, $8, $a, $0, UnknownScript_0x6e04b, $0, $0
	xy_trigger 2, $8, $b, $0, UnknownScript_0x6e052, $0, $0
	xy_trigger 1, $a, $8, $0, UnknownScript_0x6e019, $0, $0

	; signposts
	db 10
	signpost 9, 10, $6, MapTeamRocketBaseB3FSignpostPtr1
	signpost 9, 11, $6, MapTeamRocketBaseB3FSignpostPtr1
	signpost 1, 10, $0, MapTeamRocketBaseB3FSignpost9Script
	signpost 1, 11, $0, MapTeamRocketBaseB3FSignpost9Script
	signpost 1, 12, $0, MapTeamRocketBaseB3FSignpost9Script
	signpost 1, 13, $0, MapTeamRocketBaseB3FSignpost9Script
	signpost 13, 4, $0, MapTeamRocketBaseB3FSignpost9Script
	signpost 13, 5, $0, MapTeamRocketBaseB3FSignpost9Script
	signpost 13, 6, $0, MapTeamRocketBaseB3FSignpost9Script
	signpost 13, 7, $0, MapTeamRocketBaseB3FSignpost9Script

	; people-events
	db 14
	person_event SPRITE_LANCE, 18, 29, $6, $0, 255, 255, $0, 0, LanceScript_0x6dffc, $06d7
	person_event SPRITE_ROCKET, 7, 12, $7, $0, 255, 255, $0, 0, ObjectEvent, $06db
	person_event SPRITE_MOLTRES, 6, 11, $16, $0, 255, 255, $90, 0, MoltresScript_0x6e091, $06da
	person_event SPRITE_ROCKET_GIRL, 11, 25, $7, $0, 255, 255, $82, 0, TrainerGruntF5, $06da
	person_event SPRITE_ROCKET, 18, 9, $a, $0, 255, 255, $2, 3, TrainerGruntM28, $06da
	person_event SPRITE_SCIENTIST, 15, 27, $7, $0, 255, 255, $92, 0, TrainerScientistRoss, $06da
	person_event SPRITE_SCIENTIST, 19, 15, $9, $0, 255, 255, $92, 3, TrainerScientistMitch, $06da
	person_event SPRITE_ROCKET, 18, 28, $6, $0, 255, 255, $0, 0, RocketScript_0x6e048, $06da
	person_event SPRITE_SILVER, 9, 8, $6, $0, 255, 255, $0, 0, ObjectEvent, $06c0
	person_event SPRITE_POKE_BALL, 16, 5, $1, $0, 255, 255, $1, 0, ItemFragment_0x6e120, $066d
	person_event SPRITE_POKE_BALL, 16, 7, $1, $0, 255, 255, $1, 0, ItemFragment_0x6e122, $066e
	person_event SPRITE_POKE_BALL, 13, 32, $1, $0, 255, 255, $1, 0, ItemFragment_0x6e124, $066f
	person_event SPRITE_POKE_BALL, 6, 21, $1, $0, 255, 255, $1, 0, ItemFragment_0x6e126, $0670
	person_event SPRITE_POKE_BALL, 14, 18, $1, $0, 255, 255, $1, 0, ItemFragment_0x6e128, $0654
; 0x6eafe
