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
	checkbit1 $0309
	iffalse UnknownScript_0x1804d5
	changeblock $4, $e, $2a
UnknownScript_0x1804d5: ; 0x1804d5
	checkbit1 EVENT_WILLS_ROOM_EXIT_OPEN
	iffalse UnknownScript_0x1804df
	changeblock $4, $2, $16
UnknownScript_0x1804df: ; 0x1804df
	return
; 0x1804e0

UnknownScript_0x1804e0: ; 0x1804e0
	applymovement $0, MovementData_0x18052c
	refreshscreen $86
	playsound $001b
	earthquake 80
	changeblock $4, $e, $2a
	reloadmappart
	loadmovesprites
	dotrigger $1
	setbit1 $0309
	waitbutton
	end
; 0x1804f8

WillScript_0x1804f8: ; 0x1804f8
	faceplayer
	loadfont
	checkbit1 $05b8
	iftrue UnknownScript_0x180526
	2writetext UnknownText_0x180531
	closetext
	loadmovesprites
	winlosstext UnknownText_0x18062c, $0000
	loadtrainer WILL, 1
	startbattle
	returnafterbattle
	setbit1 $05b8
	loadfont
	2writetext UnknownText_0x180644
	closetext
	loadmovesprites
	playsound $001f
	changeblock $4, $2, $16
	reloadmappart
	loadmovesprites
	setbit1 EVENT_WILLS_ROOM_EXIT_OPEN
	waitbutton
	end
; 0x180526

UnknownScript_0x180526: ; 0x180526
	2writetext UnknownText_0x180644
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
	db $0, "Welcome to #MON", $4f
	db "LEAGUE, ", $52, ".", $51
	db "Allow me to intro-", $4f
	db "duce myself. I am", $55
	db "WILL.", $51
	db "I have trained all", $4f
	db "around the world,", $51
	db "making my psychic", $4f
	db "#MON powerful.", $51
	db "And, at last, I've", $4f
	db "been accepted into", $55
	db "the ELITE FOUR.", $51
	db "I can only keep", $4f
	db "getting better!", $51
	db "Losing is not an", $4f
	db "option!", $57
; 0x18062c

UnknownText_0x18062c: ; 0x18062c
	db $0, "I… I can't…", $4f
	db "believe it…", $57
; 0x180644

UnknownText_0x180644: ; 0x180644
	db $0, "Even though I was", $4f
	db "defeated, I won't", $55
	db "change my course.", $51
	db "I will continue", $4f
	db "battling until I", $51
	db "stand above all", $4f
	db "trainers!", $51
	db "Now, ", $52, ", move", $4f
	db "on and experience", $51
	db "the true ferocity", $4f
	db "of the ELITE FOUR.", $57
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

