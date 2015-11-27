const_value set 2
	const NEWBARKTOWN_TEACHER
	const NEWBARKTOWN_FISHER
	const NEWBARKTOWN_SILVER

NewBarkTown_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw .Trigger1, 0
	dw .Trigger2, 0

.MapCallbacks:
	db 1

	; callbacks
	dbw 5, .FlyPoint

.Trigger1
	end

.Trigger2
	end

.FlyPoint
	setflag ENGINE_FLYPOINT_NEW_BARK
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	return

UnknownScript_0x1a8016:
	playmusic MUSIC_MOM
	spriteface NEWBARKTOWN_TEACHER, LEFT
	loadfont
	writetext UnknownText_0x1a8134
	waitbutton
	closetext
	spriteface PLAYER, RIGHT
	applymovement NEWBARKTOWN_TEACHER, MovementData_0x1a80d4
	loadfont
	writetext UnknownText_0x1a813e
	waitbutton
	closetext
	follow NEWBARKTOWN_TEACHER, PLAYER
	applymovement NEWBARKTOWN_TEACHER, MovementData_0x1a80e0
	stopfollow
	loadfont
	writetext UnknownText_0x1a815e
	waitbutton
	closetext
	special RestartMapMusic
	end

UnknownScript_0x1a8041:
	playmusic MUSIC_MOM
	spriteface NEWBARKTOWN_TEACHER, LEFT
	loadfont
	writetext UnknownText_0x1a8134
	waitbutton
	closetext
	spriteface PLAYER, RIGHT
	applymovement NEWBARKTOWN_TEACHER, MovementData_0x1a80d9
	spriteface PLAYER, UP
	loadfont
	writetext UnknownText_0x1a813e
	waitbutton
	closetext
	follow NEWBARKTOWN_TEACHER, PLAYER
	applymovement NEWBARKTOWN_TEACHER, MovementData_0x1a80e6
	stopfollow
	loadfont
	writetext UnknownText_0x1a815e
	waitbutton
	closetext
	special RestartMapMusic
	end

TeacherScript_0x1a806f:
	faceplayer
	loadfont
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue UnknownScript_0x1a8095
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue UnknownScript_0x1a808f
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue UnknownScript_0x1a8089
	writetext UnknownText_0x1a80f7
	waitbutton
	closetext
	end

UnknownScript_0x1a8089:
	writetext UnknownText_0x1a81c4
	waitbutton
	closetext
	end

UnknownScript_0x1a808f:
	writetext UnknownText_0x1a81f2
	waitbutton
	closetext
	end

UnknownScript_0x1a8095:
	writetext UnknownText_0x1a8236
	waitbutton
	closetext
	end

FisherScript_0x1a809b:
	jumptextfaceplayer UnknownText_0x1a8274

SilverScript_0x1a809e:
	loadfont
	writetext UnknownText_0x1a82a6
	waitbutton
	closetext
	spriteface NEWBARKTOWN_SILVER, LEFT
	loadfont
	writetext UnknownText_0x1a82cd
	waitbutton
	closetext
	follow PLAYER, NEWBARKTOWN_SILVER
	applymovement PLAYER, MovementData_0x1a80ed
	stopfollow
	pause 5
	spriteface NEWBARKTOWN_SILVER, DOWN
	pause 5
	playsound SFX_TACKLE
	applymovement PLAYER, MovementData_0x1a80f0
	applymovement NEWBARKTOWN_SILVER, MovementData_0x1a80f5
	end

MapNewBarkTownSignpost0Script:
	jumptext UnknownText_0x1a82e8

MapNewBarkTownSignpost1Script:
	jumptext UnknownText_0x1a8328

MapNewBarkTownSignpost2Script:
	jumptext UnknownText_0x1a8332

MapNewBarkTownSignpost3Script:
	jumptext UnknownText_0x1a8340

