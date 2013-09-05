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
	checkbit1 $0303
	iftrue UnknownScript_0x6dff7
	return
; 0x6dff7

UnknownScript_0x6dff7: ; 0x6dff7
	changeblock $a, $8, $7
	return
; 0x6dffc

LanceScript_0x6dffc: ; 0x6dffc
	spriteface $0, $2
	pause 5
	spriteface $4, $3
	pause 20
	applymovement $2, MovementData_0x6e12a
	loadfont
	2writetext UnknownText_0x6e179
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x6e12c
	disappear $2
	dotrigger $1
	end
; 0x6e019

UnknownScript_0x6e019: ; 0x6e019
	spriteface $0, $2
	showemote $0, $0, 15
	special $006a
	appear $a
	applymovement $a, MovementData_0x6e164
	spriteface $0, $2
	playmusic $001f
	loadfont
	2writetext UnknownText_0x6e267
	closetext
	loadmovesprites
	playsound $0041
	applymovement $0, MovementData_0x6e175
	applymovement $a, MovementData_0x6e16d
	disappear $a
	dotrigger $2
	special $003d
	end
; 0x6e048

RocketScript_0x6e048: ; 0x6e048
	jumptextfaceplayer UnknownText_0x6e235
; 0x6e04b

UnknownScript_0x6e04b: ; 0x6e04b
	applymovement $0, MovementData_0x6e133
	2jump UnknownScript_0x6e056
; 0x6e052

UnknownScript_0x6e052: ; 0x6e052
	applymovement $0, MovementData_0x6e13a
UnknownScript_0x6e056: ; 0x6e056
	pause 30
	showemote $0, $3, 15
	playmusic $0039
	spriteface $3, $0
	loadfont
	2writetext UnknownText_0x6e400
	closetext
	loadmovesprites
	applymovement $3, MovementData_0x6e142
	winlosstext UnknownText_0x6e511, $0000
	setlasttalked $3
	loadtrainer EXECUTIVEM, 4
	startbattle
	returnafterbattle
	setbit1 $0574
	loadfont
	2writetext UnknownText_0x6e548
	closetext
	loadmovesprites
	applymovement $3, MovementData_0x6e144
	playsound $0041
	applymovement $3, MovementData_0x6e147
	disappear $3
	dotrigger $3
	end
; 0x6e091

MoltresScript_0x6e091: ; 0x6e091
	loadfont
	2writetext UnknownText_0x6e585
	closetext
	loadmovesprites
	setbit1 EVENT_LEARNED_HAIL_GIOVANNI
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
	2writetext UnknownText_0x6e611
	closetext
	loadmovesprites
	setbit1 $0301
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
	2writetext UnknownText_0x6e737
	closetext
	loadmovesprites
	setbit1 $0302
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
	2writetext UnknownText_0x6e822
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
	2writetext UnknownText_0x6e90a
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
	checkbit1 $0301
	iffalse UnknownScript_0x6e105
	checkbit1 $0302
	iffalse UnknownScript_0x6e105
	2jump UnknownScript_0x6e10b
; 0x6e105

UnknownScript_0x6e105: ; 0x6e105
	2writetext UnknownText_0x6e970
	closetext
	loadmovesprites
	end
; 0x6e10b

UnknownScript_0x6e10b: ; 0x6e10b
	2writetext UnknownText_0x6e9a3
	closetext
	playsound $001f
	changeblock $a, $8, $7
	reloadmappart
	loadmovesprites
	setbit1 $0303
	waitbutton
	end
; 0x6e11d

MapTeamRocketBaseB3FSignpost9Script: ; 0x6e11d
	jumpstd $0004
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
	db $0, "LANCE: It takes", $4f
	db "two passwords to", $51
	db "get into the", $4f
	db "boss's quarters.", $51
	db "Those passwords", $4f
	db "are known only to", $55
	db "a few ROCKETS.", $51
	db "That ROCKET there", $4f
	db "very graciously", $55
	db "told me so.", $51
	db $14, ", let's go", $4f
	db "get the passwords.", $57
; 0x6e235

UnknownText_0x6e235: ; 0x6e235
	db $0, "Urrggh… The guy", $4f
	db "in the cape is", $55
	db "incredibly tough…", $57
; 0x6e267

UnknownText_0x6e267: ; 0x6e267
	db $0, "…", $51
	db "Didn't I tell you", $4f
	db "that I was going", $51
	db "to destroy TEAM", $4f
	db "ROCKET?", $51
	db "…Tell me, who was", $4f
	db "the guy in the", $51
	db "cape who used", $4f
	db "dragon #MON?", $51
	db "My #MON were no", $4f
	db "match at all.", $51
	db "I don't care that", $4f
	db "I lost. I can beat", $51
	db "him by getting", $4f
	db "stronger #MON.", $51
	db "It's what he said", $4f
	db "that bothers me…", $51
	db "He told me that", $4f
	db "I don't love and", $51
	db "trust my #MON", $4f
	db "enough.", $51
	db "I'm furious that I", $4f
	db "lost to a bleeding", $55
	db "heart like him.", $51
	db "…Humph! I don't", $4f
	db "have the time for", $55
	db "the likes of you!", $57
