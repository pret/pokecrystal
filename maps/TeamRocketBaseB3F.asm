TeamRocketBaseB3F_MapScriptHeader:
.MapTriggers:
	db 4

	; triggers
	dw .Trigger1, $0000
	dw .Trigger2, $0000
	dw .Trigger3, $0000
	dw .Trigger4, $0000

.MapCallbacks:
	db 1

	; callbacks

	dbw 1, .CheckGiovanniDoor

.Trigger1:
	priorityjump LanceScript_0x6dffc
	end

.Trigger2:
	end

.Trigger3:
	end

.Trigger4:
	end

.CheckGiovanniDoor:
	checkevent EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	iftrue .OpenSesame
	return

.OpenSesame:
	changeblock $a, $8, $7
	return

LanceScript_0x6dffc:
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

UnknownScript_0x6e019:
	spriteface $0, LEFT
	showemote EMOTE_SHOCK, $0, 15
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

RocketScript_0x6e048:
	jumptextfaceplayer UnknownText_0x6e235

UnknownScript_0x6e04b:
	applymovement $0, MovementData_0x6e133
	jump UnknownScript_0x6e056

UnknownScript_0x6e052:
	applymovement $0, MovementData_0x6e13a
UnknownScript_0x6e056:
	pause 30
	showemote EMOTE_SHOCK, $3, 15
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
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_4
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

MoltresScript_0x6e091:
	loadfont
	writetext UnknownText_0x6e585
	closetext
	loadmovesprites
	setevent EVENT_LEARNED_HAIL_GIOVANNI
	end

TrainerGruntF5:
	trainer EVENT_BEAT_ROCKET_GRUNTF_5, GRUNTF, 5, GruntF5SeenText, GruntF5BeatenText, $0000, GruntF5Script

GruntF5Script:
	talkaftercancel
	loadfont
	writetext UnknownText_0x6e611
	closetext
	loadmovesprites
	setevent EVENT_LEARNED_SLOWPOKETAIL
	end

TrainerGruntM28:
	trainer EVENT_BEAT_ROCKET_GRUNTM_28, GRUNTM, 28, GruntM28SeenText, GruntM28BeatenText, $0000, GruntM28Script

GruntM28Script:
	talkaftercancel
	loadfont
	writetext UnknownText_0x6e737
	closetext
	loadmovesprites
	setevent EVENT_LEARNED_RATICATE_TAIL
	end

TrainerScientistRoss:
	trainer EVENT_BEAT_SCIENTIST_ROSS, SCIENTIST, ROSS, ScientistRossSeenText, ScientistRossBeatenText, $0000, ScientistRossScript

ScientistRossScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x6e822
	closetext
	loadmovesprites
	end

TrainerScientistMitch:
	trainer EVENT_BEAT_SCIENTIST_MITCH, SCIENTIST, MITCH, ScientistMitchSeenText, ScientistMitchBeatenText, $0000, ScientistMitchScript

ScientistMitchScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x6e90a
	closetext
	loadmovesprites
	end

BossDoor:
	dw EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	dw .Script
	
.Script
	loadfont
	checkevent EVENT_LEARNED_SLOWPOKETAIL
	iffalse .NeedsPassword
	checkevent EVENT_LEARNED_RATICATE_TAIL
	iffalse .NeedsPassword
	jump .OpenSesame

.NeedsPassword
	writetext UnknownText_0x6e970
	closetext
	loadmovesprites
	end

.OpenSesame
	writetext UnknownText_0x6e9a3
	closetext
	playsound SFX_ENTER_DOOR
	changeblock $a, $8, $7
	reloadmappart
	loadmovesprites
	setevent EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	waitbutton
	end

MapTeamRocketBaseB3FSignpost9Script:
	jumpstd teamrocketoath

ItemFragment_0x6e120:
	db PROTEIN, 1

ItemFragment_0x6e122:
	db X_SPECIAL, 1

ItemFragment_0x6e124:
	db FULL_HEAL, 1

ItemFragment_0x6e126:
	db ICE_HEAL, 1

ItemFragment_0x6e128:
	db ULTRA_BALL, 1

MovementData_0x6e12a:
	step_right
	step_end

MovementData_0x6e12c:
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

MovementData_0x6e133:
	step_up
	step_up
	step_up
	step_left
	step_left
	turn_head_up
	step_end

MovementData_0x6e13a:
	step_up
	step_up
	step_left
	step_up
	step_left
	step_left
	turn_head_up
	step_end

MovementData_0x6e142:
	step_down
	step_end

MovementData_0x6e144:
	big_step_right
	big_step_right
	step_end

MovementData_0x6e147:
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

MovementData_0x6e164:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_end

MovementData_0x6e16d:
	step_left
	step_left
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

MovementData_0x6e175:
	fix_facing
	big_step_right
	remove_fixed_facing
	step_end

UnknownText_0x6e179:
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

UnknownText_0x6e235:
	text "Urrggh… The guy"
	line "in the cape is"
	cont "incredibly tough…"
	done

UnknownText_0x6e267:
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

UnknownText_0x6e400:
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

UnknownText_0x6e511:
	text "I… I couldn't do a"
	line "thing…"

	para "GIOVANNI, please"
	line "forgive me…"
	done

UnknownText_0x6e548:
	text "No, I can't let"
	line "this affect me."

	para "I have to inform"
	line "the others…"
	done

UnknownText_0x6e585:
	text "MURKROW: The"
	line "password is…"

	para "HAIL GIOVANNI."
	done

GruntF5SeenText:
	text "Do I know the"
	line "password?"

	para "Maybe."

	para "But no weakling's"
	line "going to get it!"
	done

GruntF5BeatenText:
	text "All right. Stop."
	line "I'll tell you."
	done

