BrunosRoom_MapScriptHeader: ; 0x180986
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x180993, $0000
	dw UnknownScript_0x180997, $0000

	; callback count
	db 1

	; callbacks

	dbw 1, UnknownScript_0x180998
; 0x180993

UnknownScript_0x180993: ; 0x180993
	priorityjump UnknownScript_0x1809ad
	end
; 0x180997

UnknownScript_0x180997: ; 0x180997
	end
; 0x180998

UnknownScript_0x180998: ; 0x180998
	checkevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	iffalse UnknownScript_0x1809a2
	changeblock $4, $e, $2a
UnknownScript_0x1809a2: ; 0x1809a2
	checkevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	iffalse UnknownScript_0x1809ac
	changeblock $4, $2, $16
UnknownScript_0x1809ac: ; 0x1809ac
	return
; 0x1809ad

UnknownScript_0x1809ad: ; 0x1809ad
	applymovement $0, MovementData_0x1809f9
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
; 0x1809c5

BrunoScript_0x1809c5: ; 0x1809c5
	faceplayer
	loadfont
	checkevent $05ba
	iftrue UnknownScript_0x1809f3
	2writetext UnknownText_0x1809fe
	closetext
	loadmovesprites
	winlosstext UnknownText_0x180b23, $0000
	loadtrainer BRUNO, 1
	startbattle
	returnafterbattle
	setevent $05ba
	loadfont
	2writetext UnknownText_0x180b3c
	closetext
	loadmovesprites
	playsound SFX_ENTER_DOOR
	changeblock $4, $2, $16
	reloadmappart
	loadmovesprites
	setevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	waitbutton
	end
; 0x1809f3

UnknownScript_0x1809f3: ; 0x1809f3
	2writetext UnknownText_0x180b3c
	closetext
	loadmovesprites
	end
; 0x1809f9

MovementData_0x1809f9: ; 0x1809f9
	step_up
	step_up
	step_up
	step_up
	step_end
; 0x1809fe

UnknownText_0x1809fe: ; 0x1809fe
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

	para "Ready, ", $52, "?"
	line "You will bow down"

	para "to our overwhelm-"
	line "ing power!"

	para "Hoo hah!"
	done
; 0x180b23

UnknownText_0x180b23: ; 0x180b23
	text "Why? How could we"
	line "lose?"
	done
; 0x180b3c

UnknownText_0x180b3c: ; 0x180b3c
	text "Having lost, I"
	line "have no right to"
	cont "say anything…"

	para "Go face your next"
	line "challenge!"
	done
; 0x180b88

BrunosRoom_MapEventHeader: ; 0x180b88
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $11, $4, 3, GROUP_KOGAS_ROOM, MAP_KOGAS_ROOM
	warp_def $11, $5, 4, GROUP_KOGAS_ROOM, MAP_KOGAS_ROOM
	warp_def $2, $4, 1, GROUP_KARENS_ROOM, MAP_KARENS_ROOM
	warp_def $2, $5, 2, GROUP_KARENS_ROOM, MAP_KARENS_ROOM

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_BRUNO, 11, 9, $6, $0, 255, 255, $b0, 0, BrunoScript_0x1809c5, $ffff
; 0x180baf

