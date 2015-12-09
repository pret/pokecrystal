const_value set 2
	const LANCESROOM_LANCE
	const LANCESROOM_MARY
	const LANCESROOM_OAK

LancesRoom_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x180e39, 0
	dw UnknownScript_0x180e3d, 0

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
	applymovement PLAYER, MovementData_0x180f33
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock $4, $16, $34
	reloadmappart
	closetext
	dotrigger $1
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	end

UnknownScript_0x180e6a:
	special Special_FadeOutMusic
	applymovement PLAYER, MovementData_0x180f38
	jump LanceScript_0x180e7b

UnknownScript_0x180e74:
	special Special_FadeOutMusic
	applymovement PLAYER, MovementData_0x180f3c
LanceScript_0x180e7b:
	spriteface LANCESROOM_LANCE, LEFT
	opentext
	writetext UnknownText_0x180f67
	waitbutton
	closetext
	winlosstext UnknownText_0x1810a4, 0
	setlasttalked LANCESROOM_LANCE
	loadtrainer CHAMPION, LANCE
	startbattle
	reloadmapmusic
	returnafterbattle
	setevent EVENT_BEAT_CHAMPION_LANCE
	opentext
	writetext UnknownText_0x181132
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock $4, $0, $b
	reloadmappart
	closetext
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	musicfadeout MUSIC_BEAUTY_ENCOUNTER, $10
	pause 30
	showemote EMOTE_SHOCK, LANCESROOM_LANCE, 15
	spriteface LANCESROOM_LANCE, DOWN
	pause 10
	spriteface PLAYER, DOWN
	appear LANCESROOM_MARY
	applymovement LANCESROOM_MARY, MovementData_0x180f41
	opentext
	writetext UnknownText_0x1811dd
	waitbutton
	closetext
	appear LANCESROOM_OAK
	applymovement LANCESROOM_OAK, MovementData_0x180f46
	follow LANCESROOM_MARY, LANCESROOM_OAK
	applymovement LANCESROOM_MARY, MovementData_0x180f49
	stopfollow
	spriteface LANCESROOM_OAK, UP
	spriteface LANCESROOM_LANCE, LEFT
	opentext
	writetext UnknownText_0x18121b
	waitbutton
	closetext
	applymovement LANCESROOM_MARY, MovementData_0x180f4c
	spriteface PLAYER, LEFT
	opentext
	writetext UnknownText_0x18134b
	waitbutton
	closetext
	applymovement LANCESROOM_LANCE, MovementData_0x180f4f
	spriteface PLAYER, UP
	opentext
	writetext UnknownText_0x18137b
	waitbutton
	closetext
	follow LANCESROOM_LANCE, PLAYER
	spriteface LANCESROOM_MARY, UP
	spriteface LANCESROOM_OAK, UP
	applymovement LANCESROOM_LANCE, MovementData_0x180f53
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear LANCESROOM_LANCE
	applymovement PLAYER, MovementData_0x180f55
	playsound SFX_EXIT_BUILDING
	disappear PLAYER
	applymovement LANCESROOM_MARY, MovementData_0x180f57
	showemote EMOTE_SHOCK, LANCESROOM_MARY, 15
	opentext
	writetext UnknownText_0x1813c5
	pause 30
	closetext
	applymovement LANCESROOM_MARY, MovementData_0x180f5b
	special FadeOutPalettes
	pause 15
	warpfacing UP, HALL_OF_FAME, $4, $d
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
	warp_def $17, $4, 3, KARENS_ROOM
	warp_def $17, $5, 4, KARENS_ROOM
	warp_def $1, $4, 1, HALL_OF_FAME
	warp_def $1, $5, 2, HALL_OF_FAME

.XYTriggers:
	db 2
	xy_trigger 1, $5, $4, $0, UnknownScript_0x180e6a, $0, $0
	xy_trigger 1, $5, $5, $0, UnknownScript_0x180e74, $0, $0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_LANCE, 3, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, LanceScript_0x180e7b, -1
	person_event SPRITE_TEACHER, 7, 4, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANCES_ROOM_OAK_AND_MARY
	person_event SPRITE_OAK, 7, 4, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANCES_ROOM_OAK_AND_MARY
