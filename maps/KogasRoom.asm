KogasRoom_MapScriptHeader: ; 0x18071b
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x180728, $0000
	dw UnknownScript_0x18072c, $0000

	; callback count
	db 1

	; callbacks

	dbw 1, UnknownScript_0x18072d
; 0x180728

UnknownScript_0x180728: ; 0x180728
	priorityjump UnknownScript_0x180742
	end
; 0x18072c

UnknownScript_0x18072c: ; 0x18072c
	end
; 0x18072d

UnknownScript_0x18072d: ; 0x18072d
	checkbit1 EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	iffalse UnknownScript_0x180737
	changeblock $4, $e, $2a
UnknownScript_0x180737: ; 0x180737
	checkbit1 EVENT_KOGAS_ROOM_EXIT_OPEN
	iffalse UnknownScript_0x180741
	changeblock $4, $2, $16
UnknownScript_0x180741: ; 0x180741
	return
; 0x180742

UnknownScript_0x180742: ; 0x180742
	applymovement $0, MovementData_0x18078e
	refreshscreen $86
	playsound $001b
	earthquake 80
	changeblock $4, $e, $2a
	reloadmappart
	loadmovesprites
	dotrigger $1
	setbit1 EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	waitbutton
	end
; 0x18075a

KogaScript_0x18075a: ; 0x18075a
	faceplayer
	loadfont
	checkbit1 $05b9
	iftrue UnknownScript_0x180788
	2writetext UnknownText_0x180793
	closetext
	loadmovesprites
	winlosstext UnknownText_0x1808a9, $0000
	loadtrainer KOGA, 1
	startbattle
	returnafterbattle
	setbit1 $05b9
	loadfont
	2writetext UnknownText_0x1808ca
	closetext
	loadmovesprites
	playsound $001f
	changeblock $4, $2, $16
	reloadmappart
	loadmovesprites
	setbit1 EVENT_KOGAS_ROOM_EXIT_OPEN
	waitbutton
	end
; 0x180788

UnknownScript_0x180788: ; 0x180788
	2writetext UnknownText_0x1808ca
	closetext
	loadmovesprites
	end
; 0x18078e

MovementData_0x18078e: ; 0x18078e
	step_up
	step_up
	step_up
	step_up
	step_end
; 0x180793

UnknownText_0x180793: ; 0x180793
	db $0, "Fwahahahaha!", $51
	db "I am KOGA of the", $4f
	db "ELITE FOUR.", $51
	db "I live in shadows,", $4f
	db "a ninja!", $51
	db "My intricate style", $4f
	db "will confound and", $55
	db "destroy you!", $51
	db "Confusion, sleep,", $4f
	db "poison…", $51
	db "Prepare to be the", $4f
	db "victim of my sin-", $55
	db "ister technique!", $51
	db "Fwahahahaha!", $51
	db "#MON is not", $4f
	db "merely about brute", $51
	db "force--you shall", $4f
	db "see soon enough!", $57
; 0x1808a9

UnknownText_0x1808a9: ; 0x1808a9
	db $0, "Ah!", $4f
	db "You have proven", $55
	db "your worth!", $57
; 0x1808ca

UnknownText_0x1808ca: ; 0x1808ca
	db $0, "I subjected you to", $4f
	db "everything I could", $55
	db "muster.", $51
	db "But my efforts", $4f
	db "failed. I must", $55
	db "hone my skills.", $51
	db "Go on to the next", $4f
	db "room, and put your", $55
	db "abilities to test!", $57
; 0x18095f

KogasRoom_MapEventHeader: ; 0x18095f
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $11, $4, 2, GROUP_WILLS_ROOM, MAP_WILLS_ROOM
	warp_def $11, $5, 3, GROUP_WILLS_ROOM, MAP_WILLS_ROOM
	warp_def $2, $4, 1, GROUP_BRUNOS_ROOM, MAP_BRUNOS_ROOM
	warp_def $2, $5, 2, GROUP_BRUNOS_ROOM, MAP_BRUNOS_ROOM

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_KOGA, 11, 9, $6, $0, 255, 255, $90, 0, KogaScript_0x18075a, $ffff
; 0x180986

