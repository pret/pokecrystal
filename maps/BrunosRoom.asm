BrunosRoom_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x180993, $0000
	dw UnknownScript_0x180997, $0000

.MapCallbacks:
	db 1

	; callbacks

	dbw 1, UnknownScript_0x180998

UnknownScript_0x180993:
	priorityjump UnknownScript_0x1809ad
	end

UnknownScript_0x180997:
	end

UnknownScript_0x180998:
	checkevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	iffalse UnknownScript_0x1809a2
	changeblock $4, $e, $2a
UnknownScript_0x1809a2:
	checkevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	iffalse UnknownScript_0x1809ac
	changeblock $4, $2, $16
UnknownScript_0x1809ac:
	return

UnknownScript_0x1809ad:
	applymovement $0, MovementData_0x1809f9
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock $4, $e, $2a
	reloadmappart
	loadmovesprites
	dotrigger $1
	setevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	waitbutton
	end

BrunoScript_0x1809c5:
	faceplayer
	loadfont
	checkevent EVENT_BEAT_ELITE_4_BRUNO
	iftrue UnknownScript_0x1809f3
	writetext UnknownText_0x1809fe
	closetext
	loadmovesprites
	winlosstext UnknownText_0x180b23, $0000
	loadtrainer BRUNO, 1
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_ELITE_4_BRUNO
	loadfont
	writetext UnknownText_0x180b3c
	closetext
	loadmovesprites
	playsound SFX_ENTER_DOOR
	changeblock $4, $2, $16
	reloadmappart
	loadmovesprites
	setevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	waitbutton
	end

UnknownScript_0x1809f3:
	writetext UnknownText_0x180b3c
	closetext
	loadmovesprites
	end

MovementData_0x1809f9:
	step_up
	step_up
	step_up
	step_up
	step_end

UnknownText_0x1809fe:
	text "I am BRUNO of the"
	line "ELITE FOUR."

	para "I always train to"
	line "the extreme be-"
	cont "cause I believe in"
	cont "our potential."

	para "That is how we"
	line "became strong."

	para "Can you withstand"
	line "our power?"

	para "Hm? I see no fear"
	line "in you. You look"

	para "determined. Per-"
	line "fect for battle!"

	para "Ready, <PLAYER>?"
	line "You will bow down"

	para "to our overwhelm-"
	line "ing power!"

	para "Hoo hah!"
	done

UnknownText_0x180b23:
	text "Why? How could we"
	line "lose?"
	done

UnknownText_0x180b3c:
	text "Having lost, I"
	line "have no right to"
	cont "say anything…"

	para "Go face your next"
	line "challenge!"
	done

BrunosRoom_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $11, $4, 3, GROUP_KOGAS_ROOM, MAP_KOGAS_ROOM
	warp_def $11, $5, 4, GROUP_KOGAS_ROOM, MAP_KOGAS_ROOM
	warp_def $2, $4, 1, GROUP_KARENS_ROOM, MAP_KARENS_ROOM
	warp_def $2, $5, 2, GROUP_KARENS_ROOM, MAP_KARENS_ROOM

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_BRUNO, 11, 9, OW_UP | $2, $0, -1, -1, (PAL_OW_BROWN << 4) | $80, 0, BrunoScript_0x1809c5, -1
