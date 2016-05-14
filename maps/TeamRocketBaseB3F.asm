const_value set 2
	const TEAMROCKETBASEB3F_LANCE
	const TEAMROCKETBASEB3F_ROCKET1
	const TEAMROCKETBASEB3F_MOLTRES
	const TEAMROCKETBASEB3F_ROCKET_GIRL
	const TEAMROCKETBASEB3F_ROCKET2
	const TEAMROCKETBASEB3F_SCIENTIST1
	const TEAMROCKETBASEB3F_SCIENTIST2
	const TEAMROCKETBASEB3F_ROCKET3
	const TEAMROCKETBASEB3F_SILVER
	const TEAMROCKETBASEB3F_POKE_BALL1
	const TEAMROCKETBASEB3F_POKE_BALL2
	const TEAMROCKETBASEB3F_POKE_BALL3
	const TEAMROCKETBASEB3F_POKE_BALL4
	const TEAMROCKETBASEB3F_POKE_BALL5

TeamRocketBaseB3F_MapScriptHeader:
.MapTriggers:
	db 4

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1
	maptrigger .Trigger2
	maptrigger .Trigger3

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_TILES, .CheckGiovanniDoor

.Trigger0:
	priorityjump LanceGetPasswordScript
	end

.Trigger1:
	end

.Trigger2:
	end

.Trigger3:
	end

.CheckGiovanniDoor:
	checkevent EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	iftrue .OpenSesame
	return

.OpenSesame:
	changeblock $a, $8, $7
	return

LanceGetPasswordScript:
	spriteface PLAYER, LEFT
	pause 5
	spriteface TEAMROCKETBASEB3F_MOLTRES, RIGHT
	pause 20
	applymovement TEAMROCKETBASEB3F_LANCE, MovementData_0x6e12a
	opentext
	writetext LanceGetPasswordText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB3F_LANCE, MovementData_0x6e12c
	disappear TEAMROCKETBASEB3F_LANCE
	dotrigger $1
	end

RocketBaseRival:
	spriteface PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	appear TEAMROCKETBASEB3F_SILVER
	applymovement TEAMROCKETBASEB3F_SILVER, RocketBaseRivalEnterMovement
	spriteface PLAYER, LEFT
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext RocketBaseRivalText
	waitbutton
	closetext
	playsound SFX_TACKLE
	applymovement PLAYER, RocketBaseRivalShovesPlayerMovement
	applymovement TEAMROCKETBASEB3F_SILVER, RocketBaseRivalLeaveMovement
	disappear TEAMROCKETBASEB3F_SILVER
	dotrigger $2
	special RestartMapMusic
	end

RocketScript_0x6e048:
	jumptextfaceplayer UnknownText_0x6e235

UnknownScript_0x6e04b:
	applymovement PLAYER, MovementData_0x6e133
	jump UnknownScript_0x6e056

UnknownScript_0x6e052:
	applymovement PLAYER, MovementData_0x6e13a
UnknownScript_0x6e056:
	pause 30
	showemote EMOTE_SHOCK, TEAMROCKETBASEB3F_ROCKET1, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	spriteface TEAMROCKETBASEB3F_ROCKET1, DOWN
	opentext
	writetext UnknownText_0x6e400
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB3F_ROCKET1, MovementData_0x6e142
	winlosstext UnknownText_0x6e511, 0
	setlasttalked TEAMROCKETBASEB3F_ROCKET1
	loadtrainer EXECUTIVEM, 4
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_4
	opentext
	writetext UnknownText_0x6e548
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB3F_ROCKET1, MovementData_0x6e144
	playsound SFX_TACKLE
	applymovement TEAMROCKETBASEB3F_ROCKET1, MovementData_0x6e147
	disappear TEAMROCKETBASEB3F_ROCKET1
	dotrigger $3
	end

RocketBaseMurkrow:
	opentext
	writetext RocketBaseMurkrowText
	waitbutton
	closetext
	setevent EVENT_LEARNED_HAIL_GIOVANNI
	end

SlowpokeTailGrunt:
	trainer EVENT_BEAT_ROCKET_GRUNTF_5, GRUNTF, 5, GruntF5SeenText, GruntF5BeatenText, 0, GruntF5Script

GruntF5Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x6e611
	waitbutton
	closetext
	setevent EVENT_LEARNED_SLOWPOKETAIL
	end

RaticateTailGrunt:
	trainer EVENT_BEAT_ROCKET_GRUNTM_28, GRUNTM, 28, GruntM28SeenText, GruntM28BeatenText, 0, GruntM28Script

GruntM28Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x6e737
	waitbutton
	closetext
	setevent EVENT_LEARNED_RATICATE_TAIL
	end

TrainerScientistRoss:
	trainer EVENT_BEAT_SCIENTIST_ROSS, SCIENTIST, ROSS, ScientistRossSeenText, ScientistRossBeatenText, 0, ScientistRossScript

ScientistRossScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x6e822
	waitbutton
	closetext
	end

TrainerScientistMitch:
	trainer EVENT_BEAT_SCIENTIST_MITCH, SCIENTIST, MITCH, ScientistMitchSeenText, ScientistMitchBeatenText, 0, ScientistMitchScript

ScientistMitchScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x6e90a
	waitbutton
	closetext
	end

BossDoor:
	dw EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	dw .Script

.Script:
	opentext
	checkevent EVENT_LEARNED_SLOWPOKETAIL
	iffalse .NeedsPassword
	checkevent EVENT_LEARNED_RATICATE_TAIL
	iffalse .NeedsPassword
	jump .OpenSesame

.NeedsPassword:
	writetext UnknownText_0x6e970
	waitbutton
	closetext
	end

.OpenSesame:
	writetext UnknownText_0x6e9a3
	waitbutton
	playsound SFX_ENTER_DOOR
	changeblock $a, $8, $7
	reloadmappart
	closetext
	setevent EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	waitsfx
	end

MapTeamRocketBaseB3FSignpost9Script:
	jumpstd teamrocketoath

TeamRocketBaseB3FProtein:
	itemball PROTEIN

TeamRocketBaseB3FXSpecial:
	itemball X_SPECIAL

TeamRocketBaseB3FFullHeal:
	itemball FULL_HEAL

TeamRocketBaseB3FIceHeal:
	itemball ICE_HEAL

TeamRocketBaseB3FUltraBall:
	itemball ULTRA_BALL

MovementData_0x6e12a:
	step RIGHT
	step_end

MovementData_0x6e12c:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementData_0x6e133:
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	turn_head UP
	step_end

MovementData_0x6e13a:
	step UP
	step UP
	step LEFT
	step UP
	step LEFT
	step LEFT
	turn_head UP
	step_end

MovementData_0x6e142:
	step DOWN
	step_end

MovementData_0x6e144:
	big_step RIGHT
	big_step RIGHT
	step_end

MovementData_0x6e147:
	fix_facing
	fast_jump_step LEFT
	remove_fixed_facing
	step_sleep 8
	step_sleep 8
	slow_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	step_end

RocketBaseRivalEnterMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

RocketBaseRivalLeaveMovement:
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

RocketBaseRivalShovesPlayerMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

LanceGetPasswordText:
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

RocketBaseRivalText:
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

RocketBaseMurkrowText:
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
	warp_def $2, $3, 2, TEAM_ROCKET_BASE_B2F
	warp_def $2, $1b, 3, TEAM_ROCKET_BASE_B2F
	warp_def $6, $3, 4, TEAM_ROCKET_BASE_B2F
	warp_def $e, $1b, 5, TEAM_ROCKET_BASE_B2F

.XYTriggers:
	db 3
	xy_trigger 2, $8, $a, $0, UnknownScript_0x6e04b, $0, $0
	xy_trigger 2, $8, $b, $0, UnknownScript_0x6e052, $0, $0
	xy_trigger 1, $a, $8, $0, RocketBaseRival, $0, $0

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
	person_event SPRITE_LANCE, 14, 25, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, LanceGetPasswordScript, EVENT_TEAM_ROCKET_BASE_B3F_LANCE_PASSWORDS
	person_event SPRITE_ROCKET, 3, 8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B3F_EXECUTIVE
	person_event SPRITE_MOLTRES, 2, 7, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, RocketBaseMurkrow, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_ROCKET_GIRL, 7, 21, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 0, SlowpokeTailGrunt, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_ROCKET, 14, 5, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 3, RaticateTailGrunt, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_SCIENTIST, 11, 23, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 0, TrainerScientistRoss, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_SCIENTIST, 15, 11, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerScientistMitch, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_ROCKET, 14, 24, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, RocketScript_0x6e048, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_SILVER, 5, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_TEAM_ROCKET_BASE
	person_event SPRITE_POKE_BALL, 12, 1, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TeamRocketBaseB3FProtein, EVENT_TEAM_ROCKET_BASE_B3F_PROTEIN
	person_event SPRITE_POKE_BALL, 12, 3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TeamRocketBaseB3FXSpecial, EVENT_TEAM_ROCKET_BASE_B3F_X_SPECIAL
	person_event SPRITE_POKE_BALL, 9, 28, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TeamRocketBaseB3FFullHeal, EVENT_TEAM_ROCKET_BASE_B3F_FULL_HEAL
	person_event SPRITE_POKE_BALL, 2, 17, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TeamRocketBaseB3FIceHeal, EVENT_TEAM_ROCKET_BASE_B3F_ICE_HEAL
	person_event SPRITE_POKE_BALL, 10, 14, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TeamRocketBaseB3FUltraBall, EVENT_TEAM_ROCKET_BASE_B3F_ULTRA_BALL
