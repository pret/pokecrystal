Route43Gate_MapScriptHeader: ; 0x19abb8
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x19abc5, $0000
	dw UnknownScript_0x19abc9, $0000

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x19abca
; 0x19abc5

UnknownScript_0x19abc5: ; 0x19abc5
	priorityjump UnknownScript_0x19abda
	end
; 0x19abc9

UnknownScript_0x19abc9: ; 0x19abc9
	end
; 0x19abca

UnknownScript_0x19abca: ; 0x19abca
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0x19abd5
	domaptrigger GROUP_ROUTE_43, MAP_ROUTE_43, $0
	return
; 0x19abd5

UnknownScript_0x19abd5: ; 0x19abd5
	domaptrigger GROUP_ROUTE_43, MAP_ROUTE_43, $1
	return
; 0x19abda

UnknownScript_0x19abda: ; 0x19abda
	playmusic MUSIC_ROCKET_ENCOUNTER
	checkcode $9
	if_equal $0, UnknownScript_0x19abea
	if_equal $1, UnknownScript_0x19ac38
	dotrigger $1
	end
; 0x19abea

UnknownScript_0x19abea: ; 0x19abea
	applymovement $0, MovementData_0x19aca2
	showemote $0, $4, 15
	applymovement $4, MovementData_0x19acbb
	spriteface $3, UP
	showemote $0, $3, 15
	applymovement $3, MovementData_0x19aca4
	loadfont
	writetext UnknownText_0x19acd2
	keeptextopen
	checkmoney $0, 999
	if_equal $0, UnknownScript_0x19ac12
	jump UnknownScript_0x19ac1d
; 0x19ac12

UnknownScript_0x19ac12: ; 0x19ac12
	takemoney $0, 1000
	writetext UnknownText_0x19ad0a
	jump UnknownScript_0x19ac28
; 0x19ac1d

UnknownScript_0x19ac1d: ; 0x19ac1d
	takemoney $0, 1000
	writetext UnknownText_0x19ad20
	jump UnknownScript_0x19ac28
; 0x19ac28

UnknownScript_0x19ac28: ; 0x19ac28
	keeptextopen
	loadmovesprites
	applymovement $3, MovementData_0x19acaa
	applymovement $4, MovementData_0x19acc1
	dotrigger $1
	special RestartMapMusic
	end
; 0x19ac38

UnknownScript_0x19ac38: ; 0x19ac38
	showemote $0, $3, 15
	applymovement $3, MovementData_0x19acaf
	spriteface $4, DOWN
	showemote $0, $4, 15
	applymovement $4, MovementData_0x19acc7
	loadfont
	writetext UnknownText_0x19acd2
	keeptextopen
	checkmoney $0, 999
	if_equal $0, UnknownScript_0x19ac5c
	jump UnknownScript_0x19ac67
; 0x19ac5c

UnknownScript_0x19ac5c: ; 0x19ac5c
	takemoney $0, 1000
	writetext UnknownText_0x19ad0a
	jump UnknownScript_0x19ac72
; 0x19ac67

UnknownScript_0x19ac67: ; 0x19ac67
	takemoney $0, 1000
	writetext UnknownText_0x19ad20
	jump UnknownScript_0x19ac72
; 0x19ac72

UnknownScript_0x19ac72: ; 0x19ac72
	keeptextopen
	loadmovesprites
	applymovement $4, MovementData_0x19accd
	applymovement $3, MovementData_0x19acb5
	dotrigger $1
	special RestartMapMusic
	end
; 0x19ac82

RocketScript_0x19ac82: ; 0x19ac82
	jumptextfaceplayer UnknownText_0x19ad41
; 0x19ac85

OfficerScript_0x19ac85: ; 0x19ac85
	faceplayer
	loadfont
	checkevent EVENT_GOT_TM36_SLUDGE_BOMB
	iftrue UnknownScript_0x19ac9c
	writetext UnknownText_0x19ad9b
	keeptextopen
	verbosegiveitem TM_36, 1
	iffalse UnknownScript_0x19aca0
	setevent EVENT_GOT_TM36_SLUDGE_BOMB
	loadmovesprites
	end