MovementData_0x1a80d4:
	step_left
	step_left
	step_left
	step_left
	step_end

MovementData_0x1a80d9:
	step_left
	step_left
	step_left
	step_left
	step_left
	turn_head_down
	step_end

MovementData_0x1a80e0:
	step_right
	step_right
	step_right
	step_right
	turn_head_left
	step_end

MovementData_0x1a80e6:
	step_right
	step_right
	step_right
	step_right
	step_right
	turn_head_left
	step_end

MovementData_0x1a80ed:
	turn_head_up
	step_down
	step_end

MovementData_0x1a80f0:
	turn_head_up
	fix_facing
	jump_step_down
	remove_fixed_facing
	step_end

MovementData_0x1a80f5:
	step_right
	step_end

UnknownText_0x1a80f7:
	text "Wow, your #GEAR"
	line "is impressive!"

	para "Did your mom get"
	line "it for you?"
	done

UnknownText_0x1a8134:
	text "Wait, <PLAY_G>!"
	done

UnknownText_0x1a813e:
	text "What do you think"
	line "you're doing?"
	done

UnknownText_0x1a815e:
	text "It's dangerous to"
	line "go out without a"
	cont "#MON!"

	para "Wild #MON"
	line "jump out of the"

	para "grass on the way"
	line "to the next town."
	done

UnknownText_0x1a81c4:
	text "Oh! Your #MON"
	line "is adorable!"
	cont "I wish I had one!"
	done

UnknownText_0x1a81f2:
	text "Hi, <PLAY_G>!"
	line "Leaving again?"

	para "You should tell"
	line "your mom if you"
	cont "are leaving."
	done

UnknownText_0x1a8236:
	text "Call your mom on"
	line "your #GEAR to"

	para "let her know how"
	line "you're doing."
	done

UnknownText_0x1a8274:
	text "Yo, <PLAYER>!"

	para "I hear PROF.ELM"
	line "discovered some"
	cont "new #MON."
	done

UnknownText_0x1a82a6:
	text $56

	para "So this is the"
	line "famous ELM #MON"
	cont "LAB…"
	done

UnknownText_0x1a82cd:
	text "…What are you"
	line "staring at?"
	done

UnknownText_0x1a82e8:
	text "NEW BARK TOWN"

	para "The Town Where the"
	line "Winds of a New"
	cont "Beginning Blow"
	done

UnknownText_0x1a8328:
	text "<PLAYER>'s House"
	done

UnknownText_0x1a8332:
	text "ELM #MON LAB"
	done

UnknownText_0x1a8340:
	text "ELM'S HOUSE"
	done

NewBarkTown_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $3, $6, 1, ELMS_LAB
	warp_def $5, $d, 1, KRISS_HOUSE_1F
	warp_def $b, $3, 1, KRISS_NEIGHBORS_HOUSE
	warp_def $d, $b, 1, ELMS_HOUSE

.XYTriggers:
	db 2
	xy_trigger 0, $8, $1, $0, UnknownScript_0x1a8016, $0, $0
	xy_trigger 0, $9, $1, $0, UnknownScript_0x1a8041, $0, $0

.Signposts:
	db 4
	signpost 8, 8, SIGNPOST_READ, MapNewBarkTownSignpost0Script
	signpost 5, 11, SIGNPOST_READ, MapNewBarkTownSignpost1Script
	signpost 3, 3, SIGNPOST_READ, MapNewBarkTownSignpost2Script
	signpost 13, 9, SIGNPOST_READ, MapNewBarkTownSignpost3Script

.PersonEvents:
	db 3
	person_event SPRITE_TEACHER, 8, 6, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TeacherScript_0x1a806f, -1
	person_event SPRITE_FISHER, 9, 12, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FisherScript_0x1a809b, -1
	person_event SPRITE_SILVER, 2, 3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SilverScript_0x1a809e, EVENT_RIVAL_NEW_BARK_TOWN
