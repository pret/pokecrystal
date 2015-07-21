LancesRoom_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x180e39, $0000
	dw UnknownScript_0x180e3d, $0000

.MapCallbacks:
	db 1

	; callbacks

	dbw 1, UnknownScript_0x180e3e

UnknownScript_0x180e39:
	priorityjump UnknownScript_0x180e53
	end

UnknownScript_0x180e3d:
	end

UnknownScript_0x180e3e:
	checkevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	iffalse UnknownScript_0x180e48
	changeblock $4, $16, $34
UnknownScript_0x180e48:
	checkevent EVENT_LANCES_ROOM_EXIT_OPEN
	iffalse UnknownScript_0x180e52
	changeblock $4, $0, $b
UnknownScript_0x180e52:
	return

UnknownScript_0x180e53:
	applymovement $0, MovementData_0x180f33
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock $4, $16, $34
	reloadmappart
	loadmovesprites
	dotrigger $1
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	end

UnknownScript_0x180e6a:
	special Functionc48f
	applymovement $0, MovementData_0x180f38
	jump LanceScript_0x180e7b

UnknownScript_0x180e74:
	special Functionc48f
	applymovement $0, MovementData_0x180f3c
LanceScript_0x180e7b:
	spriteface $2, LEFT
	loadfont
	writetext UnknownText_0x180f67
	closetext
	loadmovesprites
	winlosstext UnknownText_0x1810a4, $0000
	setlasttalked $2
	loadtrainer CHAMPION, LANCE
	startbattle
	reloadmapmusic
	returnafterbattle
	setevent EVENT_BEAT_CHAMPION_LANCE
	loadfont
	writetext UnknownText_0x181132
	closetext
	loadmovesprites
	playsound SFX_ENTER_DOOR
	changeblock $4, $0, $b
	reloadmappart
	loadmovesprites
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	musicfadeout MUSIC_BEAUTY_ENCOUNTER, $10
	pause 30
	showemote EMOTE_SHOCK, $2, 15
	spriteface $2, DOWN
	pause 10
	spriteface $0, DOWN
	appear $3
	applymovement $3, MovementData_0x180f41
	loadfont
	writetext UnknownText_0x1811dd
	closetext
	loadmovesprites
	appear $4
	applymovement $4, MovementData_0x180f46
	follow $3, $4
	applymovement $3, MovementData_0x180f49
	stopfollow
	spriteface $4, UP
	spriteface $2, LEFT
	loadfont
	writetext UnknownText_0x18121b
	closetext
	loadmovesprites
	applymovement $3, MovementData_0x180f4c
	spriteface $0, LEFT
	loadfont
	writetext UnknownText_0x18134b
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x180f4f
	spriteface $0, UP
	loadfont
	writetext UnknownText_0x18137b
	closetext
	loadmovesprites
	follow $2, $0
	spriteface $3, UP
	spriteface $4, UP
	applymovement $2, MovementData_0x180f53
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear $2
	applymovement $0, MovementData_0x180f55
	playsound SFX_EXIT_BUILDING
	disappear $0
	applymovement $3, MovementData_0x180f57
	showemote EMOTE_SHOCK, $3, 15
	loadfont
	writetext UnknownText_0x1813c5
	pause 30
	loadmovesprites
	applymovement $3, MovementData_0x180f5b
	special FadeBlackBGMap
	pause 15
	warpfacing $1, GROUP_HALL_OF_FAME, MAP_HALL_OF_FAME, $4, $d
	end

MovementData_0x180f33:
	step_up
	step_up
	step_up
	step_up
	step_end

MovementData_0x180f38:
	step_up
	step_up
	turn_head_right
	step_end

MovementData_0x180f3c:
	step_up
	step_left
	step_up
	turn_head_right
	step_end

MovementData_0x180f41:
	big_step_up
	big_step_up
	big_step_up
	turn_head_down
	step_end

MovementData_0x180f46:
	step_up
	step_up
	step_end

MovementData_0x180f49:
	step_left
	turn_head_right
	step_end

MovementData_0x180f4c:
	big_step_up
	turn_head_right
	step_end

