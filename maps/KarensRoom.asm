KarensRoom_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x180bbc, $0000
	dw UnknownScript_0x180bc0, $0000

.MapCallbacks:
	db 1

	; callbacks

	dbw 1, UnknownScript_0x180bc1

UnknownScript_0x180bbc:
	priorityjump UnknownScript_0x180bd6
	end

UnknownScript_0x180bc0:
	end

UnknownScript_0x180bc1:
	checkevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	iffalse UnknownScript_0x180bcb
	changeblock $4, $e, $2a
UnknownScript_0x180bcb:
	checkevent EVENT_KARENS_ROOM_EXIT_OPEN
	iffalse UnknownScript_0x180bd5
	changeblock $4, $2, $16
UnknownScript_0x180bd5:
	return

UnknownScript_0x180bd6:
	applymovement $0, MovementData_0x180c22
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock $4, $e, $2a
	reloadmappart
	loadmovesprites
	dotrigger $1
	setevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	waitbutton
	end

KarenScript_0x180bee:
	faceplayer
	loadfont
	checkevent EVENT_BEAT_ELITE_4_KAREN
	iftrue UnknownScript_0x180c1c
	writetext UnknownText_0x180c27
	closetext
	loadmovesprites
	winlosstext UnknownText_0x180cf8, $0000
	loadtrainer KAREN, 1
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_ELITE_4_KAREN
	loadfont
	writetext UnknownText_0x180d29
	closetext
	loadmovesprites
	playsound SFX_ENTER_DOOR
	changeblock $4, $2, $16
	reloadmappart
	loadmovesprites
	setevent EVENT_KARENS_ROOM_EXIT_OPEN
	waitbutton
	end

UnknownScript_0x180c1c:
	writetext UnknownText_0x180d29
	closetext
	loadmovesprites
	end

MovementData_0x180c22:
	step_up
	step_up
	step_up
	step_up
	step_end

UnknownText_0x180c27:
	text "I am KAREN of the"
	line "ELITE FOUR."

	para "You're <PLAYER>?"
	line "How amusing."

	para "I love dark-type"
	line "#MON."

	para "I find their wild,"
	line "tough image to be"

	para "so appealing. And"
	line "they're so strong."

	para "Think you can take"
	line "them? Just try to"
	cont "entertain me."

	para "Let's go."
	done

UnknownText_0x180cf8:
	text "Well, aren't you"
	line "good. I like that"
	cont "in a trainer."
	done

UnknownText_0x180d29:
	text "Strong #MON."

	para "Weak #MON."

	para "That is only the"
	line "selfish perception"
	cont "of people."

	para "Truly skilled"
	line "trainers should"

	para "try to win with"
	line "their favorites."

	para "I like your style."
	line "You understand"
	cont "what's important."

	para "Go on--the CHAM-"
	line "PION is waiting."
	done

KarensRoom_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $11, $4, 3, GROUP_BRUNOS_ROOM, MAP_BRUNOS_ROOM
	warp_def $11, $5, 4, GROUP_BRUNOS_ROOM, MAP_BRUNOS_ROOM
	warp_def $2, $4, 1, GROUP_LANCES_ROOM, MAP_LANCES_ROOM
	warp_def $2, $5, 2, GROUP_LANCES_ROOM, MAP_LANCES_ROOM

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_KAREN, 11, 9, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, KarenScript_0x180bee, -1
