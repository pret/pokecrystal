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
	checkbit1 $0022
	iftrue UnknownScript_0x19abd5
	domaptrigger GROUP_ROUTE_43, MAP_ROUTE_43, $0
	return
; 0x19abd5

UnknownScript_0x19abd5: ; 0x19abd5
	domaptrigger GROUP_ROUTE_43, MAP_ROUTE_43, $1
	return
; 0x19abda

UnknownScript_0x19abda: ; 0x19abda
	playmusic $0039
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
	spriteface $3, $1
	showemote $0, $3, 15
	applymovement $3, MovementData_0x19aca4
	loadfont
	2writetext UnknownText_0x19acd2
	keeptextopen
	checkmoney $0, 999
	if_equal $0, UnknownScript_0x19ac12
	2jump UnknownScript_0x19ac1d
; 0x19ac12

UnknownScript_0x19ac12: ; 0x19ac12
	takemoney $0, 1000
	2writetext UnknownText_0x19ad0a
	2jump UnknownScript_0x19ac28
; 0x19ac1d

UnknownScript_0x19ac1d: ; 0x19ac1d
	takemoney $0, 1000
	2writetext UnknownText_0x19ad20
	2jump UnknownScript_0x19ac28
; 0x19ac28

UnknownScript_0x19ac28: ; 0x19ac28
	keeptextopen
	loadmovesprites
	applymovement $3, MovementData_0x19acaa
	applymovement $4, MovementData_0x19acc1
	dotrigger $1
	special $003d
	end
; 0x19ac38

UnknownScript_0x19ac38: ; 0x19ac38
	showemote $0, $3, 15
	applymovement $3, MovementData_0x19acaf
	spriteface $4, $0
	showemote $0, $4, 15
	applymovement $4, MovementData_0x19acc7
	loadfont
	2writetext UnknownText_0x19acd2
	keeptextopen
	checkmoney $0, 999
	if_equal $0, UnknownScript_0x19ac5c
	2jump UnknownScript_0x19ac67
; 0x19ac5c

UnknownScript_0x19ac5c: ; 0x19ac5c
	takemoney $0, 1000
	2writetext UnknownText_0x19ad0a
	2jump UnknownScript_0x19ac72
; 0x19ac67

UnknownScript_0x19ac67: ; 0x19ac67
	takemoney $0, 1000
	2writetext UnknownText_0x19ad20
	2jump UnknownScript_0x19ac72
; 0x19ac72

UnknownScript_0x19ac72: ; 0x19ac72
	keeptextopen
	loadmovesprites
	applymovement $4, MovementData_0x19accd
	applymovement $3, MovementData_0x19acb5
	dotrigger $1
	special $003d
	end
; 0x19ac82

UnknownScript_0x19ac82: ; 0x19ac82
	jumptextfaceplayer UnknownText_0x19ad41
; 0x19ac85

UnknownScript_0x19ac85: ; 0x19ac85
	faceplayer
	loadfont
	checkbit1 $0059
	iftrue UnknownScript_0x19ac9c
	2writetext UnknownText_0x19ad9b
	keeptextopen
	verbosegiveitem TM_36, 1
	iffalse UnknownScript_0x19aca0
	setbit1 $0059
	loadmovesprites
	end
; 0x19ac9c

UnknownScript_0x19ac9c: ; 0x19ac9c
	2writetext UnknownText_0x19ae2d
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
	db $0, "Hold it there,", $4f
	db "kiddo!", $51
	db "The toll is ¥1000", $4f
	db "to go through.", $57
; 0x19ad0a

UnknownText_0x19ad0a: ; 0x19ad0a
	db $0, "Thank you very", $4f
	db "much!", $57
; 0x19ad20

UnknownText_0x19ad20: ; 0x19ad20
	db $0, "Then pay what you", $4f
	db "have, please.", $57
; 0x19ad41

UnknownText_0x19ad41: ; 0x19ad41
	db $0, "He-he-he. We're", $4f
	db "making a bundle.", $51
	db "Everyone wants to", $4f
	db "see what's going", $51
	db "on up at LAKE OF", $4f
	db "RAGE.", $57
; 0x19ad9b

UnknownText_0x19ad9b: ; 0x19ad9b
	db $0, "I got chased from", $4f
	db "my post by these", $55
	db "thugs in black.", $51
	db "They left this", $4f
	db "behind.", $51
	db "It makes me uncom-", $4f
	db "fortable. Could", $55
	db "you take it away?", $57
; 0x19ae1b

UnknownText_0x19ae1b: ; 0x19ae1b
	db $0, $52, " received", $4f
	db "TM30.", $57
; 0x19ae2d

UnknownText_0x19ae2d: ; 0x19ae2d
	db $0, "Use this gate to", $4f
	db "avoid walking in", $55
	db "the grass.", $57
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
	person_event $43, 8, 4, $9, $0, 255, 255, $80, 0, UnknownScript_0x19ac85, $0735
	person_event $35, 8, 6, $6, $0, 255, 255, $0, 0, UnknownScript_0x19ac82, $06dc
	person_event $35, 8, 11, $7, $0, 255, 255, $0, 0, UnknownScript_0x19ac82, $06dc
; 0x19ae9c

