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
	checkbit1 $030d
	iffalse UnknownScript_0x1809a2
	changeblock $4, $e, $2a
UnknownScript_0x1809a2: ; 0x1809a2
	checkbit1 $030e
	iffalse UnknownScript_0x1809ac
	changeblock $4, $2, $16
UnknownScript_0x1809ac: ; 0x1809ac
	return
; 0x1809ad

UnknownScript_0x1809ad: ; 0x1809ad
	applymovement $0, MovementData_0x1809f9
	refreshscreen $86
	playsound $001b
	earthquake 80
	changeblock $4, $e, $2a
	reloadmappart
	loadmovesprites
	dotrigger $1
	setbit1 $030d
	waitbutton
	end
; 0x1809c5

BrunoScript_0x1809c5: ; 0x1809c5
	faceplayer
	loadfont
	checkbit1 $05ba
	iftrue UnknownScript_0x1809f3
	2writetext UnknownText_0x1809fe
	closetext
	loadmovesprites
	winlosstext UnknownText_0x180b23, $0000
	loadtrainer BRUNO, 1
	startbattle
	returnafterbattle
	setbit1 $05ba
	loadfont
	2writetext UnknownText_0x180b3c
	closetext
	loadmovesprites
	playsound $001f
	changeblock $4, $2, $16
	reloadmappart
	loadmovesprites
	setbit1 $030e
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
	db $0, "I am BRUNO of the", $4f
	db "ELITE FOUR.", $51
	db "I always train to", $4f
	db "the extreme be-", $55
	db "cause I believe in", $55
	db "our potential.", $51
	db "That is how we", $4f
	db "became strong.", $51
	db "Can you withstand", $4f
	db "our power?", $51
	db "Hm? I see no fear", $4f
	db "in you. You look", $51
	db "determined. Per-", $4f
	db "fect for battle!", $51
	db "Ready, ", $52, "?", $4f
	db "You will bow down", $51
	db "to our overwhelm-", $4f
	db "ing power!", $51
	db "Hoo hah!", $57
; 0x180b23

UnknownText_0x180b23: ; 0x180b23
	db $0, "Why? How could we", $4f
	db "lose?", $57
; 0x180b3c

UnknownText_0x180b3c: ; 0x180b3c
	db $0, "Having lost, I", $4f
	db "have no right to", $55
	db "say anything…", $51
	db "Go face your next", $4f
	db "challenge!", $57
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