MovementData_0x180f4f:
	step_up
	step_left
	turn_head_down
	step_end

MovementData_0x180f53:
	step_up
	step_end

MovementData_0x180f55:
	step_up
	step_end

MovementData_0x180f57:
	step_up
	step_right
	turn_head_up
	step_end

MovementData_0x180f5b:
	big_step_right
	big_step_right
	big_step_left
	big_step_left
	big_step_left
	big_step_right
	big_step_right
	big_step_right
	big_step_left
	big_step_left
	turn_head_up
	step_end

UnknownText_0x180f67:
	text "LANCE: I've been"
	line "waiting for you."

	para "<PLAY_G>!"

	para "I knew that you,"
	line "with your skills,"

	para "would eventually"
	line "reach me here."

	para "There's no need"
	line "for words now."

	para "We will battle to"
	line "determine who is"

	para "the stronger of"
	line "the two of us."

	para "As the most power-"
	line "ful trainer and as"

	para "the #MON LEAGUE"
	line "CHAMPION…"

	para "I, LANCE the drag-"
	line "on master, accept"
	cont "your challenge!"
	done

UnknownText_0x1810a4:
	text "…It's over."

	para "But it's an odd"
	line "feeling."

	para "I'm not angry that"
	line "I lost. In fact, I"
	cont "feel happy."

	para "Happy that I"
	line "witnessed the rise"

	para "of a great new"
	line "CHAMPION!"
	done

UnknownText_0x181132:
	text "…Whew."

	para "You have become"
	line "truly powerful,"
	cont "<PLAY_G>."

	para "Your #MON have"
	line "responded to your"

	para "strong and up-"
	line "standing nature."

	para "As a trainer, you"
	line "will continue to"

	para "grow strong with"
	line "your #MON."
	done

UnknownText_0x1811dd:
	text "MARY: Oh, no!"
	line "It's all over!"

	para "PROF.OAK, if you"
	line "weren't so slow…"
	done

UnknownText_0x18121b:
	text "PROF.OAK: Ah,"
	line "<PLAY_G>!"

	para "It's been a long"
	line "while."

	para "You certainly look"
	line "more impressive."

	para "Your conquest of"
	line "the LEAGUE is just"
	cont "fantastic!"

	para "Your dedication,"
	line "trust and love for"

	para "your #MON made"
	line "this happen."

	para "Your #MON were"
	line "outstanding too."

	para "Because they be-"
	line "lieved in you as a"

	para "trainer, they per-"
	line "severed."

	para "Congratulations,"
	line "<PLAY_G>!"
	done

UnknownText_0x18134b:
	text "MARY: Let's inter-"
	line "view the brand new"
	cont "CHAMPION!"
	done

UnknownText_0x18137b:
	text "LANCE: This is"
	line "getting to be a"
	cont "bit too noisy…"

	para "<PLAY_G>, could you"
	line "come with me?"
	done

UnknownText_0x1813c5:
	text "MARY: Oh, wait!"
	line "We haven't done"
	cont "the interview!"
	done

LancesRoom_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $17, $4, 3, GROUP_KARENS_ROOM, MAP_KARENS_ROOM
	warp_def $17, $5, 4, GROUP_KARENS_ROOM, MAP_KARENS_ROOM
	warp_def $1, $4, 1, GROUP_HALL_OF_FAME, MAP_HALL_OF_FAME
	warp_def $1, $5, 2, GROUP_HALL_OF_FAME, MAP_HALL_OF_FAME

.XYTriggers:
	db 2
	xy_trigger 1, $5, $4, $0, UnknownScript_0x180e6a, $0, $0
	xy_trigger 1, $5, $5, $0, UnknownScript_0x180e74, $0, $0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_LANCE, 7, 9, OW_UP | $2, $0, -1, -1, $0, 0, LanceScript_0x180e7b, -1
	person_event SPRITE_TEACHER, 11, 8, OW_UP | $3, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, ObjectEvent, EVENT_LANCES_ROOM_OAK_AND_MARY
	person_event SPRITE_OAK, 11, 8, OW_UP | $3, $0, -1, -1, $0, 0, ObjectEvent, EVENT_LANCES_ROOM_OAK_AND_MARY
