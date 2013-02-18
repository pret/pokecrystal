KarensRoom_MapScriptHeader: ; 0x180baf
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x180bbc, $0000
	dw UnknownScript_0x180bc0, $0000

	; callback count
	db 1

	; callbacks

	dbw 1, UnknownScript_0x180bc1
; 0x180bbc

UnknownScript_0x180bbc: ; 0x180bbc
	priorityjump UnknownScript_0x180bd6
	end
; 0x180bc0

UnknownScript_0x180bc0: ; 0x180bc0
	end
; 0x180bc1

UnknownScript_0x180bc1: ; 0x180bc1
	checkbit1 $030f
	iffalse UnknownScript_0x180bcb
	changeblock $4, $e, $2a
UnknownScript_0x180bcb: ; 0x180bcb
	checkbit1 $0310
	iffalse UnknownScript_0x180bd5
	changeblock $4, $2, $16
UnknownScript_0x180bd5: ; 0x180bd5
	return
; 0x180bd6

UnknownScript_0x180bd6: ; 0x180bd6
	applymovement $0, MovementData_0x180c22
	refreshscreen $86
	playsound $001b
	earthquake 80
	changeblock $4, $e, $2a
	reloadmappart
	loadmovesprites
	dotrigger $1
	setbit1 $030f
	waitbutton
	end
; 0x180bee

UnknownScript_0x180bee: ; 0x180bee
	faceplayer
	loadfont
	checkbit1 $05bb
	iftrue UnknownScript_0x180c1c
	2writetext UnknownText_0x180c27
	closetext
	loadmovesprites
	winlosstext UnknownText_0x180cf8, $0000
	loadtrainer KAREN, 1
	startbattle
	returnafterbattle
	setbit1 $05bb
	loadfont
	2writetext UnknownText_0x180d29
	closetext
	loadmovesprites
	playsound $001f
	changeblock $4, $2, $16
	reloadmappart
	loadmovesprites
	setbit1 $0310
	waitbutton
	end
; 0x180c1c

UnknownScript_0x180c1c: ; 0x180c1c
	2writetext UnknownText_0x180d29
	closetext
	loadmovesprites
	end
; 0x180c22

MovementData_0x180c22: ; 0x180c22
	step_up
	step_up
	step_up
	step_up
	step_end
; 0x180c27

UnknownText_0x180c27: ; 0x180c27
	db $0, "I am KAREN of the", $4f
	db "ELITE FOUR.", $51
	db "You're ", $52, "?", $4f
	db "How amusing.", $51
	db "I love dark-type", $4f
	db "#MON.", $51
	db "I find their wild,", $4f
	db "tough image to be", $51
	db "so appealing. And", $4f
	db "they're so strong.", $51
	db "Think you can take", $4f
	db "them? Just try to", $55
	db "entertain me.", $51
	db "Let's go.", $57
; 0x180cf8

UnknownText_0x180cf8: ; 0x180cf8
	db $0, "Well, aren't you", $4f
	db "good. I like that", $55
	db "in a trainer.", $57
; 0x180d29

UnknownText_0x180d29: ; 0x180d29
	db $0, "Strong #MON.", $51
	db "Weak #MON.", $51
	db "That is only the", $4f
	db "selfish perception", $55
	db "of people.", $51
	db "Truly skilled", $4f
	db "trainers should", $51
	db "try to win with", $4f
	db "their favorites.", $51
	db "I like your style.", $4f
	db "You understand", $55
	db "what's important.", $51
	db "Go on--the CHAM-", $4f
	db "PION is waiting.", $57
; 0x180e05

KarensRoom_MapEventHeader: ; 0x180e05
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $11, $4, 3, GROUP_BRUNOS_ROOM, MAP_BRUNOS_ROOM
	warp_def $11, $5, 4, GROUP_BRUNOS_ROOM, MAP_BRUNOS_ROOM
	warp_def $2, $4, 1, GROUP_LANCES_ROOM, MAP_LANCES_ROOM
	warp_def $2, $5, 2, GROUP_LANCES_ROOM, MAP_LANCES_ROOM

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event $1b, 11, 9, $6, $0, 255, 255, $80, 0, UnknownScript_0x180bee, $ffff
; 0x180e2c