UnknownText_0x6e611:
	text "The password to"
	line "the boss's room is"

	para "SLOWPOKETAIL."

	para "But it's useless"
	line "unless you have"
	cont "two passwords."
	done

GruntM28SeenText:
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

GruntM28BeatenText:
	text "Hyuck-hyuck-hyuck!"
	line "You're good!"
	done

UnknownText_0x6e737:
	text "Hyuck-hyuck-hyuck!"

	para "The password to"
	line "the boss's room…"

	para "Uh…, I think it is"
	line "RATICATE TAIL."
	done

ScientistRossSeenText:
	text "I used to work for"
	line "SILPH, but now I"

	para "run research for"
	line "TEAM ROCKET."

	para "A meddlesome child"
	line "like you needs to"
	cont "be punished."
	done

ScientistRossBeatenText:
	text "A mere tactical"
	line "error cost me…"
	done

UnknownText_0x6e822:
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

ScientistMitchSeenText:
	text "I don't care that"
	line "#MON are hurt"
	cont "by our experiment."
	done

ScientistMitchBeatenText:
	text "Thinking is my"
	line "strong suit, not"
	cont "battling."
	done

UnknownText_0x6e90a:
	text "If we turn up the"
	line "power of our radio"

	para "signal for broad-"
	line "cast nationwide…"

	para "The very thought"
	line "excites me!"
	done

UnknownText_0x6e970:
	text "The door's closed…"

	para "It needs two"
	line "passwords to open."
	done

UnknownText_0x6e9a3:
	text "The door's closed…"

	para "<PLAYER> entered"
	line "the two passwords."

	para "The door opened!"
	done

TeamRocketBaseB3F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $2, $3, 2, GROUP_TEAM_ROCKET_BASE_B2F, MAP_TEAM_ROCKET_BASE_B2F
	warp_def $2, $1b, 3, GROUP_TEAM_ROCKET_BASE_B2F, MAP_TEAM_ROCKET_BASE_B2F
	warp_def $6, $3, 4, GROUP_TEAM_ROCKET_BASE_B2F, MAP_TEAM_ROCKET_BASE_B2F
	warp_def $e, $1b, 5, GROUP_TEAM_ROCKET_BASE_B2F, MAP_TEAM_ROCKET_BASE_B2F

.XYTriggers:
	db 3
	xy_trigger 2, $8, $a, $0, UnknownScript_0x6e04b, $0, $0
	xy_trigger 2, $8, $b, $0, UnknownScript_0x6e052, $0, $0
	xy_trigger 1, $a, $8, $0, UnknownScript_0x6e019, $0, $0

.Signposts:
	db 10
	signpost 9, 10, SIGNPOST_IFNOTSET, BossDoor
	signpost 9, 11, SIGNPOST_IFNOTSET, BossDoor
	signpost 1, 10, SIGNPOST_READ, MapTeamRocketBaseB3FSignpost9Script
	signpost 1, 11, SIGNPOST_READ, MapTeamRocketBaseB3FSignpost9Script
	signpost 1, 12, SIGNPOST_READ, MapTeamRocketBaseB3FSignpost9Script
	signpost 1, 13, SIGNPOST_READ, MapTeamRocketBaseB3FSignpost9Script
	signpost 13, 4, SIGNPOST_READ, MapTeamRocketBaseB3FSignpost9Script
	signpost 13, 5, SIGNPOST_READ, MapTeamRocketBaseB3FSignpost9Script
	signpost 13, 6, SIGNPOST_READ, MapTeamRocketBaseB3FSignpost9Script
	signpost 13, 7, SIGNPOST_READ, MapTeamRocketBaseB3FSignpost9Script

.PersonEvents:
	db 14
	person_event SPRITE_LANCE, 18, 29, OW_UP | $2, $0, -1, -1, $0, 0, LanceScript_0x6dffc, EVENT_TEAM_ROCKET_BASE_B3F_LANCE_PASSWORDS
	person_event SPRITE_ROCKET, 7, 12, OW_UP | $3, $0, -1, -1, $0, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B3F_EXECUTIVE
	person_event SPRITE_MOLTRES, 6, 11, OW_UP | $12, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, MoltresScript_0x6e091, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_ROCKET_GIRL, 11, 25, OW_UP | $3, $0, -1, -1, (PAL_OW_RED << 4) | $82, 0, TrainerGruntF5, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_ROCKET, 18, 9, OW_LEFT | $2, $0, -1, -1, $2, 3, TrainerGruntM28, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_SCIENTIST, 15, 27, OW_UP | $3, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 0, TrainerScientistRoss, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_SCIENTIST, 19, 15, OW_LEFT | $1, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 3, TrainerScientistMitch, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_ROCKET, 18, 28, OW_UP | $2, $0, -1, -1, $0, 0, RocketScript_0x6e048, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_SILVER, 9, 8, OW_UP | $2, $0, -1, -1, $0, 0, ObjectEvent, EVENT_RIVAL_TEAM_ROCKET_BASE
	person_event SPRITE_POKE_BALL, 16, 5, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x6e120, EVENT_TEAM_ROCKET_BASE_B3F_PROTEIN
	person_event SPRITE_POKE_BALL, 16, 7, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x6e122, EVENT_TEAM_ROCKET_BASE_B3F_X_SPECIAL
	person_event SPRITE_POKE_BALL, 13, 32, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x6e124, EVENT_TEAM_ROCKET_BASE_B3F_FULL_HEAL
	person_event SPRITE_POKE_BALL, 6, 21, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x6e126, EVENT_TEAM_ROCKET_BASE_B3F_ICE_HEAL
	person_event SPRITE_POKE_BALL, 14, 18, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x6e128, EVENT_TEAM_ROCKET_BASE_B3F_ULTRA_BALL
