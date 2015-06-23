WillsRoom_MapScriptHeader: ; 0x1804b9
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x1804c6, $0000
	dw UnknownScript_0x1804ca, $0000

	; callback count
	db 1

	; callbacks

	dbw 1, UnknownScript_0x1804cb
; 0x1804c6

UnknownScript_0x1804c6: ; 0x1804c6
	priorityjump UnknownScript_0x1804e0
	end
; 0x1804ca

UnknownScript_0x1804ca: ; 0x1804ca
	end
; 0x1804cb

UnknownScript_0x1804cb: ; 0x1804cb
	checkevent $0309
	iffalse UnknownScript_0x1804d5
	changeblock $4, $e, $2a
UnknownScript_0x1804d5: ; 0x1804d5
	checkevent EVENT_WILLS_ROOM_EXIT_OPEN
	iffalse UnknownScript_0x1804df
	changeblock $4, $2, $16
UnknownScript_0x1804df: ; 0x1804df
	return
; 0x1804e0

UnknownScript_0x1804e0: ; 0x1804e0
	applymovement $0, MovementData_0x18052c
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock $4, $e, $2a
	reloadmappart
	loadmovesprites
	dotrigger $1
	setevent $0309
	waitbutton
	end
; 0x1804f8

WillScript_0x1804f8: ; 0x1804f8
	faceplayer
	loadfont
	checkevent $05b8
	iftrue UnknownScript_0x180526
	writetext UnknownText_0x180531
	closetext
	loadmovesprites
	winlosstext UnknownText_0x18062c, $0000
	loadtrainer WILL, 1
	startbattle
	returnafterbattle
	setevent $05b8
	loadfont
	writetext UnknownText_0x180644
	closetext
	loadmovesprites
	playsound SFX_ENTER_DOOR
	changeblock $4, $2, $16
	reloadmappart
	loadmovesprites
	setevent EVENT_WILLS_ROOM_EXIT_OPEN
	waitbutton
	end
; 0x180526

UnknownScript_0x180526: ; 0x180526
	writetext UnknownText_0x180644
	closetext
	loadmovesprites
	end
; 0x18052c

MovementData_0x18052c: ; 0x18052c
	step_up
	step_up
	step_up
	step_up
	step_end
; 0x180531

UnknownText_0x180531: ; 0x180531
	text "Welcome to #MON"
	line "LEAGUE, ", $52, "."

	para "Allow me to intro-"
	line "duce myself. I am"
	cont "WILL."

	para "I have trained all"
	line "around the world,"

	para "making my psychic"
	line "#MON powerful."

	para "And, at last, I've"
	line "been accepted into"
	cont "the ELITE FOUR."

	para "I can only keep"
	line "getting better!"

	para "Losing is not an"
	line "option!"
	done
; 0x18062c

UnknownText_0x18062c: ; 0x18062c
	text "I… I can't…"
	line "believe it…"
	done
; 0x180644

UnknownText_0x180644: ; 0x180644
	text "Even though I was"
	line "defeated, I won't"
	cont "change my course."

	para "I will continue"
	line "battling until I"

	para "stand above all"
	line "trainers!"

	para "Now, ", $52, ", move"
	line "on and experience"

	para "the true ferocity"
	line "of the ELITE FOUR."
	done
; 0x1806f9

WillsRoom_MapEventHeader: ; 0x1806f9
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $11, $5, 4, GROUP_INDIGO_PLATEAU_POKECENTER_1F, MAP_INDIGO_PLATEAU_POKECENTER_1F
	warp_def $2, $4, 1, GROUP_KOGAS_ROOM, MAP_KOGAS_ROOM
	warp_def $2, $5, 2, GROUP_KOGAS_ROOM, MAP_KOGAS_ROOM

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_WILL, 11, 9, $6, $0, 255, 255, $80, 0, WillScript_0x1804f8, $ffff
; 0x18071b
