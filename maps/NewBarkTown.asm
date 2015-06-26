NewBarkTown_MapScriptHeader:
	; trigger count
	db 2

	; triggers
	dw .Trigger1, $0000
	dw .Trigger2, $0000

	; callback count
	db 1

	; callbacks
	dbw 5, .FlyPoint

.Trigger1
	end

.Trigger2
	end

.FlyPoint
	setflag ENGINE_FLYPOINT_NEW_BARK
	clearevent $0076
	return

UnknownScript_0x1a8016:
	playmusic MUSIC_MOM
	spriteface $2, $2
	loadfont
	writetext UnknownText_0x1a8134
	closetext
	loadmovesprites
	spriteface $0, $3
	applymovement $2, MovementData_0x1a80d4
	loadfont
	writetext UnknownText_0x1a813e
	closetext
	loadmovesprites
	follow $2, $0
	applymovement $2, MovementData_0x1a80e0
	stopfollow
	loadfont
	writetext UnknownText_0x1a815e
	closetext
	loadmovesprites
	special RestartMapMusic
	end

UnknownScript_0x1a8041:
	playmusic MUSIC_MOM
	spriteface $2, $2
	loadfont
	writetext UnknownText_0x1a8134
	closetext
	loadmovesprites
	spriteface $0, $3
	applymovement $2, MovementData_0x1a80d9
	spriteface $0, $1
	loadfont
	writetext UnknownText_0x1a813e
	closetext
	loadmovesprites
	follow $2, $0
	applymovement $2, MovementData_0x1a80e6
	stopfollow
	loadfont
	writetext UnknownText_0x1a815e
	closetext
	loadmovesprites
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
	closetext
	loadmovesprites
	end

UnknownScript_0x1a8089:
	writetext UnknownText_0x1a81c4
	closetext
	loadmovesprites
	end

UnknownScript_0x1a808f:
	writetext UnknownText_0x1a81f2
	closetext
	loadmovesprites
	end

UnknownScript_0x1a8095:
	writetext UnknownText_0x1a8236
	closetext
	loadmovesprites
	end

FisherScript_0x1a809b:
	jumptextfaceplayer UnknownText_0x1a8274

SilverScript_0x1a809e:
	loadfont
	writetext UnknownText_0x1a82a6
	closetext
	loadmovesprites
	spriteface $4, $2
	loadfont
	writetext UnknownText_0x1a82cd
	closetext
	loadmovesprites
	follow $0, $4
	applymovement $0, MovementData_0x1a80ed
	stopfollow
	pause 5
	spriteface $4, $0
	pause 5
	playsound SFX_TACKLE
	applymovement $0, MovementData_0x1a80f0
	applymovement $4, MovementData_0x1a80f5
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
	text "Wait, ", $14, "!"
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
	text "Hi, ", $14, "!"
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
	text "Yo, ", $52, "!"

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
	text $52, "'s House"
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

	; warps
	db 4
	warp_def $3, $6, 1, GROUP_ELMS_LAB, MAP_ELMS_LAB
	warp_def $5, $d, 1, GROUP_KRISS_HOUSE_1F, MAP_KRISS_HOUSE_1F
	warp_def $b, $3, 1, GROUP_KRISS_NEIGHBORS_HOUSE, MAP_KRISS_NEIGHBORS_HOUSE
	warp_def $d, $b, 1, GROUP_ELMS_HOUSE, MAP_ELMS_HOUSE

	; xy triggers
	db 2
	xy_trigger 0, $8, $1, $0, UnknownScript_0x1a8016, $0, $0
	xy_trigger 0, $9, $1, $0, UnknownScript_0x1a8041, $0, $0

	; signposts
	db 4
	signpost 8, 8, $0, MapNewBarkTownSignpost0Script
	signpost 5, 11, $0, MapNewBarkTownSignpost1Script
	signpost 3, 3, $0, MapNewBarkTownSignpost2Script
	signpost 13, 9, $0, MapNewBarkTownSignpost3Script

	; people-events
	db 3
	person_event SPRITE_TEACHER, 12, 10, $3, $1, 255, 255, $0, 0, TeacherScript_0x1a806f, $ffff
	person_event SPRITE_FISHER, 13, 16, $4, $10, 255, 255, $a0, 0, FisherScript_0x1a809b, $ffff
	person_event SPRITE_SILVER, 6, 7, $9, $0, 255, 255, $0, 0, SilverScript_0x1a809e, $06bd
