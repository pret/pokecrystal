KogasRoom_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x180728, $0000
	dw UnknownScript_0x18072c, $0000

.MapCallbacks:
	db 1

	; callbacks

	dbw 1, UnknownScript_0x18072d

UnknownScript_0x180728:
	priorityjump UnknownScript_0x180742
	end

UnknownScript_0x18072c:
	end

UnknownScript_0x18072d:
	checkevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	iffalse UnknownScript_0x180737
	changeblock $4, $e, $2a
UnknownScript_0x180737:
	checkevent EVENT_KOGAS_ROOM_EXIT_OPEN
	iffalse UnknownScript_0x180741
	changeblock $4, $2, $16
UnknownScript_0x180741:
	return

UnknownScript_0x180742:
	applymovement $0, MovementData_0x18078e
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock $4, $e, $2a
	reloadmappart
	loadmovesprites
	dotrigger $1
	setevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	waitbutton
	end

KogaScript_0x18075a:
	faceplayer
	loadfont
	checkevent EVENT_BEAT_ELITE_4_KOGA
	iftrue UnknownScript_0x180788
	writetext UnknownText_0x180793
	closetext
	loadmovesprites
	winlosstext UnknownText_0x1808a9, $0000
	loadtrainer KOGA, 1
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_ELITE_4_KOGA
	loadfont
	writetext UnknownText_0x1808ca
	closetext
	loadmovesprites
	playsound SFX_ENTER_DOOR
	changeblock $4, $2, $16
	reloadmappart
	loadmovesprites
	setevent EVENT_KOGAS_ROOM_EXIT_OPEN
	waitbutton
	end

UnknownScript_0x180788:
	writetext UnknownText_0x1808ca
	closetext
	loadmovesprites
	end

MovementData_0x18078e:
	step_up
	step_up
	step_up
	step_up
	step_end

UnknownText_0x180793:
	text "Fwahahahaha!"

	para "I am KOGA of the"
	line "ELITE FOUR."

	para "I live in shadows,"
	line "a ninja!"

	para "My intricate style"
	line "will confound and"
	cont "destroy you!"

	para "Confusion, sleep,"
	line "poison…"

	para "Prepare to be the"
	line "victim of my sin-"
	cont "ister technique!"

	para "Fwahahahaha!"

	para "#MON is not"
	line "merely about brute"

	para "force--you shall"
	line "see soon enough!"
	done

UnknownText_0x1808a9:
	text "Ah!"
	line "You have proven"
	cont "your worth!"
	done

UnknownText_0x1808ca:
	text "I subjected you to"
	line "everything I could"
	cont "muster."

	para "But my efforts"
	line "failed. I must"
	cont "hone my skills."

	para "Go on to the next"
	line "room, and put your"
	cont "abilities to test!"
	done

KogasRoom_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $11, $4, 2, GROUP_WILLS_ROOM, MAP_WILLS_ROOM
	warp_def $11, $5, 3, GROUP_WILLS_ROOM, MAP_WILLS_ROOM
	warp_def $2, $4, 1, GROUP_BRUNOS_ROOM, MAP_BRUNOS_ROOM
	warp_def $2, $5, 2, GROUP_BRUNOS_ROOM, MAP_BRUNOS_ROOM

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_KOGA, 11, 9, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, KogaScript_0x18075a, -1