; 0x6e400

UnknownText_0x6e400: ; 0x6e400
	db $0, "What? Who are you?", $4f
	db "This is the office", $51
	db "of our leader,", $4f
	db "GIOVANNI.", $51
	db "Since disbanding", $4f
	db "TEAM ROCKET three", $51
	db "years ago, he has", $4f
	db "been in training.", $51
	db "But we're certain", $4f
	db "he will be back", $51
	db "some day to assume", $4f
	db "command again.", $51
	db "That's why we're", $4f
	db "standing guard.", $51
	db "I won't let any-", $4f
	db "one disturb this", $55
	db "place!", $57
; 0x6e511

UnknownText_0x6e511: ; 0x6e511
	db $0, "I… I couldn't do a", $4f
	db "thing…", $51
	db "GIOVANNI, please", $4f
	db "forgive me…", $57
; 0x6e548

UnknownText_0x6e548: ; 0x6e548
	db $0, "No, I can't let", $4f
	db "this affect me.", $51
	db "I have to inform", $4f
	db "the others…", $57
; 0x6e585

UnknownText_0x6e585: ; 0x6e585
	db $0, "MURKROW: The", $4f
	db "password is…", $51
	db "HAIL GIOVANNI.", $57
; 0x6e5af

GruntF5SeenText: ; 0x6e5af
	db $0, "Do I know the", $4f
	db "password?", $51
	db "Maybe.", $51
	db "But no weakling's", $4f
	db "going to get it!", $57
; 0x6e5f1

GruntF5BeatenText: ; 0x6e5f1
	db $0, "All right. Stop.", $4f
	db "I'll tell you.", $57
; 0x6e611

UnknownText_0x6e611: ; 0x6e611
	db $0, "The password to", $4f
	db "the boss's room is", $51
	db "SLOWPOKETAIL.", $51
	db "But it's useless", $4f
	db "unless you have", $55
	db "two passwords.", $57
; 0x6e671

GruntM28SeenText: ; 0x6e671
	db $0, "Hyuck-hyuck-hyuck!", $51
	db "You're challenging", $4f
	db "me to a battle?", $51
	db "Hah! You're nuts,", $4f
	db "but you have guts!", $51
	db "I like that!", $51
	db "If you can beat", $4f
	db "me, I'll tell you", $51
	db "a password to the", $4f
	db "boss's room!", $57
; 0x6e717

GruntM28BeatenText: ; 0x6e717
	db $0, "Hyuck-hyuck-hyuck!", $4f
	db "You're good!", $57
; 0x6e737

UnknownText_0x6e737: ; 0x6e737
	db $0, "Hyuck-hyuck-hyuck!", $51
	db "The password to", $4f
	db "the boss's room…", $51
	db "Uh…, I think it is", $4f
	db "RATICATE TAIL.", $57
; 0x6e78d

ScientistRossSeenText: ; 0x6e78d
	db $0, "I used to work for", $4f
	db "SILPH, but now I", $51
	db "run research for", $4f
	db "TEAM ROCKET.", $51
	db "A meddlesome child", $4f
	db "like you needs to", $55
	db "be punished.", $57
; 0x6e802

ScientistRossBeatenText: ; 0x6e802
	db $0, "A mere tactical", $4f
	db "error cost me…", $57
; 0x6e822

UnknownText_0x6e822: ; 0x6e822
	db $0, "A radio signal", $4f
	db "that drives #-", $55
	db "MON mad…", $51
	db "My experiment is a", $4f
	db "complete success.", $51
	db "My promotion is", $4f
	db "assured. This loss", $51
	db "means absolutely", $4f
	db "nothing.", $57
; 0x6e8ac

ScientistMitchSeenText: ; 0x6e8ac
	db $0, "I don't care that", $4f
	db "#MON are hurt", $55
	db "by our experiment.", $57
; 0x6e8df

ScientistMitchBeatenText: ; 0x6e8df
	db $0, "Thinking is my", $4f
	db "strong suit, not", $55
	db "battling.", $57
; 0x6e90a

UnknownText_0x6e90a: ; 0x6e90a
	db $0, "If we turn up the", $4f
	db "power of our radio", $51
	db "signal for broad-", $4f
	db "cast nationwide…", $51
	db "The very thought", $4f
	db "excites me!", $57
; 0x6e970

UnknownText_0x6e970: ; 0x6e970
	db $0, "The door's closed…", $51
	db "It needs two", $4f
	db "passwords to open.", $57
; 0x6e9a3

UnknownText_0x6e9a3: ; 0x6e9a3
	db $0, "The door's closed…", $51
	db $52, " entered", $4f
	db "the two passwords.", $51
	db "The door opened!", $57
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