; 0x19ac9c

UnknownScript_0x19ac9c: ; 0x19ac9c
	writetext UnknownText_0x19ae2d
	closetext
UnknownScript_0x19aca0: ; 0x19aca0
	loadmovesprites
	end
; 0x19aca2

MovementData_0x19aca2: ; 0x19aca2
	step_down
	step_end
; 0x19aca4

MovementData_0x19aca4: ; 0x19aca4
	big_step_up
	big_step_up
	big_step_right
	big_step_right
	turn_head_up
	step_end
; 0x19acaa

MovementData_0x19acaa: ; 0x19acaa
	big_step_left
	big_step_left
	big_step_down
	big_step_down
	step_end
; 0x19acaf

MovementData_0x19acaf: ; 0x19acaf
	big_step_down
	big_step_down
	big_step_right
	big_step_right
	turn_head_down
	step_end
; 0x19acb5

MovementData_0x19acb5: ; 0x19acb5
	big_step_left
	big_step_left
	big_step_up
	big_step_up
	turn_head_down
	step_end
; 0x19acbb

MovementData_0x19acbb: ; 0x19acbb
	big_step_up
	big_step_up
	big_step_left
	big_step_left
	turn_head_up
	step_end
; 0x19acc1

MovementData_0x19acc1: ; 0x19acc1
	big_step_right
	big_step_right
	big_step_down
	big_step_down
	turn_head_up
	step_end
; 0x19acc7

MovementData_0x19acc7: ; 0x19acc7
	big_step_down
	big_step_down
	big_step_left
	big_step_left
	turn_head_down
	step_end
; 0x19accd

MovementData_0x19accd: ; 0x19accd
	big_step_right
	big_step_right
	big_step_up
	big_step_up
	step_end
; 0x19acd2

UnknownText_0x19acd2: ; 0x19acd2
	text "Hold it there,"
	line "kiddo!"

	para "The toll is ¥1000"
	line "to go through."
	done
; 0x19ad0a

UnknownText_0x19ad0a: ; 0x19ad0a
	text "Thank you very"
	line "much!"
	done
; 0x19ad20

UnknownText_0x19ad20: ; 0x19ad20
	text "Then pay what you"
	line "have, please."
	done
; 0x19ad41

UnknownText_0x19ad41: ; 0x19ad41
	text "He-he-he. We're"
	line "making a bundle."

	para "Everyone wants to"
	line "see what's going"

	para "on up at LAKE OF"
	line "RAGE."
	done
; 0x19ad9b

UnknownText_0x19ad9b: ; 0x19ad9b
	text "I got chased from"
	line "my post by these"
	cont "thugs in black."

	para "They left this"
	line "behind."

	para "It makes me uncom-"
	line "fortable. Could"
	cont "you take it away?"
	done
; 0x19ae1b

UnknownText_0x19ae1b: ; 0x19ae1b
	text "<PLAYER> received"
	line "TM30."
	done
; 0x19ae2d

UnknownText_0x19ae2d: ; 0x19ae2d
	text "Use this gate to"
	line "avoid walking in"
	cont "the grass."
	done
; 0x19ae5b

Route43Gate_MapEventHeader: ; 0x19ae5b
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $0, $4, 4, GROUP_ROUTE_43, MAP_ROUTE_43
	warp_def $0, $5, 5, GROUP_ROUTE_43, MAP_ROUTE_43
	warp_def $7, $4, 3, GROUP_ROUTE_43, MAP_ROUTE_43
	warp_def $7, $5, 3, GROUP_ROUTE_43, MAP_ROUTE_43

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_OFFICER, 8, 4, $9, $0, 255, 255, $80, 0, OfficerScript_0x19ac85, $0735
	person_event SPRITE_ROCKET, 8, 6, $6, $0, 255, 255, $0, 0, RocketScript_0x19ac82, $06dc
	person_event SPRITE_ROCKET, 8, 11, $7, $0, 255, 255, $0, 0, RocketScript_0x19ac82, $06dc
; 0x19ae9c
